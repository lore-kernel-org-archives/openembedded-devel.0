Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@mobil-400-586.intern.dresearch.de>)
	id 1Qdeje-0002JF-4F for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 10:42:31 +0200
X-Envelope-From: sledz@mobil-400-586.intern.dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(pd95cb174.dip0.t-ipconnect.de [217.92.177.116])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p648X2b8006567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 4 Jul 2011 10:33:02 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 50E35C39B4; Mon,  4 Jul 2011 10:31:34 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jul 2011 10:31:18 +0200
Message-Id: <1309768279-4797-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1309454880.4401.32.camel@mattotaupa>
References: <1309454880.4401.32.camel@mattotaupa>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH v2 1/2] ppp-2.4.5: own package for PPPoL2TP plugin
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
X-List-Received-Date: Mon, 04 Jul 2011 08:42:32 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/ppp/ppp_2.4.5.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb
index 2b6b6f7..883b695 100644
--- a/recipes/ppp/ppp_2.4.5.bb
+++ b/recipes/ppp/ppp_2.4.5.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Point-to-Point Protocol (PPP) daemon"
 HOMEPAGE = "http://samba.org/ppp/"
 DEPENDS = "libpcap"
 LICENSE = "BSD GPLv2"
-PR = "r1"
+PR = "r2"
 # Not well tested
 DEFAULT_PREFERENCE = "-1"
 
@@ -49,11 +49,12 @@ do_install_append () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
-PACKAGES =+ "ppp-oa ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-tools"
+PACKAGES =+ "ppp-oa ppp-l2tp ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd"
 FILES_${PN}_nylon  = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${sbindir}/tdbread"
 FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
 FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
+FILES_${PN}-l2tp     = "${libdir}/pppd/${PV}/pppol2tp.so ${libdir}/pppd/${PV}/openl2tp.so"
 FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so"
 FILES_${PN}-radius   = "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
 FILES_${PN}-winbind  = "${libdir}/pppd/${PV}/winbind.so"
@@ -61,6 +62,7 @@ FILES_${PN}-minconn  = "${libdir}/pppd/${PV}/minconn.so"
 FILES_${PN}-password = "${libdir}/pppd/${PV}/pass*.so"
 FILES_${PN}-tools    = "${sbindir}/pppstats ${sbindir}/pppdump"
 DESCRIPTION_ppp-oa       = "Plugin for PPP needed for PPP-over-ATM"
+DESCRIPTION_ppp-l2tp     = "Plugin for PPP needed for PPP-over-L2TP"
 DESCRIPTION_ppp-oe       = "Plugin for PPP needed for PPP-over-Ethernet"
 DESCRIPTION_ppp-radius   = "Plugin for PPP that are related to RADIUS"
 DESCRIPTION_ppp-winbind  = "Plugin for PPP to authenticate against Samba or Windows"
-- 
1.7.3.4



