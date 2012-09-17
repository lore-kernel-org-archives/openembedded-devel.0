Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDZEE-0000w8-Nf
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:11:02 +0200
Received: by wibhm2 with SMTP id hm2so4051111wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=eYBWLPpvv6PiqhyZeflkPLYo5EEMMWXW8V/BJejPxmg=;
	b=dB/sCj3bFXDms9zsRTu4wx9oBdDSCoHt27cfgp4151LANPEHKmhZlgUbmPrvsZuMtz
	a9Zzu91wFmSAtVgy+UouQOFWiSS37OsR8k4VW1bxM34NOXAc1nBufReNt6aCJS7x2+tU
	XOcVYuQWvGuX1uqVuGVtbegqFdmk/uODnT71j+DramVLKzSs6O8PkbGNDvjk3sKWi1B4
	wClk4tLtD1rHyAkTg22dh037RnC+FPcGUipFhp6EYmHXLUUVL+mTY83Gkpv/0dIpm8p6
	DCgYl+ntNwPUyRge6oT2qrMsaddAkTlZvJ8C5zCWgL/rcBAbrPKgn15Ehy8dCMtHZmcv
	Q59w==
Received: by 10.216.236.163 with SMTP id w35mr5958715weq.13.1347879504403;
	Mon, 17 Sep 2012 03:58:24 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id cl8sm17277618wib.10.2012.09.17.03.58.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:58:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:58:07 +0200
Message-Id: <1347879491-2425-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkHQZu3LTo4/JkKga0SMtTKJ3mLGHUik3MhWlgtHdVwt9PXXeSPrGStvdGdeBBPE2NyjZOC
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][systemd update 2/6] systemd-systemctl-native: extend systemctl wrapper to support mask action
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
X-List-Received-Date: Mon, 17 Sep 2012 11:11:02 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
index 7ca77ae..5f23e98 100644
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r3"
+PR = "r4"
 
 inherit native
 
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index 46e74e8..f74adf6 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -25,6 +25,14 @@ while [ $# != 0 ]; do
 			cmd_args="1"
 			shift
 			;;
+		mask)
+			shift
+
+			action="$opt"
+			services="$1"
+			cmd_args="1"
+			shift
+			;;
 		--root=*)
 			ROOT=${opt##--root=}
 			cmd_args="0"
@@ -43,6 +51,16 @@ while [ $# != 0 ]; do
 done
 
 for service in $services; do
+	if [ "$action" = "mask" ]; then
+		if [ ! -d $ROOT/etc/systemd/system/ ]; then
+			mkdir -p $ROOT/etc/systemd/system/
+		fi
+		cmd="ln -s /dev/null $ROOT/etc/systemd/system/$service"
+		echo "$cmd"
+		$cmd
+		exit 0
+	fi
+
 	echo "Try to find location of $service..."
 	# find service file
 	for p in $ROOT/etc/systemd/system \
-- 
1.7.7.6



