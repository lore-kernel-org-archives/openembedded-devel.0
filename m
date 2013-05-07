Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrg-0003KL-9K
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:09 +0200
Received: by mail-ea0-f181.google.com with SMTP id a15so575650eae.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=drb4CnGQXAr8lmgcyhw42CkoTzZZPzXcKjiTflSMI5Y=;
	b=e79SoA4NI9L4QLIEXXuy/nBeFT2K2fQ9SnqOhvhVtXDGoLtfSnJM08uEQlCCJ7+Voo
	tsaldjjtLegh2IehBiCuj3o6g5a7wTdEiJDR20BYh7ndm4rNjuCoW4ZH0jsBRe0YZHxm
	yIKpxBJiMRG33X6jTxx3ZkNVFrGYz19TGAFaUycRX4WCZMZFx05YVFC4ux5ta7X/Lwq1
	GYGAHfpyvHWticvD6fxkGzAiy3xHdbUQhX3T1FnHvD/QkGlInBCk5/RX7my4No10zXzf
	VScS9Lt6aBUPAkARUMLnshZzx6GFHaf/z/+0yOBGxyOFGRc7MG0GkyLDEt4YV0Fetk+v
	oQRQ==
X-Received: by 10.14.102.9 with SMTP id c9mr10016688eeg.29.1367966526924;
	Tue, 07 May 2013 15:42:06 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:38 +0200
Message-Id: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 00/15] outstanding patches with fixes
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
X-List-Received-Date: Tue, 07 May 2013 23:00:14 -0000
X-List-Received-Date: Tue, 07 May 2013 23:00:14 -0000
X-List-Received-Date: Tue, 07 May 2013 23:00:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[01-03] further glib 2.36
[04-05] reanimate gnome-terminal
[06-11] pdf-viewer
[11-15] postinst improvements

The following changes since commit 8fec906a4584f9cbc467fb0e406bb6a705848b64:

  smartmontools: import from OE classic (2013-05-07 18:59:01 +0200)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git fixes-here-and-there

Andreas Müller (15):
      libbonobo: fix build with glib 2.36
      libbonobo: remove unreferenced patch
      gnome-vfs: fix build with glib 2.36
      gnome-terminal: move out of nonworking
      gnome-terminal: update to 2.30.2
      poppler: remove unrecognized configure options
      poppler: merge include files into poppler - only poppler requires them
      poppler: update to 0.22.3
      poppler-data: update to 0.4.6 and stylize a bit
      epdfview: move to nonworking
      evince: fix/remove postinst by inheriting gsettings
      dconf: fix/remove postinst by inheriting gsettings
      proftpd: remove postinst - directory can be setup offline in do_install
      gnome-panel: let gconf.bblass take care for postinst
      rp-pppoe: move chmod form postinst to offline do_install

 .../epdfview/epdfview/browser_command.patch        |    0
 .../epdfview/epdfview/fix-format.patch             |    0
 .../epdfview/epdfview/glib-single-include.patch    |    0
 .../epdfview/epdfview/swap-colors.patch            |    0
 .../{ => nonworking}/epdfview/epdfview_0.1.8.bb    |    0
 .../0001-Remove-use-of-G_DISABLE_DEPRECATED.patch  |   47 ++++++++++++++++++++
 .../bonobo/libbonobo/configure-gthread.patch       |   11 -----
 .../recipes-gnome/bonobo/libbonobo_2.24.3.bb       |    3 +-
 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb      |   12 +----
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |   12 +----
 .../gnome-panel/gnome-panel_2.32.1.bb              |   14 +-----
 ...kefile.am-remove-DG_DISABLE_DEPRECATED-to.patch |   42 +++++++++++++++++
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |    9 +++-
 .../0001-Makefile.am-do-not-build-help.patch       |   28 ++++++++++++
 .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb   |   15 ++++++
 .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |   20 --------
 .../nonworking/gnome/gnome-terminal_2.26.3.bb      |   19 --------
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   16 ++-----
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb     |   10 +---
 ...poppler-data_0.4.5.bb => poppler-data_0.4.6.bb} |    8 ++--
 meta-oe/recipes-support/poppler/poppler-fpu.inc    |    6 ---
 meta-oe/recipes-support/poppler/poppler_0.18.4.bb  |   10 ----
 .../poppler/{poppler.inc => poppler_0.22.3.bb}     |   13 ++++-
 23 files changed, 167 insertions(+), 128 deletions(-)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/browser_command.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/fix-format.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/glib-single-include.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/swap-colors.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview_0.1.8.bb (100%)
 create mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/configure-gthread.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-terminal/0001-Makefile.am-do-not-build-help.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
 delete mode 100644 meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.5.bb => poppler-data_0.4.6.bb} (78%)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler-fpu.inc
 delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.4.bb
 rename meta-oe/recipes-support/poppler/{poppler.inc => poppler_0.22.3.bb} (65%)

-- 
1.7.4.4



