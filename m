Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Md2nz-0006zu-RL
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:03:26 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id DBC3A1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 13:50:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 15:45:39 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
MIME-Version: 1.0
Message-Id: <200908171545.39481.holger+oe@freyther.de>
Subject: [PATCH] Make INHERIT += "package_tar" work again
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
X-List-Received-Date: Mon, 17 Aug 2009 14:03:30 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=46rom bea58eaa611aec534ab9b53590dec6ef412ce464 Mon Sep 17 00:00:00 2001
=46rom: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Mon, 17 Aug 2009 15:41:48 +0200
Subject: [PATCH 4/4] package_tar.bbclass: Do not set IMAGE_PKGTYPE to unbre=
ak=20
parsing

image.bbclass is trying to inherit package_${IMAGE_PKGTYPE} and
this will fail because a rootfs_tar.bbclass doesn't exist. When
planning to build images one needs to inherit package_ipk,
package_rpm or package_deb in addition to INHERIT +=3D "package_tar".

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
=2D--
 classes/package_tar.bbclass |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/classes/package_tar.bbclass b/classes/package_tar.bbclass
index cb70a5f..a0eacf2 100644
=2D-- a/classes/package_tar.bbclass
+++ b/classes/package_tar.bbclass
@@ -1,7 +1,5 @@
 inherit package
=20
=2DIMAGE_PKGTYPE ?=3D "tar"
=2D
 python package_tar_fn () {
 	import os
 	from bb import data
=2D-=20
1.6.3.3



