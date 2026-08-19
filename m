Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E17C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.838.1787117841763667650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FPjaDfrf;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38511175ad3so676093a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117841; x=1787722641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFyMlD64LTrYhZL3FVGQsEFwrAbLvCjRynMrjyQQiTI=;
        b=FPjaDfrf8n13dWkBIsoTebSXsTAS2Yj5b9uDrPzAftDfcSI0EyrpRLqm5kKkm1BJXE
         VFP2rLt1VsNB8LcfDi2IAUIncPUiv/EbuD/qOknpzyaxBnMwX4p2K7Mjav9FV/dvGQHO
         uEhpWDwiNd3xzZuDysXOJEsfPh8Gwcn8sbui1iKC4r3dFcw/0c8KPZ/xnE2cORVxYH0j
         hSCA/RLDHON/j977kT2WsI8tp6v2fL9lZI30qB7HsIeO1yyK/nRdR7A22aIs+5199rO9
         OB/RGj22NdzVIf4CWVU7Hj9mUSyXvprJQ6JEjQAcWterZZME5fiiAAesSglxBXUp0Opj
         9Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117841; x=1787722641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFyMlD64LTrYhZL3FVGQsEFwrAbLvCjRynMrjyQQiTI=;
        b=SVyH0cJ+LZAhrXtZYwf1azG6o5DGLKmHUuZPI/fuIviWfGkJ8dwPmZkPrTCyo2maXr
         HwxTFYj52Cy1N7w0BKETPrMhPINI/5VUyz+0xWL/nJ+eTfO+lIcZy80dOOlKpKjOagZN
         nW6YL/5d27DwmrnFS2NckrO8CUCGFkIIW9I+nG/q9kNxz26MHCMaHsinxPMW4DF4yttp
         1HXuyNG5aK59/tKbjRzLacPzcaq+DN8wuWDCh9Nu1UC1Ii0tOUCqyMD9AiNaZphl9Yof
         QjVMOfNgsLj/cdjgLy4TGl0J4VuRrwR3XByV9LHQxQO/hBaroInW5pDQePKqUgUYUIA/
         4kAw==
X-Gm-Message-State: AOJu0Yxcek057eaimXPP0sDEdJoEvwzKE/0JYn8OVYRWrt48c9LeU6wg
	L4QLQR+U4gvjTl0SaJCwx0hSEEr4+DudciGgf+YSMRAUoOOnTU+qBxiZe7AO+w==
X-Gm-Gg: AR+sD13ndY5frD4zFyOpr++PIt2vSljXZl8BYLBoYHRmzRhLG7L2wmL0K0j/nYH7zcv
	klSDwlcvWlQ0i2QXbeLJ98UjI+39KRt7/Ogxfi6m6WhyHTd8GgoVUP7KJUdscrvSoju8z1qE/KH
	F23XatZBJ8w274Tap/mCdlNTbFH+nI1QnscxrFnLFLMwmj32SW+X/ZY+5PQyyr+sdhwkxn+PSTd
	0ERw6G345WDjhhGs4wRQzdquddbx17/HwND3z8vEgnxTpMM+Hh/4ZnGZ879rSvOcwLkyP5S0Nw5
	tAliNyhyyrUi/OMjmWLUWFeoM7YkiO920r0I3NzAWoJTxk8zBrBLMUZnJ4dUMwhd/i9yggrQrl9
	8M6713qZU6k1TbXZk8eVQd4kIW89njqQllApY5DoxFbgpsxKf5W0nS7hVrlaZINkOjbkyOELzPX
	ZpObEp1LVkbCZmzA3jDWqqd62dWvNJLeo+bK6FVwqRELGoGoDH/wHH5ZQvf8xT3ekS+0NKB7FVh
	g==
X-Received: by 2002:a17:90b:3b41:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3958049908amr4188218a91.0.1787117840994;
        Tue, 18 Aug 2026 22:37:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 18/25] thingsboard-gateway: upgrade 3.8.3 -> 3.8.4
Date: Wed, 19 Aug 2026 17:36:22 +1200
Message-ID: <20260819053629.391864-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129262

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/thingsboard/thingsboard-gateway/releases/tag/3.8.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hingsboard-gateway_3.8.3.bb => thingsboard-gateway_3.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.8.3.bb => thingsboard-gateway_3.8.4.bb} (98%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.3.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.4.bb
similarity index 98%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.3.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.4.bb
index 806d9d24e0..52a4518275 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.3.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRCREV = "7f7e0bf061bf92c2feb12b5098620f118dce364b"
+SRCREV = "a735a2d654a218c007b5db7759ceed44794253f9"
 PYPI_SRC_URI = "git://github.com/thingsboard/${BPN};protocol=https;branch=master;tag=${PV}"
 PYPI_PACKAGE = "thingsboard-gateway"
 

