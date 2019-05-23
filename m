Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id CADA37E457
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id j187so4508031wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=htQt3hqiEexvAI2RWplHEKewRglQ2Wq+tR2Lr1qTlYY=;
	b=UW/5IdyNe3I4xMSsvPQ7Al4Qsx1Fym2Vp5GWuv0plUB7QPbz1W9QJ0ntanXXf8t/gJ
	SJhOOTqWZEkONumjql2DU2eUlHjnmnTvieXnVLzpl7U7MqzozMb6nslYYf+frPBwpUdp
	q8EsxEToTwpl+jcS2ldt3mWb0vCVNdGdeldnhPNgg1vPYkQ3g9yhib4//wvU6J7hL3DR
	QBqWIFZE56iOkbvJ/GDZNBTD6Zvx1IqdnHb4vGhBazZZrsWtAQHmVIYdGa6ZYTuCP462
	uhplehRAp64UH+N/GGkZ+wNZxvkeC59b4MWBvBrS2xThg+a47tiCD/eZLqS6S+bnA9iS
	G8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=htQt3hqiEexvAI2RWplHEKewRglQ2Wq+tR2Lr1qTlYY=;
	b=rwGUwG0I1AC6rlZNWAIPGV2XMXNolz5TeBkzL2X/t1T4mAU2UWzXf2rgv7iJNVeISX
	bc1dQyc4nmxTKjO+qOr1DE2l2ZN8c+Kuq6h6Bfdmg2/KpyGWPcHFlqjSm5v4A9v7lr8r
	6edlxx8wiAkLhVDUBd/s2K6jSFFuL/Rvrv0RSC4uuQTU77+JNABXu95XrF9gxJnGdyny
	LaK69bv9B0CxGhBjhuIqyjOqPuyMc2YPIkLjAa8e6L1FZqXFqNwM3KY+Txy2y0L4pOF2
	n9R2ZEtssEngLkJnlP9whcFmUGNW08+uGCoFPA8XMPRIVaJCmVEF1xUopEFYAvwVFjNe
	0h7w==
X-Gm-Message-State: APjAAAX1/gQn6FnLqj6hS9NSGduYlFj7/w4dbdHuiectaNj6r6gfmkSV
	qDjBLMUronvkw3KPssB8hPWBM1GsJ4w=
X-Google-Smtp-Source: APXvYqyjdU59g997N1AhDPabPmmv8VHJB2oKpEOhf4jXeoaSl1zNi3/NbOFQPXz0sR5p7J7U2D5++g==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr10813587wml.77.1558594178429; 
	Wed, 22 May 2019 23:49:38 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:53 +0200
Message-Id: <20190523064859.24336-36-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 35/41] libgnomekbd: cleanup
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
X-List-Received-Date: Thu, 23 May 2019 06:49:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* cleanup inherit -> EXTRA_OECONF_remove can go
* remove unnecessary DEPENDS
* remove GNOME_COMPRESS_TYPE = "xz"
* rename folder libgnome -> libgnomekbd

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libgnome => libgnomekbd}/libgnomekbd_3.26.1.bb      | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/{libgnome => libgnomekbd}/libgnomekbd_3.26.1.bb (63%)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnomekbd/libgnomekbd_3.26.1.bb
similarity index 63%
rename from meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
rename to meta-gnome/recipes-gnome/libgnomekbd/libgnomekbd_3.26.1.bb
index 3a7379f9e..8d84b79cc 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
+++ b/meta-gnome/recipes-gnome/libgnomekbd/libgnomekbd_3.26.1.bb
@@ -4,16 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
+DEPENDS = "gtk+3 libxklavier"
 
-inherit distro_features_check gnome gobject-introspection gettext
+inherit gnomebase gobject-introspection gettext distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "98040022484406e7ebe25f82cef93344"
 SRC_URI[archive.sha256sum] = "f7ca02631576e9b88aee1b1bae37ac1488b80ee7975f20a97f29e761a7172679"
-
-EXTRA_OECONF_remove = "--disable-schemas-install"
-
-- 
2.20.1


