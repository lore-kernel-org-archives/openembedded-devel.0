Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38E6471E1D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u63so15683240wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+I75VvY0Of9NfbFD12pH0Uk4zQJzq6WJeVIoSjcnT/I=;
	b=De7x2xbSIYCbHqPr/XKj9f8yId5AUerUj4bCbKFvYR6R7/Wy3txa5E5hUrALriCnLt
	P14Thrr5WVmdo9eQUj8w9VUEbkiNIvDCu5XBXeiIX+47zCWChZtIOyu+xOsVNm8ZDsdn
	ktmqib2973FSov7yZuBx/1tCDhPnkkDiacp9csBEWDB/9IfN/4sQrbZYoRSWhXyGgoxX
	DFyeTOSNX945NzRNQYchR6/QbBh8u7JsqiAnILZL4VfItDE4Lv7+19J42Ms/9UmKZz1B
	3eyZA9IvjwlVuj3bvUTlJsT1s4J8T/t9eMorsEFaLW8rY+aiO4cr78Z1toeSSRdL/I1G
	cnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+I75VvY0Of9NfbFD12pH0Uk4zQJzq6WJeVIoSjcnT/I=;
	b=B6Co1wHKYTxI+6GN0oQXjyu+yemN40XMIojXRKA+BTsHzppM6LwQcjP/UPxMz6u2ls
	LInzWWJIK/R/DCYntjJ1bv/qew7NoNX40ZJzaQruirqls4UFjEqQUWR7h1O1QJuo6mv7
	unt6mipXkmBmBvZ0fhsXcRo6G+BlCZMew4YYbN++1YPp1BUcWzQpXVyLY++aCwIy3lN2
	VW5xfZcehK8RfbnxkW3pLfntoJUmG/Dw2mYgajU4HKLczEHZ2veXsF4pk+nJ1rqugSe2
	EUnc6AFZNTUlAtt9qs1kEYF+XW8KI9SFNo29svchT3EFP/5T4a/pClfHCg3jSUfFE3ml
	rUgA==
X-Gm-Message-State: AMke39ljYX4B5pYRrZoWOsRvxNfLujgADDbJ6iDGLGax1uaQhYfeZS5j1LohTvoSbJLMjA==
X-Received: by 10.28.214.144 with SMTP id n138mr19410864wmg.136.1487614052091; 
	Mon, 20 Feb 2017 10:07:32 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:32 +0100
Message-Id: <20170220180700.29836-17-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 16/44] tumbler: add dbus-glib-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
index 0b1e328..1f5419a 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus speci
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf"
+DEPENDS = "dbus-glib dbus-glib-native freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf"
 
 inherit xfce gtk-doc
 
@@ -27,5 +27,3 @@ FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
                     ${libdir}/tumbler-1/plugins/.debug \
                     ${libdir}/tumbler-1/plugins/cache/.debug \
 "
-
-PNBLACKLIST[tumbler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132828/"
-- 
2.9.3


