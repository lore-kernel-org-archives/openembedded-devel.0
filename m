Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tr6V3-0008RJ-6H
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:36:07 +0100
Received: by mail-ea0-f173.google.com with SMTP id i13so6602742eaa.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=GRbyOI2yLsTPgYr1YAOAFUUBBwo+8yxrMzq0Unlv3mc=;
	b=NeViHrodLfb2/Q+vQzXWgjjKo8sEar6AcchPixfFQUNr9xzRyT8jT6ZkJnkv47gmry
	m115VcjboZZ3XyMpJaSmAJj7ITTNxKZiFKSzxPTYkyqLVA7Inz/Hy5CtWMR7GbfBiwbx
	YRciVwx6seSlRk2Ctn0BC7Ot/qZnpQQXTYAE8I47eQRCcGA+i/AqdJRBL3qNp8EzpHgE
	i15u6e7+rLrb8twK3KqyAC7EhuiDRhEarPgff54srplcAVm5+unVEh0eGpVku4qry3El
	3BBpxWyWZA4zbWmUbRyt6NlG+2b5Oo9I9tI7843LFk7sfO9CFTdoLDZP1gkwPnlFTh0j
	x/Kg==
X-Received: by 10.14.204.198 with SMTP id h46mr143486967eeo.1.1357302044197;
	Fri, 04 Jan 2013 04:20:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm110312885eea.3.2013.01.04.04.20.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 04:20:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 13:20:30 +0100
Message-Id: <cover.1357301108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH 0/6] fixes for world build
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
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000

The following changes since commit f026e96295da101bb715858bc8705de7e4a33992:

  xinput-calibrator: remove hardcoded path from xinput_calibrator.desktop (2012-12-10 20:43:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/for-danny2

Marcin Juszkiewicz (6):
  python-phoneutils: drop due to lack of libphone-utils
  fbreader: move to meta-gpe due to libgpewidget dependency
  devilspie2: move to meta-gnome (libwnck is there)
  mplayer2: move lame into ENTERPRISE_DISTRO check
  midori: move to meta-gnome due to libnotify
  packagegroup-cli-tools: remove mdbus2, mterm2, mkdump, mioctl

 .../recipes-connectivity/midori/midori_0.4.6.bb           |  0
 .../recipes-gnome}/devilspie/devilspie2_0.24.bb           |  0
 .../recipes-gnome}/devilspie/files/default.lua            |  0
 .../recipes-gnome}/devilspie/files/devilspie2.desktop     |  0
 .../fbreader/fbreader-0.12.10/Makefile.patch              |  0
 .../recipes-support/fbreader/fbreader-0.12.10/gcc45.patch |  0
 .../recipes-support/fbreader/fbreader_0.12.10.bb          |  0
 .../recipes-support/fbreader/fbreader_git.bb              |  0
 ...installation-of-the-icons-when-RESOLUTION-is-set.patch |  0
 .../recipes-core/packagegroups/packagegroup-cli-tools.bb  |  6 +-----
 meta-oe/recipes-devtools/python/python-phoneutils_git.bb  | 15 ---------------
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb        |  2 +-
 12 files changed, 2 insertions(+), 21 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-connectivity/midori/midori_0.4.6.bb (100%)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/devilspie2_0.24.bb (100%)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/files/default.lua (100%)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/files/devilspie2.desktop (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_0.12.10.bb (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_git.bb (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/python/python-phoneutils_git.bb

-- 
1.8.0.2



