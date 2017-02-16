Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFA5160557
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 08:10:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1G8AjiK004439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 00:10:45 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 16 Feb 2017 00:10:44 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 16:04:37 +0800
Message-ID: <20170216080438.31466-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] inetutils: update files for -dbg packages
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
X-List-Received-Date: Thu, 16 Feb 2017 08:10:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

All .debug directories are packaged in inetutils-rshd-dbg which caused
by AUTOPACKAGEDEBUG. Disable it and split .debug directories and files
to right -dbg package.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index a8c40254b..68e914c40 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -104,7 +104,8 @@ ${PN}-rsh ${PN}-rshd"
 # provided by netkit, so add the corresponding -dbg packages
 # for them to avoid the confliction between the dbg package
 # of inetutils and netkit.
-PACKAGES += "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
+PACKAGES =+ "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
+NOAUTOPACKAGEDEBUG = "1"
 
 ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_${PN} = "talk whois"
@@ -153,6 +154,7 @@ ALTERNATIVE_${PN}-ping6 = "${@bb.utils.contains('PACKAGECONFIG', 'ping6', 'ping6
 ALTERNATIVE_LINK_NAME[ping6]  = "${base_bindir}/ping6"
 
 
+FILES_${PN}-dbg += "${base_bindir}/.debug ${base_sbindir}/.debug ${bindir}/.debug ${sbindir}/.debug"
 FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
 FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
 FILES_${PN}-hostname = "${base_bindir}/hostname.${BPN}"
-- 
2.11.0


