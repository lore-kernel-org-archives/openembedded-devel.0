Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr8-0001JL-E7
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181054eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=bQQdTDsxgTMlMNQSGp9LNafpY9y/JNlil7NClSFOYWI=;
	b=T2d8aCO4Jr5mNfeLItN1GJseaJoQIby9F1CJBRM9F3Ej8Qw/Bw9p7q7kx4Wa0b8wpi
	01fr2cHcL41wuznVU1/lQBzuyChAIDf1YKbo4m1Tx+ZGYZp/xDaVvxBU/4WONXk9x8Xe
	D2pUj0Ye2lR262UWkmFvENrtIU+TKhqEYMAbU=
Received: by 10.14.17.28 with SMTP id i28mr802246eei.126.1328627598420;
	Tue, 07 Feb 2012 07:13:18 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:50 +0100
Message-Id: <1328627573-5217-25-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 24/27] ntp: add native systemd support for ntpdate / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb |   14 +++-----------
 1 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index 063d82a..64c5726 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -1,11 +1,12 @@
 require ntp.inc
 
-PR = "r4"
+PR = "r5"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_PACKAGES = "${PN}-systemd ntpdate-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
+SYSTEMD_SERVICE_ntpdate-systemd = "ntpdate.service"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
         file://tickadj.c.patch \
@@ -28,17 +29,8 @@ do_install_append() {
 	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
-
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/ntpd.service ${D}${base_libdir}/systemd/system/
 }
 
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
-RDEPENDS_${PN}-systemd = "${PN}"
-
 FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
 FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
 FILES_${PN}-tickadj = "${bindir}/tickadj"
-- 
1.7.6.4



