Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Ino-0004r1-7I
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:32 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so214337bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=g04OYsgquGJ9saBk9PxtM72/MLdmHnF0UA8QHwgpdDs=;
	b=p+drpdnib1O8oX46cRdpo3ErQc/BRF/unhzX6G+nNyUYp22TrRE/L2B0IOo51ezTID
	ks8WfLpk0H2XJw4BgrjagNwzj5EZIsk+/ny9zQRplb1MrTXNOLsLMpP5d82dd+fHffsX
	CvbjacDGNAk8aQjxi+HpK/76B0iRY0D2+qMnw=
Received: by 10.204.135.73 with SMTP id m9mr3702220bkt.340.1315404212112;
	Wed, 07 Sep 2011 07:03:32 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:31 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:05 +0400
Message-Id: <1315404187-18176-11-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 10/12] linux.inc: drop cortex-a8 fixup, none of meta-hh machines uses A8
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:32 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index a31669f..477726c 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -20,7 +20,6 @@ LOGO_SIZE ?= "."
 # to your kernel recipe, and then structure your logos for each resolution
 # accordingly.
 
-CORTEXA8FIXUP ?= "yes"
 LOCALVERSION ?= ""
 
 do_configure_prepend() {
@@ -51,12 +50,6 @@ do_configure_prepend() {
             echo "CONFIG_ARM_THUMB=y" >> ${S}/.config
         fi
 
-        # Enable thumb2 fixup for specific issue in angstrom toolchains when used on A8 r1p[012] silicon
-        if [ "${DISTRO_NAME}" = "Angstrom" -a "${CORTEXA8FIXUP}" = "yes" ] ; then
-            sed -i -e /CONFIG_ARM_ERRATA_430973/d ${WORKDIR}/defconfig
-            echo "CONFIG_ARM_ERRATA_430973=y" >> ${S}/.config
-        fi
-
 	#
 	# endian support
 	#
-- 
1.7.2.5



