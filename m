Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SiXqg-0004Is-Ua
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 23:26:30 +0200
Received: by wgbdr1 with SMTP id dr1so2569993wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2012 14:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=xh3gmLrasx0AzSzHS4uQLvYbvkg4ApI4t6WNVT1fAKg=;
	b=DlZ8Tl1udWEL9b7eYfOUGjJ6jAqIKeMdrdvecS3zHZoj0VVn8dyI96R2tNVlstLzDK
	JDyN+bWm5//SRoKO4FDKlzL9rZrGq7GoJB0yh7A8hebPzLbi8gBbXZkMcSe3W2zBdTtc
	HAZMSNPbGLh+OC0lW2RMUoExy9J9WAaFghJRQdEzNrwD8NcXYqB6AEyAyVnrZbzICwvD
	2MDCaXimtnCDTG8VXNIDoN1tveV6Av3rgbqCjigJvF0aVSFVHkzx3MuepOeLl752ECy4
	2+DOtcXUDe8zFb4iRYAktI0CyJyB7urIaapAjaf8ulR1ss2PIW0rvLvZUvUs6DTn9vyP
	RteQ==
Received: by 10.216.70.10 with SMTP id o10mr3712633wed.51.1340486142201;
	Sat, 23 Jun 2012 14:15:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gb9sm6081620wib.8.2012.06.23.14.15.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Jun 2012 14:15:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jun 2012 23:15:31 +0200
Message-Id: <cover.1340486086.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 0/5] navit, abiword fix
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
X-List-Received-Date: Sat, 23 Jun 2012 21:26:31 -0000

The following changes since commit f3b72f9f147b27d2a9566cb417f7f84d746184df:

  meta-initramfs: append to BBPATH instead of prepend so order of bblayers.conf is respected (2012-06-21 21:22:23 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  navit: package whole ${datadir}/icons dir
  navit: bump SRCREV and add patch from debian to fix build with
    gcc-4.7.1
  abiword: fix packaging after PACKAGES reorder
  abiword: merge abiword-2.5.inc to abiword_2.8.6.bb
  abiword: reorder and simplify

 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc   |   66 -------------
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |   97 ++++++++++++++++----
 meta-oe/recipes-navigation/navit/navit.inc         |   10 +--
 .../navit/taking-address-of-temporary-array.patch  |   76 +++++++++++++++
 meta-oe/recipes-navigation/navit/navit_svn.bb      |    6 +-
 5 files changed, 161 insertions(+), 94 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
 create mode 100644 meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch

-- 
1.7.8.6



