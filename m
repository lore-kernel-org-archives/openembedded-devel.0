Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyVih-0003wx-8Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 00:24:15 +0200
Received: by wgbdr1 with SMTP id dr1so2816990wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xWqHORu6ed1oet06FrstzltrmAnxrOZ7OARkPnwEIFY=;
	b=qTI4R3wNr6vnWpZ6Qth80jNx84EoWjgLAQ2NULaAYy+1uusYiGpKDz9VrQq2uqN4aM
	sNmqqGIXuPZ3nr7fPMuszIv29hhFPhUziila4wmGjVbDvz7oW+vw9X6kC3OWXJuLbSp/
	3j5svb2zy7HsxmlCtXe3Edb8X7WIKcqzvD1qrSQLeqpfi6R4jVliSRFOKqxBgLOa99z7
	S8806XI/K3nUPHn3tstx7SSfcMM34SafHyeWbKW3Kqim5pTraSJTneo1GIEG3LMztch+
	UztMcJ3vHPnw4Qbjw5wbElpEmV++KZTS3sB4NH9fASmhq+PmtsA7a4HQzcvFvyIdQeI2
	sfnw==
Received: by 10.180.97.33 with SMTP id dx1mr21771725wib.18.1344291150432;
	Mon, 06 Aug 2012 15:12:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm26256414wix.5.2012.08.06.15.12.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 15:12:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 00:12:16 +0200
Message-Id: <1344291136-1444-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1344291136-1444-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120806161957.GN3267@jama.jama.net>
	<1344291136-1444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] systemd-compat-units: use systemctl mask
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
X-List-Received-Date: Mon, 06 Aug 2012 22:24:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/systemd-compat-units.bb   |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
index 2973208..aefd6a7 100644
--- a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Units to make systemd work better with existing sysvinit scripts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r16"
+PR = "r17"
 
 inherit allarch
 
@@ -38,11 +38,17 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
 pkg_postinst_${PN} () {
 cd $D${sysconfdir}/init.d
 
-echo -n "Disabling the following sysv scripts: "
+echo "Disabling the following sysv scripts: "
+
+OPTS=""
+
+if [ -n "$D" ]; then
+    OPTS="--root=$D"
+fi
 
 for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
-    if [ \( -e $i -o $i.sh \) -a ! -e $D${base_libdir}/systemd/system/$i.service ] ; then
-        echo -n "$i " ; ln -s /dev/null $D${base_libdir}/systemd/system/$i.service
+    if [ \( -e $i -o $i.sh \) -a ! -e $D${sysconfdir}/systemd/system/$i.service ] ; then
+        echo -n "$i: " ; systemctl ${OPTS} mask $i.service
     fi
 done ; echo
 }
-- 
1.7.8.6



