Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rw2L7-0002GY-Nc
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 03:05:30 +0100
Received: by eaal10 with SMTP id l10so900142eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 17:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=JW3CByGczpGvQE4Y58YwKH6cEmYsECTcGZq2YZk/2pQ=;
	b=JRWt+U2wz3tDAVg5Cbb3yLD5b//IUd5RjmczSgyfizM++3Nzhxy/UF7P6E4EICytuA
	KOy4Y7OrdF8cyHJGIqJCm2KvtN5lU81Eu66Xerzs6yVaX+7ynwIztDHr2s9Sirwtd6jL
	lIVj5BWSOdiJmT31GknYZwjktDU/oW4YBWhJ0=
Received: by 10.14.50.193 with SMTP id z41mr2703690eeb.19.1328925433524;
	Fri, 10 Feb 2012 17:57:13 -0800 (PST)
Received: from localhost.localdomain (p5B0A16A6.dip.t-dialin.net.
	[91.10.22.166])
	by mx.google.com with ESMTPS id n17sm29065006eei.3.2012.02.10.17.57.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 17:57:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2012 02:59:57 +0100
Message-Id: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe 1/7] systemd-systemctl-native: add multiple services support
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
X-List-Received-Date: Sat, 11 Feb 2012 02:05:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Otavio Salvador for helping hint [1]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/037856.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../systemd/systemd-systemctl-native/systemctl     |   75 +++++++++++---------
 1 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index 54c1a18..72b9da3 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -10,50 +10,59 @@ while [ $# != 0 ]; do
 		enable)
 			shift
 
-			service="$1"
+			services="$1"
+			in_enable="1"
 			shift
 			;;
 		--root=*)
 			ROOT=${opt##--root=}
+			in_enable="0"
 			shift
 			;;
 		*)
-			echo "'$opt' is an unkown option; exiting with error"
-			exit 1
+			if [ "$in_enable" = "1" ]; then
+				services="$services $opt" 
+				shift
+			else
+				echo "'$opt' is an unkown option; exiting with error"
+				exit 1
+			fi
 			;;
 	esac
 done
 
-# find service file
-for p in $ROOT/etc/systemd/system \
-         $ROOT/lib/systemd/system \
-         $ROOT/usr/lib/systemd/system; do
-	if [ -e $p/$service ]; then
-		service_file=$p/$service
-		service_file=${service_file##$ROOT}
+for service in "$services"; do
+	# find service file
+	for p in $ROOT/etc/systemd/system \
+		 $ROOT/lib/systemd/system \
+		 $ROOT/usr/lib/systemd/system; do
+		if [ -e $p/$service ]; then
+			service_file=$p/$service
+			service_file=${service_file##$ROOT}
+		fi
+	done
+	if [ -z "$service_file" ]; then
+		echo "'$service' couldn't be found; exiting with error"
+		exit 1
 	fi
-done
-if [ -z "$service_file" ]; then
-	echo "'$service' couldn't be found; exiting with error"
-	exit 1
-fi
-
-# create the required symbolic links
-wanted_by=$(grep WantedBy $ROOT/$service_file \
-                | sed 's,WantedBy=,,g' \
-                | tr ',' '\n' \
-                | grep '\.target$')
-
-for r in $wanted_by; do
-	mkdir -p $ROOT/etc/systemd/system/$r.wants
-	ln -s $service_file $ROOT/etc/systemd/system/$r.wants
-	echo "Enabled $service for $wanted_by."
-done
 
-# call us for the other required scripts
-also=$(grep Also $ROOT/$service_file \
-           | sed 's,Also=,,g' \
-           | tr ',' '\n')
-for a in $also; do
-	$0 --root=$ROOT enable $a
+	# create the required symbolic links
+	wanted_by=$(grep WantedBy $ROOT/$service_file \
+		        | sed 's,WantedBy=,,g' \
+		        | tr ',' '\n' \
+		        | grep '\.target$')
+
+	for r in $wanted_by; do
+		mkdir -p $ROOT/etc/systemd/system/$r.wants
+		ln -s $service_file $ROOT/etc/systemd/system/$r.wants
+		echo "Enabled $service for $wanted_by."
+	done
+
+	# call us for the other required scripts
+	also=$(grep Also $ROOT/$service_file \
+		   | sed 's,Also=,,g' \
+		   | tr ',' '\n')
+	for a in $also; do
+		$0 --root=$ROOT enable $a
+	done
 done
-- 
1.7.4.4



