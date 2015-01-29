Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id A0040718E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 01:30:51 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kx10so32166667pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 17:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=uBrey15KHGxxynGZxbnyMYDMc0oi8eBTrE51VL15XO0=;
	b=rMpTUrtkhRgRTVRl0oGK6nLJlBsN6lPeUMeOxayt8hdNyK8+NjM5MXsXLsOuTsC3pN
	pCVBykpT/iDRXCYK97/P8mmrG6Aj8XNQCS//5yZv05e//aVptTiEjWG+Tlht+n7TvcaV
	0NSfxl5jglz6m704oSi+U3oB9zj5f6UHKzhh+TbSmvV00X6dWTR3QCjANm+7yYj25a+0
	O6zonTXYuzmickn/yczkgKuoTbSTaA1OEs6zttXBOqWuUgKJ9YODoCmYSqO3vgwDb9OM
	G78j9B7BJt/i8so+AMLzgS2v1FzFqgQRP3yE3KMfV9nWPnP8wKBP/yRPiOfT/TOxD7MZ
	HThg==
X-Received: by 10.70.135.233 with SMTP id pv9mr10654791pdb.48.1422495051418;
	Wed, 28 Jan 2015 17:30:51 -0800 (PST)
Received: from localhost.localdomain (104-37-60-13.dyn.novuscom.net.
	[104.37.60.13])
	by mx.google.com with ESMTPSA id ul5sm6030934pab.36.2015.01.28.17.30.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Jan 2015 17:30:50 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2015 17:30:48 -0800
Message-Id: <1422495048-4622-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] cpufrequtils: Don't preserve host user permissions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2015 01:30:57 -0000

The makefile installs the generated libcpufreq with 'cp -fpR'
preserving the user and group of the builder on the host system yielding
errors like this:

  WARNING: log_check: warning: group pulse does not exist - using root

Really, this library should be installed with root user and group
ownership so override the meaning of 'CP' to simply 'cp'.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index e74fa44..e3b4de1 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-EXTRA_OEMAKE = "V=1 CROSS=${TARGET_PREFIX} LIBTOOL='${HOST_SYS}-libtool --tag cc' STRIPCMD=echo"
+EXTRA_OEMAKE = "V=1 CROSS=${TARGET_PREFIX} LIBTOOL='${HOST_SYS}-libtool --tag cc' STRIPCMD=echo 'CP=cp'"
 
 do_compile() {
     oe_runmake
-- 
2.1.0


