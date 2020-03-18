Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C09B9609A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 09:29:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02I9T96B028776
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 02:29:19 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.487.0; Wed, 18 Mar 2020 02:28:58 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 17:28:57 +0800
Message-ID: <20200318092857.192541-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] corosync: update corosync.conf to 3.x
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
X-List-Received-Date: Wed, 18 Mar 2020 09:29:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Update corosync.conf to make it valid after corosync
upgrades to 3.x.

Reference: https://sources.debian.org/data/main/c/corosync/3.0.3-2/debian/patches/Make-the-example-config-valid.patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../corosync/corosync/corosync.conf           | 85 ++++++++++---------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync/corosync.conf b/meta-networking/recipes-extended/corosync/corosync/corosync.conf
index 6aef9de95..744a30ff5 100644
--- a/meta-networking/recipes-extended/corosync/corosync/corosync.conf
+++ b/meta-networking/recipes-extended/corosync/corosync/corosync.conf
@@ -1,58 +1,61 @@
-# Starting point for cluster with pacemaker/openais
-compatibility: none
-
-corosync {
-	 user:  root
-	 group: root
-}
-
-aisexec {
-	with Pacemaker
-	user:  root
-	group: root
-}
-
-service {
-	name: pacemaker
-	ver: 1
-}
-
+# Please read the corosync.conf.5 manual page
 totem {
 	version: 2
-	secauth: off
-	threads: 0
-	interface {
-		ringnumber: 0
-		# Cluster network address
-		bindnetaddr: 192.168.10.0
-		# Should be fine in most cases, don't forget to allow
-		# packets for this address/port in netfilter if there
-		# is restrictive policy set for cluster network
-		mcastaddr: 226.94.1.1
-		mcastport: 5405
-	}
+
+	# Set name of the cluster
+	cluster_name: testCluster
+
+	# crypto_cipher and crypto_hash: Used for mutual node authentication.
+	# If you choose to enable this, then do remember to create a shared
+	# secret with "corosync-keygen".
+	# enabling crypto_cipher, requires also enabling of crypto_hash.
+	# crypto works only with knet transport
+	crypto_cipher: none
+	crypto_hash: none
 }
 
 logging {
+	# Log the source file and line where messages are being
+	# generated. When in doubt, leave off. Potentially useful for
+	# debugging.
 	fileline: off
-	to_stderr: no
+	# Log to standard error. When in doubt, set to yes. Useful when
+	# running in the foreground (when invoking "corosync -f")
+	to_stderr: yes
+	# Log to a log file. When set to "no", the "logfile" option
+	# must not be set.
 	to_logfile: yes
-	to_syslog: yes
 	logfile: /var/log/cluster/corosync.log
+	# Log to the system log daemon. When in doubt, set to yes.
+	to_syslog: yes
+	# Log debug messages (very verbose). When in doubt, leave off.
 	debug: off
-	timestamp: on
+	# Log messages with time stamps. When in doubt, set to hires (or on)
+	#timestamp: hires
 	logger_subsys {
-		subsys: AMF
+		subsys: QUORUM
 		debug: off
 	}
 }
 
-amf {
-	mode: disabled
-}
-
 quorum {
-	# Quorum for the Pacemaker Cluster Resource Manager
+	# Enable and configure quorum subsystem (default: off)
+	# see also corosync.conf.5 and votequorum.5
 	provider: corosync_votequorum
-	expected_votes: 1
+}
+
+nodelist {
+	# Change/uncomment/add node sections to match cluster configuration
+
+	node {
+		# Hostname of the node
+		name: node1
+		# Cluster membership node identifier
+		nodeid: 1
+		# Address of first link
+		ring0_addr: 127.0.0.1
+		# When knet transport is used it's possible to define up to 8 links
+		#ring1_addr: 192.168.1.1
+	}
+	# ...
 }
-- 
2.24.1


