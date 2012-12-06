Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tge3D-00047V-6H
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2012 17:11:51 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so6172802obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Dec 2012 07:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NtJo3Wlcd2e9as3TiyCErNetMCh0XPQjThlZ9Aoiv48=;
	b=viusQrXabSEKeaqqi9LUNSHH7YZ7Ll7C+StNEbWeNcV8x62MSdLG//ognoEQRNVGRQ
	qk4BOx0/yruK8jcD2ANgfdnbe0mdgaYdqokrXLSQ9N82Nu/51Bvn5A30U7xfR3avXc4o
	PdMBUL5UtLaUfBwiyLxzApd13A2BNVAqBU6hQJ4So2cHcKyWV8Q0mmnV0XeQP4v6G5nY
	Pn6jTMHK2Q5EyXpakzPQ6SLA3uTe+/dGaj67sKrIiaq+5vbmRAP3Ab3XlvptA5hBtw2c
	KUikVC5rhJOZBvAmV0DLrscgdPR58fAMssCa4VMFYwBOy3Uw9DzHfFM1GQW2Qa00kNoV
	Cnvg==
Received: by 10.182.240.109 with SMTP id vz13mr1132223obc.81.1354809445303;
	Thu, 06 Dec 2012 07:57:25 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br ([187.23.153.69])
	by mx.google.com with ESMTPS id s5sm3623286obo.10.2012.12.06.07.57.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 07:57:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Dec 2012 14:00:00 -0200
Message-Id: <1354809600-26342-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] freerdp-extension-xpunlimited: Remove the recipe as it is uncompatible
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
X-List-Received-Date: Thu, 06 Dec 2012 16:11:51 -0000

The 1.0 version of FreeRDP has change a lot and made the extension to
fail; as this extension has some limit usage (due some legal
interpretations) we stoped to support it upstream and in O.S. Systems.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |   23 --------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
deleted file mode 100644
index ed7fc4d..0000000
--- a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-# Copyright (C) 2011 O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license
-
-DESCRIPTION = "FreeRDP XPUnlimited RDP Extension support"
-HOMEPAGE = "https://github.com/OSSystems/FreeRDP-Extension-XPUnlimited"
-DEPENDS = "freerdp"
-SECTION = "x11/network"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-PV = "gitr${SRCPV}"
-PKGV = "${GITPKGVTAG}"
-PR = "r0"
-
-inherit pkgconfig cmake gitpkgv
-
-SRCREV = "e952627ff4c116b4ce8541c91cb96bd5422c4a0d"
-SRC_URI = "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-FILES_${PN} += "${libdir}/freerdp/extensions/*.so"
-FILES_${PN}-dbg += "${libdir}/freerdp/extensions/.debug/*.so"
-- 
1.7.10.4



