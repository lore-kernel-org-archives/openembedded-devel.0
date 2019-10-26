Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id E78F17FC11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 08:43:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c2so4822665wrr.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=2TskLE6SVkNxI2d7UA5/Xid773d1lqAEKMpnLHUOBNk=;
	b=veKB1jhGdOQerfDPcYguJ5GGyLUzzkqD397NQpdhIy+E6lqfdNu/UqYCXkW6Z1isjg
	Llkm9MX0Zl9S124/2f7pi7tjMdLl+1SnrK/AaqucGKn1Wg/K49Yzrd1420fm+1bxdM8i
	UaIXlVqrzx1i+kMRbiZiHg/B0C3UyAYqNocMdkmr/CTDKSOtEQg5uoe4K9IB/Rs6vTZq
	NANRc3NM4G4TdJERe0RL89x89tPTLt9daP79h9pWlJg3C/LXOaDo8rFG/G6RO0mJNI/x
	m2DZ+fHEGj9stCtaU4oZL/YKXtLdZ2GYESvKTMGxShjEsfqE5PCFprD+LXPdcTo9NywW
	ZoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=2TskLE6SVkNxI2d7UA5/Xid773d1lqAEKMpnLHUOBNk=;
	b=G3SmrvjRXBuWbm4eyImRRqR5jZyl5J1JLQTnD+EZBo0E49whj2fWgE1GOKMb+P+fq1
	pZGkTXcLANNO1BJQu0YnZmFmkV0SYIHtYpZnbqcVa7JF8YYaRJZPw0d9nfW3q5wWqNaS
	EFHj4eO9ZJNma4V90VB5A4SflOlbYoZktv+/nk1ZoDsX5Bg4KS03O/D6TYQHWJ4ro8V6
	5GoQ9a2/jFInYgO03owVrx7OoaZdx/EhfC9PenSL5VQokbB9KIjv1zqsh6YtA+H5ID8b
	IxyjMU+RGguNL50aFAGr5ZssspEFYRxVuCtQ+tnPRaoZbhB+icnloHkArcU8e5EawzT5
	iEXA==
X-Gm-Message-State: APjAAAUeSv0JXq2u7qLQMRnBg+Yi1153B9u8Yt7giHbpxiN4xfUJEdPD
	FPT4CuEGN8aI73IHiUoEeQk=
X-Google-Smtp-Source: APXvYqwDjn+lv846hbGpe2fgdntJRBJRyMxadi8l+CVNf8/tB/YZovSVa6iePGebhecsXoHugYJlTw==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr6970020wrr.114.1572079422425; 
	Sat, 26 Oct 2019 01:43:42 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id
	a17sm6493848wrx.84.2019.10.26.01.43.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Oct 2019 01:43:42 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7dcc70b4-c510-c20d-4afc-8f6d53b82589@gmail.com>
Date: Sat, 26 Oct 2019 01:43:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
Subject: warrior pull request
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
X-List-Received-Date: Sat, 26 Oct 2019 08:43:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit f4ccdf2bc3fe4f00778629088baab840c868e36b:

  mariadb: update SRC_URI to use archive.mariadb.org (2019-10-09
11:26:58 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded warrior-next

for you to fetch changes up to a24acf94d48d635eca668ea34598c6e5c857e3f8:

  tcpdump: Delete unused patch (2019-10-19 08:25:27 -0700)

----------------------------------------------------------------
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

 meta-multimedia/recipes-multimedia/vlc/vlc.inc     | 24 ++++---
 ...2017-16808-AoE-Add-a-missing-bounds-check.patch | 61 -----------------
 .../tcpdump/tcpdump/add-ptest.patch                |  9 +--
 ...-absolute-path-when-searching-for-libdlpi.patch | 19 ++---
 .../recipes-support/tcpdump/tcpdump/run-ptest      |  4 +-
 .../tcpdump/unnecessary-to-check-libpcap.patch     | 15 ++--
 .../tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb} | 12 +++-
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb  |  2 +
 .../kconfig-frontends_4.11.0.1.bb                  |  4 +-
 .../protobuf-c/0001-avoid-race-condition.patch     | 36 ++++++++++
 .../recipes-devtools/protobuf/protobuf-c_1.3.1.bb  |  3 +-
 .../recipes-extended/polkit/polkit-group-rule.inc  |  2 +-
 .../xorg-font/xorg-fonts-100dpi.bb                 |  2 +-
 ...missing-return-statements-in-module-stubs.patch | 38 ++++++++++
 .../python/python3-twofish_0.3.0.bb                |  2 +
 ...y-Fix-icons-without-compositing-Bug-14577.patch | 80
++++++++++++++++++++++
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb |  1 +
 17 files changed, 214 insertions(+), 100 deletions(-)
 delete mode 100644
meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.2.bb =>
tcpdump_4.9.3.bb} (74%)
 create mode 100644
meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
 create mode 100644
meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
 create mode 100644
meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch



