Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PSBw2-0002V2-Pt
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 18:11:39 +0100
Received: by ywi6 with SMTP id 6so3462479ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 09:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=YlqxWQ9Bx6CkKHfhXAVHH5dlOxJmTFm3s6a7iux06uU=;
	b=PabGS+/x7w0TTJedAEaIBH5qzDT+nhQMK8c6GDotdqyOzvFPJSukm/+9MqRY7NjbsX
	0pOE+71HYIVxh1aqNvsraCdTkek3bF4Et/n0muNV3sF7B2omyMQzAYfcB3PwicSRH1EP
	GHUoEqIlVmAOPcyOPZmFNtWzssIwP9Xr3XyI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=jAzS9J97enPwYX7FgZ/TIDOqYEJ4XbVNXCtoGnHSjwvgon5ORpRxsHHx7E2nLXqaxS
	5doHRNhPCmcBlO7qo9i5iV9aG5KG/wFEh+Conm5C7EzQ+PYJQJbhziTJwnkQjLYTttUE
	MPNoZ2oihXa/osl2a6J38LgMH0vHiBe+Qjbyk=
Received: by 10.150.57.6 with SMTP id f6mr6458477yba.339.1292260198139;
	Mon, 13 Dec 2010 09:09:58 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u3sm2599083yba.4.2010.12.13.09.09.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 09:09:57 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 07:19:29 -0600
Message-Id: <1292246369-5871-1-git-send-email-m-watkins@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: mwatkins.ti@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Melissa Watkins <m-watkins@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/4] ti-pru-sw-app-loader: remove unneeded RDEPENDS
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
X-List-Received-Date: Mon, 13 Dec 2010 17:11:39 -0000

* This package is a library used only during staging and does not
  get installed on the target system.  It does not need an
  RDEPENDS defined.
* Bump PR
* Update SRC_REV
* Update COMPATIBLE_MACHINE

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-pru-sw-app-loader_1.00.00.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 mode change 100755 => 100644 recipes/ti/ti-pru-sw-app-loader_1.00.00.bb

diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
old mode 100755
new mode 100644
index 013ae89..6b7514d
--- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
@@ -1,14 +1,13 @@
 DESCRIPTION = "PRU sw application loader"
 HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
-RRECOMMENDS_${PN} = "kernel-module-uio-pru"
-PR = "r0+svnr${SRCPV}"
+PR = "r1+svnr${SRCPV}"
 
-COMPATIBLE_MACHINE = "omapl138|am180x-evm"
+COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "18"
+SRCREV = "20"
 S = "${WORKDIR}/trunk/app_loader"
 
 do_compile () {
-- 
1.7.0.4



