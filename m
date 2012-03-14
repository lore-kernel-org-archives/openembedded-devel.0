Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S7mbk-0002Ns-Fu
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 12:43:08 +0100
Received: by localhost (Postfix, from userid 1000)
	id EEB5D44401B; Wed, 14 Mar 2012 12:34:22 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 12:34:06 +0100
Message-Id: <cover.1331724547.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1330097955.git.sledz@dresearch-fe.de>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
Cc: Koen Kooi <koen@openembedded.org>
Subject: [2011.03-maintenance 0/7] pull request 20120314
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
X-List-Received-Date: Wed, 14 Mar 2012 11:43:08 -0000

Hi Tom,

please pull these commits cherry-picked from oe.dev.

The first one fixes a build problem with net-snmp and libnl.
The others fix various fetch problems. All are well tested in
our own environment.

This request replaces my pull request 20120224 which was rejected
by you with the wish to use shapshot.debian.org for various SRC_URIs.

Thx,
Steffen

The following changes since commit 89cb863234616620d172984ff173f1d84ce4caa9:

  ntpclient: updated to 2010_365 version (2012-01-12 08:22:32 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded sledz/pull2
  http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=sledz/pull2

Steffen Sledz (6):
  net-snmp-5.7.1: fix build error "too few arguments to function 'nl_geterror'"
  fakeroot-1.9.6: Update URI to a functioning one
  bluez4: fix checksums for bluez-4.95.tar.gz
  jakarta-libs: fixed SRC_URI for avalon-framework-api-4.3
  liblockfile-1.06: Update URI to a functioning one
  ltrace-0.5.3: Update URI to a functioning one

Vita Preskovsky (1):
  bluez4: Add version 4.95

 recipes/bluez/bluez4_4.95.bb                       |   30 +++++++++
 recipes/fakeroot/fakeroot_1.9.6.bb                 |    2 +-
 recipes/jakarta-libs/avalon-framework-api_4.3.bb   |    2 +-
 recipes/liblockfile/liblockfile_1.06.bb            |    2 +-
 recipes/ltrace/ltrace_0.5.3.bb                     |    4 +-
 .../net-snmp/net-snmp-5.7.1/net-snmp-libnl.patch   |   65 ++++++++++++++++++++
 recipes/net-snmp/net-snmp_5.7.1.bb                 |    3 +-
 7 files changed, 102 insertions(+), 6 deletions(-)
 create mode 100644 recipes/bluez/bluez4_4.95.bb
 create mode 100644 recipes/net-snmp/net-snmp-5.7.1/net-snmp-libnl.patch

-- 
1.7.7



