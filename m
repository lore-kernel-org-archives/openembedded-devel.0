Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFA7C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:31 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24971.1785872428236182731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b1Nojewc;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1034156a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872428; x=1786477228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOV4Vxzn+44a/aAOFVbRFHiSbpBx6tvKIkaszykZqWI=;
        b=b1NojewcuIa6OtC04C3U+Ne9C0AaqOwhwF4J6hVlCmcnjZfr8oHsPABi+kPoD60uVW
         U8eGdks36QtCKOPbpG9yRTqvO5wI/eA613xMH5w19Pu7pJnFBLiQJIWZmyI4/wFqhcP9
         slS1boSUBSoROrimDcq9xV7tYaARhhuU15ptGfkj2yTaLFGmv30oq6oP/A51dt4NzMOu
         0WSz1LixcEvT5XMa2bmTsv3i6fXKvZYiVvK+1BAXgBX1WcjHgW92EwuLbpN+iNzuUSrv
         vC8rxnjCNQ0trO1W0ZD1MBk3e5y22pCPbupVwZFPhCaapfPleTbjYHoVymf1oUBcCMQj
         uxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872428; x=1786477228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOV4Vxzn+44a/aAOFVbRFHiSbpBx6tvKIkaszykZqWI=;
        b=dCVSLuHJZAhvG++7a2JXI2TgrzRIOp6WDqXmzoBYF23XrFfTu6FdPf4t7GWAYWjvh6
         kVHNDBN7p2f1/ZTh05F1q8uZIYvY7dc7JjlZ1bNb/zMLl0KQlOMSO03y4AGmY/4/9hTR
         D+9YnPhrRLBBvcFYxeNxRdtGaheu0f7nAiHvS8aO44rwpBTqxO4Lp7/8zkknirrjWgTD
         KqlHyYUtIqgriM+9CW7AYrRecxxWS2kkXJsysSZLJuhR6f/NBeYXHpZYi+kJiuW/aaaB
         3qMYlO/76PAvzBcXXtIWIK9sxxmrywE8zDBkOuQ52IHENwwWdeEoATH0JVSDgrDVF/63
         J7EA==
X-Gm-Message-State: AOJu0YyJtDjPHq84vSnoXNGspYexWSiXQqXWPhnpevErpWW5+IGXBe5E
	G/TWu674A2vYoTZoauuzcdcnzwxN2/FkLvPc/Fs4N2xbkQUQm1TwMt3inAoVE+G/
X-Gm-Gg: AR+sD13ykmUl8OSEKhQ0fyetAPZMhYA7s9YmhJWUQNe/N7497/1c/QHp2dHeDbWnGDR
	dEb5/SICeIxRUnneHCLZonfhGZ8TGlka4ciENcuI8zu44wDsORC79COMB2j8KHgQFCYX3ZVGEa4
	iFiseeVenIJKWtW+VYcbMUMdst5+cofFoMouDTGYE3Tm28u9yOjgyCJ0HJjAqsuW+njJ4MJ1rPQ
	knLJqCQnhvIsMIuMee5qoPXlSJEH4Fzaj/8OKiWmnOy7KXXh79zQn2my7xd/Kt7K3Wt4xnN6aZx
	zw/xur078SP0/JoeMS7rjfXjC4wEtkHnD/Vj+PstLZRKoduDQpB18zPWBTe+p8xSLdhLpGeAFgq
	VaeNbKIST1Gv7qVFhRoojDiizg3ps4H7lxd5m3rjjixSKSPWFNVgEb0NtO8LJPU5V1pilmfeM2K
	PWHtRNVPRowXC1n9otXqWXOcysWWeA8dOJIgPvJKas49TVhWKEtPfI8PJ8CSNHRq+FSYyCTapnk
	Q==
X-Received: by 2002:a05:6a20:1605:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3cb6c7b8165mr6524376637.10.1785872427399;
        Tue, 04 Aug 2026 12:40:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 7/36] transmission: upgrade 4.1.1 -> 4.1.3
Date: Wed,  5 Aug 2026 07:39:34 +1200
Message-ID: <20260804194003.3158916-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128754

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/transmission/transmission/releases/tag/4.1.2
https://github.com/transmission/transmission/releases/tag/4.1.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{transmission_4.1.1.bb => transmission_4.1.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/transmission/{transmission_4.1.1.bb => transmission_4.1.3.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
rename to meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
index a4b7856abe..4bbc4ddc41 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.1.3.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
 	file://transmission-daemon \
 "
 
-# Transmission release 4.1.0
-SRCREV = "56442e2929cf4e9e20c8604a229e99fbb352190c"
+# Transmission release 4.1.3
+SRCREV = "838877323facc4cc2b677fe817e203779c437bb1"
 
 
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg

