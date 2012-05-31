Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa3G1-0000sm-3t
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 13:09:33 +0200
Received: by bkcjm2 with SMTP id jm2so710511bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Nqx4hu0YjGS6gbOC5WZ9XLYrHWNOO7osPyddFxEG1Jk=;
	b=mJE/1vbGbZfkN2aKGqPrAVentkI/Fqbfkj28X0l5JpQxVMt/bxcSttM2cE4M2LyHh2
	iSq9b8UA2rig99XT8P4SwH5aB+QrXiPSPz6ucte8F5uUMKet8jxVt2rO5xajxwiSSTRI
	EPYmUEwfMu4cVU2zjhAhG/odbLrvveLjB27smCOxV1k3R911Xp3C1/ZW4WaUFHS7z+Kz
	X8umP9GNJbIOXJpcGOoc6ERK6DFDXHOom9oN+0W8kk3j6Ww6E6uOhNjN/CwQ1WEcJYXF
	CfF1vwErGFDV7RMu2ChqsyZIXqm3fqsbErd3JC6fNQwW/VuDKuABD6TMggj2RJenH/xU
	hRow==
Received: by 10.205.33.136 with SMTP id so8mr10977864bkb.1.1338461953590;
	Thu, 31 May 2012 03:59:13 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ig1sm2794600bkc.4.2012.05.31.03.59.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 03:59:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 12:58:57 +0200
Message-Id: <1338461940-3040-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 1/4] systemd-systemctl-native: Add additional messages for better debugging
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
X-List-Received-Date: Thu, 31 May 2012 11:09:33 -0000
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
1.7.6.5



