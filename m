Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdiUs-00039s-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 14:15:46 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so5542552yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=+FVdtU9U8ryrERqKAkHJq6jZMf0UXWI/QZUlBoixO3E=;
	b=nYhbVaa1uS7m0LQrYghI4HFfdXc9Ckt6z7om0wgDgTsRQZCn1HLySycQ9FaiyhiLxT
	HrpnAS46hZ/CBN60LObXm/IL2cz9UUHKjtrmIxQOrGluy2H5WfL5qnCglqdp6obHXGNC
	T55w3OJNbmoNegWUB4Lu9xG0ZB7Dc+9JC5IBA=
Received: by 10.236.161.103 with SMTP id v67mr14587857yhk.87.1324559322689;
	Thu, 22 Dec 2011 05:08:42 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm14603838yhk.1.2011.12.22.05.08.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:08:41 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2011 13:08:23 +0000
Message-Id: <06703197a0e4b89243cacc36ac59cdb88992b9ca.1324559278.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324559278.git.otavio@ossystems.com.br>
References: <cover.1324559278.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324559278.git.otavio@ossystems.com.br>
References: <cover.1324559278.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/3] rsyslog: move systemd support to rsyslog-systemd
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
X-List-Received-Date: Thu, 22 Dec 2011 13:15:46 -0000

This makes the package consistent with others supporting systemd and
also cleans up the recipe using the systemd.bbclass.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc |   23 ++++++++---------------
 1 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index 856d965..ea7fa22 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -4,32 +4,25 @@ HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
            
 
-inherit autotools
+inherit autotools systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/${PN}
         install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
 }
 
+PACKAGES =+ "${PN}-systemd"
 
-pkg_postinst_${PN} () {
-	if test "x$D" != "x"; then
-		exit 1
-	fi
-	systemctl enable rsyslog.service
-}
-
-pkg_prerm_${PN} () {
-	systemctl disable rsyslog.service
-}
-
-RRECOMMENDS_${PN} += "systemd"
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
-FILES_${PN} += "${base_libdir}/systemd"
 
+FILES_${PN}-systemd += "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "${PN}"
-- 
1.7.2.5



