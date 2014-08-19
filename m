Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id A806565DD6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 15:51:32 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so6656695wes.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=APL9AUz4gPyNol7gkW4eFRaGWoo7X5+H6zF2emV9s1A=;
	b=IhtFHSuuhkJfFSdlves/xr5v+sv5qiItYiEyTr/n7HYQDHn2spmmCzsB5KanWNKYbs
	3JeJTy1ei+NgvjWwTPD5bRAKhnp3KZJ7SM1wZmoCwzMBlC4o2l6SE7W+Fax9vPufZmH/
	u9FRUFzGUrvpwtKwZhf8z2BzfvXvGKZZIMz3b1i+AyUcELAvj6202Ejf4OLyXn6FnvMP
	L0hRc0KigC6Vqw3S7P1gjo8P3ryBzk2oAeZ5KYRrKtOfK3BS162D4+3G0sU4vaIcBdEF
	Lx+u70JNsNpxJ5gxsRUqVlAQcB4AwYREWFfCIsszTwXhKyNiSdYOKJREWFqTiffwTlW1
	IhfQ==
X-Received: by 10.195.13.79 with SMTP id ew15mr49117578wjd.19.1408463493328;
	Tue, 19 Aug 2014 08:51:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k6sm51369785wjq.5.2014.08.19.08.51.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 08:51:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Aug 2014 17:51:30 +0200
Message-Id: <1408463490-16134-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1408463490-16134-1-git-send-email-Martin.Jansa@gmail.com>
References: <1408463490-16134-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] python-efl: upgrade to 1.10.1
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
X-List-Received-Date: Tue, 19 Aug 2014 15:51:38 -0000

= Changes since 1.10.0 =

Kai Huuhko (7):

  - warnings--
  - Documentation: warnings--
  - Elementary.multibuttonentry: Inject a Python object to created items
  - Elementary.entry: Fix ref leak in filter callback handling.
  - Elementary: Fix object item tooltips
  - Fix build from tarball with Cython installed
  - Bump version number for release 1.10.1

davemds (1):
  - Fix emotion.__repr__ function

godfath3r (1):
  - doc: add cleanup command in INSTALL file.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl_1.10.0.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.10.1.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.10.0.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.10.1.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl_1.10.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.10.0.bb
deleted file mode 100644
index 43f0e0a..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.10.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "46166e51bdbab4f2fa790dee98b1ccf5"
-SRC_URI[sha256sum] = "b144e976a351cd9703771b5e91a45ce9b2eedcc0097ade5c5437554b1516dbc6"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.10.1.bb b/meta-efl/recipes-devtools/python/python-efl_1.10.1.bb
new file mode 100644
index 0000000..2f7d3ed
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.10.1.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "1cc68d6cd77d9d20d07c91188d523a9a"
+SRC_URI[sha256sum] = "a6c803bdd205e08c2d1e3199abd095552bc7ca4be6faafaf3b3f6db1d78c80ef"
-- 
2.0.4


