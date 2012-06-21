Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shclq-0000Ks-Hi
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 10:29:42 +0200
Received: by werg55 with SMTP id g55so210783wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=6D3HoXMe59VBY+SFw8vubSz0uJC4abIimvzyOlhB3EE=;
	b=rw502aZJT7hWI7gprf865dAVgjB4CzJ68gg4xnj/O58qT5IVoBJpNSn17dBcYGaszf
	8jW+5BGWN78Z4Bzo/Oin36J+gqP4o+D/oOCzxP9xDyZFZfQicO8dOAIvaKfyYkZog7/g
	9+QPkf4Crz5KpFfNERdTL28yH1nWCsnJJIKUsvdtPIMPTTRgeMeSNIkiBO2ZPAYnvgKC
	x6+HbW8wI0YeLT2OBgBduYWE/CpWoylvLSNIXvP+1tlD5sNx69fRbbJfjWee3ZQo7x8T
	dI7gTuWM8qqaFQCM2t5/EZfPPQdgmlYzmGXuhSWJ+iuThs8GezlIKQVn4DIdNjTLwKik
	Dd0w==
Received: by 10.216.19.195 with SMTP id n45mr13727223wen.69.1340266736930;
	Thu, 21 Jun 2012 01:18:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j4sm44538307wiz.1.2012.06.21.01.18.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 01:18:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 10:18:44 +0200
Message-Id: <cover.1340266416.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-efl][PATCH 0/5] efl upgrade, small fixes
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
X-List-Received-Date: Thu, 21 Jun 2012 08:29:42 -0000

The following changes since commit 7c5eded4c2223036ecd43b1eaaa72432d737fbc5:

  linux-kexecboot: remove all, now we use linux-yocto-tiny-kexecboot (2012-06-20 13:37:32 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (1):
  gpsd: override gpsd.service to use GPS_DEVICES from /etc/default/gpsd

Martin Jansa (3):
  edje: explicitly enable libsndfile for target recipe
  meta-efl: upgrade recipes for new EFL bugfix release cycle 1.2.1
  libjpeg-turbo: add LEAD_SONAME to fix upgrade to 8d

Simon Busch (1):
  vala: update to 0.16.0 and restructure some stuff into vala.inc

 .../efl/{ecore_1.2.0.bb => ecore_1.2.1.bb}         |    4 ++--
 meta-efl/recipes-efl/efl/edje.inc                  |    7 ++++++-
 .../efl/{eio_1.0.0.bb => edje_1.2.1.bb}            |    4 ++--
 .../efl/{edje_1.2.0.bb => eet_1.6.1.bb}            |    4 ++--
 .../efl/{eet_1.6.0.bb => eina_1.2.1.bb}            |    4 ++--
 .../efl/{eina_1.2.0.bb => eio_1.0.1.bb}            |    4 ++--
 meta-efl/recipes-efl/efl/elementary_1.0.0.bb       |   10 ----------
 meta-efl/recipes-efl/efl/elementary_1.0.1.bb       |   10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.0.0.bb          |   10 ----------
 meta-efl/recipes-efl/efl/emotion_1.0.1.bb          |   10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb           |   10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb           |   10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.2.0.bb             |   10 ----------
 meta-efl/recipes-efl/efl/evas_1.2.1.bb             |   10 ++++++++++
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb     |    3 +++
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch |    0
 meta-oe/recipes-devtools/vala/vala.inc             |   15 +++++----------
 meta-oe/recipes-devtools/vala/vala_0.14.2.bb       |   14 --------------
 meta-oe/recipes-devtools/vala/vala_0.16.0.bb       |    8 ++++++++
 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service  |   10 ++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    5 +++--
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    5 +++--
 22 files changed, 88 insertions(+), 79 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.2.0.bb => ecore_1.2.1.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eio_1.0.0.bb => edje_1.2.1.bb} (40%)
 rename meta-efl/recipes-efl/efl/{edje_1.2.0.bb => eet_1.6.1.bb} (40%)
 rename meta-efl/recipes-efl/efl/{eet_1.6.0.bb => eina_1.2.1.bb} (40%)
 rename meta-efl/recipes-efl/efl/{eina_1.2.0.bb => eio_1.0.1.bb} (40%)
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.2.1.bb
 rename meta-oe/recipes-devtools/vala/{vala-0.14.2 => vala-0.16.0}/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.14.2.bb
 create mode 100644 meta-oe/recipes-devtools/vala/vala_0.16.0.bb
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service

-- 
1.7.8.6



