Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B95E777E91
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:32 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id q86so4249246pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BNrg951i67z8FX0KTg6MKw/08eadrQLDuRPJe2aC24I=;
	b=PtRkQwA0BBcORpHa1rvLhnXoMaX2rN8fcgrBQ/WCrUjFcZh8dGb/sX+La+d08MAI9q
	GqwvBCQr/KreVDZgfn9TzqRWDvIL1+eHnWlkhbf5L/ncrOSa3nyTRxKSz4h9nlEWPF5o
	tuJMcY0ZJzfY3AboVf+CT3gsUXVmdOGh15/8aUSTNACfdJlleMXuitW7skTmrUpfJV8O
	9r9yJy8sjqARah9e0awAS149V65V47JNnd9b6wy7nsGm7O32PP0bbg2+7JKbbLBGbCVY
	UURV3ctIklwGxGweEeRlzv5yCWKdYmwvLenAYgveNeey2m3wEU1yadt2Ale0w+EWk1Wh
	Ln3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BNrg951i67z8FX0KTg6MKw/08eadrQLDuRPJe2aC24I=;
	b=D9Gbln364BHoD7VuNQL8My9Oe85SlgbodcMWMZy6y4HE9KJgLSeCg7y338JJLV/qok
	v5Q4dc3phOCnpOS9X/KyuIp2tCb3k4rac1DCg8SUAXSnl2qiFdpCC6rVDiKp6dV+4D4i
	hSxnG8GZGpaaQAfh1sdesyQczrExYdqkafjdLE/t9M4x8o5FEiMBSZsRFeR9L4T3r8Sf
	c14SBEpjs3eoaMw00cqHo+LK5g99QZUAIT6SE7egVGhbm/6ewF42FZafm5+0T/ZeGVkz
	8VtUOYN5viuCp3A9VQYgzsr4XhmMAXRVmfokl9LnzJLrabFLmzFp0wkAytb+BCB7Uh0s
	7W0g==
X-Gm-Message-State: AIVw111rJLHxXpglFXyhRK8ZYLcJkCF8KUQazjm39NI0pCiYea296uCI
	jUrLm5Spbo6Tdxzf
X-Received: by 10.99.54.205 with SMTP id d196mr781927pga.79.1500347433701;
	Mon, 17 Jul 2017 20:10:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:03 -0700
Message-Id: <20170718031013.44536-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/17] zlog: Fix build on 64bit targets and musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-pthread_t-to-unsigned-long-instead-of-u.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/zlog/zlog_git.bb          |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch

diff --git a/meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch b/meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch
new file mode 100644
index 000000000..71a989103
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch
@@ -0,0 +1,32 @@
+From b97f62fdf3b78eb5cfcb3a1b12c6fd62f735717b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 09:29:33 -0700
+Subject: [PATCH] event.c: Cast pthread_t to unsigned long instead of unsigned
+ int
+
+On 64bit machines it ends up in errors
+
+event.c:85:67: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+  a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "0x%x", (unsigned int)a_event->tid);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/event.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/event.c b/src/event.c
+index 8f988b5..c632c33 100644
+--- a/src/event.c
++++ b/src/event.c
+@@ -82,7 +82,7 @@ zlog_event_t *zlog_event_new(int time_cache_count)
+ 	a_event->tid = pthread_self();
+ 
+ 	a_event->tid_str_len = sprintf(a_event->tid_str, "%lu", (unsigned long)a_event->tid);
+-	a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "0x%x", (unsigned int)a_event->tid);
++	a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "0x%lu", (unsigned long)a_event->tid);
+ 
+ 	//zlog_event_profile(a_event, ZC_DEBUG);
+ 	return a_event;
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-extended/zlog/zlog_git.bb b/meta-oe/recipes-extended/zlog/zlog_git.bb
index 51c746fd3..86e6d30e2 100644
--- a/meta-oe/recipes-extended/zlog/zlog_git.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PV = "1.2.12+git${SRCPV}"
 
 SRCREV = "13904dab2878aa2654d0c20fb8600a3dc5f2dd68"
-SRC_URI = "git://github.com/HardySimpson/zlog"
+SRC_URI = "git://github.com/HardySimpson/zlog \
+           file://0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.13.3


