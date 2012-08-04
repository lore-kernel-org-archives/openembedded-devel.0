Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxkmw-0006GU-5g
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:17:30 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so2960879pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fgRCVT1/0dvBXx19uMxpj6ugx+p5jGOcotSvv1ms8NA=;
	b=O+EFtS3Vc8FHUgyW6I9eLO4pxLoUxrXpbx69QToeM5vRnB/rd4QlPOhHLxtpyVNh9J
	cXMVbo67ipV1xvFVnuFqQRMgGAZShmW2cZDfalSxU/BxOyQWsV2MXtupIJnCX5oDrJHn
	avEGocJESYZzzsuUoEdGBllEhhZB2GPbuSF+a6lDvh1quuJsvVbqBgKIIO1kOBMcYbGQ
	+DzJJiAzeC5O849KoHzqsHsucPsxWrGDz+EQui5DcbMZdM3Avu0QL2Ac2NMLgf4SEFK1
	X+jA+u351QBWirl8Q3Wl7KZi8jdZft3o8KAbBibbGRklvOSylgV8CfJ2x3jiz2cEukl5
	NXMQ==
Received: by 10.68.201.104 with SMTP id jz8mr7209301pbc.160.1344110749669;
	Sat, 04 Aug 2012 13:05:49 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ro7sm427008pbc.8.2012.08.04.13.05.48
	(version=SSLv3 cipher=OTHER); Sat, 04 Aug 2012 13:05:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 13:05:32 -0700
Message-Id: <1344110736-6999-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
References: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V4 4/8] busybox-syslog.service.in: Create alias for syslog.service
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
X-List-Received-Date: Sat, 04 Aug 2012 20:17:30 -0000

The default syslog implementation should make syslog.service a
symlink to itself, so that this socket activates the right actual
syslog service.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/busybox/busybox-syslog.service.in      |    1 +
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
index c6c625e..2e04321 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
@@ -10,3 +10,4 @@ Sockets=syslog.socket
 [Install]
 WantedBy=multi-user.target
 Also=busybox-klogd.service
+Alias=syslog.service
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
index 915a50e..bb11550 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.5.4



