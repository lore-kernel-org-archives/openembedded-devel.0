Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKfxs-0007zE-Cx
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 00:38:29 +0100
Received: by pxi17 with SMTP id 17so1781131pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=OYPuDRwpSzpW/kXBwY1FM8RHKbIR3lJOiymTo6pi5Z0=;
	b=dj+UJ+twVf0SJLCCGVJVjccUOZ6Im5PQQNEYIglqpEbXxxUVLE21Apxc8xM/SjFU64
	24nK4LJf4lmRKWTZcS3buB0NIfgZ4+4tUgVXEEanGukQnG5WIpIGj+rG3qT2SG+REGeC
	x/hrMBxAGMKULhfNGWFi18C2XW0CPLEEu1NmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=kQ6wFCkySlSnF9aICGET1CpgSNtrajqPKB0tjeHHjDATEyLfXZ5ogGOBmTIMXeDIVX
	cU+fpuwozahymM5o5S8eB5qT60D6Sd/x9Hag0tkZtWLmrq7R76hCMQVNIJ3biQOk8bT3
	rUq595vksXt1xIlL7t9WVxjJ8Y1ONdXzKnJKc=
Received: by 10.142.72.12 with SMTP id u12mr5759499wfa.159.1290469035381;
	Mon, 22 Nov 2010 15:37:15 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	e14sm7061551wfg.20.2010.11.22.15.37.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Nov 2010 15:37:14 -0800 (PST)
Message-ID: <4CEAFEA4.8020005@gmail.com>
Date: Tue, 23 Nov 2010 10:07:08 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] busybox-config.inc: Fix build when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Mon, 22 Nov 2010 23:38:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


  mipsel-oe-linux-uclibc-gcc -march=mips32 -Wp,-MD,util-linux/.fdisk.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG  -D"BB_VER=KBUILD_STR(1.17.3)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -Os -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os   -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(fdisk)"  -D"KBUIL
D_MODNAME=KBUILD_STR(fdisk)" -c -o util-linux/fdisk.o util-linux/fdisk.c
util-linux/fdisk.c: In function 'seek_sector':
util-linux/fdisk.c:522:2: error: 'off64_t' undeclared (first use in this function)
util-linux/fdisk.c:522:2: note: each undeclared identifier is reported only once for each function it appears in
util-linux/fdisk.c:522:10: error: expected ';' before 'off'
util-linux/fdisk.c:523:2: warning: implicit declaration of function 'lseek64'
util-linux/fdisk.c:523:22: error: 'off' undeclared (first use in this function)
util-linux/fdisk.c:519:22: warning: unused parameter 'secno'
make[1]: *** [util-linux/fdisk.o] Error 1
make[1]: Leaving directory `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/busybox-1.17.3-r38.1/busybox-1.17.3'
make: *** [util-linux] Error 2
make: *** Waiting for unfinished jobs....

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/busybox/busybox-config.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/busybox/busybox-config.inc b/recipes/busybox/busybox-config.inc
index 26ccec4..723ec0e 100644
--- a/recipes/busybox/busybox-config.inc
+++ b/recipes/busybox/busybox-config.inc
@@ -14,6 +14,7 @@ def features_to_busybox_settings(d):
 	machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IPV6', cnf, rem)
 	busybox_cfg('largefile', distro_features, 'CONFIG_LFS', cnf, rem)
+	busybox_cfg('largefile', distro_features, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
 	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
 	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-- 
1.7.1



