Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TtHrO-0005We-JY
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 14:08:04 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9BD29D22E8;
	Thu, 10 Jan 2013 13:52:44 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 13:52:36 +0100
Message-Id: <1357822356-10623-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1357822356-10623-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1357822356-10623-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 2/2] libav: move --enable-postproc to 0.8.3 recipe
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
X-List-Received-Date: Thu, 10 Jan 2013 13:08:13 -0000

libav 9.1 does not have this option.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-multimedia/libav/libav.inc      | 1 -
 meta-oe/recipes-multimedia/libav/libav_0.8.3.bb | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index cd1204f..e85ae29 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -32,7 +32,6 @@ EXTRA_OECONF = " \
         --enable-shared \
         --enable-pthreads \
         --enable-gpl \
-        --enable-postproc \
         --enable-avfilter \
         \
         --cross-prefix=${TARGET_PREFIX} \
diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
index 10bdfa7..e7d6c02 100644
--- a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
+++ b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
@@ -5,6 +5,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/libav-0.8.3:"
 SRC_URI_append = " \
           file://0001-configure-enable-pic-for-AArch64.patch \
 "
+
+EXTRA_OECONF += " \
+        --enable-postproc \
+"
+
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-- 
1.8.0



