Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PGhSO-0003zW-37
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 01:25:32 +0100
Received: by ywo32 with SMTP id 32so225299ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 16:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=tbwUi2QHFZtP/tuDVZGIAyeWHTynJp/3r3r+5DIwGSY=;
	b=wsQD2ijUZdXHtmRt2adb0r2YX6APAc+9493Y15tKtGFohsc1mbjPvnSFd3BzgSOxBc
	jEeV2k5F8SF6cIBpIGOJ1JQytLazkBxBtyKWTRNKaJwNqSVqCXgi1rv6tOAIpdRUDHd3
	knJwTbmcXGmhspZzuM/w1vxSlnbDPlwCiF4A8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LEBIiAzD/Z6i9mIH4mwOxcpJ4kX8kIs9E3iscW4QTDsvsEtkAVYyItYTBoyQVP83hV
	UzczRRGLyPO9AYEB1zncrj4EnhevWOp/Lpl8wmcB5cxhO3R0XpBm+foUGdmrUOaQmhXM
	9UsFHKLDVxwkJApG/WaTvpVnVY/zMSM5oznJc=
Received: by 10.150.49.10 with SMTP id w10mr2703233ybw.173.1289521471521;
	Thu, 11 Nov 2010 16:24:31 -0800 (PST)
Received: from localhost.localdomain (201-43-68-82.dsl.telesp.net.br
	[201.43.68.82])
	by mx.google.com with ESMTPS id q8sm291545ybk.12.2010.11.11.16.24.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 11 Nov 2010 16:24:31 -0800 (PST)
From: angelox_123 <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Nov 2010 22:24:20 -0200
Message-Id: <1289521460-13782-1-git-send-email-angelox.123@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <angelox.123@gmail.com>
References: <angelox.123@gmail.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] metano.conf - Added on image file name the IMAGE_BASENAME
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
X-List-Received-Date: Fri, 12 Nov 2010 00:25:32 -0000

 * Added IMAGE_BASENAME on Metano Distro configuration file on IMAGE_NAME
 * This will help we to identify the names of our images :)
 * By: angelox_123 (from IRC #metano_linux),developer and mainteiner of Metano Distro

Signed-off-by: angelox_123 <angelox.123@gmail.com>
---
 conf/distro/metano.conf |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index 9bab8d9..ae29e7d 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -56,7 +56,7 @@ IPKG_VARIANT = "opkg"
 #############################################################################
 # IMAGES CONFIGURATION
 #############################################################################
-IMAGE_NAME = "Metano_Linux-PD.Edition-${DISTRO_VERSION}-${MACHINE}"
+IMAGE_NAME = "Metano_Linux-PD.Edition-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
 
 CACHE = "${TMPDIR}/cache/${LIBC}/${MACHINE}"
 DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
@@ -119,12 +119,9 @@ DISTRO_EXTRA_RRECOMMENDS += " \
     kernel-module-ext2 \
     kernel-module-ext3 \
     kernel-module-af-packet \
-    mplayer \
     alsa-lib \
     alsa-utils \
     nano \
-    gpe-filemanager \
-    gpe-mini-browser \
     ${XSERVER} \
     avahi-daemon \
     avahi-autoipd \
-- 
1.7.2.3



