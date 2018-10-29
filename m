Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 407 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Oct 2018 16:40:41 UTC
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2E1791FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:33:34 -0400
Message-Id: <20181029163334.16720-1-bradleyb@fuzziesquirrel.com>
Subject: [meta-oe][PATCH] dbus-broker: fetch submodules too
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2018 16:40:41 -0000

dbus-broker depends on a number of submodules.  Make sure to
recursively fetch those as well.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
index ac2c50063..ac0f325a4 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "dbus glib-2.0 expat"
 PV = "16+git${SRCPV}"
 SRCREV = "fc874afa0992d0c75ec25acb43d344679f0ee7d2"
 
-SRC_URI = "git://github.com/bus1/dbus-broker;protocol=git"
+SRC_URI = "gitsm://github.com/bus1/dbus-broker;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

