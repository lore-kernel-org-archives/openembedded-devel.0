Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OggsN-0007oN-3N
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 18:31:32 +0200
Received: by ywe9 with SMTP id 9so2176395ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=gXnjltDV+GcuHnNKMnASEdbVwE0Q3ONtrXGY4Fhks+Q=;
	b=ux1e0bMHuDlfRFP9BnYCPrpB/HOtxhyGNVtHFTvGRnXIdZZIQZrAueI+jDygGyyHyh
	qpPVJDHr0a7+5hfa+gjTuGBYTDfcDZ1PtOG8yV9FYU0iBxanU/krDBvGe3uuCeO8VksM
	y6PS18zPqsOUqZh39w1EmSj4ZFiC8u9keT6Ec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eC7sHPeZ/Y6+O4NXjRXHL3+rka4rCy4EjVkqSHP+L3kNMZAZ7br4A4h2NGhRYAotg6
	xMCRAWC78jgaJ9afVWy2fCD3FcFEXOuACqgel7tVIrbFCIr6zB3TUkBH+ioReLAFgat3
	B7rON+CXovd0m+F4GqtgRV7A+ENcz59NmG//0=
Received: by 10.100.121.2 with SMTP id t2mr10391700anc.41.1280939482515;
	Wed, 04 Aug 2010 09:31:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id a12sm14021725and.16.2010.08.04.09.31.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 09:31:21 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:26:50 -0500
Message-Id: <1280939211-422-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] matrix-gui-e: added chvt to init scripts
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
X-List-Received-Date: Wed, 04 Aug 2010 16:31:32 -0000

* Added chvt 4 to init scripts to allow the matrix-guiE
  application to run in its own virtual terminal.  This
  prevents the console being respawned over the running
  matrix-guiE process during times of inactivity.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-e/dm365-evm/init |    3 +++
 recipes/ti/matrix-gui-e/init           |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/ti/matrix-gui-e/dm365-evm/init b/recipes/ti/matrix-gui-e/dm365-evm/init
index cd12913..d860ad9 100755
--- a/recipes/ti/matrix-gui-e/dm365-evm/init
+++ b/recipes/ti/matrix-gui-e/dm365-evm/init
@@ -6,6 +6,9 @@ test -x "$matrixgui" || exit 0
 
 case "$1" in
   start)
+
+    chvt 4
+
     # switch to component 480p mode
     echo 480P-60 > /sys/class/davinci_display/ch0/mode
     echo COMPONENT > /sys/class/davinci_display/ch0/output
diff --git a/recipes/ti/matrix-gui-e/init b/recipes/ti/matrix-gui-e/init
index 8a1c77e..266fdca 100755
--- a/recipes/ti/matrix-gui-e/init
+++ b/recipes/ti/matrix-gui-e/init
@@ -10,6 +10,9 @@ export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
 
 case "$1" in
   start)
+
+    chvt 4
+
     if [ ! -f /etc/pointercal ] ; then
         echo -n "Calibrating touchscreen (first time only)"
         ts_calibrate
-- 
1.7.0.4



