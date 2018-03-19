Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 40166788CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:22 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f125so9818979wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JCv+tIXn41nqMQDdnCII5ysrlIxb9SMOWijNSXAIVqo=;
	b=bh743M1gWuQPo52X+upxDpWiTB8d8MfNdAvIyCa0PBZ3B3Fm3ezs5AcRotxw6dzpeS
	l8uMTx6qcKcWGdUY7StToBQJDyMIt7/WmmM/FA6pSrsse3cDPFtR7VV12rhd26aTA+ih
	gN+WFzOU5JSBNKB3tyI1Y1ltB0jRm463o6e90zKLFxHouGVXET/S9w9MbGiGmP9Bso/q
	hUS5YubbO64D1XjcPnmO4bJuHljIwbEiUr1YYGHyABRb8CBQWnDrq29qwEjX1XBUbae8
	Fv8Rkz+m0tDHq4IM1/16lzsKKdRPTpK3sa8EzCzFYFufZq2RQC71yRsg6dgHI5JVvFzr
	Rh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JCv+tIXn41nqMQDdnCII5ysrlIxb9SMOWijNSXAIVqo=;
	b=sx+nFAag5pKFs9wpC5pnuPpmO4jmL3WPP82D++wQaZ82FCY2SqADqIV5qOlPXAJ2Op
	FfuHNL+rpXXtiU1VnaUk5h+y/2VFh0Y1w6N/0RLaNcJ/PV2wznoGrqNFSua4gP2jdHzL
	a3z1CouJiz7xM+Z+zqHaE3lP4plPRxz9LLXpLz2unAyvMdfuiT3IkjI3PuNxkhfG+r5g
	khmy9eJaJjfqTjhLndJLuZ1wTfdva8vM2Z6F3a7p05n01ascVppRcV+WsiHqkk9NqDJG
	pqW9LCe4dMyNlDpfSjR1lHGFH3CMh7wnAqM2xlY4KtJHeQ+OTwbG38Q/c2fkb4P87x5/
	Q3uw==
X-Gm-Message-State: AElRT7FZc6fCfkIgDsgld49kfYkTe1DOlxEtvlMruE6N3xaYuQX+2ePJ
	qCV+awd+pYWOwfihnrhPI6zBQQ==
X-Google-Smtp-Source: AG47ELv3ZZaEW8ph/KcOGkeMJZhvKLbQOCRwpJ7kyZwWe+S4vsNhnnSpPpKJgSdgB2fapM47vZ96Uw==
X-Received: by 10.28.109.146 with SMTP id b18mr64805wmi.95.1521491363216;
	Mon, 19 Mar 2018 13:29:23 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:28:54 +0100
Message-Id: <20180319202911.30760-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 00/17] remove gnome2 recipes for discontinued projects
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I can't stand the low-quality/split/maintainer-spam anymore: Guys one way to 
change things is start sending patches.

The following changes since commit 4598769a96980b756b3489ac71ed46a075cfabd7:

  openbox: Improve handling of openbox-session / gnome-openbox-session (2018-03-16 19:27:54 -0700)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git quality-explosion

for you to fetch changes up to e739a1b1212a75a5530eeb238abd807cb3865138:

  libidl: remove (2018-03-19 21:25:35 +0100)

----------------------------------------------------------------
Andreas Müller (17):
      libglade: remove
      evolution-data-server: remove libglade from dependencies
      libgnomecanvas: remove
      libbonoboui: remove
      glade3: remove gnome packageconfig
      libgnomeui: remove
      libbonobo: remove
      florence: remove
      gnome-vfs: remove
      gst-plugins-base: remove gnomevfs packageconfig
      vlc: remove gnome-vfs packageconfig
      libgnome: remove
      gnome-mime-data: remove
      gnome-themes: remove
      orbit2: remove
      gtk-engines: remove
      libidl: remove

 meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb                                                                   |    3 -
 meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch                |   49 --
 meta-gnome/recipes-gnome/bonobo/files/gcc5.patch                                                                    |   12 -
 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4                                                                    |   53 --
 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make                                                                  |  173 ----
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc                                                                       |   30 -
 meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch                             |   47 -
 meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch                                          |   24 -
 meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch                                            |   26 -
 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb                                                                 |    9 -
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb                                                               |   25 -
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb                                                        |    2 +-
 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch                                            |   14 -
 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb                                                  |   19 -
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch |   77 --
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch                                |   22 -
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.patch                                         |   13 -
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch                                     |   53 --
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb                                                              |   58 --
 meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch                                                          |   23 -
 meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch                                                   |   37 -
 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb                                                          |   55 --
 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch                 |   35 -
 meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch                                                |   26 -
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb                                                                |   38 -
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb                                                          |   22 -
 meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch        |   78 --
 meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch                                              |   21 -
 meta-gnome/recipes-gnome/libgnome/libgnomeui/gnome-stock-pixbufs.h                                                  | 4030 --------------------------------------------------------------------------------------
 meta-gnome/recipes-gnome/libgnome/libgnomeui/no-pixbuf-csource.patch                                                |   11 -
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb                                                              |   34 -
 meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb                                                             |   10 -
 meta-gnome/recipes-gnome/libidl/libidl.inc                                                                          |   13 -
 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb                                                                    |   13 -
 meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch                    |   34 -
 meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch              |   42 -
 meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch                                                      |   37 -
 meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch                                                          |   12 -
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb                                                                   |   42 -
 meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch                                          |   22 -
 meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch                                                  |   52 --
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb                                                              |   39 -
 meta-gnome/recipes-support/florence/florence_0.6.3.bb                                                               |   21 -
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb                                       |    1 -
 meta-multimedia/recipes-multimedia/vlc/vlc.inc                                                                      |    1 -
 meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch           |   30 -
 meta-oe/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch                                                     |  102 ---
 meta-oe/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch                                                         |  501 -----------
 meta-oe/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch                                              |   14 -
 meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb                                                                    |   35 -
 50 files changed, 1 insertion(+), 6139 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo.inc
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
 delete mode 100644 meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch
 delete mode 100644 meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch
 delete mode 100644 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/gnome-stock-pixbufs.h
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/no-pixbuf-csource.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
 delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
 delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl.inc
 delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
 delete mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch
 delete mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
 delete mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-support/florence/florence_0.6.3.bb
 delete mode 100644 meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-deprecated-GNOME_COMMON_INIT.patch
 delete mode 100644 meta-oe/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
 delete mode 100644 meta-oe/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
 delete mode 100644 meta-oe/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
 delete mode 100644 meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
-- 
2.14.3


