Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E52E74C47
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 19:10:24 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id u11-v6so15439134plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OUDnim/VJ8VKq79gnuyrVrdCjoAk2MdNMSjBhZAj77c=;
	b=JLuUE0MLwAlBnoVQNYuCMJy7yKXAYbt/RGVNoaGn20Ihb1y4C+wJlkZHZPIEZyTCYM
	G9DVa36e/ML3ChQ8TRIYLOZyweng4AJfxs+1X8DkYeHHkqRp5ptPQ06NXcpbL57xCAdu
	sO49oTkQxdhIrygBLoldRT4f+34bFl5nusjfhyROljTgSLe+GjL1REiUvR1FpmJ3T3c9
	xVL7yvuODqmCwe5rJMmyxTdwoI5KZu/4kdbp/TGvjxuJbiC13a522ul6N5WXiPxKR77l
	jlGufgCp5Vgu3hKzZ2SSquUCW36Y+6KUOUgASId+5LR2ZufQXFDxERlLRq+/JooDqwF3
	DpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OUDnim/VJ8VKq79gnuyrVrdCjoAk2MdNMSjBhZAj77c=;
	b=ts3E5v8TQ/BM4kJtiGlmKzVUmCoPqsd3jbtO+ZJyCM1gXygTGPAOomQJd9qONpAIln
	y+cPIvBtXYXSnGdWNVJGs/XThZyqa0SNCtCbdYd43trVE92FVJ+lFGX0wvQMkceGAmSW
	lUEy5qWlHmThdxvMCBQZEmXtRGM+eD1IM4DCznB/7AsC28mQvUdqL/1nQ+AWzqZmFBw3
	rHpcP67s5+5g73S5npLg1+Y31rcUlua31ENsFgB6sthleQM+8LA8qFVwcl9s6JRyRzHh
	ONPh7MBYWaU1NOhZSEjcKU87X4Pp/fMyRGQcwMeFJjuRUijeFFYMxhn53m1UQpIfK7Ev
	stQQ==
X-Gm-Message-State: AElRT7Gt04yGdroNw/dAAWTTRGwuruevCqXt0hJbUQ10Z01HrZmp/BsA
	TC0h6vZshDwvurhswWOyjyitXg==
X-Google-Smtp-Source: AIpwx4+VFumT5SGtINfePZ5VYco/vAZFvQYYfbXy75vpn90L2fuzptBc6WFPXpRauuchNgtQ6nwq8g==
X-Received: by 10.99.97.143 with SMTP id v137mr12552941pgb.175.1522869025740; 
	Wed, 04 Apr 2018 12:10:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	g9sm10325912pgo.22.2018.04.04.12.10.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 12:10:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2018 12:10:13 -0700
Message-Id: <20180404191013.38136-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <20180404191013.38136-1-raj.khem@gmail.com>
References: <20180404191013.38136-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH V2 2/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Wed, 04 Apr 2018 19:10:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- Drop disabling GI

 recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index e8c0868..c8e8328 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -18,6 +18,14 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
+# https://bugs.webkit.org/show_bug.cgi?id=159880
+# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
+# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
+ARM_INSTRUCTION_SET_armv7a = "thumb"
+ARM_INSTRUCTION_SET_armv7r = "thumb"
+ARM_INSTRUCTION_SET_armv7ve = "thumb"
+
 # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
 # 5.10.meta-qt5.1
 SRC_URI += "\
-- 
2.16.3


