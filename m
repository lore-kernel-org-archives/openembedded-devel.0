Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3FFD35E44
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.27719.1730831889112064357
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dX/VYANx;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e377e4aea3so48136397b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831888; x=1731436688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/XziagaPUqwxsd5knpP2lHDs8MxjOOStqkIBiktamI=;
        b=dX/VYANxf1lOLUKwu1brKV4AMTyjmzZBG0p0JDpnTQRHTq1uD+2mgHOcT5wQlOCsCI
         GzZWYIGSEvo1rogw/Dz9Y0smy5Tg61MsEex1LtKlLuMb453Yf1Y46sSiexrQ6g8fSlqI
         8sPNI7rfomp48yzMG7YQ4S068pySc3MEeJYsq1AqB2DtQXMjbKFPTLQZdxlOthNnv2hz
         a9qjxPKF52dbpmfkUI6jUuLNbf/kTSDkNrm2fvx3dox1y+mfAsD1xUeyjIH0XYF5nN6i
         hBNE7UkGUaR4L9ihrij6xYRdL0gTByd5XHHzQ/gccC6BPvz9Ga7EiN/G4f+vWdE4OpLn
         8GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831888; x=1731436688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/XziagaPUqwxsd5knpP2lHDs8MxjOOStqkIBiktamI=;
        b=BL2N+mJnvqomp4wL2Rt/FV4s0m1p5d6LSgHccz8Ry4vNPrU4A5J4aRNhcNBT7SvZuC
         GOGdnUCfMf1T2C9R2ZSD4Lp2QBtlYWQziZIwBRFmF1+ZhJ4TDeh3oQs+AgbcTv+Co3nt
         OeIxwsks52GHzt8gbN6XNf4M0JD0sr4BEOA2o1uX4seud0eIkGTaMv2X4FMnGMaovkQr
         FJhfMXisspuufZyVXqo1GWHyOYYUW2f1l3hjSikxCvgoK1kdk6fAmKEc9LR/edUsktw8
         //jarLCQUi6qmHAvPNm4WTSdTOpINSrou4YPptiZxIVPdSvxgjjr/Cil3q56jtC8Lqkx
         CKmQ==
X-Gm-Message-State: AOJu0YwhuDcS/67r8vsu4o6f+7cMY2ZsNGgNlXpWkVBtDIpKtaCDnnF2
	hzOT7JZp0KrruDKOxK5o+NKUdAYwJkWxJdaXLAPmLiExjHUtyuIAin8IR2gG
X-Google-Smtp-Source: AGHT+IHrHgXfQ7e4N3sdd2USW7PdQlXONw7x0yQY/jXTX497ypFJg0HoBVi2Zfvzls//vHHFG+4MkA==
X-Received: by 2002:a05:690c:62c9:b0:6e3:323f:d8fb with SMTP id 00721157ae682-6ea64af0d2amr177828107b3.14.1730831887750;
        Tue, 05 Nov 2024 10:38:07 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:07 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 013/161] pcmciautils: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:49 -0500
Message-ID: <20241105183658.34982-15-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113528

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 2a736716d..0bdd8042f 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -15,7 +15,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz \
            file://lex_sys_types.patch \
 "
 
-SRC_URI[md5sum] = "885431c3cefb76ffdad8cb985134e996"
 SRC_URI[sha256sum] = "57c27be8f04ef4d535bcfa988567316cc57659fe69068327486dab53791e6558"
 
 inherit pkgconfig
-- 
2.43.0


