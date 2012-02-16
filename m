Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlz-00063p-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:40 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Wyyqq1fe2MtYLobS9ILrf20FSTSOTW2HyzBr4BrpwH8=;
	b=L0PjE2Uop6bOPKMEduHkIxlHdTaIzxaKPzqZgBqd0kuA68LIvLHxsxNoUsAKFipmH3
	sbXl0K1fcwl359VQLMc+JovtWZBak5Mk9owX080eMhQGICeBAqcmQgSuUkqOyUcSuQBU
	BMYlUlhmgfnGK7PiHI0Lk962qT7OSHFQBmZDs=
Received: by 10.14.202.130 with SMTP id d2mr328715eeo.83.1329357629791;
	Wed, 15 Feb 2012 18:00:29 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:05 +0100
Message-Id: <1329357796-27398-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 11/22] elsa: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:40 -0000
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
1.7.4.4



