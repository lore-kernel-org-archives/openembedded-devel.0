Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id A3AEB6EAF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:17:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0S00BK3TSCSVA0@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Feb 2014 15:17:01 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B064C20018; Mon,
	10 Feb 2014 16:17:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2014 16:16:52 -0500
Message-id: <1392067015-16328-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 0/3] WIP: Qt5 SDK packagegroups and meta-toolchain
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
X-List-Received-Date: Mon, 10 Feb 2014 21:17:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Otavio,

As we discussed, here are my copies of target and host packagegroups and
meta-toolchain recipes to finish up the Qt5 SDK. This is a modified version of
the recipes I've tested as part of the Arago distro some time ago. I'm in the
process of rebasing them on top of your branch, but here's a baseline against
the meta-qt5/master for now.

-- 
Denys

Denys Dmytriyenko (3):
  packagegroup-qt5-toolchain-target: add Qt5 SDK target packages
  nativesdk-packagegroup-qt5-toolchain-host: add Qt5 SDK host tools
  meta-toolchain-qt5: add Qt5 SDK standalone meta recipe

 recipes-core/meta/meta-toolchain-qt5.bb            | 55 ++++++++++++++++++++++
 .../nativesdk-packagegroup-qt5-toolchain-host.bb   | 10 ++++
 .../packagegroup-qt5-toolchain-target.bb           | 27 +++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 recipes-core/meta/meta-toolchain-qt5.bb
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
 create mode 100644 recipes-core/packagegroups/packagegroup-qt5-toolchain-target.bb

-- 
1.8.3.2


