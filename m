Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F86574F09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:30 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id f16-v6so11160533wrm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XEZPyhFUth7JCF7mqozioxH8TBCedDp36u9emeHA9/Y=;
	b=E43djcfa3uknKyAU/eU3pOkfgTu9XWQciYFjnO3BLvBKeSr5tM7QW9amu8ECrezNCy
	s+ilWuCWKcfRThIkbbYZEwWPmpoKncG8Fxyd5yaXswMZLHlth3yI5n2pxhHAC+FkZGMM
	hU6SBm+vDTbkWt6r0Bbm+iIdjCunFfGFwTYE6irJNWAkpEWxn8aTRbpKLa/8CV6qZo8n
	3utFegx/hycEteurtDTpI7qbmIx8p/4bQOrETSIfeHevQKaabwaLCyLMdD18IP28I8j3
	FvEg9BzHa8ZLBsPvlgpokWUMuM7ndOSNRtwOpwhJ5/ThCOSMxFS58cGwaKudQAzo+51u
	WhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XEZPyhFUth7JCF7mqozioxH8TBCedDp36u9emeHA9/Y=;
	b=IygKyrEnlAO28QCrKOQIXeq5BPSzV1DJ2Aef323iz4s0vwnXphd7NpaTQwQeDuww/A
	Prc2bsCn1yMHAVuv/DgeV3h4/ljsIhr4KrS+lRdbppCuKNgH+rHK+IWeFNX+2IvYAApy
	7XyLKaOh3fXPR+88hhuyfvs+//ijh0XI3VchcxYOUnnyp6cjH+X0eIhimHDC4fHT1x1h
	fr1Duu7q4y8V+CeEnlFVDBjzQWE285xSX0z0DnhYZWaQcs68kELl2l9tAiSe1TR3figM
	idn/IboMygk0bFPf0w26wC4gxdL5SBRUNgFBiFJnJdJJJcrUfHIoVbb5ir+M3EOSATKY
	dg5w==
X-Gm-Message-State: APt69E1C0gTJKXHIUClJZVu+Kv8FlD6LHyUFU6k0W99GCDO2o5kf2cig
	xpHKzGp3MaSKT+L13tjm2FBIEA==
X-Google-Smtp-Source: AAOMgpfhfAZ45Yc9FrlhRT560sWamOmxchi3FGsrbOmvGS+Q5rQ/dn96TvJZPBooQgR0fXPLhUuVig==
X-Received: by 2002:a5d:438d:: with SMTP id
	i13-v6mr4002810wrq.156.1530360210694; 
	Sat, 30 Jun 2018 05:03:30 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:08 +0200
Message-Id: <20180630120315.29414-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] xfdesktop: upgrade 4.12.4 -> 4.13.2
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a development version but it moves to GTK3 and daily usage did not show
stoppers.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.12.4.bb => xfdesktop_4.13.2.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.4.bb => xfdesktop_4.13.2.bb} (59%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.2.bb
similarity index 59%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.2.bb
index d9cbe7196..85696a193 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.2.bb
@@ -2,14 +2,14 @@ SUMMARY = "Xfce4 Desktop Manager"
 SECTION = "x11/base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib dbus-glib-native thunar garcon exo"
+DEPENDS = "libxfce4util libxfce4ui libwnck xfconf dbus-glib dbus-glib-native thunar garcon exo"
 
 inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "7571889368be72df185ce2d470f37198"
-SRC_URI[sha256sum] = "098a35510562907e1431d5adbfa8307484a235c1dec6a43e2d58d2ac4241f1cb"
+SRC_URI[md5sum] = "c05569c1c39ccd314fb5da20d5086909"
+SRC_URI[sha256sum] = "387f43d8a4615f44060c019cad212ac12df62c58eea2605813743116f71ad3bd"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.14.4


