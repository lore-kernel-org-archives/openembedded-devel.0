Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PV8qh-0002bD-4x
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 21:30:19 +0100
Received: by yxd5 with SMTP id 5so2006084yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 12:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=hlNnXYcrQ0otZHMLuwjSHWZAr5kot3h20b43r8anNLs=;
	b=QhTPqHU2YX6ZGxkq0xCRD4MxFmrMuitx9SRNJATsPmNA+vzyNM/cAOMwzDoFaaflXX
	x9GiifpxjG2phSPvAtrgu8hUHIhdKEBvqVkJxl0tzDlIYEIo+/7jdqSDXZY+Fgl6Ccpu
	uE1JHMm6WYLiNZBoEkdUNOGCJ5sS56u8knXoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JaYf8N7qtxzShpNqJGq3iZfirl0kEMiUjMxk7dSckFBtgoZZNJmebvohWe8ISooWqT
	ozgXWDNoHJcbXLXe/qfBxDUgUYjYTs24AYZnCKNvRDCHiln65r+i+6IYZO4o+V//TQUK
	KqGFhwPXe2ux1KGcNY5Djv0XJFu5csFGBcmKE=
Received: by 10.236.102.179 with SMTP id d39mr3257226yhg.48.1292963411655;
	Tue, 21 Dec 2010 12:30:11 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t38sm3049015yhg.9.2010.12.21.12.30.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 12:30:10 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 14:30:06 -0600
Message-Id: <1292963406-19767-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1292963406-19767-1-git-send-email-Chase.Maupin@ti.com>
References: <1292963406-19767-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/2] ti-pru-sw-examples: remove unneeded settings
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
X-List-Received-Date: Tue, 21 Dec 2010 20:30:19 -0000

* Remove unneeded settings in the do_compile function.
  Variables were being set to point to non-existent locations
  in the ${D} directory.  Since the files requires were already
  staged by other packages these variables do not need to be set.
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-pru-sw-examples_1.00.00.bb |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
index 02c3376..5df6c6e 100644
--- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
 DEPENDS += "ti-pru-sw-app-loader ti-pru-sw-edma-library"
 RDEPENDS += "ti-pru-sw-edma-driver kernel-module-uio-pru"
-PR = "r1+svnr${SRCPV}"
+PR = "r2+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "omapl138"
 
@@ -13,11 +13,8 @@ SRCREV = "20"
 S = "${WORKDIR}/trunk"
 
 do_compile () {
-        make -C ${S}/example_apps LIBDIR_APP_LOADER="${D}${libdir}" \
+        make -C ${S}/example_apps \
           CC=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc \
-          LIBDIR_EDMA_LOADER="${D}${libdir}}" \
-          INCDIR_APP_LOADER="${D}${includedir}" \
-          INCDIR_EDMA_DRIVER="${D}${includedir}" \
           BINDIR_APPLICATIONS="${S}/example_apps/bin" \
           BINDIR_FW="${S}/example_apps/bin" \
           UTILS_DIR="${S}/utils"
-- 
1.7.0.4



