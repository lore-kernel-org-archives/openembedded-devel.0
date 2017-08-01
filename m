Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id C9E4B78200
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 23:36:43 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id y129so13842941pgy.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 16:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=infvQMIauK9sWQfjEAAxTe2q5kyx6OMXtkFpH8cOKC4=;
	b=Hsr4ZnsHQk0iUgi6/b7YY6WXtLFPZdETqIrddyHvyjwuzTUFfdSrWC4EA0MCM/qJrI
	SFbSRPq7Uf1XRk405AY9dgzx+7VtT2WLvJUxDOjTvSCWiKjUuwIey6IDsB6kTDMQCGNS
	p8mNClh/cCV9tQaHaFbFMknVMrw4XrnemI8JZCz2A7FmThY8ewD//FMMRTUjPwhB9jWC
	YOPevv33fwiEzlAUY7kTs0SU63+OK+Tr9CZh8Pg8NjCMJLlw/lyrH+Y/OAUd4c9wjuAc
	TP7Pc5FrkVULnSUj24mBbSI9Y4Qz4rRLGNYtsQlP00oz7kKQuPKqec1QGs82IMLVV60w
	GGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=infvQMIauK9sWQfjEAAxTe2q5kyx6OMXtkFpH8cOKC4=;
	b=FmFm9mu/ZwKIZOktZDBbUWM5gjKjPquSW0V/wWGbAaDcEGjIrR0Cp0Zz3+gbQWyXj3
	n+xz5qx5culBRQYxEjdLDBQklUvvftglhpLtPB4BY9MJQ41946ymQ2Il3pMf4WYQTezq
	xnVLLyMFp8fiJt21KDsW4lBmSCrOYW5t3i4tawwowllgeuXJ2u+DrJkcuJu6o9X/n8Fb
	sr0QRFCgDDc4g1tyP+ueNNQCkLDjIie/mQo6YKy97XmGgjFxpI6v4vTjWbZpC3U6c7lc
	tg+PMrb8LKa0aWgcSylAP6Kjk2zy7+yIev9n8VW7wg2tVqZG7tGwXmL9df/w7seLcQ7D
	Ym7g==
X-Gm-Message-State: AIVw113AQX0L8vp5xDeI/qpRVHP3E/BPBK+HXLZurRx+YRfa1IjbO2c2
	jhHbUeMRNNQ/GA==
X-Received: by 10.84.134.36 with SMTP id 33mr23914518plg.412.1501630604910;
	Tue, 01 Aug 2017 16:36:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	l27sm56645384pfi.182.2017.08.01.16.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 16:36:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 16:36:22 -0700
Message-Id: <cover.1501630307.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/19] Morty-next: pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Aug 2017 23:36:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please concider the follow for Morty.

The following changes since commit a44baf37d8bec492f00c08a3eb8b6a295ee80260:

  libdnet: update SRC_URI (2017-02-24 19:33:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=akuster/morty-next

Alejandro Mery (4):
  gitver: fix try/except syntax for python3 support
  gitver: extend class to use EXTERNALSRC if set
  gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
  gitver: skip packages instead of panic()ing if ${GITVER} fails to
    expand

Andreas Müller (1):
  lmsensors: fix fetch and unblacklist

Armin Kuster (4):
  python-sqlalchemy: fix SRC_URI
  lm_sensors: update SRC_URI
  exfat-utils: update SRC_URI
  libdnet: Update SRC_URI to fix checksum errors

Denys Dmytriyenko (1):
  devmem2: use different filename to avoid checksum conflicts

Derek Straka (1):
  apache2: always use the archive.apache.org to ensure older releases
    are always available

Joe Slater (1):
  chrony: fix build failure for arma9

Khem Raj (1):
  alsa-equal: Update SRC_URI to something valid

Martin Jansa (5):
  mailcap: use pagure.org instead of retired fedorahosted.org
  libqb: use github.com instead of retired fedorahosted.org
  libqb: inherit autotools-brokensep
  ttf-liberation-sans-narrow: use pagure.org instead of retired
    fedorahosted.org
  hwdata: use github instead of fedorahosted.org

Nicolas Ferre (1):
  devmem2: Change source URL to regain access to it

 .../recipes-utils/exfat-utils/exfat-utils_1.2.3.bb |  5 +-
 .../alsa-equal/alsa-equal_0.6.bb                   |  4 +-
 .../recipes-connectivity/libdnet/libdnet_1.12.bb   |  2 +-
 .../recipes-support/chrony/chrony/arm_eabi.patch   | 57 ++++++++++++++++++++++
 .../recipes-support/chrony/chrony_2.4.bb           |  5 +-
 meta-oe/classes/gitver.bbclass                     | 49 +++++++++++--------
 meta-oe/recipes-extended/libqb/libqb_0.17.2.bb     | 15 +++---
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb |  2 +-
 meta-oe/recipes-support/devmem2/devmem2.bb         | 12 +++--
 .../hwdata/{hwdata_0.291.bb => hwdata_git.bb}      | 10 ++--
 .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |  8 +--
 meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb  | 10 ++--
 .../python/python-sqlalchemy_0.7.9.bb              |  5 +-
 .../recipes-httpd/apache2/apache2-native_2.4.23.bb |  2 +-
 .../recipes-httpd/apache2/apache2_2.4.23.bb        |  2 +-
 15 files changed, 133 insertions(+), 55 deletions(-)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
 rename meta-oe/recipes-support/hwdata/{hwdata_0.291.bb => hwdata_git.bb} (57%)

-- 
2.7.4


