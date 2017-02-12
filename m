Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5943A71E4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:28 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 196so2526972wmm.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RlN9F61Db1yrNqXh1exWP9rMe0PaWiH7E2D8ZScd83Q=;
	b=UaL71qJlH1zhMJcF2p3quwqOT9m3wVQwX6C0dFTL9XpiNyEINrJAgNuiTm9JoMXRKE
	G5JDeWVr/aw7O50x1oLSxKpvovUPP/sgLiRU23rmekzgkS2D4i0POYxAoexM0iLlie0X
	IKUiLPBw3PFfj8QRbD3G6LDxWjHrHZ8RGCneKK1KhzkhOJ6u4w4qKBRU2DZyImokiDN/
	3rRSm06s52bOhiw5pzeW/o/9ivah4rm2tqV4NtulTXsu74lylTO16ec7VO1/LT+UWlIR
	DugBDmjvrU+7JMpsJCczFjNBsG2P9Sf5swqQ4XKo9P2ZP57Mg3DSf+IiWSF0XpMwR7LT
	jJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RlN9F61Db1yrNqXh1exWP9rMe0PaWiH7E2D8ZScd83Q=;
	b=tAQOPSk8cVFjZM4G+6asMPUUCY3iYXKVA5EOxGcSMwKjs2ycLwK+/BzC64Fa5UuYBB
	k7ujHCUW3eLFOuTajVPNmLDdq+U2DwR4b4Hn0TT7dYOD30opj2Sv6ADej+08TU/Cz2tp
	9VGU8MRwBssIgI80xjYuEOf3dbeOCFN5osQkS1gDrW3LDhCtHKrqtETM7D9Brwnb/Ay4
	IkdNoEPJ1X7QldqODfw7tyzRYkC5L9R7HjronXYG1D+3JoeXmxKJOfBfXI7nn5akCetr
	qeEMVPwJFjyWuQi4WJ7sFeaTaUaBOo0PEFsQaGsjlyGr5kOQm7wLLdJhm2zsK8kk6vWB
	mosQ==
X-Gm-Message-State: AMke39kVC5K3xN+EK87rehYoaT+IUzaKstYR7xWVEe3SW83LIw3hKBXPnmGlrWBePd3hRQ==
X-Received: by 10.28.182.6 with SMTP id g6mr15339135wmf.11.1486933348753;
	Sun, 12 Feb 2017 13:02:28 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:05 +0100
Message-Id: <20170212210216.867-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 00/11] This weekend fixes for meta-openembedded
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's a start...

Andreas Müller (10):
  audiofile: add alsa-lib to DEPENDS
  esound: fix build
  libglade: fix build and cleanup
  poppler: add qttools-native to qt5 dependency to fix build
  evolution-data-server: fix build
  libgnomeui: fix build
  gegl: fix build
  gedit: fix build
  abiword: fix build
  geany: fix build

Martin Jansa (1):
  glibmm: add dependency on glib-2.0-native

 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb  |  2 ++
 .../recipes-gnome/eds/evolution-data-server_git.bb |  2 +-
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |  4 ++-
 .../recipes-gnome/libgnome/libgnomeui_2.24.5.bb    |  2 ++
 meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb     |  2 +-
 meta-oe/recipes-devtools/geany/geany_1.29.bb       |  3 ++-
 ...re.in-remove-deprecated-GNOME_COMMON_INIT.patch | 30 ++++++++++++++++++++++
 meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb   | 11 +++++---
 meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb        |  2 ++
 .../audiofile/audiofile_0.3.6.bb                   |  7 ++++-
 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb |  3 +++
 meta-oe/recipes-support/poppler/poppler_0.51.0.bb  |  2 +-
 12 files changed, 61 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch

-- 
2.9.3


