Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1Mg2K8-0002BV-S9
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 22:08:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 47DA254916B;
	Tue, 25 Aug 2009 15:51:04 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08808-10; Tue, 25 Aug 2009 15:51:04 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 2E813111822;
	Tue, 25 Aug 2009 15:50:58 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id 80AE77CE23B; Tue, 25 Aug 2009 15:49:43 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 15:49:43 -0400
Message-Id: <1251229783-6077-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] net-snmp: add v5.4.2.1
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
X-List-Received-Date: Tue, 25 Aug 2009 20:09:01 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini                                 |    4 +++
 .../configure-tail.patch                           |    0
 recipes/net-snmp/net-snmp_5.4.2.1.bb               |   26 ++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 copy recipes/net-snmp/{net-snmp-5.4.1 => net-snmp-5.4.2.1}/configure-tail.patch (100%)
 create mode 100644 recipes/net-snmp/net-snmp_5.4.2.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index ba06d5d..290fd7a 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -17898,6 +17898,10 @@ sha256=0ea976722c993c87dede8eb6348e6feb059e3851bbef2de824bf18ac97cdb565
 md5=6c974df7a5a5b1579f72115e6b045bda
 sha256=0ea976722c993c87dede8eb6348e6feb059e3851bbef2de824bf18ac97cdb565
 
+[http://downloads.sourceforge.net/net-snmp/net-snmp-5.4.2.1.tar.gz]
+md5=984932520143f0c8bf7b7ce1fc9e1da1
+sha256=11a8baf167f7bfff60d2590e050991400a3a082923dbcdbf85e0e0ce46eb247c
+
 [http://download.berlios.de/net-tools/net-tools-1.60.tar.bz2]
 md5=888774accab40217dde927e21979c165
 sha256=7ae4dd6d44d6715f18e10559ffd270511b6e55a8900ca54fbebafe0ae6cf7d7b
diff --git a/recipes/net-snmp/net-snmp-5.4.1/configure-tail.patch b/recipes/net-snmp/net-snmp-5.4.2.1/configure-tail.patch
similarity index 100%
copy from recipes/net-snmp/net-snmp-5.4.1/configure-tail.patch
copy to recipes/net-snmp/net-snmp-5.4.2.1/configure-tail.patch
diff --git a/recipes/net-snmp/net-snmp_5.4.2.1.bb b/recipes/net-snmp/net-snmp_5.4.2.1.bb
new file mode 100644
index 0000000..3c51a5f
--- /dev/null
+++ b/recipes/net-snmp/net-snmp_5.4.2.1.bb
@@ -0,0 +1,26 @@
+require net-snmp.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
+        file://configure-tail.patch;patch=1 \
+        file://init \
+        file://snmpd.conf \
+        file://snmptrapd.conf"
+
+EXTRA_OECONF = "--enable-shared --disable-manuals --with-defaults \
+                --disable-embedded-perl --with-perl-modules=no"
+EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
+
+do_configure_prepend() {
+        gnu-configize -f
+        # We better change sources and re-autoconf here, but
+        # required autoconf is too new for us.
+        sed -e '/echo.*\".*\\\\.*\"/s/echo/echo -e/g' \
+            -e 's/tail -1/tail -n 1/g'                \
+            -i configure
+
+        #The tarball for v5.4.2.1 is missing config.sub
+        cp ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+}
+
+PARALLEL_MAKE = ""
+CCACHE = ""
-- 
1.6.0.2



