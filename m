Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PzuSL-0004K9-SB
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:24:22 +0100
Received: by ywg8 with SMTP id 8so749024ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+jxZ0610o89P56PneWu3KK2MusbDVTjaJOKLM56jaz0=;
	b=DVjmYL/zxiFzqLzsXis+cQzrcrg+ycaZZlMdrY80vRKaC882mbfUeSsgivCmkYXR+f
	BscKvEVTZ/o/VD+hoKpJLXKP/EspowsjNAu6MVxeuZek4E3B0RroVtR7rDZjDKJiIJT9
	FxlCTNsYQ7uaxpaNINvmQiSnduUWE2le0Bp7M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GZ6alNLc9XcLEiYQY2+mMRMObKjZ0fiw2JqMgcRoRgI3sPw0jELJjiKbEp0uVK9Oqs
	suKzIHJbIi0AU8eUhJgciWUWTC2/kW364f9TGZyhuffvdLynFEEnhq2E6vOURJcbMYyp
	9v/K1FAUTBrfdg/4AGtxewNaalUgANKW8Fgvk=
Received: by 10.101.112.11 with SMTP id p11mr167543anm.106.1300296147589;
	Wed, 16 Mar 2011 10:22:27 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id d14sm1486558ana.20.2011.03.16.10.22.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 10:22:26 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:22:20 -0500
Message-Id: <1300296140-7275-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH][2011.003-maintenance] ti-pru-sw-example: fix building with new toolchain sysroot
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
X-List-Received-Date: Wed, 16 Mar 2011 17:24:22 -0000

* Patch taken from Arago overlay where it was added by
  Denys Dmytriyenko
* PR incremented by two to align recipe PR values between Arago
  and OE.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-pru-sw-examples_1.00.00.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
index f5fa8d5..45a01eb 100644
--- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
 DEPENDS += "ti-pru-sw-app-loader ti-pru-sw-edma-library"
 RDEPENDS += "ti-pru-sw-edma-driver kernel-module-uio-pru"
-PR = "r2+svnr${SRCPV}"
+PR = "r4+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "omapl138"
 
@@ -14,7 +14,7 @@ S = "${WORKDIR}/trunk"
 
 do_compile () {
         make -C ${S}/example_apps \
-          CC=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc \
+          CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
           BINDIR_APPLICATIONS="${S}/example_apps/bin" \
           BINDIR_FW="${S}/example_apps/bin" \
           UTILS_DIR="${S}/utils"
-- 
1.7.0.4



