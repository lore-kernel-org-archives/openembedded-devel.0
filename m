Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF7E60116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 15:55:05 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2HFt6ja007689; Thu, 17 Mar 2016 10:55:06 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031710550634-1505753 ;
	Thu, 17 Mar 2016 10:55:06 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 17:54:34 +0200
Message-Id: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458230028.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/17/2016 10:55:06 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/17/2016 10:55:06 AM,
	Serialize complete at 03/17/2016 10:55:06 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-17_05:, , signatures=0
Subject: [meta-oe][PATCH v2 1/2] apache2: stage apachectl
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
X-List-Received-Date: Thu, 17 Mar 2016 15:55:09 -0000

Some apache module recipes like the newly introduced apache-websocket
also need apachectl at build in the sysroot besides apxs.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
index 597afe6..53d0564 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
@@ -113,6 +113,8 @@ SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
 apache_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
     install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -d ${SYSROOT_DESTDIR}${sbindir}/
+    install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}/
     sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
     sed -i 's!my $libtool = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
 
-- 
2.7.3


