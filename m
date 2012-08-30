Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T710J-00056H-EU
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 11:25:35 +0200
Received: by bkcik5 with SMTP id ik5so696521bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=eIBxRDvusC0QYIAgeiFeaCS6Z4C9I48ah1Wrg9d4dwU=;
	b=uGFuTiSzADOfcSLwobVa6Fu+SpLPQ5u9puORV7UfVm3zEU4+ALItfaMrfsAEb5/LhD
	r5WdP0gAwuZFMVbj2rtCKUe0anRCWs0m123qOJKhI4WnOhVR2g47MAlqB0ETTAvsvcIV
	sKmrhrjY78+vGwAbpK5UW8A7DzyNFncrcn8CvHZVuVCaBAEIixcWZKqgBwBEjqLv0ZYa
	6rXPUyuUUXrSTTOzwy3PXchaVKKQRs8Tfvl97GLAHeQwJWBgeMunwvYS5wb7JtPk3vEQ
	mPPsVq5UvR9B0//iqLtp/eQi/yATznAmDz/YWJUVN8PyVlEu1ZgyYME1FmVPyisU+X+q
	LhOw==
Received: by 10.205.129.17 with SMTP id hg17mr2379182bkc.88.1346318000506;
	Thu, 30 Aug 2012 02:13:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm618995bkw.15.2012.08.30.02.13.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 02:13:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 11:13:29 +0200
Message-Id: <cover.1346317656.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <]>
References: <]>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/5] Small fixes
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
X-List-Received-Date: Thu, 30 Aug 2012 09:25:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Small fixes:
* pixman to build emacs
* systemd-systemctl-native to be able to have WantedBy=xserver-nodm.service
* gpsd: to remove MACHINE var dependency from gpsd bbappend we had (changes sstate 
  checksum for gpsd and all apps depending on it)
* meta-gnome: gail as only virtual/gail provider is removed in oe-core already

The following changes since commit cc5eda871fcb68fcd36d578b3fe4b52df2dac568:

  gcc: Delete gcc intermediate recipes (2012-08-28 17:21:06 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Andreas Müller (1):
  pixman: fix qemu workaround

Denis 'GNUtoo' Carikli (1):
  meta-systemd: systemd-systemctl-native: Also add support for
    WantedBy=*.service

Martin Jansa (2):
  gpsd: add gpsd-machine-conf to RRECOMMENDS
  gpsd-machine-conf: add empty recipe for BSP layers to bbappend it

Ross Burton (1):
  meta-gnome: replace virtual/gail dependency with gtk+

 .../recipes-gnome/gnome/libgnomecanvas_2.20.0.bb   |  2 +-
 .../libgnome/libgnomecanvas_2.26.0.bb              |  2 +-
 meta-oe/conf/layer.conf                            |  1 +
 ...lated-workarounds-in-cpu-features-detecti.patch | 63 +++++++++++-----------
 .../xorg-lib/pixman_0.27.2.bbappend                |  2 +
 .../gpsd/gpsd-machine-conf_1.0.bb                  |  7 +++
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        |  4 +-
 .../systemd/systemd-systemctl-native.bb            |  2 +-
 .../systemd/systemd-systemctl-native/systemctl     |  2 +-
 9 files changed, 47 insertions(+), 38 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb

-- 
1.7.12



