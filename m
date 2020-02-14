Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 219BA6113D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:53:55 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id g64so10084079otb.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 10:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g1Gx1giix8ummnhattablZ759hi+1gBP0RlLmbk2xRg=;
	b=kGE/6yZju6lubpgahEVRazdlWNBRMukI29E5DZWGikz9YUvYEU8OAQdnKANNC9nGrq
	p2BCexEmKlnHWLPhZohgkoGRD1EmeLRjk6U0vv1A/+b/yibWG5fMAPZfsUmb/N2YR6UT
	IrnJ1N0XEoBjDWWT7oxcq0xKIaikCukGvqdMH697yOP83yT2jTgO4tAA0V2uAwWquJUX
	7yOV9JHSuS5DltydKnJMyeYGsSvA3n3OFCK4RZnJ3lfKbpqdYxUWnUYSQx2XWiH4EB3t
	xT0FvOD3xfINCjVVocY3gXPBbp6hn8thdj08+UU7UF8yibfdDq1yDgkmz20a8kwMXQnt
	X55w==
X-Gm-Message-State: APjAAAWRJiOnXbR4FMQabGkvYhydXbz2jnckjCMljJzXA3zhIOvrxOVE
	PyePdKmvmgz+UN4NZtsbOZ4ZmOLsNUQ=
X-Google-Smtp-Source: APXvYqxAq5BGoCK1SR+RpeZ+exD7Ml7HVTVxDwBZ6Y9SFM9nUPs8zNIb7P/lCOo07kGvQkDcuSTAkw==
X-Received: by 2002:a05:6830:4b9:: with SMTP id
	l25mr3492484otd.266.1581706435622; 
	Fri, 14 Feb 2020 10:53:55 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	d131sm2179684oia.36.2020.02.14.10.53.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 10:53:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 13:53:45 -0500
Message-Id: <20200214185345.27235-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python-beautifulsoup4: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 18:53:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-beautifulsoup4.inc          | 17 -----------------
 .../python/python3-beautifulsoup4_4.8.2.bb    | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-beautifulsoup4.inc

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
deleted file mode 100644
index 3e95bb7f21..0000000000
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Screen-scraping library"
-HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
-
-SRC_URI[md5sum] = "5dbdb56c009e4632bae7bed1b385804b"
-SRC_URI[sha256sum] = "05fd825eb01c290877657a56df4c6e4c311b3965bda790c613a3d6fb01a5462a"
-
-inherit pypi
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-html5lib \
-    ${PYTHON_PN}-lxml \
-    ${PYTHON_PN}-soupsieve \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
index d98df11e3d..63fbd09582 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
@@ -1,2 +1,17 @@
-inherit setuptools3
-require python-beautifulsoup4.inc
+SUMMARY = "Screen-scraping library"
+HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
+
+SRC_URI[md5sum] = "5dbdb56c009e4632bae7bed1b385804b"
+SRC_URI[sha256sum] = "05fd825eb01c290877657a56df4c6e4c311b3965bda790c613a3d6fb01a5462a"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-html5lib \
+    ${PYTHON_PN}-lxml \
+    ${PYTHON_PN}-soupsieve \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


