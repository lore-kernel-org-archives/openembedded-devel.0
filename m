Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBM0k-0005Tq-Pd
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 09:07:42 +0100
Received: by wgbdr12 with SMTP id dr12so2353378wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AyPjYNWlTOROqM6Y4Xauj8H4Wmauy6GqgS6IeXH/awE=;
	b=YN0UXjO8LH0gPwfy0YFHne3UUhutC33UE+Zz9/LjWwCce/pG03fMs105GQciFtAfZX
	zR10y/40JsPRuFsaC/AhrgQGlN7508Ss9k8Y+gg+F1aM+7PeK1sG84MDfpaFYXcRKOgd
	y1yXK/uv21d5ybSvIHNt4p4pp2GbRC4noaiB9ENQl9QJ4yyzWVpt6LaFT8i5h2hX7Nio
	54c+fJBG44FzbBs8C96Ny0ze2upHWCB76hMk3S7zrR/7Dh9gjbr5AWn3KhyHqu/ip60N
	E//A2KzpzGSDMaIQ4OGwp5wovQP2akFaHX6IQzfNQxqfxg3hcCjUBzU5JScYCvi7vPlb
	atXg==
Received: by 10.180.98.8 with SMTP id ee8mr3316788wib.14.1332575925775;
	Sat, 24 Mar 2012 00:58:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm20509744wib.5.2012.03.24.00.58.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 00:58:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2012 08:58:41 +0100
Message-Id: <cover.1332575856.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-efl][PATCH 0/3] efl upgrade
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
X-List-Received-Date: Sat, 24 Mar 2012 08:07:43 -0000

Newer efl alpha was released today, so I hope that next bump will be with released tarballs.

This EFL_SRCREV is a bit older but worth upgrading as it finishes python-elementary changes
for elementary-1.0 APIs and also includes .so changes for release (so switch to tarballs should
be rather formality with bugfixes).

All elementary based apps need PR bump.

The following changes since commit 6b22bd198a87b5f113971d8fcd0e7211cd143c7d:

  systemd-serialgetty: sync with upstream (2012-03-23 07:57:19 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (3):
  e-base: bump EFL_SRCREV
  emotion: fix upgrade path from libemotion0 to libemotion1
  e-tasks: bump PR

 meta-efl/classes/e-base.bbclass         |    2 +-
 meta-efl/recipes-efl/e17/e-tasks_git.bb |    1 +
 meta-efl/recipes-efl/efl/emotion_svn.bb |    4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.8.5



