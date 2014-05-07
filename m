Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9A365EC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 19:39:39 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c41so1047167eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=N6MuB85eeBYfED1sHuiy6HXV63y9AqPNEFCurU6cI1Y=;
	b=hd4VjZYemUHh0RgKhRKl+v/ovGaracPdgqPeYTNpAopWbsLsDCSSN2qu0AdOCn2LAq
	3f3r9iFxYQ40RvVA6HPlF5rp06MZJp+XVZS0YU69Sy2TRvm0RI74V2qfp5c6GjTR1Q1d
	5KhnYk6W1swdQfQASqmNfXpHiE11Sdcg3esszWAjjb1uYvggR1djnqumEMTb3C1cqu8Q
	v2LSgCe78d9x1QtAfpZ01xxRGANgqbwQdpA8kW4iqqARmpLLyOWPEW/3g0lYUYixbBNN
	tOb3bLn33+dgNm+/DPf2/4NDmm6sqAj3sBculZYOvPzpJhXP3VD1uIaOgRmJDZEmoX2q
	UhCA==
X-Received: by 10.14.207.6 with SMTP id m6mr17795344eeo.79.1399491580612;
	Wed, 07 May 2014 12:39:40 -0700 (PDT)
Received: from localhost.localdomain (p5B0A08BA.dip0.t-ipconnect.de.
	[91.10.8.186])
	by mx.google.com with ESMTPSA id m8sm48389547eeg.11.2014.05.07.12.39.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 12:39:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 21:39:15 +0200
Message-Id: <1399491557-3073-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] xfce4-settings: add upower to DEPENDS
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
X-List-Received-Date: Wed, 07 May 2014 19:39:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

detected in Martin's world with test-dependencies

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index b34bb7a..290ec3d 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Xfce4 settings"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo exo-native garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
+DEPENDS = "exo exo-native garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier upower"
 
 inherit xfce xfce-git
 
-- 
1.8.3.1


