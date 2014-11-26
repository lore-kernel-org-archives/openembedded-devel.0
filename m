Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 10B7E72374
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 20:08:00 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id LL7z1p00Y0BVjqb01L80r1; Wed, 26 Nov 2014 13:08:01 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:07:51 -0600
Message-Id: <cover.1417031714.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [RFC v2 0/3] update meta-oe to support proposed bluez5 approach
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
X-List-Received-Date: Wed, 26 Nov 2014 20:08:04 -0000

These are the meta-oe patches corresponding to the RFC solution to
selecting bluez5 as bluetooth provider submitted at:

http://lists.openembedded.org/pipermail/openembedded-core/2014-November/099312.html

The following changes since commit 34be57e7454ffe5f591cc0d7638bf41bb4377a61:

  meta-networking: update LAYERDEPENDS (2014-11-24 14:12:02 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib pabigot/rfc-v2/bluez5
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=pabigot/rfc-v2/bluez5

Peter A. Bigot (3):
  gnokii: refine selector for bluez4 package config
  gpsd: select distro preference for bluez provider
  packagegroup-basic: select distro preference for bluez provider

 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb     | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 3 ++-
 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb             | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
1.8.5.5


