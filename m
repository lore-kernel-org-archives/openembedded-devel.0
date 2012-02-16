Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm2-00063o-NL
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:42 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479834eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=u5QqFuSN3zO0nssJf++iRSPF5OIEwpfEuI0og420EXo=;
	b=tWlCaCXJxX0dUPb+1pBXA7lS6hSCQnDGm+jm0946+kx+uKdG2rarJMidnbqxWz3BoQ
	sIm3a/cwvOTJhEz0dBY3n4ylcG1+xnLqFikmgwvtuCkTX6S9cevEbA28h1Y9wG3FgAYz
	QWwFyxJIwmXyj0w/ZAG8ar4g36TBlyjK4Uo/k=
Received: by 10.14.28.199 with SMTP id g47mr360122eea.16.1329357632374;
	Wed, 15 Feb 2012 18:00:32 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:08 +0100
Message-Id: <1329357796-27398-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 14/22] atftp: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
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
1.7.4.4



