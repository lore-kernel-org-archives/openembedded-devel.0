Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 43CAC7E405
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u16so994910wrn.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RDL9couIu6Fq7ws+ujL/SfZAajUkeDqDF5VmpDcNAZ8=;
	b=Rx6AIfD0JyHJpN5P0AnySYU4f5uZBG9+iXjPuoe71G7yCM+tgWEBKzwcqnNVBrt2bw
	RkyyGqLkG6ItbEjFO7tF3YHTY6/+1UwfLkeW6dh+OLzBpKUGEDtkWyt9gevKsaXFjM3O
	80ZjLulz+Hq3RAqMfu3wjl0qQbNtq6DRLtHAL9eu1LVwH3EfZiYxY+SiYu08+HjgbXJf
	8/iMp42W9AiTV+aXzOPYdpxb7sqDmQhazEy0zgqzTtx5sH2krkt4pjOohermcFiOKplp
	Nr92pK0K8okUIR4SIDTIaygajx9a1shcoUlErprDSCLNKkXauxsziG4LiP9cq2gysGen
	M67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RDL9couIu6Fq7ws+ujL/SfZAajUkeDqDF5VmpDcNAZ8=;
	b=VzYJh2pYAxMHZ9aSSDOwRTKm7v8sCqqtbOF1AiW5qO7CVL745Rw1d+2AYYEx7F1tgR
	kELGhqo8y22bCFtp7IqYHFjtJdD8YymgbTJRgRBOaEVXID+KoYmMvjMei+qaz8O6NjVJ
	kNyemiPl8I9GIVTz/WTzqZ9IOUEW31K7hLyHzoh4LvDmAdlLL7AYDER3gCPt7gqG7gnh
	eQwlgi8xMDqm5lmmoeNIZYiGVWVdnRG1UaqfFIS2V3tnCxhIvcM4KOtn5L+pPipu+eG8
	X0Wet6H+yNhzJXALikneoNPq4qrLF1fRQ5aV1p+S3J48G6e3PerfU6ILBNdhxNCuYG1N
	4utA==
X-Gm-Message-State: APjAAAUhQ9p7WMVSzBZUM42oO9/W9S/O2nqywfLhwmPyE/rwx+YgU7XZ
	gMFCfTXKyVj+XHvYeaqnjRi0qjEZy8Q=
X-Google-Smtp-Source: APXvYqzD1RmNatAExb/+k/Z337vkGUP5FpHzVXHei9BSJ7+kYHeaZ6WAzfF1DQ+IDivj1r8gMbr/ew==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr42462507wrj.262.1558594158871; 
	Wed, 22 May 2019 23:49:18 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:30 +0200
Message-Id: <20190523064859.24336-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/41] gnome-bluetooth: add upstream-version-is-even to inherit
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
X-List-Received-Date: Thu, 23 May 2019 06:49:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
index 181cb1f68..e6565ee09 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gtk-icon-cache gobject-introspection gettext distro_features_check
+inherit gnomebase gtk-icon-cache gobject-introspection gettext distro_features_check upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.20.1


