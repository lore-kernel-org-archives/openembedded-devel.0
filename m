Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Paa9W-0004bR-MO
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 21:40:15 +0100
Received: by yie16 with SMTP id 16so4155724yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 12:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7xQbJPBJ9FBLxFxd0z0KTEhD5wsg/8kvtgLFEUFknco=;
	b=ZOi1grT6HBfQcLdXk9NDAs9oOFb3d8a/PW9DDAbZMtUQeFqk/Su0vYuTFtY2YTFGQz
	k7W4W43lmhLF0rWL5Y8DRAbG5CAp2moomZINrdK6qQVNxFeawvTyqGvO77uOA0FjAvV/
	Gz8IAYmabwL6tBLxfM4JbtE8uIJbdoqchHAyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SB7BR9R70ViQJ8CJNPmCAzj5L/WAn13tSxEe8EwurWnk8wGkAIYCGaDzjz2ii065yw
	EHOl1gT6zEE6hGIbGdL3O8RVjkUrGD9T7dfZ8wXiZsWpEefpO5T+GX2XoQ1pp7gVR5Lq
	ilbqbI5EV7171qCzXbBWK9XUy+jHlFv7rKUHc=
Received: by 10.101.179.6 with SMTP id g6mr13915474anp.157.1294259990190;
	Wed, 05 Jan 2011 12:39:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id d4sm1397412and.39.2011.01.05.12.39.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 05 Jan 2011 12:39:48 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jan 2011 14:39:31 -0600
Message-Id: <1294259972-3430-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1294259972-3430-1-git-send-email-Chase.Maupin@ti.com>
References: <1294259972-3430-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/3] kernel class: stage ocf directory
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
X-List-Received-Date: Wed, 05 Jan 2011 20:40:15 -0000

* Added the crypto/ocf directory to the list of directories
  to be staged when building the kernel (if it is present)
* This is required when building OCF modules that allow access
  to crypto hardware outside of the kernel tree.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 422bcd7..b58c0e8 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -167,7 +167,7 @@ sysroot_stage_all_append() {
 	mkdir -p $kerneldir/include/asm-generic
 	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
 
-	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen; do
+	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen crypto/ocf; do
 		if [ -d $entry ]; then
 			mkdir -p $kerneldir/$entry
 			cp -fR $entry/* $kerneldir/$entry/
-- 
1.7.0.4



