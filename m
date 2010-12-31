Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYhCh-0004oz-VE
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 16:47:44 +0100
Received: by eya28 with SMTP id 28so5464266eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NB6Ss9Bz0fqlt+48qz7Dd7JZMb7Ivvj2GUs9K5au3qo=;
	b=KG0yfLo9nWuhxmu1deS9iPdIvzDbul6AFhtSN7QXPjoPKpdL9LVyqyptsvdRnSx2fH
	vUlVy47Zw3APYqyR6nJTb9iYUtGPW/+9BHdC1Ff3m4mB/7jTziQcBgqD3yiUP97qrxip
	s+16kMrhgdE6+j6VzuMOtu4wdvGoLovLmO1Vg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=aCQT3qKX3kptYBINY94v1YpgySBqosyocOBm/8ztUuPLrPwRUlZ7ISwOxSHyJK2wWW
	AbYv6SU6xQOF8XsDfF6I4V+sPC8lKMRoHj/O0LK/ra6J+h7GnUhQOnxDCntF0u3C76Nr
	00XbhoaiCd2zOYVk8fiyR+iTyeJo1LUHf1Amk=
Received: by 10.213.15.135 with SMTP id k7mr13208385eba.26.1293810441395;
	Fri, 31 Dec 2010 07:47:21 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id b52sm12381751eei.1.2010.12.31.07.47.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 31 Dec 2010 07:47:20 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 16:47:08 +0100
Message-Id: <1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
Subject: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Fri, 31 Dec 2010 15:47:44 -0000

The u-boot recipe for pandaboard is nonbuildable for a few
months. Apparently this recipe is orphaned.
I've made things buildable again by moving to the latest
mainline u-boot (as suggested by Steve Sakoman a few monts
ago). It builds fine, but is not tested on the actual
hardware (as I do not have access to a board).
Still I feel that a buildable recipe is better than using a
recipe that does not even build.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 conf/machine/omap4430-panda.conf |    6 ++++--
 recipes/u-boot/u-boot_2010.12.bb |    1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/conf/machine/omap4430-panda.conf b/conf/machine/omap4430-panda.conf
index df2658e..af1d79c 100644
--- a/conf/machine/omap4430-panda.conf
+++ b/conf/machine/omap4430-panda.conf
@@ -4,12 +4,12 @@
 
 require conf/machine/include/omap3.inc
 
-EXTRA_IMAGEDEPENDS = "x-load-rsalveti u-boot-sakoman "
+EXTRA_IMAGEDEPENDS = "x-load-rsalveti u-boot"
 
 XLOAD_MACHINE = "omap4430panda_config"
 XLOAD_LOAD_ADDRESS = 0x40304350
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-sakoman"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 UBOOT_MACHINE = "omap4_panda_config"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap4"
diff --git a/recipes/u-boot/u-boot_2010.12.bb b/recipes/u-boot/u-boot_2010.12.bb
index 174bebf..5645576 100644
--- a/recipes/u-boot/u-boot_2010.12.bb
+++ b/recipes/u-boot/u-boot_2010.12.bb
@@ -2,6 +2,7 @@ PR = "r0"
 require u-boot.inc
 
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_omap4430-panda = "1"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
 SRC_URI[md5sum] = "9024bbceabd176ae1d52df6db2e84bda"
-- 
1.7.1



