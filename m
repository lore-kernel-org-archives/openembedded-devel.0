Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.1237.1602268434187709842
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 11:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXAx5V2v;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: geoffhp@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id g9so7871965pgh.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZXInW8+5f6dsufGccGL5i6BAdSBEQemkEUvhe5VMK1k=;
        b=sXAx5V2vyVSida81J3fWYKZkHQ+qcVXch9njZjy1yq6pQKbBuU2A39eqbV7DiBmosr
         zvyM0gxnwiHWVCZiw/LluIvNO1WuN2rYIR4Nip8sTbYVXO9NuafKiDVV1ctaJaPKuodz
         PikTV1YldY8qPNmAMhu8tGtRHGWXoHFyJK4B/mOE2ouQeHztrj8kq9oDDa5pp1YlsgBe
         ML4cbbI+jtkX/ZrB0QZD8aDyBsjC8RPtQkJVj4XdENJfIj58em1avaMNqHBlSkgYMhSa
         YgSj/JHUCNDs4Dlpx3DiqT2XWfSQFtyE21vhCqQ1Hn0YNNZ5+DMxDWxfcjtQVllDvNvA
         n93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZXInW8+5f6dsufGccGL5i6BAdSBEQemkEUvhe5VMK1k=;
        b=gQsPBOQkvugjF46ozHLtMQjZybzhm8XuWcL4CqwRHRqtZaYuBiFevD+TuTdqgf5Kk8
         H+JffoZXfKXmRuMgD4h498bcdu8f2pxjXEeoUxzzC1FjGSXynysOvJNGNYicN3k7TWsc
         bj2ZulvAqfxs6tiHaxP2yoSU0vZJ7CJgKaOIvYOMivLw01vqclKeGYiEm8/E1G8LCEYw
         fSnyGnFlqwR2Cw0TeBfl33iJNiVMo1rJpghojF8W6Mx17fKXNoV4yEMScvrmRkCXNy7W
         Pl3IhHlCKJwFrDDW1A7a1Y1vjmM6qwBhZFop57BmQTVCngVGUgv0XdGJeeRAi6CFWPkA
         niWg==
X-Gm-Message-State: AOAM531k1y1Rpylk+zSn9jExl4VNxGssZ8d02m09+71ZmuNfnR5BtmiI
	ntn8DCTO9blcMQH+e9B5BQlNJAmsZJ9d4Q==
X-Google-Smtp-Source: ABdhPJwDbk52CIkPNM9x8kuDKZsimgezC22oyHedKxS9R1Ve29U1A3eEZLsbuyjn1cz5X6vb50Ib+w==
X-Received: by 2002:a63:ab07:: with SMTP id p7mr1220191pgf.326.1602268433209;
        Fri, 09 Oct 2020 11:33:53 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-23-241-71-171.socal.res.rr.com. [23.241.71.171])
        by smtp.gmail.com with ESMTPSA id y4sm13589973pjc.53.2020.10.09.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 11:33:52 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: geoffhp@gmail.com,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] multipath-tools: replace perl with sed in libdmmp/Makefile for pseudo
Date: Fri,  9 Oct 2020 11:33:35 -0700
Message-Id: <20201009183335.30362-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffrey.parker@arthrex.com>

The multipath-tools libdmmp/Makefile install target uses 'perl -i' instead
of 'sed -i' for string substitutions. The perl method creates a temporary file
and overwrites the original which changes the inodes and corrupts the pseudo
db. Changes to pseduo cause a build abort rather than allow possible bad
ownership or permissions settings on the files. 'sed -i' is compatible
with pseudo.

see https://wiki.yoctoproject.org/wiki/Pseudo_Abort

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 ...-replace-perl-with-sed-in-install-ta.patch | 40 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
new file mode 100644
index 000000000..b35d67cf5
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
@@ -0,0 +1,40 @@
+From 35421d03898ac1b38f97a76241e6a29086d0c9f1 Mon Sep 17 00:00:00 2001
+From: Geoff Parker <geoffrey.parker@arthrex.com>
+Date: Fri, 9 Oct 2020 17:48:47 +0000
+Subject: [PATCH] libdmmp/Makefile: replace perl with sed in install target to
+ work with pseudo
+
+The multipath-tools libdmmp/Makefile install target uses 'perl -i' instead
+of 'sed -i' for string substitutions. The perl method creates a temporary file
+and overwrites the original which changes the inodes and corrupts the pseudo
+db. Changes to pseduo cause a build abort rather than allow possible bad
+ownership or permissions settings on the files. 'sed -i' is compatible
+with pseudo.
+
+Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
+---
+ libdmmp/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libdmmp/Makefile b/libdmmp/Makefile
+index 1dd3f340..8166075c 100644
+--- a/libdmmp/Makefile
++++ b/libdmmp/Makefile
+@@ -34,11 +34,11 @@ install:
+ 	$(LN) $(LIBS) $(DESTDIR)$(usrlibdir)/$(DEVLIB)
+ 	$(INSTALL_PROGRAM) -m 644 -D \
+ 		$(PKGFILE).in $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
+-	perl -i -pe 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
++	sed -i 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
+ 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
+-	perl -i -pe 's|__LIBDIR__|$(usrlibdir)|g' \
++	sed -i 's|__LIBDIR__|$(usrlibdir)|g' \
+ 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
+-	perl -i -pe 's|__INCLUDEDIR__|$(includedir)|g' \
++	sed -i 's|__INCLUDEDIR__|$(includedir)|g' \
+ 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
+ 	@for file in docs/man/*.3.gz; do \
+ 		$(INSTALL_PROGRAM) -m 644 -D \
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 48a348d80..331c0cd01 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
            file://0030-Always-use-devmapper.patch \
            file://0031-Always-use-devmapper-for-kpartx.patch \
+           file://0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
-- 
2.20.1

