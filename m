Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4C4EC6087D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 21:36:12 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f10so5367731yha.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 14:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3fUNkY9w6d12qb4hNW7Zxl37ufAsgTa4BM+m8Jvopdc=;
	b=WT8ULGNYMEWat8LP73LVc6V1dn2QP05v/ajVRmimB/T5qn6GMZoUS8cNCzHOZpnIc4
	USz2LOQDy/Nda2gqiBRy1nQm4Du1iQivydqctbJUvF9ufL7EJ6soyqKBkXoLYHBsk55H
	jJvQMyjr3I6N2msSn8pe4EaxG3eFrXGw9Xn/JlTwl0AEBM7/MOh2Rmd5mRasnsRZ5JHC
	FsM9NuxyE/BSpV1fMDKmqcM4pY/WK4ysjpKJQQJvSopYf7AYJeMPWkNsocMUU08kK/rJ
	uXeNvl1K9qm4s4ndk40ClvO/aLMDuitw5XUjjE5AUr8NdiOf57uZ6rF3qiABRsDqj2Pw
	hu3A==
X-Received: by 10.236.99.99 with SMTP id w63mr63699883yhf.52.1404164173869;
	Mon, 30 Jun 2014 14:36:13 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	p23sm24095463yho.27.2014.06.30.14.36.12 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 14:36:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jun 2014 18:35:55 -0300
Message-Id: <1404164155-12971-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] v4l-utils: Add virtual/libx11 dependency only if X11 is available
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
X-List-Received-Date: Mon, 30 Jun 2014 21:36:13 -0000

In case we are building in a X11-less distro we shouldn't depends on
virtual/libx11.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
index abe9a64..c3a1370 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
@@ -3,7 +3,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
 
-DEPENDS = "jpeg virtual/libx11"
+DEPENDS = "jpeg \
+           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 
 inherit autotools gettext pkgconfig
 
-- 
1.7.10.4


