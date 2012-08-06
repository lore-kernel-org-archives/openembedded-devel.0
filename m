Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyViZ-0003w9-Be
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 00:24:07 +0200
Received: by wibhm2 with SMTP id hm2so1816525wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 15:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oeerD3wRceOV/GTLe4cm8gvOSCv6/ur6KmNcFNDi8Yg=;
	b=ZziahLf1SfDXONwFHEdZxVd6Jwce11qqx1apoCdX01j7qAjBMIvOPf1fjYEEEj8x4+
	wbGNPomLCVdInnAZ74a4Q6HDpd/JadNu7FWOstH2wE6vcYxtyzV2HooRnTzPIBc+u2pG
	t7cMTdWhS+XqGjRpKWOqSpibzEdeNEZGpn+/zHI/SUOdlqRHH1tw3iiUowxfeHSmblkn
	tEjOD42fQmv9c9twOSitH4vYoZldLkcvwsePhXF/AlBwxIiwNlS3hSCmPCC/rlzpJRh/
	YIYdbj5d349olUZJzzPEtYzbFFDG7jj+0zgMOGDIXF61M9sH+KYRz2XuSMuufrFw94rO
	e44A==
Received: by 10.216.138.26 with SMTP id z26mr5730483wei.57.1344291142423;
	Mon, 06 Aug 2012 15:12:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm26254740wiy.4.2012.08.06.15.12.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 15:12:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 00:12:15 +0200
Message-Id: <1344291136-1444-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120806161957.GN3267@jama.jama.net>
References: <20120806161957.GN3267@jama.jama.net>
Subject: [PATCH 1/2] systemd-systemctl-native: extend systemctl wrapper to support mask action
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
X-List-Received-Date: Mon, 06 Aug 2012 22:24:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
index 7ca77ae..5f23e98 100644
--- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r3"
+PR = "r4"
 
 inherit native
 
diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
index ff9e6a7..bdd01ef 100755
--- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
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
+		cmd="ln -s '/dev/null' '$ROOT/etc/systemd/system/$service'"
+		echo "$cmd"
+		$cmd
+		exit 0
+	fi
+
 	echo "Try to find location of $service..."
 	# find service file
 	for p in $ROOT/etc/systemd/system \
-- 
1.7.8.6



