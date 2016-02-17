Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BA6ED731F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:56:34 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so235856180wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9RtLfWLYt5lmdwKw6eLPl7pXkV92gcmabtl3NZcTFaU=;
	b=sob0hLvx9UpfHe810FPvYLBRRniXIKU1h4p9LvcDbC3Jo2vKabNNV1Gng1XMu9wJyJ
	su4uk7F23YfgZtxeuD9gM/WfJWcVRZO21SqTffHbEhhqjv3GG2UuOqvGaxpglicfZn5f
	TzG2H9fBCIwpSarDI81dLOl3zqZAK16SFTgFvRY4MRbANprlJf2K9krWUbGpTrx9fH3f
	vq16FuEQA9YP2k99PzoZhPrHYHQDenMlPTo1JG4sPfff2mO3lHVf9ekvZzgVU2T4jFPt
	l15hsBeJct/NymoViPgeQz4C4Th2IVoF5gPnKL4sB2f0yLpknpAjSy9h8fxTRri80/fP
	1xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9RtLfWLYt5lmdwKw6eLPl7pXkV92gcmabtl3NZcTFaU=;
	b=d69P6OOEkdWNdwkpUp2cnh6AvWG0dYgTQx9Th6C74p+TkQLx7SBWurk7ZRcPYGnwlH
	tskj7wvT7wYX7Sr3WPUShd/4tdkCRc5mzc8rZvxFod7dNid0cUQypSX8IlyvGW3gnHbX
	4Z2GCwRkt3x+uxmTPsfwNvflgkcPUA1B8CacVtHbrAianKxlD5GcVvyE4KhurdvgA6iY
	x8mKys+s2OHNtrdKdl1QoKtsSPXY+TfF8w3WdXvUVDZ7tEY2afNjNzhy89QJoE9NZI3d
	fh9oVg4bFHEFCmNsrengE7EM2N/HiudS9zGPIMmdSNKQSJFhCic0PJvGiNj26K3K4AS2
	WQZw==
X-Gm-Message-State: AG10YOT8obwumE4HOF1wWRvLydm0WIzWEF/uU4tK1w3V4TwB+tWoYd+LKwyG5i4Ut9l9Fg==
X-Received: by 10.194.5.36 with SMTP id p4mr4167948wjp.167.1455746194752;
	Wed, 17 Feb 2016 13:56:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ct2sm3443882wjb.46.2016.02.17.13.56.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 13:56:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2016 22:56:44 +0100
Message-Id: <1455746205-31727-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 4/5] qtbase: Resolve QA warning about /bin/bash dependency
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
X-List-Received-Date: Wed, 17 Feb 2016 21:56:35 -0000

* WARNING: QA Issue:
  /usr/lib/qt5/mkspecs/features/data/mac/objc@underscore@namespace.sh_qtbase-mkspecs
  contained in package qtbase-mkspecs requires /bin/bash, but no
  providers found in its RDEPENDS [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index c5ea7bb..31ef793 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -219,6 +219,8 @@ do_install_append() {
     # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
     # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
+    # and this one has /bin/bash shebang, but checkbashisms doesn't show any reason for it
+    sed -i 's@^#!/bin/bash$@#!/bin/sh@g' ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/data/mac/objc_namespace.sh
 
     # Replace host paths with qmake built-in properties
     sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX]|g' \
-- 
2.7.1


