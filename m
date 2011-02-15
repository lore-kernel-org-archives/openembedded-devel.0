Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PpQvY-0004hL-Mg
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 20:51:12 +0100
Received: by ywi6 with SMTP id 6so269411ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 11:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=NNvuk059FVOFrhq4Ndx/GtBdYPVr5nj3NSHTFjFLsH8=;
	b=dQ1MFMk8ms232UuoR0k9ruvkY65y9FMUZneGibl8/FMG7K+o/MMUcDs9YnPkrh+p5W
	u6fIjMO52xkTtGOVyY9Z9USK8ixseIc49G4VfthiBNsfYZ1YJ/LyKOPeMitKtVqjYZLg
	/5UsAiWkYMh9XdeiyRqg75ZbrGsD7uzYqPRCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Z17yRgM7K1esXfKia1gIX1RjWVBpq8qR/TP9n+1FlUkGm39ctHtgPplSqyyVGmkEG0
	G/KasUGdTpA3hfhtVOQyOtfCXpr2ZekBEVTGCgWdGErbcKZWWifsBGWDpA5k6qb740SI
	IX5f3IS0pvW1AhHkWXqgYPPKoFa/qZosunUic=
Received: by 10.150.198.3 with SMTP id v3mr6516280ybf.316.1297799400434;
	Tue, 15 Feb 2011 11:50:00 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id g2sm2563522yhc.28.2011.02.15.11.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 11:49:59 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Feb 2011 10:20:36 -0600
Message-Id: <1297786836-18313-1-git-send-email-m-watkins@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Melissa Watkins <m-watkins@ti.com>
Subject: [PATCH] ti-pru-sw: Update SRC_REV to 24
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
X-List-Received-Date: Tue, 15 Feb 2011 19:51:12 -0000

For the ti-pru-sw-examples, ti-pru-sw-app-loader, ti-pru-sw-edma-driver,
ti-pru-sw-edma-library:

* Update SRC_REV to 24

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
---
 recipes/ti/ti-pru-sw-app-loader_1.00.00.bb   |    2 +-
 recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb  |    2 +-
 recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    2 +-
 recipes/ti/ti-pru-sw-examples_1.00.00.bb     |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
index 142c1bc..394c3ab 100644
--- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "23"
+SRCREV = "24"
 S = "${WORKDIR}/trunk/app_loader"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
index 1d3676f..bb8fca2 100644
--- a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "23"
+SRCREV = "24"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
 
 PACKAGE_STRIP = "no"
diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
index 02961c7..1a03597 100644
--- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "23"
+SRCREV = "24"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
 
 do_compile () {
diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
index d53a288..f5fa8d5 100644
--- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "23"
+SRCREV = "24"
 S = "${WORKDIR}/trunk"
 
 do_compile () {
-- 
1.7.0.4



