Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv6Ny-0002CQ-Qm
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jul 2012 14:44:46 +0200
Received: by wgbds1 with SMTP id ds1so1294248wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=taI5H3ab8WMEJUrXnpgsRITycdo6IZiDNclZpUziEE0=;
	b=xjPrJkzC1go9PXC9uSG9RGjRgpa4SPRwVqPtjpN+JHDLtFrp8mL6aaQhBJFyWk0HWz
	C7qN1L9+VOSULhBRVKKzH/F7nYcpSNR8HJP44CIl0Aw+K1RHbrxspoe6Ahyz4jJRInx6
	MkeI8Y3bFSlDkHV4KXa7j0iblno78RrjGKBiU3lTRDcVf96d56f5lVchGTsV/HpC5rA3
	RvsFbfBJBMOTzP5lRmXpfxQW5R8ym2Tw+iqlDHMcRYCHaCpRoXi1iOVAlDWtAAlexdGS
	zXawjqOrxKA9ztOm94FXI6rpOc+V/n76sf7qmEFI1vcYfY6dY9L5iUpqMl/1BdZSQFid
	+MfA==
Received: by 10.180.99.196 with SMTP id es4mr29315933wib.18.1343478792456;
	Sat, 28 Jul 2012 05:33:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm4041136wib.6.2012.07.28.05.33.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 05:33:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 14:33:10 +0200
Message-Id: <cover.1343478744.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 0/5] Fixes for oe-core changes
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
X-List-Received-Date: Sat, 28 Jul 2012 12:44:46 -0000

The following changes since commit 9afc488a1b97bfc5378f139ba04a7a5297b15fdb:

  nano: add PACKAGECONFIG for 'tiny' build (2012-07-25 09:18:12 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  tcpdump: bump PR to rebuild against libpcap1 instead libpcap
  vala-dbus-binding-tool: bump SRCREV and add recipe for 0.4.0 tarball
  libwnck: use gobject-introspection-stub instead of -native which was
    removed in oe-core
  libgee: use gobject-introspection-stub instead of -native which was
    removed in oe-core
  upower: use gobject-introspection-stub instead of -native which was
    removed in oe-core

 meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb |   10 +++-------
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb |   10 ++--------
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb    |    7 +++----
 .../vala-dbus-binding-tool.inc                     |    2 +-
 .../vala-dbus-binding-tool_0.4.0.bb                |    4 ++++
 .../vala-dbus-binding-tool_git.bb                  |    7 +++++--
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb   |    2 +-
 meta-oe/recipes-support/upower/upower_0.9.14.bb    |    4 ++--
 8 files changed, 21 insertions(+), 25 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb

-- 
1.7.8.6



