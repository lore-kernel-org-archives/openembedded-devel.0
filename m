Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RVg5b-0002oD-9H
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:04:27 +0100
Received: by localhost (Postfix, from userid 1000)
	id 0592F44A5FF; Wed, 30 Nov 2011 09:57:45 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:57:34 +0100
Message-Id: <cover.1322643070.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [2011.03-maintenance 0/4] pull request: rsyslog,gypsy
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
X-List-Received-Date: Wed, 30 Nov 2011 09:04:27 -0000

Hi Tom,

Please pull these 4 commits cherry-picked from oe.dev.
The first one fixes the path for additional rsyslog config files.
The other ones fix bugs in gypsy application and installation.
All of them are well tested in our own environment.

Thx,
Steffen

The following changes since commit 77a5200f2f7405368be243579c77947f4bae5f22:

  Revert "gypsy: fix packaging of DBus starter script" (2011-11-30 09:24:02 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded sledz/maintenance
  http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=sledz/maintenance

Steffen Sledz (4):
  rsyslog: change path for config includes to /etc/rsyslog.d
  gypsy: fix packaging of DBus starter script
  gypsy: move generic SRC_URI part to gypsy.inc
  gypsy: update to latest upstream version 0.8, and remove version 0.7

 recipes/gypsy/gypsy.inc     |    6 +++++-
 recipes/gypsy/gypsy_0.7.bb  |   10 ----------
 recipes/gypsy/gypsy_0.8.bb  |    6 ++++++
 recipes/rsyslog/rsyslog.inc |    4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 recipes/gypsy/gypsy_0.7.bb
 create mode 100644 recipes/gypsy/gypsy_0.8.bb

-- 
1.7.7



