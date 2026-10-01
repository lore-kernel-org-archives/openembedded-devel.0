Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25520CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:06:50 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7527.1790849205062422788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T/2oUKB4;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffcso29998725ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849204; x=1791454004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwcWhHh5fXl6LtorPuhSaod6vgLR+egrlNVpYnT+ldQ=;
        b=T/2oUKB4kmVoVAOuKPmqyaIaEDwuLN2QhzVASxGrPFMJy7KFEj+Lq7J3+FIB0KrboY
         uqMC1CNCuJggVLaZHfH5cxQJDBtR2g07NlEVpP0IxdqOJXyuZgL16IevMEzcww9g3cZK
         NyEikAL3oDAPYqTQ6viOqpwjfONOc11DgVhcrpPqcknV2+wXXvr/yWVCKzUoF8rFBiVp
         gQUmf0p2hXTsgNAeqmWBs44VbRxem0bJ/r8ASrLK54Ke+TDNLyFtnh84cLWdzug/HXFs
         Gv733MUnypJSF5afJswF4/RFGW4YXhWeSOsbRDECXz04U325fQsoWHACu9dgtpvpYeyC
         hJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849204; x=1791454004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwcWhHh5fXl6LtorPuhSaod6vgLR+egrlNVpYnT+ldQ=;
        b=bZX9yPqscoOcKSEiX/0lJVpdmX8SZe1b0xIVcQL1JK/2C9CnQgTVKJFrnbxmffxHLe
         ailTWinmZxZe8BrdqSzW2TLapWp8VbFbDaoWedoNzTozBI00iMWD1WA4fzbQDR6IUn2m
         WF2+zn5V0lz+OzD1nOzQXTDtgTJlsmf+FIAyvDdSlP3Ul3fVySFZoVVebpNLdQ2QzN7D
         wKIy1EjJ4fA+DZXtochzFe6daN6z6Hu32ruNrjlCLxw510EamaVE3lTDGDj7mfotpCHR
         lcD22fd3WsIvzVod+IJ2gH/tmOUZbJYWydbAcF6a4A65hEtmj6EXn+JZ6oOkOWya8tYP
         Qodg==
X-Gm-Message-State: AFq9FYIBDBequSvlFrNTmDzYuxHXxO4Bs/pQPrUb4yR0jmtXfncJWiRR
	P3Ccs6H7lrgVTns03hWnMb6vXaVbLQJglLMO05p/L48caQn+0QfncFzOwv5fcw==
X-Gm-Gg: AYBFou3eOOAuMZbMAKypdiLqytFrStb6Zp1SDz6b9FRplmcW8VDFU6I3GhjGfjr9yEl
	UeFgUa9d0u0kny7RAr1jqeyUVhGGpT7xJp+R5BiioW/HMlYZVGa0EKTzf/BLJfcFFq3+r4FYpJH
	BsZEbwpKEBs7dOpWtqXmIWKzHEVBQL0+NbXdZ/V0Px9cTUH5+EoQXan5JwyKP8sXaK3UnetQzAX
	5hMChnNFuh35aCXTjCIPfZ61XhwOz2Kev5TRyQftSWZETDkdQOqsUR4OfPUSfv+d3jmqzM5uW22
	zt+4hM0hj1ZAUDjzccegESiAKUTdS4soc5U8XWm4E72hKGCZf3nAWcnWOltWHQMBnr22xDcMi8n
	wSS7tYnwjoy7XdhweGozJzLnTVWdpuvueOAaLpRJQGvFuSkq96AfiDLn89tr9cMwRIKIc28nb+r
	X/9k4ZBijvMTd7rYjSGsQxXxT4JIJGb686wjL9LVNUYycdGoUDY68I9VyAXmXu4Rl8Wz1lR4KsH
	v4GbZpYQONdvQuLK3nG9DE=
X-Received: by 2002:a17:903:1ab0:b0:2df:9d04:403b with SMTP id d9443c01a7336-2e2e4b2b85fmr35194355ad.32.1790849204370;
        Thu, 01 Oct 2026 03:06:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/11] liblognorm: upgrade 2.1.0 -> 2.1.1
Date: Thu,  1 Oct 2026 23:06:25 +1300
Message-ID: <20261001100634.1992725-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130568

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/rsyslog/liblognorm/releases/tag/v2.1.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../liblognorm/{liblognorm_2.1.0.bb => liblognorm_2.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.1.0.bb => liblognorm_2.1.1.bb} (94%)

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.1.0.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.1.1.bb
similarity index 94%
rename from meta-oe/recipes-extended/liblognorm/liblognorm_2.1.0.bb
rename to meta-oe/recipes-extended/liblognorm/liblognorm_2.1.1.bb
index 050916330b..f074832b0f 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.1.0.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ca016db57e008528dace002188c73dad"
 DEPENDS = "libfastjson libestr"
 
 SRC_URI = "git://github.com/rsyslog/liblognorm;branch=stable;protocol=https;tag=v${PV}"
-SRCREV = "71dcbaf806a0e464aded2efb98651ff89aec8a36"
+SRCREV = "88bd8d1817def038c540df310403b44ab8121ef7"
 
 inherit autotools pkgconfig
 

