Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id B23CC606A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:11:56 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 203so148005916ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e09Iy7fKDN+g1S+d8umjwAK5m1WB5+UtElBrBayrGcA=;
	b=sCKYd0XQxPU6wM73fkS+6INhelsLmvHQ1LRE2W7hMbZ1Z25XJD99Muv4+NI7jRLA6F
	MSI6SfwdmuB11eRGihpcF1SurVpkSK5HEeLu9BCe4F+zptP523TpYycSaJV3qYuU9okI
	QPm7J8/NLuy8rNXcCmODPxOArHpWePmoiTj/pw+Om4piB7FsiQx2SeWdxGFgSTb+dAT8
	NyyIpXRpxVnzXHK2rui2emJjlmhWmeuVzOWzYwQI6lMwfozht55dndg6NT7ei5ycZXvj
	5nY5VRTuAtKDW6jwUZZiWZp2RQ4a/HjM+8L/1Llc7kLJdxq/k4EjY/hjNVzICs4rBz/W
	erpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e09Iy7fKDN+g1S+d8umjwAK5m1WB5+UtElBrBayrGcA=;
	b=iueYElgp+Ni09F+Ss1qHxm1FDuCNi1bmflqvvaLNp+SpQPkr9N4fXwLDT5MxbIINGw
	xCDYCczhuiulbgD683vcU3fq22jJH3Z+b7AbUsWk9wJIrtCf7NJt6/IBj0NV8OGu1fNp
	6fi66ncWz8qHrhFcSH0cAFnMQoxA20r80OIi1Ua0Pi2Hb4wvkgzEJb0AEp0PZ26Y48nB
	3+I0HvImwMLX4AFbgCdTH0f1odb67j/yRi0wmRVouW6MM9wUO6PEmHbAbugaQ6DtrAy4
	RQuofRcuu3DD4heOiqbMeGlvkEo4P4tiplZPdKkmNlqvs3F4e+XA8FHzFyERD03v0bOg
	rgEQ==
X-Gm-Message-State: AIkVDXKjkmP02pVWbvaC6a5FtY2JmbSTMI2Ok45QVY2LJfZSY9y4edsAlYzhvAaA5NGfDFh/
X-Received: by 10.36.86.4 with SMTP id o4mr2383697itb.83.1485511916577;
	Fri, 27 Jan 2017 02:11:56 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46])
	by smtp.gmail.com with ESMTPSA id y71sm1172175itb.1.2017.01.27.02.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 02:11:55 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jan 2017 11:11:21 +0100
Message-Id: <259d5f21f2259aab042bae1076a53975c7dc8caf.1485511836.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c0833b943acf2f997b54ea7a5284afcdeaf3b924.1485511836.git-series.patrick.ohly@intel.com>
References: <cover.c0833b943acf2f997b54ea7a5284afcdeaf3b924.1485511836.git-series.patrick.ohly@intel.com>
Subject: [meta-oe][PATCH 1/2] multipath-tools: fix building of shared objects
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
X-List-Received-Date: Fri, 27 Jan 2017 10:11:56 -0000

When -pie is in CFLAGS, it overrides the -shared compiler
flag, leading to link errors (undefined main) for shared
objects. Parameters must be ordered so that -shared comes
last.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb                                  |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch b/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
new file mode 100644
index 0000000..ae6bb89
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch
@@ -0,0 +1,49 @@
+From 4311856200480288494df8df737f71ea316592d0 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Thu, 26 Jan 2017 15:28:34 +0100
+Subject: [PATCH] shared libs: avoid linking .so as executable
+
+When the OE build systems sets CFLAGS including -pie, gcc overrides
+the earlier -shared parameter and tries to link a binary, leading to
+errors about missing functions like main().
+
+Reordering the parameters so that -shared comes after CFLAGS
+fixes this.
+
+Upstream-Status: Inappropriate [OE specific, -pie shouldn't be in CFLAGS?!]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ libmpathpersist/Makefile | 2 +-
+ libmultipath/Makefile    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
+index c4ec1c5..790692a 100644
+--- a/libmpathpersist/Makefile
++++ b/libmpathpersist/Makefile
+@@ -20,7 +20,7 @@ all: $(LIBS)
+ 
+ $(LIBS): 
+ 	$(CC) -Wall -fPIC -c $(CFLAGS) *.c 
+-	$(CC)  -shared $(LIBDEPS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS)
++	$(CC) $(LIBDEPS) $(CFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS)
+ 	ln -s $(LIBS) $(DEVLIB)
+ 	$(GZIP) mpath_persistent_reserve_in.3 > mpath_persistent_reserve_in.3.gz	
+ 	$(GZIP) mpath_persistent_reserve_out.3 > mpath_persistent_reserve_out.3.gz	
+diff --git a/libmultipath/Makefile b/libmultipath/Makefile
+index fc0f3d6..2287d91 100644
+--- a/libmultipath/Makefile
++++ b/libmultipath/Makefile
+@@ -55,7 +55,7 @@ endif
+ all: $(LIBS)
+ 
+ $(LIBS): $(OBJS)
+-	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ $(CFLAGS) -o $@ $(OBJS) $(LIBDEPS)
++	$(CC) $(LDFLAGS) $(CFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
+ 	ln -sf $@ $(DEVLIB)
+ 
+ install:
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 6bd6118..2ab4dad 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://always-use-libdevmapper-kpartx.patch \
            file://do-not-link-libmpathpersist-to-TMPDIR.patch \
            file://0001-multipathd.service-Error-fix.patch \
+           file://shared-libs-avoid-linking-.so-as-executable.patch \
            "
 # 0.5.0
 #
-- 
git-series 0.9.1

