Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id BCD8C78E3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 01:20:10 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 32E391C0036;
	Fri, 26 Oct 2018 14:20:09 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 14:19:50 +1300
Message-Id: <20181026011950.24658-1-douglas.royds@taitradio.com>
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
X-List-Received-Date: Fri, 26 Oct 2018 01:20:11 -0000

This updated patch also sets the date and time strings to the SOURCE_DATE_EPOCH.
The WHOWHERE string will now be set to simply "openldap"
in the case that a SOURCE_DATE_EPOCH is set.

Upstream-Status: Submitted [https://www.openldap.org/its/index.cgi/Incoming?id=8928]
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 .../remove-user-host-pwd-from-version.patch   | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
index 478a680ca..4eb389797 100644
--- a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
+++ b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
@@ -1,12 +1,29 @@
-diff -ru openldap-2.4.46.original/build/mkversion openldap-2.4.46/build/mkversion
---- openldap-2.4.46.original/build/mkversion	2018-03-23 04:44:27.000000000 +1300
-+++ openldap-2.4.46/build/mkversion	2018-10-09 14:34:51.152684040 +1300
-@@ -50,7 +50,7 @@
+diff -ru openldap-2.4.46.orig/build/mkversion openldap-2.4.46/build/mkversion
+--- openldap-2.4.46.orig/build/mkversion	2018-10-25 18:46:10.383750480 +1300
++++ openldap-2.4.46/build/mkversion	2018-10-25 18:46:33.156232586 +1300
+@@ -50,7 +50,15 @@
  fi
  
  APPLICATION=$1
 -WHOWHERE="$USER@`uname -n`:`pwd`"
-+WHOWHERE="${SOURCE_DATE_EPOCH:-$USER@`uname -n`:`pwd`}"
++if [ -n "${SOURCE_DATE_EPOCH}" ]; then
++   WHOWHERE="openldap"
++   DATE=$(date -d@$SOURCE_DATE_EPOCH +' %b %d %Y ')
++   TIME=$(date -d@$SOURCE_DATE_EPOCH +' %H:%M:%S ')
++else
++   WHOWHERE="$USER@$(uname -n):$(pwd)"
++   DATE='" __DATE__ "'
++   TIME='" __TIME__ "'
++fi
  
  cat << __EOF__
  /* This work is part of OpenLDAP Software <http://www.openldap.org/>.
+@@ -72,7 +80,7 @@
+ "COPYING RESTRICTIONS APPLY\n";
+ 
+ $static $const char $SYMBOL[] =
+-"@(#) \$$PACKAGE: $APPLICATION $VERSION (" __DATE__ " " __TIME__ ") \$\n"
++"@(#) \$$PACKAGE: $APPLICATION $VERSION ($DATE $TIME) \$\n"
+ "\t$WHOWHERE\n";
+ 
+ __EOF__
-- 
2.17.1


