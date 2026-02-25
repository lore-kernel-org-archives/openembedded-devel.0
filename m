Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2019F4BB9E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 11:03:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42933.1772017391461067026
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 03:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=goZypu9O;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806bf39419so5261395e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 03:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017390; x=1772622190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fNpsxiZO5MpU7TnkuPeNEM7AgBOhFZ2ug6glcZ+c/n8=;
        b=goZypu9ORA+M/+zx2T01Z78QnkodGdjWnxmkjARDgBkUCK/IFVfoxAC8YijaLxONXT
         JlI4SUYAuMUQwj8678gX/WKxYfNwJM6Jo3QjJo4zFkQMt5Xm+rgT8liRBjl4f9qKnzMc
         jp6V/Dgim1lEEsICl8vf1eksTx69HtVQ4IYpsrq7WBANy3LxlKsBMGal/KVF/HbNRoe4
         b/CMDrrjj1ZS/k9Areb7s5nEjOjgjpHfqXEnn6KpSfRG37mk/eq9IWNqHW8XglSH6IwY
         PTy/uS1/XOChrio41htSh6tiPFldtHRUo9MZUIA2pxqqlzvapfafh0sp0mN9YbzFWbmI
         DeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017390; x=1772622190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNpsxiZO5MpU7TnkuPeNEM7AgBOhFZ2ug6glcZ+c/n8=;
        b=rHah8eCviBw1d54l/UlR/FkUmUI9rM8FbxpmzcdUPpzcpD0RyQVVBFEznyCyDIi4nB
         pph4vPoUfp0729LOnAW72DYZhQqExoMO3fcdKL+mEa1toCqVAI29HkG3tg+BvYYx9Gs3
         cF9ZbF2enrHjv3/uPB+5JRl2i6OF3zZ2XCTcyZQCdz3IwDjLLp7d2NjOOFdOBuA1tqOI
         nhOOaUlZxPDCOcFLhP8dP20DOC3otYZCK1Pidbg0knvpDpRxLpbpjL4dOMStADaeVQYb
         IvT6zwzxTQJnaHqQkihRPmniQd1fmmKuneh65dvmMIeqTO1fbBL562CRdiE/C6J4TqhH
         0abA==
X-Gm-Message-State: AOJu0YzclWAxP0j9XzIop2hPUW1rzk5293vRc26FfIxDN8oZKyuyKcp6
	gj+m8kq2o08nYb7+jxFtx1l7JN31Q892jGBEiYp2V5qIG9mG5h0dzU2jY73eOA==
X-Gm-Gg: ATEYQzz2czH0Pb+a1PIIJ3fycAYe1RqKv1zcbrp+s8/dJC0/VS3pjPugtETO6k+H8io
	kF09Xf16Vq0xllef8PZnVR5rOQorq/7EIp1x1hyu1nWmhDyGXnCNIG13ISNG1wglPnopQZrLJm7
	4ZYfV6Fwnh2mM9i0l3rCAbIJIB5zDRAj0ATb1nyQI9m/0OjtUvrwhhSSizYqy7VBnyxtMmycRhJ
	oQ/YrYbvyd2zYCIuNewIywa0891Ot4qK70Rrx9RnSrCGiqf2E18z2mYGyoJdUUUHRAcm+vmkhUW
	I+X2sQ52VqCSt79OvyWEGJgx0UDBLNfbjA+6BwS/1W38Xrcq2DdBzQ3XVqY+p5G5qxylSPN9QGN
	rzw8so9qEVDHu1rE3krr9BVf72Ro9m4UX45e+oMnXZV0BVf9vEsU18H2sJFe/BtUnWvG2R6BOFl
	nd7nBEeDQ+RrPcaLPAvC4IVBSp1qcV6Oc=
X-Received: by 2002:a05:600c:530c:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-483bd73637dmr56838765e9.7.1772017389359;
        Wed, 25 Feb 2026 03:03:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm32602805f8f.26.2026.02.25.03.03.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:03:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] README.md: fix typos
Date: Wed, 25 Feb 2026 12:03:08 +0100
Message-ID: <20260225110308.3606526-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 11:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124648

Correct a couple of typos in the various readme files.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 README.md                 | 2 +-
 meta-gnome/README.md      | 2 +-
 meta-initramfs/README.md  | 4 ++--
 meta-networking/README.md | 2 +-
 meta-perl/README.md       | 2 +-
 meta-xfce/README.md       | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/README.md b/README.md
index 7318f09cdb..9fc30bda95 100644
--- a/README.md
+++ b/README.md
@@ -2,6 +2,6 @@ Collection of layers for the OE-core universe
 
 Main layer maintainer: Khem Raj <raj.khem@gmail.com>
 
-This repository is a collection of layers to suppliment OE-Core
+This repository is a collection of layers to supplement OE-Core
 with additional packages, Each layer have designated maintainer
 Please see the respective READMEs in the layer subdirectories
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index 5513276dc0..6c23b4e671 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -10,7 +10,7 @@ branch: master
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
 
-When sending single patches, please using something like:
+When sending single patches, please use something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
 
 Layer maintainer: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index 119293a741..e074142be7 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -21,10 +21,10 @@ Maintenance
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs]' in the subject.
 
-When sending single patches, please using something like:
+When sending single patches, please use something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Interim layer maintainer: Khem Raj <raj.khem@gmail.com>
 
 
 License
diff --git a/meta-networking/README.md b/meta-networking/README.md
index ab2640618f..f8337b0c5b 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -3,7 +3,7 @@ meta-networking
 
 This layer is intended to be a central point for networking-related
 packages and configuration.  It should be useful directly on top of
-oe-core and compliments meta-openembedded.  It should be primarily useful
+oe-core and complements meta-openembedded.  It should be primarily useful
 to the following groups:
 
       - Anyone building a small networking device (eg. a home router /
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 13014b0ff3..9d56dbe8c6 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -75,7 +75,7 @@ Maintenance
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-perl]' in the subject.
 
-When sending single patches, please using something like:
+When sending single patches, please use something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
 
 Layer maintainers:
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 0d0077783e..564590ff39 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -15,7 +15,7 @@ BBMASK = "meta-xfce/recipes-multimedia"
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
-When sending single patches, please using something like:
+When sending single patches, please use something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
 
 Layer maintainer: Kai Kang <kai.kang@windriver.com>

