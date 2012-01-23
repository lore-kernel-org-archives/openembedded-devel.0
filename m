Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFmw-0006fE-52
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:06 +0100
Received: by eaal12 with SMTP id l12so265605eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UfuwZyCfb0iegyfqkQ0uU4/Fa0qUd+OBn7ALRDPLWKM=;
	b=ip3tgiJ82crvduG3osyMqbdzEt0sIJ0j+1g5cxbAbAlEIA3+Dx5JxII5REMqU30PFV
	a7ka2bQkde7lg7PYolea/v2OXMjGwqOgMonvd1BDmhAwFoRPSlyjNP4P5KH1BeRFAR5r
	0pl+JrZa3G2gVRDn3XnTf3LGxMj3TrzVHUZiE=
Received: by 10.213.17.4 with SMTP id q4mr1388033eba.44.1327308858316;
	Mon, 23 Jan 2012 00:54:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm51259679eef.7.2012.01.23.00.54.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:54:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:09 +0100
Message-Id: <cover.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 0/8] Small updates and fixes
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:06 -0000

The following changes since commit 103b4174d11233954a63a16f488b134da0b901b2:

  systemd: move kbd RECOMMENDS to vconsole-setup where they belong (2012-01-20 12:29:32 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (8):
  libxaw: bump PR to disable xmlto
  webkit-efl: upgrade to 1.7.3
  eve: bump SRCREV for compatibility with newer webkit-efl and
    deprecated elm APIs
  gtk+: add native BBCLASSEXTEND
  gtk+3: add gtk+-native dependency
  libsoup-2.4: add unstable version 2.37.2 which is needed for newer
    webkit-efl
  gpsd: add systemd support
  picocom: import from meta-smartphone/meta-shr

 meta-efl/recipes-efl/e17/eve_svn.bb                |    3 +-
 .../recipes-efl/webkit/webkit-efl/CMakeLists.txt   |  160 ++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   20 ++-
 .../recipes-support/libsoup/libsoup-2.4_2.37.2.bb  |   23 +++
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.2.bb       |    2 +-
 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend |    3 +
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb  |    2 +-
 .../recipes-navigation/gpsd/gpsd-2.96/gpsd.service |    9 +
 .../recipes-navigation/gpsd/gpsd-2.96/gpsd.socket  |    9 +
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb       |   22 +++-
 meta-oe/recipes-support/picocom/picocom_1.6.bb     |   17 ++
 11 files changed, 257 insertions(+), 13 deletions(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
 create mode 100644 meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket
 create mode 100644 meta-oe/recipes-support/picocom/picocom_1.6.bb

-- 
1.7.8.4



