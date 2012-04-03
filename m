Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SF5Zi-0004Qm-KX
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2012 17:23:14 +0200
Received: by wera1 with SMTP id a1so2373889wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2012 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IUNrS3r9bnzN80sthuKEGgrpL0meizVziz8OB+DPP1Y=;
	b=VqCzGwZurl7wQO8qYwEz98HQFi/uZ2sZRjhe0uMSP0Qxrd7puj0BR8TFroc7FLbaN6
	i+ulUT5J4J1UVldLW4P3TL7dyUns+5OeoVOUlf6W1lCeH5xdGVZafITjfafCnMFyRfSa
	zAOzQCMYN5djx0Pt4q+Vts/d5ke4cxxKPjl29EGnDQvMpRKXGmAIVZR7GXaMA2cEtPDW
	DkeRQOMmYx9+8N6NJVonQ9okW77EtHut09+F8XfBdFsbW2CSfaIJJoKfo3ODSjaU3dOU
	uyofXadnxnD6CHarRbtrAzMJok17jzu93oqtbo59YdKUrPqCBLf6g9ey5p/mfTvYLvYS
	o2Qw==
Received: by 10.180.91.165 with SMTP id cf5mr37416087wib.2.1333466044991;
	Tue, 03 Apr 2012 08:14:04 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id fz9sm43522568wib.3.2012.04.03.08.14.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Apr 2012 08:14:04 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2012 17:13:51 +0200
Message-Id: <1333466031-3328-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] [meta-oe] mysql5: Fix QA warnings, move .a files to staticdev.
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
X-List-Received-Date: Tue, 03 Apr 2012 15:23:15 -0000

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc |   34 +++++++++++++++++++----
 1 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 865deb2..d436333 100644
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
 
@@ -87,18 +87,40 @@ FILES_${PN} = " "
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
+${libdir}/libmysqlclient.a \
+${libdir}/libmysys.a \
+${libdir}/libmyisam.a \
+${libdir}/libmysqld.a \
+${libdir}/libheap.a \
+${libdir}/libvio.a \
+${libdir}/libmystrings.a \
+${libdir}/libdbug.a \
+${libdir}/libmyisammrg.a \
+${libdir}/plugin/ha_innodb_plugin.a \
+${libdir}/plugin/ha_example.a \
+${libdir}/plugin/ha_blackhole.a \
+${libdir}/plugin/ha_federated.a \
+${libdir}/plugin/ha_archive.a"
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



