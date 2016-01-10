Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 504DE731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:59:54 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 65so2220156pfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Gu73gjSpu33pF7J6/kHCyWCNf5TUoCCk/xJPIi9V37c=;
	b=VPMHLvCspHcNFbCIB1eKwqtOxlSmjWcfW05XzjDpVvy7S5ErB3B2DXLOBUJwg96r34
	NNmtK5aka6E06PNryq0CFvU7UKOpS4ATK/Jsv+ZjLfX55A8sdnuwWtpiVbC7qFGlNuHy
	zUJOKqat5/pkpq+jKnnrSeKKnkqDTgWYc+JEcLf4cdbp8KMEGrrkXIjTZXkgDaH/QN4d
	jvS2gb+bnvMrk4ObtL3JXZcIwGLjfQ40RTBkRqvZj0qsiQdDZ7YucBpcbUeqDoMuu6pd
	V8hONCN2HcLHfGAJ0gpIHBzu6YIe3ITMM8Oz282pOt9geYyP8MqP7KGwjatFU1tWDQJ0
	4HIw==
X-Received: by 10.98.31.219 with SMTP id l88mr15766217pfj.92.1452387595897;
	Sat, 09 Jan 2016 16:59:55 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	dg1sm176209624pad.18.2016.01.09.16.59.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:52 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 7074DFCC83B; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:26 -0800
Message-Id: <fb70606cad762011811931603fcc994b2183523b.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/22] VLC: PACKAGECONFIG for new dependency on libvncserver
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
X-List-Received-Date: Sun, 10 Jan 2016 00:59:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafaël Carré <funman@videolan.org>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index ce3601d..a5b214d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -72,6 +72,7 @@ PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
 PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
 PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
+PACKAGECONFIG[vnc] = "--enable-vnc,--disable-vnc, libvncserver"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
1.9.1


