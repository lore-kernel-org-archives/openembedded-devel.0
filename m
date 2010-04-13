Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1eKw-0005zv-M6
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 13:31:24 +0200
Received: by ey-out-1920.google.com with SMTP id 26so452012eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9DHT5A8MgOK6+t2ub+iYEUkZ97mLgBw+Sv2PsPt/XCc=;
	b=wfpeRKQs+U4x2GmyowzENF7i3aUuG5tUJSoEk20f8Vepug5byDNnZymOLaA8HjqPmb
	9+rxdYCAL8Phu3+NXimQ5VT3015etEo15BBavqiyzxTpSNugrPAaZXVPjtn4XIL9zZCC
	/vuXc+8lNc2BzvmMd4GWyENWnQGW1RdAeUk9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Sd6mUbNc8BfT/7ydjSA9DpTblNkX4D2HxRchnytHb5dMEY0wDXm/fQE9M4rlerntuS
	8JHUFMTOuzza5Kzh+qn5YINbFFuGcbkaLr4EPB38NROWgQ/sqVHpbyhM+wLCFojViGa9
	kwo7eoPmJq0vwZnDyAZQkiGcr7dGO64+jgJEA=
Received: by 10.102.165.40 with SMTP id n40mr3071752mue.71.1271158077480;
	Tue, 13 Apr 2010 04:27:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id s10sm22394232mue.27.2010.04.13.04.27.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 04:27:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 13:23:52 +0200
Message-Id: <1271157835-27308-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/6] linux-openmoko: use SRCPV in git recipes
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
X-List-Received-Date: Tue, 13 Apr 2010 11:31:24 -0000

* without PE bump, because nobody complained that we were bumping SRCREV
  without PV changes and we were using SRCPV in our branch before

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/linux/linux-openmoko-2.6.24_git.bb        |    2 +-
 recipes/linux/linux-openmoko-2.6.28_git.bb        |    2 +-
 recipes/linux/linux-openmoko-2.6.31_git.bb        |    2 +-
 recipes/linux/linux-openmoko-2.6.32_git.bb        |    2 +-
 recipes/linux/linux-openmoko-devel_git.bb         |    2 +-
 recipes/linux/linux-openmoko-shr-devel_git.bb     |    2 +-
 recipes/linux/linux-openmoko-shr-drm-devel_git.bb |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes/linux/linux-openmoko-2.6.24_git.bb b/recipes/linux/linux-openmoko-2.6.24_git.bb
index d980e21..f7f7e32 100644
--- a/recipes/linux/linux-openmoko-2.6.24_git.bb
+++ b/recipes/linux/linux-openmoko-2.6.24_git.bb
@@ -8,7 +8,7 @@ KERNEL_VERSION = "${KERNEL_RELEASE}"
 
 SRCREV = "fb42ce6724576fc173faf8abfb04aa2c36d213b7"
 OEV = "oe5"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCREV}"
+PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "\
diff --git a/recipes/linux/linux-openmoko-2.6.28_git.bb b/recipes/linux/linux-openmoko-2.6.28_git.bb
index 403a29b..cc5ab90 100644
--- a/recipes/linux/linux-openmoko-2.6.28_git.bb
+++ b/recipes/linux/linux-openmoko-2.6.28_git.bb
@@ -8,7 +8,7 @@ KERNEL_VERSION = "${KERNEL_RELEASE}"
 
 SRCREV = "8c65792a5c83c76d662a617a7c4e1ae8104bb6a5"
 OEV = "oe2"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCREV}"
+PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "\
diff --git a/recipes/linux/linux-openmoko-2.6.31_git.bb b/recipes/linux/linux-openmoko-2.6.31_git.bb
index 8db2533..c11e41b 100644
--- a/recipes/linux/linux-openmoko-2.6.31_git.bb
+++ b/recipes/linux/linux-openmoko-2.6.31_git.bb
@@ -8,7 +8,7 @@ KERNEL_VERSION = "${KERNEL_RELEASE}"
 
 SRCREV = "dd32737aa524e09c1d141a0e735dd58674552244"
 OEV = "oe1"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCREV}"
+PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
 PR = "r6"
 
 SRC_URI = "\
diff --git a/recipes/linux/linux-openmoko-2.6.32_git.bb b/recipes/linux/linux-openmoko-2.6.32_git.bb
index 11384c0..1a29511 100644
--- a/recipes/linux/linux-openmoko-2.6.32_git.bb
+++ b/recipes/linux/linux-openmoko-2.6.32_git.bb
@@ -7,7 +7,7 @@ KERNEL_RELEASE="2.6.32.11"
 
 SRCREV = "14be1091928fcce66812a85129768fb253b36420"
 OEV = "oe1"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCREV}"
+PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
 PR = "r7"
 
 SRC_URI = "\
diff --git a/recipes/linux/linux-openmoko-devel_git.bb b/recipes/linux/linux-openmoko-devel_git.bb
index ba2e9c4..21d227d 100644
--- a/recipes/linux/linux-openmoko-devel_git.bb
+++ b/recipes/linux/linux-openmoko-devel_git.bb
@@ -8,7 +8,7 @@ KERNEL_VERSION = "${KERNEL_RELEASE}"
 
 SRCREV = "a15608f241a40b41fed5bffe511355c2067c4e88"
 OEV = "oe1"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCREV}"
+PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
 PR = "r2"
 
 SRC_URI = "\
diff --git a/recipes/linux/linux-openmoko-shr-devel_git.bb b/recipes/linux/linux-openmoko-shr-devel_git.bb
index 69a340b..ec85932 100644
--- a/recipes/linux/linux-openmoko-shr-devel_git.bb
+++ b/recipes/linux/linux-openmoko-shr-devel_git.bb
@@ -8,7 +8,7 @@ KERNEL_VERSION = "2.6.29-rc3"
 
 SRCREV = "a15608f241a40b41fed5bffe511355c2067c4e88"
 OMV = "oe11"
-PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCREV}"
+PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCPV}"
 PR = "r8"
 
 SRC_URI = "\
diff --git a/recipes/linux/linux-openmoko-shr-drm-devel_git.bb b/recipes/linux/linux-openmoko-shr-drm-devel_git.bb
index a0253c5..da7c93d 100644
--- a/recipes/linux/linux-openmoko-shr-drm-devel_git.bb
+++ b/recipes/linux/linux-openmoko-shr-drm-devel_git.bb
@@ -9,7 +9,7 @@ KERNEL_VERSION = "2.6.29-rc3-drm"
 
 SRCREV = "e62a4ae1c6783f41b41a9ac3d258786586b65a40"
 OMV = "oe15"
-PV = "${KERNEL_RELEASE}-drm-${OMV}+gitr${SRCREV}"
+PV = "${KERNEL_RELEASE}-drm-${OMV}+gitr${SRCPV}"
 PR = "r5"
 
 SRC_URI = "\
-- 
1.7.0.4



