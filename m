Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDB077FC9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:22:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA1IMqed020791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Nov 2019 11:22:52 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 1 Nov 2019 11:22:51 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 11:22:51 -0700
Message-ID: <20191101182251.128816-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] syslog-ng: change conf files to version 3.19
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
X-List-Received-Date: Fri, 01 Nov 2019 18:22:50 -0000
Content-Type: text/plain

Also add dns_cache(no) option to eliminate initialization warning.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd  | 9 +++++++--
 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
index 9e910ca..965abf7 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
@@ -1,11 +1,16 @@
-@version: 3.15
+@version: 3.19
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
 # Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
+#
+# Move to 3.19
+#     Only change is to add dns_cache(no) to options to suppress initialization warning.
+#
+#     Joe Slater <joe.slater@windriver.com>
 
 # First, set some global options.
-options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
+options { chain_hostnames(off); flush_lines(0); use_dns(no); dns_cache(no); use_fqdn(no);
 	  owner("root"); group("adm"); perm(0640); stats_freq(0);
 	  bad_hostname("^gconfd$");
 };
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
index fb183ee..2b39b8c 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
@@ -1,11 +1,16 @@
-@version: 3.15
+@version: 3.19
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
 # Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
+#
+# Move to 3.19
+#     Only change is to add dns_cache(no) to options to suppress initialization warning.
+#
+#     Joe Slater <joe.slater@windriver.com>
 
 # First, set some global options.
-options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
+options { chain_hostnames(off); flush_lines(0); use_dns(no); dns_cache(no); use_fqdn(no);
 	  owner("root"); group("adm"); perm(0640); stats_freq(0);
 	  bad_hostname("^gconfd$");
 };
-- 
2.7.4


