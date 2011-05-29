Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo1e-00039A-SK
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 23:59:58 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=3dtSRe6zGwX70fapxCCEJopV6Tb0H45WWaPCKXvOf6E=;
	b=aENKx7Ov2AJHBZElx+RW3yrSUaFjKOC6Mq0RNoxu0T1n9Svc4yHtN9j0F7S4h0YT4k
	uIxV8NecpP4gowlTdMbVQmXGSA3uHYZUwbI4vbwa9RF2SXddJIlRqUzMuGJGSKrrtlnZ
	Qxx9NMR2ZGwLKOHs97ZAvwdRcdOg7YlGLPodo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=om4LBemV/jRt/jVBrHZljC/hT/ACM/6bhbDtwGLlJA16pEkCVG1u128DAUwvMsMbhM
	1hJ3KL5VnHkAYHcN7zHII+t33oRRZrPTsei8AqES5BiXf/EhycW6uWNRcVfXHYFSFY3j
	YVDEABaUUxBXj9V7qCHNoQe48VCw0j3F3XhIA=
Received: by 10.223.57.86 with SMTP id b22mr5003439fah.95.1306706213730;
	Sun, 29 May 2011 14:56:53 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id e16sm526970fak.17.2011.05.29.14.56.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:56:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:27 +0200
Message-Id: <c460098908d6e0282af0bb857372f39de5acbcc8.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/14] s3c24xx-gpio, s3c64xx-gpio: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Sun, 29 May 2011 21:59:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../samsung-soc-utils/s3c24xx-gpio_svn.bb          |    3 ++-
 .../samsung-soc-utils/s3c64xx-gpio_svn.bb          |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
index b813f76..80fd4f7 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "A user-space tool to show and modify the state of GPIOs on the S3c24xx platform"
 SECTION = "console/utils"
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://gpio.c;endline=12;md5=cfb91c686857b2e60852b4925d90a3e1"
 SRCREV = "4949"
 PV = "1.0+svnr${SRCPV}"
 PR = "r2"
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
index f8ca794..8a3d190 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "A user-space tool to show and modify the state of GPIOs on the S3c64xx platform"
 SECTION = "console/utils"
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://gpio-s3c6410.c;endline=12;md5=060cda1be945ad9194593f11d56d55c7"
 SRCREV = "4949"
 PV = "1.0+svnr${SRCPV}"
 PR = "r0"
-- 
1.7.5.rc3



