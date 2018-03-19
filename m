Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id ACE9A789FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z73so15709647wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rmREV33CKJuSsG6VLmRpSoGXZRE+tymb6YBMUJLsH0g=;
	b=vXd9yKMqh1y0rMlZZtqPlHoPkTbDOzyVdR8Og+bDx3JAuklyFl2uHNxDwOsizBX5fq
	6zPTfhW1KJVUqYNOXBKr+Edre9iJcuk9o2ENc+MeG+N/3maYV5SzQ/qNyrfkW2K1N3uD
	RfZzirFKyXFLADJh6ZPT/BAIFZMGHh3w2ijyYzjiZucQR58rxMy1f9UbktX5YgN0GBhh
	mo5JWltX4jG8XHB50YQMUE69w//YxRIU2jqUSmsILJVoTrka9AmeZJrKMCKKSHcLh2Vx
	kgxprqhWTyUmWnXLWe8Fxg5tyLjC8NWqeKxvo/ntuyExHvD5/WWAnD+5/oVEUPfPqJ/U
	U5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rmREV33CKJuSsG6VLmRpSoGXZRE+tymb6YBMUJLsH0g=;
	b=QqyncUapZRasguaZttBwAZdix3hwviBw/rZEwy1T+RIG4hgZWOZUcp1p2bdrwndwJz
	Hi5yg0DFXagFoEAp0j+lylix/T9LJQglFtHLsDPX3R4QTdD7Y4yFTUocMBxutAPlVuVl
	R3oRL2M6qBfx3URWNeqKn++/djbmELqNUp/Ynxi1udwCMeIcD3ezheHoEFxjrPhrQHy2
	ZKXuw9d2uq7R+Lywd1syL2kvLlDl4YF3qEJrcDAMkZfrK7fitAnQjhjWn+XjwPtYOTxl
	627J4Epz/ICa7Ee0iT2qvfbn6nB9asJEK727YfuFTKqRw5j9QnvCjIr9H6+Sth1TRsUa
	CYuw==
X-Gm-Message-State: AElRT7FGlgcU5WGuY6A6HpLlf+Ns4aXSyM6+Aq4mmLo4JplxNeH+X+iU
	yN11yHCEZIkwzMFzqZ7JLZkdow==
X-Google-Smtp-Source: AG47ELs/+q9YWsJNJ9m+WG0qL4pV3Fsx060oAcCgSWu4v+QTfb5lxHOsLgpWyMw28/RxC7Pu3YVi/w==
X-Received: by 10.223.170.213 with SMTP id i21mr11137940wrc.10.1521491374263; 
	Mon, 19 Mar 2018 13:29:34 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:04 +0100
Message-Id: <20180319202911.30760-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/17] gst-plugins-base: remove gnomevfs packageconfig
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gnome-vfs is gone

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index a3bfa5fe8..f2354648d 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -25,7 +25,6 @@ EXTRA_OECONF += "--disable-freetypetest"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
-PACKAGECONFIG[gnomevfs] = "--enable-gnome_vfs,--disable-gnome_vfs,gnome-vfs"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[x11] = "--enable-x --enable-xvideo,--disable-x --disable-xvideo,virtual/libx11 libxv libsm libice"
-- 
2.14.3


