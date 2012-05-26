Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SYLFL-00019E-Ka
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 May 2012 19:57:53 +0200
Received: by wibhm14 with SMTP id hm14so428319wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 May 2012 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=vPzCcSop6SmLsVapyzWd44XJI76rGc/AYPjJiDm0Iug=;
	b=C5tQEi+Sne6MnB1PLy8N0rRf1rkznfNe4ooQDFUmDJuh+B2lBfiKzB4Fg9MFKSkBZ+
	XIp61BfQxcAwnMlyWfbz8lz8Iq/M5H+Qb0vwvKnnoOYXxC2Xjc9QwaOMb1s3XUYwxljh
	o9rFVP4j1ilhdham8n3wuZkCumJ3AZEQj1XPQf/uPZAx6NRwPP1sk59AvjLMAFs+OSmM
	i98xBZEvZWdtPYdQ9RpeRcIa1eb+ZHintdwUNkb5I2ypI+k/EiuyVCfb2rGzJn80mb8i
	aUJ6KAPfm7ujrpj5LL5TddDdEbu5aTUL7DeGx8TzPLXc+l/CW0WX3pVtGP7enqojCMcu
	479g==
Received: by 10.216.208.89 with SMTP id p67mr1578667weo.155.1338054453021;
	Sat, 26 May 2012 10:47:33 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3F27.dip.t-dialin.net.
	[91.10.63.39])
	by mx.google.com with ESMTPS id m1sm6672902wic.6.2012.05.26.10.47.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 26 May 2012 10:47:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 May 2012 19:51:36 +0200
Message-Id: <1338054697-9996-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe 1/2] systemd-systemctl-native: Add additional messages for better debugging
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
X-List-Received-Date: Sat, 26 May 2012 17:58:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These messages helped me to fix the breakage of networkmanager/systemd

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
index 78eb8f3..7ca77ae 100644
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r2"
+PR = "r3"
 
 inherit native
 
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index 6e7a05d..ff9e6a7 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -1,4 +1,5 @@
 #!/bin/sh
+echo "Started $0 $*"
 
 ROOT=
 
@@ -42,6 +43,7 @@ while [ $# != 0 ]; do
 done
 
 for service in $services; do
+	echo "Try to find location of $service..."
 	# find service file
 	for p in $ROOT/etc/systemd/system \
 		 $ROOT/lib/systemd/system \
@@ -55,6 +57,7 @@ for service in $services; do
 		echo "'$service' couldn't be found; exiting with error"
 		exit 1
 	fi
+	echo "Found $service in $service_file"
 
 	# create the required symbolic links
 	wanted_by=$(grep WantedBy $ROOT/$service_file \
@@ -63,6 +66,7 @@ for service in $services; do
 		        | grep '\.target$')
 
 	for r in $wanted_by; do
+		echo "WantedBy=$r found in $service"
 		if [ "$action" = "enable" ]; then
 			mkdir -p $ROOT/etc/systemd/system/$r.wants
 			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
@@ -79,6 +83,7 @@ for service in $services; do
 		   | sed 's,Also=,,g' \
 		   | tr ',' '\n')
 	for a in $also; do
+		echo "Also=$a found in $service"
 		if [ "$action" = "enable" ]; then
 			$0 --root=$ROOT enable $a
 		fi
-- 
1.7.4.4



