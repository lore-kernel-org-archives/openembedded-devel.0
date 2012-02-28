Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2NxA-0001cG-W3
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:22:57 +0100
Received: by eaae1 with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.28.133 as permitted sender) client-ip=10.213.28.133; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.28.133 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.28.133])
	by 10.213.28.133 with SMTP id m5mr5760270ebc.62.1330438469493 (num_hops
	= 1); Tue, 28 Feb 2012 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1X9KtoeJYwTjrj+WYImEOvtCHfYpwZKmWn5hCCue95o=;
	b=R9dy/TkId0N4oMClBrVfLAvay9roi0CpnYIpGI03Pj2x7nJL1QNop723Q6AHnWF7RB
	w7PsfyCoradxS5Av6Jnykbro/clfWw8FBHlIxmK9rTacwolE0gm5IXhuxyKQxP3Wnm0L
	g4U1D7sXklzktbzAB6bzXKB10Gcm6X9tIKlVU=
Received: by 10.213.28.133 with SMTP id m5mr4327927ebc.62.1330438469332;
	Tue, 28 Feb 2012 06:14:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r5sm58404375eef.6.2012.02.28.06.14.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:14:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:20 +0100
Message-Id: <cover.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][meta-efl][PATCH 00/14] PR bumps after tiff upgrade
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
X-List-Received-Date: Tue, 28 Feb 2012 14:22:57 -0000

The following changes since commit 6ef60f762e96a81996cd016a09381d5443676d1f:

  pango: use pango.inc from oe-core (2012-02-28 10:29:01 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (14):
  python-elementary: bump PR to rebuild after libtiff3->libtiff5 change
  elfe: bump PR to rebuild after libtiff3->libtiff5 change
  epdf: bump PR to rebuild after libtiff3->libtiff5 change
  ethumb: bump PR to rebuild after libtiff3->libtiff5 change
  evas: bump PR to rebuild after libtiff3->libtiff5 change
  imlib2: bump PR to rebuild after libtiff3->libtiff5 change
  libeflvala: add tiff to DEPENDS and bump PR to rebuild after
    libtiff3->libtiff5 change
  libsdl-image: bump PR to rebuild after libtiff3->libtiff5 change
  navit: bump PR to rebuild after libtiff3->libtiff5 change
  imagemagick: bump PR to rebuild after libtiff3->libtiff5 change
  lcms: bump PR to rebuild after libtiff3->libtiff5 change
  poppler: bump PR to rebuild after libtiff3->libtiff5 change
  tiff: rename bbappend to match new version from oe-core
  mplayer2: drop virtual/kernel dependency and s/ARM/arm/ in
    ARM_INSTRUCTION_SET

 .../python/python-elementary_svn.bb                |    2 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    4 ++--
 .../libsdl-image/libsdl-image_1.2.10.bb            |    2 +-
 .../{tiff_3.9.5.bbappend => tiff_4.0.1.bbappend}   |    0
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    6 +++---
 meta-oe/recipes-navigation/navit/navit_svn.bb      |    2 +-
 .../imagemagick/imagemagick_6.7.5.bb               |    2 ++
 meta-oe/recipes-support/lcms/lcms_1.17.bb          |    2 +-
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb  |    2 +-
 14 files changed, 17 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-multimedia/libtiff/{tiff_3.9.5.bbappend => tiff_4.0.1.bbappend} (100%)

-- 
1.7.8.5



