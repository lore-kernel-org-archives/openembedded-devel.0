Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SCVJh-0004qN-DJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 14:16:01 +0200
Received: by localhost (Postfix, from userid 1000)
	id 3E4194439D8; Tue, 27 Mar 2012 14:07:00 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 14:06:47 +0200
Message-Id: <cover.1332849864.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Cc: Ulf Samuelsson <ulf.samuelsson@telia.com>,
	Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [2011.03-maintenance 0/3] pull request 20120327
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
X-List-Received-Date: Tue, 27 Mar 2012 12:16:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tom,

please pull these commits cherry-picked from oe.dev.
The fix some python build problems.
All are well tested in our own environment.

Thx,
Steffen

The following changes since commit ec639a6b04449ef8e064e7bf35660ab31c3e2e=
ee:

  libmatthew-0.7.1: SRC_URI updated (2012-03-24 07:16:26 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded sledz/pull3
  http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dsledz/pull3

Paul Menzel (1):
  python-scons_1.3.0: add `python-native` to `DEPENDS_virtclass-native`

Simon Busch (1):
  python-2.6.6: backport pkgconfig support from version 2.7.1 and bump PR

Ulf Samuelsson (1):
  python-2.6.6: Fix python-2.6.6 build failure on linux-3.x

 .../python/python-2.6.6/07-linux3-regen-fix.patch  |   18 ++++
 .../python/python-2.6.6/pkgconfig-support.patch    |   94 ++++++++++++++=
++++++
 recipes/python/python-scons_1.3.0.bb               |    1 +
 recipes/python/python_2.6.6.bb                     |    4 +-
 4 files changed, 116 insertions(+), 1 deletions(-)
 create mode 100644 recipes/python/python-2.6.6/07-linux3-regen-fix.patch
 create mode 100644 recipes/python/python-2.6.6/pkgconfig-support.patch

--=20
1.7.7



