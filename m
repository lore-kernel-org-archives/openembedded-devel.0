Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1TJOAp-00087X-Vt
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 14:35:36 +0200
Received: from fsc-480-012-88.intern.dresearch.de
	(fsc-480-012-88.internal.dresearch-fe.de [172.29.23.5])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id D1EA6E027E;
	Wed,  3 Oct 2012 12:22:35 +0000 (UTC)
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 1002)
	id 4F65272031; Wed,  3 Oct 2012 14:22:34 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 14:22:29 +0200
Message-Id: <cover.1349266768.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
Subject: [2011.03-maintenance 0/1] pull request 20121003
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
X-List-Received-Date: Wed, 03 Oct 2012 12:35:36 -0000

Hi Tom,

please pull this commit which fixes the QA issue

 ERROR: This autoconf log indicates errors, it looked at host includes.

for subversion by backporting some build related patches and recipe
modifications from oe-core.

Thx,
Steffen

The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2ad47fb:

  gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)

are available in the git repository at:

  git://github.com/sledz/oe pull-request-2
  https://github.com/sledz/oe/tree/pull-request-2

Steffen Sledz (1):
  subversion-1.6.5: fix QA issue

 recipes/subversion/files/fix-install-depends.patch |   45 ++++++++++++++++++++
 recipes/subversion/files/libtool2.patch            |   17 ++++++++
 recipes/subversion/subversion_1.6.5.bb             |   21 ++++++---
 3 files changed, 76 insertions(+), 7 deletions(-)
 create mode 100644 recipes/subversion/files/fix-install-depends.patch
 create mode 100644 recipes/subversion/files/libtool2.patch

-- 
1.7.10.4



