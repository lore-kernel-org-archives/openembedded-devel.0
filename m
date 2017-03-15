Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id F196B72F71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:56:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id b5so2877344pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8ljOlcgeLeYVIM9Ay4wGUjlHGROXFkhfOC2j9bZBRlk=;
	b=vZXrZPyix8j5/rpB4zTtuhYoIStR0zKLJJn+A2m0+sBeT/4SX0wTVb5wNoSVGzY9w6
	RC4D39OLHRqDTjb9emIr66VYM0/e05PgxM5E7XvIRJz2fNKq1sAjELrXUytzTrS7eFHj
	M5hsLlWWzLu80dk341dQGXbbc1ds9FKJpeFcqPu+5exUg8+LpcJnTZqliPOVeSfyxOQq
	WNcKtkZg8bpguUYhs63vLooMn5qkAiVuwLED68s7b7mVWszJGIoOuoW+qFSPzBLqgPJ4
	N84T9mKJUPXyEbXe46JkQpUzaUmYDjCeJNev23dNheftQ35/TAUBm1b0D+W3FN0sKZUC
	piWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8ljOlcgeLeYVIM9Ay4wGUjlHGROXFkhfOC2j9bZBRlk=;
	b=PqNpfT9E498nxQUJReCgnN7WOSuzmn3922hDRbt/Q2M+8Om9ICAs+Dq5oevg5q4g28
	6gSCQ9HQqqiTQ4YXIpDYmnfKW7pUjRsYTxXkfQqKB2nwpZDDEdYp5Yudlte0lO6gIt/v
	ZqbxNTX10m4u1Ax6gECx6dSt3pWg20dvD73QLAawo0yVwl79SZ1LpTXd6DJseqI/d1qc
	VbXphXxj2Bd+KV7jYNx3w76rTNLA/luc4N2KHTgMa7/NE2ita9dLpRyl9DI/rjUvO0Ih
	MB5WEEDNbhbzkGe/9HdN0KqRyXTd3paGS13pf2BruKflVG9qAkFy4z+i65ASH8lH7k5V
	eydQ==
X-Gm-Message-State: AFeK/H0su6wWo0wbatXMFqkd2ZvbYa7sjh9x5Ln2qIoVqSFX4MXirLpC6ELqUxsp/ZaZrg==
X-Received: by 10.98.153.198 with SMTP id t67mr4905968pfk.1.1489596979704;
	Wed, 15 Mar 2017 09:56:19 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id m21sm5468743pgh.4.2017.03.15.09.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 09:56:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Mar 2017 09:56:11 -0700
Message-Id: <20170315165611.27320-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [meta-xfce][PATCH] core-image-minimal-xfce: Drop ROOTFS_PKGMANAGE_BOOTSTRAP
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Mar 2017 16:56:19 -0000

OE-Core has now dropped this var

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
index a683c2dd4..f5c5c26ae 100644
--- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
+++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "A XFCE minimal demo image."
 
 IMAGE_INSTALL = "packagegroup-core-boot \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-core-x11 \
     packagegroup-xfce-base \
     kernel-modules \
-- 
2.12.0


