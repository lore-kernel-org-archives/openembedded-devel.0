Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0A236FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 13:32:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 139so4647720wmn.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g/6l74+/Ll7oOrt3nnyeA/qdOiBB/EPL8j2Lyn2xzSU=;
	b=hA6NyWi14hccXVI4LzplWXgqKGZ7cfZeUF+1qvvuQNWPc/CG6LbDYjgAc+U6f2WHVi
	2bVN9oVh5bWgHoLuPbjCfs/SCfdBUCUzEC0Hfokubxyx0YFOc+ThqoKRzrC5bekEsLSg
	gPa4nS1yQWSwc9VxA3bVt5i7Lu4osi1hLGPv6dXlpB8YThf7phLyscdgLP0BsaUw2GDH
	EDo74uPecqtUApuOQWmQdj3QhDzAKXRB04Xoe4BlCQbcf1pPaz6bBgTV+sAUxkz4svIe
	NfQd78nF8kB2C7lnYKhOg0hnYs93jcrRppxu2QGAf+YGc98QnmY8KG6lQKlj1lInH1ma
	f8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g/6l74+/Ll7oOrt3nnyeA/qdOiBB/EPL8j2Lyn2xzSU=;
	b=Qh3NfVVFnarJN5egce8YnUiC6HduLZYvZzXfk9HxN2QatO+VlP2s8I0mHNp479+lrl
	uf1RYTuhexa6aHtNFx4Ce0oSdfYl5Hu9Dv3ucVvJApgjBCYYKun1nltqAUhCyOL+lRfl
	FBHNbURw0A3w97JlnXkDVXx7z89Lv9D+JtzIid7bumGW8D/7R78mGqsdtBbV9G4GSXwo
	jxn8VLT9IwdpdeEeBLf1hyuhzIF+i8PRErTSKp5HKJNbQAv7EKKW2sk7WtPDeOoIttpi
	QIodVJpOk0w6KRKp9EfXVdDUx2kfxd/2RfnyupY2fjUxEB2UKJ0jc+JoQpQlAmqBaW7A
	mZ6w==
X-Gm-Message-State: AD7BkJLljUbYRvYIoKJQyam8qos4sK4AoldtFz/+/82naCs0uQzW4ejoAeh6vj4vRDSx9w==
X-Received: by 10.28.57.132 with SMTP id g126mr3981411wma.74.1459517526667;
	Fri, 01 Apr 2016 06:32:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y72sm14588689wmh.21.2016.04.01.06.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 06:32:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 15:32:19 +0200
Message-Id: <1459517539-2797-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-multimedia] gst-plugins.inc: inherit gobject-introspection
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
X-List-Received-Date: Fri, 01 Apr 2016 13:32:07 -0000

* fixes:
  gst-plugins-gl-0.10.3: gst-plugins-gl: configure was passed unrecognised options: --disable-introspection [unknown-configure-option]
  gst-plugins-bad-0.10.23: gst-plugins-bad: configure was passed unrecognised options: --disable-introspection [unknown-configure-option]
  gst-plugins-good-0.10.31: gst-plugins-good: configure was passed unrecognised options: --disable-introspection [unknown-configure-option]
  gst-plugins-ugly-0.10.19: gst-plugins-ugly: configure was passed unrecognised options: --disable-introspection [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
index dec6920..68a70b1 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
@@ -4,7 +4,8 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 DEPENDS = "gstreamer"
 
-inherit autotools pkgconfig
+# gobject-introspection to get --disable-introspection into UNKNOWN_CONFIGURE_WHITELIST
+inherit autotools pkgconfig gobject-introspection
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
 
-- 
2.7.3


