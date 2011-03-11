Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Py0Ap-0002A2-9J
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 12:06:23 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A201FA.dip0.t-ipconnect.de [87.162.1.250]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p2BB4kO4030778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 11 Mar 2011 12:04:47 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id B1AB5296E6; Fri, 11 Mar 2011 12:04:46 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 12:04:37 +0100
Message-Id: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] net-snmp: disable libnl use
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
X-List-Received-Date: Fri, 11 Mar 2011 11:06:23 -0000

Fixes compile error

| ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_destroy'
| ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_alloc'

which occurred sometimes depending on build order (not in clean package
only builds).

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/net-snmp/net-snmp_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/net-snmp/net-snmp_svn.bb b/recipes/net-snmp/net-snmp_svn.bb
index 2a75722..c53c91f 100644
--- a/recipes/net-snmp/net-snmp_svn.bb
+++ b/recipes/net-snmp/net-snmp_svn.bb
@@ -1,7 +1,7 @@
 require net-snmp.inc
 DEPENDS += "libtool libtool-native libtool-cross"
 SRCREV = "20069"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/net-snmp"
 
@@ -10,7 +10,7 @@ SRC_URI = "svn://net-snmp.svn.sourceforge.net/svnroot/net-snmp/trunk;module=net-
         file://snmpd.conf \
         file://snmptrapd.conf"
 
-EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no GREP=/bin/grep SED=/bin/sed"
+EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no --without-nl GREP=/bin/grep SED=/bin/sed"
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 
 CCACHE = ""
-- 
1.7.1



