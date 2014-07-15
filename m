Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 439C6704C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 23:33:04 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ij19so219432vcb.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=i+xqDNMmMAXd2+Kvh0pD/I/7zJbYRCiMoO701ahzQBQ=;
	b=S16I5oq8g3lnb6EfTTEqTjdMbFnOc3dceVplj+IuC7RP727GQ0eBrKlZQTOlhN9oKA
	Gnp6cuSQumvu8zLdeV+hwbaEyGIy/6GKoSFbyqexAHxMsLh82H5mzNhtcZNAcyZuDUSt
	WSyZeoqGn2aZGssvDROzxaWJrNyoErxRNVHf87T+fnn9MY+70+p1dBZ6K6py4BBleXTd
	of4pvwETwQ2ZGjkE8J7oROG7j0o7m+xmYvCHphkBD6WMLrpUN1WWJ44azE2JbtIfwbBd
	CshOl68CQ7Sb/Iqfhfw0WQiQ4ttNtaZxtmMVKjgpjikVxOcnJPNbyeGAfE2ktjrrJ8PC
	UVNg==
X-Received: by 10.221.64.80 with SMTP id xh16mr3869669vcb.35.1405467185814;
	Tue, 15 Jul 2014 16:33:05 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id
	xb3sm27742505vdb.14.2014.07.15.16.33.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 16:33:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 16:32:33 -0700
Message-Id: <df9ed3b72b1920938e4c79c20cdd288a1d7b16a8.1405465524.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1405465524.git.TicoTimo@gmail.com>
References: <cover.1405465524.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1405465524.git.TicoTimo@gmail.com>
References: <cover.1405465524.git.TicoTimo@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 1/2] meta-python: create layer
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
X-List-Received-Date: Tue, 15 Jul 2014 23:33:08 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/COPYING.MIT     | 17 +++++++++++++++
 meta-python/README          | 53 +++++++++++++++++++++++++++++++++++++++++++++
 meta-python/conf/layer.conf |  9 ++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 meta-python/COPYING.MIT
 create mode 100644 meta-python/README
 create mode 100644 meta-python/conf/layer.conf

diff --git a/meta-python/COPYING.MIT b/meta-python/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-python/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/meta-python/README b/meta-python/README
new file mode 100644
index 0000000..f62ab8f
--- /dev/null
+++ b/meta-python/README
@@ -0,0 +1,53 @@
+meta-python
+================================
+
+Introduction
+-------------------------
+
+This layer is intended to be the home of python modules for OpenEmbedded.
+Modules in this layer need to be independent of openembedded-core and
+meta-openembedded/meta-oe. Because of this, modules required by 'gateone'
+and 'anki' are not included and remain in:
+        meta-openembedded/meta-oe/recipes-devtools/python.
+
+Dependencies
+-------------------------
+
+The meta-python layer depends on:
+
+	URI: git://git.openembedded.org/openembedded-core
+	layers: meta
+	branch: master
+	revision: HEAD
+
+	URI: git://git.openembedded.org/meta-openembedded
+	layers: meta-oe
+	branch: master
+	revision: HEAD
+
+Please follow the recommended setup procedures of your OE distribution.
+For Angstrom that is:
+        http://www.angstrom-distribution.org/building-angstrom,
+other distros should have similar online resources.
+
+Contributing
+-------------------------
+
+The meta-openembedded mailinglist
+(openembedded-devel@lists.openembedded.org) is used for questions,
+comments and patch review. It is subscriber only, so please register
+before posting.
+
+Send pull requests to openembedded-devel@lists.openembedded.org with
+'[meta-python]' in the subject.
+
+When sending single patches, please use something like: 
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+
+Maintenance
+-------------------------
+
+Maintainers:
+        Tim "moto-timo" Orling <TicoTimo@gmail.com>
+        Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
+
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
new file mode 100644
index 0000000..4e8eca3
--- /dev/null
+++ b/meta-python/conf/layer.conf
@@ -0,0 +1,9 @@
+# We might have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-python"
+BBFILE_PATTERN_meta-python := "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-python = "7"
-- 
1.9.3


