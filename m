Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 703E678A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:31 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j20so1315888pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7sPMuF9hK8oe/FDkgJ4MjMXX7PMhbq+orq2OVPgCuQw=;
	b=DE3+MoNJhg6NzJ8uhVWeYlK5x0C1YJus6by1YTYwWODgll7pEoLTyg8Lm665new5+j
	NGNRjTZHDu2POkXVtjULyy2HvkZ2fl3+Zfj60hErWTUY67QHivoVUMNUNMqNx8ER2oEB
	UzfVApSxSVzS96/eeUmZ8XQkKr9VXHqhkxv8jNvx2rXPZh3K7v1sYesgggKGhOhu2GhC
	KB6W+shwh5g6BjajblD+A2cmIzeJpyWcjzHOd318Ry/khUNZRj7LQYUtukMoT6Xiwdwj
	L1ZHlBLAIhZ4Mo44V2JyikIF1eqU050nHy4TtLUSJqq6jEce/6LVPR/C/GUQhsQwD6N+
	ERqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7sPMuF9hK8oe/FDkgJ4MjMXX7PMhbq+orq2OVPgCuQw=;
	b=iHsVxY/SHFAvd43xzv1etdA3xwkL4ZE/U/trcNnLxHLEonja4YJAJYenEfJzPHMOGU
	1g9LAGGcsia3vxacmHO3rGDCaIXPeeOzAdsSo9OfPhgScInX4aUh6akle9ddvhh4xJVL
	pgq7PraAlKT12gH4lWvWhn3ijXALBt9D/abgGAfhQw1nyfMGr+In0Upki5q/O8J0WRIs
	ezzDyCpeMAr8bHQygt/leH7TQnnyp62+XeQagSAtU1iNpPKUlo8ltCfSElz8cy5HiA/1
	ByM3PqYwafKcUUG8e5CJG6p/Bk7EWzxtEhWI86P9M7BRYYBf7gvIhVY2CUIHJbYNBqxE
	YQrg==
X-Gm-Message-State: APf1xPA1FJYT3VIdlCv3N+I+HKzFrizE7F7G+9uCa7X2PMSuQXQFfK8r
	io8FjmtNK5AY74KI7juqATM=
X-Google-Smtp-Source: AG47ELvyq1ZFBPQpMns5jYgehpRCrWtmnm0HjJXye28AWPNdjqP9jjXjgTI8Og5olx08z9AMtO0oVg==
X-Received: by 10.98.61.133 with SMTP id x5mr23690613pfj.181.1520449292828;
	Wed, 07 Mar 2018 11:01:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:03 -0800
Message-Id: <1520449275-29492-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 11/23] network-manager-applet: only include when x11 in DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 19:01:31 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.4.4.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
index 14b336a..d6e1db0 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
@@ -7,7 +7,9 @@ DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
            intltool-native \
 "
 
-inherit gnomebase gsettings gtk-icon-cache gobject-introspection
+inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.7.4


