Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 86E2E71A74
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:55 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id w14-v6so6607068plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tYuLdpXHCwqz9GkA7VFwCdw2nq8ySZG2un2NZaTOJis=;
	b=BqpeWLdiREwoOT5nj7jPwYmLc6b+X70A6HMI1E4WgWgg1bXNf1Zk1mGPq+XN0KnNJ9
	BKOsl5xmsfBdktstYzm0chq77XvN05vnCnuC4F9KKu6rPnrITXrWOmHD2C9u1kQUrUvj
	qe+6ABsgs8GauJjY95BG266QOmGZyvnzJosq3UmRZfGUa8biWZy2hn9WyYfQN4XQm6qM
	imVNBnOrHNMSV1/R9/xNhfnCzmd+9h1Ut4m1kT/hAwbX/Ab8xS2ohz2OazlrcAXE8fIq
	ZV7YKasmPTSwXaEoZoCXyqNaAqMXbH6e1DIopFQWw0eqTj10ISp6nNOCzt8GiNc4mecO
	leoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tYuLdpXHCwqz9GkA7VFwCdw2nq8ySZG2un2NZaTOJis=;
	b=ShueR0iSdK6usdG/PBx8wyhOaRBh++Gh46QJ/xmMTlwQeK+7cwnCm/Inzo+pGzU5GQ
	qqL9b9bdP38psvjbEIcrOTRoElhONSs8JrU8/eSuSjH0XIBayufgfHvOM/dMvW+u2SEO
	pN002dQJ8+w5Tn5Fe56YjaZk9oQ+nGv2r33XaiuCHvGirwiTNyK4RI6Unq2zrQVSUjP+
	SkW7XxBRnE1ymPTXhEXPtcIiUTwC6j+Lxuyb0KSM5ta+nk/fploopjMck6NmokCJrl7N
	gS7Zw7JBHHtry96X/4e2a5icGC15ayKwxC2Mnfb6gUHwY2lb9lHsYbK7PCJpmPk6As29
	IIMg==
X-Gm-Message-State: AOUpUlHE2XGllSDEdCdW8j7cjKO/fMeq7lFzd3REWm7Pqig1NfrEedYN
	SBuWDNJuOqiZwtGP+SPnKax8UEOv
X-Google-Smtp-Source: AA+uWPx7a1Kgt9aM97v9WyDE3myycCvuaDKL9/c/lBAT7FtnLwX5SydRSq59WoEWxBOF6l13RqOmmA==
X-Received: by 2002:a17:902:6907:: with SMTP id
	j7-v6mr15750647plk.323.1534148276110; 
	Mon, 13 Aug 2018 01:17:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:25 -0700
Message-Id: <20180813081742.6961-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/21] eject: Fix build with glibc 2.28+
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
X-List-Received-Date: Mon, 13 Aug 2018 08:17:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-sys-sysmacros.h-for-major-minor.patch | 27 +++++++++++++++++++
 meta-oe/recipes-support/eject/eject_2.1.5.bb  |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/eject/eject/0001-eject-Include-sys-sysmacros.h-for-major-minor.patch

diff --git a/meta-oe/recipes-support/eject/eject/0001-eject-Include-sys-sysmacros.h-for-major-minor.patch b/meta-oe/recipes-support/eject/eject/0001-eject-Include-sys-sysmacros.h-for-major-minor.patch
new file mode 100644
index 0000000000..055128706c
--- /dev/null
+++ b/meta-oe/recipes-support/eject/eject/0001-eject-Include-sys-sysmacros.h-for-major-minor.patch
@@ -0,0 +1,27 @@
+From 433ffb21119a0f39e882dd3fea4742e64aadcc40 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 09:56:40 -0700
+Subject: [PATCH] eject: Include sys/sysmacros.h for major/minor
+
+Fixes
+arm-bec-linux-gnueabi/gcc/arm-bec-linux-gnueabi/8.2.0/ld: eject.o: in function `GetMajorMinor':
+/usr/src/debug/eject/2.1.5-r1/eject-2.1.5/../../../../../../../workspace/sources/eject/eject.c:866: undefined reference to `major'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ eject.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/eject.c b/eject.c
+index 47e09fe..b171218 100644
+--- a/eject.c
++++ b/eject.c
+@@ -54,6 +54,7 @@
+ #include <sys/wait.h>
+ #include <sys/mtio.h>
+ #include <sys/mount.h>
++#include <sys/sysmacros.h>
+ 
+ #if defined(__linux__)
+ #include <linux/version.h>
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 49a3d74f6f..dec2e7ab4c 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -10,7 +10,8 @@ SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
            file://eject-2.1.1-verbose.patch \
            file://eject-2.1.5-spaces.patch \
            file://eject-timeout.patch \
-"
+           file://0001-eject-Include-sys-sysmacros.h-for-major-minor.patch \
+           "
 
 SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
 SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
-- 
2.18.0


