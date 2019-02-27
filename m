Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 083E67CC10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:42:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R8gRFD012728
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 00:42:37 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 00:42:16 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Feb 2019 16:41:49 +0800
Message-ID: <1551256910-119653-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/4] openhpi: add PACKAGECONFIG disable-snmpbc
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
X-List-Received-Date: Wed, 27 Feb 2019 08:42:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index c4b3309..7b4ddec 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -64,6 +64,7 @@ PACKAGECONFIG ??= "libgcrypt non32bit"
 PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
 PACKAGECONFIG[libgcrypt] = "--enable-encryption,--disable-encryption,libgcrypt,"
 PACKAGECONFIG[non32bit] = "--enable-non32bit-int,--disable-non32bit-int,,"
+PACKAGECONFIG[disable-snmp-bc] = "--disable-snmp_bc,--enable-snmp_bc"
 
 export DISTRO
 
-- 
2.7.4


