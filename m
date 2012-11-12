Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXspg-0002gK-3a
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:09:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id l10so390340eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=TS8Y9r6NyxHRp3UUwcjusPScW5SBvvtm5E/nC2syTo8=;
	b=VZwQKW/TRi1sXqudPMAlFukQlVRLEs5NFEJ29U/caymprYfVDy+wwmb1XDzXyxqrP+
	30GnINNBefqgqph1litB6Zub+eB7KSbtQKGCG89+hbHOht9B3EN+hWhq7ysFEyikCzrm
	PO19DEE1Ns7sdsXCZCRi4Omi+91iQ7G4rTUALAMCs5jOpWJtYRGEteku4cldsaYs2Z4P
	lRHWmyDhP6RaHiKi10D0Lqx85CdPRKz5nldLvXoRdWH4yEjqoba3NmRVuP1R/Sr0sgGH
	qMBFmTomp3fyp0Atp/Twq/1AYJAb+5ZxA2CAd1YctFxlcwZPnMcLTx6lZrL9gc83xCtO
	r7WA==
Received: by 10.14.209.136 with SMTP id s8mr61808175eeo.33.1352721347148;
	Mon, 12 Nov 2012 03:55:47 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f2sm15646402eep.2.2012.11.12.03.55.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 03:55:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 12:54:21 +0100
Message-Id: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 0/6] bugfix collection
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
X-List-Received-Date: Mon, 12 Nov 2012 12:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit ae2926ef202541014cde7c91a9ff75ed8b4eb390:

  freerdp: Bump SRCREV to 1.0.2 snapshot of 2012-10-30 (2012-11-02 20:00:15 +0100)

are available in the git repository at:
  git@gitorious.org:schnitzeltony-oe-meta/meta-openembedded.git bugfixes

Andreas Müller (6):
      lighttpd: move systemd appends since recipe is in oe-core
      gvfs: fix build
      gvfs-gdu-volume-monitor: fix build after oe-core's libexecdir transition
      gnome-desktop: copy omf.make from ${STAGING_DATADIR_NATIVE} instead ${STAGING_DATADIR}
      xarchiver: no RDEPENDS on unzip / busybox's unzip is good enough
      thunar: add xfce4-panel to dependencies to ensure trash-plugin (tpa) is build

 .../gnome-desktop/gnome-desktop_2.32.1.bb          |    4 ++--
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    6 ++++--
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |    3 ++-
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.31.bbappend              |    0
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |    4 ++--
 meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb      |    3 ++-
 7 files changed, 12 insertions(+), 8 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend (100%)

-- 
1.7.6.5



