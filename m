Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id CE7F06189B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:13:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v2so652263wrp.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TPYkLk0uAyM/lsPwROD/v+h/m3ff7G/0W1VojazzRSU=;
	b=LGuzvo4dcQ2l99Y+NsTqlN/CROyZ26JGhUNfml1hwLuk2EE1UDG3JMkDz9hxc8vl3S
	S6N36xU7Fa+Ir5yF0t17Lt4guQLPQqrPn+sXbgGpvHrw/4562mXHseHAFaOZCaq9KCJl
	S7Te9B+bwGCQoep8tWsdI+QysveBIFhC9hLRSA8f3FobVeniFFnDD9oUOdly7AhbTDB1
	n/Jbm9KIaRQGewxw4ZY4s7JucxOBZ+kdoMESYa5vAGYCqR4MrPW56gkwNx6uSFC10rAh
	emfEjGV9qKM0HlGAKUGbuiG4I/nQsk0uLEj6iFeJS57q1z8YT4+g4g/W7IY6YRkhqpXC
	z7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TPYkLk0uAyM/lsPwROD/v+h/m3ff7G/0W1VojazzRSU=;
	b=F2pUMlkXFrTnN4n0fzRIQwEX2DVD2gOQaTVxnF4mCvUWbOW0CYiTpPhiq47fNBPWkz
	JMJv96kdP0ZRR/UOXYjtyDf1px5RuIV6nxNXcAk7gjDHr5nLcvw79ca3QTSGNW7r7nyn
	Wq5L3ar6J3kb3QhVW/R4C/u7DmwdYknyXNJv388H/7kTjvrElwOMEr0EYz6V2m0eVH9l
	QhhSFX5OMYk2C9WAzr+IwENAut028SYuDDbU1zOStHSZ64nGFvIiNiwGZ2eC7wKi9Lv4
	YL0Gjlw/qLYmj/jVgsW0+ZWrS+/9rwfX5QEk0EnKvTTulUdRTCLOO3+kDbelJe382+da
	Kmzw==
X-Gm-Message-State: APjAAAWACkIr4hzvTM0W/BK6oELN280Tqq3UkCn06qQQjCQzE6OHPDXJ
	HM6WsezPsvmzYq/XcqqjLhIHaYwg
X-Google-Smtp-Source: APXvYqw/Th+tbUPafcqs/EVplCoBcctn5oXBrObqzoac7J1trI2CyQTDsKsFq8kmjwUp3JqQrJH+5A==
X-Received: by 2002:adf:e742:: with SMTP id c2mr977713wrn.262.1582841581533;
	Thu, 27 Feb 2020 14:13:01 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.13.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:13:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:43 +0100
Message-Id: <20200227221245.22944-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227221245.22944-1-schnitzeltony@gmail.com>
References: <20200227221245.22944-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] gspell: upgrade 1.8.2 -> 1.8.3
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
X-List-Received-Date: Thu, 27 Feb 2020 22:13:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gspell/{gspell_1.8.2.bb => gspell_1.8.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.8.2.bb => gspell_1.8.3.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.8.2.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.8.3.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.8.2.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.8.3.bb
index 128a89f5d..44cdefc33 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.8.3.bb
@@ -7,5 +7,5 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection
 
-SRC_URI[archive.md5sum] = "4f857382bc9d8d4afe1e67e5b5b9dbff"
-SRC_URI[archive.sha256sum] = "bb9195c3a95bacf556d0203e9691f7489e0d3bc5ae1e5a440c89b2f2435d3ed6"
+SRC_URI[archive.md5sum] = "d0892000d944e87fd74e8611ef400cdb"
+SRC_URI[archive.sha256sum] = "5ae514dd0216be069176accf6d0049d6a01cfa6a50df4bc06be85f7080b62de8"
-- 
2.21.0


