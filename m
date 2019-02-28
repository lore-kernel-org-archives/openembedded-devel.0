Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8A07C4BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 08:17:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1S8HKFa016607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 00:17:30 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Thu, 28 Feb 2019 00:17:09 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Feb 2019 16:17:08 +0800
Message-ID: <1551341828-451293-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551332535-158589-1-git-send-email-changqing.li@windriver.com>
References: <1551332535-158589-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/4 V2] net-snmp: Add PACKAGECONFIG des
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
X-List-Received-Date: Thu, 28 Feb 2019 08:17:40 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index e1c780b..f6ab73a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
            file://reproducibility-accept-configure-options-from-env.patch \
+           file://0001-net-snmp-fix-compile-error-disable-des.patch \
            "
 SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
 SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
@@ -42,15 +43,16 @@ CCACHE = ""
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-PACKAGECONFIG ??= ""
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}, des"
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
 PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
 
 PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no,\
                        perl, perl perl-lib"
+PACKAGECONFIG[des] = "--enable-des,--disable-des"
 
 EXTRA_OECONF = "--enable-shared \
                 --disable-manuals \
-- 
2.7.4


