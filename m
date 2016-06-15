Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFACE73174
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:22:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m124so5940878wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5eWEbDZ3HzqfHb3wMSBFeRi8Dj0fxHtvxT/3zTxRBHY=;
	b=SukaGlzDA+MJOSUicSz1FnzNARhgTe9+gWEY8qYltoy3d3erIhWOvTI4LXA8HesIbe
	Hl6D1H3Zds4ME8k4Ddh/Oc4gqym0Lsy86u9rm00KH/KFqOFF3u9OsIcWVvW7kEmtbhDt
	ZJAkIWL2E73HYtvLZ9FLbtwdPNyYAlxI1L5+Xw0XHdoZQGrnbGeEoGe1u/IkuQONFeRe
	8E2p5yBUR9RDB7dn4BpWy6W9zn6z+VdOucUDpH/I5CM5W72X7vIDGKCiZkEG746F8wwT
	A6P4huuBoTaPTEVyTkAAWhitYmq+EwQvfCK6h0sgjy6yw1Vhsx5PcvJ5yBhAHGBvq8of
	k7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5eWEbDZ3HzqfHb3wMSBFeRi8Dj0fxHtvxT/3zTxRBHY=;
	b=FjhwckuEYnn6JJMnQrawoHbKUPh8LR5ARU8zsrmwj0HFffiFTxDaj4oJ+qDdBGM+8M
	hMtaZWSrBkwUekgjiGhaVAgyRdjmWxmVBEgWc+EKxGPWyo9ufV9MDmuaz9Sv0tIRGQ4n
	9crOkvPoVz++UTzxxVgHLzsff7eQwTZ7m+ow9sg0zgqOhue6n2fYD2H3euKpYK5MFLoj
	jMtxb/jEIVeQoLiaz/6Y1JLa+SFggKJ7mynPfRor3xHTPED9bEkVcNUph/AUEN8Cj9g1
	6ySm6Q6mzjNCw8O+IjR58bXNTNqDTpDsJihhFN+P9G+y6c+PhaGBFtdBTcWBNiOd37Ca
	jbGQ==
X-Gm-Message-State: ALyK8tKImRGYE6F/C/gmtotkZ0El4S/pQHQVdJVFpa6LiJr4lzmmnU+6vw9izf2A4iMXeA==
X-Received: by 10.28.92.20 with SMTP id q20mr12026352wmb.76.1465996934907;
	Wed, 15 Jun 2016 06:22:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r129sm9705750wmr.20.2016.06.15.06.22.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jun 2016 06:22:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 15:22:34 +0200
Message-Id: <20160615132234.23890-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160615132234.23890-1-Martin.Jansa@gmail.com>
References: <20160614120548.10035-1-Martin.Jansa@gmail.com>
	<20160615132234.23890-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] gvfs: remove dependency on broken libgphoto2
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
X-List-Received-Date: Wed, 15 Jun 2016 13:22:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
index aa62070..6f2bd42 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
@@ -44,7 +44,10 @@ PACKAGES += "${PN}-bash-completion"
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 RDEPENDS_${PN}-bash-completion = "bash-completion"
 
-PACKAGECONFIG ?= "libgphoto2"
+# libgphoto2 is currently broken
+# PACKAGECONFIG ?= "libgphoto2"
+PACKAGECONFIG ?= ""
+
 
 PACKAGECONFIG[afc] = "--enable-afc, --disable-afc, libimobiledevice libplist"
 PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
-- 
2.9.0


