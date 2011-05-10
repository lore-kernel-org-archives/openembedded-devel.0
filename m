Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlKo-0005rZ-F3
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:42:38 +0200
Received: by fxm19 with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=xtkVp315km2Vl2MG/DuxmqnuF8HgBuqrFba+7Yp6b/I=;
	b=PTQsq6pivp3AZSTw44Gw/F9HJH9AcH8/LWTV/LgOKHcA2hfyc7IuqClD3aAjN3Jylb
	6iDQI0QfMlx0r/vpU080BFM3LhM0fL4HsC5/FuIE+SL54y7GBRX+Nj473gFFDA39LEi3
	a+vhNtp6LJKGSA2KcMU7+RVw6nRWNZxy3cgYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eb1O294mfKlBTxAL1bU3jH1BheORbcx1TcoZLsaC3KVH3do1VN+wpzhYAFKXzDC1pt
	ZEJAjG3Fv2BHme2C0e/QLR7eTLyjuIMEcBmpZr+GGXEeyijBdl1W/Nxcuoeq07C+QzWO
	M0eo6eHoy32fb0BVomZOFuIByBhFGp9xnkpZc=
Received: by 10.223.17.140 with SMTP id s12mr1024067faa.49.1305027593415;
	Tue, 10 May 2011 04:39:53 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r26sm2345503fam.34.2011.05.10.04.39.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:39:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:39:51 +0200
Message-Id: <3ce8046fc75c61d0eed6b58152acee0c665383e7.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/9] udev: drop udev-compat for zaurus devices
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
X-List-Received-Date: Tue, 10 May 2011 11:42:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/udev/udev_165.bb |   26 --------------------------
 1 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_165.bb b/meta-oe/recipes-core/udev/udev_165.bb
index 2c4171d..e8e6ddd 100644
--- a/meta-oe/recipes-core/udev/udev_165.bb
+++ b/meta-oe/recipes-core/udev/udev_165.bb
@@ -93,32 +93,6 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
-RPROVIDES_udev_append = " udev-compat-wrapper"
-RDEPENDS_udev_append_spitz = " udev-compat"
-do_unpack_append_spitz() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-RDEPENDS_udev_append_akita = " udev-compat"
-do_unpack_append_akita() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-RDEPENDS_udev_append_c7x0 = " udev-compat"
-do_unpack_append_c7x0() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-RDEPENDS_udev_append_poodle = " udev-compat"
-do_unpack_append_poodle() {
-	bb.build.exec_func('do_apply_compat_wrapper', d)
-}
-
-# Modify init script on platforms that need to boot old kernels:
-do_apply_compat_wrapper() {
-	cd ${WORKDIR}
-	sed -i "s:/sbin/udevd:\$UDEVD:g;s:/sbin/udevadm:\$UDEVADM:g" init
-	patch <udev-compat-wrapper-patch
-	cd -
-}
-
 do_install () {
 	install -d ${D}${usrsbindir} \
 		   ${D}${sbindir}
-- 
1.7.5.rc3



