Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 851A073B97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2015 17:02:00 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2015 17:53:00 +0100
Message-Id: <1427129580-5968-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] vpnc: don't rdepend on kernel-module-tun
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
X-List-Received-Date: Mon, 23 Mar 2015 17:02:00 -0000

Kernel modules may be built-in, so rrecommend it instead.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 4efc412..151aaf9 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -25,7 +25,8 @@ do_install () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf"
-RDEPENDS_${PN} = "kernel-module-tun perl-module-io-file"
+RDEPENDS_${PN} = "perl-module-io-file"
+RRECOMMENDS_${PN} = "kernel-module-tun"
 
 SRC_URI = "http://www.unix-ag.uni-kl.de/~massar/vpnc/vpnc-${PV}.tar.gz \
            file://makeman.patch \
-- 
1.9.1


