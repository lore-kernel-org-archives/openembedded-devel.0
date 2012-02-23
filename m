Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdn-0004lM-LB
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:19 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so492439eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:00 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.127.5 as permitted sender)
	client-ip=10.14.127.5; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.127.5 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.127.5])
	by 10.14.127.5 with SMTP id c5mr759854eei.17.1329999060689 (num_hops =
	1); Thu, 23 Feb 2012 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Lm5ouAW0WHZeDsTo8lwhmd8d2goIlhzm6iVzw8myhSA=;
	b=ECatFWibz1wkD0fgFJ/MJLEyvFUwrUuIjCIE0/KTPYtJjiTvNc6QXsrY5dfbonPVEw
	X01G1bTmDluBZOCa+y9EbMy+/AOdqlPC5lIJCBT1S3LVcH+44/W76PABSeaUHAOQBX/V
	018ZON8jzTrBX3H0fJQodevE9r1jBEhskeqog=
Received: by 10.14.127.5 with SMTP id c5mr604825eei.17.1329999060596;
	Thu, 23 Feb 2012 04:11:00 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:44 +0100
Message-Id: <1329999054-23112-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 13/23] elsa: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
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



