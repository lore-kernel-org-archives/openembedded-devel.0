Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P7ptT-0003lb-S5
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 15:36:53 +0200
Received: by yxt3 with SMTP id 3so397714yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=R2Bu+cG7mNP2M0llj3yldF66ykd3XQPfxUtiLG04FHc=;
	b=owyuWi3ssNLWq8X8eBr7e/xbGf+djj318TivKJDJ/6rWt2boovsUJVB0ijvcXT9asV
	7vIMaeuU+KbsZLuO8cMdPvHLhOaX/Ig9yB6OG4IwUkNO80CQaxzPQ8sYlyUrOuayDQ+r
	nN4lteTu90ybVzUd1YfoBxjxh7O6pjfOlQ/dk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=O1XNWxanWLvXSOH+87uBCfmtF2Xkw1fKTvjFIEmjeu2+KMR2z16Wy5A+sOOez3krs7
	K7g0/RpVY8qUXa0hp6bth8jp4Ti7DXZfd2NB3Vo81YCEzpkjgZk6CFzUTIKXcmzmm6gz
	6lw6OgAcaxZYyWMVS6vRlnCM3VAvq0XdjUZgo=
Received: by 10.150.63.14 with SMTP id l14mr6695713yba.74.1287408970962;
	Mon, 18 Oct 2010 06:36:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i64sm7616165yha.10.2010.10.18.06.36.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Oct 2010 06:36:10 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 08:36:04 -0500
Message-Id: <1287408964-18448-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287408964-18448-1-git-send-email-Chase.Maupin@ti.com>
References: <1287408964-18448-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/2] matrix-gui: remove unneeded PV lines
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
X-List-Received-Date: Mon, 18 Oct 2010 13:36:53 -0000

* Remove setting PV since the default value is correct.
* This is one less thing to change when adding new versions.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-gui-common_1.1.bb |    1 -
 recipes/ti/matrix-gui-common_1.2.bb |    1 -
 recipes/ti/matrix-gui-e_1.1.bb      |    1 -
 recipes/ti/matrix-gui-e_1.2.bb      |    1 -
 recipes/ti/matrix-gui_1.1.bb        |    1 -
 recipes/ti/matrix-gui_1.2.bb        |    1 -
 6 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.1.bb b/recipes/ti/matrix-gui-common_1.1.bb
index b0f84bc..9782f35 100644
--- a/recipes/ti/matrix-gui-common_1.1.bb
+++ b/recipes/ti/matrix-gui-common_1.1.bb
@@ -3,5 +3,4 @@ require matrix-gui-common.inc
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
 
 SRCREV = "136"
-PV = "1.1"
 PR = "${INC_PR}.0"
diff --git a/recipes/ti/matrix-gui-common_1.2.bb b/recipes/ti/matrix-gui-common_1.2.bb
index 6ea4d3d..b626e95 100644
--- a/recipes/ti/matrix-gui-common_1.2.bb
+++ b/recipes/ti/matrix-gui-common_1.2.bb
@@ -1,5 +1,4 @@
 require matrix-gui-common.inc
 
 SRCREV = "146"
-PV = "1.2"
 PR = "${INC_PR}.0"
diff --git a/recipes/ti/matrix-gui-e_1.1.bb b/recipes/ti/matrix-gui-e_1.1.bb
index 2b6bd76..8983f1b 100644
--- a/recipes/ti/matrix-gui-e_1.1.bb
+++ b/recipes/ti/matrix-gui-e_1.1.bb
@@ -3,6 +3,5 @@ require matrix-gui-e.inc
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
 
 SRCREV = "136"
-PV = "1.1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/ti/matrix-gui-e_1.2.bb b/recipes/ti/matrix-gui-e_1.2.bb
index 5ac2a56..84a0fa2 100644
--- a/recipes/ti/matrix-gui-e_1.2.bb
+++ b/recipes/ti/matrix-gui-e_1.2.bb
@@ -1,6 +1,5 @@
 require matrix-gui-e.inc
 
 SRCREV = "146"
-PV = "1.2"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/ti/matrix-gui_1.1.bb b/recipes/ti/matrix-gui_1.1.bb
index f14e207..41e0df2 100644
--- a/recipes/ti/matrix-gui_1.1.bb
+++ b/recipes/ti/matrix-gui_1.1.bb
@@ -3,5 +3,4 @@ require matrix-gui.inc
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
 
 SRCREV = "136"
-PV = "1.1"
 PR = "${INC_PR}.0"
diff --git a/recipes/ti/matrix-gui_1.2.bb b/recipes/ti/matrix-gui_1.2.bb
index 6837605..b0da800 100644
--- a/recipes/ti/matrix-gui_1.2.bb
+++ b/recipes/ti/matrix-gui_1.2.bb
@@ -1,5 +1,4 @@
 require matrix-gui.inc
 
 SRCREV = "146"
-PV = "1.2"
 PR = "${INC_PR}.0"
-- 
1.7.0.4



