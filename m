Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 649296AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 07:52:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB57qhG2011650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Dec 2016 23:52:43 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 4 Dec 2016 23:52:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Dec 2016 02:52:41 -0500
Message-ID: <1480924361-21264-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1480840457-169896-1-git-send-email-hongxu.jia@windriver.com>
References: <1480840457-169896-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] iscsi-initiator-utils: fix invoking 32bit "iscsiadm -m node" failed in 64bit kernel
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
X-List-Received-Date: Mon, 05 Dec 2016 07:52:44 -0000
Content-Type: text/plain

Take struct iscsi_uevent *ev for example:
In 64bit kernel : sizeof(ev->u): 24, sizeof(ev->r): 16,
but in 32bit iscsid: sizeof(ev->u): 20, sizeof(ev->r): 16.

While invoking 32bit "iscsiadm -m node" in 64bit kernel,
we should force ev->u 8byte aligned.

For "64bit iscsiadm + 64bit kernel" or "32bit iscsiadm + 32bit kernel",
they do not need the fix, so conditionally align by the definition
of macro MULTILIB. (MLPREFIX is not NULL means multilib).

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...g-32bit-iscsiadm-m-node-failed-in-64bit-k.patch | 37 ++++++++++++++++++++++
 .../iscsi-initiator-utils_2.0-873.bb               |  2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch
new file mode 100644
index 0000000..9bdb56f
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch
@@ -0,0 +1,37 @@
+From 153c61722a95f8d0f0ada8aec96d2e3c84b40a78 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 5 Dec 2016 02:24:12 -0500
+Subject: [PATCH] fix invoking 32bit "iscsiadm -m node" failed in 64bit kernel
+
+In 64bit kernel : sizeof(ev->u): 24, sizeof(ev->r): 16,
+but in 32bit iscsid: sizeof(ev->u): 20, sizeof(ev->r): 16.
+
+While invoking 32bit "iscsiadm -m node" in 64bit kernel,
+we should force ev->u 8byte aligned.
+
+Upstream-Status: Inappropriate [upstream does not support multilib]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ include/iscsi_if.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/iscsi_if.h b/include/iscsi_if.h
+index dad9fd8..bc68242 100644
+--- a/include/iscsi_if.h
++++ b/include/iscsi_if.h
+@@ -219,7 +219,11 @@ struct iscsi_uevent {
+ 			uint32_t	host_no;
+ 			uint16_t	chap_tbl_idx;
+ 		} delete_chap;
++#ifdef MULTILIB
++	} __attribute__ ((aligned (sizeof(uint64_t)))) u;
++#else
+ 	} u;
++#endif
+ 	union {
+ 		/* messages k -> u */
+ 		int			retcode;
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
index 4b13155..fd5961d 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
+           file://fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch \
 "
 SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
 SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
@@ -37,6 +38,7 @@ do_configure () {
      ./configure --host=${TARGET_SYS} --build=${BUILD_SYS} --with-security=no )
 }
 
+CFLAGS += "${@base_conditional('MLPREFIX', '', '','-DMULTILIB', d)}"
 do_compile () {
     #make iscsistart one of PROGRAMS if install_user in do_install
     #sed -i -e '/^PROGRAMS = /s;$; usr/iscsistart;' Makefile
-- 
2.8.1


