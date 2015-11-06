Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 48F28770F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:38:05 +0000 (UTC)
Received: by wijp11 with SMTP id p11so30297339wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PciIqj/GsOzyJ60JAKoInMHFFFN4L4UH0lrR37MsCbc=;
	b=gal2i9X/+BRpcRi7kMw2R+ZQzJA4Jp3+zEkRlNIiZxT6eIyqHVEiqAQ+B0q2r45tQk
	GTPlNuPKqMV21SzJ+knSyVElMvdAjLKSvxO1TmsXhZ3p9AkTGJBQTVbDEmz03R4l632M
	WHt4rcsY9c1rUdx+BC+sLLtJIFJiAqwhGqMC0fDoZIM/Gsj1XSR8Qjmt/T00WBZNq8P6
	2OFsJ2sGUfWxeCBeucEhq7cdxvv4vKjFtTwGaS5ZGLDCDELmoi5PhiaUySnV0E64ccQc
	8vnfOiVNgo4JzjCy8BMP+4p6SDelvqL8GuzzOeDdfgm52DuMwOvJPLI6/fM88bQPUsOR
	HA2A==
X-Received: by 10.194.23.104 with SMTP id l8mr17476162wjf.132.1446817086063;
	Fri, 06 Nov 2015 05:38:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id e9sm217109wjw.8.2015.11.06.05.38.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:38:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 14:38:12 +0100
Message-Id: <1446817092-9386-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
References: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 7/7] qtwebengine: add dependency on flac
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
X-List-Received-Date: Fri, 06 Nov 2015 13:38:06 -0000

* autodetected from sysroot:
  WARNING: QA Issue: qtwebengine rdepends on libflac, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index a9416d6..42f3d60 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -23,6 +23,8 @@ DEPENDS += " \
 # xscreensaver isn't covered in qtbase DEPENDS
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxscrnsaver', '', d)}"
 
+DEPENDS += "flac"
+
 DEPENDS += "yasm-native"
 EXTRA_QMAKEVARS_PRE += "WEBENGINE_CONFIG+=use_system_yasm"
 
-- 
2.6.2


