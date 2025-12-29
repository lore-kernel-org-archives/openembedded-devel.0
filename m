Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5664E9272B
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44448.1767019920262560112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdfd7d2F;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so49035035e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019919; x=1767624719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0YGqfzU8h3H6U5n2Q2mBXAqSsy5/iGRsaEB9rO7s44=;
        b=cdfd7d2FXz5JCtUjACpy8Q01aY1ljWWCoVLHdhZ+oW8auff3WSx1w6nR3XZRnmEKmS
         DiQSU2zlH03gy7W7HpNmdPHsWSzam0CE5zxGwl1MF01jox2rY7zLZgISABNuR3UydTWP
         oSTyOcx++Lj0gp1gtN1Q/HcCL6oWiYQjdkhFE8CppHzwsL6B33NIfBoqj4TNOLt8UkVh
         THWrixPicAtbvXbYyJbc7p7BGIjxGmJy2TVkbzhuEOZvFcH9bHrpxtBSx9yyVLNh8lZ4
         i2pbpAJ5KzK9aFOeN4oAUAPA8t6e5czUBnkk0baluB8HO1lwysL8Xn075+f4DCY9eDiY
         G4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019919; x=1767624719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0YGqfzU8h3H6U5n2Q2mBXAqSsy5/iGRsaEB9rO7s44=;
        b=tvBAPdEtqkvekBsYFVQQCQfC7lKb1ZpBsyYfJJ41oDAcLqwRVvnsQSEbCzC1UK9wrr
         E2nl/SmSOhVb0getDchOFKSPbLE6sLN1ObkE/SyyhQFnU9qhDxRJc98DS75FSZR8Nd2V
         xIQaPkM5gnakeucG66haxT7jAV5kO+cy3dnZL5upmCHPLwMdLxiGmWAVdDhJOUpILMvQ
         2AgTr7xVminqUqZkcaLUg5sYFgQ0M+npZg9nazJBc41J80dvCOBG3jHriOE0bXpPEmZV
         vUAgEr3JTHXxr70XzjwQXcLMJ4YKDb4bsna3UildwcZZYRE0a9Bspc5yHy138zznk6aa
         puqA==
X-Gm-Message-State: AOJu0Yx5d/tHGU5L2YSRLPYHB7cBJ3EGr+iDAXdHtU1p0A7t2XkbH0lt
	edMNQOd2T7vvvcDfJ6D2gv8s2O8UIKppvEcN1fEQAKH27SOPMWOu2NXsJtJ5dw==
X-Gm-Gg: AY/fxX7dGRf+NU8VccZD996Ah0kMaMATAEq2LfBLLq0+2noDSIUe5lUifroSl8TSRoU
	gPu5vKV1MH0d5NzYIMCFwv3vivRQmN+6Ji6xvZWquNnQCEZliNWPb1fmuKrYT5gFVx0D7RimNnD
	ZcomOGmCwvzOYsjMxu2tsNpVAPnu7vxTPLq0fIS6AGrjHttH1nTVj/V0fnErRoTVIf9bZG/L0Id
	LWtYI+COTxZCS+hUAwb0zA4vNgvYTSyiri3w9BP+8DVvV05h234rDMnm8T/6SCJul/kbtxcrws4
	brUOvs8HcguN4W3h1+imwEGh7tCdp54O0JhsKyOznQNBXbjUuUln1QqbWqWh4PKBwB4C9ZD13Of
	8yzhSCl3SQLTtZ9a23PufmQc7usoPvrTwgYSHqe4IF0PH7THn6TMoPsoxd26nvxN+7/9r1oOKT8
	jIO5fLIb9k
X-Google-Smtp-Source: AGHT+IHzAt3MC/dbuG/hlZloN/KNJNsxXkdkAy1Vd88jyiS9QKk5qszyrqj3es7sVhb6QuTrOOJGMw==
X-Received: by 2002:a05:600c:c83:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47d19555940mr370016425e9.16.1767019918542;
        Mon, 29 Dec 2025 06:51:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 09/11] tigervnc: ignore CVE-2023-6377
Date: Mon, 29 Dec 2025 15:51:50 +0100
Message-ID: <20251229145152.489068-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122988

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6377

TigerVNC compiles its own xserver, this is why this CVE is associated
with it - despite the vulnerability being in xserver.

The vulnerability was fixed by [1] (from the nvd report), which has been
backported[2] to the xserver version used by the recipe - so ignore the
CVE, since it's patched already.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/a7bda3080d2b44eae668cdcec7a93095385b9652

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f691f2178b15eec22f09a1c17b9945fad4e330e6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 0adaf70b98..4455050631 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -87,3 +87,4 @@ FILES:${PN} += " \
 SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
+CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

