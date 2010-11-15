Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PHmeA-0005Jc-S3
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 01:10:11 +0100
Received: by gxk2 with SMTP id 2so1673797gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 16:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=jy+Uub/Lu2Czai8q0+AjZKOV1W3rueC7mmbRV9wa/ZY=;
	b=lw/7cHpgey4M1xsGqCjD63hoVoELQVGwP5jnkoVdUIizUH1aXQKO8IOm9i+YhKfm83
	bFuRmQmJQKkwHjpz0TC/w1vu8sqybwdwKSiE6/Lb9CD3eDFxENfocdePMqQbhs/A4k4k
	FgiCQX2pFK0jR8xvXqGgHfNSrXaf1PwkHYEDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=glZmtAPAYyw828YoPkAZGvVZZDVc0RnSjJSMTIRH5t+8355el++nge6pljSS3rHWak
	iM1HI8MP1WB5Jr2oJszjEFNk6EItUWT/0bjxUrxf3aYP8bgdTo6EQKkwaC1jIzHuY3gd
	7IWWEvcyXXO5BNRCuNXN9uzihmxkRS+EdBArs=
Received: by 10.90.30.6 with SMTP id d6mr6916888agd.24.1289779746870;
	Sun, 14 Nov 2010 16:09:06 -0800 (PST)
Received: from localhost.localdomain (201-95-47-20.dsl.telesp.net.br
	[201.95.47.20])
	by mx.google.com with ESMTPS id b22sm3071744anb.35.2010.11.14.16.09.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Nov 2010 16:09:06 -0800 (PST)
From: angelox_123 <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Nov 2010 22:08:57 -0200
Message-Id: <1289779737-9728-1-git-send-email-angelox.123@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <angelox.123@gmail.com>
References: <angelox.123@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] metano.conf: Fixed "Missing unbuildable" errors with gpe packages
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
X-List-Received-Date: Mon, 15 Nov 2010 00:10:11 -0000

* Remove gpe-filemanager and gpe-mini-brownser from DISTRO_EXTRA_RRECOMMENDS
 That change'll fix the "Missing Unbildable" errors when we try to compile some images

Signed-off-by: Angelo S. Mavridis Bartolome <angelox.123@gmail.com>
Signed-off-by: angelox_123 <angelox.123@gmail.com>
---
 conf/distro/metano.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index ae29e7d..4b47250 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -56,7 +56,7 @@ IPKG_VARIANT = "opkg"
 #############################################################################
 # IMAGES CONFIGURATION
 #############################################################################
-IMAGE_NAME = "Metano_Linux-PD.Edition-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
+IMAGE_NAME = "Metano_Linux-PD.Edition-${DISTRO_VERSION}-${MACHINE}"
 
 CACHE = "${TMPDIR}/cache/${LIBC}/${MACHINE}"
 DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
@@ -119,10 +119,10 @@ DISTRO_EXTRA_RRECOMMENDS += " \
     kernel-module-ext2 \
     kernel-module-ext3 \
     kernel-module-af-packet \
+    mplayer \
     alsa-lib \
     alsa-utils \
     nano \
-    ${XSERVER} \
     avahi-daemon \
     avahi-autoipd \
     openssh-sftp-server \
-- 
1.7.2.3



