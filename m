Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TK4UR-000811-CW
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 11:46:39 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so893613wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=SjiMG+9gVf/DFCoAUJw7ebW6A/AXlvLkwEaFGFuKQsM=;
	b=YeRNH3tJKYIFzQdna4dy6/5rH3onfoeaLjTu2eCjgdLdLawQxooNHjcZmyi0zFnyMv
	FRm0JgFqDxsrz2oOOvP6EP/Ge87GUn24kZsKTtZhRwpOV5DycXU9K4x3IvNv2QaHPSIj
	X2QkPBF3wLzF/FON23hO78u4fG0JTlRbNBpBj/zYaLYPUVHYK54ZIDwRCq51yCHb9zZu
	QPb0VWeKqO7Rp9f6wnp6L3aOrQwCRsQqZtUnVzbG2kqq5y5It7sTnCBmqKEAN90OeD3d
	zJxbAEaurVbdbADS6/u4nGQnAD6WWMlNnuDmQUtz3QZlM/w+HgCY61azwl/OtgsF9swf
	MgTg==
Received: by 10.180.75.67 with SMTP id a3mr2111574wiw.1.1349429617406;
	Fri, 05 Oct 2012 02:33:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j8sm1425214wiy.9.2012.10.05.02.33.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 02:33:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 11:33:35 +0200
Message-Id: <cover.1349429575.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH 0/4] small fixes again
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
X-List-Received-Date: Fri, 05 Oct 2012 09:46:39 -0000

The following changes since commit 68f05443333afa527e3b24e4caae6115dfb6b6b6:

  opencv: bump PR due libav update (2012-10-05 11:27:25 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (4):
  srctree: remove this bbclass
  python-pyqt: don't fail when do_configure is executed twice in the
    same WORKDIR
  gpsd: use chrpath-replacement-native now
  imagemagick: add fftw to DEPENDS

 meta-oe/classes/srctree.bbclass                    | 123 ---------------------
 .../recipes-devtools/python/python-pyqt_4.9.5.bb   |   2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        |   6 +-
 .../imagemagick/imagemagick_6.7.5.bb               |   4 +-
 4 files changed, 7 insertions(+), 128 deletions(-)
 delete mode 100644 meta-oe/classes/srctree.bbclass

-- 
1.7.12



