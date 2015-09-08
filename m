Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id E34BF7687B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 14:37:48 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so117676852wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ddzj2jgHuuFdRU4P0wKEgDqLHKv3LjXJuZRX3g4jpnM=;
	b=KlT8UGdnLR9EVlgaiouKLI8U79QcbGoqOpon+XW9U7gw0ZALPmoluRtpLZLYyN5OwY
	pxqaR8UG8ao6EqYSPwWeQosySKRO9uyVt1LWEvzcDNWKRE+AN7dEbv3VB6mJNIR3BoLs
	fccrT107syMtivpkyJs1jh6l2hRM+urXPd0g5Fc+KSe5AenZEjcEYswh1iu8yPAZLHzg
	rcXGitx3xoFbBao5HYynfpJKQhPHEjPcSCEQ2N48Tmxel5sTCRNjMKW61G91s9EbrN9D
	F/U0QJ6T27Q83n2KFkfL2XA3EYVg1pC0utCfNjZNZsttuOOATgA/IjiVjuX7BYn36Bxt
	bhCg==
X-Received: by 10.194.171.129 with SMTP id au1mr49699835wjc.115.1441723068618; 
	Tue, 08 Sep 2015 07:37:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fx2sm6110383wib.24.2015.09.08.07.37.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 07:37:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 16:38:32 +0200
Message-Id: <1441723113-27004-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1441723113-27004-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441723113-27004-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/3] python-efl: upgrade to 1.15.0
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
X-List-Received-Date: Tue, 08 Sep 2015 14:37:50 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/python_efl_1_15_0_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl_1.14.0.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.15.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.14.0.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.15.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl_1.14.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.14.0.bb
deleted file mode 100644
index de86cd3..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.14.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "e90871bb1c9f647e763c480e74bbfcbd"
-SRC_URI[sha256sum] = "0003151b224937d36ef78236398b9a3d6dd39a5692fb1ba4f9c900e65b2ddade"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
new file mode 100644
index 0000000..7abbc32
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "f7c5d557336ea9df69bcca09c420711a"
+SRC_URI[sha256sum] = "11e607b465cb66dafe05c66e02d61e09335b370fe9fd2a74d88282b3ee597bcc"
-- 
2.5.1


