Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 58F4D72FE3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:06:19 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id s27so44414298wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZEsGdeHU7x6k3+hPOXwF16yVwFOCwBIvxyB6OEdtx28=;
	b=JnBDJXIFn61gGxHWDJib9T1z9zBtqH6a0//pViJqWnKbHuGMIpVGF2dIa6nWP3GQ5K
	e/IOYOKoUiTkbVNZkmXHnWdGUrwcmZG9kWr9uXu/tw7c2ftCnKQGE4ennTsHFk7JZ3py
	oTemce1iRgrqxx3stl4gxT9r9w1W4PEsY9STb4kSuYYrYjirBEJ6BsdTwPgIvR+4kxX4
	Cu7f+3ija4Vft64O4hk5/Ve/lMPD0H+ozBEYQGumFQC0RbzdnnlXB1poy13A86r8ArUy
	rerSFI7XaaEupV5iBNjSu4C91mwETHPrzz98mtCPbrKM9yC2/xjtUIeCOqb0/MSFL4cJ
	1LBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZEsGdeHU7x6k3+hPOXwF16yVwFOCwBIvxyB6OEdtx28=;
	b=FfjkD0cwWNMJMyBhgXpVuZEVkHv/qQNreCSVnTiaRsozAkeeYv9YXqR54C//A1J070
	MXpYlThvY/BCu6IgEIyM8E+6SZbo+V5DPgghNVIJYnpBlKJmez2k6k2J1Fu3MI7ct5W5
	M3llS3PAyZPNzIws+k2MNJPWpm5gHJXEXi4GzO/MD/TpN6zN9GE5v3XnMEeHBAO1fCaq
	+bzMkNzpBifcSLiMm+zbEhMdKaSqgMw55fm4QJtftC4ymz0muSWTuSw3ijSKqoF92lWW
	QklWt5UlGY7VhIzfkFGpeHjG129tGzJ07eoIxYyuIoVtRYR91oZ6bAbNpR7yBwH8YMOC
	aNeg==
X-Gm-Message-State: AMke39kYCAETI3rQENK+d356T4L8V4Uny1Wr7+2AGmFOwibI7mdrjCkU8pPEBaX85gyJjA==
X-Received: by 10.223.128.5 with SMTP id 5mr21193606wrk.163.1487718379963;
	Tue, 21 Feb 2017 15:06:19 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1201E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a120:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	d29sm19284499wmi.19.2017.02.21.15.06.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 15:06:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 00:05:35 +0100
Message-Id: <20170221230538.21902-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/3] further fixes
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
X-List-Received-Date: Tue, 21 Feb 2017 23:06:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

at least pkg-config is still on my build machine and might cause rework

Andreas Müller (3):
  libsdl-mixer: add pkgconfig to inherit and unblacklist
  libsdl2-mixer: add pkgconfig to inherit and unblacklist
  gtk-engines: add glib-2.0-native to DEPENDS an unblacklist

 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 4 +---
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb | 5 +----
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb | 4 +---
 3 files changed, 3 insertions(+), 10 deletions(-)

-- 
2.9.3


