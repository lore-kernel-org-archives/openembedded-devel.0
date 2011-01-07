Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PbEwM-0004uR-Cm
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 17:13:22 +0100
Received: by gxk20 with SMTP id 20so7470001gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Dt2b2NDeYgu16LU9rmrN6Rxe5bmHNYfOmZ6gisMflkA=;
	b=Cip7XPX8G3XnxHVcMxqJq5a5jKNQKaK7tjLMRNXTsmNBa6V54XFjfEDsuboAtRt2L6
	FHuwTGA9IGpc6i7Zwse+JRE0+m+ZY5UXrY331roTKf1UOP0VcvfFs0hJPIfZLmsrxRdH
	sG7RmgzJvPZ6BbH4JXSdQeBm/k4zD65YoVNzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xD5R22b0TIshSMcumvB6iG7hSR81o/oogZggZUqDnqy4VYvdR9JuzvQ/iP6qvIWFw/
	+fL1i83i8xJhZ9uxkRgSMb4pNFlHDM063BFOsZaXPXnivrGhRlHsb/eJvcMtanlWZu8L
	wn2grOxRYRA3ahChR+M1Jj9dl0tm6i9+YA2jw=
Received: by 10.91.45.8 with SMTP id x8mr3436672agj.199.1294416774498;
	Fri, 07 Jan 2011 08:12:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 2sm33738638anw.38.2011.01.07.08.12.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 Jan 2011 08:12:53 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 06:30:37 -0600
Message-Id: <1294403437-3834-1-git-send-email-m-watkins@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Melissa Watkins <m-watkins@ti.com>
Subject: [PATCH] ti-pru-sw: Update SRC_REV to 23
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
X-List-Received-Date: Fri, 07 Jan 2011 16:13:22 -0000

For the ti-pru-sw-examples, ti-pru-sw-app-loader, ti-pru-sw-edma-driver,
ti-pru-sw-edma-library:

* Update SRC_REV to 23

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
---
 recipes/ti/ti-pru-sw-app-loader_1.00.00.bb   |    2 +-
 recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb  |    2 +-
 recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    2 +-
 recipes/ti/ti-pru-sw-examples_1.00.00.bb     |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
index 6a5a707..197b1ae 100644
--- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "21"
+SRCREV = "23"
 S = "${WORKDIR}/trunk/app_loader"
 
 do_compile () {
diff --git a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
index d75aa7f..5747f3d 100644
--- a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "21"
+SRCREV = "23"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
 
 PACKAGE_STRIP = "no"
diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
index c77bc12..00ecfa6 100644
--- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "21"
+SRCREV = "23"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
 
 do_compile () {
diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
index be8d859..5ae25c9 100644
--- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "21"
+SRCREV = "23"
 S = "${WORKDIR}/trunk"
 
 do_compile () {
-- 
1.7.0.4



