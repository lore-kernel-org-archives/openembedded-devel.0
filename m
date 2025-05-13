Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACA3C3ABDA
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 20:04:14 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.86193.1747166649345108772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 13:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5UeC7nh;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7387d4a336so5164327276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747166648; x=1747771448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3GLNUHuhsHgfATV3Bq223oERY+R+EQTyTacZGmyBNE=;
        b=b5UeC7nhzfZ6RL9bmc06i7+nAYqNAA3ZZRdbjjONoNz2OesCrHBVZx+iALLC9cEl0i
         eHymb0hr7ss5e1zo2IRcNmS/wF0d3VFGpaPlO+ESe89kRAj1F9/eRMpC9gAr2BQ9K9MA
         RoxDvcYGeRCYb/dy0NAvHYnn8qrJpvjVnoen/SEoqD0XZy1AY21urJSZtN2BqERZGjwN
         vX8yiIUsilHynKH+9bbDKEBJcCiktrYTswA4BdNtzlNGbRDxUzK+AhM3mEKx1aPzTUvZ
         p4vFUhD68EPoP+vOaO+3bv4XdQm2/MMGyMdc0jsd7T2sYhazKKciFRbX249zB2jINP+W
         W11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747166648; x=1747771448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3GLNUHuhsHgfATV3Bq223oERY+R+EQTyTacZGmyBNE=;
        b=r13jfGZL8HLviU0bnG4IyBv36nXxQYMCKJ5CyyhPuqAXSjZpzSjDViqyWGroLP0M+Q
         DQuamZgO0PLmoPtT1zxrmGeNLNwXLcmZ2WQyIDD4WZWsF85z1d5sBVIwB0gesoKbfoqd
         l6+izNTvzZhHsifu3viSc61mCsBXOxkcU5yMjtT7CCS5TOxVjv/Geta6J/zlfGgnggnz
         KVGlaYrzosbJX1nRdIH4BXabnYoHQC8xLrB/hynw3Opn4yjDRt8PShPo6psZ/zeSdjL4
         F6iKKkrd2Q9IZCCDQY2LxSDJ00N2Q5PUcIRU4oIwocvepwVgbROY8NQIyBoT9eZY8wc3
         yzJQ==
X-Gm-Message-State: AOJu0YyxHMCrqV8j5JRnGqh+awvo7uNe/7QOvYJT/UE15MPQ0qaq7scM
	stdxvPyfElQlkv82DvqyWr6fos1buWx44bkEIGhHa5uKNMR3y97oQIDhcSch
X-Gm-Gg: ASbGncuG4hziyqqyLkgDLQ3pIKfA9BpS4Tz+ZQPOAYW6VWIZ0HCD6Bd9DMGeD4GDeI3
	VN+SpYN4LwFWHX5VSMGnz7LDaQMVOkh1ZmVGee6sComtqiE9GlKGFRT2k5A2zH5LP3uOZm5SV60
	88aVPqofLDr5S0gAdrIozoH/j97RIDCtX+AeN6/QyhGVPVyUlLnvcpq64HtHAoJtZNEBh8+7ZXP
	WXYnFUJOHeLCgbU40z1OPnto/I/gdl2HxfR+fsdo2W7MfcypO4V79scwUQZ9qLuFPnAcO2Z7NSO
	cYC/lhUQ/GXSTMmiAEwmCqaN5YKLDxKgY0Tf1uOfXMzChsdoQ0AS5ZP9OOrBRRSCzw==
X-Google-Smtp-Source: AGHT+IHGtISNgoYH3chjylEAUOBlT/ywngnHE3Q1ANUPnp6UUN/J53RJfn7xlu5gcb3ANuJtRJZZlA==
X-Received: by 2002:a05:6902:2782:b0:e75:b8c6:b320 with SMTP id 3f1490d57ef6-e7b3d4d81e9mr862255276.17.1747166648470;
        Tue, 13 May 2025 13:04:08 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:6ade:98e4:ba03:461d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7ab5fb741asm1513944276.21.2025.05.13.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:04:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 3/5] catch2: upgrade 3.8.0 -> 3.8.1
Date: Tue, 13 May 2025 14:04:04 -0600
Message-ID: <20250513200406.26830-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513200406.26830-1-akuster808@gmail.com>
References: <20250513200406.26830-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 20:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117403

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/catchorg/Catch2/releases/tag/v3.8.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4e54d20446c509c35d030bd411a767fae8f36c3d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-test/catch2/{catch2_3.8.0.bb => catch2_3.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.8.0.bb => catch2_3.8.1.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.0.bb b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.8.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.8.1.bb
index dd7ec5469a..f106b39de4 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.8.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
-SRCREV = "914aeecfe23b1e16af6ea675a4fb5dbd5a5b8d0a"
+SRCREV = "2b60af89e23d28eefc081bc930831ee9d45ea58b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


