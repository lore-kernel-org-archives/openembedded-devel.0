Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34356.1794851745753002633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=x58Qxncv;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380b40312e2so1303630eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851745; x=1795456545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P+TuspcKgZGiIk01ATpj1dQ2wO50/wsVvkZGa+6fLI=;
        b=x58QxncvKItv9X4WQPiGXU94dwvLyXqa3AoB9JVpW2lq1sP/ed0Xu4ZKhowzcawhUV
         wGQ90jNA/1LEMPf+rTLNawoAMwdYINJyPbmWfl91he0MAxvsL5yAcl3wP8XV/E+xQgWa
         1RDHnOTb82NapM8mxYAlL/IgovZVI+xY+QeB1j/WquB6o0/TdxLs2BwxYcAv0WX9Y0jJ
         1LKtZLrp+2fuE4cTzZECArTn2wLpnS1Q/3YuwO3jUyaWTqFx7MvSmZIM+lFm5EqWGgrQ
         /A5uXCoL0iIe5mxMNtrbd2kY3lL8MjpGyR8TnrXHgS2lD16IMkLC5UvoASUpiT9ccral
         D0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851745; x=1795456545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3P+TuspcKgZGiIk01ATpj1dQ2wO50/wsVvkZGa+6fLI=;
        b=eCCBqBEk+bBHojW5GQNu4pbeneHBwmUhlj+oNKTZWGSg8tBhgjD6ZgjlilyfsG1rh4
         2HpdpxfBBh9TaJDlbB8dZSbb1ln+K/80UI1Mdn2scx/0HUOp0j0dnce6sfKg4L5hUFHw
         UzXGvDDDGYpO/r6lEC5LpYVSNFpzKw3kVTJYdAi0Gbe67U0wcMV4qwpSin3xg9cI2flB
         8yVUe5VhH4CUYtjtRR3rsCVMrlrIl2GLWNYwLnMt122w1e8fd2BCfxgfY/X7BKglzy0S
         RHOO13HTnUDvhZ/2OpULXrsaF0AORkmhpy+f2SdinIooPw+aU7t6IzzcW15CqXOPAWuN
         Irlg==
X-Gm-Message-State: APuU4Z+753tPth4MEUZQaqco3aciNf60QLRzNvECSuhIHgBPm/2m0eBn
	nUW3RG6PPqY3/drSo6CSsKGG0cMoqFg47ENlqo2C7uztbzX3UMKcUos7PO5lnPcz
X-Gm-Gg: AYBFou23MKa1DkLsXu7WDJvYVQRdf9MAGiuWpMWaDjG16l7OeSFlOFNI2us0Bkomo1y
	mW5xdn9mqfEmcKCLUxSwKslKt6yo0UxJ/SyUzanXeVowEIw4zU4c8BLWE50js8bzg5W5kCM5ljI
	kPBkacqCwXeqUUl0nq88LtgHAdafOdyQHSEbhuktj0a2l+B0YQgLb5Rnc1UG+dp+YDvq0mW8BbB
	a2c9nWEIfRjyhRWMFY2XnfdZD6ulcJoMAlI/ixs/0/mUTcQvhcaWKChjJR4HWjvJ0mTKRgH4JFy
	EbKxju5Ig/cLVIcz+NRrGBeFY6SbhluWxDUTOarKHaAl6hzhstGS9/WgVdRq/gMwRkFggfG9lvi
	3UXJHJeTLn11WuZcDsH1+AG3G46DaEQJQiR/0U6aO3JpPHHVDuoFwZNsFwWk8KBaj+UsmUHNXZU
	KUzNRmKO5hSEGoLiYhptfi4hw0RjRlOKfWhFX7XsYbaKe/P9VoOWPy8pReiwyjJgGr62NqUx5Yr
	wnerwQBIG6XKwMOAU/wcwZlvgUdUvoiiawNOgl6gpHFYw8kSibnw4zpEEA7957AgC131j0CvdFv
	MhIspMu2NS0IZLhcN7kll+Wuaj8xDfntDREJvxTrUYVl4b+yuE74zCuMlTqsCLsJkn5FNYFRDwl
	2HZk1whM5rHl1ZD4f+jbauxuayy3fILKWqICqZTo/HmGnnSXrQwgeTkC8Dw88oPvXj3vy9wZ72F
	SZw+JTImVUFItI+Qy90Pu8Qu+Tn6etbiH+OPU93pOhCllnWbScV1X3n/tDdo8ZrS/PM2P51SDLm
	3nFJigxGtXZ2KZl54mBf1gF4qd3DBGDIMJsCVYXbKh6/YluT3u50WD3SOjbEEI/02gG7wPzLiXI
	7D5uHTnjzlxC+D4+w5BWvGPIDw==
X-Received: by 2002:a05:7022:7f0a:b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1b503151b73mr13679206c88.26.1794851744993;
        Mon, 16 Nov 2026 09:55:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 075/105] python3-pytest-lazy-fixtures: upgrade 1.1.4 -> 1.4.1
Date: Mon, 16 Nov 2026 09:53:27 -0800
Message-ID: <20261116175359.342679-75-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132531
Content-Type: text/plain; charset="utf-8"

Upstream moved from poetry-core to hatchling; inherit python_hatchling.

Changes:
- 1.4.0: add support for implicit lazy fixture injection.
- 1.3.0: add pytest-deadfixtures support.
- Fixes: nested fixtures collection, collect_fixtures, replacing the
  same object, fixture classes, NameError on Python 3.14 for
  TYPE_CHECKING-only annotations.
- Project migrated to uv (1.2.0).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ixtures_1.1.4.bb => python3-pytest-lazy-fixtures_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-lazy-fixtures_1.1.4.bb => python3-pytest-lazy-fixtures_1.4.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.4.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.4.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.4.bb
rename to meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.4.1.bb
index 9cac9b8552..f4bcfbea97 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.4.1.bb
@@ -12,8 +12,8 @@ HOMEPAGE = "https://github.com/dev-petrov/pytest-lazy-fixtures"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4475e66fcfabe27395e6764c8f69c876"
 
-SRC_URI[sha256sum] = "c494b52d798890033d64b28687a4d52807c8b0f606d56316e139df0cbe116c57"
+SRC_URI[sha256sum] = "8684abfd4914ea01f1e2f7b24524739344421d8f3f12286fb3100fb5681e1181"
 
-inherit pypi python_poetry_core
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "python3-pytest"
