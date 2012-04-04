Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFPXZ-00079O-6L
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 14:42:21 +0200
Received: by ghbz2 with SMTP id z2so65833ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=XAlc67JMHI/KhM4HUxWALXvhM1aJLUmCR3WLSNiR6Do=;
	b=tN0br/K0n7bbHumx8Rarwjs3pAAocLPfG0eD50QPZeokjG4BOfJHLbavyC9+iq/7Rv
	kWQ33XrNoBh7nDruhnJoxDUS/thPvt77Rgz+7gX55hfd83qhHlYa5EKhxv2Dah9O4Hhi
	H4gqxcHvgJsx25FbQlkvjNcxh9Jj2arc7CmEaAUkb499VsefS/Lf3gmPFBEp8ozZROBB
	W+WgAyQjK34tvXV5IyQ4nm5NCaRZRqcNt3C3nj/7xSuIwSSV/bZOlbcJ4+a8jTODlFS7
	OpnSLl3tdoUXGu8pGWy8Mwcw5XOKzkamEAi8uEsDyzXSPQNDw7YwixjpYu8jOqBYlh9K
	Uttg==
Received: by 10.101.175.37 with SMTP id c37mr4532418anp.59.1333542790409;
	Wed, 04 Apr 2012 05:33:10 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d25sm2044087yhe.4.2012.04.04.05.33.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 05:33:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2012 12:32:54 +0000
Message-Id: <cf352c8c43cd88f95c06bc2c21cddcad4ed48ac2.1333542709.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1333542709.git.otavio@ossystems.com.br>
References: <cover.1333542709.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1333542709.git.otavio@ossystems.com.br>
References: <cover.1333542709.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 3/3] systemd-systemctl-native: add support to disable services
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
X-List-Received-Date: Wed, 04 Apr 2012 12:42:21 -0000

This adds support to disable services making possible to it to be done
during rootfs generation.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   32 +++++++++++++++----
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
index dcd67ee..78eb8f3 100644
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r1"
+PR = "r2"
 
 inherit native
 
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index b86f3cd..c4a0a3f 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -3,6 +3,7 @@
 ROOT=
 
 # parse command line params
+action=
 while [ $# != 0 ]; do
 	opt="$1"
 
@@ -10,17 +11,26 @@ while [ $# != 0 ]; do
 		enable)
 			shift
 
+			action="$opt"
 			services="$1"
-			in_enable="1"
+			cmd_args="1"
+			shift
+			;;
+		disable)
+			shift
+
+			action="$opt"
+			services="$1"
+			cmd_args="1"
 			shift
 			;;
 		--root=*)
 			ROOT=${opt##--root=}
-			in_enable="0"
+			cmd_args="0"
 			shift
 			;;
 		*)
-			if [ "$in_enable" = "1" ]; then
+			if [ "$cmd_args" = "1" ]; then
 				services="$services $opt" 
 				shift
 			else
@@ -53,9 +63,15 @@ for service in $services; do
 		        | grep '\.target$')
 
 	for r in $wanted_by; do
-		mkdir -p $ROOT/etc/systemd/system/$r.wants
-		ln -s $service_file $ROOT/etc/systemd/system/$r.wants
-		echo "Enabled $service for $wanted_by."
+		if [ "$action" = "enable" ]; then
+			mkdir -p $ROOT/etc/systemd/system/$r.wants
+			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
+			echo "Enabled $service for $wanted_by."
+		else
+			rm -f $ROOT/etc/systemd/system/$r.wants/$service_file
+			rmdirs -p $ROOT/etc/systemd/system/$r.wants
+			echo "Disabled $service for $wanted_by."
+		fi
 	done
 
 	# call us for the other required scripts
@@ -63,6 +79,8 @@ for service in $services; do
 		   | sed 's,Also=,,g' \
 		   | tr ',' '\n')
 	for a in $also; do
-		$0 --root=$ROOT enable $a
+		if [ "$action" = "enable" ]; then
+			$0 --root=$ROOT enable $a
+		fi
 	done
 done
-- 
1.7.2.5



