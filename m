Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StaGA-0004CI-KM
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 10:14:27 +0200
Received: by bkcik5 with SMTP id ik5so4724362bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=dVb3Nun8bfHW0euvFpOlpyrbVUGXbVYpeqiBfmtcmds=;
	b=ZGLd6b4oOByQ9nz/U3B+vQJuxZM3D3jWDE8VwAPYqZ6FIawb87wmLaklPOWI6ufr4F
	XV9PZ9ChWeiZqBuZpMoyhz9FQucEBz5V4DlQSVtXV7s7R8LOHVkZwsUgT0SQC9OlMRHd
	riXq4SVP3obxl/eXfyFySjHxHOncRpsxEm0JlCfzAZ2s1MlVfMqCvFEPLsf6LqqnH8lQ
	G3CHkImnpEsboBV1cnQeKs0rRy5ypG0cdOUEJODotjBVlJjj5z9g3BkeCcmB7bYC4ojp
	5LhQJhRWgKSrKf7DAENdYz4rOrsGVz60pGdO11m1PgeQAYwzv8cXWl/8cqyeXXDVL/X0
	ERIQ==
Received: by 10.205.129.10 with SMTP id hg10mr9625172bkc.78.1343116978648;
	Tue, 24 Jul 2012 01:02:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm9653808bkc.5.2012.07.24.01.02.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 01:02:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:02:53 +0200
Message-Id: <cover.1343116924.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 0/5] Fixes for oe-core changes
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
X-List-Received-Date: Tue, 24 Jul 2012 08:14:27 -0000

The following changes since commit 8f0de34919eb56f0e1e8565d024729cd8d7264a5:

  cramfs_cvs.bb: fix compile step so it can be rerun without failing (2012-07-23 12:47:11 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  gpsd: inherit pythonnative
  webkit-efl: inherit pythonnative
  orbit2: cleanup thanks to new gtk-doc.bbclass
  libbonoboui: cleanup thanks to new gtk-doc.bbclass
  libgpewidget: cleanup thanks to new gtk-doc.bbclass

 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |    4 +-
 .../recipes-gnome/bonobo/libbonoboui_2.24.3.bb     |    8 +-
 .../recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.m4 |   53 ------
 .../orbit2/orbit2-2.14.17/gtk-doc.make             |  173 --------------------
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb  |   19 +--
 .../libgpewidget/libgpewidget_0.117.bb             |    6 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    4 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    4 +-
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |    4 +-
 9 files changed, 20 insertions(+), 255 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.m4
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.make

-- 
1.7.8.6



