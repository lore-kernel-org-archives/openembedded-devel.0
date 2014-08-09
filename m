Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7FBAF60B05
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:48 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so2343572wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/ZNZspBzouaLc6Dv2SiRZFlPotzXRSmLNO1liFWCXUY=;
	b=TUIYtTfEVD1F4g44gTgSDXpj+7L6FLzU1OOxIhZfuIM/Ps+xt1tk9RTSCGMimOLq+Q
	FudFa7lAv2mXhur8T4I/XM92ORm3N9SrDu4TSyg2FHoX8ZpQC2SW2zJFJnOn2EGiZase
	Vytg3n17VhqfX8W1EDtx2jJSbBTvGFBKejQf9HSruRvRKsaSv3oaRweMxFwvrgI1W9YH
	rJGtWVkxdcMfE1nOYcCKjVcR+bmSfOyyFWZQcVKfTGWWmwxSELsI7sRnS8Ik8Mj5uWiW
	1W9P0sdsPfNa14NgR4pzLU7N6wGNf/BfvaWOh29dD2ikXOGK40otwqH5dfjuiMhCndO4
	95/g==
X-Received: by 10.194.187.101 with SMTP id fr5mr2794351wjc.125.1407600529588; 
	Sat, 09 Aug 2014 09:08:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	je3sm20437480wic.11.2014.08.09.09.08.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:39 +0200
Message-Id: <1407600537-10857-18-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 18/36] gnome-settings-daemon: remove unrecognized configure options
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Aug 2014 16:08:48 -0000

* fixes following QA warning:
  gnome-settings-daemon-2.32.1: gnome-settings-daemon: configure was
    passed unrecognised options: --disable-esd [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index fc7321e..729d750 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -16,10 +16,10 @@ S = "${WORKDIR}/git"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio glib-2.0 libcanberra"
 
-EXTRA_OECONF = "--disable-esd \
-                --x-includes=${STAGING_INCDIR} \
-                --x-libraries=${STAGING_LIBDIR} \
-                --enable-polkit \
+EXTRA_OECONF = " \
+    --x-includes=${STAGING_INCDIR} \
+    --x-libraries=${STAGING_LIBDIR} \
+    --enable-polkit \
 "
 
 do_configure_prepend() {
-- 
2.0.4


