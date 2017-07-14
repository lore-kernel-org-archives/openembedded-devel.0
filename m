Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id EB40D78152
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:39 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y129so9410919pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TEAogt7GPK74IvbDrpKSwUGsN5/mz2Ye/++MZxwAvQo=;
	b=T3rWetSa/GkmufwfdZDmpdy8AMOFTIbXasgJogJDSrDdDMEzMxuy41Ls+FPc5xqLog
	moNxuXl4KFUApIyKFEXqK5LAgxVjo061HCe6MRUPwkJzlnPnx2xhV1XWutY0f9oulPk7
	kuBoSYyU3pjAXjrkGmcKK7aDXsYYbXvUJhVijBulD3ndN41gkVjOuYbTQigWOkkbd/5E
	X2GAUXlwm7wKIsQiTUJEeTHvMKJ9S4vwkmDopSHFMCs8ms6GAFNMAA5bzGrBgFmI/aGN
	j3gKBWJuz12k7HRwKXi9pfIr//uVncEsfC7kK/d+TBslW3Fu27zJ7qJdAaQqqU3JesdZ
	EjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TEAogt7GPK74IvbDrpKSwUGsN5/mz2Ye/++MZxwAvQo=;
	b=UEAKP6xEbuf9NdK92MtIhyMsBjhvwEhVauJ1kv/Lo/p4oqs0sRzJUrgs1E44wem6Ge
	NrLeJOAuvIrBy7MISgmuMb1jPqKQ/hcJd//mQ2J4lUmZhAR0IupRR2Lq97IcGeU8rU2/
	QisSSoGOwm22tjsNFP1iH2S/JArSnYuCILDCmedj+N8AEkiYUpHbkP7m/h5yv5auucDd
	RBYuvVnsyLJIIeu9mSbfAKPVbMVp8QgyCZIVDj7J2cI/+ulxPxRnUtJBLekVL6y/EoR1
	rl/J29uwtBDdzH7IteBVEZ1k8KBjbW4LyvgtInmjySmzUyUawM31oHVUT4vpzRIlxO81
	LbtA==
X-Gm-Message-State: AIVw110Tpr3fezuDhIHzgDOm6PAZLaDdgNjh4Gm0qc0sn7eMSSKxTrwc
	2bDJMh1eWWfum9Rb
X-Received: by 10.98.148.25 with SMTP id m25mr3452235pfe.7.1500010841222;
	Thu, 13 Jul 2017 22:40:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:07 -0700
Message-Id: <20170714054013.34458-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 12/18] libgtop: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Include-libc-net-headers-unconditionally.patch | 46 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload-Include-libc-net-headers-unconditionally.patch

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload-Include-libc-net-headers-unconditionally.patch b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload-Include-libc-net-headers-unconditionally.patch
new file mode 100644
index 000000000..c4f7da4bf
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload-Include-libc-net-headers-unconditionally.patch
@@ -0,0 +1,46 @@
+From 3c6f70e50cb586ac4add4dea627c316242691040 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 09:17:29 -0700
+Subject: [PATCH] netload: Include libc net headers unconditionally
+
+This fixes compile with musl, and this conditional
+is not needed now a days if we are still using glibc < 1.0
+we have other bigger problems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux/netload.c | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/sysdeps/linux/netload.c b/sysdeps/linux/netload.c
+index c275db2..446bddd 100644
+--- a/sysdeps/linux/netload.c
++++ b/sysdeps/linux/netload.c
+@@ -34,8 +34,6 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ 
+-#if !defined (_LIBC) && defined (__GNU_LIBRARY__) && __GNU_LIBRARY__ > 1
+-/* GNU LibC */
+ #include <net/if.h>
+ #include <netinet/ip_icmp.h>
+ #include <netinet/in.h>
+@@ -43,15 +41,6 @@
+ #include <netinet/tcp.h>
+ #include <netinet/udp.h>
+ #include <net/if.h>
+-#else /* Libc 5 */
+-#include <linux/if.h>
+-#include <linux/in.h>
+-#include <linux/ip.h>
+-#include <linux/icmp.h>
+-#include <linux/tcp.h>
+-#include <linux/udp.h>
+-#endif
+-
+ 
+ #ifdef HAVE_IFADDRS_H
+ /* needed for IPV6 support */
+-- 
+2.13.2
+
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
index d79b9e5d4..946d11845 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
@@ -6,6 +6,9 @@ inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspectio
 # depends on libxau
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://0001-netload-Include-libc-net-headers-unconditionally.patch \
+           "
 SRC_URI[archive.md5sum] = "ee29a9ef60659ebf4b075ac281f71cb2"
 SRC_URI[archive.sha256sum] = "463bcbe5737b1b93f3345ee34abf601e8eb864f507c49ff1921c2737abafc1e5"
 
-- 
2.13.2


