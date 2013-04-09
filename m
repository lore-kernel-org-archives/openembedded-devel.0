Received: from mail-gh0-f176.google.com ([209.85.160.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPeK9-00086C-RW
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 21:35:22 +0200
Received: by mail-gh0-f176.google.com with SMTP id f16so1114284ghb.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NdVTMBngBusa/1oPU2/P9RqHL1IBOfk9a+I+A/Dy9EY=;
	b=mXsvXpE7pYM8/YIbkaDvx5/sdGKS3y6dS1P7Tjcpcc7Nl20HTEzwJx04Rju9DzMQaq
	Jk9fEd99RJk02L1o1Hlp00Mnt7aoQ02HZF6KhrwEpqoWtJb+bcoQ3wMNxjnQ17IEXXvk
	KHCXj0sRe2+m3nggZ0JEOVq+EiJWunt0wBU+05BD0GDqMOV6gJb+nKlElhBqFDty/xuw
	7ODj6mpsyO3CTXG4PjgYolvQe1aDP8V20X7u378+EmUghJ4eee5fTXq9Q9hhfZ1R/pJa
	xXeV/vpX9Sl4+NXU3hN6YZABf3QfItX+/DAVvXFFU7+cv91aGW6lEDhJI5mdc8767fWY
	CXMA==
X-Received: by 10.236.37.40 with SMTP id x28mr16659762yha.127.1365535080894;
	Tue, 09 Apr 2013 12:18:00 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t9sm45013110yhh.0.2013.04.09.12.17.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 12:18:00 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  9 Apr 2013 16:17:36 -0300
Message-Id: <1365535059-27254-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v2 1/4] u-boot-fslc: Update to 20130409 patches-2013.04's snapshot
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
X-List-Received-Date: Tue, 09 Apr 2013 19:35:22 -0000

This updates our U-Boot mainline based branch to a 20130409 snapshot;
the u-boot-fslc and u-boot-mxsboot recipes were updated.

Change-Id: I89a3608e1cd94a7e26307c9dbe7774975af7baa3
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../u-boot/{u-boot-fslc_2013.01.bb => u-boot-fslc_2013.04.bb}      | 7 +++----
 .../{u-boot-mxsboot_2013.01.bb => u-boot-mxsboot_2013.04.bb}       | 5 ++---
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename recipes-bsp/u-boot/{u-boot-fslc_2013.01.bb => u-boot-fslc_2013.04.bb} (70%)
 rename recipes-bsp/u-boot/{u-boot-mxsboot_2013.01.bb => u-boot-mxsboot_2013.04.bb} (87%)

diff --git a/recipes-bsp/u-boot/u-boot-fslc_2013.01.bb b/recipes-bsp/u-boot/u-boot-fslc_2013.04.bb
similarity index 70%
rename from recipes-bsp/u-boot/u-boot-fslc_2013.01.bb
rename to recipes-bsp/u-boot/u-boot-fslc_2013.04.bb
index f67a92b..2a88090 100644
--- a/recipes-bsp/u-boot/u-boot-fslc_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-fslc_2013.04.bb
@@ -2,16 +2,15 @@ require recipes-bsp/u-boot/u-boot.inc
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-COMPATIBLE_MACHINE = "(imx28evk|mx3|mx5|mx6)"
+COMPATIBLE_MACHINE = "(mxs|mx3|mx5|mx6)"
 
 DEPENDS_mxs += "elftosb-native"
 
 PROVIDES += "u-boot"
 
-PV = "v2013.01"
-PR = "r3"
+PV = "v2013.04"
 
-SRCREV = "6997ad60ace1244119080bc1811586f231ef267a"
+SRCREV = "e11b0ce37c33578477843add74e604837ceaa3c1"
 SRC_URI = "git://github.com/Freescale/u-boot-imx.git"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/u-boot/u-boot-mxsboot_2013.01.bb b/recipes-bsp/u-boot/u-boot-mxsboot_2013.04.bb
similarity index 87%
rename from recipes-bsp/u-boot/u-boot-mxsboot_2013.01.bb
rename to recipes-bsp/u-boot/u-boot-mxsboot_2013.04.bb
index 42acd39..28245c2 100644
--- a/recipes-bsp/u-boot/u-boot-mxsboot_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-mxsboot_2013.04.bb
@@ -3,10 +3,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 SECTION = "bootloader"
 
-PV = "v2013.01"
-PR = "r1"
+PV = "v2013.04"
 
-SRCREV = "d229fb849bd4b453a08b18f4f8cd00741ef53b1d"
+SRCREV = "e11b0ce37c33578477843add74e604837ceaa3c1"
 SRC_URI = "git://github.com/Freescale/u-boot-imx.git"
 
 S = "${WORKDIR}/git"
-- 
1.8.1



