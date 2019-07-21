Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 505C871B99
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id i2so17915695plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dPPgVOGhqdQHj9NkFE5JgxZymweRp7TQPsN6neo+PNc=;
	b=s3nPsWmnVTg8zvWcDkoJTGzBLYLgmE7rRDPIV29dajAhwUNszjN6ppN0EAEDA3+VI8
	4XnJiJp+Y4REFuldJVD6xXx/5vvhFOYO/XaOCb/7qHbO2KE9MXeQ/Hh5QAD2r1YUSbN4
	lKETMGJHkldzNc0l+xLmxrtL4r+5IuXQClr6GAJ4UH3I1wEGOtgi+IKWKlN4bqxflKEI
	3/77Mhy9AVOEkeniv2pADtbYhr+wkTMWlkbuJtd07z694eD0eDJKIy5mNwgUA0J3b65w
	vyFvSVBLGtJ+JRrz4UHo9BU+qZNGMpf/VQAQjtyoWjciEN6LPBsESwiCsM35xzbythyU
	g4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dPPgVOGhqdQHj9NkFE5JgxZymweRp7TQPsN6neo+PNc=;
	b=qbWJofLQfvBqF7r1nBCJplt6gV8jtVKRSHTv8GL91oVBGmqDBT0j/NzkjAH3VOuSxs
	hyLyJtapO/MmDJt5REfXsqMT/QqXJwLn8eg2qCT55TT6M1cBGvoWqDa5wWdib0QnSqJ5
	yPITaKd7Qo9nz0vkTPAnS12LZ4rkoCqnd+TCO8yZSqxeKD/J1sGnVulEnt5Pp9HRQtD7
	3fNLZ1DyfntUihbQHfL1fM1WOgySZU7ZxR+se6/TKTnM02GDJmPiyURRqPA3mFvBcMm+
	VrobSWjXH34v26xV8vVMlU1wDTJAyJ/tHLGDpXeuc/hX1G/rD0H1VQNb2T8POuL04DbV
	oqmg==
X-Gm-Message-State: APjAAAWEmYVtDKML6mAkd7tq8noGQS+KoVxAIvwYe4v+3z2JHwHB7JBV
	D5VeRQh3AHB7H+rK6buYNcB0048p
X-Google-Smtp-Source: APXvYqziy6vBDb4j8KDlStpkQVhn7oypunWAD9eQ15BDRKBWK0WoxrmDIlAjRyNZrkFL3WqAd3Ik/A==
X-Received: by 2002:a17:902:6b86:: with SMTP id
	p6mr71917242plk.14.1563720102289; 
	Sun, 21 Jul 2019 07:41:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:28 -0700
Message-Id: <cover.1563719996.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior] 0/8] patch review
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch comments window closes on Wednesday.

The following changes since commit 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0:

  turbostat: copy bits.h from kernel to turbostat (2019-06-16 08:15:44 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Adrian Bunk (2):
  ndctl: Remove the unnecessary dependency on virtual/kernel
  wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03

Andreas Müller (2):
  gnome-desktop3: set correct meson gtk doc option
  evince: add patch to fix build with recent gobject-introspection

Martin Jansa (4):
  ndctl: make MACHINE_ARCH and ignore from libblockdev
  oprofile: make MACHINE_ARCH
  oprofile: drop virtual/kernel dependency and switch back to
    TUNE_PKGARCH
  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb, busybox and util-linux for
    phoronix-test-suite

 ...ove-EvDocumentModel-get-type-function-dec.patch | 33 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb   | 12 ++++----
 .../gnome-desktop/gnome-desktop3_3.32.0.bb         |  1 +
 ..._2019.03.01.bb => wireless-regdb_2019.06.03.bb} |  4 +--
 meta-oe/conf/layer.conf                            |  3 ++
 meta-oe/recipes-core/ndctl/ndctl_v63.bb            |  2 +-
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb  |  1 -
 7 files changed, 47 insertions(+), 9 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2019.03.01.bb => wireless-regdb_2019.06.03.bb} (91%)

-- 
2.7.4


