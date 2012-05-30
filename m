Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SZjwd-0000sw-Vf
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 16:32:16 +0200
Received: by bkcjm2 with SMTP id jm2so4321917bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=VRBBc4JRF7i2y7ev/cTut8v5esloZ9yVJNt52ZkFi60=;
	b=ELCtWmH0KgP7IeV/QVa+GiRM/nM1nPbe9LgVljbf/x7bTY7Jnop9h2tIv8lP7GX5ga
	xJ7Pnnhsg45HWAKJL/hsCi0G8j01690VcBe2WtI8GHmZSX/dRuznKadPnhY/0r7pBhzy
	VkC87iLtGIChJm++iALzAKp40gFuEsZ8IQU1T7XWyWb3PcESiu0e1XwJxTT0n2T13ic0
	oqk0o8NbKKGxChCKr6gBnllgs2Q06VDTFO620aDo0/RhXc7egCsyL5FCjxPfzFD4ctQK
	6PoKr2McUPtbAlZfseLiYpSuKon1hEaGRMBMHuTjlNnClup4ii1b140+9qJodsTAMyxa
	GeKw==
Received: by 10.205.120.17 with SMTP id fw17mr9602241bkc.20.1338387717402;
	Wed, 30 May 2012 07:21:57 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	fu14sm22420252bkc.13.2012.05.30.07.21.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 07:21:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2012 16:21:55 +0200
Message-Id: <cover.1338386047.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-efl][PATCH 0/3] small fixes
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
X-List-Received-Date: Wed, 30 May 2012 14:32:16 -0000

The following changes since commit 5b6549cd03b26c2cf300ab85ee6334f4d7389b1d:

  ubi-utils-klibc: clean ubiformat patch (2012-05-24 12:52:11 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (3):
  gcalctool: remove older version and drop 'patch=1'
  systemd.bbclass: fix postinst/rdepends generation for recipes with
    SYSTEMD_SERVICE (without _PN suffix)
  recipes: bump PR to fix -systemd postinsts where SYSTEMD_SERVICE was
    used without PN* suffix

 meta-efl/recipes-efl/efl/elsa_svn.bb               |    2 ++
 .../recipes-gnome/gcalctool/gcalctool_5.7.32.bb    |   13 -------------
 .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |    2 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    2 +-
 meta-oe/classes/systemd.bbclass                    |    3 ++-
 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend   |    2 +-
 .../cherokee/cherokee_1.2.98.bb                    |    2 +-
 .../recipes-connectivity/gateone/gateone_git.bb    |    2 +-
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 .../openssh/openssh_6.0p1.bbappend                 |    2 +-
 .../systemd/systemd-machine-units_1.0.bb           |    2 ++
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |    2 +-
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    2 ++
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    2 ++
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |    2 ++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    2 +-
 17 files changed, 22 insertions(+), 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb

-- 
1.7.8.6



