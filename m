Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id EECD6774A9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 18:53:00 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id o16so114728881wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 10:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qxWpcSMvF3fDbYxGg8lb9oqothf1LT/sqRWTUF6U3ok=;
	b=omzEVOnymwjAFDr63lrOdKlzHWxR9H3nbBG1aPqZplq30KQ6Ezl8/c1yGxl/hUKC9/
	I/TSQsvBa4MxevUrM0mCfsuC/kf4/tR6abNy+xjTlUIemLWOCitPIs1dc1VzdySsqjxm
	I4pAuBtP02LR13Bxp53eUXiAgVoi8x09+l4fa7D/a1KAgJThv77WghtMoC8ceSgNEEkL
	s8jZjT6KkQUb8kvlcg3laTWGOJs9shnqgGsRTOsDGiu78V+d7F3wza4VUb7MKb+/79A5
	bHAkcdduFLZawvXiX/6CXjVkz8w8QlhQqbcyg2e25Na5Vx0HAIV8PpsDbkfKc+xENYW9
	4ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qxWpcSMvF3fDbYxGg8lb9oqothf1LT/sqRWTUF6U3ok=;
	b=SbbxAAXUG6cU12SwDRHWdavUtywMonqGk7wL+V1P5cOMsxS87Giau5heUE5miKocZ/
	vv/Occt9+YRF9ZvwFPj7Q/uqXuXX+IS83CvOXVnSyN9sc8toNIBrMrM/6Ygh/dEmCeVd
	Zert8Cs/UEllgP/ahtIAYqkx91elMRFhaZTO6a2ukNCiloxJWyx57aYoAZJKgO5EIHnj
	5ercNjg5g6t30iSUEfaIL8LwY5Lvwg34wSR0otNt0FBQ2BV6CyV3NlwNCbxhjxGJnueo
	5A4XhiALXS+jYnirb8KdaRyisQnNWs/IPR0MgbXVhG/OD+gQjsRcJ5pOGTM0D862WQGd
	sr2A==
X-Gm-Message-State: AMke39mbx2XF/AGi4lzI8Xm7rv4DLN0e+ahj8JsCn6Q7/plZHyowhnX0pYPckyb/N9V8OA==
X-Received: by 10.223.168.111 with SMTP id l102mr8923222wrc.150.1486752780325; 
	Fri, 10 Feb 2017 10:53:00 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id g6sm928921wmc.30.2017.02.10.10.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 10:52:59 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 19:52:39 +0100
Message-Id: <1486752759-5996-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.5.5
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-qt5][PATCH][master][morty]] populate_sdk_qt5: use _append operator
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
X-List-Received-Date: Fri, 10 Feb 2017 18:53:01 -0000

populate_sdk assigns TOOLCHAIN_HOST_TASK and TOOLCHAIN_TARGET_TASK with ?=.
Thus depending on the order in which populate_sdk and populate_sdk-qt5 get
parsed the assignments from populate_sdk are discarded and the resulting sdk
is missing among others the environment-setup script.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 classes/populate_sdk_qt5.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index bbf137d..a10341d 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -2,7 +2,7 @@
 
 inherit populate_sdk_qt5_base
 
-TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
-TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
+TOOLCHAIN_HOST_TASK_append = " nativesdk-packagegroup-qt5-toolchain-host"
+TOOLCHAIN_TARGET_TASK_append = " packagegroup-qt5-toolchain-target"
 
 FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
-- 
2.5.5


