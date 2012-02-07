Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqm-0001JL-3L
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:20:56 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181054eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=rSWrheULqskGpCWRau6pkLVZBlQfJQyhc9Qq9RTW5V4=;
	b=SEQmpJ/8jEi1gspklKlimd6tBahekMQuieiGi/oFvq0bCOWLTHEmjsboxwD/GGbgNt
	Z8mmM+Na4PkukAkcUDP/I6k8GNaJ0sC3ZLQufDdWQqD1ncdEHNruzEWxtghiszxBDna/
	VYIuGCz4/qgaZQhdeNTq3y52xbeHv+qpnMNmM=
Received: by 10.14.119.197 with SMTP id n45mr7070908eeh.72.1328627576073;
	Tue, 07 Feb 2012 07:12:56 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.12.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:12:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:30 +0100
Message-Id: <1328627573-5217-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 04/27] elsa: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:20:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index a079ec0..70b56bd 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -13,23 +13,14 @@ S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
 
-PR = "r4"
+PR = "r5"
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
-do_install_append() {
-        install -d ${D}${base_libdir}/systemd/system/
-        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${base_libdir}/systemd/system/xserver-nodm.service
-}
-
 inherit systemd
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "xserver-nodm.service"
 
-PACKAGES =+ "${PN}-systemd"
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-
 RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
 CONFFILES_${PN} += "${sysconfdir}/elsa.conf"
 RCONFLICTS_${PN} += "xserver-nodm-init"
-- 
1.7.6.4



