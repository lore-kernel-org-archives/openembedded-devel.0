Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6EED0601A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:01:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7C713CC029366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 00:01:04 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 12 Aug 2014 00:01:03 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 15:01:04 +0800
Message-ID: <1407826864-32606-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ifenslave: add recipes
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
X-List-Received-Date: Tue, 12 Aug 2014 07:01:07 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-support/ifenslave/ifenslave_1.1.0.bb    |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
new file mode 100644
index 0000000..d6252a9
--- /dev/null
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Configure network interfaces for parallel routing"
+DESCRIPTION = "Configure network interfaces for parallel routing"
+HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bonding"
+SECTION = "network"
+LICENSE = "GPLv2"
+
+SRC_URI = "http://ftp.debian.org/debian/pool/main/i/${BPN}-2.6/${BPN}-2.6_${PV}.orig.tar.gz"
+
+do_compile() {
+    ${CC} ifenslave.c -o ifenslave
+}
+do_install() {
+    install -d "${D}${sbindir}"
+    install -m 755 "${S}/ifenslave" "${D}${sbindir}/"
+}
+
+LIC_FILES_CHKSUM = "file://ifenslave.c;beginline=8;endline=12;md5=a9f0bd2324cdc1b36d1f44f0e643a62a"
+SRC_URI[md5sum] = "56126cd1013cefe0ce6f81613e677bdd"
+SRC_URI[sha256sum] = "7917bf34de80a2492eb225adf9168c83a4854ac8a008ed0fd5b3fd147ccd3041"
-- 
1.7.10.4


