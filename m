Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdq-0004lK-BN
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:22 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506553eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.28.140 as permitted sender)
	client-ip=10.14.28.140; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.28.140 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.28.140])
	by 10.14.28.140 with SMTP id g12mr694824eea.85.1329999063389 (num_hops
	= 1); Thu, 23 Feb 2012 04:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tlBaDrEc+EghFAOtYQry2fhjs0Rl8FtxzwfJpq0KwUQ=;
	b=BWxODA0BkfFJUH+DMopvAqOhDDaU+syOauzF8wt2VIzETDAm8ucRxfB4DGP9ElX4vO
	gJScSPFJdMZWH+ltY/fLlWbUz5i1yLBCsQyrHe6Ire8qYRpn5lcPdWOHjwzUb/Mzi5NC
	mP/CDtCPm1OnjgyJS4u5w+Kf6B3SO/NqYa+vI=
Received: by 10.14.28.140 with SMTP id g12mr546463eea.85.1329999063311;
	Thu, 23 Feb 2012 04:11:03 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:47 +0100
Message-Id: <1329999054-23112-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 16/23] atftp: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/atftp/atftp_0.7.bb |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
index ab14a28..6bd44a0 100644
--- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
+++ b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
@@ -3,7 +3,7 @@ SECTION = "network"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \
@@ -29,23 +29,17 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
 
-    install -d ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/atftpd.service ${D}${base_libdir}/systemd/system
-
     install -d ${D}/srv/tftp
 
     rm ${D}${sbindir}/in.tftpd
 }
 
-PACKAGES =+ "atftpd-systemd atftpd"
+PACKAGES =+ "atftpd"
 
 FILES_${PN} = "${bindir}/*"
 
 FILES_${PN}d = "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
 
-FILES_atftpd-systemd += "${base_libdir}/systemd"
-RDEPENDS_atftpd-systemd += "atftpd"
-
 SRC_URI[archive.md5sum] = "aa269044a6f992eca78fee2f6119643c"
 SRC_URI[archive.sha256sum] = "18815f5b67290fac087c6b9da28dfa5e0feb722096f5c5de52e59b46026da559"
 SRC_URI[patch.md5sum] = "1636f199bf32c754a7bf34a5c647d138"
-- 
1.7.6.4



