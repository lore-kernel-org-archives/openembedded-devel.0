Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlt-00063p-Dh
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:33 +0100
Received: by eaal10 with SMTP id l10so479837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=QF5To/vqfd1fCk3MppbqSc5OsB/k0dD4/N610OXRxBU=;
	b=X7HO3uNg2efOv3hKOUL2+7Qnl7vWc2UFOfR9uIb66wCndnIW0r0rvwpTgl+IFNSjrR
	BkhZNY8kMFaMMGTSbwzdoileJAgmdFPlkNZwc8af6GPAWXX0hBZNASMdHA292fmkn1S+
	TXdgBlWbv9ZCvuSpkFCzLTMA0nHTleqi/I5Gg=
Received: by 10.14.52.7 with SMTP id d7mr335366eec.80.1329357621185;
	Wed, 15 Feb 2012 18:00:21 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:02:55 +0100
Message-Id: <1329357796-27398-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 01/22] systemd-systemctl-native: add multiple services support
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:33 -0000
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
1.7.4.4



