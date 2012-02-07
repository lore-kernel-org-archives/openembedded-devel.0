Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumtJ-0003dN-6g
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:23:33 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181828eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uHUuVHtMX/YoGRxjNUOhPwYgRRazixYHyIheROPDf7g=;
	b=HJ1Mza6C5gkaui+RzSeCRw1cHjS8vtqiBSduzc4aXjr08IZLcvGDewuEAEUUrVpUxf
	ftdACh1rKhyipCz/ZGbxVDjCFJ2sx/Qm2rfNiJ67PHPNqYTVsLPGCPlYlN2MotGUVvhG
	V30FgK7wAVFhvS0+gziR8YyRzzZuiFt8iAJL4=
Received: by 10.14.126.10 with SMTP id a10mr6713594eei.42.1328627733005;
	Tue, 07 Feb 2012 07:15:33 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id z47sm66752182eeh.9.2012.02.07.07.15.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:15:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue,  7 Feb 2012 16:15:32 +0100
Message-Id: <1328627734-5293-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][RFC 4/6] xfce-nm-image: remove gdm-systemd - systemd.bbclass takes care
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
X-List-Received-Date: Tue, 07 Feb 2012 15:23:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-images/angstrom/xfce-nm-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-images/angstrom/xfce-nm-image.bb b/recipes-images/angstrom/xfce-nm-image.bb
index 7d36b6b..12c917d 100644
--- a/recipes-images/angstrom/xfce-nm-image.bb
+++ b/recipes-images/angstrom/xfce-nm-image.bb
@@ -7,7 +7,7 @@ IMAGE_INSTALL += " \
 	task-gnome-xserver-base \
 	task-xserver \
 	task-gnome-fonts \
-	angstrom-gdm-autologin-hack angstrom-gdm-xfce-hack gdm gdm-systemd \
+	angstrom-gdm-autologin-hack angstrom-gdm-xfce-hack gdm \
 	angstrom-gnome-icon-theme-enable gtk-engine-clearlooks gtk-theme-clearlooks angstrom-clearlooks-theme-enable \
 "
 
-- 
1.7.6.4



