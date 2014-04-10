Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C99FE65E5E
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:54:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A2shPZ025099
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 19:54:43 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 9 Apr 2014 19:54:43 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2014 10:54:33 +0800
Message-ID: <1397098475-17901-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
References: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/3] smartmontools: update to 6.2
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
X-List-Received-Date: Thu, 10 Apr 2014 02:54:45 -0000
Content-Type: text/plain

Update smartmontools for 6.1 to 6.2. Add description as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{smartmontools_6.1.bb => smartmontools_6.2.bb}         | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.1.bb => smartmontools_6.2.bb} (39%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
similarity index 39%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
index d38ae8a..83ff028 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
@@ -1,13 +1,21 @@
-SECTION = "console/utils"
 SUMMARY = "Control and monitor storage systems using S.M.A.R.T"
+DESCRIPTION = \
+"The smartmontools package contains two utility programs (smartctl \
+and smartd) to control and monitor storage systems using the Self-\
+Monitoring, Analysis and Reporting Technology System (SMART) built \
+into most modern ATA and SCSI hard disks. In many cases, these \
+utilities will provide advanced warning of disk degradation and failure."
+
 HOMEPAGE = "http://smartmontools.sourceforge.net/"
+SECTION = "console/utils"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz"
-SRC_URI[md5sum] = "83a3a681f8183ed858392d550ae1cca6"
-SRC_URI[sha256sum] = "a9003b8bccc82682f658ce76d70edb1842411e51dc56d4cd6b56618da1d9ce07"
+
+SRC_URI[md5sum] = "d44f84081a12cef79cd17f78044351fc"
+SRC_URI[sha256sum] = "486f660579bb0fb4f6b927ded7531cb1f99685c666397377761c5b04dd96065b"
 
 inherit autotools
 
-- 
1.8.4


