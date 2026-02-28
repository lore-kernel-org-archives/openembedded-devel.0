Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4114FEE4E5
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:30:58 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116290.1772271058242152982
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DaOAVwk5;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso1490318b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772271057; x=1772875857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mb7RdYve+ZqTsuMyPvdWrrFDFCfnpWsqVV4tu0LN2A0=;
        b=DaOAVwk5h9IEbET95wgN3VyyOk2JygIrer+sxsEPmyxjOCJb8LFQHg3N2a4aoLBRzR
         AATGCR6JpGXNMvHqTGRTfkJLRRMkGreVspPSyIrgY20aDGzk4v57eB50KDkUbuG9kXTW
         3lz04aXj3P3aMsAwdG2s7Z/AQ8nKFbymA9FpE9SVI4Nlx9x7Mzr7kZjy6ly6tvGFJ5bT
         N6MoVG/ZdSjuUjMBVJyiBPXF7miNOaOY7XahVq7Hcn0Gca0hOOJsAjX5v5yqW++nptrc
         mhHaqfwAR6q6z3b2pyGSmnosEKd+HG95DSgmso36Q38un9xtyfIgqYwa7A8PYDBWCg7z
         09NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772271057; x=1772875857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mb7RdYve+ZqTsuMyPvdWrrFDFCfnpWsqVV4tu0LN2A0=;
        b=G2baRvV9SE2RztGCs7JQ/o0GQ/JbfxZgZkaYR17gANqoaiZvvxB0WHO1Fzvg7qFg1j
         RehskKE2KNwWjzvHhOmz7jF3iVGM2V3AEG4hX+ARncVZAC3ONjhX13o8/TS0C2EgTQ4z
         07CtHW50C3Pg9c0sY/U+1Mk64jAy3aFKZuug94Cd1iKArlDwu9jsBv+qm2/lROwSmIc0
         Y2Ie5xDV/JrRqebOVljB73TgIcZl8Sdmk4h7bl34k3txDhIv+fMfGi07zFdzM1c9ijux
         B5T/R3MIxatFX9ws4ilrVNKLFQFjIMxn2f2Yq72+sXDsMaEKa9gCxZ4uxw/XebVam9wB
         cdYw==
X-Gm-Message-State: AOJu0Yw4OnJvH9vxKYcGF/A1gJ8uGLrntjh8nXjO0gt/dFIVO8uZVxm6
	GOql0gYcedmloFQ727Sfjm41RGalLl3TJ3PA/at7/0A11wjT/hiib042kkBgdg==
X-Gm-Gg: ATEYQzyyo/MTBexZYLOrOiYqd3zRidz323d7iiohJUWQBvGQ2CjzoXbZa8IePM8dcpu
	OcTkYS2c8jM1AUxUtzqXrSi5SdLMxTDMkBeVBXeerjqfT1AV9vrIT1I9k31PfWPW2ZOIUDmqjxB
	yc3d22Erb5nFtBqhH3f14sH9JKTa7jwc8Bw1mWkLlUcjYnf3yd8ycYc+eYEB0U51oD+/Nlk6xk0
	cNkk6bKkaHgAxRu3cFgZDMsMX3lEqd75V0Z5UUFInVNINj5JKCE5OhRkqCdVKkaxK2uByZG5/w7
	u/oyPr78zNE8PUMbl7/yLlptqsFWbpoEbypHx+uTP0PYAShzwBzpT60JPNXN1t/yD+hbXH0QWBo
	W6uE+QSfPmAMJ6WtTk08xynO3T1USknuBaURNJ3Zfd1l4YvXT7HHreEj93weeZUQZJhqHOthsx9
	ZBqCbGTLcZ2UUYWxRn42UQKp3CLj9rJZXlsA==
X-Received: by 2002:aa7:9304:0:b0:81b:c2b5:31a with SMTP id d2e1a72fcca58-8274da3a5c6mr5717811b3a.53.1772271057446;
        Sat, 28 Feb 2026 01:30:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8cd91sm6875158b3a.23.2026.02.28.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 01:30:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 2/4] python3-filelock: Upgrade 3.20.1 -> 3.20.2
Date: Sat, 28 Feb 2026 22:30:39 +1300
Message-ID: <20260228093041.816960-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228093041.816960-1-ankur.tyagi85@gmail.com>
References: <20260228093041.816960-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124779

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.20.2:

- Support Unix systems without O_NOFOLLOW
- [pre-commit.ci] pre-commit autoupdate

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8b5e1f5dbf6bfe9dd6725d5dd04cd4c6aff73c86)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-filelock_3.20.1.bb => python3-filelock_3.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.1.bb => python3-filelock_3.20.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
index a499b79c07..75eb16635c 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "b8360948b351b80f420878d8516519a2204b07aefcdcfd24912a5d33127f188c"
+SRC_URI[sha256sum] = "a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64"
 
 BBCLASSEXTEND = "native nativesdk"
 

