Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1F6CF31BA
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 19:58:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.3615.1727899110114435368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Oct 2024 12:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=e+71O7Dc;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so1088995e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727899108; x=1728503908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7eBdLLwqM6h53k8yll87/xB1QCCSdKJoghHezMBC0x0=;
        b=e+71O7DcmLMfl3mGLv7E7r+LanRI01Wyk6PJ3ZhrEh4K8SDvn1X1R197huYbzxBc57
         dbqPALHz8E+CRlltSP8+VaiDRtM1AsPaLWVLFoGr2wTFwgBNKvzw1NiJ9BgDZFSAA4er
         0LqzT9JMrPBdh4P5lpCdeWLeW+cEYIDPVJlVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899108; x=1728503908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eBdLLwqM6h53k8yll87/xB1QCCSdKJoghHezMBC0x0=;
        b=qI2kSolTHv/2TxAe5xKlRRhwgyi3E8KNQbwdnfVGJdSCae4Wto0DUvQe5C3vYsNk0o
         HZBAJ6QnkaAGQsyJd5O2lYnF+g7oDNclyE+C336fk+ayue4VgSJNeZG+qncUgedstP4Y
         581WRpCYzRwG9ZZq5WjMbyeCuM5xoyqnLHyxI8VMPQObsR7qhCfwLfMavxrRb+uIOL08
         Fix8K82VelQRjo92guXHJDBhSJu9XtFbtbqFMoTFNKX8WPZX7mIWZDXXUMq1taijBwlG
         VwFrb9i1+64Dq/ZL7y6AZvWFO8nUjcVJdHPgExMA+nLgBKinjYuxk0XwZLd7wbzv+Xua
         QR8Q==
X-Gm-Message-State: AOJu0YwpcignyEj/2UxF02g7t5rs3c8zgpuw5gdWHdUuotP0TMXqoXsx
	9I3y/v5LQvMewRb5gRCe65wF4DnvyY1ko+6nlpBfQ20NnUD32uGshSjdjhzEywQjdgwPLsJvCLr
	r
X-Google-Smtp-Source: AGHT+IHPZX6X43PDBeOHLnh1FN0Ed/BI4v2DuvPIo/2prvkn9Nw3ngVzkDa4PA2YdXcxV51a972X/g==
X-Received: by 2002:a05:600c:4e86:b0:428:1965:450d with SMTP id 5b1f17b1804b1-42f777c27e4mr32741645e9.17.1727899108005;
        Wed, 02 Oct 2024 12:58:28 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d41dsm14662091f8f.17.2024.10.02.12.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 12:58:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-multimedia][PATCH] minidlna: fix reproducibility
Date: Wed,  2 Oct 2024 21:57:18 +0200
Message-Id: <20241002195718.2100890-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Oct 2024 19:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112643

From: Yoann Congal <yoann.congal@smile.fr>

Minidlna configuration puts os name & version in the binary which lead
to non-reproducibility. Fix this by forcing those variables to constant
values.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 8c9ead1489..170e676b24 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -21,6 +21,10 @@ S = "${WORKDIR}/git"
 # configure.ac:30: error: required file './ABOUT-NLS' not found
 EXTRA_AUTORECONF = ""
 
+# Reproducibility: force os-name and os-version to constants to avoid host
+# related build differences
+EXTRA_OECONF = "--with-os-name='${DISTRO_NAME}' --with-os-version=''"
+
 do_install:append(){
     install -d ${D}${sysconfdir}
     install -m 0755 minidlna.conf ${D}${sysconfdir}

