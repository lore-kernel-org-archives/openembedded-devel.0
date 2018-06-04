Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 952307472A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:48:55 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id l65-v6so3407594pgl.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=lgiyb/EdXlwK4L/PpL3RSsOYcEGb+PoN6vkj+zj+e70=;
	b=OxW2CiKrZd4pc4WxP0gAXQoIdvAWRs0OMJZOPlf0cdh7pjfxKHdVzsVThnlAR9tLW1
	ZWweTh7urVHXUl9wpaQliF5gcBbve1sMoVptaI/EzGyDOSILbz3UoEWuT/Sj74z5xQUW
	ywZTdQtOfkxHEaioPtQqEloTaLhnyBsBwjZr8KKuB3OVSEFWoJhd4Sg/ZO4ikmia/SL0
	XYl95j4qsEjtCMaOflONQHNb4RE3925z+e/cYREwCIomT2MoYpLYuMRZ8PtzPLOYbVNi
	FuQ6/2yGU15gMahfQRTWYeU6Gi7uK1vmyZ1Vh2MIZxFI9phCGSNa0enBqwbNCsOttXwq
	8V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lgiyb/EdXlwK4L/PpL3RSsOYcEGb+PoN6vkj+zj+e70=;
	b=M0mLN+L+AhK+fKV+Jcu73/BRChFvfCsgxkTlpBHvY8fAnA1mJ5sfvlKNsHKkLK4tlR
	Cbk5VVlRRXhDVnh4WuG8YP8ltlEgx0/ke377Wig3UJjerk9C0ZyNeAXoaaEHWwo5Vk4T
	7K5U6XPMdMoDFvELpEPaaklWCmLiGAekpeXaortDZ5DbAAePL3vH4cVpWr4en3wQE1v2
	bhK1Yuo/pbvyB3xA8LqP9osolx8qjY473ApLTbQUQn6ELJqTmTYrhBgZ34Nh2b7fEy+A
	Mz784vQHzfq9D6as0e31eWVrUry+owj0Mw9+Xwwp44x1G3JLL8eaCDomCvES2VsLUEK0
	A2uw==
X-Gm-Message-State: ALKqPweU/sYtGTgig0cFpovdOHHolwPlGCEQFideCAfu5eKRJRzFd+F7
	Gax7KJ1g120903+NmF/Qj7M=
X-Google-Smtp-Source: ADUXVKIdY2CYKDmLYtKRowBVyrNNXSdVdGVsuibA1eOkmfAIA8XxPw55PhLlu3E1OhHBpZG7j38lfQ==
X-Received: by 2002:a62:3c96:: with SMTP id
	b22-v6mr14528407pfk.235.1528080536643; 
	Sun, 03 Jun 2018 19:48:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:48:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:34 -0700
Message-Id: <cover.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty 00/15] Morty pull request
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
X-List-Received-Date: Mon, 04 Jun 2018 02:48:55 -0000

Please consider these changes for the next morty update

The following changes since commit b40116cf457b88a2db14b86fda9627fb34d56ae6:

  zile: fix do_install (2017-08-05 07:53:02 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/morty-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/morty-next

Andre McCurdy (1):
  luajit: mips and mipsel are 32bit targets too

Armin Kuster (5):
  wireshark: update to 2.2.6
  wireshark: update to 2.2.9
  wireshark: update to 2.2.10
  wireshark: Update to 2.2.11
  wireshark: Update Package to 2.2.12

Isaac Hermida (1):
  hostapd: fix WPA2 key replay security bug

Kai Kang (1):
  wireshark: 2.2.7 -> 2.2.8

Khem Raj (1):
  mariadb: Do not use ucontext_* APIs with musl

Oleksandr Kravchuk (2):
  lftp: change SRC_URI source
  wireshark: update to 2.2.5

Pascal Bach (1):
  poco: make cmake packages relocatable

Zhang Xiao (1):
  dnsmasq: backport CVE fixes from dnsmasq 2.78

dengke.du@windriver.com (1):
  opensaf: fix QA Issue

fan.xin (1):
  wireshark: Upgrade to 2.2.7

 .../recipes-connectivity/lftp/lftp_4.7.3.bb        |   2 +-
 .../recipes-daemons/opensaf/opensaf_5.0.0.bb       |  14 +-
 .../dnsmasq/dnsmasq-CVE-2017-14491-02.patch        |  75 ++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch   | 268 ++++++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch   |  37 +
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch   |  37 +
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch   |  37 +
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch   |  48 ++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch   |  73 ++
 .../recipes-support/dnsmasq/dnsmasq_2.76.bb        |   7 +
 .../{wireshark_2.2.4.bb => wireshark_2.2.12.bb}    |   8 +-
 .../hostapd/hostapd/key-replay-cve-multiple.patch  | 939 +++++++++++++++++++++
 .../recipes-connectivity/hostapd/hostapd_2.5.bb    |   1 +
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb    |   2 +
 meta-oe/recipes-support/mysql/mariadb.inc          |   1 +
 .../mariadb/0001-disable-ucontext-on-musl.patch    |  28 +
 meta-oe/recipes-support/poco/poco_1.7.5.bb         |  11 +-
 17 files changed, 1569 insertions(+), 19 deletions(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491-02.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.4.bb => wireshark_2.2.12.bb} (90%)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/key-replay-cve-multiple.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch

-- 
2.7.4


