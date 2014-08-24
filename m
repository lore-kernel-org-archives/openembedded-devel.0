Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id BF07171041
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 00:58:10 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so17831797pde.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Aug 2014 17:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CQMg8mwfQ1MhLemBGD4wucC+1e6bTZhToXNr4FSj5GA=;
	b=WE1bPscOSB6PeE4mrKxoYLhm2uHZpVwaOA30QPhefgLpnrGjWqn8jL0vorkLkP7Eyq
	Gh3BMO6/X+trYjntREpCLfzwJX5oFj4ViL59uaStOIJDy943k2yjHy71CRjQLvREXKIu
	mBiXnXxDd6x0qVbVkZ1/gtWh4xylu83JaZKjBaWqqxFkyh3+3DDYENhdlzjYkW1IY9mI
	Oe2n9K8+JRL4k7iWkb2zeWXtko6gqkR0Cbb4GD21JILhTYbk54wkjj3xVUACCBWM5YgM
	yXoUJ4yQRj4MiyaQXqNuqbTqIUGRLL/sewN42TN23QiROpQps8LfMQaxoDxMcvsaTAUy
	svDQ==
X-Received: by 10.70.62.5 with SMTP id u5mr647064pdr.100.1408841891313;
	Sat, 23 Aug 2014 17:58:11 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	co14sm118798113pac.43.2014.08.23.17.58.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Aug 2014 17:58:10 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Aug 2014 17:57:05 -0700
Message-Id: <1408841825-1720-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-python][PATCH] python-snakefood: add 1.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Aug 2014 00:58:10 -0000

* Generate dependencies from Python code, filter, cluster and generate
  graphs from the dependency list

* Tools included:
  - sfood:
      Given a set of input files or root directories, generate a list of
      dependencies between the files;
  - sfood-graph:
      Read a list of dependencies and produce a Graphviz dot file. (This
      file can be run through the Graphviz dot tool to produce a
      viewable/printable PDF file);
  - sfood-cluster:
      Read a list of dependencies, a list of file clusters, and output a
      list of simplified (clustered) dependencies.
  - sfood-checker:
      Analyze the source code with the AST and list unused or redundant
      imports.
  - sfood-imports:
      Find and list import statements in Python files, regardless of
      whether they can be imported or not.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../python/python-snakefood_1.4.bb                 | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-snakefood_1.4.bb

diff --git a/meta-python/recipes-devtools/python/python-snakefood_1.4.bb b/meta-python/recipes-devtools/python/python-snakefood_1.4.bb
new file mode 100644
index 0000000..1af33d4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-snakefood_1.4.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Dependency graphing for Python"
+DESCRIPTION = " Generate dependency graphs from Python code. This \
+dependency tracker package has a few distinguishing characteristics \
+\
+    * It uses the AST to parse the Python files. This is very reliable, \
+      it always runs.\
+    * No module is loaded. Loading modules to figure out dependencies is \
+      almost always problem, because a lot of codebases run initialization \
+      code in the global namespace, which often requires additional setup. \
+      Snakefood is guaranteed not to have this problem (it just runs, no \
+      matter what).\
+    * It works on a set of files, i.e. you do not have to specify a single \
+      script, you can select a directory (package or else) or a set of files.\
+      It finds all the Python files recursively automatically.\
+    * Automatic/no configuration: your PYTHONPATH is automatically adjusted \
+      to include the required package roots. It figures out the paths that \
+      are required from the files/directories given as input. You should not \
+      have to setup ANYTHING.\
+    * It does not have to automatically 'follow' dependencies between modules,\
+      i.e. by default it only considers the files and directories you specify \
+      on the command-line and their immediate dependencies. It also has an \
+      option to automatically include only the dependencies within the \
+      packages of the files you specify.\
+    * It follows the UNIX philosophy of small programs that do one thing well:\
+      it consists of a few simple programs whose outputs you combine via \
+      pipes. Graphing dependencies always requires the user to filter and \
+      cluster the filenames, so this is appropriate. You can combine it with \
+      your favourite tools, grep, sed, etc.\
+\
+A problem with dependency trackers that run code is that they are unreliable, \
+due to the dynamic nature of Python (the presence of imports within function \
+calls and __import__ hooks makes it almost impossible to always do the right \
+thing). This script aims at being right 99% of the time, and we think that \
+given the trade-offs, 99% is good enough for 99% of the uses.\
+"
+AUTHOR = "Martin Blais <blais@furius.ca>"
+HOMEPAGE = "http://furius.ca/snakefood"
+SECTION = "devel/python"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+SRCNAME = "snakefood"
+
+SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "56c88667a33d8909b0aabf2ab6903bdf"
+SRC_URI[sha256sum] = "295784668032254e7391ca99ba7060edd3ae4eca1a330ac11627b18ab5923b77"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = " python-logging python-compiler python-shell"
+# the above modules do not have a -native counterpart
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native"
+
-- 
1.9.3


