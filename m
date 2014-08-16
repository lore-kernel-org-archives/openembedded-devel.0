Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 875E4601A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 13:12:09 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id el20so3147809lab.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dA7sSZAIL77+T+A8kj9uuBmw410shPfP015CMnXVK7s=;
	b=vVo+pODXk+c3ikYA1KJ6LfDeyHjNzimA9PAgBMyE+mIutwo9IBgwc1Q1TmzOBTiqa9
	WVGiDvmzhxfMURxDkTXGbfSTJ9KgnChXe/tBRziT51ISYRUltQkATZqeEFlL7231Y3cL
	4Uyxjk9UVxuLa29QY+p1pMlRSH/jMeBgdDrtTQxhs3d9zIhUKaBvrqnV3u6cSPbgIJDH
	WGWEpb9CaSxFKE/a1NlTLMqPQFBgDsm4/RmG907dlDwPe1z/GfnJSmQxywn8NyShE+8l
	HLiS4BJV1Gb43g01JDXkD3+fqsiBk3hojtjQISTkNDW9zfhAW1zDX9vkHZRPETmPTgBi
	pjKg==
X-Received: by 10.112.235.199 with SMTP id uo7mr16972833lbc.50.1408194730064; 
	Sat, 16 Aug 2014 06:12:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xa4sm17484613lbb.36.2014.08.16.06.12.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 06:12:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Aug 2014 15:12:45 +0200
Message-Id: <1408194766-23394-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-efl][WIP][PATCH 1/2] e-wm: upgrade to 0.18.8
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
X-List-Received-Date: Sat, 16 Aug 2014 13:12:11 -0000

Changes since 0.18.7:
* screenshot now displays a helpful error message when it fails
* efm no longer sometimes shows files from other directories
* efm no longer sometimes shows blank filenames
* fix syscon button signals
* fix winlist scrolling
* fix systray appindicator deletion
* fix systray appindicator icon loading

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.18.7.bb => e-wm_0.18.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.18.7.bb => e-wm_0.18.8.bb} (77%)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
similarity index 77%
rename from meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
index 929abf6..0d65ca0 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     file://0001-Fix-incorrect-message-type.patch \
 "
 
-SRC_URI[md5sum] = "499b92ef38347881c72729f1e066eb20"
-SRC_URI[sha256sum] = "1b05a1d986643a6603b1c20ac87b6864325d0aea22a3d1d096f4063b4fba2f4d"
+SRC_URI[md5sum] = "79c9f524e1d0510061c62c4b038a8ece"
+SRC_URI[sha256sum] = "14c9bde4334d2f8b0776c6113d02b923ab159eea1cbf7013489e4f3bf37a51bb"
 
 do_configure_prepend() {
     sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
-- 
2.0.4


