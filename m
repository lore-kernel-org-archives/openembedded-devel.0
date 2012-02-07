Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumtK-0003dR-7h
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:23:34 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1956628eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GvtxYM0o3msiszlzvSFvH6OdjOOshXaBO7B9xrQEUcY=;
	b=Bt6ZUWFhs06k8Fi2lDs+f8BY0SkcDRD1o6biyVw/1VIjZbZQy+dZnahDP+Fvbpdcd/
	4q0PX6tGkkmPUkO5SwCFnSss1+Pg6+ndhwbV/5V7JMU9TYJiyHmydRQVo7rOsXEOmm3y
	GHO1RZAw4m8+06LWvc5iQxWsTNfLYultOZdfM=
Received: by 10.213.8.143 with SMTP id h15mr2136956ebh.24.1328627734106;
	Tue, 07 Feb 2012 07:15:34 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id z47sm66752182eeh.9.2012.02.07.07.15.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:15:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue,  7 Feb 2012 16:15:33 +0100
Message-Id: <1328627734-5293-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][RFC 5/6] systemd-image: remove connman-systemd / remove IMAGE_INIT_MANAGER
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
X-List-Received-Date: Tue, 07 Feb 2012 15:23:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* connman-systemd is automatically rrecommended by systemd.bbclass
* IMAGE_INIT_MANAGER is automatically set based upon INIT_MANAGER configuration
  by image.bbclass & initmanager.bbclass

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-images/angstrom/systemd-image.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-images/angstrom/systemd-image.bb b/recipes-images/angstrom/systemd-image.bb
index e25c8e9..d7b8b3b 100644
--- a/recipes-images/angstrom/systemd-image.bb
+++ b/recipes-images/angstrom/systemd-image.bb
@@ -2,13 +2,14 @@
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r1"
 
 IMAGE_PREPROCESS_COMMAND = "rootfs_update_timestamp"
 
 DISTRO_UPDATE_ALTERNATIVES ??= ""
 ROOTFS_PKGMANAGE_PKGS ?= ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${ROOTFS_PKGMANAGE} ${DISTRO_UPDATE_ALTERNATIVES}", d)}
 
-CONMANPKGS ?= "connman connman-plugin-loopback connman-plugin-ethernet connman-plugin-wifi connman-systemd"
+CONMANPKGS ?= "connman connman-plugin-loopback connman-plugin-ethernet connman-plugin-wifi"
 CONMANPKGS_libc-uclibc = ""
 
 IMAGE_INSTALL += " \
@@ -19,7 +20,6 @@ IMAGE_INSTALL += " \
 "
 
 IMAGE_DEV_MANAGER   = "udev"
-IMAGE_INIT_MANAGER  = "systemd"
 IMAGE_INITSCRIPTS   = " "
 IMAGE_LOGIN_MANAGER = "tinylogin shadow"
 
-- 
1.7.6.4



