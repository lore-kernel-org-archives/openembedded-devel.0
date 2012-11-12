Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXthF-0004J1-Mg
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 14:05:01 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so507070eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 04:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=twefsVG2o5mWcqBtCD4FLTrGSzHLRfNfUkEKssXsbNw=;
	b=awc5E3hf2eVTeZEMTT61mHc3UFrID8KM2ev+/N3RQ+vOAM/WRvHlRWITt8BzpNdoxk
	i/8DPftX3UYy7rfNvAGKTEJ3rDbGYhWjIUmcRH4Huf58Wzse7bQe6FvqYoRLVEw8PPKq
	AzISkgubWFcohS7iyodQ+7GBz48qMZWyShyRcRWf3D8OgDSUQ+Dp5X6D9ZgH7ny7hAF4
	ODRn4YD7gGJkOltMHsF8JPLQG3wV4Qcpr+i2eUfahkDG5hD4sp5EjXhikzSQhuCCc8mw
	XB/gTJ1SFYpxzm1p8FGouAS0uTGo6ufgBfr/kKNLVQDfC+BaEoUj8ONOZwLz5QG6xLrU
	6vig==
Received: by 10.14.220.71 with SMTP id n47mr62672267eep.26.1352724669059;
	Mon, 12 Nov 2012 04:51:09 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id g47sm15869960eeo.6.2012.11.12.04.51.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 04:51:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 13:49:41 +0100
Message-Id: <1352724581-17063-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-systemd/meta-xfce, V2 0/5] bugfix collection - cover-letter only
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
X-List-Received-Date: Mon, 12 Nov 2012 13:05:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit ae2926ef202541014cde7c91a9ff75ed8b4eb390:

  freerdp: Bump SRCREV to 1.0.2 snapshot of 2012-10-30 (2012-11-02 20:00:15 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git bugfixes

Andreas Müller (5):
      lighttpd: move systemd appends since recipe is in oe-core
      gvfs: fix build
      gvfs-gdu-volume-monitor: fix build after oe-core's libexecdir transition
      gnome-desktop: copy omf.make from ${STAGING_DATADIR_NATIVE} instead ${STAGING_DATADIR}
      thunar: add xfce4-panel to dependencies to ensure trash-plugin (tpa) is build

 .../gnome-desktop/gnome-desktop_2.32.1.bb          |    4 ++--
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    6 ++++--
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |    3 ++-
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.31.bbappend              |    0
 meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb      |    3 ++-
 6 files changed, 10 insertions(+), 6 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend (100%)

-- 
1.7.6.5



