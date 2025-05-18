Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3A6C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 19:17:27 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.35929.1747595841128638675
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 12:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=JqYd1pr2;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.128.68, mailfrom: dimitris@siganos.org)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so40225805e9.3
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1747595839; x=1748200639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXg9sO2J2PpGD19LKIPbzaC5YUlFKRIC0jceUukRosE=;
        b=JqYd1pr2MI35GEyQpI7v78S3nbSVFZnxl7/Dru/xBb5MS6VwB+ndb03uLMwFHjp1kh
         givdyZ0pkM6jZkTqLbEswKtnNtl6meBLVlLLIhY78OgpCsiNxQMf+OwTc/Fvlpe1PTVn
         HNowD+fx4H8aBOQYdrlynwd2UZ+S/4xDv5gkXPyh7VcLS7+L0C9l90I/KHf0V7DiWc5P
         YUMiZ+gTxm/oIIIG9/YGtd0kaq8opNZ4PofTMsvWt9TU3vWQXFrgH3kNl3Qp5HOVHsOl
         z1h3hVi5L+9BfLo1s+FCWpmXqyi7DL5lACU9CHxWzeeBrtnUW/i7V+jCjliuiMxNGU7p
         Lrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747595839; x=1748200639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXg9sO2J2PpGD19LKIPbzaC5YUlFKRIC0jceUukRosE=;
        b=tAAAAK+ScKlMNQ3+XRSdjyZG1tnF89DwqvQC2IATfHucrZ2isjq3FYGg5eas0JFoRm
         sbt50iymteqaiJjf7E3N86Bi6r20gcyHaDff6Gmw+NugwcKVJ4TQ9kH+PXNbwaM7R8r9
         8HcQZoqcSXfZSNlH0Y21AoN5cQ+bgEhGBuHT/FOGuaMj3iTpDwvlIWhhG7OyzaOtdi8K
         r0bUjH7G70F9NYj39Oo6w4I9tevq7hiEEAD9LUokBNWH+X6LUL/mLirRItYWScxV2aft
         M0fplrdpaAxYrwOM/hUlXFYD9U/mlyI91vf8Xt8VDcsTCMMvzp367ctVN8gDS21fgfXK
         76fQ==
X-Gm-Message-State: AOJu0Yyrf1rBAGaW8E/9JpFFRLPqn75xDREBvtNI6SI9LwJ9cYNpjTSj
	mlhr0i+4Uy+xF6XvWdL/074HdoieIskKfQbL+Q1EGRp4q1WW7Skj5zSGBMRLvoAOX3xuovGdGyc
	XDL+8/oecUGJ5
X-Gm-Gg: ASbGnctiReaSQCJ1OltfsicgY5P7wxTJMoGvc0IFTGpTdVf6FnWPXRirlDalUG9xlGU
	7GeURrry26MrImFtB/FpioAG58IM6cEGYK08Ce5MFpCq4SVH9HTB1k/q/Lz3LFYAD3I8IqDQdP+
	gEyvK4m79P5QOVOkLb7jLeWQsOd3Qzu73vxHEA0NDgQAhrN+MytB2rha3nlJceBpcC+AVE4RV6e
	Wo/lIGMRULCZnzv+Iudehmvf9YJy/I+iaIC4SNAEV5dWv+RCdpZS/FExxR3Hl0taA0jeQa7RcLu
	ATXqeyzHCowjtNw1gHDqxikhD0CsybXXvTf8TwtTZHluFd1E/Nq1t9CG4bzM0mO/qTTeOoayujD
	BVm4sf2pcpJWgZWYVbqw5
X-Google-Smtp-Source: AGHT+IG9gCxg5TgFGu33oVC9lnBVaz3v95G//+NXvVtxrTzK/AT9XsosS3XSKGUnJgwJ2AGMEDsOPQ==
X-Received: by 2002:a05:600c:1d8c:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-445917d2a0amr18813475e9.24.1747595838835;
        Sun, 18 May 2025 12:17:18 -0700 (PDT)
Received: from tux.. (cpc79031-cbly7-2-0-cust13.6-2.cable.virginm.net. [82.14.108.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85a3b1sm130773585e9.0.2025.05.18.12.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 12:17:18 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: Openembedded-devel@lists.openembedded.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Subject: [PATCH] bvi: add new package
Date: Sun, 18 May 2025 20:17:13 +0100
Message-Id: <20250518191713.227603-1-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 19:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117460

bvi is a visual editor for binary files

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
new file mode 100644
index 0000000000..e6da1efd41
--- /dev/null
+++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Binary VI editor"
+DESCRIPTION = "bvi is a visual editor for binary files."
+HOMEPAGE = "https://sourceforge.net/projects/bvi"
+SECTION = "console/utils"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
+SRC_URI[sha256sum] = "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
+
+DEPENDS += "ncurses"
+
+inherit pkgconfig autotools
+
+# build inside the source tree, bvi does not support out of tree building
+B = "${S}"
+
+EXTRA_OECONF += "\
+    --build=${BUILD_SYS} \
+    --host=${TARGET_SYS} \
+"
-- 
2.34.1


