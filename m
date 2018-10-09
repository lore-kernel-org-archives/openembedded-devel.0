Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 329 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Oct 2018 05:00:58 UTC
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 2FCAF79830
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 05:00:57 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id D3A70220183;
	Tue,  9 Oct 2018 17:55:28 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 17:55:20 +1300
Message-Id: <20181009045520.32013-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] openldap: Reproducibility: Remove user, hostname, pwd from version string
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
X-List-Received-Date: Tue, 09 Oct 2018 05:00:58 -0000

Upstream-Status: Pending
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 .../openldap/remove-user-host-pwd-from-version.patch | 12 ++++++++++++
 meta-oe/recipes-support/openldap/openldap_2.4.46.bb  |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
new file mode 100644
index 000000000..478a680ca
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
@@ -0,0 +1,12 @@
+diff -ru openldap-2.4.46.original/build/mkversion openldap-2.4.46/build/mkversion
+--- openldap-2.4.46.original/build/mkversion	2018-03-23 04:44:27.000000000 +1300
++++ openldap-2.4.46/build/mkversion	2018-10-09 14:34:51.152684040 +1300
+@@ -50,7 +50,7 @@
+ fi
+ 
+ APPLICATION=$1
+-WHOWHERE="$USER@`uname -n`:`pwd`"
++WHOWHERE="${SOURCE_DATE_EPOCH:-$USER@`uname -n`:`pwd`}"
+ 
+ cat << __EOF__
+ /* This work is part of OpenLDAP Software <http://www.openldap.org/>.
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.46.bb b/meta-oe/recipes-support/openldap/openldap_2.4.46.bb
index 0c2550671..7fe9fb0d7 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.46.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.46.bb
@@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://slapd.service \
     file://thread_stub.patch \
     file://openldap-CVE-2015-3276.patch \
+    file://remove-user-host-pwd-from-version.patch \
 "
 
 SRC_URI[md5sum] = "829016c5a9f45c51adc50073ac6f9fd7"
-- 
2.17.1


