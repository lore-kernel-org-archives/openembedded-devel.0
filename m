Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSdy5-0002F7-N3
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 01:12:11 +0100
Received: (qmail invoked by alias); 22 Nov 2011 00:05:39 -0000
Received: from p5B0A17D0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.208]
	by mail.gmx.net (mp055) with SMTP; 22 Nov 2011 01:05:39 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/hCRNBjqnh0abpMgDQJU2HCHkim2q85m7Dz+nEgT
	yCvK4MeyoN+Bx+
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Nov 2011 01:05:31 +0100
Message-Id: <1321920336-4905-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V3 0/5] libnl and iw updates to make networkmanager work
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
X-List-Received-Date: Tue, 22 Nov 2011 00:12:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: networkmanager bump PR
V1 -> V3: wpa-supplicant bump PR

Andreas Müller (5):
  iw: update to 3.2
  libnl: add 3.23
  networkmanager: bump PR to force rebuild with libnl 3.23
  wpa-supplicant_0.7.3.bbappend: bump PR to force rebuild against
    libnl-3
  libnl1: remove

 .../iw/iw/kill-git-version-check.patch             |   26 -------
 .../iw/{iw_0.9.20.bb => iw_3.2.bb}                 |   15 +---
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bbappend   |    3 +
 .../libnl/libnl1-1.1/build.only.static.lib.patch   |   79 --------------------
 .../libnl1-1.1/dont-link-libnl-from-sysroot.patch  |   26 -------
 .../libnl/libnl1-1.1/fix-includes.patch            |   13 ---
 .../libnl/libnl1-1.1/fix-ucred-declaration.patch   |   23 ------
 .../libnl/libnl1-1.1/local-includes.patch          |   12 ---
 .../libnl/libnl1-1.1/netlink-local-fix.patch       |   12 ---
 .../libnl/libnl1-1.1/respect-ldflags.patch         |   12 ---
 meta-oe/recipes-support/libnl/libnl1_1.1.bb        |   30 --------
 meta-oe/recipes-support/libnl/libnl_3.2.3.bb       |   46 +++++++++++
 13 files changed, 54 insertions(+), 245 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iw/iw/kill-git-version-check.patch
 rename meta-oe/recipes-connectivity/iw/{iw_0.9.20.bb => iw_3.2.bb} (51%)
 create mode 100644 meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend
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



