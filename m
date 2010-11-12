Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PGhM8-0003ik-DM
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 01:19:05 +0100
Received: by gyf3 with SMTP id 3so1644278gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 16:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+OhKdTGlFTF5hNuFfgEoA6ideC+KheKsa/9yoAf0B8A=;
	b=xDyHZ9ewTpNP24qEABSbE31CY0oVXTgqwAaDUmbmwCBKXTPYxX3SEV6ul++b+8ku53
	79sOXukvjJ5Xti/jfP100mBmsTnITM53ZhO9z/J0uXl/7si4VVlgOOtLaGiU0Vv43Sb5
	SaQ/FEMLoQ1iUgQBbc+QQm2sXge1chKdZ4Gp8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jbggLwuPb6UWrwRc1ePIRFUtmf6muF11a/mobfX5WiEHa0kvR3AuQu6RKDSUMAgLg1
	Wld7/tfxz0duYRDmncpr4ydTnPUYI50IgDp5RC2EnrDzf5sy47jfNvyksdFQkvzKva/n
	feTot0zDeK+1kO/n0ciW/21Uv4jnNfGBiEEwY=
Received: by 10.151.147.17 with SMTP id z17mr2933683ybn.79.1289521083547;
	Thu, 11 Nov 2010 16:18:03 -0800 (PST)
Received: from localhost.localdomain (201-43-68-82.dsl.telesp.net.br
	[201.43.68.82])
	by mx.google.com with ESMTPS id v39sm286622yba.19.2010.11.11.16.18.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 11 Nov 2010 16:18:02 -0800 (PST)
From: angelox_123 <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Nov 2010 22:17:54 -0200
Message-Id: <1289521075-13563-1-git-send-email-angelox.123@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <angelox.123@gmail.com>
References: <angelox.123@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00, FS_WILL_HELP,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] metano.conf - Added on image file name the IMAGE_BASENAME * Added IMAGE_BASENAME on Metano Distro configuration file on IMAGE_NAME * This will help we to identify the names of our images :) * By: angelox_123 (from IRC #metano_linux), developer and mainteiner of Metano Distro
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
X-List-Received-Date: Fri, 12 Nov 2010 00:19:05 -0000

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



