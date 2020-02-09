Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 66C8B6028E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 11:42:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c9so4068356wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 03:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=w0IfyUcKI8M+s+n1TuKU+C2hJnsC2x/uNwQgbPvPsCg=;
	b=SA/pgGQmjTW+YlZ5FLbnJ8WjIUkEeEwaWnnbA8nooc1Litw+mJ7ob7F/S8XaQ94gf9
	WYBZqlaoiKZ4zBO/LfOTyw3zUYq1as3vlaIvK4L0qzD1VNyg8q+bQRls4/dTf9ZrcJdc
	R+zyUo/uF2I3u7OOzoC/0R/mXbWKatIzS06Mm6VB5BNjeXEWsM7A+ZSi7bMB7tMaa/RQ
	9xmR2CRQZBSH2/q7XlQ+X7nV/5Ene8tsJPGVViE/rDY6Ov9HQs1Drh2e0HOViOknyXiR
	Cfa/vHl1INSaXYIaYAwuc6PImv5XPHzJHNfEdMq+T78QDD6VPlhOwrIuVjdYMeeG4RX1
	3a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w0IfyUcKI8M+s+n1TuKU+C2hJnsC2x/uNwQgbPvPsCg=;
	b=QeA3FepO4SGXAPO7+N9aE7JBJVY8KbgwhpxIqerCZ3gBPtYKLr1FbmYB6ULvwV4oO3
	Dd9gl9wfeJE7EDEzLQMy25tYpRhdPET5UHzBQHg5wCF7WFnFeshifj/rF+OWZuh0WfgO
	8Pciiv24s++XVFQccx3PBlgKHcmfLVDUin2YGMhq68awBnLPuUV39Twk+wdnuYULSU7d
	8eKruBQnMvoFOFu/bbFwHQvZkKpbQKiDUPV8Uk3qpSXi4e/W0O4EbWElWMXabOJrPSAd
	uNRVxF+IcIOIu7goqpIANQORIBubrZa21MuL7wMc8GtcxRQ8lQI1/lfN4fbcLC7qHBXf
	tOPA==
X-Gm-Message-State: APjAAAUM+zx9m3IssJgvfZq3R8/ZbEZ6rG7zn4mDiTRcOItAX8Me+LgJ
	LsF0XJmLeciZmW+UrAWb87nor8T/
X-Google-Smtp-Source: APXvYqxpT8oWhwRrp3ixxIpELt6Xv9isQ465AMlcAthrZ2QXLmVoM3/bpUXCL/ajqB/H13iQLE8cyQ==
X-Received: by 2002:a5d:4702:: with SMTP id y2mr10407148wrq.37.1581248565068; 
	Sun, 09 Feb 2020 03:42:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	a13sm11828426wrp.93.2020.02.09.03.42.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 03:42:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 12:42:26 +0100
Message-Id: <20200209114226.2584-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209114226.2584-1-schnitzeltony@gmail.com>
References: <20200209114226.2584-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] packagegroup-meta-oe: remove babl/gegl/gimp they moved to meta-gnome
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
X-List-Received-Date: Sun, 09 Feb 2020 11:42:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d5789a758..07f71c8a5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -172,8 +172,8 @@ RDEPENDS_packagegroup-meta-oe-gnome ="\
     "
 
 RDEPENDS_packagegroup-meta-oe-graphics ="\
-    babl cairomm dietsplash directfb directfb-examples dnfdragora \
-    fbgrab fbida fontforge fvwm gegl gimp glm gphoto2 libgphoto2 \
+    cairomm dietsplash directfb directfb-examples dnfdragora \
+    fbgrab fbida fontforge fvwm glm gphoto2 libgphoto2 \
     gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer libsdl2-net \
     libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
     libvncserver libyui libyui-ncurses lxdm numlockx openbox openjpeg \
-- 
2.21.0


