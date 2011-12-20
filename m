Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd0Ke-0003x6-7z
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:06:18 +0100
Received: by eeit10 with SMTP id t10so2602620eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 05:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/ONfOGtjknKDkCwTj1caZqGUnLuu6c/qjqidVZMNVQE=;
	b=QL5T7nZRKZtU2xrH+g3SyFWapuY0k+CYSzCz7cm+rLpC+EatISexqeKq0bJPG2XKVv
	9gtQeykIhkkQ93ayM0as6CFSma7aY+5X5HxFFyEoLxx2dYXr1KYy3MymFOjD1iXBhmMS
	oBEjDHqhlo1OW/R1Q3onitQ++BWNdFjJgQajk=
Received: by 10.213.27.15 with SMTP id g15mr535371ebc.111.1324389552493;
	Tue, 20 Dec 2011 05:59:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t59sm7080491eeh.10.2011.12.20.05.59.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 05:59:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 14:59:03 +0100
Message-Id: <cover.1324389403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH][meta-oe][meta-efl 0/7] EFL, gpsd and midori upgrade
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
X-List-Received-Date: Tue, 20 Dec 2011 14:06:18 -0000

The following changes since commit 5b1dff8b4f52873060b75813eeba864d64a70083:

  vlc: rework dependencies (2011-12-20 14:15:07 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (7):
  e-base: bump EFL_SRCREV remove EFL_SRCREV_1.* and applied patches
    from libeflvala, elsa and python-elementary
  edje: fix unpackaged multisense modules
  e-base: bump EFL_SRCREV a bit more
  e-tasks: add patch to fix changed callback name
  gpsd: upgrade from 2.95 to 2.96, drop 2 patches applied upstream
  navit: bump PR after gpsd upgrade (.so name change)
  midori: upgrade from 0.4.2 to 0.4.3

 meta-efl/classes/e-base.bbclass                    |    9 +-
 ...ementary-temporary-fix-for-build-breakage.patch |   49 ------
 .../python/python-elementary_svn.bb                |    2 -
 .../e-tasks/0001-fix-changed-callback-name.patch   |   40 +++++
 meta-efl/recipes-efl/e17/e-tasks_svn.bb            |    5 +-
 meta-efl/recipes-efl/e17/expedite_svn.bb           |    2 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edje.inc                  |    6 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/eina_svn.bb               |    2 +-
 ...-build-really-without-PAM-support-if-PAM-.patch |  179 --------------------
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 ...a-update-genlist-gengrid-callbacks-s-labe.patch |   97 -----------
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    1 -
 .../midori/{midori_0.4.2.bb => midori_0.4.3.bb}    |    9 +-
 .../gpsd/gpsd-2.95/fix-build-with-python2.7.patch  |   15 --
 .../gpsd/gpsd-2.95/libtool.patch                   |   16 --
 .../gpsd/{gpsd-2.95 => gpsd-2.96}/60-gpsd.rules    |    0
 .../gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd             |    0
 .../gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd-default     |    0
 .../gpsd/{gpsd_2.95.bb => gpsd_2.96.bb}            |   10 +-
 meta-oe/recipes-navigation/navit/navit_svn.bb      |    2 +-
 28 files changed, 65 insertions(+), 396 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-fix-changed-callback-name.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch
 delete mode 100644 meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.2.bb => midori_0.4.3.bb} (54%)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.95/libtool.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.95 => gpsd-2.96}/60-gpsd.rules (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd-default (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_2.95.bb => gpsd_2.96.bb} (90%)

-- 
1.7.8



