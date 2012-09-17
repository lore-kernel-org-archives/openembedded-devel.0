Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDZED-0000w1-77
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:11:01 +0200
Received: by wgbdq11 with SMTP id dq11so2241074wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=G20rdxWIqPrZ//2TopkTeQbquRg6wUIVXA3a06HGNMY=;
	b=MT0EUkmMpqqfAs1SxaemDwe5pLDZwfo5PrcxmR+T48yKi74vGxdtFr3njLlN7cwjA8
	T51YgO3+wncvaAtuj26PLf+SEEWpkKl19sm/kYt7BU8RPLhLRUCNXxEdLb0Gphz11L5p
	ZVStWBL4sGEP83ht3Y6HZm/e0hlvnoI6rQ4fGii+LaH7WhszUedKfbBS0JYTevU78Ke7
	YPtyJ2YQy4d0FMQDIz4Yy0ePCId7KAmKNlqlHsFojcSdUQdqOpx0Cdp4ssOvZ7EbP0kj
	acdPYiWB7BBMf9fr36I+/09OUZthTh9qN8sFsLJC+b1btpIcM3JSKFjQs0amza40x2XN
	PuRA==
Received: by 10.180.100.133 with SMTP id ey5mr15385912wib.4.1347879502922;
	Mon, 17 Sep 2012 03:58:22 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id cl8sm17277618wib.10.2012.09.17.03.58.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:58:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:58:06 +0200
Message-Id: <1347879491-2425-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkuqjiJ5wzukpMTc5hCaNNy673QLQZM5Izo+Kqac/WJNq6OKLWsz880TVdqMZ1xn2KZO6Xe
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][systemd update 1/6] systemd-systemctl-native: Add additional messages for better debugging
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
X-List-Received-Date: Mon, 17 Sep 2012 11:11:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

These messages helped me to fix the breakage of networkmanager/systemd

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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
index c4a0a3f..46e74e8 100755
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
1.7.7.6



