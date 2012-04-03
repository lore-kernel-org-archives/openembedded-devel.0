Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SF5hr-0004f5-8o
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2012 17:31:39 +0200
Received: by wibhj13 with SMTP id hj13so3373384wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2012 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=X/LNLCMGTOMwCW0e2eLHpm5ATX4kYSHW9qvSauvQFRM=;
	b=RFkSNTuusk2QKzSpO3HgO+9xLs4C+NmV+Q/A8XlR9tUBniV0sH85F/1fANZeyC7Yv9
	ATF94H654Pbrn8Hgl5WA0b1PgvpdLLLBaK51TqyfqllgIDuY4Q08ooFKeNAvuTmBAgCk
	LSqHVXlgmt7NV4m2aqrDtNQCicW8M8XEquMAdqrj6zBLwbXf83XE6x+LUq7hiAO/V/zX
	7F/c1fwFC/p5qNp4IzuiDbWy71wRV6KHMMG739y48bwa87YD2627VEuRafwRxrmLCpDL
	BcXfx4NcaCpQBXTmHSqtcD8lDvISUy2TIp/U0QK0BD7TuZFcZkCPMsTWlchKh05eQl1O
	zauQ==
Received: by 10.180.92.228 with SMTP id cp4mr7445205wib.2.1333466550105;
	Tue, 03 Apr 2012 08:22:30 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm43563380wia.11.2012.04.03.08.22.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Apr 2012 08:22:27 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2012 17:22:16 +0200
Message-Id: <1333466536-3582-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] [meta-oe, v2] mysql5: Fix QA warnings, move .a files to staticdev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 15:31:39 -0000

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 865deb2..9699dec 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -78,8 +78,8 @@ pkg_postrm_mysql5-server () {
 }
 
 PACKAGES = "${PN}-dbg ${PN} \
-libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-dbg \
-libmysqlclient libmysqlclient-dev libmysqlclient-dbg \
+libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysqlclient-r-dbg \
+libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclient-dbg \
 ${PN}-client ${PN}-server ${PN}-leftovers"
 CONFFILES_${PN}-server += "${sysconfdir}/my.cnf"
 
@@ -87,18 +87,28 @@ FILES_${PN} = " "
 RDEPENDS_${PN} = "${PN}-client ${PN}-server"
 ALLOW_EMPTY_${PN} = "1"
 
-FILES_libmysqlclient = "${libdir}/libmysqlclient.so.*"
+FILES_libmysqlclient = "\
+${libdir}/libmysqlclient.so.* \
+${libdir}/plugin/*.so.*"
 FILES_libmysqlclient-dev = " \
 ${includedir}/mysql/ \
-${libdir}/lib* \
-${libdir}/plugin/* \
+${libdir}/libmysqlclient.so \
+${libdir}/libmysqlclient.la \
+${libdir}/plugin/*.so \
+${libdir}/plugin/*.la \
 ${sysconfdir}/aclocal \
 ${bindir}/mysql_config"
+FILES_libmysqlclient-staticdev = "\
+${libdir}/*.a \
+${libdir}/plugin/*.a"
 FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \
 /usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
 
 FILES_libmysqlclient-r = "${libdir}/libmysqlclient_r.so.*"
-FILES_libmysqlclient-r-dev = "${libdir}/libmysqlclient_r.*"
+FILES_libmysqlclient-r-dev = "\
+${libdir}/libmysqlclient_r.so \
+${libdir}/libmysqlclient_r.la"
+FILES_libmysqlclient-r-staticdev = "${libdir}/libmysqlclient_r.a"
 FILES_libmysqlclient-r-dbg = "${libdir}/plugin/.debuglibmysqlclient_r.so.*"
 
 FILES_${PN}-client = "\
-- 
1.7.5.4



