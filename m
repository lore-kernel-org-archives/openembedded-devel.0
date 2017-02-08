Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 51DB071979
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 09:37:55 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l66so111624749ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 01:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8EML41FEyp14AJfJZBhtNkFCelKFCSsuGbZNOZPlTa4=;
	b=Usz+QyJFcEq+mzhAWAfNXiEqEXPjOTTgky9GSp8QKeDKMaYAzD8+VWsEzK/O70V0+C
	E0+rf5G3ZQ2DLHU5Ey70xiLYBQzXfyljnY8Zo1N7hF1DzUyB9FP2kADw3dVYaiMhK3wV
	TxkawWqAtoiGJNFw6l9oFhjBI1Q+6zIsN3UOPYJMztUnRLGtnedqQBb5iPGGUZh/z5+n
	uSdaEDWGZ24ivriMS9Tb2IyMO8e5wJwXiQNB9Iq4O2Dbg7MrvJ2NW6B6eI4fdEB/YZb5
	uMqGQj/atFZT7nc0Tc18iKCJMbdVGni7F1p8T6MoIVP0zZNzhrt5xSaz6KywNmJ6tEUE
	hFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8EML41FEyp14AJfJZBhtNkFCelKFCSsuGbZNOZPlTa4=;
	b=Ud8EqpNN2HB/HLIiLNf+4uvtCvU2prN44ZQp+18GPcsOu+uPJf9bxUNvJuyZqDWdKg
	GkCOXQjbpzjArrkqiaBZqO+2n2zrUJBAmTemgVEb1i5XUYBh8CYH2hkONYyXHrEDbowZ
	q+C2vPaodpg6bPcTcANr+S9OpUi+y63FXuoQMVHhyVyKyg6sUuUDAmPwU0GWBoLjxyQk
	yFqGTCvnDyg11obOStMkk4dsdo+IpPkXNl5zd/IjAgjj+aw/zbQV5+zLl3OiLfoAw1W8
	T7OSTBZGuIXC2a1423VLZSxPtZVMKDHgqWOX6TRZqwqjzjc+h/tSahyZM6nlyNMEtXza
	f8qw==
X-Gm-Message-State: AMke39mO41/3IUn5JeTjQkLGi3/TBIiKncLG4zyJGvCaBsdQEoKn1fbBEDywgUY8RmV1ShGj
X-Received: by 10.107.13.68 with SMTP id 65mr9199865ion.118.1486546676128;
	Wed, 08 Feb 2017 01:37:56 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DEB3.dip0.t-ipconnect.de.
	[93.232.222.179]) by smtp.gmail.com with ESMTPSA id
	x67sm11039035iod.22.2017.02.08.01.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 01:37:55 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 10:37:37 +0100
Message-Id: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 0/4] native cryptsetup and fuse
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
X-List-Received-Date: Wed, 08 Feb 2017 09:37:57 -0000

I have some experimental code which enables dm-verity integrity
protection in an image. This relies on cryptsetup-native and thus
lvm2-native.

swtpm-native (in its current form - if time permits I hope to modify
it so that it works without CUSE) needs fuse-native.

While (accidentally) building the old lvm2 2.02.138 I noticed a build
error; let's remove it.

Patrick Ohly (4):
  lvm2: remove unbuildable 2.02.138
  fuse: support native compilation
  lvm2: enable native compilation
  cryptsetup: enable native compilation

 meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb    |  6 +-
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                  | 28 +++++++++--
 meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb          |  4 +--
 meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb          |  2 +-
 5 files changed, 31 insertions(+), 11 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb

base-commit: c162c9102881ae97772e56ca779ffedbc445aca0
-- 
git-series 0.9.1

