Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD496BE26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:39 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so342750eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LKqzprszQyqaEgfwMB3U3idqvh+stA4MgCrFD3JhoOY=;
	b=u7pBZzyftpfn6LWe/kjDJkByNSkR4whAcKFZZYfALxGfOKpHbsJViPUMEaHfRMHGtC
	cXHnSoJ3TA5vn0JgVyJuVTkG9+mceheZ8rE8oSVyBXDIE8evhpQrYuc6Cu1aLHHGwgD4
	QaWDB7WDW0o79PDHzBLlCVt5OCNtXoYFGP3dUFV6D0DLug2QHVEqBI2kqNMggBkXjLac
	qa4CPcomJaZeM0c5hEXYJOZTfVSoKlVVPwDs3cI95JyOCiH/kMKR80oy1TqtKV1v+seH
	NDMc36w71A45QHXZz7T5sBgqUE5fjqrAlQ9cXyvKkMAZNCoZUa8b4YWnLjz3zFuwRfjJ
	mDeQ==
X-Received: by 10.15.35.196 with SMTP id g44mr5414710eev.18.1377791500111;
	Thu, 29 Aug 2013 08:51:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm47160616eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:31 +0200
Message-Id: <c250c58097af844eb5df9195fe39d858eb05a836.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 38/66] openbox: Add PACKAGECONFIG for imlib2, xrandr, xinerama, xcursor, startup-notification
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 15:51:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 1fe2e17..9480388 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -17,6 +17,13 @@ ALTERNATIVE_${PN}-core = "x-window-manager"
 ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/openbox"
 ALTERNATIVE_PRIORITY[x-window-manager] = "10"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+PACKAGECONFIG[xrandr] = "--enable-xrandr,--disable-xrandr,libxrandr"
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
+PACKAGECONFIG[xcursor] = "--enable-xcursor,--disable-xcursor,libxcursor"
+
 EXTRA_OECONF += "--with-plugins=none"
 
 PACKAGES =+ "${PN}-core ${PN}-lxde ${PN}-gnome ${PN}-config"
-- 
1.8.3.2


