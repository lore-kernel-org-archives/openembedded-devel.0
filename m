Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xde-0004lK-PX
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:10 +0100
Received: by eaal10 with SMTP id l10so506553eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.189.9 as permitted sender)
	client-ip=10.14.189.9; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.189.9 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.189.9])
	by 10.14.189.9 with SMTP id b9mr729186een.34.1329999049766 (num_hops =
	1); Thu, 23 Feb 2012 04:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=bo/rO5NmQfe6ZSH7v1D9w9zoi1LgAFBETy4gSdydauU=;
	b=xSys3+uRbR3xHPIS2ciMLP44yJjSwXiC/0GyLUXco3QPUYDF+/e/J97nhctibjJ3iv
	atJzwrFhqYJohVgVLRHTzr0QpH7fM9Uh43+cmL6UQdMINeQJdxr/yrDtjUZ5gViVN/Pr
	lpxCwSggR3bhyjJgP4co0JiQ6rZ7sSXgScvHY=
Received: by 10.14.189.9 with SMTP id b9mr580285een.34.1329999049671;
	Thu, 23 Feb 2012 04:10:49 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:32 +0100
Message-Id: <1329999054-23112-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 01/23] systemd-systemctl-native: add multiple services support
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Otavio Salvador for helping hint [1]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/037856.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
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
1.7.6.4



