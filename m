Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 915E97CCD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:42:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1S5gURV012429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 21:42:40 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 21:42:19 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Feb 2019 13:42:13 +0800
Message-ID: <1551332535-158589-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551332535-158589-1-git-send-email-changqing.li@windriver.com>
References: <CAMKF1srJuJQ8UHr1AAGgNYXi24MrfgTZA3KOfnoOjbWXVVq2JA@mail.gmail.com>
	<1551332535-158589-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/4 V2] openhpi: Add PACKAGECONFIG snmp-bc
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
X-List-Received-Date: Thu, 28 Feb 2019 05:42:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index c4b3309..ca9130d 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -60,10 +60,11 @@ FILES_${PN}-libs = "${libdir}/${BPN}/*.so /usr/lib/${BPN}/*.so"
 INSANE_SKIP_${PN}-libs = "dev-so"
 RDEPENDS_${PN} += "${PN}-libs"
 
-PACKAGECONFIG ??= "libgcrypt non32bit"
+PACKAGECONFIG ??= "libgcrypt non32bit snmp-bc"
 PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
 PACKAGECONFIG[libgcrypt] = "--enable-encryption,--disable-encryption,libgcrypt,"
 PACKAGECONFIG[non32bit] = "--enable-non32bit-int,--disable-non32bit-int,,"
+PACKAGECONFIG[snmp-bc] = "--enable-snmp_bc,--disable-snmp_bc"
 
 export DISTRO
 
-- 
2.7.4


