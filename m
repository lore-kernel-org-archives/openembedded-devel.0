Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9995965D3E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:25:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6P4IL016482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:25:04 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 20 Apr 2014 23:25:04 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 14:24:50 +0800
Message-ID: <1398061492-31615-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
References: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 2/4] quagga: fix CVE-2013-6051
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Apr 2014 06:25:04 -0000
Content-Type: text/plain

Backport patch to fix CVE-2013-6051.

Signed-off-by: Hu <yadi.hu@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../quagga/files/quagga-fix-CVE-2013-6051.patch    | 29 ++++++++++++++++++++++
 .../recipes-protocols/quagga/quagga.inc            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch b/meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch
new file mode 100644
index 0000000..fde9e0c
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch
@@ -0,0 +1,29 @@
+
+From 8794e8d229dc9fe29ea31424883433d4880ef408
+From: Paul Jakma <paul@quagga.net>
+Date: Mon, 13 Feb 2012 13:53:07 +0000
+Subject: bgpd: Fix regression in args consolidation, total should be inited from args
+
+bgpd: Fix regression in args consolidation, total should be inited from args
+
+* bgp_attr.c: (bgp_attr_unknown) total should be initialised from the args.
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 65af824..839f64d 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+
+@@ -1646,7 +1646,7 @@
+ static bgp_attr_parse_ret_t
+ bgp_attr_unknown (struct bgp_attr_parser_args *args)
+ {
+-  bgp_size_t total;
++  bgp_size_t total = args->total;
+   struct transit *transit;
+   struct attr_extra *attre;
+   struct peer *const peer = args->peer; 
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 65ff040..5e85e55 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -26,6 +26,7 @@ QUAGGASUBDIR = ""
 SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name=quagga-${PV} \
            file://fix-for-lib-inpath.patch \
            file://quagga-0.99.17-libcap.patch \
+           file://quagga-fix-CVE-2013-6051.patch \
            file://Zebra-sync-zebra-routing-table-with-the-kernel-one.patch \
            file://quagga.init \
            file://quagga.default \
-- 
1.8.4


