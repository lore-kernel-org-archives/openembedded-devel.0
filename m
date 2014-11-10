Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 9930D7209B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:16:35 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id DxGa1p00B0BVjqb01xGaf0; Mon, 10 Nov 2014 14:16:35 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:16:19 -0600
Message-Id: <cover.1415650249.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [RFC 00/10] mods to support virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 21:16:37 -0000

This series is a proposed fix for Yocto 5031, providing virtual/bluez to
select between bluez4 and bluez5.  The intent is to continue using
bluez4 as the default, but to allow distros to switch to bluez5 if the
packages they need support the new interface.

The material here depends on this RFC branch:

  git://git.yoctoproject.org/poky-contrib pabigot/wip/virtual-bluez

Please comment on the overall approach in the oe-core thread.

The following changes since commit dac2422f737c351c37a8405a76b5f0b5df9311a0:

  krb5: add initscripts-functions to RDEPENDS (2014-11-07 15:06:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib pabigot/wip/virtual-bluez
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=pabigot/wip/virtual-bluez

Peter A. Bigot (10):
  gypsy: switch to virtual/bluez
  gpsd: switch to virtual/bluez
  foxtrotgps: switch to virtual/bluez
  packagegroup-basic: switch bluetooth to virtual/bluez
  gvfs: switch to virtual/bluez
  obexd: conflict with bluez5
  gnome-bluetooth: switch to virtual/bluez
  gnokii: switch to virtual/bluez
  obex-data-server: conflict with bluez5
  openobex: switch to virtual/bluez

 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                 | 2 ++
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 5 +++--
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb                       | 2 +-
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb               | 2 +-
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb        | 1 +
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb                  | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb           | 2 +-
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb          | 2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb                       | 2 +-
 meta-oe/recipes-navigation/gypsy/gypsy.inc                         | 2 +-
 10 files changed, 13 insertions(+), 9 deletions(-)

-- 
1.8.5.5


