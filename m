Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIhLe-0008Ks-6j
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:51:54 +0200
Received: by wgbdq11 with SMTP id dq11so3361160wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2012 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=YnhPgdK1y4C1WjjwdLn3J91AuLgK3zjpCh9aXGQMzVU=;
	b=EGh7twAzeDrLG2s+iNfuVk/ZlRtN/erxGFsgM7pB4zMnbqCKGoUd1th1cQUqh3lKmn
	5KhGh7rqPI4YMQ6/+WSp7bI0fhb/5OG1oou+Re4t4PgFK0V8kkrWc5nyEGxt2jkOBq6p
	dDMYu27aJFC84NzMM8TxvZ0jen5kpW3+XCzm7FwunonBbjuqH8LvFjjgWfbW/raVUsni
	u1CF3y/heAfT1BmiMv9j+ntIunjX053NMqSx3UwoGoL/FhNYPP9e/y2V5lgRwF7tqE9w
	x1F+kn6JaNXM7g2DEwYRAjYeb5nhEJ4MsgW6dJlMypafvVP8Fa/KGDjT2pO5X9laViFh
	FNiw==
Received: by 10.216.207.93 with SMTP id m71mr7280182weo.201.1349102337342;
	Mon, 01 Oct 2012 07:38:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm6358205wib.10.2012.10.01.07.38.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 07:38:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:38:44 +0200
Message-Id: <cover.1349102278.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH 0/6] smaller fixes
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
X-List-Received-Date: Mon, 01 Oct 2012 14:51:54 -0000

The following changes since commit 7bfff4b1d6b0067ddabf2474320e3e78795b2b4f:

  uhd,fuse: Fix misplaced quotations (2012-09-28 22:50:42 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (6):
  re2c: import from oe-classic
  azy: add LIC_FILES_CHKSUM
  azy: fix do_configure
  elmdentica: add LIC_FILES_CHKSUM
  foxtrotgps: rename configure.in only if it still exists
  portaudio: update SRC_URI

 meta-efl/recipes-efl/e17/elmdentica_svn.bb                |  2 ++
 meta-efl/recipes-efl/efl/azy_svn.bb                       |  9 ++++++---
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb |  6 +++++-
 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb    |  2 +-
 meta-oe/recipes-support/re2c/re2c_0.13.5.bb               | 14 ++++++++++++++
 5 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/re2c/re2c_0.13.5.bb

-- 
1.7.12



