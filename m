Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWAE0-0004YR-AM
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 20:52:01 +0200
Received: by mail-ee0-f53.google.com with SMTP id d17so2076327eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=3qD/Ky5yX+lRYY1VsF5lakKKYbGuZC7FB4Sj/Ym7nfI=;
	b=tiUBF1FNkb6q6BnUZjXUmCmBZ77Rw57yvs4m1W2pScncWsD78nGHTLy1xAZJLl0Zu1
	dBQvsCkeJwwg5IFUmerzQQ+fKe+P8iJ2N0svbwsGtrsS9p4qRQ38QqjSrUZ19Th8sxMg
	L6xLTGyYB21HoCa9jFpVc4TQIiWohcQZuxWBQ4VOvqelmnTVgdBqy2AxjBBSV/qoGt0Y
	LHJUvep1Pcy25cSCNu5E9tlah/GESI8PrrgCbtzFZbZGuErSz9PMNq/DRdTiMN6YjgXV
	9ocmi910S3RaUunSUKqQGe/jI9Ldj/4E4LEUR+mRaDV31FUKtHxj+gJDg+nCcm8jHYyt
	ZS1w==
X-Received: by 10.15.35.71 with SMTP id f47mr46808039eev.15.1367087649887;
	Sat, 27 Apr 2013 11:34:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A212D.dip0.t-ipconnect.de.
	[91.10.33.45])
	by mx.google.com with ESMTPSA id f9sm23175879eeu.11.2013.04.27.11.34.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 11:34:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 20:33:56 +0200
Message-Id: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-gnome/meta-xfce 0/4] gdm/xfce-enhancements
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
X-List-Received-Date: Sat, 27 Apr 2013 18:52:04 -0000
X-List-Received-Date: Sat, 27 Apr 2013 18:52:04 -0000
X-List-Received-Date: Sat, 27 Apr 2013 18:52:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2a5dea2399e2be5e5d964eda7465dcaf4c2e152b:

  ttf-arphic-uming: remove whitespace from license (2013-04-22 19:00:56 +0200)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git gnome-xfce-fixes

Andreas Müller (4):
      gdm: fix postinst-code to unbreak first boot issues
      gdm: avoid displaying system users in greeter's list
      gdm: cosmetics
      xfce4-session: remove unconditional consolekit RDEPENDS and use PACKAGECONFIG

 .../recipes-gnome/gdm/gdm-2.32.2/gdm-nodocs.patch  |   12 ----
 .../gdm/{gdm-2.32.2 => gdm}/%gconf-tree.xml        |    0
 .../0001-Remove-user-switch-applet.patch           |    0
 ...nager.c-avoid-displaying-system-users-in-.patch |   34 +++++++++++
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/Default  |    0
 .../gdm/{gdm-2.32.2 => gdm}/cross-xdetection.diff  |    0
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm      |    0
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm-pam  |    0
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm.conf |    0
 .../{gdm-2.32.2 => gdm}/sysrooted-pkg-config.patch |    0
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |   60 +++++++++----------
 .../xfce4-session/xfce4-session_4.10.0.bb          |    9 ++-
 12 files changed, 68 insertions(+), 47 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm-nodocs.patch
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/%gconf-tree.xml (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/0001-Remove-user-switch-applet.patch (100%)
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/Default (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/cross-xdetection.diff (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm-pam (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm.conf (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/sysrooted-pkg-config.patch (100%)
[
-- 
1.7.4.4



