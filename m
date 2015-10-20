Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id B6F0275D48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 00:04:04 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so1482794pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 17:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=qvwJMPeH67z/L31u2otLkjbrFXresK+0aZxBDNYQCYg=;
	b=F/YkD6MGUL3PaWO7vh64nhjcVdBChRRdRl4mdqU3QraGBWE61zMQlgnoZp9PK6ZqcV
	4heW5ilPHY+KA8+vjPww+LoTQPDiZRW2pTNkeB/q8YgJIdGxc4YEWNndrJCaESkheoPL
	YSyl+nmzABuzDSo6lYeqVlOWRaRdsYxj+yH/7fv3NwHsGbdMkx04H7/wugO82XFSJLHq
	f5/isNjXrau6+qAgpPKVHv58B/jTk3qApDSbcI+0PO0aeD8J+6WWwe9VTDRWV6v9a75m
	UMcrMONz7OyOoaijqOthQkooYz0nYj1UANtjXOLRsrQXvdi3MT+46kgj9q4+RwgdgDha
	hlHA==
X-Received: by 10.66.121.163 with SMTP id ll3mr221438pab.69.1445299444302;
	Mon, 19 Oct 2015 17:04:04 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id ch3sm185286pbb.18.2015.10.19.17.04.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 17:04:03 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 209E8FC2079; Mon, 19 Oct 2015 17:03:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Mon, 19 Oct 2015 17:03:51 -0700
Message-Id: <cover.1445299139.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] Dizzy-next update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Oct 2015 00:04:05 -0000

Please consider these changes for dizzy next

The following changes since commit 7f1df52e9409edcc4d4cd5f34694f8740f56e1bf:

  fuse: fix for CVE-2015-3202 Privilege Escalation (2015-07-19 17:05:16 -0700)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/dizzy-next
  https://github.com/akuster/meta-openembedded/tree/akuster/dizzy-next

Martin Jansa (5):
  oscam: respect *flags set from OE
  gupnp-igd: fix missing dependencies
  tcpdump: add PACKAGECONFIG for smi
  geoclue: add PACKAGECONFIG for geoip
  llvm.inc: fix PACKAGES_DYNAMIC

 .../recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb  |  2 +-
 .../recipes-dvb/oscam/oscam/respect-cflags.patch   | 38 ++++++++++++++++++++++
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb     |  4 ++-
 .../recipes-support/tcpdump/tcpdump_4.6.1.bb       |  1 +
 meta-oe/recipes-core/llvm/llvm.inc                 |  2 +-
 .../recipes-navigation/geoclue/geoclue_2.0.0.bb    |  2 ++
 6 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/oscam/oscam/respect-cflags.patch

-- 
1.9.1


