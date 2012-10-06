Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKb2L-0002Id-EE
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Oct 2012 22:31:49 +0200
Received: by mail-gh0-f175.google.com with SMTP id z2so894714ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=EVq/uaqIJmGw7KLW8SKQlIzD9liWps8kMAn/DjqEzuI=;
	b=hQWPHcJlVmy495tbCM45oFiBqR+txaASOOMicG3XwMQGm0BNd/hngiZn/VH4IjJ7+A
	rFISao02l5D2e5yT7uU9DPfIO1fgjK1mOFIPg4Df87eHGkz+McdMufD7GwNsSwVj/4fR
	p8C9tOQTfBDt7AHXmJIoI2fxnBnoSGhjDMKTtIFXnCy6hZJzdOxHI+1ycSWuGrwe7gig
	sJfZRtrrgRxXiSabQ+HUFodNaO87YfNQH29wKlYP3jH7ZWTtWahAXFdEyoZ2RvGS00Ka
	xxPwoikdoOX0NUAeSYgFuVrGcIJ8sqt1r24H4y+HYNKtyInMYdywV9lnMSFk7a6zGRkR
	5Kng==
Received: by 10.236.92.172 with SMTP id j32mr11702370yhf.37.1349554727596;
	Sat, 06 Oct 2012 13:18:47 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h15sm13150353ank.2.2012.10.06.13.18.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 13:18:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Oct 2012 17:18:29 -0300
Message-Id: <1349554710-6693-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
References: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/5] libav: Update git version to 2012-10-04 snapshot
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
X-List-Received-Date: Sat, 06 Oct 2012 20:31:49 -0000

This package depends on libpostproc to ensure same set of libraries is
provided for runtime.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/libav/libav_git.bb |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav_git.bb b/meta-oe/recipes-multimedia/libav/libav_git.bb
index 5051265..d12bd9d 100644
--- a/meta-oe/recipes-multimedia/libav/libav_git.bb
+++ b/meta-oe/recipes-multimedia/libav/libav_git.bb
@@ -2,18 +2,22 @@ require libav.inc
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-"
+                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-# When bumping SRCREV make sure you bump PR here and in dependant recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION changes
-SRCREV = "62c473934822afd317dfef27754a0ff71f58ce2a"
-
-PV = "0.6.5"
+DEPENDS += "libpostproc"
+PV = "0.8.99+git${SRCPV}"
 PR = "${INC_PR}.0"
 
-SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.6"
+DEFAULT_PREFERENCE = "-1"
 
-S = "${WORKDIR}/git"
+# When bumping SRCREV make sure you bump PR here and in dependant
+# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
+# changes
+SRCREV = "4673a5a761f329af0aa56fc84f34ed898188bfa2"
+SRC_URI = "git://git.libav.org/libav.git;protocol=git"
 
+S = "${WORKDIR}/git"
 
+# postproc has been split
+EXTRA_OECONF := "${@oe_filter_out('--enable-postproc', '${EXTRA_OECONF}', d)}"
-- 
1.7.2.5



