Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1N7nPs-0005C4-6r
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 10:53:40 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 5918214028; Tue, 10 Nov 2009 10:52:19 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2009 10:35:17 +0100
Message-Id: <20091110095219.5918214028@mzh.zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/3] Add latest 3.1.2p1 (latest 3.x stable release).
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
X-List-Received-Date: Tue, 10 Nov 2009 09:53:40 -0000

---
 conf/checksums.ini           |    4 ++++
 recipes/dhcp/dhcp_3.1.2p1.bb |   11 +++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dhcp/dhcp_3.1.2p1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9e19030..6a167e1 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5178,6 +5178,10 @@ sha256=043dea4144a93b26358ed73cd8fab79be76834a719f13fbb4344a26e8288fc38
 md5=04800a111521e7442749b2ce883f962b
 sha256=21a6e0476fb880e704e0c3cfe7b2bc6a97f6b2b0654db10b38bdd317f511a03a
 
+[ftp://ftp.isc.org/isc/dhcp/dhcp-3.1-history/dhcp-3.1.2p1.tar.gz]
+md5=787b2924a1965f0d8558521b36dca73d
+sha256=e0cb405e0fef0ecebec7aaed294032a06178ff28be87498596e6069ccda4341e
+
 [http://savannah.nongnu.org/download/dhcp-fwd/dhcp-forwarder-0.6.tar.bz2]
 md5=cbe60c8c904394a8e38e12ac42c02284
 sha256=45b708fb49a9fab10d814eb1e340a0960dac91f92800b3d39ddf0245ac913e30
diff --git a/recipes/dhcp/dhcp_3.1.2p1.bb b/recipes/dhcp/dhcp_3.1.2p1.bb
new file mode 100644
index 0000000..e57fb01
--- /dev/null
+++ b/recipes/dhcp/dhcp_3.1.2p1.bb
@@ -0,0 +1,11 @@
+require dhcp3.inc
+
+SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-3.1-history/dhcp-${PV}.tar.gz \
+	   file://fixincludes.patch;patch=1 \
+	   file://dhclient-script-exit-status.dpatch;patch=1 \
+	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=1;pnum=0 \
+	   file://init-relay file://default-relay \
+	   file://init-server file://default-server \
+	   file://dhclient.conf file://dhcpd.conf"
+
+PR = "${INC_PR}"
-- 
1.6.3.1



