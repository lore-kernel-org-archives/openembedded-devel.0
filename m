Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PzVTQ-0001u1-JQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 15:43:48 +0100
Received: by gwb11 with SMTP id 11so253946gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 07:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=/bwqOIWZsS7ukmRNrGbKYVSdD6hyQ0bT7CHnQluKzyw=;
	b=WslroXbU2qgbyC4BOBgB7Vk1bVPfBqMYB4D0TxkpuwAvaJ30TfM4N/88v44rydDugX
	1BJQhxdIchcSBytliLg0tJJFAZlx8x/wqTgdA+Xu2kOQ4d80I93dFXvtSHdPx5OaQmjK
	dxARouQTl92ORI0lZf7Ii1E2vlU28RAsKdEi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bJ726x1a65viHmEKsQzPhrWWt6PaslUwISI5RUS0P6pyMTTbtohywMWENrJo45BWrV
	Btk1kzuLEob8V4ctHVadCX+ZSo6PpmMPMTpjvqUsR/+q/AuQpxpDNaszAscIpRAaeqFt
	5hfqwzqVA2ODWmXKmTjAbnAF6ebVktuSHT5mE=
Received: by 10.151.4.8 with SMTP id g8mr45114ybi.335.1300200125803;
	Tue, 15 Mar 2011 07:42:05 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q13sm2856431yba.20.2011.03.15.07.42.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 07:42:04 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 09:42:01 -0500
Message-Id: <1300200121-31822-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Tue, 15 Mar 2011 14:43:48 -0000

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



