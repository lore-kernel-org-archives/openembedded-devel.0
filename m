Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pzw0s-0001ND-0E
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 20:04:06 +0100
Received: by yia13 with SMTP id 13so789919yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 12:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+jxZ0610o89P56PneWu3KK2MusbDVTjaJOKLM56jaz0=;
	b=bDnK9POEMpNiyct0TX81LTtJ3mIbU8ZxPgmSv8/uZeiwMd4OTrAdM2gk2/z2ILBGIm
	yuTPHf5GwDuUSm43DhT+8Ue4whadMNr7BGfyEO5F2qMTOxWS9XPurDm4OfwymM2IDMe1
	SSRPksGGGf8WowrkkzejWJ0LFccugu0apqkkk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Wh0iaXgbFCwepDwnl6jUhpN44YaLnhbEm5Z0Snp6wpCwzViDCq76rU28ooHHmbY7kE
	w0+Z1MCMwJDa4T4MtdubOYOCiA18JfOzy48QyHO+Wd9PRkvOF55Ye8WXZ0ArT/U8CwIs
	4w3IyZ/ZRfbN9RhA2Ej/359ngH62nxo7BgvRs=
Received: by 10.236.27.206 with SMTP id e54mr284532yha.377.1300302138653;
	Wed, 16 Mar 2011 12:02:18 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id k5sm766126yhm.21.2011.03.16.12.02.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 12:02:17 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 14:02:06 -0500
Message-Id: <1300302126-32560-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300302126-32560-1-git-send-email-Chase.Maupin@ti.com>
References: <1300302126-32560-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 4/4] ti-pru-sw-example: fix building with new toolchain sysroot
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
X-List-Received-Date: Wed, 16 Mar 2011 19:04:06 -0000

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



