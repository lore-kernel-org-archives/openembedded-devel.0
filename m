Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E35AD71D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:03 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id v77so12732535wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K2NzKAlaCmGME/jmsDd4Zp8Au7ISipFxMEGpRAdHkUM=;
	b=Iifukrq+kWMdX/hwVC/A9guX6nqe8JblmCQYcAIEa/76P9TV8at7QyusiUFIxgbW/g
	2dSa/OJuvuLPagJWdPF0JjeTWFY4iWYiHhVAI0Ciz3FfQintonEel/gRxxp7m6jCO0V3
	nymKs1ywNHfWrzQjPSjcH5ixavzkNTbfjS+iVUgO9avWrE4IAiqaKe+8adTABsFaX7d8
	k+lFAHR8jdgCh0wwhNPScJHkkWc9sJs8OjYHnjurKSraOfF6fteb6/QwaiZW5/TYtxc+
	D/tRkrTpB9u202yyFbi1Y/Q0rC2uxGnxRS24/qzYCMWxoo3Ynj2qaMatoLxVETJlAwT0
	JYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K2NzKAlaCmGME/jmsDd4Zp8Au7ISipFxMEGpRAdHkUM=;
	b=cxbN5/ZecHSqX8WolDHAp0sp8l8CTz3o84YefsxziFLNFEGmG+gFt6XXIJZbow0K3q
	eCwYNGXUm8HqjGPYleQoSfBrLxIkzSoRrqKnZ7F/SycEzkE1xTT0/Ulj4kL8zSfNBLFr
	bwsD7utl4uSP1PSwcOYOeQVgHwf1zFlijuB/wcWoePbIYgI4qtFIz80vOdA9p1v5YLH3
	bnlyTjrHx3YfpEsvjlAVujYWX1ZJLTHMiz02YFJBvrK5pFNmo9zP+rBgistnz/Wu4Wu/
	Ko1oxdf1cieLV2ExKiO+h2SUPcIq3/ysGSseC9izvJTj8aPE9bPGhRs9YmRhNtyZXG6O
	xtzw==
X-Gm-Message-State: AMke39m2Cpmx/RNCQC6+15x184k1iUUJTJeVDNttZOEywcJsi8dHNOhb46fkbzEUQkizpg==
X-Received: by 10.28.37.195 with SMTP id l186mr676754wml.73.1487804583911;
	Wed, 22 Feb 2017 15:03:03 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:39 +0100
Message-Id: <20170222230250.30288-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 00/11] more rss fixes
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* patchwork is in trouble atm -> use classic pull request
* 1-3 are resend - patchwork trouble I guess/hope
* some errors cannot be reproduced -> guesswork -> let me know in case of
  trouble
* (bad) habit: when touching recipes I check for updates - hope we don't face
  further mpd-like cases

The following changes since commit eb7979113cf1e8c7fb95f9cc2250ebfe7daba331:

  netcat-openbsd: fix implicit dependency on pkg-config (2017-02-22 21:39:16 +0100)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git more-rss-fixes

for you to fetch changes up to 250c84bb4f57b8c7ac1b40d147f8f8dc795f80e4:

  libsdl-ttf: fix and unblacklist (2017-02-22 23:43:20 +0100)

----------------------------------------------------------------
Andreas Müller (11):
      libsdl-mixer: add pkgconfig to inherit and unblacklist
      libsdl2-mixer: add pkgconfig to inherit and unblacklist
      gtk-engines: add glib-2.0-native to DEPENDS an unblacklist
      gtkmathview: libxslt -> libxslt-native in DEPENDS and unblacklist
      abiword: unblacklist - gtkmathview is back
      fontforge: add gettext to inherit and unblacklist
      fontforge: update 20150824 -> 20161012
      postgresql: use gettext bbclass and aublacklist
      postgresql: update 9.4.10 -> 9.4.11
      libsdl2-ttf: add pkgconfig to inherit and unblacklist
      libsdl-ttf: fix and unblacklist

 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb                                   |  2 --
 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb                          |  4 +---
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb                            |  4 +---
 meta-oe/recipes-graphics/fontforge/{fontforge_20150824.bb => fontforge_20161012.bb} |  8 +++-----
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb                      |  5 +----
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb                      |  4 +---
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb                             |  6 +++---
 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb                            |  4 +---
 meta-oe/recipes-support/postgresql/postgresql.inc                                   |  4 ++--
 meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb                             | 13 -------------
 meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb                             | 11 +++++++++++
 11 files changed, 24 insertions(+), 41 deletions(-)
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20150824.bb => fontforge_20161012.bb} (86%)
 delete mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
 create mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb

-- 
2.9.3


