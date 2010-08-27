Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op8LP-0007Uv-CX
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 01:28:24 +0200
Received: by pvg6 with SMTP id 6so1332792pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 16:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=IhiBBvjBKO3gBYMyTGrMYDNzi7tz6eAzn3s1b/LsIxo=;
	b=Ct+qNNYK9TdIJB8aiBqUiRg/UbhwIEaMacP041iPuRVLerWPVFctgwpqtXnaTaibwi
	BImsLCeHX5cFW86AKN0GbrIKZTbWcvidGQK07O2cmNcVtAO++Oq36wh8jSVCvVdeHZ9V
	AW2UyQt8kGYBy6LI9H5Ge7NHKWNjkiwkL5VOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=oFeifSOBA26sN7TuAB7whL0jJgBsHGG9cj3SSemNzQbiXVVr4hpK0c+QUVb7JDpy/3
	i1hgHLJAYDB9L/a/wPMrQSIkuxPfNuMQZWNZUCP22W89jF4cENIjM7ozzX65oJsY+jzt
	6XAGs2hg4VLM03V7M+SxyeXPkJAWySzO6PyTM=
Received: by 10.114.111.9 with SMTP id j9mr1286608wac.2.1282951672678;
	Fri, 27 Aug 2010 16:27:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c24sm7558853wam.19.2010.08.27.16.27.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 27 Aug 2010 16:27:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 16:27:47 -0700
Message-Id: <1282951667-26220-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] omap3-pandora.conf/u-boot-omap3pandora_git.bb: Use PREFERRED_PROVIDER_virtual/bootloader to select u-boot recipe to use.
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
X-List-Received-Date: Fri, 27 Aug 2010 23:28:24 -0000

* Dont PROVIDES u-boot but let user decide it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/omap3-pandora.conf           |    3 +--
 recipes/u-boot/u-boot-omap3pandora_git.bb |    4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/conf/machine/omap3-pandora.conf b/conf/machine/omap3-pandora.conf
index b504723..7c72ba9 100644
--- a/conf/machine/omap3-pandora.conf
+++ b/conf/machine/omap3-pandora.conf
@@ -6,7 +6,7 @@
 TARGET_ARCH = "arm"
 
 
-PREFERRED_PROVIDER_u-boot = "u-boot-omap3pandora"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-omap3pandora"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 
@@ -63,7 +63,6 @@ UBOOT_LOADADDRESS = "0x80008000"
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "omap3_pandora_config"
 
-PREFERRED_PROVIDER_u-boot = "u-boot-omap3pandora"
 PREFERRED_PROVIDER_x-load = "x-load-omap3pandora"
 PREFERRED_VERSION_u-boot-omap3pandora = "git"
 PREFERRED_VERSION_x-load-omap3pandora = "git"
diff --git a/recipes/u-boot/u-boot-omap3pandora_git.bb b/recipes/u-boot/u-boot-omap3pandora_git.bb
index 773eb18..266bd71 100644
--- a/recipes/u-boot/u-boot-omap3pandora_git.bb
+++ b/recipes/u-boot/u-boot-omap3pandora_git.bb
@@ -5,10 +5,8 @@ COMPATIBLE_MACHINE = "omap3-pandora"
 # Latest SRCREV for the final shipping boards.
 SRCREV = "c71d8dbe09d69feda7e57745bd3909727d3cc33f"
 
-PROVIDES = "u-boot"
-
 PV = "pandora+${PR}+gitr${SRCREV}"
-PR ="r4"
+PR ="r5"
 PE = "1"
 
 SRC_URI = "git://git.openpandora.org/pandora-u-boot.git;branch=master;protocol=git \
-- 
1.7.1



