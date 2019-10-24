Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id BDCCB7F8F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 07:54:11 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id w3so13730189pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NCOuHeyoGlvvAzvUJOtTuvq+v526VuLlZUy1J4GsTwk=;
	b=IQoUb+Ve4QuzaMenmsxDpe/OqtYUxeTCihQ83UhtZOIjZ9xtGW5jYfC0EiKC6/AQfh
	R/42CbENAH1WGfeo/L6Y9yeJzFZCw59AF78yXEQuCAPOV2SpUkihm7CjBimZVcU7YgBK
	dqFvrgZcQHARd3vgzRdFI3Ra1DcgyE/fagrnpaq7YNyRoTje+NivUkl5Zkk+Lub6yFr9
	mLn/4Xp6wFg41DRtL6wyFqBEmi4hVhDGcKj2pLdqY1oCRZWs4cGpGLd97Wr/OyTzjin1
	k0hBA3m8+rPPLxqbnhKuhvYJbD8JaOXSeNyFFP076qEXz0Qgw40wB2LsQ7FTb3lQN2X5
	9Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NCOuHeyoGlvvAzvUJOtTuvq+v526VuLlZUy1J4GsTwk=;
	b=hBI24vv3d/gb+kbpCh4JLGPhzdkP9U38szBDZ1T91wvIluWKIJMDom8KT8FqFRFy1n
	d3dINsdVhREW+KWfKjGODlYy5+OcadLAzCEug0fvtXy+6SPKxjOCUd5KsWp+C6uYMEve
	x6tHWR22hqY1xLMyOjc4i5e7wJdyjUXLv1lqK4901XCdhKvHBz3WnBYMai/ajneq9Yq5
	NAeYIwLS+bX/QLeq3W002QBpwVnXTG97AtW5Y4KQybOVWQ4lBHYeMOVfIZ0ryfgxdeBE
	JkS0G6J9h1eTGJ9GIE3gGF3Z75Ck2Qt/jLhVTFuBQsZl8VbFDTyJIPVIHliFF6M5fAzC
	fOWQ==
X-Gm-Message-State: APjAAAWnst+v3LsTB4vCKG3VO1prSd5FTzP90XIr8tzOdeMZcygEiwb8
	JjPmBse93P8ueVF+9Vc79ZQg736czxYrDg==
X-Google-Smtp-Source: APXvYqw7SDm3k4cjhW9O9Iy0EK1RvdIAHAUFKGhXC0vjrpe7hv4j+EgP9mFDZZlHagH+EPhuwPQm1w==
X-Received: by 2002:a63:4c57:: with SMTP id m23mr8388990pgl.207.1571903651877; 
	Thu, 24 Oct 2019 00:54:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id k93sm3402431pjh.3.2019.10.24.00.54.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 00:54:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 00:53:52 -0700
Message-Id: <20191024075355.2136934-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024075355.2136934-1-raj.khem@gmail.com>
References: <20191024075355.2136934-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/6] python3-astor: Fix build with setuptools>=41.4
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
X-List-Received-Date: Thu, 24 Oct 2019 07:54:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...f3ff7ad8818475b6e107e63aa9a54252d2a9.patch | 87 +++++++++++++++++++
 .../python/python3-astor_0.8.bb               |  4 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch

diff --git a/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch b/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
new file mode 100644
index 0000000000..823699339e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-astor/f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch
@@ -0,0 +1,87 @@
+From f820f3ff7ad8818475b6e107e63aa9a54252d2a9 Mon Sep 17 00:00:00 2001
+From: Jonathan Ringer <jonringer117@gmail.com>
+Date: Thu, 17 Oct 2019 16:54:16 -0700
+Subject: [PATCH] Fix packaging for setuptools>=41.4
+
+---
+ astor/VERSION     |  1 +
+ astor/__init__.py |  5 ++++-
+ setup.cfg         |  3 ++-
+ setup.py          | 16 +---------------
+ 4 files changed, 8 insertions(+), 17 deletions(-)
+ create mode 100644 astor/VERSION
+
+diff --git a/astor/VERSION b/astor/VERSION
+new file mode 100644
+index 0000000..a3df0a6
+--- /dev/null
++++ b/astor/VERSION
+@@ -0,0 +1 @@
++0.8.0
+diff --git a/astor/__init__.py b/astor/__init__.py
+index 3b02983..8dfcdb1 100644
+--- a/astor/__init__.py
++++ b/astor/__init__.py
+@@ -9,6 +9,7 @@
+ 
+ """
+ 
++import os
+ import warnings
+ 
+ from .code_gen import SourceGenerator, to_source  # NOQA
+@@ -19,7 +20,9 @@
+ from .op_util import symbol_data  # NOQA
+ from .tree_walk import TreeWalk  # NOQA
+ 
+-__version__ = '0.8.0'
++ROOT = os.path.dirname(__file__)
++with open(os.path.join(ROOT, 'VERSION')) as version_file:
++    __version__ = version_file.read().strip
+ 
+ parse_file = code_to_ast.parse_file
+ 
+diff --git a/setup.cfg b/setup.cfg
+index 1baf6fc..a43634f 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -2,6 +2,7 @@
+ name = astor
+ description = Read/rewrite/write Python ASTs
+ long_description = file:README.rst
++version = file: astor/VERSION
+ author = Patrick Maupin
+ author_email = pmaupin@gmail.com
+ platforms = Independent
+@@ -40,7 +41,7 @@ test_suite = nose.collector
+ [options.packages.find]
+ exclude = tests
+ 
+-[wheel]
++[bdist_wheel]
+ universal = 1
+ 
+ [build-system]
+diff --git a/setup.py b/setup.py
+index 4a111b5..6068493 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,17 +1,3 @@
+-import os
+-import sys
+-
+ from setuptools import setup
+-from setuptools.config import read_configuration
+-
+-from setuputils import find_version
+-
+-
+-def here(*paths):
+-    return os.path.join(os.path.dirname(__file__), *paths)
+-
+-config = read_configuration(here('setup.cfg'))
+-config['metadata']['version'] = find_version(here('astor', '__init__.py'))
+-config['options'].update(config['metadata'])
+ 
+-setup(**config['options'])
++setup()
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.bb
index efd56c1b06..17cc540f00 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.bb
@@ -4,7 +4,9 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7"
 
-SRC_URI = "git://github.com/berkerpeksag/astor.git"
+SRC_URI = "git://github.com/berkerpeksag/astor.git \
+           file://f820f3ff7ad8818475b6e107e63aa9a54252d2a9.patch \
+          "
 SRCREV ?= "3a7607e31f0c17e747ded5cfe0b582d99f7caecf"
 
 inherit setuptools3
-- 
2.23.0


