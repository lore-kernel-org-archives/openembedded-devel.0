Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbAHM-0005Qg-Q4
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 13:19:16 +0100
Received: by eekb15 with SMTP id b15so1714926eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 04:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pVFYpdppEvZnLZ1rbBEsEo/2xnDxsxcII+2lRuLILjM=;
	b=ROBfRcx2HekvtYNOncBFogfLgFaB5XDtbBN4bTOHdWTIm/Jt6kzznIqKPqTYwcc7+2
	FLDABuxbs9INKkQZTIEMChmXc+CqW6IYjXYI95Kzwx5EJhUcbq0aQBVYzcc9dYw1JfYx
	7DYtoFXlduywxVSYvcgE9Big8z20OwXl2HPQ8=
Received: by 10.213.20.217 with SMTP id g25mr398059ebb.82.1323951136206;
	Thu, 15 Dec 2011 04:12:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm23449795eef.7.2011.12.15.04.12.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 04:12:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:12:06 +0100
Message-Id: <cover.1323951062.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH][meta-oe][meta-efl 0/6] Small fixes
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
X-List-Received-Date: Thu, 15 Dec 2011 12:19:16 -0000

The following changes since commit 6f36625d072054737e0aa797fb791c35d999addc:

  florence: clean up recipe (2011-12-15 09:42:59 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (1):
  epdfview: disable cups

Martin Jansa (4):
  xf86-input-void: drop archive prefix from checksums
  mplayer2: drop FULL_OPTIMIZATION_armv7a
  pixman,libav,libvpx,fftwf: bump PR after arm OVERRIDES changes in
    oe-core
  libvpx: disable tree-vectorize

Richard Purdie (1):
  samba: Force python disabled for now to avoid host contamination

 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb         |    4 ++++
 meta-oe/recipes-connectivity/samba/samba_3.5.6.bb  |    3 +++
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    4 ++--
 .../xorg-lib/pixman_0.24.0.bbappend                |    2 +-
 meta-oe/recipes-multimedia/libav/libav.inc         |    2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    3 +--
 meta-oe/recipes-multimedia/webm/libvpx.inc         |   15 +++++++++++++--
 meta-oe/recipes-support/fftw/fftwf_3.2.2.bb        |    2 +-
 8 files changed, 26 insertions(+), 9 deletions(-)

-- 
1.7.8



