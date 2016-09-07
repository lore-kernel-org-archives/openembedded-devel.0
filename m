Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22A2C77769
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:34:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u879YID3032137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Sep 2016 02:34:19 -0700
Received: from obsrwr.corp.ad.wrs.com (128.224.124.162) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 02:34:18 -0700
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Sep 2016 12:34:11 +0300
Message-ID: <1473240851-11368-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Security Advisory - collectd - CVE-2016-6254
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
X-List-Received-Date: Wed, 07 Sep 2016 09:34:22 -0000
Content-Type: text/plain

Heap-based buffer overflow in the parse_packet function in network.c in
collectd before 5.4.3 and 5.x before 5.5.2 allows remote attackers to
cause a denial of service (daemon crash) or possibly execute arbitrary
code via a crafted network packet.

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 .../collectd/collectd/CVE-2016-6254.patch          | 55 ++++++++++++++++++++++
 .../recipes-extended/collectd/collectd_5.5.0.bb    |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch b/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch
new file mode 100644
index 0000000..bc85b4c
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/CVE-2016-6254.patch
@@ -0,0 +1,55 @@
+From dd8483a4beb6f61521d8b32c726523bbea21cd92 Mon Sep 17 00:00:00 2001
+From: Florian Forster <octo@collectd.org>
+Date: Tue, 19 Jul 2016 10:00:37 +0200
+Subject: [PATCH] network plugin: Fix heap overflow in parse_packet().
+
+Emilien Gaspar has identified a heap overflow in parse_packet(), the
+function used by the network plugin to parse incoming network packets.
+
+This is a vulnerability in collectd, though the scope is not clear at
+this point. At the very least specially crafted network packets can be
+used to crash the daemon. We can't rule out a potential remote code
+execution though.
+
+Fixes: CVE-2016-6254
+
+cherry picked from upstream commit b589096f
+
+Upstream Status: Backport
+
+Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
+---
+ src/network.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/network.c b/src/network.c
+index 551bd5c..cb979b2 100644
+--- a/src/network.c
++++ b/src/network.c
+@@ -1444,6 +1444,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
+ 				printed_ignore_warning = 1;
+ 			}
+ 			buffer = ((char *) buffer) + pkg_length;
++			buffer_size -= (size_t) pkg_length;
+ 			continue;
+ 		}
+ #endif /* HAVE_LIBGCRYPT */
+@@ -1471,6 +1472,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
+ 				printed_ignore_warning = 1;
+ 			}
+ 			buffer = ((char *) buffer) + pkg_length;
++			buffer_size -= (size_t) pkg_length;
+ 			continue;
+ 		}
+ #endif /* HAVE_LIBGCRYPT */
+@@ -1612,6 +1614,7 @@ static int parse_packet (sockent_t *se, /* {{{ */
+ 			DEBUG ("network plugin: parse_packet: Unknown part"
+ 					" type: 0x%04hx", pkg_type);
+ 			buffer = ((char *) buffer) + pkg_length;
++			buffer_size -= (size_t) pkg_length;
+ 		}
+ 	} /* while (buffer_size > sizeof (part_header_t)) */
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index d7ba5b7..34edecf 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://collectd.service \
            file://0001-conditionally-check-libvirt.patch \
            file://0001-collectd-replace-deprecated-readdir_r-with-readdir.patch \
+           file://CVE-2016-6254.patch \
 "
 SRC_URI[md5sum] = "c39305ef5514b44238b0d31f77e29e6a"
 SRC_URI[sha256sum] = "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88"
-- 
2.7.4


