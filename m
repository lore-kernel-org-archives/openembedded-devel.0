Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHLx-0007c4-9k
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:53:49 +0100
Received: by eaao13 with SMTP id o13so522504eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0tjEZb3zcxAf/p3v4TD/nigKP7+OvyRFSZroQBDBZHA=;
	b=mppSAUcS7lrg6Zmj7AOz26e3I3lrAni7091w8szDY2FWG3uUa9hmOuQ1rLpUTi27Lm
	v1GF18RHHwTVj4Jz4CcptWuF9D1xx3DfJ0auAQulQ9Y+wa+mPDd7egp5XnzI8Qn4q6Yw
	KZVwoJf4vwlsgUlabrpzPpuVvQlIOeyfnCuXk=
Received: by 10.213.22.145 with SMTP id n17mr1828978ebb.84.1326361578544;
	Thu, 12 Jan 2012 01:46:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm17443319eeb.4.2012.01.12.01.46.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:46:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:05 +0100
Message-Id: <cover.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Norman Schleicher <NormanSchleicher@gmx.de>
Subject: [meta-oe][meta-efl][PATCH 0/7] EFL upgrade and small fixes
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
X-List-Received-Date: Thu, 12 Jan 2012 09:53:49 -0000

The following changes since commit a3d91317a3242cc570f213458dcc9e71519e81c5:

  kexec-tools_2.0.2.bbappend: remove, packages are now split in oe-core (2012-01-11 09:28:26 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (6):
  e-base: bump EFL_SRCREV a bit more
  edje: add eina to DEPENDS, it depends on eina since r36623
  emotion: update LIC_FILES_CHKSUM, COPYING file was cleaned to match
    rest of EFL
  elementary: package examples to PN-tests
  edje: fix packaging of multisense module.so
  libav, libvpx, mplayer2: drop work around for gcc-4.6 ICE, no need to
    pass -fno-tree-vectorize now

Norman Schleicher (1):
  ca-certificates: upgrade to 20111211, old version not available
    anymore

 meta-efl/classes/e-base.bbclass                    |    2 +-
 meta-efl/recipes-efl/efl/edje.inc                  |    8 ++++----
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    1 +
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    2 +-
 meta-oe/recipes-multimedia/libav/libav.inc         |    4 ++--
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    4 ++--
 meta-oe/recipes-multimedia/webm/libvpx.inc         |   15 ++-------------
 ...tes_20111025.bb => ca-certificates_20111211.bb} |    4 ++--
 8 files changed, 15 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-support/ca-certificates/{ca-certificates_20111025.bb => ca-certificates_20111211.bb} (89%)

-- 
1.7.8.3



