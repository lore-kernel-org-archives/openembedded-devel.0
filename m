Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1QXIIw-0003ym-BW
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 21:32:38 +0200
Received: by gyd5 with SMTP id 5so417200gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2011 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=ws+rugLjkxV5p+oSc25//+xE7ZKj/73272qmvd5ExX4=;
	b=rq0zY4MMcrovpLHhEnoBc7cZcxOoShLCN/pB7FsWkcwd9H+iSP/CXw7+/hQQB8Eng/
	ddRa2wvj94bACV6BNxP/744bXb5mZOyIUUoMIExGsB3TjDNSUB1ZA4TxFMKXuxc5TrP5
	N5gtj8+nT6dGk0J3J13UCdHsK6O205slTX6yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=N4aLGdJFI0A970cjI5XZnie7yltTbyQMJnB8GTahmQjZFarI5YfhfSKOiSubCFOdIb
	0vCoaEVX5/pvCvjllPs+leJIb2MqoxgUMUFXATQVlfIBOcSLMxTs6nk1XDJ4GGK+1739
	qRF0aG8/9XfE6szB6CGCIKCRqZhelavYh8UEA=
Received: by 10.236.78.227 with SMTP id g63mr2059304yhe.438.1308252549430;
	Thu, 16 Jun 2011 12:29:09 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id o47sm1174084yhn.2.2011.06.16.12.29.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 12:29:07 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2011 14:29:03 -0500
Message-Id: <1308252543-24363-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Greg Turner <gregturner@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] kernel bbclass: add the crypto directory to staging
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
X-List-Received-Date: Thu, 16 Jun 2011 19:32:38 -0000

* Add the include/crypto directory from the kernel to the list
  of directories to be staged.
* This directory contains the cryptodev.h file required by other
  drivers and applications.
* Not including this directory leads to build errors of being
  unable to find the cryptodev.h file.

Signed-off-by: Greg Turner <gregturner@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 8817186..bd7b23f 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -188,7 +188,7 @@ sysroot_stage_all_append() {
 	mkdir -p $kerneldir/include/asm-generic
 	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
 
-	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen crypto/ocf; do
+	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen crypto/ocf include/crypto; do
 		if [ -d $entry ]; then
 			mkdir -p $kerneldir/$entry
 			cp -fR $entry/* $kerneldir/$entry/
-- 
1.7.0.4



