Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3A182776FA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:33:02 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g10so14588018wrg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Mar 2017 12:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6RykyjvwR5/W9TiZQQW689IL7nUivwtljthWKY7C0SY=;
	b=m8f4TiiAv4/kag+DUud7+Qz7Xk4y64JViA624OaW5xRdBlUSPQ/p3e//qJTzR1IU9S
	2Mie/0QdDW5yJqno6Wx+Pco/vUGYHQN0fzkeIkNv/i+uGneFVa2PGHykVyP+WGQtVB8E
	ADqIbG4n4W+Bw+cJq8JChS26SOWuU4d7m3aqEPv7B+xOfwTtZiLtz84lpo6DP2tjXpmy
	+WiFh0Q5zo1T/IppXEmWueZqpiF+PGdoiarTKIk8Md/zKRWNZHtmFz/Y+hvn7GVbtwwp
	lrceTXXSfqqIIg5b9iTkgL6epOSz9Xgn1wUO0np85pYZcTpDaWR3tYBq+SF2xLn9BwXa
	HAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6RykyjvwR5/W9TiZQQW689IL7nUivwtljthWKY7C0SY=;
	b=Mft9zkmr/ZdmYW9kriDnpq93kgfxmBHYNtd8hhMTWOh/jquIV+q9emUtaAHr3uwKFY
	z+pxuJVIH2apkdTLbxbhdh7UzxN7esSCAd9gu7r/N+CFP7Ka2RjTJvS+++SHJUZLdylA
	4mNLRSDzjXJiyVR/Yi0fTUqKpWtPwSFXE5EF+H4VoH74MT/AGDUjGaM572STWULlk4J4
	WZdF9QFOGacsoVxOZdZ/xVqa8fy0bMTeewrJ+LymnBUbJ/HpEtrKdcv1MHick3QT+kUI
	EEeyiPS4I7gv4p65SSSCeDMmZi/eZC5u7gdo8j1YjqkwhNYMbTWrzVl7MCVuIS10GkBI
	uQEg==
X-Gm-Message-State: AMke39mHCdUXOKMsXlHv0kixWm9vuQ0x+mfUj7QQAQVt333EFsPrsXKtZRWnRs4fhb0kFg==
X-Received: by 10.223.168.43 with SMTP id l40mr4301695wrc.150.1488573183458;
	Fri, 03 Mar 2017 12:33:03 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id j12sm7946770wrd.6.2017.03.03.12.33.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Mar 2017 12:33:02 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Mar 2017 21:32:23 +0100
Message-Id: <1488573143-1759-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] libunique: depends on dbus-glib-native
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
X-List-Received-Date: Fri, 03 Mar 2017 20:33:04 -0000

Adds the missing dbus-binding-tool into RSS.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
index 3018398..8aa293f 100644
--- a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66c
 
 PR = "r7"
 
-DEPENDS = "glib-2.0 gtk+"
+DEPENDS = "dbus-glib-native glib-2.0 gtk+"
 
 PACKAGECONFIG ??= "dbus"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
-- 
2.6.6


