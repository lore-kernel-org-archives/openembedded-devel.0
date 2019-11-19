Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1677CE5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:40 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id a15so22467100wrf.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GXZP4HZY9rXlGJBGvltNltT0UUPjRS727Q4o9RfRqHo=;
	b=MTqqhc7NWBlSRn3DaQ4j7lXVU3yqCGnTd1cmulYiOn9mA4TEh34LEmzz9fIIiruIiK
	rn660U6ySKfog/5oDM9DbOXhkLl0men9ozPvjn6NraT7yVLyIg0HFFQiunDpahH9LecG
	GOmUBVoh4JXCScxl4pooP9sPmScvMeMVvr9wK/7fZfZtz6OuXQrKeNuwLFsVNoJH/vfC
	t56TfKUWlpYmnhtU1KXq8p4iaehVX0HJadqq7Bq5GyFXqHWodEPOPMh4ouGZHTBeBAtj
	WDGPsiHZ5I4uT2Hlu4jumvi83sTMWDoz0QAgSZYLi0aTw7jTc64y7AqQIZM+OFQ8Up/3
	t16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GXZP4HZY9rXlGJBGvltNltT0UUPjRS727Q4o9RfRqHo=;
	b=HllyL6Zuee3/ohGL/g1ROTU2GIQ/j5D1BHL+Yz1LGfUcG/48myUAoG/vxgZqdNPFn9
	tkB2d5Bx38W1Jw6xfAwzVXRbpmZtyHgsNsEeHk1pS+LgQ+VAFBgR0Kbuu663s5abb8E0
	HaFsPkKeRte3gk51+lQzMls+rbQhWxZNhiy4BVlYkUyFFW/DEPgngM1HLUMT6re/pgRB
	r2UmS4xrodXAjkMVLAGr6zoFeQXYHJ//apsmE9RrBNf9SfPWkr2Psba9edb2flFmB4yD
	xfo0VDNn0aQrXut2HIlVDrh+1+7+vbxSQaxEWfrML+/QAORfLcfLAyeKdZQqGJGvNhso
	Q7rw==
X-Gm-Message-State: APjAAAVPkn6Y1liBMYf7UCfpqg8DdWPi2Mc2fRjD2QqviPtlQ8cNZtvq
	004UNuDMr71kb/0OEbjoH9RUu4QZ
X-Google-Smtp-Source: APXvYqztoqZ05kIKwLx179OzyjPoigLHF61njFhli+yXQDfwUWxBjHovmuIVMU0XcisHJv7l959G/A==
X-Received: by 2002:adf:9185:: with SMTP id 5mr26459801wri.389.1574147860481; 
	Mon, 18 Nov 2019 23:17:40 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:21 +0100
Message-Id: <20191119071730.2682-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/9] nautilus fix / gsettings + upstream-version-is-even consolidation
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nautilus should work now

Andreas Müller (9):
  file-roller: add gsettings to inherit
  tracker: add gsettings to inherit
  tracker-miners: initial add 2.3.1
  nautilus: add gsettings to inherit
  nautilus: add tracker-miners to RDPENDS
  libgweather: add gsetings &  upstream-version-is-even to inherit
  gnome-settings-daemon: add gsettings to inherit
  gnome-terminal: add gsettings to inherit
  gedit: add gsettings to inherit

 .../file-roller/file-roller_3.32.2.bb         |  2 +-
 .../recipes-gnome/gedit/gedit_3.34.0.bb       |  2 +-
 .../gnome-settings-daemon_3.34.1.bb           |  2 +-
 .../gnome-terminal/gnome-terminal_3.34.2.bb   |  2 +-
 .../libgweather/libgweather_3.34.0.bb         |  2 +-
 .../recipes-gnome/nautilus/nautilus_3.34.1.bb |  6 +-
 .../tracker/tracker-miners_2.3.1.bb           | 66 +++++++++++++++++++
 .../recipes-gnome/tracker/tracker_2.3.1.bb    |  2 +-
 8 files changed, 77 insertions(+), 7 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb

-- 
2.21.0


