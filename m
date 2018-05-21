Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 198AC74CB4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 13:41:28 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id c11-v6so8855988plr.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JWnW5f3egfnHgkYIjjxdw6QVjKNTGuk3+g/kTcchLmM=;
	b=DU+TPa32A5J/obLMSeRvLAZe3GL+Hc95QLIJPa7jdDu+W5zuKWFoiKjtFs2Rj06PfB
	d5EYuPEHQxn5KRu9Xfdrgm6WnAXay0gjsuPaIKz8GwnHVd6UGN2Rpliu6mysv8YqQBG6
	doG+Xrb1GP2OgFyrmtRFBGwSRRpZnHLe4xVGSuf3IbdGnez4OZGe3h1qApozxN5e1lYC
	/+qptBbcYe003wGH5zoRo/8oOTBiUR9rtrJmplDLADTeF+XAh3Y4QrUhgqGxs6UDa1kg
	JCyBa/jR5qlOXzQ/R4xwpgkMzF4DErTWFH1Yu/PKcKShdyWqO4d1BCOSZQ/P+GYbxnKf
	JarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JWnW5f3egfnHgkYIjjxdw6QVjKNTGuk3+g/kTcchLmM=;
	b=au8ex2aaRXaft3uCMU2JewyxM9UBaeZzl4QwYjQ0TUJMm30jEbrMf2hPBgXO6/ZA55
	42xSAypqxgvbeJUbWrtFszhoXq3SVCdUy1aL9nJ1b/abp3kLRoDGy1vpZNJr3wTqqc0N
	wjgS6jJi4ChUxhOFG48BxnCZwIsKiS4qYkk6d2AebVYBSrvlN326XAYWSLs2NeiB577B
	1Ypi5sLMKQogr6jCPR6x/g89UnjOuAMd+0eAa2CNUGxXokPBH3DtBsSGzqdsWmlxUAK2
	6R6YNOumzanWGgBiCZid6yept682oHZtx2UUdE7gvWfAGj4aP9XSw0KuYBfeq6lLxxQf
	pdMg==
X-Gm-Message-State: ALKqPwc4lM9fBDWfP1+24amvU92L7dWouBid84WGtX20p1PZU/OOJgBQ
	SqFKKrDN+Jd8kX0D5bZHTxJZAw==
X-Google-Smtp-Source: AB8JxZqM/S3B3MSxJLN3q2Dk/cL2FvBwnS/s0PyuQU3r/ApoRvTTihXBPQVDwp+jdVf48ZlUmSb+Ag==
X-Received: by 2002:a17:902:680c:: with SMTP id
	h12-v6mr20942642plk.113.1526910089437; 
	Mon, 21 May 2018 06:41:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	f29-v6sm31287446pff.169.2018.05.21.06.41.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 06:41:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2018 06:41:20 -0700
Message-Id: <20180521134121.27759-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH 1/2] smartmontools: Fix build on non-GNU systems
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
X-List-Received-Date: Mon, 21 May 2018 13:41:29 -0000

Fix a typo in description
Rest of Formatting changes are introduced by devtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-realpath-BSD-POSIX-instead-of-canon.patch | 28 +++++++++++++++++++
 .../smartmontools/smartmontools_6.6.bb        | 13 +++++----
 2 files changed, 35 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch

diff --git a/meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch b/meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch
new file mode 100644
index 0000000000..91e64d2178
--- /dev/null
+++ b/meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch
@@ -0,0 +1,28 @@
+From f28aa188e5b0ea85369febe657b8807b8025038b Mon Sep 17 00:00:00 2001
+From: chrfranke <authors@smartmontools.org>
+Date: Wed, 8 Nov 2017 06:15:50 +0000
+Subject: [PATCH] os_linux.cpp: Use 'realpath()' (BSD, POSIX) instead of
+ 'canonicalize_file_name()' (GNU extension). This fixes build on systems with
+ musl libc (#921).
+
+git-svn-id: http://svn.code.sf.net/p/smartmontools/code/trunk@4603 4ea69e1a-61f1-4043-bf83-b5c94c648137
+
+Upstream-Status: Backport [https://www.smartmontools.org/ticket/921]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ os_linux.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os_linux.cpp b/os_linux.cpp
+index 134d5bc..935f9c7 100644
+--- a/os_linux.cpp
++++ b/os_linux.cpp
+@@ -3176,7 +3176,7 @@ static bool is_hpsa(const char * name)
+ {
+   char path[128];
+   snprintf(path, sizeof(path), "/sys/block/%s/device", name);
+-  char * syshostpath = canonicalize_file_name(path);
++  char * syshostpath = realpath(name, (char *)0);
+   if (!syshostpath)
+     return false;
+ 
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
index 1a1767e11f..c77c10551a 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Control and monitor storage systems using S.M.A.R.T"
-DESCRIPTION = \
-"The smartmontools package contains two utility programs (smartctl \
+DESCRIPTION = "\
+The smartmontools package contains two utility programs (smartctl \
 and smartd) to control and monitor storage systems using the Self-\
 Monitoring, Analysis and Reporting Technology System (SMART) built \
 into most modern ATA and SCSI hard disks. In many cases, these \
@@ -13,10 +13,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
-    file://initd.smartd \
-    file://smartmontools.default \
-    file://smartd.service \
-"
+           file://initd.smartd \
+           file://smartmontools.default \
+           file://smartd.service \
+           file://0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch \
+           "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)}"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
-- 
2.17.0


