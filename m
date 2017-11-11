Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E314578657
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so7333297wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OXUNivBKWhDXqQNM8DsR5ZqksmSnTHic2UjEj4fPJ3E=;
	b=JDiSInZ3HU/nu8blI0pfaq2s6r0aURsJqrn1XoA1NnWmHJRXext0OeVC7v0xMWkfB8
	Xu0dfZl6/P6gCe7uZP4iphCjD6xXB2LglM/OLA7yyIiznFdl0h+4wta3kxOtzyMv0yfA
	2gtZcguJzF7ytiqClaKNM+TTf+d4dHi+b8hJCKtEltXS++qLKBVTDc9rdepj9j4BE3iY
	Cc/J8I8rMMOKxhh9z1JgE54Q2rLwoXBT/4vyt/5VvRnQtvI/Ae5L7YuIuultocnmPMjH
	I4Xxx0/QceiEt1QuQ4D6c99aKVB5T5MyJJK83LmH1U7OPXomM0+93smGgyK2DsG6kjiC
	UF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OXUNivBKWhDXqQNM8DsR5ZqksmSnTHic2UjEj4fPJ3E=;
	b=pJY6BysNn3EeKDiExjX0Hw9/KOPJGjnfjUIEKrUgCMpDu5SPXrq6rrGro9PChLMj20
	vuhqWi2YOVEaRAySpIrTggZFxnF1QLKTTaVbzqy26b4IXYONxbyvEi2HHHApZIPhq3we
	BEefgDGi6uQIe8WgLLAN+PTvEYdzjRgGYNXcWo6WzsxCUdakzFXewPq7D1V2oV+DqwHI
	ee1SFgr8wCWnxok9itXvNNFtVHinewbbddNhbiMIs+5uA+IaoWK0Ko/wm0y7Mn1HLmNt
	HLqRVRc7b+Pogj92h9s0yZ+XrGJel/7FPBvL6VR52PZTIf1BlyDymY7F2C66YdfiR05d
	RQzQ==
X-Gm-Message-State: AJaThX5Vglk57Rf8BBvzUC98yHnNz/g4TJ+sUX0sSlP7rVSGJmg5kZj3
	J1Ac5WKSS1RVsPvubjHD66kUPA==
X-Google-Smtp-Source: AGs4zMZIQFHbVgh9rSTPJ8FSuH6pYquITKU1lNuob91XPuCSUH7n3w9qg4i0nh0veBKcrPkzzfdeUA==
X-Received: by 10.28.63.143 with SMTP id m137mr845428wma.19.1510407014774;
	Sat, 11 Nov 2017 05:30:14 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:49 +0100
Message-Id: <20171111132950.12570-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 12/13] xfce4-notifyd: update 0.3.6 -> 0.4.0
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

While at it rework dependencies.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-notifyd_0.3.6.bb => xfce4-notifyd_0.4.0.bb}   | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.6.bb => xfce4-notifyd_0.4.0.bb} (58%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
similarity index 58%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
index ac2360a..0ec6b63 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
@@ -2,14 +2,21 @@ SUMMARY = "Easily themable notification daemon with transparency effects"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify \
+DEPENDS = " \
+    dbus \
+    dbus-glib \
     dbus-glib-native \
+    libnotify \
+    libxfce4util \
+    libxfce4ui \
+    xfconf \
+    xfce4-panel \
 "
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "19e602fa5e33afaf7563f069261ae1db"
-SRC_URI[sha256sum] = "f4ca7c0dadd3d4cdf8cd3c8ae60ccea77b8cf409f8517161796364eb1d766cf9"
+SRC_URI[md5sum] = "c2de09c30b06eaf2d3faaf3e509d656a"
+SRC_URI[sha256sum] = "2771871f67effc0bb80f656cf4aa3cd71fe0ea0f4c04b5d8e97bb1752faf36c9"
 
 do_compile_prepend() {
     mkdir -p xfce4-notifyd
@@ -17,7 +24,8 @@ do_compile_prepend() {
 
 FILES_${PN} += " \
     ${systemd_user_unitdir} \
-    ${libdir}/xfce4/notifyd \
+    ${datadir}/xfce4 \
     ${datadir}/themes \
     ${datadir}/dbus-1 \
+    ${libdir}/xfce4 \
 "
-- 
2.9.5


