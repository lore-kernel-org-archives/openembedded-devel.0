Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id E204E61115
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:47:47 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id p8so10226934oth.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ia6o2D+XSrtlreDXh6J4gULfo4bq7XVUVq5ULrN8xkI=;
	b=sP9AErsK6QuAauoUBNXfmaki2rSNXMOSXJ66t/Qn6WB3gkI3q3Q33G2YbDPp4GZMGO
	EI2Cj2rkzhj9laX8CyApla19UUPHOiqjE6GLP/1WxuAj/N00IaHVrW7JpJHB/ev3tEOX
	ewne/b9bgQA162kGhET78ITjEmEYAgcXIS3rh3/DtSnmAGnWWlDSs3GJ2iYwylokVrrN
	Xr4UGoamd06K6TkiWl/K0/uUOHC5T7YWkCHgYYOUj0SyfbM6E9tIplUdtTPDIrkKHdFU
	GRYOn+DxljVkwNl94d1T0lxYgys3FRIoqq76agH+iZ6sAf4diCVusvjHugZ9g+almhsU
	zxvQ==
X-Gm-Message-State: APjAAAWVsgb73HZIUSN5SKGt4XAckLIvCHffzTcG5es0SQ2jTuC6Xf5f
	JbOib2RnY9f2LkvoF23ub5kKYoR0GS0=
X-Google-Smtp-Source: APXvYqyZp/WlBlqKqrGqYTvAKlmwIccWYDNtuVGtR4xXm8FXp7kFH+8uNIdyOX9CPgADMEBNRZPKzQ==
X-Received: by 2002:a9d:d0b:: with SMTP id 11mr3692175oti.287.1581709668541;
	Fri, 14 Feb 2020 11:47:48 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	x15sm2295481otq.30.2020.02.14.11.47.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 11:47:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 14:47:39 -0500
Message-Id: <20200214194739.727-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-cachetools: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 19:47:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-cachetools.inc               | 16 ----------------
 .../python/python3-cachetools_4.0.0.bb         | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cachetools.inc

diff --git a/meta-python/recipes-devtools/python/python-cachetools.inc b/meta-python/recipes-devtools/python/python-cachetools.inc
deleted file mode 100644
index f3d3bc6bc5..0000000000
--- a/meta-python/recipes-devtools/python/python-cachetools.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Extensible memoizing collections and decorators"
-HOMEPAGE = "https://github.com/tkem/cachetools"
-DESCRIPTION = "This module provides various memoizing \
-collections and decorators, including variants of the \
-Python 3 Standard Library @lru_cache function decorator."
-SECTION = "devel/python"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27f7518eb6f7dc686d0f953b2f28dae5"
-
-inherit pypi
-
-SRC_URI[md5sum] = "6a88df13467e80eb61dd2bedad19b83c"
-SRC_URI[sha256sum] = "9a52dd97a85f257f4e4127f15818e71a0c7899f121b34591fcc1173ea79a0198"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb
index 76b2f6785c..50d0f25739 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-cachetools.inc
+SUMMARY = "Extensible memoizing collections and decorators"
+HOMEPAGE = "https://github.com/tkem/cachetools"
+DESCRIPTION = "This module provides various memoizing \
+collections and decorators, including variants of the \
+Python 3 Standard Library @lru_cache function decorator."
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27f7518eb6f7dc686d0f953b2f28dae5"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "6a88df13467e80eb61dd2bedad19b83c"
+SRC_URI[sha256sum] = "9a52dd97a85f257f4e4127f15818e71a0c7899f121b34591fcc1173ea79a0198"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


