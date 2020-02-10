Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE0B60EE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:41:05 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id q81so7679395oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/DMpWSDFhMLU8p89KRA55HS+gnUMDvnrY5FrQvO9pBA=;
	b=SjeuyoObgqrmDCxBwaIQX5+pHvmI10oHIWyvRdvIt4876mBdtZTI7LIK5tGnklTo8J
	YPnj5ZcrVYZyqojWAa0ukYoS3hHESHhTBT9hWlgLNcrZXArpK7Ny9X3NPQ97KgrAKKgZ
	L930im+Jm5xdP9TxBZRl0oJDkiZDSf2P3yF7GyxcvWlozC862fP8PPdn1uahpclHMSVU
	+xxVeTqLpCEoif/5QbFkjBhjq5lt5MtDt41XL4Dqs4haLyIolIqPvzNKDDJ01r6+7oxI
	keW9NtpHQIP0rEWq39HhoXvZbz3nAeUXpyTMUjBsA7iU6uNufFEClx8Gp7NxYXXCx4Ik
	SUrQ==
X-Gm-Message-State: APjAAAUXPxYPRfj2oGogIwdzgLbr/8bmlzIxRUr7OCRvk4oL2sTp/y18
	aP9+PZ6jjxSyHOyZMWJM+Gk+PllMduk=
X-Google-Smtp-Source: APXvYqxAkD/Z/CxChEoPB0mDkeckGcrWGUKRd2on7rPuL4tf6OsgIeklUuCnOpZ9kj0YN6MjQHMYow==
X-Received: by 2002:aca:ebcb:: with SMTP id j194mr9256653oih.154.1581295266139;
	Sun, 09 Feb 2020 16:41:06 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id z17sm3466172oib.3.2020.02.09.16.41.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:41:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:40:54 -0500
Message-Id: <20200210004054.12771-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-attrs: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:41:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-attrs.inc   | 16 ----------------
 .../python/python3-attrs_19.3.0.bb             | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-attrs.inc

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
deleted file mode 100644
index 35d28a44d0..0000000000
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Classes Without Boilerplate"
-HOMEPAGE = "http://www.attrs.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
-
-SRC_URI[sha256sum] = "f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72"
-SRC_URI[md5sum] = "5b2db50fcc31be34d32798183c9bd062"
-
-inherit pypi
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
index c34693f506..b3739fda8c 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-attrs.inc
+DESCRIPTION = "Classes Without Boilerplate"
+HOMEPAGE = "http://www.attrs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
+
+SRC_URI[sha256sum] = "f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72"
+SRC_URI[md5sum] = "5b2db50fcc31be34d32798183c9bd062"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


