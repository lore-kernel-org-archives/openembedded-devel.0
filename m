Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3D460D27
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:02 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so6997715eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZuoDS1iru6Gpxj8IYJG2WVyZNRY+o61TgYYr+rmwcro=;
	b=WqtZZR4hO0kQPR363RCUUDwoDFmzGm7v6D+ZmpPFTpwEfdyB7Bh1nhqbTc/FOmO7YO
	Are9u5VsfvheErWUHESTmWxex+CACbRI689xLixiePlAjXH7YQ1TyDytECE0ZLFMC5i+
	LnAgYoIgwDGoVEH4HXaHcA6Pc9eu8x5mp0y6Z/7DbdpbRk0rDQW33fqCGMCn+Hj/lzGM
	QDqpBYqeK7nfXof1KAkYRNy+LBgDgFMpHL1554m9Eb/5LeOFoh7PKED4Dla1By/P6OhN
	TDyGMXHvoGkvnPy/kI5OTqZ4pcxmKp7VEQkihwOZskeoDLhKUCjfTtwcpT5sztSGq2H9
	2HnA==
X-Received: by 10.14.6.136 with SMTP id 8mr78064155een.11.1388834042665;
	Sat, 04 Jan 2014 03:14:02 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	g47sm152645453eeo.19.2014.01.04.03.14.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:13:56 +0100
Message-Id: <cover.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 0/9] Dylan backports
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:03 -0000

The following changes since commit 44754206632dd5b0725aeb43e99e4ff9e0245dca:

  net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos (2013-10-10 21:30:38 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/dylan-backports
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/dylan-backports

Martin Jansa (9):
  tbb: Disable thumb
  rfkill: Fix build when WORKDIR is included in some git checkout
  cifs-utils: Add PACKAGECONFIG for cifscreds, cifsupcall
  gateone: Drop allarch
  mime-support: Drop allarch
  zram: Drop allarch
  usb-modeswitch-data: Exclude SIGGEN dependency on usb-modeswitch
  fbset-modes: Explicitly set MACHINE_ARCH
  tvheadend: Disable dvdscan

 .../recipes-dvb/tvheadend/tvheadend_git.bb         |  1 +
 .../recipes-support/cifs/cifs-utils_git.bb         |  4 +++
 meta-oe/conf/layer.conf                            |  4 +++
 .../recipes-connectivity/gateone/gateone_git.bb    |  2 +-
 .../dont.call.git.rev-parse.on.parent.dir.patch    | 31 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb  |  3 ++-
 meta-oe/recipes-extended/zram/zram_0.1.bb          |  5 ++--
 meta-oe/recipes-support/fbset/fbset-modes.bb       |  6 ++++-
 .../mime-support/mime-support_3.48.bb              |  1 -
 meta-oe/recipes-support/tbb/tbb_4.1.bb             |  8 ++++++
 10 files changed, 59 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch

-- 
1.8.4.3


