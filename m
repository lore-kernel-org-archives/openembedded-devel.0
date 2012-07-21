Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsUrf-00035t-Dz
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 10:16:39 +0200
Received: by wibhq4 with SMTP id hq4so1112052wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=05mJNEg4K8Rixe5pPpXPq73h/VVU9haQ9TVEg8/zPn0=;
	b=W9e/8c2Txak9kpHmC1bhJzsQ2XJIKUAS6TaN7yFHzkzp/sRl7w1CF5pIPcGLmsNUWS
	6zSzMIxQ5INoqbJ8TfkG2OCVzKjHp3PmFSNI24dOfO9WT7t/eEWIRykZu9qRPZnLyykM
	RO6bGfked5QZyzxo1DSbFc3G6WIJVD6jcVX/mb4HLtV3XEXOn6CtYNceSM97Sbp4S3x3
	zlT/5apUo7eifYM7EELrpADEZlS9ThO+DHWAXeEARzs3+bblD7xlXlxU9zTt5kD722XL
	fHL7MgMOrasV3boKsT0jj2VVLmLnYP8RkOlKldDPjnZRG4Uqzxoq8s8T0dVwl4rr/T86
	yhzA==
Received: by 10.180.103.4 with SMTP id fs4mr20586805wib.16.1342857915299;
	Sat, 21 Jul 2012 01:05:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm2488798wib.2.2012.07.21.01.05.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 01:05:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jul 2012 10:05:04 +0200
Message-Id: <cover.1342857860.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-systemd][PATCH 0/3] Pending changes
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
X-List-Received-Date: Sat, 21 Jul 2012 08:16:39 -0000

The following changes since commit ec501e356f52c10967ad8185be1db7b0804a1b5b:

  systemd: include /etc/rpm/macros.systemd in PN-dev (2012-07-20 13:29:48 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (3):
  phonet-utils: package udev rules
  udev-extra-rules: add mount.blacklist to CONFFILES
  systemd: cleanup /var/run on boot and create /var/run/utmp

 .../phonet-utils/phonet-utils_git.bb               |    3 ++-
 meta-oe/recipes-core/udev/udev-extra-rules.bb      |    5 +++--
 .../recipes-core/systemd/systemd/var-run.conf      |    4 ++++
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    5 ++++-
 4 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/var-run.conf

-- 
1.7.8.6



