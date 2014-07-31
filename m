Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 652BD6FE7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 22:06:10 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so380758wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 15:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YSA0CHfgvFk8DtfdsPgi9iRrFYmpx+xPYl8MRNEA01I=;
	b=PsKVYYJnek6K0TND0Qih6QEjJXbmC2QPFdCJ3FfYi6dRLs/ItKq+DJOx/+IARGjpUT
	qkvHYoOdejg2pPCIvUU+fWWU8OZixbRY6qJij3zGjXKPGye1iaXwY1eZ6FjA0jVtnaUP
	csnBhKEHNsLKKi1pzDDip5qtzJleqnryWl3FwKyIqY8aW/3OcDLwod5/si7yBPA6JIpA
	uzoFK4YKuWBUk1VLObiWv4z+5XW4TzxObNxcmktMdOKLsKqtAv+f0VasKzfVW+w05D+4
	ismMWKoujX90wM6Q6rv5fCQwF7cY6WGz4UrWwzLRxDj+5oDTaHdGNl6/PegFKr8nGTfL
	VwPg==
X-Received: by 10.180.183.36 with SMTP id ej4mr580497wic.77.1406844371993;
	Thu, 31 Jul 2014 15:06:11 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host115-254-dynamic.11-79-r.retail.telecomitalia.it.
	[79.11.254.115])
	by mx.google.com with ESMTPSA id cx5sm16233940wjb.8.2014.07.31.15.06.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Jul 2014 15:06:11 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 00:06:07 +0200
Message-Id: <1406844367-10560-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot: change KERNEL_IMAGE_MAXSIZE from bytes to KB
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jul 2014 22:06:17 -0000

Match the changes done by commit 7384d2831c713ac5999aca83c312154dc15cec56
in oe-core.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend           | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
index 70d8a4a..53c2924 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
@@ -3,12 +3,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/linux-yocto-3.10:${
 COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
 
 # Zaurus machines need kernel size-check.
-KERNEL_IMAGE_MAXSIZE_akita = "1294336"
-KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
-KERNEL_IMAGE_MAXSIZE_collie = "1048576"
-KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
-KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
-KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
+KERNEL_IMAGE_MAXSIZE_akita = "1264"
+KERNEL_IMAGE_MAXSIZE_c7x0 = "1264"
+KERNEL_IMAGE_MAXSIZE_collie = "1024"
+KERNEL_IMAGE_MAXSIZE_poodle = "1264"
+KERNEL_IMAGE_MAXSIZE_spitz = "1264"
+KERNEL_IMAGE_MAXSIZE_tosa = "1264"
 
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
-- 
1.9.1


