Received: from mail-gx0-f193.google.com ([209.85.161.193])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PaD2L-0008DL-80
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 20:59:17 +0100
Received: by gxk7 with SMTP id 7so3813675gxk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 11:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=j64xc532GXAzXqXNfRVK2ZAOOvZ9cXOGsRw+qZa/vr4=;
	b=gW2SDfB5eAsZ0AxbKfTCXx+M2Zjr+HzsL8zU0DE9v01k6AZzenuSZ+jh6RF/kGRmb0
	GFxOhOtvfEPudP+eZZDxDdeSQhcE6bIkSIjYMFgjjw8x9IBctI6K7IR9XbiZvPYU4oXC
	5MOJhPmH5ZeUBnrhmLwvl7Y/6RdIywfKdEyaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tHTmtArw7aZF0zozgO66QSxAy7wySOKxmJ/mm+Ab+HZRk0BnoCyT1Swv6pMCIyY/HP
	sQaTG9mYtiBq5GzMRfLTwWpdnD+KaF3RNe5O6FCcTKHRGq7guQNdQuXkDFaM42wN/gGJ
	P4YIhVwmoBN5INJoH5vSWmwWb0YglZR42mD7I=
Received: by 10.150.200.7 with SMTP id x7mr21116319ybf.153.1294171130286;
	Tue, 04 Jan 2011 11:58:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q4sm14068680ybe.0.2011.01.04.11.58.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Jan 2011 11:58:49 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 10:15:37 -0600
Message-Id: <1294157737-18899-1-git-send-email-m-watkins@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Melissa Watkins <m-watkins@ti.com>
Subject: [PATCHv2] ti-pru-sw: Update SRC_REV
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
X-List-Received-Date: Tue, 04 Jan 2011 19:59:17 -0000

For the ti-pru-sw-examples, ti-pru-sw-app-loader, ti-pru-sw-edma-driver,
ti-pru-sw-edma-library:

* Update SRC_REV

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
---
In version 2:

* Removed bumping PR

---
 recipes/ti/ti-pru-sw-app-loader_1.00.00.bb   |    2 +-
 recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb  |    2 +-
 recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    2 +-
 recipes/ti/ti-pru-sw-examples_1.00.00.bb     |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
index 6b7514d..20fd153 100644
--- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk/app_loader"
 
 do_compile () {
diff --git a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
index b975d78..8b1cd0c 100644
--- a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
 
 PACKAGE_STRIP = "no"
diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
index cb517de..73990e9 100644
--- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
 
 do_compile () {
diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
index 5df6c6e..d13990a 100644
--- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk"
 
 do_compile () {
-- 
1.7.0.4



