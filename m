Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QSY4K-0006q7-PS
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jun 2011 19:21:56 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 084C4799012; Fri,  3 Jun 2011 19:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (p5B3E652D.dip.t-dialin.net [91.62.101.45])
	by gravedo.de (Postfix) with ESMTPSA id 5795B798D74;
	Fri,  3 Jun 2011 19:18:40 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jun 2011 19:18:28 +0200
Message-Id: <1307121508-12200-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <4DE90EA6.3060703@gravedo.de>
References: <4DE90EA6.3060703@gravedo.de>
Subject: [PATCH] distro-feed-configs: use ${FEED_ARCH} instead of ${PACKAGE_EXTRA_ARCHES} and bump PR
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
X-List-Received-Date: Fri, 03 Jun 2011 17:21:56 -0000

As the distro feed configs are already machine specific we don't need to include any other
target architecture than specified in ${FEED_ARCH}. Together with all and ${MACHINE_ARCH}
it's all we need to generate the feed package for the machine we build for.

This patch removes some unused code lines too and let bitbake only produce one package
named ${PN} as result. We don't need the -dbg, -dev, ... packages.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/meta/distro-feed-configs.bb |   17 +++++------------
 1 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/recipes/meta/distro-feed-configs.bb b/recipes/meta/distro-feed-configs.bb
index 2540af9..d2cc0a2 100644
--- a/recipes/meta/distro-feed-configs.bb
+++ b/recipes/meta/distro-feed-configs.bb
@@ -1,15 +1,16 @@
 DESCRIPTION = "Configuration files for online package repositories aka feeds"
-PR = "r1"
+PR = "r2"
 
 DISTRO_FEED_PREFIX ?= "remote"
 DISTRO_FEED_URI ?= "http://my-distribution.example/remote-feed/"
 
 do_compile() {
     mkdir -p ${S}/${sysconfdir}/opkg
-    for feed in all ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}; do
+    for feed in all ${FEED_ARCH} ${MACHINE_ARCH}; do
         echo "src/gz ${DISTRO_FEED_PREFIX}-${feed} ${DISTRO_FEED_URI}/${feed}" > ${S}/${sysconfdir}/opkg/${feed}-feed.conf
     done
 }
+
 do_install () {
         install -d ${D}${sysconfdir}/opkg
         install -m 0644 ${S}/${sysconfdir}/opkg/* ${D}${sysconfdir}/opkg/
@@ -17,14 +18,6 @@ do_install () {
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-#def distro_feed_configs(d):
-#    import bb
-#    parchs = bb.data.getVar( "PACKAGE_EXTRA_ARCHS", d, 1 ).split()
-#    march = bb.data.getVar( "MACHINE_ARCH", d, 1 ).split()
-#    archs = [ "all" ] + parchs + march
-#    confs = [ ( "${sysconfdir}/opkg/%s-feed.conf" % feed ) for feed in archs ]
-#    return " ".join( confs )
-#
-#CONFFILES_${PN} += '${@distro_feed_configs(d)}'
+PACKAGES = "${PN}"
 
-CONFFILES_${PN} += '${@ " ".join( [ ( "${sysconfdir}/opkg/%s-feed.conf" % feed ) for feed in "all ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}".split() ] ) }'
+CONFFILES_${PN} += '${@ " ".join( [ ( "${sysconfdir}/opkg/%s-feed.conf" % feed ) for feed in "all ${FEED_ARCH} ${MACHINE_ARCH}".split() ] ) }'
-- 
1.7.4.1



