Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrsX-0004Wz-0M
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:04:01 +0100
Received: by eaac1 with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kKPAWtfQcF0G/FV0tBTBeXoKbfuHvSX3aKqwhC3WWzE=;
	b=hM7cwCFT6p2FbivK/hG96+17/lcX7u1faIZcNcrIStsCL7T3aNM1ugzmHr87UNPbj6
	KLLRNWi+CsBEUG8nYNu4RmlSW/t4YJYiuGqqS4ObZuSN8horK2YdlXDO+AhtxeCRNqVg
	0MdPGlVAmUg5mRsqVmgdYJjDORM4RKMBhN5S8=
Received: by 10.213.28.135 with SMTP id m7mr2205387ebc.73.1323165434059;
	Tue, 06 Dec 2011 01:57:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm69308277eea.6.2011.12.06.01.57.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:57:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:05 +0100
Message-Id: <cover.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH][meta-efl 00/16] efl upgrade
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
X-List-Received-Date: Tue, 06 Dec 2011 10:04:01 -0000

The following changes since commit 084fc20cd5377827a7f5a16e5f7179b89fd26886:

  testlab: only use basename for license info to avoid diff churn (2011-12-06 08:41:58 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Klaus Kurzmann (1):
  elsa_svn.bb: disable pam if not in DISTRO_FEATURES

Martin Jansa (14):
  e-base: bump EFL_SRCREV for beta
  edbus: include libeconnman0_7x in edbus-connman, otherwise whole PN
    is renamed and breaks upgrade path
  e-wm: bump PR after edbus-econnman fix
  elsa: add systemd service and add RCONFLICTS/RREPLACES with
    xserver-nodm-init
  e-base: introduce EFL_SRCREV_1.1.0 and bump EFL_SRCREV
  efl-from-svn: update preferred versions
  e.bbclass: remove autopoint, shouldn't be needed anymore
  Revert "elementary: add gettextize patch"
  enjoy: remove SHR override and add autopoint
  eeze: RRECOMMEND eject, build time autodetection is now fixed
  elsa: fix to build with disabled PAM
  libeflvala: try to fix build
  python-elementary: temporary fix to get it build
  eve: add autopoint

pespin (1):
  enjoy: Update gstreamer package names in RDEPENDS

 meta-efl/classes/e-base.bbclass                    |    6 +-
 meta-efl/classes/e.bbclass                         |    4 -
 meta-efl/conf/distro/include/efl-from-svn.inc      |    6 +-
 ...ementary-temporary-fix-for-build-breakage.patch |   49 ++++++
 .../python/python-elementary_svn.bb                |    4 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |   19 +-
 meta-efl/recipes-efl/e17/eve_svn.bb                |    6 +-
 meta-efl/recipes-efl/e17/expedite_svn.bb           |    5 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    4 +-
 meta-efl/recipes-efl/efl/edbus.inc                 |    4 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    4 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |    4 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |    4 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    2 +
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    4 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    4 +-
 meta-efl/recipes-efl/efl/eina_svn.bb               |    4 +-
 .../0001-elementary-gettextize-0.18.1.patch        |   76 ---------
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    4 +-
 ...-build-really-without-PAM-support-if-PAM-.patch |  179 ++++++++++++++++++++
 meta-efl/recipes-efl/efl/elsa/xserver-nodm.service |    8 +
 meta-efl/recipes-efl/efl/elsa_svn.bb               |   23 +++-
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    4 +-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    4 +-
 ...a-update-genlist-gengrid-callbacks-s-labe.patch |   97 +++++++++++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    4 +-
 27 files changed, 411 insertions(+), 123 deletions(-)
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elementary/0001-elementary-gettextize-0.18.1.patch
 create mode 100644 meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch
 create mode 100644 meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
 create mode 100644 meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch

-- 
1.7.8



