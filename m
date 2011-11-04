Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMNkm-0008Ot-Mz
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 18:40:33 +0100
Received: by gyh4 with SMTP id 4so1406833gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=IQx2qvVm6Gas9PKr9aR2DBklu9Wmn7+UpoEEX5VIH8A=;
	b=lcsaStFEC9JtS6U+NKx66Gj4nS+/OVR3X/toj4txamLyqd1Wmj56lXqPqxa4kfFkhN
	p3cE+NYodSUDSu7nCgUjpFjhpsCASTVkwHl1/oAU3r6YvrjF2T/2DlHruvUEHz70ILdi
	RX9iyz4/Vom0xJRCXM+1WKjrW1H4fMqEeFPFU=
Received: by 10.236.72.167 with SMTP id t27mr21388052yhd.127.1320427572718;
	Fri, 04 Nov 2011 10:26:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y58sm6548572yhi.17.2011.11.04.10.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 10:26:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:25:57 +0000
Message-Id: <cover.1320427498.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/3] SystemD service management support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2011 17:40:33 -0000

The following changes since commit 120753e7437bc893462356ef153b67d38f7f696e:

  php 5.3.6: import from OE classic (2011-11-03 15:02:20 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  systemd-systemctl-native: add a systemctl wrapper
  systemd.bbclass: make easier handle service enabling
  connman: refactor systemd packaging

 meta-oe/classes/systemd.bbclass                    |   78 ++++++++++++++++++++
 meta-oe/recipes-connectivity/connman/connman.inc   |   24 +-----
 .../recipes-connectivity/connman/connman_0.77.bb   |    2 +-
 .../systemd/systemd-systemctl-native.bb            |   13 +++
 .../systemd/systemd-systemctl-native/systemctl     |   51 +++++++++++++
 5 files changed, 148 insertions(+), 20 deletions(-)
 create mode 100644 meta-oe/classes/systemd.bbclass
 create mode 100644 meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl

-- 
1.7.2.5



