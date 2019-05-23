Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E9A897E446
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y3so4527622wmm.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bWZC5StyW2WcBFCgrQvO11EEn86VxR+vSBj9g6Msrgc=;
	b=ZbazRsahWEcIprHV8lqKSiceOTvpF57xyIosR3hR8wxzYybc6zfhQEJsaDKhJASi3Z
	CAuooi8BRlma8dd0D+TV9ZT9pTYq2P/D3RxLLtroBby+9RPzcQ5L921kmZDhk1aJlN9q
	F5mGGNZq+kAuNCc0AY2/DLXfnrIptESu2hNX4+S5uIdPaXxNbhwmFbsJnfQPHa0SRAe0
	PXXd98bBcafhqGwGxeqKkIpp0D8r0FGj1682CkXU7nJ3l9N7kiaMfwRPoBMjKYZs3lUc
	ynx2T+rN1D5imi7K/ID9i5SQLGQrFEEkEDBNgnFVF6/J/zVWjeOiaHPwgam6TaYXwfk4
	slug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bWZC5StyW2WcBFCgrQvO11EEn86VxR+vSBj9g6Msrgc=;
	b=QJUGKLMm/oVg9n68xeSrsWPsy0TJSxkws7Nn1QV8Uy6GWwhZRRBC7f82uCiPJpNfu3
	TMy0hG8napJHOIrGM2ENGCdpeLjP7iIjQPCazwgYfGTUZTkC4E6kdeWgM3ZdAJJTZbVK
	W3zG8cQrknIoJqZNaR3D1mqC/NEPkfqjMz1RU26Urz86qdoY7PQ1fZCH0szJlo5a4v/Q
	g4XkU8gl45KT3YdquaNVO81lg2DGDuc54PhyfWM3PMSnorR8DekFwXDBFXAYh0fZmkVJ
	9JwAhbEpiP/BWBYQtrROfKqUFNDt1AVzDkyyGdayl3ddjHwlPOWnMbc2lWHgKSaaQpTq
	fWFg==
X-Gm-Message-State: APjAAAXru30/E9C0qzBv2NhWtGpAZkZ4H9xGOUoBKZ2R5hEsDoaUYisc
	EHu+win2SFbIdH2zhobppt27w5VHiXY=
X-Google-Smtp-Source: APXvYqxlvb2xrn/EZc7OCmu8y9KLtyVlJSvd5/nr1PLBbcyYv3jx3FRUW2FEF6LeiOmLhk1ujBuu6w==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr10164518wml.31.1558594177553; 
	Wed, 22 May 2019 23:49:37 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:52 +0200
Message-Id: <20190523064859.24336-35-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 34/41] pinpoint: remove dead project
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
X-List-Received-Date: Thu, 23 May 2019 06:49:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is an app so nothing depends on it
* last commit was 2016
* last release was 2015

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
deleted file mode 100644
index bf5178cf8..000000000
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A simple presentation tool for hackers"
-DESCRIPTION = "Pinpoint is a simple presentation tool that hopes to avoid audience death \
-               by bullet point and instead encourage presentations containing beautiful \
-               images and small amounts of concise text in slides."
-SECTION = "x11/multimedia"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
-                    file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
-
-DEPENDS = "glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-3.0 librsvg"
-
-inherit autotools gettext pkgconfig distro_features_check
-
-# cogl requires opengl
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-SRC_URI = "git://git.gnome.org/pinpoint"
-
-SRCREV = "80a056c57e819d0b75035424638813b0670830e1"
-PV = "0.1.4+gitr${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
-- 
2.20.1


