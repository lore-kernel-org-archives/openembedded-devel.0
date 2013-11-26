Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mail.openembedded.org (Postfix) with ESMTP id 62E996DD0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 01:48:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWU00EGTL0GXB60@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	25 Nov 2013 19:48:32 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C36BF2001F; Mon,
	25 Nov 2013 20:48:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Nov 2013 20:47:56 -0500
Message-id: <1385430478-31824-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 0/2] Add nativesdk tools for Qt5 SDK
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2013 01:48:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

This patchset adds nativesdk versions of qtbase(-tools) and qttools to be
used by Qt5 SDK.

I also have corresponding packagegroup and meta-toolchain recipes for packaging
up the Qt5 SDK, which I can submit later, once I have them cleaned up.

This has been validated and tested inside the Arago Project distro for a few
weeks using generated Qt5 SDK to cross-compile example applications either on
the command line or in QtCreator.

Denys Dmytriyenko (2):
  nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK
    tools
  nativesdk-qttools: add nativesdk version of qttools necessary for SDK
    tools

 recipes-qt/qt5/nativesdk-qt5.inc                   |  12 ++
 recipes-qt/qt5/nativesdk-qtbase.inc                | 193 +++++++++++++++++++++
 ...ump-path-length-from-256-to-512-character.patch |  29 ++++
 ...reserve-built-qmake-and-swap-with-native-.patch |  29 ++++
 recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb           |   7 +
 recipes-qt/qt5/nativesdk-qttools.inc               |  32 ++++
 recipes-qt/qt5/nativesdk-qttools_5.1.1.bb          |  12 ++
 7 files changed, 314 insertions(+)
 create mode 100644 recipes-qt/qt5/nativesdk-qt5.inc
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase.inc
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qttools.inc
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.1.1.bb

-- 
1.8.3.2


