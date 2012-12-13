Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhO-0006uZ-D8
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522323eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=YuHSQatRGpTGkQBme1nZQeoq3cWhIuJ/zZp1EntSruM=;
	b=geN0X0v5e0REyIpvZmZgHvPofEYzrsymD7UDr+Oloqx0NPP7nTHEsErBjavLXyZwhR
	rXH35ayqPesAOxHSN7O9nkEFVBpgpzHogmfWf6Z25m3XXVmd/qrWDX2EKw3OkuXn3Vyt
	QKu/xfh5m4wDnxN4v09JwoEIDpLDYnkrzYnAU6WT2uWVvUXMfrlMSXan8nymWrSHbST3
	eDxjIWjy6gozlBGY8Za7s34bVWHmvRYBj89pC8Z4o5bVwWD6hByvE96l8LPxIwvojnk5
	lGq3xbnj1aZ2KIkPiciG4SztbNM1et3EBfc4Xy8bce0svsm8OBK/2+kO0tA5nnmG10dZ
	bZzA==
Received: by 10.14.178.196 with SMTP id f44mr9282054eem.14.1355438498799;
	Thu, 13 Dec 2012 14:41:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm5688204eeg.4.2012.12.13.14.41.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:41:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:40 +0100
Message-Id: <cover.1355438401.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 00/11] [meta-oe] Few more small fixes for world image and another EFL bump
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit f36e2e2ea4edcd4a0e65ed1c213bce388231214c:

  gcalctool: upgrade to 5.32.0 (2012-12-11 01:54:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Andreas Müller (1):
  lighttpd: follow oe-core to 1.4.32

Martin Jansa (10):
  strongswam: disable systemd support in meta-oe and reenable it in
    meta-systemd
  qconnman-e: fix unpackaged files QA warning
  qt4: rename bbappends to match new 4.8.4 version from oe-core
  efl: upgrade to 1.7.3
  e-base: bump EFL_SRCREV for E17 beta1 and EFL 1.7.3
  e-base: bump EFL_SRCREV for E17 gamma
  pixman: drop bbappend with only PRINC left
  gnome-control-center: fix QA issue
  glade3: disable html doc, fails to build
  iotop: don't fail when site.py* does not exist

 meta-efl/classes/e-base.bbclass                                |  2 +-
 meta-efl/recipes-efl/efl/{ecore_1.7.2.bb => ecore_1.7.3.bb}    |  4 ++--
 meta-efl/recipes-efl/efl/{eeze_1.7.2.bb => edbus_1.7.3.bb}     |  4 ++--
 meta-efl/recipes-efl/efl/{edbus_1.7.2.bb => edje_1.7.3.bb}     |  4 ++--
 meta-efl/recipes-efl/efl/{edje_1.7.2.bb => eet_1.7.3.bb}       |  4 ++--
 meta-efl/recipes-efl/efl/{eet_1.7.2.bb => eeze_1.7.3.bb}       |  4 ++--
 meta-efl/recipes-efl/efl/efreet_1.7.2.bb                       | 10 ----------
 meta-efl/recipes-efl/efl/efreet_1.7.3.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_1.7.2.bb                         | 10 ----------
 meta-efl/recipes-efl/efl/eina_1.7.3.bb                         | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_1.7.2.bb                          | 10 ----------
 meta-efl/recipes-efl/efl/eio_1.7.3.bb                          | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_1.7.2.bb                   | 10 ----------
 meta-efl/recipes-efl/efl/elementary_1.7.3.bb                   | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_1.7.2.bb                       | 10 ----------
 meta-efl/recipes-efl/efl/embryo_1.7.3.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.7.2.bb                      | 10 ----------
 meta-efl/recipes-efl/efl/emotion_1.7.3.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb                       | 10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb         | 10 ----------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb         | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.2.bb                         | 10 ----------
 meta-efl/recipes-efl/efl/evas_1.7.3.bb                         | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_1.7.2.bb                     | 10 ----------
 meta-efl/recipes-efl/efl/expedite_1.7.3.bb                     | 10 ++++++++++
 .../gnome-control-center/gnome-control-center_2.32.1.bb        |  9 ++++-----
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb                 |  6 ++++++
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb                  |  7 ++++---
 meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend       |  1 -
 meta-oe/recipes-qt/qconnman/qconnman-e_git.bb                  |  2 ++
 meta-oe/recipes-qt/qconnman/qconnman.inc                       |  2 +-
 ...qt4-embedded_4.8.3.bbappend => qt4-embedded_4.8.4.bbappend} |  0
 ...qt4-x11-free_4.8.3.bbappend => qt4-x11-free_4.8.4.bbappend} |  0
 meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb         |  6 +++++-
 .../recipes-support/strongswan/strongswan_5.0.0.bbappend       |  8 ++++++++
 .../{lighttpd_1.4.31.bbappend => lighttpd_1.4.32.bbappend}     |  2 +-
 37 files changed, 142 insertions(+), 123 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.7.2.bb => ecore_1.7.3.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eeze_1.7.2.bb => edbus_1.7.3.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edbus_1.7.2.bb => edje_1.7.3.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edje_1.7.2.bb => eet_1.7.3.bb} (41%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.2.bb => eeze_1.7.3.bb} (41%)
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.3.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
 rename meta-oe/recipes-qt/qt4/{qt4-embedded_4.8.3.bbappend => qt4-embedded_4.8.4.bbappend} (100%)
 rename meta-oe/recipes-qt/qt4/{qt4-x11-free_4.8.3.bbappend => qt4-x11-free_4.8.4.bbappend} (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
 rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.31.bbappend => lighttpd_1.4.32.bbappend} (85%)

-- 
1.8.0.2



