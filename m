Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RanJP-0004cs-B0
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 12:47:51 +0100
Received: by localhost (Postfix, from userid 1000)
	id 779FA440BF6; Wed, 14 Dec 2011 12:40:54 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 12:40:43 +0100
Message-Id: <cover.1323862499.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Cc: Steffen Sledz <sledz@dresearch.de>, Stefan Schmidt <stefan@buglabs.net>
Subject: [2011.03-maintenance 0/5] pull request 20111214
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
X-List-Received-Date: Wed, 14 Dec 2011 11:47:51 -0000

Hi Tom,

please pull these 5 commits cherry-picked from oe.dev.
All of them are bugfixes and tested in our own environment.

Thx,
Steffen

The following changes since commit 9826895e30baa597a5ec433cc0ebd52f5f6c8796:

  Merge remote-tracking branch 'upstream/2011.03-maintenance' into sledz/maintenance (2011-12-09 14:06:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded sledz/maintenance
  http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=sledz/maintenance

Stefan Schmidt (2):
  llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
    combinations
  llvm2.7_2.7.bb: Update patch to use c++ include style.

Steffen Sledz (3):
  live555: replace version 20110314 with 20111120
  icedtea6-native: fix problem on build hosts with linux kernel 3.x
  openjdk: fix problem on build hosts with linux kernel 3.x

 recipes/icedtea/icedtea6-native.inc      |    9 ++++-
 recipes/live555/live555_20110314.bb      |    8 ----
 recipes/live555/live555_20111120.bb      |    7 ++++
 recipes/llvm/llvm2.7/include-fixes.patch |   55 ++++++++++++++++++++++++++++++
 recipes/llvm/llvm2.7_2.7.bb              |    3 +-
 recipes/openjdk/openjdk-6-common.inc     |    9 ++++-
 6 files changed, 80 insertions(+), 11 deletions(-)
 delete mode 100644 recipes/live555/live555_20110314.bb
 create mode 100644 recipes/live555/live555_20111120.bb
 create mode 100644 recipes/llvm/llvm2.7/include-fixes.patch

-- 
1.7.7



