Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SPwbC-0004qn-Qw
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 16:01:38 +0200
Received: by localhost (Postfix, from userid 1000)
	id 1050D440CEF; Thu,  3 May 2012 15:51:52 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Thu,  3 May 2012 15:51:38 +0200
Message-Id: <cover.1336052839.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [2011.03-maintenance 0/1] pull request 20120503
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
X-List-Received-Date: Thu, 03 May 2012 14:01:38 -0000

Hi Tom,

please pull this commit into 2011.03-maintenance branch.
It fixes a build problem with icedtea6-native and newer glibc versions.
The fix is well tested in our own environment.

Thx,
Steffen

The following changes since commit 21613e405cad072feef779c8e9b374a2f0984158:

  docbook-utils-native: fix syntax problem in jw.in (2012-04-04 12:06:08 +0200)

are available in the git repository at:
  git://github.com/sledz/oe pull-request-1
  https://github.com/sledz/oe/tree/pull-request-1

Steffen Sledz (1):
  icedtea6-native-1.7.10: backport S7103224

 .../glibc_name_collision.patch                     |  523 ++++++++++++++++++++
 recipes/icedtea/icedtea6-native_1.7.10.bb          |    3 +-
 2 files changed, 525 insertions(+), 1 deletions(-)
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.10/glibc_name_collision.patch

-- 
1.7.7



