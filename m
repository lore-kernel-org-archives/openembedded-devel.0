Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fS1-0004Gl-Pk
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 17:56:38 +0200
Received: by fxi1 with SMTP id 1so3209477fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7PKwy0iMi62EPrRq10tlmU5BLJJ8pcnPlqV4WvujH5I=;
	b=b3W9XE9gIDlHMhzQvvK1uBJUrXfLoRmgVxDgPLZxqkGXX9c16EWd5eeONXiq+cTb45
	uH/aDtjnsV2Bi1JWyc0ALO9wxb1R/cfumKMgQS2+d2weT4yx3n24loxCZZdW7QCdPSfB
	sukTH/XcZbGAYNPgPQClnA9rl5CbYL396ClxA=
Received: by 10.223.98.146 with SMTP id q18mr1900686fan.57.1317397868684;
	Fri, 30 Sep 2011 08:51:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t19sm7185282faj.23.2011.09.30.08.51.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:51:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:50:59 +0200
Message-Id: <cover.1317397769.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-oe][PATCH 0/6] Glib related changes
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
X-List-Received-Date: Fri, 30 Sep 2011 15:56:38 -0000

We were using 2.29.3+git% from meta-oe and after upgrade to 2.30.0 I was hit
by few G_CONST_RETURN and other issues due to newer glib. Here is what I have
now to build shr images OK again, but probably there is more recipes which need
upgrade/fix to cope with glib-2.30.0.

Someone who cares about gnome should continue from this, but IMHO this is good start :).

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010447.html
to check if glib was already included in oe-core

The following changes since commit 6786f3118988e625b7ad8d7758c94e302789693f:

  tcp-wrappers: Use the recipe from oe-core (2011-09-27 17:40:02 -0700)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/glib
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/glib

Martin Jansa (6):
  glib-2.0: drop 2.29.3+git from meta-oe, there should be 2.30.0 in
    oe-core
  pango: upgrade to 1.29.4
  poppler-data: upgrade from 0.4.0 to 0.4.5
  poppler: upgrade from 0.12.3 to 0.18.0
  python-cython: upgrade to 0.15.1 because 0.13 doesn't work with
    python-2.7.2
  gdbus-binding-tool: drop from meta-oe, superseeded by glib-2.30.0
    where it's included

 meta-oe/recipes-core/glib-2.0/glib-2.0.inc         |    6 -
 ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 --
 .../0005-glib-mkenums-interpreter.patch.patch      |   25 -
 .../60_wait-longer-for-threads-to-die.patch        |   33 --
 .../glib-2.0/glib-2.0/configure-libtool.patch      |   38 --
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 -
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |   24 -
 .../recipes-core/glib-2.0/glib-2.0/no-iconv.patch  |  104 -----
 .../glib-2.0/remove.test.for.qsort_r.patch         |   54 ---
 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb      |   32 --
 meta-oe/recipes-core/glib-2.0/glib.inc             |   38 --
 .../gdbus-binding-tool/gdbus-binding-tool/COPYING  |  482 --------------------
 .../gdbus-binding-tool/gdbus-binding-tool_git.bb   |   37 --
 ...thon-cython_0.13.bb => python-cython_0.15.1.bb} |    6 +-
 .../pango/pango-1.28.3/no-tests.patch              |   10 -
 .../pango/pango-1.29.4/no-tests.patch              |   11 +
 meta-oe/recipes-graphics/pango/pango_1.28.3.bb     |    9 -
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    9 +
 ...poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} |    6 +-
 meta-oe/recipes-support/poppler/poppler_0.12.3.bb  |   10 -
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb  |   10 +
 21 files changed, 34 insertions(+), 962 deletions(-)
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0.inc
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glib.inc
 delete mode 100644 meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool/COPYING
 delete mode 100644 meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool_git.bb
 rename meta-oe/recipes-devtools/python/{python-cython_0.13.bb => python-cython_0.15.1.bb} (73%)
 delete mode 100644 meta-oe/recipes-graphics/pango/pango-1.28.3/no-tests.patch
 create mode 100644 meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
 delete mode 100644 meta-oe/recipes-graphics/pango/pango_1.28.3.bb
 create mode 100644 meta-oe/recipes-graphics/pango/pango_1.29.4.bb
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} (77%)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.12.3.bb
 create mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.0.bb

-- 
1.7.6.1



