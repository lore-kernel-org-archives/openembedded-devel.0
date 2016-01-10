Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0C4B75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:59:56 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 65so2218083pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=2LwwNPUdwHmP2ydp1wL4Vfk3LOsVeQZy9bIbO0QZFwI=;
	b=u3m+Khe5V24sr951D9EuvBlE6KmyU+jLBhr3CWrWSb/aLCkkDAebquEQmbtf4RMHwV
	rrN+56PBEHPoZw1DSh/j9P5p0vS9VihBwu2L7f49+GbWmBlOcvqEMhUFggrOhKWsNyjA
	3bHKDE0QaAuv3WKTpnLNIQ67d9K4/AOSuNrjpT+YLlccZPEq/XqDNrxQnV0Q22Xo+y2U
	W1NrbcDMBMS15JSDg1zMhrFsHVvjFrRbUu4Dbpr0+gIAA+YpgZeNKg644E+KJtnxm6AR
	66MR4bnN4cdteeRcrpoGJCU87MXpkAG7I+GL+Nkp+G9rvIARNAfSPKJNbYJ5JC/l93Dj
	H9Zg==
X-Received: by 10.98.80.149 with SMTP id g21mr15854448pfj.127.1452387597065;
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	y18sm13764807pfi.84.2016.01.09.16.59.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:52 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 80BDFFCC83C; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:27 -0800
Message-Id: <f05f79eb898f675be2de3b2c578fbbe4b4ce7d97.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/22] VLC: depend on jpeg rather than libjpeg-turbo
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
X-List-Received-Date: Sun, 10 Jan 2016 00:59:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafaël Carré <funman@videolan.org>

The underlying libjpeg implementation doesn't matter

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index a5b214d..46dbd5d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -9,7 +9,7 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
    lua-native lua libidn \
-   avahi libjpeg-turbo xz libmodplug mpeg2dec \
+   avahi jpeg xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms"
 
-- 
1.9.1


