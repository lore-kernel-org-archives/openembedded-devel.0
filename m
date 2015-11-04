Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A4A0E77115
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:34 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so257926wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=uzYSpSz+nA0pA7LbnYHF9PT+sFdYa2KFAvctZasMvYM=;
	b=LalF5wBZ0hz1UdXhBwN3AfV1YUux+xa+Ft7AQShDNU9fPU6u/C26ZjlzQu3piYONOv
	zlHB+a0TOizkuIB5c2Tqz6E8RNUAHZW9yzf5yK2GNvTWWfv8gFiTyTqnagYUbbM7fkKV
	7hNx/DLUjDv1I2uj/aTYkMm5MvFEsexgjN0k0tkCqO+vC2N++rKQmGwFVKH9CdJRnWAK
	M68cuXryUaMr42xjNvDigwecsmNDvrzjbTzsb04oLaYwFsxhTq1cv43/3tpfnGzDGIS0
	NyKoDfpO+fbK5y3faCEXaGc4vgG1DaCgFX1O//++nTsZyBT+jy+VcLT2YBUkZ8LrApdx
	juCA==
X-Received: by 10.28.174.130 with SMTP id x124mr6891719wme.12.1446680674337;
	Wed, 04 Nov 2015 15:44:34 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:44:00 +0100
Message-Id: <1446680640-31722-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 18/18] samba: install pam libraries to base_libdir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Nov 2015 23:44:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

that's where libpam installs libraries and expects them

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
index 03b4f75..ca0f241 100644
--- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
@@ -63,7 +63,7 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=${localstatedir}/run \
                  --with-sockets-dir=${localstatedir}/run/samba \
                  --with-modulesdir=${libdir}/samba \
-                 --with-pammodulesdir=${libdir}/security \
+                 --with-pammodulesdir=${base_libdir}/security \
                  --with-lockdir=${localstatedir}/lib/samba \
                  --with-cachedir=${localstatedir}/lib/samba \
                  --with-perl-lib-install-dir=${PERL_VERNDORLIB} \
@@ -113,7 +113,7 @@ do_install_append() {
 PACKAGES += "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg libwinbind-krb5-locator"
 
 FILES_${PN} += "/run \
-                ${libdir}/security/pam_smbpass.so \
+                ${base_libdir}/security/pam_smbpass.so \
                 ${libdir}/tmpfiles.d/* \
                "
 
@@ -126,12 +126,12 @@ FILES_${PN}-dbg += "${libdir}/samba/idmap/.debug/* \
                     ${libdir}/samba/nss_info/.debug/* \
                     ${libdir}/samba/ldb/.debug/* \
                     ${libdir}/samba/vfs/.debug/* \
-                    ${libdir}/security/.debug/pam_smbpass.so \
+                    ${base_libdir}/security/.debug/pam_smbpass.so \
                    "
 
-FILES_libwinbind = "${libdir}/security/pam_winbind.so"
+FILES_libwinbind = "${base_libdir}/security/pam_winbind.so"
 FILES_libwinbind += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/system/winbind.service', '', d)}"
-FILES_libwinbind-dbg = "${libdir}/security/.debug/pam_winbind.so"
+FILES_libwinbind-dbg = "${base_libdir}/security/.debug/pam_winbind.so"
 FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
 
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
-- 
2.1.0


