Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF1F772FF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 19:45:08 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so110223375wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MXhd+Lqd8eNKNm/x2TaLhIpcMH89Q/mnD9xZg/v5MDQ=;
	b=FzcsGsD2S8kp4ezJ7mYVd1UAqyG3Z3Rg5RHutWrxZuX7PVuAbaBw7ux6yAnyDFYD6S
	dOFF7Gkn2JNl9d86ks1LEQShdBMtzbuYY1qEhSsWt/fA0rKVgepC6WlrKltn1JWPLfB2
	KX+tOQcYTu2ISq2fJVRwCid8xdCnLxhni5U8UZ46yqbwGq3U7EnU9Ql5PpkcA2jhzNhK
	DXlr5kLaFFPYJuU9sxq3kln5Ky1BwvzWehS9GwUkTIZF4nwZVYc0jcbKAkMlSzje6knz
	rVB2dE22HflYq7o+jl8C5GQ7uhHea1/ryfquOsykRwMUQKdcfNIXk1z3bcF/Auwy13IS
	lHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MXhd+Lqd8eNKNm/x2TaLhIpcMH89Q/mnD9xZg/v5MDQ=;
	b=icE2wIQCN1B7pSsVtXxG74oPPRBy+wZa2PXlCrVJP1ht5r/LmAZmmhtqpwZddUVjbB
	3BmdK3DoLQASDkocSZsaSIKTitZbWHlKKGPApNVg0wN9S35HwvO8E3SdPInVRvXY+kGm
	znPI7vqXvVM4iL1QxqomPCvDC/j1vcYgiv/rRoVTsTHUhej9BfgoRKH4EgbYJj6rXJ0M
	xhMqsOnD3BXgrSEkkl5ZXOOqFNfC4p6Mr0d3Zb1Y3tqqKTLSj9vRc4HKcqaOM70QujSN
	RFQhqjH9hH0PnnR00A2g80YxPJoZTKLp4yoIyoBuhwcM/OkNs+ryonk+XpkteJuKL65i
	Pr0g==
X-Gm-Message-State: AD7BkJKnzW5MNt6rFPUCGY8uoMIKL/Zi0hzYD1rwPDFFqGfu7WBkq8GbF1irITvETGODdA==
X-Received: by 10.194.58.169 with SMTP id s9mr7617815wjq.52.1456602309110;
	Sat, 27 Feb 2016 11:45:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z127sm8434710wme.5.2016.02.27.11.45.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Feb 2016 11:45:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2016 20:46:33 +0100
Message-Id: <1456602393-32248-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] freerdp: Fix QA warning when no binaries are built
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Feb 2016 19:45:10 -0000

* without x11 or wayland enabled from DISTRO_FEATURES there is nothing in
  /usr/bin and this empty directory causes QA error

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index c749b0c..4c81b57 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -60,8 +60,12 @@ PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 # we will need winpr-makecert to generate TLS certificates
 do_install_append () {
     install -m755 winpr/tools/makecert/cli/winpr-makecert ${D}${bindir}
-    rm -rf ${D}/${libdir}/cmake
-    rm -rf ${D}/${libdir}/freerdp
+    rm -rf ${D}${libdir}/cmake
+    rm -rf ${D}${libdir}/freerdp
+    # without x11, wayland, directfb enabled this directory will be empty
+    # causing QA error: ERROR: freerdp-1.2.5+gitrAUTOINC+62da9d28c6-r0 do_package: QA Issue: freerdp: Files/directories were installed but not shipped in any package:
+    #   /usr/bin
+    rmdir ${D}${bindir} --ignore-fail-on-non-empty
 }
 
 python populate_packages_prepend () {
-- 
2.7.1


