Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QczF5-0005kz-Rd
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:24:11 +0200
Received: by fxh10 with SMTP id 10so4286957fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 05:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8ijUjpx3ErzxobfSXU5ZkyN9IY76TsZyc3f3nop+Z5k=;
	b=yGCJZjVmnYgbx+YyOEW9XV9aSUXU/zauory5gqcLti4XoRYZwIjGMiO2cGwvNcJKtP
	NeJcMHu3vihlFJokp86vOIHxmvUCC1+8xzUpiFSnek+pwQUVDS72qienio19OsPozuC5
	cRgq6OOvAONyv0GrlyseTP5vknz5Q0HonqZwA=
Received: by 10.223.158.130 with SMTP id f2mr6451826fax.61.1309609222690;
	Sat, 02 Jul 2011 05:20:22 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-149-243.dynamic.xdsl-line.inode.at [85.127.149.243])
	by mx.google.com with ESMTPS id b3sm3046153fao.20.2011.07.02.05.20.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 05:20:21 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jul 2011 14:20:37 +0200
Message-Id: <cover.1309608953.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH 0/4] Various package additions/upgrades
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
X-List-Received-Date: Sat, 02 Jul 2011 12:24:11 -0000

Find attached some package additions and an upgrade to audiofile. I have some
packages using a stand-alone s-s-d. Maybe it's useful for others too.

Pull URL: git://github.com/zoidrr/meta-openembedded.git
  Branch: master
  Browse: https://github.com/zoidrr/meta-openembedded/commits/master

Thanks,
    Michael Lippautz <michael.lippautz@gmail.com>
---


Michael Lippautz (4):
  pyudev: Add intial version
  sqlalchemy: Add initial version
  audiofile: 0.2.6 -> 0.2.7
  start-stop-daemon: Add initial version

 .../recipes-devtools/python/python-pyudev_0.11.bb  |   22 ++++++++
 .../python/python-sqlalchemy_0.7.1.bb              |   15 +++++
 .../audiofile-0.2.7/CVE-2008-5824-rebased.patch    |   22 ++++++++
 .../audiofile-0.2.7/audiofile-oldstyle.patch       |   55 ++++++++++++++++++++
 .../audiofile/audiofile_0.2.7.bb                   |   20 +++++++
 .../start-stop-daemon_1.16.0.2.bb                  |   32 +++++++++++
 6 files changed, 166 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
 create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/CVE-2008-5824-rebased.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/audiofile-oldstyle.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb

-- 
1.7.3.4



