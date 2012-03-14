Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7uUO-0004Lv-0h
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 21:08:04 +0100
Received: by wera1 with SMTP id a1so2113842wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D5H+aUlwIJEWVS2LjmpslMn7hxahYG5X2c+YQnTXFcE=;
	b=dRg9UWpm+gN8g3rtpXrraO9Bi0oI8GKED0e9iYMGhnZtdhKPnVU0rFtMMtSEqcfjNB
	8yLCqFxTN9yirHKWRi+APxsYsdBdz+fILR1QFdunI9dcBLOj2JGtc5mbYaQx1z984o+D
	IZaa2mLDQKP/Uo8tJKK1af4eJFok4xK2HjU2mXrNkDAeCm6W/1CsNTFaDK5HC/aGAGx1
	qX1LLfq4cfiP0FCQcFq9PTKk0HsA2dI+QtpRE8niV+sSAcxN8eLDDjgfUUVx1qcgU00q
	0nxV75Qudw5/bTuIf08LIIq7F7/I9YlgkDb1iQ1VxmidqvV06M5DvIEKo5g5K9i06pFi
	yUrA==
Received: by 10.180.80.104 with SMTP id q8mr9408330wix.14.1331755158400;
	Wed, 14 Mar 2012 12:59:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm54333765wiw.6.2012.03.14.12.59.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 12:59:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 20:59:09 +0100
Message-Id: <cover.1331754944.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][meta-efl][PATCH 0/5] Midori and enlightenment upgrades
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
X-List-Received-Date: Wed, 14 Mar 2012 20:08:04 -0000

The following changes since commit 4586a3b9abd6f01592b1f4b27f8a2b6c51fb9668:

  xarchiver: add unzip to RRECOMMENDS_${PN} (2012-03-13 20:03:37 -0700)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  midori: upgrade to 0.4.4
  elementary: package new datetime_input_ctxpopup module
  e-tasks: drop local patches and use our github repo instead
  eina: fix QA warning about unpackaged dir
  e-base: bump EFL_SRCREV again to get elementary-1.0 API

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../e-tasks/0001-depend-on-eina-not-eina-0.patch   |   26 -
 ...ementary-genlist_item_insert_before-API-c.patch |   27 -
 .../e17/e-tasks/0003-adapt-to-newer-elm-API.patch  |  656 --------------------
 .../e-tasks/0004-fix-changed-callback-name.patch   |   40 --
 .../e-tasks/0005-adapt-to-even-newer-elm-API.patch |  182 ------
 .../e17/e-tasks/0006-remove-deprecated-API.patch   |  296 ---------
 .../e17/e-tasks/0007-db_sqlite-fix-warning.patch   |   35 -
 ...-warning-about-incompatible-pointer-types.patch |   79 ---
 .../e17/{e-tasks_svn.bb => e-tasks_git.bb}         |   17 +-
 meta-efl/recipes-efl/efl/eina.inc                  |    4 +
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    8 +-
 meta-oe/recipes-connectivity/midori/midori/waf     |  Bin 92569 -> 0 bytes
 .../recipes-connectivity/midori/midori_0.4.3.bb    |   13 -
 .../recipes-connectivity/midori/midori_0.4.4.bb    |    8 +
 15 files changed, 24 insertions(+), 1369 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-depend-on-eina-not-eina-0.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0002-adapt-to-elementary-genlist_item_insert_before-API-c.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0003-adapt-to-newer-elm-API.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0004-fix-changed-callback-name.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0005-adapt-to-even-newer-elm-API.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0006-remove-deprecated-API.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0007-db_sqlite-fix-warning.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0008-fix-warning-about-incompatible-pointer-types.patch
 rename meta-efl/recipes-efl/e17/{e-tasks_svn.bb => e-tasks_git.bb} (62%)
 delete mode 100755 meta-oe/recipes-connectivity/midori/midori/waf
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
 create mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.4.bb

-- 
1.7.8.5



