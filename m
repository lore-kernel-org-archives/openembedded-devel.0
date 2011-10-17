Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwo4-0006aL-PL
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:41:20 +0200
Received: by bkat8 with SMTP id t8so84952bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=g3EekpQKZBzGSlGJBqTe4tHNx3WEwMegYq5fIOEeMCg=;
	b=hFY4K0fuVJsNvPVEKfYFJW0Y5XyU5duhSr7G9kKqcn3evnEir/fMrPaJvCTIOeB7HG
	zWyqV2ZPSIRA7jpUwjNXIw5le+Itvqjim9kkQ8fCa00T3v+I1egC58gtXxbzsJoKVyay
	5zNldwOiuPKM92xzxOMTnkmZvT5UIudlarIL0=
Received: by 10.204.153.1 with SMTP id i1mr43642bkw.8.1318894525069;
	Mon, 17 Oct 2011 16:35:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v20sm9622370faf.1.2011.10.17.16.35.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:35:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:15 +0200
Message-Id: <cover.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [meta-oe][meta-efl][meta-gnome 00/10] Small fixes
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
X-List-Received-Date: Mon, 17 Oct 2011 23:41:20 -0000

The following changes since commit 1b170fa28c9c52d4c8d87e9cbe07af1e664a96c3:

  digitemp: add 3.6.0 version (2011-10-17 16:32:18 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (10):
  syslog-ng: move conflicting file modules.conf to own packages and fix
    unpackaged files
  xf86-input-tslib: fix build with newer xserver
  e-wm-illume-dict-pl: fix licensing information
  e-tasks: fix licensing information
  ttf-droid: add LIC_FILES_CHKSUM, switch to github.com
  abiword: add LIC_FILES_CHKSUM
  abiword: add SRC_URI checksums
  abiword: fix install, newer versions doesn't allow to overwrite just
    installed files
  wv: add SRC_URI checksums and drop deprecated patch=1 param
  efm-nav, efm-path, efm-pathbar: drop from meta-efl, now are part of
    efm itself

 meta-efl/recipes-efl/e17/e-tasks_svn.bb            |    3 +-
 meta-efl/recipes-efl/e17/efm-nav_svn.bb            |   14 --
 meta-efl/recipes-efl/e17/efm-path_svn.bb           |   15 --
 meta-efl/recipes-efl/e17/efm-pathbar_svn.bb        |   15 --
 .../recipes-efl/efl/e-wm-illume-dict-pl_git.bb     |    5 +-
 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc   |    7 +-
 .../abiword/abiword-2.5/fix.double.install.patch   |   34 ++++
 .../abiword/abiword-embedded_2.5.2.bb              |    4 +-
 meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb  |    4 +-
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb            |    4 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |   14 +-
 .../xf86-input-tslib-port-ABI-12-r48.patch         |  196 ++++++++++++++++++++
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    3 +-
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   11 +
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |    2 +-
 15 files changed, 268 insertions(+), 63 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/efm-nav_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/efm-path_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/efm-pathbar_svn.bb
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword-2.5/fix.double.install.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch

-- 
1.7.7



