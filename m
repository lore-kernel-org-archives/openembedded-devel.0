Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id AE7417CFC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 01:53:04 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r15so5197962pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2019 18:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nt/xC+dE+wUpmE/u3Ho9jCHRd6qm7u6g3j/6C1hubwg=;
	b=OupHGMblUPaEpWygBxJjU82ZOuWK/Le1jg728CfB72Xb96geoHrRoHUWIn6i/YtigA
	aguE414KtdnptNRHuqRgAh+QhW4aF5ELKlJZEW56yjKqU2KMujKaFRFyynp5jEWdCQ7V
	1sbnkR/0PisGAM3m1WENf2xqZ4N77ZMdg4/Z64GPLSOjWM5a/r6AZfUECQsrAeOucptv
	ezxh3HXBULB7k6cEcr5lbLwzFMUQrhRXSNR3ZUIj6M6tFDa1GC/bQWAqrOlSDeh5foG+
	m4HpPVrZafceqT1PKGSgGguDogwKa6hq3hJbqIZLhkTnACVx2WK7YoalvE0Z4zf7+zv8
	3UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nt/xC+dE+wUpmE/u3Ho9jCHRd6qm7u6g3j/6C1hubwg=;
	b=A4IMNLOC5u5Kf62la9HUYCcBkLk7pL68NJVI+pwka+1baTX5Jt+PsHjvTxIKO4t7YL
	QIkgVfM31Xz1JXLguhwVrmPsCW5bzvscc942x6/PR3EH2ICBry0x1R4Cr3RVxxnKxres
	raQbgeUmoYB2HeT7QnzjqDyH3c1BmzRr3ZykQbw4umqvV2a0V8dyBKC6UhnDNDt3lTek
	Xe6/2jL/VfD3BGR5vCemndjgqvKmzxPv5NarpWLZR3D88zOOHb/l8XJWEwFwphySWa9d
	LmGRoadvrTnre7KyriiAU5k2nINwngYt4fYv/QcXbtTZQihePmVd+sfC3kk/ROCjyB8m
	A89w==
X-Gm-Message-State: APjAAAVatYF8Tk8Sz9YTGWXLmEEDewlriUqc03kXgA7Gd/z8nnTS7KN9
	Q2NjvjGm2at9G7azlkXFc1sTuZcB
X-Google-Smtp-Source: APXvYqyOhvfryAJRDw+8h3oObpX+bX863eLkgAn8PJxc8KpXawK4B4Dk/Ic3kzYW2aI3NascO1bmhA==
X-Received: by 2002:a17:902:b717:: with SMTP id
	d23mr4414612pls.260.1553478784990; 
	Sun, 24 Mar 2019 18:53:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:7099:fa84:daac:3491])
	by smtp.gmail.com with ESMTPSA id
	v18sm17364099pfm.165.2019.03.24.18.53.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Mar 2019 18:53:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Mar 2019 18:52:54 -0700
Message-Id: <cover.1553478496.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/6] thud patch review
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
X-List-Received-Date: Mon, 25 Mar 2019 01:53:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review and provide feedback no later than Tuesday March 26 18:00 pst

The following changes since commit 6ef9657068492d4644079c88f2adee9c3cac9543:

  vim: improve reproducibility (2019-02-04 22:09:31 -0800)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/thud-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/thud-next

Adrian Bunk (2):
  wireless-regdb: update 2018.05.31 -> 2018.10.24
  Split ntpq into an own package

André Draszik (2):
  mosquitto: fix build in systemd environments
  mosquitto: fully switch over to using PACKAGECONFIG_CONFARGS

Khem Raj (1):
  rtmpdump: Switch to using GNU TLS instead of openssl10

Ovidiu Panait (1):
  python3-blivetgui: Fix _supported_filesystems crash

 .../recipes-multimedia/rtmpdump/rtmpdump_2.4.bb    |  4 +--
 .../mosquitto/mosquitto_1.5.1.bb                   | 13 +++-----
 ..._2018.05.31.bb => wireless-regdb_2018.10.24.bb} |  4 +--
 .../recipes-support/ntp/ntp_4.2.8p12.bb            |  5 ++-
 ...ted_filesystems-in-BlivetGUIAnaconda-init.patch | 39 ++++++++++++++++++++++
 .../python-blivet/python3-blivetgui_2.1.8.bb       |  1 +
 6 files changed, 53 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2018.05.31.bb => wireless-regdb_2018.10.24.bb} (91%)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Set-_supported_filesystems-in-BlivetGUIAnaconda-init.patch

-- 
2.7.4


