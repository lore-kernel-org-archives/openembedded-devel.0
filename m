Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pzw5d-0001Rf-Fn
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 20:09:01 +0100
Received: by gwb11 with SMTP id 11so793034gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 12:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=/bwqOIWZsS7ukmRNrGbKYVSdD6hyQ0bT7CHnQluKzyw=;
	b=sb4+WhxoGjcpPtwm/zx+3fGnEZ/XFUdxhpgmLo4Ir3o2Katw6MeviLXckg+XshuOQr
	3gmNGMtyuwVcrfUSnXYrIJPEaBEINQrnvLnxovRWetgdBXiprzbMvUVyYAKYjOsnVRsB
	Q7S23Ggrq6PDhQTB783Rroty+9GKSDCsLmSNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xyskofIj0srAAA59wbmQKuc4kFPR/fLz6X9Mc4M6h3BxgNLwUjjNmmmLhRLtU76SNB
	JihcMfwzsFeKAGYUd8tMw0Tl60oEbp/vBoUbZUeI3r7qa4F+8ZSAEd56LpDZxgOjvWii
	1Cj6dwjkS4O4KjXGrz8+UV66tUkVlwuYFxRfM=
Received: by 10.236.63.240 with SMTP id a76mr290857yhd.369.1300302130921;
	Wed, 16 Mar 2011 12:02:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id k5sm766126yhm.21.2011.03.16.12.02.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 12:02:09 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 14:02:03 -0500
Message-Id: <1300302126-32560-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/4] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Wed, 16 Mar 2011 19:09:02 -0000

* Later versions of u-boot sometimes have top level make targets
  such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
  u-boot.ti.
* These targets define different calls to the mkimage tool to
  change the images created, such as changing the load address.
* This change allows recipes to change the default make target
  of "all" to something like u-boot.ti or u-boot.imx by setting
  the UBOOT_MAKE_TARGET variable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/u-boot/u-boot.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/u-boot/u-boot.inc b/recipes/u-boot/u-boot.inc
index 88c6a4d..ffd1e1e 100644
--- a/recipes/u-boot/u-boot.inc
+++ b/recipes/u-boot/u-boot.inc
@@ -16,6 +16,7 @@ UBOOT_MACHINE ?= "${MACHINE}_config"
 UBOOT_BINARY ?= "u-boot.bin"
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
+UBOOT_MAKE_TARGET ?= "all"
 
 do_configure () {
 	oe_runmake ${UBOOT_MACHINE}
@@ -25,7 +26,7 @@ do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
-	oe_runmake all
+	oe_runmake ${UBOOT_MAKE_TARGET}
 	oe_runmake tools env HOSTCC="${CC}"
 }
 
-- 
1.7.0.4



