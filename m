Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0B4665D3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 08:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9N8TCnP019607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 01:29:13 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 01:29:12 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Oct 2014 16:29:14 +0800
Message-ID: <1414052955-30856-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1414052955-30856-1-git-send-email-rongqing.li@windriver.com>
References: <1414052955-30856-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/3] modphp: Security Advisory - php - CVE-2014-3587
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
X-List-Received-Date: Thu, 23 Oct 2014 08:29:19 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Integer overflow in the cdf_read_property_info function in cdf.c in file
through 5.19, as used in the Fileinfo component in PHP before 5.4.32 and
5.5.x before 5.5.16, allows remote attackers to cause a denial of
service (application crash) via a crafted CDF file. NOTE: this
vulnerability exists because of an incomplete fix for CVE-2012-1571.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3587

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../modphp/files/php-CVE-2014-3587.patch           |   31 ++++++++++++++++++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch

diff --git a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch b/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch
new file mode 100644
index 0000000..e1c40f2
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch
@@ -0,0 +1,31 @@
+modphp: Security Advisory - php - CVE-2014-3587
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+From 7ba1409a1aee5925180de546057ddd84ff267947 Mon Sep 17 00:00:00 2001
+From: Remi Collet <rcollet@redhat.com>
+Date: Thu, 14 Aug 2014 17:19:03 -0700
+Subject: [PATCH] Fix bug #67716 - Segfault in cdf.c
+
+---
+ ext/fileinfo/libmagic/cdf.c |    2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/ext/fileinfo/libmagic/cdf.c b/ext/fileinfo/libmagic/cdf.c
+index 429f3b9..2c0a2d9 100644
+--- a/ext/fileinfo/libmagic/cdf.c
++++ b/ext/fileinfo/libmagic/cdf.c
+@@ -820,7 +820,7 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 		q = (const uint8_t *)(const void *)
+ 		    ((const char *)(const void *)p + ofs
+ 		    - 2 * sizeof(uint32_t));
+-		if (q > e) {
++		if (q < p || q > e) {
+ 			DPRINTF(("Ran of the end %p > %p\n", q, e));
+ 			goto out;
+ 		}
+-- 
+1.7.9.5
+
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 4f14607..3716f74 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -10,6 +10,7 @@ SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://70_mod_php5.conf \
            file://0001-using-pkgconfig-to-check-libxml.patch \
            file://php-CVE-2014-5120.patch \
+           file://php-CVE-2014-3587.patch \
 "
 
 S = "${WORKDIR}/php-${PV}"
-- 
1.7.10.4


