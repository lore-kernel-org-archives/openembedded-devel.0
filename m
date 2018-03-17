Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id EDEAD71C0F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Mar 2018 01:23:27 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id r10-v6so3851049iti.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 18:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=W5oh1utZOxoAVebHVZ7kHiYhTR81DJ1cxYjhPYOTzTk=;
	b=ZJQ5keXTUuWDZXsu4WRwbu3yyCgg1TlqMqLhGfttiIfmUifIASPXXFlClzN+VaNLU0
	oHVDrkJsrO3j+engknN7yK5wTzOMmhHXtIha4erQImRzlZZF8awbdWLNIx7bBVOGiLyr
	CkGHNxyNXwbaMyGtx+tlxGtEZzA9XLeeOoDkD3h0GTOneMXlCO4b9TWl5ro2zelSBRg6
	TQPp3YYBZUhGoT5BxLKyjPfzZdPWUi+yeVdRE6jC1D7+BapiWiQrwKI/Aql3WV5zU9/Z
	hktj5VPaUudpMEyCYIkMtePyNgQMCjDeOrJZGA9+LCxXxwmNpAG1/Ftz6D1ItQVFpriw
	bJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=W5oh1utZOxoAVebHVZ7kHiYhTR81DJ1cxYjhPYOTzTk=;
	b=cqwJ3m4g3Je3HzHWGVZK5HdZvHbAVXOhqd3cQ0ww+RSdHPa5RoBJrorUTnoJsnv/HU
	/xADumGMhAbOaEdfHgWbxkix3vtarecSLo19mRzEH67Dqc38DyyvdpCu868QuaZIlsnb
	2xypSg5YuSvp7g91kgBQTirlB3CxmBKzC+c6iRVOk27CgU5G2RmyE14rRkMeNQOpFVTC
	o4UDw9zXe/9waMd0Bq42ntoQJv/Csk1XAhGJGU9oL5JgL5rfhEqWNmK1yKggnQOUKwm4
	XlwqILosmbwTfqYZ2yJFryJYLOQ9Ntx51kiz4MUs8nzh15r6nWk5NyZVtux9Vvf49YdL
	4d2A==
X-Gm-Message-State: AElRT7E4lV+yMIiUTdabsOc7fECdi6ivYkB67mrVvemFtKVJ3CEpgOLs
	IyCt2uk0DB15m2QLEmAzvYsyL110
X-Google-Smtp-Source: AG47ELsowB6cdwXNWYRoxLdXF8WsC/JzpBb835VUrXki1zvgJgUQ1uCgphJ7wFBBAzxijuEJ100ydg==
X-Received: by 2002:a24:2111:: with SMTP id
	e17-v6mr4426888ita.44.1521249808772; 
	Fri, 16 Mar 2018 18:23:28 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	b185sm5318904itb.20.2018.03.16.18.23.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Mar 2018 18:23:27 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Mar 2018 21:23:21 -0400
Message-Id: <20180317012321.24676-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
Subject: [PATCH] directfb: add more PACKAGECONFIGs
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
X-List-Received-Date: Sat, 17 Mar 2018 01:23:28 -0000

Allow the following features to be enabled by the user during configuration:
mesa, x11.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index bfbd9c29e5..bd66a28207 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -41,16 +41,16 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[tslib] = "--with-inputdrivers=tslib,,tslib"
 PACKAGECONFIG[linuxinput] = "--with-inputdrivers=linuxinput,,"
 PACKAGECONFIG[noinput] = "--with-inputdrivers=none,,"
+PACKAGECONFIG[mesa] = "--enable-mesa,--disable-mesa,virtual/mesa,"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,xserver-xorg,"
 
 EXTRA_OECONF = "\
   --with-gfxdrivers=none \
   --enable-freetype=yes \
   --enable-zlib \
   --disable-imlib2 \
-  --disable-mesa \
   --disable-sdl \
   --disable-vnc \
-  --disable-x11 \
   --disable-x11vdpau \
   --disable-xine-vdpau \
 "
-- 
2.14.1.459.g238e487ea


