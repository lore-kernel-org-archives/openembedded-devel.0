Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id E40806FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Oct 2017 05:16:26 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id d28so16251688pfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2017 22:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6QnabFyyqhG6IXOawSwqCl9mC7qvcy5YAmBeW8VlUU8=;
	b=DhRNA8XNioWL2+KAZRPEZhFfZO4WgzNPvg1KxHDoGv4BfPDM6RvXY3/esd1O2EPqKU
	5siz1htD3Lh25P59yfiV44ebAUVzUYDvdifcPaaL71wLyjFOPFKqK4qnkYvPKrGaCsgC
	N3KMwlhKKEkCd1sY7T03OpCta5tb72zksJM5hToCtYsYqdeaggmVbTme2XcY7e/Ofq11
	i4+i+tlKj54mTOsHDhd2wsZ1LLNkBTI9NfEF08wvuMDz++xQN8yz3xOS4+lp5pOz4ae3
	CQFBac4o6c2mSdCsC6kHO1yhy5z106BIOeC9/UWsEFI+4lHmZXNOIgRtbc6uzMELBBDs
	ORZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6QnabFyyqhG6IXOawSwqCl9mC7qvcy5YAmBeW8VlUU8=;
	b=JxjAMPvsihljd1a5OQ6uJeQ6lkgwbAqxLNsGrvG/htOGxJ6u0lxIJnQaGr3RXBKLMG
	fPufGMWK95IPgGKcCAUNe/J0aiGJjMZ5X6W2ck0DNJu9BZ5HIeZd3KeIVzzKOLYgcvVm
	jCUY3pNe1XfECRX4EKzYhnIXOz3Hzt3o6hdKB/XCa/UYjwtSk1UwM+S0vJSSnMkK6sOm
	UWgdZ3nvMycyBuRXCO9wYVV4VLJwAxueGnPzpr4VVGGo5lyr7k5DIMZ5mZrGG6U83GLh
	cJqdO8yN72UQBVnOmWLpIR8d1O0H3V4qdGkaIbqJiykGbujyApoOKorAp9kwDtNAXaPO
	QmfQ==
X-Gm-Message-State: AMCzsaXOs2Iht7xOOD/x0vh4Cl5eMDKWckpITqZHghak9HxmmCt+qKjH
	qilIzsRLWMvjS4l2/bj/Re/qQg==
X-Google-Smtp-Source: ABhQp+THpiKq3T4i1dhYDvwa+DonnNc7PC3ljkUH7QuY1n7Ok1TC+JskYE7lAxG6fRtxy4uMxJFjCw==
X-Received: by 10.98.49.135 with SMTP id x129mr11993344pfx.315.1508735787793; 
	Sun, 22 Oct 2017 22:16:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id t9sm9376560pgr.3.2017.10.22.22.16.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Oct 2017 22:16:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Oct 2017 22:16:19 -0700
Message-Id: <20171023051619.37072-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-networking][PATCH] dovecot: Fix parallel build
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
X-List-Received-Date: Mon, 23 Oct 2017 05:16:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dovecot/0001-doveadm-Fix-parallel-build.patch  | 38 ++++++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.2.29.bb      |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
new file mode 100644
index 000000000..65ae9bf91
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
@@ -0,0 +1,38 @@
+From be9b3809b86fe593dbb16f0b981b3d315a27b799 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 22 Oct 2017 22:10:41 -0700
+Subject: [PATCH] doveadm: Fix parallel build
+
+Sometimes dovetail build fails with errors like
+
+doveadm-util.o: file not recognized: File truncated
+collect2: error: ld returned 1 exit status
+make[4]: *** [Makefile:812: test-doveadm-util] Error 1
+
+This is partial backport from
+
+https://github.com/dovecot/core/commit/b200bc3875fa06d42c8619865cc306c3297fcacc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/doveadm/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/doveadm/Makefile.am b/src/doveadm/Makefile.am
+index c644646..6ae9144 100644
+--- a/src/doveadm/Makefile.am
++++ b/src/doveadm/Makefile.am
+@@ -180,8 +180,8 @@ test_libs = \
+ 	../lib/liblib.la
+ test_deps = $(noinst_LTLIBRARIES) $(test_libs)
+ 
+-test_doveadm_util_SOURCES = test-doveadm-util.c
+-test_doveadm_util_LDADD = doveadm-util.o $(test_libs) $(MODULE_LIBS)
++test_doveadm_util_SOURCES = doveadm-util.c test-doveadm-util.c
++test_doveadm_util_LDADD = $(test_libs) $(MODULE_LIBS)
+ test_doveadm_util_DEPENDENCIES = $(test_deps)
+ 
+ check: check-am check-test
+-- 
+2.14.2
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
index d834bef71..166340873 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.29.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
 SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
            file://dovecot.service \
-           file://dovecot.socket"
+           file://dovecot.socket \
+           file://0001-doveadm-Fix-parallel-build.patch \
+           "
 
 SRC_URI[md5sum] = "ff95486a5c43025a2c3f5a712e7962b9"
 SRC_URI[sha256sum] = "d939ea99126eb8a8c6955390b422b6e27ec0fa43a3b59b2b3218cb5ad67139a6"
-- 
2.14.2


