Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 90ED97708E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:38:01 +0000 (UTC)
Received: by wmec201 with SMTP id c201so17834921wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RJQa5ga0KbG/vxYn38vOoJhM3inIKvj6mXwPqd5cVHE=;
	b=LejCxuUzzGEAUxqr1sZ7oqlTv8v5uYn5rc8xPg95DkysFpwTBAJm35sLwsJA9Y8n0G
	RsztEn12kYxyZ2buoQlXmAehQXZye++5UznPkmz+tfPiEgoXwSU4EdEmboH4LUawmZFV
	oVXn9oPS+PXnNEgvbn4YdHZWuEAZl0uX0rKhdAivOXebLTm6vW3zliA+P1fnsr6HJ6fA
	mL2W/q3tqmvung07Vl+T2gMo1emde1xiklAw9L1Ki5VsQ9zjSDOWEG9b/TeinHi/4PGl
	kJW2aCvdzm7DevX+CfBRZ5AJ/WI/bxDXx+l8DkNSiK1xBFN5oAGZ860aVPMeZzUWAFc1
	9t2Q==
X-Received: by 10.28.19.198 with SMTP id 189mr10437141wmt.103.1446817080803;
	Fri, 06 Nov 2015 05:38:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l131sm810597wmd.14.2015.11.06.05.37.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:37:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 14:38:08 +0100
Message-Id: <1446817092-9386-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
References: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 3/7] qtwebengine: add dependency on libxscrnsaver with x11 in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 06 Nov 2015 13:38:01 -0000

* when qtbase is built with x11 support, xcb is enabled in QT_CONFIG
  and qtwebengine checks for libxscrnsaver.
  Unfortunately such check isn't fatal for do_configure task, it will
  only show something like this:
  libxscrnsaver wasn't found, qtwebengine won't be built
  in log.do_configure and continue to do_compile and do_install (which
  will also finish successfully, saying "Nothing to do").

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 0b2c756..72eb1b4 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -17,6 +17,12 @@ DEPENDS += " \
     libcap \
 "
 
+# when qtbase is built with xcb enabled (default with x11 in DISTRO_FEATURES),
+# qtwebengine will have additional dependencies:
+# contains(QT_CONFIG, xcb): REQUIRED_PACKAGES += libdrm xcomposite xcursor xi xrandr xscrnsaver xtst
+# xscreensaver isn't covered in qtbase DEPENDS
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxscrnsaver', '', d)}"
+
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
-- 
2.6.2


