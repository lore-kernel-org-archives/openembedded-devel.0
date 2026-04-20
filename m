Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7F9F588E8
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22602.1776700164566075619
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tCWQpSRq;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso5282435e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700163; x=1777304963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE7VVZJORVDqFA71dV+EnG3lVeV+A9lImOaDJ/oJsl4=;
        b=tCWQpSRqJMYVLJ7neN9jjLCmTBDIFF7+i9h0u9jlhN6HupeY9At03+Ogxxh7q/h3He
         XCViB7bUpzsijU75/8kCQetNIx1HivF29S0OZ5z2tKhaHaXNOuyf40gqv9mZzeqKr0fr
         Af+mw0db6iwqQlhiSA2PZByegIHlowQugkAEf74S8ZBlPSauNrgyQzgEyXc6oUfpep+C
         g2z0go/sxDeYNfkN0SDktYZ4OXerHdTOj5lSihj2ueWdoFhjIAdrXDHUWSrTeCc68X/4
         afHkkmfshcTrlK9TbCEvM2DiQRjIoecTQbjK+rbzgbKL/5k9IAFkeVhUgm3Vo6ROCi/u
         7qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700163; x=1777304963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JE7VVZJORVDqFA71dV+EnG3lVeV+A9lImOaDJ/oJsl4=;
        b=F4Vfkwqv5DRdJaIBTQ7L3Z+tBfP9EyHF66GE75Ak6FcmIrdgomx1PrHkFuyveaF5QH
         fr0pCLLKB+TmLcTGc1qWrKE5kU5zRNL9gukfR76H5sLAOKPvkhO8V8zM2c/UB01i8DTr
         6N+X7pcsleJuA/taRcLXttIsJyNgYJ6wTh+iDFQ1Bw9T8GtYwhssVbAXeWRoxJVgn+u+
         ihtljXbFzArIZSl9sa/B+P+6tybBGjdmAJ0yy4VO6Qw9OR9qxvenfrXKxU9UMz6zHUCS
         HF3yCi6n0Q/SbxwImQ23DcyQB7/ll/EGQn/mF8/sL+CFeM+0WJs3QVGQON/JpP7Gi3tM
         A+jA==
X-Gm-Message-State: AOJu0Yz++7ci9VIF9uDjN1/eGyBrY6i8cf58V8tur6OOnNB6+cRjY3D8
	e7UiJorcu5+xyvMlyTUyix+ns6iVKEBeiA6VrqFvz9CLnPwAxuTBZ4pbaazJfg==
X-Gm-Gg: AeBDietuBIlr3e/uLk4KhiM5ShbS3eQUzcrtq1O7damWm63EnPl2izQo+9lBOmvP82M
	oAaKWsTeFZQGi5hjcNJTM4Wi2V5yEG4MWItILWrszResnEdXdXBHdK+EQcP7wnZ2dod7tNm4d+/
	9QkXHIFKdAP8DHCgkWDORV3/DEjwbvIhSagMJLkLWbwneCEJ1NlBIz9nIsj01AuO+B9bxE4i0gB
	Di+BFpIo8xm5adAr/dB60ZqODKU/IyHY8+2OsUVj3WUCnIh/N/63E4XoL053Hj3rQ6c/nfN+1Ha
	2q+gXMAM0asIFiF7WAyJU23GpX3ZnC5Snm0lHbisDmhF8iOtE0Fqi/5lNAbMi6/8jTRLAdgUkVc
	8vSznsAFK2DWN04Kn1yOcs6u30BjkowtG8fOL5Aj285FWb7C3O6peVSH6gxySgYhwPTYCUtXppP
	D7Q5T9+Ht+IfUSe+z7j2+nccNW2nkyjGY=
X-Received: by 2002:a05:600c:a31a:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-488fb778db4mr147043165e9.17.1776700162824;
        Mon, 20 Apr 2026 08:49:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/12] sblim-sfcc: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:11 +0200
Message-ID: <20260420154915.952359-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126511

The previous one stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index df55a67996..db01d7cbe4 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small Footprint CIM Client Library"
 DESCRIPTION = "Small Footprint CIM Client Library Runtime Libraries"
 HOMEPAGE = "http://www.sblim.org"
 
-SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-cimxml-Include-sys-select.h-for-fd_set.patch \
            "
 

