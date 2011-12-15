Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rb9RI-0002uy-84
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 12:25:28 +0100
Received: by yhoo47 with SMTP id o47so2013136yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=jmNZiI9QuADWwnSFl5jXuq+eirfIrA5W1p02naXLF7s=;
	b=oT5LOaaSMOb0kDFHanv6YFir5ztlV5Di7lZb0PqmsIS1qwPsWVt1IZl/M8UqEw9t7c
	N0k/yVWxKrKKbv6r7YMmeILPlZEHa8nWBO3CV/6an4lPPhbS/bxUEgIf6SFvMCDIbdJm
	PpaAbmAQyjLRYUD1Yge7ku02mXRVIHQQdQteo=
Received: by 10.236.197.99 with SMTP id s63mr5420485yhn.14.1323947910101;
	Thu, 15 Dec 2011 03:18:30 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c44sm8652593yhm.5.2011.12.15.03.18.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 03:18:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 11:18:06 +0000
Message-Id: <2ba3b00677d245e824c9ac83b177a4f9a91f8b0f.1323947853.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/5] dropbear: cleanup packaging
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
X-List-Received-Date: Thu, 15 Dec 2011 11:25:28 -0000

* the symbolic link required to disable the sysvinit init script is
  now done during the do_install task so making the recipe simple

* convert to use PRINC to bump PR on bbappend

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dropbear/dropbear_2011.54.bbappend             |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
index a642235..899e1fc 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
 
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
@@ -17,17 +17,10 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${base_libdir}/systemd/system/
 	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${base_libdir}/systemd/system/
 	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${base_libdir}/systemd/system/
+	ln -sf /dev/null ${D}${base_libdir}/systemd/system/dropbear.service
 }
 
 PACKAGES += "${PN}-systemd"
 
 RDEPENDS_${PN}-systemd += "dropbear"
 FILES_${PN}-systemd = "${base_libdir}/systemd"
-
-pkg_postinst_${PN}-systemd_append() {
-ln -sf /dev/null $D${base_libdir}/systemd/system/dropbear.service
-}
-
-pkg_postrm_${PN}-systemd_append() {
-rm -f ${base_libdir}/systemd/system/dropbear.service
-}
-- 
1.7.2.5



