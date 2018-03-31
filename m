Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9B20E746AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 19:21:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id m68so7440935pfm.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iYq6Ap7PCRPUcQ254kZouew3qxbMXgT8xSQ4QUmrBxU=;
	b=Eib6L4kr58EvX0ik88icV4a+ctfeV89pPK1yB3dmeIW9cEbKymQo6yydpnuPpqcFGZ
	d3OH1+wMcEX+84A4ZY9rtx6PysHozg/vsuPzkkJdHyTRn7jJZnsjpUwvkRv4xA8wjDhK
	If8A6YHnoEoZ8eiyYU+veZiKLRyqy7WcEZIpVhHkxrMPPn5T5DfZBGiMhG/TBgaM+eoC
	NJh1/WDR8mthQa45WzZwXyO5ytWWtVGGOA+t/ik0w4PDPezkUaXkPlFRVj+ermotMRYo
	g8GD5m5oQvmDMfJIK1LiMO/CweE6n7sHlgUxasVXL5JHDumozsUJyjo2rFgNL4SiMv0Y
	cZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iYq6Ap7PCRPUcQ254kZouew3qxbMXgT8xSQ4QUmrBxU=;
	b=gOPILWl2i861VIUcjQ9PHRhcuouwoXdQU7+Ic348l1OnGSRNJGxPvPXPORtvq0vIay
	aQdMXLI6ktpTVgGCgwD/4Oj85MAaxDhGftrEBOnAtgXkX6z3LcEjpSbxP3bFXtVoJWRz
	ZMeojQqZi9QJ+uNciG+QSltVVWit6DYqxWQqkdexC5pkrwrWh/90Z9gol5Jru9J7vKJC
	U5X3XPtP7rqj+YhiAOIVjS41P01LRONvd8zc7e59Kaowvi9EqDLfmWcc/B4TDX9yu2JG
	HfioRaMqzMhSbZGVsMNvasoQDW9VXgz1dfxiC6LvzbQzgpY98k9clkVs98jfTh03lhe3
	4Cag==
X-Gm-Message-State: AElRT7FKdC23qD1AXd735gqr9hQgGeCugeBzzJGiSSBemG5LIBPqmv2j
	ndE2cZnFWz3RnkLmK4B/l97PWw==
X-Google-Smtp-Source: AIpwx4+ov9VFZb+9HkRSJDur84Wv5yo+NPiYxu3Yfpa49QjjoTAMgQ/OgPQYqW3EueNUXOfvNmT4lg==
X-Received: by 2002:a17:902:85:: with SMTP id
	a5-v6mr3875101pla.99.1522524072145; 
	Sat, 31 Mar 2018 12:21:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	y18sm21207015pfe.67.2018.03.31.12.21.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 31 Mar 2018 12:21:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Mar 2018 12:21:03 -0700
Message-Id: <20180331192103.25983-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [meta-oe][PATCH] glibmm: Backport patch to fix invalid code in glibmm/threads.h
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
X-List-Received-Date: Sat, 31 Mar 2018 19:21:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Glib-Threads-Private-Fix-gobj.patch       | 40 ++++++++++++++++++++++
 meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
new file mode 100644
index 000000000..7899022f1
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
@@ -0,0 +1,40 @@
+From 838fe84c2ddcc9af51c34f751defbf3dd0ba8a06 Mon Sep 17 00:00:00 2001
+From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
+Date: Wed, 20 Dec 2017 20:00:32 +0100
+Subject: [PATCH] Glib::Threads::Private: Fix gobj()
+
+Bug 791711
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/GNOME/glibmm/commit/37d57ae9572b7d74aa385a30313eceae7f2d3fce]
+ glib/glibmm/threads.h | 2 +-
+ glib/src/threads.hg   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/glibmm/threads.h b/glib/glibmm/threads.h
+index f7e2b82a..2c0cbe8c 100644
+--- a/glib/glibmm/threads.h
++++ b/glib/glibmm/threads.h
+@@ -657,7 +657,7 @@ public:
+    */
+   inline void replace(T* data);
+ 
+-  GPrivate* gobj() { return gobject_; }
++  GPrivate* gobj() { return &gobject_; }
+ 
+ private:
+   GPrivate gobject_;
+diff --git a/glib/src/threads.hg b/glib/src/threads.hg
+index 86d7a17b..c82a6130 100644
+--- a/glib/src/threads.hg
++++ b/glib/src/threads.hg
+@@ -628,7 +628,7 @@ public:
+    */
+   inline void replace(T* data);
+ 
+-  GPrivate* gobj() { return gobject_; }
++  GPrivate* gobj() { return &gobject_; }
+ 
+ private:
+   GPrivate gobject_;
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
index 3a69a7057..4706432ab 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
@@ -13,6 +13,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
+    file://0001-Glib-Threads-Private-Fix-gobj.patch \
 "
 SRC_URI[md5sum] = "dee5ebe309f5976c3dacfcf5c43a062b"
 SRC_URI[sha256sum] = "7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b4be5b38802bf6a4a"
-- 
2.16.3


