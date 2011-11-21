Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSa2Z-0007Im-IZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 21:00:32 +0100
Received: (qmail invoked by alias); 21 Nov 2011 19:54:01 -0000
Received: from p5B0A17D0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.208]
	by mail.gmx.net (mp070) with SMTP; 21 Nov 2011 20:54:01 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19W8ksqzF5W2vBXtV+zGXATi9lelYt8oTaNQOpAVW
	X0ZLVICwyV7A0p
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2011 20:53:55 +0100
Message-Id: <1321905239-3527-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V2 0/4] libnl and iw updates to make networkmanager work
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
X-List-Received-Date: Mon, 21 Nov 2011 20:00:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: networkmanager bump PR

Note: It might be required to rebuild wpa-supplicant coming from oe-core.

Andreas Müller (4):
  iw: update to 3.2
  libnl: add 3.23
  networkmanager: bump PR to force rebuild with libnl 3.23
  libnl1: remove

 .../iw/iw/kill-git-version-check.patch             |   26 -------
 .../iw/{iw_0.9.20.bb => iw_3.2.bb}                 |   15 +---
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 .../libnl/libnl1-1.1/build.only.static.lib.patch   |   79 --------------------
 .../libnl1-1.1/dont-link-libnl-from-sysroot.patch  |   26 -------
 .../libnl/libnl1-1.1/fix-includes.patch            |   13 ---
 .../libnl/libnl1-1.1/fix-ucred-declaration.patch   |   23 ------
 .../libnl/libnl1-1.1/local-includes.patch          |   12 ---
 .../libnl/libnl1-1.1/netlink-local-fix.patch       |   12 ---
 .../libnl/libnl1-1.1/respect-ldflags.patch         |   12 ---
 meta-oe/recipes-support/libnl/libnl1_1.1.bb        |   30 --------
 meta-oe/recipes-support/libnl/libnl_3.2.3.bb       |   46 +++++++++++
 12 files changed, 51 insertions(+), 245 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iw/iw/kill-git-version-check.patch
 rename meta-oe/recipes-connectivity/iw/{iw_0.9.20.bb => iw_3.2.bb} (51%)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/build.only.static.lib.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/fix-includes.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/fix-ucred-declaration.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/local-includes.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/netlink-local-fix.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1-1.1/respect-ldflags.patch
 delete mode 100644 meta-oe/recipes-support/libnl/libnl1_1.1.bb
 create mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.3.bb

-- 
1.7.4.4



