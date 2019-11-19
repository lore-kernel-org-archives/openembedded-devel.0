Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D33147CE5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s5so22492563wrw.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=v888auV6p+2QDStuleMdL2BLnN8vLTxa+T8teb7Fa7Q=;
	b=eF9GW9HN1UFlD62ovfO+hId57QmzQk7JTBuHqVFLQM5JF2W+U9/i+C/hFOqZce4ref
	89yW/GDV9AzsdWYLwIcjKZntqI62RiCDvmTfIKaHLHpW69xkrDZKICksO5wzEe99to8q
	Xlh0NK4eFPrM5uKnEkp05WNqwU2GOwuew7l1X5661xsznvZI+sxB1QnRU5yOQiwtiGp0
	QSWTItnPkpQkpjamn1fhBfFPoMqz6DELruAY+GOLtsu2tWwRNcbUtEu18X4/CaOKVI0u
	q1ahiZ2xIURNuwZ1SCr4DO/OlR3bjY9dAL/SIDQNGnQFzyZhgfWF2meY7P7/D/N3/vzK
	pq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v888auV6p+2QDStuleMdL2BLnN8vLTxa+T8teb7Fa7Q=;
	b=FUJzNGoQU9LEK73jwpUls0bwmY9HEK8XK+10JwHeb2bS4D5mplj0CUEfYqSbu4wrZn
	XRDElfIGATwee/n5WrPrkSd1C4vuR2lYrcCzsvKjtd35ykQhaq4dHP3qbXMhtJW3zsz8
	HRUZJkcgGmwyjj02Id/OSfX+grR/qSEkreD+qMUL/1JN3DzWnrnzfyfktQIZ7GF9FjG4
	omkdUdg0aizF26aeLU3iX8v6Ixs8l+88YoOzGaHDJJwyx+O7oyAnnyT17FbOARHiY1bX
	y0o8qZVy/iVduth2EFDj/lxOapYE7cSyAA2sSeDObbRfqrqQR6p6TAOsxzAqGIM2Dgvt
	HPTw==
X-Gm-Message-State: APjAAAWVHtuM2PBVEj+qQE/vZBgMUvYG8vrAD49pGrWJVFBDL45EmL2L
	O6tnaXD4oJgy9oSgO1Ii7HsG0Bti
X-Google-Smtp-Source: APXvYqzwJlQyWW5++Evt4jNyI/rpcLULE3QLiBxdQ4jzQ8/eO3wHRQDHY7sCsE/yS1Kq++AbTFu5Fg==
X-Received: by 2002:adf:c449:: with SMTP id a9mr24232925wrg.240.1574147862307; 
	Mon, 18 Nov 2019 23:17:42 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:23 +0100
Message-Id: <20191119071730.2682-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] tracker: add gsettings to inherit
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
index ad65630c1..5153aa517 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gobject-introspection vala gtk-doc manpages bash-completion distro_features_check
+inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion distro_features_check
 
 SRC_URI[archive.md5sum] = "5e75b611b190c4cebf53e3de15266429"
 SRC_URI[archive.sha256sum] = "b6748726e465ad2f4d991560634b1fd0df8841f3d981b3b837c4162abedf08a1"
-- 
2.21.0


