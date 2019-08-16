Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id AB3857D264
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:02:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u16so560873wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4AdQW1GVOtmh2HlCgO6Uvo+5KPcZiz6YFwWd38w0Qlk=;
	b=beyWtCRnw5bWzg4Bc86PlKHKxiclgacxR6jZGT9U6ezWUI8yyT8alpXYkbVCIgOrp+
	hAj4ni7DlWf8RFAGeSx0DVO8vSLQwJ0WgKEmFOL9FIiEhCWBb0+V+diSudXRySGsn3Nm
	FbhU/ulPWZCmDF+kjsl/jX+UsIUmJnFDhrTp46qr6ud3TBcQJTj6xqnzTkA5UcWBix/5
	E86WtBOAt0ewH5UoV7bqA9JvfGUcgrDmG12qL8JhqQ3AyVrzs30JhVnePl9uoCiswjK2
	dshZH0Aj2zQfuNvor9wZgaMNLLV5I0X4oSFNbnlLLh7VkwX9ukX25RIz3ApAktlaUpWz
	48WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4AdQW1GVOtmh2HlCgO6Uvo+5KPcZiz6YFwWd38w0Qlk=;
	b=Eh3TSjYYa+RmyZdig0k9bUtiDY9s316PqDzTXvFTrbnRuDsnjsAFoxj/7s/m0iCnIP
	5ZOv5ieFG1kE4BaE53aft7YsHg48lJ/YfJTB7xDLm0YYPuDAtjNHMNTNiqID7oFjuJwI
	Njck4Vaaqw/+kUbvFhwOAu+asnkaOE8eF+yXuLslQOhPpAcD8J3+NQTe1s0iSIiPc1e+
	bG7YUsPEO69YAwdxAAsDO8/L4n3zDjqcCM234FRjtDv9jdUBtwTEWMQWbkP7/HmLXPbH
	sN8FIehLSsU3VmHoN784ruPPYCtBWJ0Q0kfHqeJeFOGYOCk2zo24A81UQMRTMfsDZYAo
	g8hw==
X-Gm-Message-State: APjAAAXsGWR5kmI2Bk838CeBMgKkTyAW+fbECOwY9QA0abNDyZi0Rwad
	hbH+MoQAuKNMkfwE3QWqTCA9lgxQ
X-Google-Smtp-Source: APXvYqzSAcqLTYba9YEKeA10Q5+dgIvBMTYT5H5ssOjzsGJjKTjD/tYKeqHq0yCG9no8hWSEvCg+Bg==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr9298994wrn.142.1565938962091; 
	Fri, 16 Aug 2019 00:02:42 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F04237690C67ABE9DBF2FFC.dip0.t-ipconnect.de.
	[2003:f0:7f04:2376:90c6:7abe:9dbf:2ffc])
	by smtp.gmail.com with ESMTPSA id
	p69sm4653120wme.36.2019.08.16.00.02.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 00:02:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Fri, 16 Aug 2019 09:02:33 +0200
Message-Id: <20190816070233.15416-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2 10/13] parole: upgrade 1.0.2 -> 1.0.4
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
X-List-Received-Date: Fri, 16 Aug 2019 07:02:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This is a bufix release
* Also removed dependencies redundant with "inherit xfce-app"

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../parole/{parole_1.0.2.bb => parole_1.0.4.bb}       | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.2.bb => parole_1.0.4.bb} (72%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
similarity index 72%
rename from meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
rename to meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
index a286a5adb..68556a2ab 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
@@ -1,15 +1,12 @@
 DESCRIPTION = "Parole is a modern simple media player based on the GStreamer framework"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/parole"
+HOMEPAGE = "https://docs.xfce.org/apps/parole/start"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-app gtk-doc mime
 
 DEPENDS += " \
-    glib-2.0 \
     dbus-glib \
-    gtk+3 \
-    \
     xfce4-dev-tools-native \
     libxfce4util \
     libxfce4ui \
@@ -19,8 +16,8 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[md5sum] = "cd22ab579470c5728db0aa6c0b9d4c7d"
-SRC_URI[sha256sum] = "bff0fc846d0d7b8f435ac5514976f1cd1d82b62dbf1b7d470e253a5b439407da"
+SRC_URI[md5sum] = "c23621eb44df292f828e86074d4e719d"
+SRC_URI[sha256sum] = "e92b8ec369e53d921b47d2473c2e2a1e9e04d3c5d536d419abdff40e5e136dc1"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
@@ -31,6 +28,6 @@ PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter"
 PACKAGECONFIG[notify] = "--enable-notify-plugin, --disable-notify-plugin, libnotify"
 
 FILES_${PN} += " \
-    ${datadir}/appdata \
+    ${datadir}/metainfo \
     ${libdir}/parole-0/*.so \
 "
-- 
2.21.0


