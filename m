Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 67DC678635
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f125so10695873wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O9Wigfe12Rc5XRAWKLL3/pTaglJJispaVSYjwetAbRU=;
	b=QV8o7Qhr2dhj57hgbRJpCrONfEGrBsnQY1BMf7cI1oc/jH6RbjSdTZbP37hmxSxEZY
	Fbu1i51NX0V6O71Ss3SF1jcajtmTmkwzU6ddECGkn5zWiJgxO2h1DpHIfcDTaRpe6mdQ
	fgTYfc2XbunMlq4bt7e0FcjlATvV9Ic2ZV5cx1ES/q/+w7pzmqP4qPH+nJKPY/K7dB6a
	DImRjYwwkzXH3hEH8syUKaC9oK8WoNWd8r0+i0O6SsHYaBXmashTKMBnSKzamamYJhhx
	FLxhRTM04E7n1AeNGdaOOl6eAQb2WNEQTtWZzCQQEEvGXamHCNQDUcWIxix6XMDLG0yE
	UBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O9Wigfe12Rc5XRAWKLL3/pTaglJJispaVSYjwetAbRU=;
	b=gw1YnCPIrHKSOnU2HkP/vO0ZimidUs1F9gzj1qXO9AhZFhiQgGzSWVmGbrqyndjCOm
	Nyg8GTdBF5uyN2wXSrhwLPxHInQrsug5Tp/0aYVAW+mMwO5T89Cgg7HTGUlXNbJEwJ4y
	AuLhwMJ7Gg9F5VDvmIjJEOoNSlk71C2LBDKz/+SZkY27FSVoQ5Mptzf20UXaD4gF0A0s
	hV1YX0jAiP9jV4rHr67EKkDyuowFZfRKFAO29B126KZg3Su+frQTO46KqrppDXAvipOq
	uiL8cm5tA41Xd4rjZPVwg0X3AvTMz/CHv17P3wuLpYPmhh/hhAu+xzLoKyy4Fg4YuDzc
	d9aw==
X-Gm-Message-State: AElRT7EPGqBruo9DN+0W3SFuUE/Yw1GZMZvTINQZEBeQ5mLLkb+y6ZeU
	2JzhlkKM4qkrUI+7vbKapYd3QQ==
X-Google-Smtp-Source: AG47ELu8M9RV3rSi7miiRoejUo2JasE6Uty7rCrQHjjyxsd9u2QR6/WsWNm+EK7Wj2BHRJ3mP+fwfg==
X-Received: by 10.28.12.79 with SMTP id 76mr12186356wmm.116.1521981344072;
	Sun, 25 Mar 2018 05:35:44 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:13 +0200
Message-Id: <20180325123520.16452-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/20] gparted: update 0.30.0 -> 0.31.0
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb} (90%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
similarity index 90%
rename from meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
index cdc882a51..58beaf6c5 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.31.0.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://org.yoctoproject.pkexec.run-gparted.policy \
     file://gparted_polkit \
 "
-SRC_URI[md5sum] = "09b12d3831e91b26ec8726b00eecd43d"
-SRC_URI[sha256sum] = "d31193effe058bdaeb2a4cd4b514ec753191179a0bc3abefda68a2b7975ecf4a"
+SRC_URI[md5sum] = "c554cc5734c50459dd551bd3fa10710e"
+SRC_URI[sha256sum] = "3b7b49a434d9e4b397bc41a1f5acab8539b9ff402b472dfd83ad77b2decd07ba"
 
 DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
-- 
2.14.3


