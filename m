Return-Path: <38UqcWwgJANo67NAOPE8S6UIK.8KI@flex--abrestic.bounces.google.com>
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com
	[209.85.166.74])
	by mail.openembedded.org (Postfix) with ESMTP id 95D64798CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 23:57:36 +0000 (UTC)
Received: by mail-io1-f74.google.com with SMTP id m15-v6so10346722ioj.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=cuRcJYJU2pkRmkDBLDr/JMSvSijUGjdqDRxlw01mbNs=;
	b=OF3y6x8EF+6Dtmna9YZfF7+4CtJNiQSfSxyau7eOb+hmb/UvYTgrhkhHJUPTzzEJe1
	ARcCkHN387EARvNGLt3Q44wWLwU4kS6tnYmdH0Tk0yJ2jlKhM7RwpaUxXNkjwSaLXmgD
	FsxVQE+ulgzOHYgqMev48UPkQVdOTJs5E1gZzgJjWkRF3O0GKMqkQVm4AW9HRwHEij2M
	EaNuCD4xZ2E29lfP7XK3nOLeoYFChxBRN6sv/XsLCy64P+FEcQhV3BT0IUw+cwjb4C1g
	knZ1vDcAu2de9Ora3cmD/gb47++DkHo6fdvnO+EzCVv4DD8dwOKLOfyT7jElJyrKLgQs
	lwfA==
X-Gm-Message-State: APzg51B3vSPRnMEqDuQpxPQleCF7uttDNKafqgrSlIEfLHxc6CEoa0p2
	Y0RMl71tBlqagZO9sbXL9lVmQLMR1P0bHCaDgTOhWL/bjNCAvn5O0BqLSiube6mIO1Vi5IsgueB
	LhHtC/JknTkP9qtYJ0xf6WyL3cJH/t/5deURpDEmo+O3vBZlOft/K5uP/B5vHvZzA/JZuunUUls
	wG56pyFewaE0qMXw==
X-Google-Smtp-Source: ANB0Vda525ddQjl3WiMljIRA/sil7L2GKB5dJI+ew6rLn/X+7vMOyGD1a7iTQYisbm7wnciT7q97fL/wPxwZtw==
X-Received: by 2002:a6b:4919:: with SMTP id
	u25-v6mr11248995iob.0.1536969457658; 
	Fri, 14 Sep 2018 16:57:37 -0700 (PDT)
Date: Fri, 14 Sep 2018 16:57:27 -0700
Message-Id: <20180914235727.182478-1-abrestic@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.397.gdd90340f6a-goog
From: Andrew Bresticker <abrestic@waymo.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] libdevmapper: Install dmsetup
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
X-List-Received-Date: Fri, 14 Sep 2018 23:57:36 -0000
Content-Type: text/plain; charset="UTF-8"

Commit 6aa1dd223a140 ("lvm2/libdevmapper: fix invoking lvcreate failed")
moved installation of dmsetup back to lvm2 from libdevmapper, but dmsetup
had intentionally been moved to libdevmapper in commit 269d009a81d4
("lvm2: libdevicemapper package needs udev rules and dmsetup"). Add it back
to libdevmapper by explicitly installing it in do_install(), and refresh
explicitly-do-not-install-libdm.patch so that we also explicitly do not
install dmsetup as part of lvm2.

Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
---
 .../lvm2/libdevmapper_2.02.180.bb             |  1 +
 ...0001-explicitly-do-not-install-libdm.patch | 28 +++++++++++++++----
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
index f3f11ef64..26af3275d 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
@@ -9,6 +9,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' -C libdm install
+    oe_runmake 'DESTDIR=${D}' -C tools install_device-mapper
 }
 
 RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
index e85818dbd..7f5dd9334 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
@@ -1,4 +1,4 @@
-From 0a8e466fcf99622896e070c5133165e4278e8cfb Mon Sep 17 00:00:00 2001
+From 5a3e13ae94318c2bed60f875bb3852c45ce0113c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 25 May 2017 05:27:11 -0400
 Subject: [PATCH] explicitly do not install libdm
@@ -9,12 +9,14 @@ explicitly do not do the installation here.
 Upstream-Status: Inappropriate [meta-oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
 ---
  libdm/Makefile.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
+ tools/Makefile.in | 3 ++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/libdm/Makefile.in b/libdm/Makefile.in
-index 3c9a4ce..45c91c6 100644
+index 66ec39513..c779c9d86 100644
 --- a/libdm/Makefile.in
 +++ b/libdm/Makefile.in
 @@ -77,9 +77,11 @@ ifeq ("@PKGCONFIG@", "yes")
@@ -23,14 +25,28 @@ index 3c9a4ce..45c91c6 100644
  
 -install: $(INSTALL_TYPE) install_include
 +install:
-+	echo "Do not install device mappler in lvm2"
++	echo "Do not install device mapper in lvm2"
  
 -install_device-mapper: install
 +install_device-mapper:
-+	echo "Do not install device mappler in lvm2"
++	echo "Do not install device mapper in lvm2"
  
  install_include: $(srcdir)/libdevmapper.h
  	$(INSTALL_DATA) -D $< $(includedir)/$(<F)
+diff --git a/tools/Makefile.in b/tools/Makefile.in
+index 103b76732..63ba7fc04 100644
+--- a/tools/Makefile.in
++++ b/tools/Makefile.in
+@@ -267,7 +267,8 @@ install_dmsetup_static: dmsetup.static
+ 	$(Q) $(INSTALL_PROGRAM) -D $< $(staticdir)/$(<F)
+ 	$(Q) $(LN_S) -f $(<F) $(staticdir)/dmstats
+ 
+-install_device-mapper: $(INSTALL_DMSETUP_TARGETS)
++install_device-mapper:
++	echo "Do not install device mapper in lvm2"
+ 
+ install_lvm2: $(INSTALL_LVM_TARGETS)
+ 
 -- 
-2.8.1
+2.19.0.397.gdd90340f6a-goog
 
-- 
2.19.0.397.gdd90340f6a-goog


