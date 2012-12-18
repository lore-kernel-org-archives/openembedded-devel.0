Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0fx-00071l-3s
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:09:54 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so380668eaa.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=BZ3MYBe0MowcvKmDbdZb18mGBKbr0HsGpMjL+cdBaIo=;
	b=Le8hOtKgPsUsRT3t8GDBQavcDCOuyuxD6UvjWZZXtC0kPgA62453OnFDteP81Lzovh
	0M+Kxa4BAyFpuT6gfW2TNeLsjd8Rti9B92uG7Tz1umXwCF3Vc4HA1r5ohit65ZHDh+JM
	gg9lU2lfHx8sg875RfHdDyVxBONW0cIoFdVAkSB0Yheeevmr+IBNV41nOh+pKpCz79un
	6M/tSLaubh7GYw+AOMoNGCf/UpQElxO9hAeRNm8huFAtpVQQMnm5pFXrxjDfAGmYgNbz
	oE66UXP7sPJMLeWUQajMBu/3xtEwYW0wfRfQnGFt3hXK9u0CKxLMC8BI54PMH53FTuCU
	dN7Q==
X-Received: by 10.14.208.137 with SMTP id q9mr7010217eeo.28.1355849711022;
	Tue, 18 Dec 2012 08:55:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm4208448eep.15.2012.12.18.08.55.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:54:59 +0100
Message-Id: <cover.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 00/10] [meta-oe] More pending patches from patchwork and few fixes
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
X-List-Received-Date: Tue, 18 Dec 2012 17:09:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bitbake world is still running, but if everything goes well I'll merge this tomorrow

The following changes since commit 4b5d2af979c17c6a2a65a6ea9a4e7f41414c9feb:

  libsdl-mixer: update to upstream version 1.2.12 (2012-12-16 21:11:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Andreas Müller (1):
  gvfs-gdu-volume-monitor: avoid double packaging gvfs locale

Ben Deering (1):
  claws-mail: Upgrade from 3.6.1 to 3.9.0

Cliff Brake (1):
  update oe-stylize to be Python3 comaptible

Marcin Juszkiewicz (1):
  florence: move to meta-gnome due to libnotify

Martin Jansa (6):
  geos: fix typo in FILES_${PN}-dev
  krb5: fix path to recipe and upgrade to 1.11
  e-base: bump EFL_SRCREV for E17 release called lucky
  terminology: upgrade to 0.2.0
  azy: rename lemon provided by azy-native to azy_lemon
  evince: disable help build

 contrib/oe-stylize.py                              |  10 +-
 meta-efl/classes/e-base.bbclass                    |   2 +-
 .../conf/distro/include/efl-from-svn-recipes.inc   |   2 +-
 .../{terminology_0.1.0.bb => terminology_0.2.0.bb} |   4 +-
 meta-efl/recipes-efl/e17/terminology_svn.bb        |   2 +-
 meta-efl/recipes-efl/efl/azy_svn.bb                |   6 +-
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |   3 +-
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |   3 +-
 .../florence/files/0001-Fix-glib-includes.patch    |   0
 .../recipes-support/florence/florence_0.5.1.bb     |   0
 .../recipes-connectivity/krb5/krb5_1.11.bb         |  24 +-
 meta-oe/recipes-navigation/geos/geos.inc           |   8 +-
 .../claws-mail-3.6.1/claws-mail-g_strcmp0.patch    | 575 ---------------------
 .../claws-mail/claws-mail-3.6.1/desktop.patch      |  19 -
 .../claws-mail-3.6.1/duplicate-header.patch        |  10 -
 .../claws-mail/claws-mail-3.6.1/glib-2.32.patch    |  11 -
 .../{claws-mail_3.6.1.bb => claws-mail_3.9.0.bb}   |  17 +-
 17 files changed, 38 insertions(+), 658 deletions(-)
 rename meta-efl/recipes-efl/e17/{terminology_0.1.0.bb => terminology_0.2.0.bb} (41%)
 rename {meta-oe => meta-gnome}/recipes-support/florence/files/0001-Fix-glib-includes.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-support/florence/florence_0.5.1.bb (100%)
 rename meta/recipes-connectivity/krb5/krb5_1.8.5.bb => meta-oe/recipes-connectivity/krb5/krb5_1.11.bb (48%)
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/claws-mail-g_strcmp0.patch
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/desktop.patch
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/duplicate-header.patch
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/glib-2.32.patch
 rename meta-oe/recipes-sato/claws-mail/{claws-mail_3.6.1.bb => claws-mail_3.9.0.bb} (72%)

-- 
1.8.0.2



