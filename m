Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RY2jX-0004PA-Ul
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 22:39:28 +0100
Received: by mail-ww0-f43.google.com with SMTP id ds11so5938413wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 13:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nBIy6vPihtJq0ChKl78yPzyGsGJhlibCdQSJ9eSXG94=;
	b=JrWgmg3nEVpWuZYwiEuN9WKJBDQPUJ64MqleB+0pgk7Uz/kl+CbF3BxJPs2uvEPJk2
	aM9A+14FpEAWrt5tFsW7xe5AIVC21bT8NUlxGraqR0vk472NPktxdQTF5NRPNe9CjiYx
	Ly149ie/ETB8JU3ht1WHv4oghKcA7aCFMfPvQ=
Received: by 10.180.3.37 with SMTP id 5mr19573205wiz.43.1323207161662;
	Tue, 06 Dec 2011 13:32:41 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	hb10sm11492407wib.16.2011.12.06.13.32.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 13:32:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 22:32:24 +0100
Message-Id: <1323207144-440-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <1323207144-440-1-git-send-email-Martin.Jansa@gmail.com>
References: <1323207144-440-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 2/2] mplayer2: fix DSO issue with new binutils
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
X-List-Received-Date: Tue, 06 Dec 2011 21:39:28 -0000

* /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
  libmpdemux/demux_ogg.o: undefined reference to symbol '_ilog'
  /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
  note: '_ilog' is defined in DSO
  /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0 so try adding it to the linker command line
  /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0: could not read symbols: Invalid operation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index a7e0cff..1d4efa3 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -22,7 +22,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 PARALLEL_MAKE = ""
 
@@ -125,7 +125,7 @@ EXTRA_OECONF = " \
 	--enable-select \
 	--enable-libass \
 	\
-	--extra-libs=' -lXext -lX11 -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++' \
+	--extra-libs=' -lXext -lX11 -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++ -lvorbis ' \
 "
 
 # drop FULL_OPTIMIZATION for now, because gcc-4.6 got ICE with -O4 and -ffast-math now like in libvpx
-- 
1.7.8



