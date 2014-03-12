Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7E52360D71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:48:10 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so4268774eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=2tMvj/S6Ca7XOpGkdUhJJhaqMgGm5VlXw9EDuU4F1a8=;
	b=vYT3IriKZaXzWZDUEwMS8Ebz8AT4w+dRP2CGn0TUiky6OTp6Tk9fmJvDYxn5CKL2qO
	w5ZVp4JGLg4A/lmU6jrr/H5/GHUc+UM8eHhXya9t5xH+LhgjAO52nDKA3JiAaDhz7x/8
	BzGtPZK3Vutl1UN45iT9uC3g5Huj+0aperQCximVrUzuQv/34fLEPCzdQ6tFLXEcDAo9
	Ant+qDS6ZVq8NGKXyu18CcOMA7IUyWLgJwqjnLLigbqAgOQMsYSilBdeO0pazNUaR999
	ZPf6ud0N70UMcu5GBihg+kOG1qdqzqPRNPbaRJfy4tm7hf8SpMVntcV3wY/y2YKfcBpC
	p0UA==
X-Received: by 10.15.33.129 with SMTP id c1mr2735733eev.85.1394624891273;
	Wed, 12 Mar 2014 04:48:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j41sm69053994eeg.10.2014.03.12.04.48.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 04:48:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2014 12:48:18 +0100
Message-Id: <cover.1394624790.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 0/4] Small update of git recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2014 11:48:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Before rebasing git recipes for latest origin/stable (in preparation for 5.3.0 release)
here is small update for at least newer origin/release revs.

The following changes since commit fc06fb8ceb8eec4fe64463234ce6aaadd5f8a852:

  qtbase.inc: set virtual/mesa and virtual/egl as dependency in PACKAGECONFIG[kms] (2014-03-05 19:28:46 +0100)

are available in the git repository at:

  git://github.com/meta-qt5/meta-qt5 tags/5.2.1+origin/release
  https://github.com/meta-qt5/meta-qt5/tree/jansa/test

Martin Jansa (4):
  qtbase: Replace 0012-qtbase-allow-build-of-examples.patch with
    -compile-examples option
  qt5-git: bump SRCREVs to latest in 'release' branch
  qtdeclarative_git: drop
    0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
  qtbase: move 0015-Fix-linuxfb-argument-mmsize-parsing.patch to 5.2.1
    recipe

 recipes-qt/qt5/qtbase-native_git.bb                |  4 +-
 recipes-qt/qt5/qtbase.inc                          |  4 +-
 .../0012-qtbase-allow-build-of-examples.patch      | 48 ----------------------
 recipes-qt/qt5/qtbase_5.2.1.bb                     |  2 +
 recipes-qt/qt5/qtbase_git.bb                       |  4 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  4 +-
 recipes-qt/qt5/qtdeclarative.inc                   |  1 -
 recipes-qt/qt5/qtdeclarative_5.2.1.bb              |  4 ++
 recipes-qt/qt5/qtdeclarative_git.bb                |  3 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  4 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  4 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  4 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  4 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  4 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  4 +-
 recipes-qt/qt5/qtscript_git.bb                     |  4 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  4 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  3 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  4 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 -
 recipes-qt/qt5/qttools-native_git.bb               |  4 +-
 recipes-qt/qt5/qttools_git.bb                      |  4 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  4 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  4 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  4 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  4 +-
 26 files changed, 65 insertions(+), 74 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch

-- 
1.9.0


