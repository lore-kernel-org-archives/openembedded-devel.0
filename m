Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 454F77F882
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:13:58 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 21so1971965pfj.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hRN/KrOMWQ0zVnpK9Zu71IZ5hnsg1XAJ9jm8MFl1CeM=;
	b=bWn0MX6LvIGTG3vQvqk7sG8rzWAycdEiFmFzYP6tIoDl8zjSC8BTd8JHSq5CLWDOMd
	P4wruMSlwbesAiZxXLxthAGyaax0c85o7eZhQqVAzkXHunRBswPxijQubOPZ09TG1BSk
	y8SD90Op2lzmkC8JmRRd28uyWCgEe0Jq6REDRQQtG/X7vOB5OcBDMp6V8T51sNwzY0SY
	CQzQ5O7VfwPnq4TQJfaSwKauJ5c9Y9DIGcjO4Eh0TEXavzr2VGHqNb2PuaDy+eLT2fKc
	sLMQ1NjpuOOrMe2EwPN2HDWJ1oIA4Y7KXPNYYYJAaLznFrwROPN4hAsStZ57V/c1opt1
	IqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hRN/KrOMWQ0zVnpK9Zu71IZ5hnsg1XAJ9jm8MFl1CeM=;
	b=krXxASII4dThDvLv+U/A52miUH5Bc3jEg5FWN/Zi/+IG3K1oB79qAjzg/Kw1OWt/tD
	MM1Q8WZs4Cww4QYLrlyBA6ya1SC2krIq9ffqi3u+C+HBHMNHwor3U6Zdtx1XmhcjM8SM
	cuBhZ+A/vgC10CK7jIa15iRejmppItG2M21J9mFKRs5kaIMZ6p5B4K89vzK81prgr8lu
	T+HcVHbYJI8xRpvXY5P973Utz/bJnQlVYLJpq/DwfcTrHtn/HUCqMErPgiuRbGwxxfIF
	xb575az/Gqs4cVls20QFbHereAQihjID8IoQ9Wuvmvb3Sdc33NXvR2MkDkHtg/s62gCB
	Y/Yw==
X-Gm-Message-State: APjAAAWReT5uOVTB2Arv7h2MDvoXt7xP7a2byZfjpRCayjVP9YRL2mD7
	cLQm4CLzg82KFxG7fnU2b7vwYhEI
X-Google-Smtp-Source: APXvYqw1nJjE3AdGVfyP8DiYZarnOwLG7YAdzdnm9JeTTv6RxlgzHMQdQca+0SfH4o3G2MPuHxN/BA==
X-Received: by 2002:a63:f743:: with SMTP id f3mr11080676pgk.410.1571847239031; 
	Wed, 23 Oct 2019 09:13:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.13.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:13:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:45 -0700
Message-Id: <cover.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior 00/10] Patch review
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
X-List-Received-Date: Wed, 23 Oct 2019 16:13:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this series. Most of these where backport requests.
Aplogies for delay in processing, had build server issues.

The following changes since commit f4ccdf2bc3fe4f00778629088baab840c868e36b:

  mariadb: update SRC_URI to use archive.mariadb.org (2019-10-09 11:26:58 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/warrior-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/warrior-next

Andreas Müller (3):
  xfce4-panel: Draw icons/background properly when compositing is
    disabled
  polkit-group-rules: Fix error in do_rootfs for rpm package-manager
  vlc: rework qt PACKAGECONFIG

Khem Raj (1):
  xorg-fonts-100dpi: Change License Custom -> MIT

Martin Jansa (1):
  python3-twofish: Fix missing return statements in module stubs

Pavel Modilaynen (1):
  jsoncpp: add native BBCLASSEXTEND

Peiran Hong (2):
  tcpdump: upgrade 4.9.2 -> 4.9.3
  tcpdump: Delete unused patch

Peter Kjellerstedt (1):
  kconfig-frontends: Retrieve the Git repository from GitLab

Qi.Chen@windriver.com (1):
  protobuf-c: fix race condition

 meta-multimedia/recipes-multimedia/vlc/vlc.inc     | 24 ++++---
 ...2017-16808-AoE-Add-a-missing-bounds-check.patch | 61 -----------------
 .../tcpdump/tcpdump/add-ptest.patch                |  9 +--
 ...-absolute-path-when-searching-for-libdlpi.patch | 19 ++---
 .../recipes-support/tcpdump/tcpdump/run-ptest      |  4 +-
 .../tcpdump/unnecessary-to-check-libpcap.patch     | 15 ++--
 .../tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb} | 12 +++-
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb  |  2 +
 .../kconfig-frontends_4.11.0.1.bb                  |  4 +-
 .../protobuf-c/0001-avoid-race-condition.patch     | 36 ++++++++++
 .../recipes-devtools/protobuf/protobuf-c_1.3.1.bb  |  3 +-
 .../recipes-extended/polkit/polkit-group-rule.inc  |  2 +-
 .../xorg-font/xorg-fonts-100dpi.bb                 |  2 +-
 ...missing-return-statements-in-module-stubs.patch | 38 ++++++++++
 .../python/python3-twofish_0.3.0.bb                |  2 +
 ...y-Fix-icons-without-compositing-Bug-14577.patch | 80 ++++++++++++++++++++++
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb |  1 +
 17 files changed, 214 insertions(+), 100 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb} (74%)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch

-- 
2.7.4


