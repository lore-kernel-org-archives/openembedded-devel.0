Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCCE771E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 67so15765170pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6nfJe9+Vu1zwkpAx7vzeiNKM4N6sfcL6EOHqHwPyFtc=;
	b=nY5GUAGXtpO9EbIS+pSsB20cgdKS/yrtJ22Ktj4/nDh6nhDPk0Nr84mfJmWY4kZgSN
	n7ZrHiT7+tfD8oJdw7joQVtuAZMi4AfP0UC8lCWwuIsCv5R9J5LUYZcVps8XDELtmNbE
	zb62w/CW9UcwFSkkfcKib0nUWXZzFgs5bYgksOLDrgrrxJC1HKOGD23yBuyIjErES+AD
	aLHmWE5LxvS3+HKAQ/RejsPccC3wmHroxq9Z9LDDFFylsato8zeOsCFpKPc2QnhN0ovb
	ObQpJuRCZqHE868tDcHVUcT/7YED112LpcwZq3zA27gZnqf5W3UhLNBVmdq587gvMi6c
	qqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6nfJe9+Vu1zwkpAx7vzeiNKM4N6sfcL6EOHqHwPyFtc=;
	b=jcmhqdPVsflOufRoIN4NrFaCPZTySpapiCRdvWHu5YK1WovobdVRZD2xJYUVcRu3Ne
	UQrj981ks1GtaryPlw8FEssAZ7mR/tR8fS/hUSlgCv7fK2OlwdeXKoAfXX1/FpBNXIoE
	zp0vH5C71AyDCRGGutD68laAVomHDq5qIkmbgg+ywP7tcTB0Po0FD3hoP0v91x83OyjD
	HNu0PYLLcTlTIpmYGc7uYPER3m8oV/7tluV+oWABbZHWZNNkCOSh6MTG5YHnV6Gi8IEL
	Aa8TETd8Fnd1eVQHN/uP0wKYIi0X44iYBWr2UcdghB+r1JM5wDi1XgFJERaBrd+RdViz
	PQfA==
X-Gm-Message-State: AMke39lFN4uWLLQJzTdvL1uDz6Y5NX14FSGJefi9v+Qa16yhNE/0vf1stSqwS3SRE5+eeQ==
X-Received: by 10.98.104.4 with SMTP id d4mr26547191pfc.2.1488870842591;
	Mon, 06 Mar 2017 23:14:02 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:38 -0800
Message-Id: <20170307071349.16444-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/14] libxml++: Update to 2.40.1
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:02 -0000

Fix ptests for S != B case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libxml/libxml++/libxml++_ptest.patch           | 34 +++++++++++-----------
 .../{libxml++_2.38.1.bb => libxml++_2.40.1.bb}     |  4 +--
 2 files changed, 19 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-core/libxml/{libxml++_2.38.1.bb => libxml++_2.40.1.bb} (84%)

diff --git a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
index 82960f112..0d1a5186a 100644
--- a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
+++ b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
@@ -1,21 +1,21 @@
-diff --git a/Makefile.am b/Makefile.am
-index d4aadb1..0e36756 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -253,5 +253,8 @@ post-html: docs/index.html
- 	rsync $(rsync_args) -r docs/index.html $$USER,libxmlplusplus@web.sourceforge.net:$(web_path_project)
- 	rsync $(rsync_args) -r examples $$USER,libxmlplusplus@web.sourceforge.net:$(web_path_project)
+Index: libxml++-2.40.1/Makefile.am
+===================================================================
+--- libxml++-2.40.1.orig/Makefile.am
++++ libxml++-2.40.1/Makefile.am
+@@ -24,5 +24,8 @@ dist_noinst_SCRIPTS = autogen.sh
+ 
+ DISTCLEANFILES = MSVC_Net2010/libxml++/libxml++config.h
  
 +install-ptest:
 +	make -C examples install-ptest
 +
  # Optional: auto-generate the ChangeLog file from the git log on make dist
- include $(top_srcdir)/macros/dist-changelog.am
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index d9541ca..c27e088 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -19,6 +19,8 @@ AM_CPPFLAGS = -I$(top_builddir) -I$(top_srcdir) -I. $(LIBXMLXX_CFLAGS)
+ include $(top_srcdir)/build/dist-changelog.am
+Index: libxml++-2.40.1/examples/Makefile.am
+===================================================================
+--- libxml++-2.40.1.orig/examples/Makefile.am
++++ libxml++-2.40.1/examples/Makefile.am
+@@ -19,6 +19,8 @@ AM_CPPFLAGS = -I$(top_builddir) -I$(top_
  AM_CXXFLAGS = $(LIBXMLXX_WXXFLAGS)
  LDADD = $(top_builddir)/libxml++/libxml++-$(LIBXMLXX_API_VERSION).la $(LIBXMLXX_LIBS)
  
@@ -24,7 +24,7 @@ index d9541ca..c27e088 100644
  check_PROGRAMS = \
    dom_build/dom_build \
    dom_parse_entities/dom_parse_entities \
-@@ -36,6 +38,23 @@ check_PROGRAMS = \
+@@ -37,6 +39,23 @@ check_PROGRAMS = \
    schemavalidation/schemavalidation \
    textreader/textreader
  
@@ -48,7 +48,7 @@ index d9541ca..c27e088 100644
  # Shell scripts that call the example programs.
  check_SCRIPTS = \
    dom_build/make_check.sh \
-@@ -147,10 +166,10 @@ dist_noinst_DATA = \
+@@ -154,10 +173,10 @@ dist_noinst_DATA = \
  # file are located in different directories.
  dom_read_write/make_check.sh: Makefile
  	echo '# Generated and used by "make check"' >$@
@@ -61,7 +61,7 @@ index d9541ca..c27e088 100644
  standard_scripts = $(filter-out dom_read_write/make_check.sh,$(check_SCRIPTS))
  
  # All other script files are generated like so:
-@@ -162,3 +181,18 @@ $(standard_scripts): Makefile
+@@ -169,3 +188,18 @@ $(standard_scripts): Makefile
  CLEANFILES = \
    dom_read_write/example_output.xml \
    $(check_SCRIPTS)
@@ -77,6 +77,6 @@ index d9541ca..c27e088 100644
 +	cd $(srcdir) && cp --parents $(dist_noinst_DATA) $(DESTDIR)/examples
 +	cp Makefile $(DESTDIR)/examples
 +	$(MKDIR_P) $(DESTDIR)/macros
-+	cp $(srcdir)/../macros/test-driver $(DESTDIR)/macros
++	cp $(top_srcdir)/build/test-driver $(DESTDIR)/macros
 +	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/examples/Makefile
 +
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
similarity index 84%
rename from meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
rename to meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
index 2cb954835..c001c184c 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
     file://libxml++_ptest.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "6b16aac575725a9bc0e9d96489e9251f"
-SRC_URI[sha256sum] = "882529189b03db6c69925b3f579ab1941feb4f02b5fe2612504ee7e498a4a05f"
+SRC_URI[md5sum] = "377a87bea899f2b4ff62df2418c3d8a6"
+SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f35463e9"
 
 DEPENDS = "libxml2 glibmm"
 
-- 
2.12.0


