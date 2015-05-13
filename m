Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A44287406F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 15:34:02 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so13745885wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jin4HvQyPmEN2bPkQwcBPJOkANSgwRPr45GKzLcGWcg=;
	b=G4XYA9/g/lqebemDLD5TLco2FUgHK7FgqTPTKSCgQR9KPxG5nDzVgCnp095Eaat43B
	wgr1Pq8LfOGhPm7cHBg64cBrTeJhw5U1sNO4PKkO0LzlFOR7X8ntIDpyqMPDUw9GlAqA
	ODvCLp0UCZXKRdVCeIK0EVCC2zm+jL9EIIRQU37P75ihS3y6wT7cQeW7JLwgklHVccxL
	7g3E+GsPBWYjBbOKAXAk0YiMC8WcpQzL2Lq9US2E9hXEr3EBsR0U7h80zllxemohkmNA
	We5sTft6VASmfPdAJGF3ry9xXuZNapBxlRnsCuaNLrXnj+35faKplu96BHGKIq3JsjdR
	N/9g==
X-Received: by 10.180.99.231 with SMTP id et7mr40569123wib.23.1431531243411;
	Wed, 13 May 2015 08:34:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id qs2sm6148823wjc.31.2015.05.13.08.34.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 08:34:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2015 17:34:06 +0200
Message-Id: <1431531246-27655-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1431531246-27655-1-git-send-email-Martin.Jansa@gmail.com>
References: <1431531246-27655-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/3] python-efl: upgrade to 1.14.0
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
X-List-Received-Date: Wed, 13 May 2015 15:34:03 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/python_efl_1_14_0_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl_1.13.0.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.14.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.13.0.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.14.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl_1.13.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.13.0.bb
deleted file mode 100644
index ef9f80b..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.13.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "98b1ca3e0feeecf8b993f9c415ff22e5"
-SRC_URI[sha256sum] = "16b8234ee763fab27071e7d708accbdb0cd43eecdfdb08775853bf380e558f8d"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.14.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.14.0.bb
new file mode 100644
index 0000000..de86cd3
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.14.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "e90871bb1c9f647e763c480e74bbfcbd"
+SRC_URI[sha256sum] = "0003151b224937d36ef78236398b9a3d6dd39a5692fb1ba4f9c900e65b2ddade"
-- 
2.4.0


