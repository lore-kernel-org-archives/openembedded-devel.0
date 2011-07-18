Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QisqB-0002LK-5y
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 20:46:51 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6IIXkMf018455
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 13:33:46 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2011 11:33:40 -0700
Message-Id: <cover.1311013624.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH 0/2] Misc updates
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
X-List-Received-Date: Mon, 18 Jul 2011 18:46:51 -0000

Hey all,

Here's a short 'misc' series with a few changes.  First, take oe.dev's
mercurial-native and update to the current version.  We don't yet have any
hg:// URIs but this lets us be ready for when we do.  Second, one of the
patches guile needs was in the wrong directory to be used/found, so move
it.

The following changes since commit 7254205d68c9321d7a7073a74a77f46c17a98b27:
  Khem Raj (1):
        systemd: Replace use of %m in printf formats

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib trini/misc
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=trini/misc

Tom Rini (2):
  guile: Move 'configure-fix.patch' to guile-1.8.7 dir
  mercurial-native: Add 1.9 version

 .../mercurial/mercurial-native_1.9.bb              |   24 ++++++++++++++++++++
 .../configure-fix.patch                            |    0
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
 rename meta-oe/recipes-support/guile/{guile-native-1.8.7 => guile-1.8.7}/configure-fix.patch (100%)



