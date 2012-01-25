Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rpzrz-0001Qf-RA
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 11:14:23 +0100
Received: by eaal12 with SMTP id l12so995867eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SX5he/62JBZE8rCrbKmx0IO678bP6BeTf5S8FjuaCiE=;
	b=du8kvXZvQtQoEVnvZQORUFTB+g5WxLRcAaAEIYZvyjr4sZBpjyjc7ikoaI0RzGo1Ik
	PY/du8ZYsjzecRs1pIXWg6984Ik2WAivLKLKHnCVN9s+Fdc54C0J64HVoEmXIufhCA0N
	TSn9WLDYy7yGCTcKjsYUMFFMQeKO9ifT6VAbI=
Received: by 10.213.15.12 with SMTP id i12mr2984500eba.107.1327485997477;
	Wed, 25 Jan 2012 02:06:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm35820658eeh.6.2012.01.25.02.06.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:06:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:06:29 +0100
Message-Id: <cover.1327485929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][meta-efl][PATCH 0/3] EFL toolchain and mplayer2 PR bump
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
X-List-Received-Date: Wed, 25 Jan 2012 10:14:23 -0000

The following changes since commit d64c0cf970685e1066c9ce2d8cd8e3dde8c6c52b:

  xinput: remove, recipe is now in oe-core (2012-01-25 08:17:24 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (2):
  edbus: add ALLOW_EMPTY
  mplayer2: bump PR to rebuild against newer libav

Nicolas Aguirre (1):
  meta-efl: add recipes for efl sdk

 meta-efl/recipes-core/meta/meta-toolchain-efl.bb   |    6 ++++++
 meta-efl/recipes-efl/efl/edbus.inc                 |    3 +++
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/tasks/task-efl-sdk.bb         |   15 +++++++++++++++
 meta-efl/recipes-efl/tasks/task-efl-sdk.inc        |   17 +++++++++++++++++
 .../tasks/task-efl-standalone-sdk-target.bb        |   15 +++++++++++++++
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 7 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-efl/recipes-core/meta/meta-toolchain-efl.bb
 create mode 100644 meta-efl/recipes-efl/tasks/task-efl-sdk.bb
 create mode 100644 meta-efl/recipes-efl/tasks/task-efl-sdk.inc
 create mode 100644 meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb

-- 
1.7.8.4



