Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9D260268
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:40:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id m5so3158384qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pH9ScaH2uvtaaDFhPosv4HsLjh390q8bhLnoM74UcNs=;
	b=KWprDfJ0CO/TsbQHgAjiF3lRZ+vDr1T8ULRsSiMEThZUSVpWPDl2TY2zRK6QbMqaQF
	Xnb/OsKcd0SKtxV09fC+Z2rQxPJl1EsIIsEe9F1/Y58eVbXDegFmmcAXHMmJPHwGaCZz
	3QQqjtiXFbw8/AcQVRf9w3CD8jeCLFlSMM4jylGmX2NICbvzfJIfBrEIfUQi0MdDXr8N
	DuobWW1kr7IF0AI946zVsikkbRFHCIuqOLPmpVDMPkqxgkV/etFF3+J3aKnVUWW0CATI
	C4Uew5veqVkacxNZnFxT/isPy95yynFboC2i2tUccWQl+yzDzVL9R5v3QQtTCVi5/NTn
	jTkQ==
X-Gm-Message-State: AA6/9Rkrj63g5v1NIXZoXEg0LoBF1gY82h6xUMujXvpyGNI7DLsHcWoj3bKXW/W91vLLDw==
X-Received: by 10.237.37.162 with SMTP id x31mr8793551qtc.148.1476398414075;
	Thu, 13 Oct 2016 15:40:14 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	h126sm5949420qkd.18.2016.10.13.15.40.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:40:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:40:06 -0400
Message-Id: <1476398406-25385-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-rfc3987: update to version 1.3.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2016 22:40:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-rfc3987.inc                | 4 ++--
 .../python/{python-rfc3987_1.3.6.bb => python-rfc3987_1.3.7.bb}       | 0
 .../python/{python3-rfc3987_1.3.6.bb => python3-rfc3987_1.3.7.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-rfc3987_1.3.6.bb => python-rfc3987_1.3.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-rfc3987_1.3.6.bb => python3-rfc3987_1.3.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-rfc3987.inc b/meta-python/recipes-devtools/python/python-rfc3987.inc
index fbf6a0a..4615904 100644
--- a/meta-python/recipes-devtools/python/python-rfc3987.inc
+++ b/meta-python/recipes-devtools/python/python-rfc3987.inc
@@ -2,7 +2,7 @@ SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
 
-SRC_URI[md5sum] = "da7dabf5ee0b1426a2c6c4f8406ee0d3"
-SRC_URI[sha256sum] = "599801156e35b5054138585c92ab4d1b729b0f2feeb961b65347116764df4aa7"
+SRC_URI[md5sum] = "aa108c7590902fe609c036864ecb7f84"
+SRC_URI[sha256sum] = "91a7826b0a26c246a5a91bef09c2c0809c713a689be689b9571e78a13f6557a4"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-rfc3987_1.3.6.bb b/meta-python/recipes-devtools/python/python-rfc3987_1.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-rfc3987_1.3.6.bb
rename to meta-python/recipes-devtools/python/python-rfc3987_1.3.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.6.bb b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-rfc3987_1.3.6.bb
rename to meta-python/recipes-devtools/python/python3-rfc3987_1.3.7.bb
-- 
2.7.4


