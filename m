Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6777C7E403
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:39 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 198so4509352wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Q70kIfDKdfVFmix03TcAoq6Vv9KTDSNAPqJqM2AsJb0=;
	b=BAF5Ii3DGNBNUspRhMzTHh4KkkAkezJLkmNH90uXb9gJQspTemnYgBEO5fYrhhezdb
	ZeOxpixBt6XStSq1QI/QHo3m76TU+gxd1qs6LmwixJvcEgZOJfkODcMGBdr8ykvJub7L
	gEG/o3zy6XdFM2ussFwUGwhFvG3DE2J8+Os6Z8z3/aLGe7euqbFbob0kDprJ0mf/6bv4
	wENce84F7EB9IiH3UdekgqHh7LF1CezlUBL9ojzCnbyIsB5SrBRIxGjLM97GPRFFkPh8
	6v5djaIlvVLWM+n0wGoYKILaGxrARZTDkpNJBWA9C9PchVG1iLp9oNUjJShUZowAu7nz
	dVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q70kIfDKdfVFmix03TcAoq6Vv9KTDSNAPqJqM2AsJb0=;
	b=X+BFIL5ROYzO3IClY/qKADB64o9kHWSfbTfAEMdIjjrVp8NDWUDaOEd2W2LM3jTXnR
	CZ1Sr1IXCdUmriZXRmxBw5sXq5/CM7NP6N+SQHXg9ZY+BuuSvn07N2ZUYf57gaCZcg3d
	Kbh9mHs7h5Zi2DlfMVOLNQNEPl/c19ZFI4uWfwKlobjcBdcnpbNz1QDPMmR4djyF38zy
	ens2ktnP2dloYSxCspc9hEZEmmK1e0dbaKX+d4t7NpcYWDRoOHVx0tu77Yme2Hc+JZgn
	uFByWiQNbCtE6mWND5kZ3tdB7HwGfiUvLDWGU7MKecyaTLMZsjLdz/mu2DgZPBrPHPdc
	Mj/w==
X-Gm-Message-State: APjAAAURESw8J3/YrjZjcCEeIeaShwf2kbvM24Nq7WxuXkGNVYj1Z/uC
	+cqC4NAK+6KZxEN0ud51goyVBHgPEs8=
X-Google-Smtp-Source: APXvYqwJbEizafGgFYHrbqL3ynyrxw4e2PGAarxpshAgSIskUc09Di+pXyN7IuoWSzP/sqFab0228w==
X-Received: by 2002:a1c:2c89:: with SMTP id
	s131mr10023044wms.142.1558594180055; 
	Wed, 22 May 2019 23:49:40 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:55 +0200
Message-Id: <20190523064859.24336-38-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 37/41] rygel: remove GNOME_COMPRESS_TYPE = "xz"
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
X-List-Received-Date: Thu, 23 May 2019 06:49:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
index 4869d866f..0adc721d8 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
@@ -12,7 +12,6 @@ DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstream
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
-GNOME_COMPRESS_TYPE = "xz"
 SRC_URI[archive.md5sum] = "f897167ad82e2e741582f2c393a76843"
 SRC_URI[archive.sha256sum] = "dfd3d885da3ac383ba0cfbf119995f4a0c2bca2cc8f8cfcd3df10cfec8f35cd7"
 
-- 
2.20.1


