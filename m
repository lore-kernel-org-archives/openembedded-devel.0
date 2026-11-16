Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22792.1794814547310467775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rS+sEeX5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so34543755e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814545; x=1795419345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxyZGa/gkI0bEWSMys2Q5UGXbtUCRmfsm5UG7NtQ8kQ=;
        b=rS+sEeX5et/9aZTAsH2hC9iw7GfUrOY5e/iDuDIx9zwKfpVWBG86GvDbSX9PxHNP4g
         2n1r+7660nS9/+7VuRZiNNd4xCxNnspo0K93Sj7AXoFKsN9I7OkaDyBK2u+VjB1nuww8
         LLaxgxbHFThbfaGOcrW4fFPdybSo+xWjawzFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814545; x=1795419345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxyZGa/gkI0bEWSMys2Q5UGXbtUCRmfsm5UG7NtQ8kQ=;
        b=ZXF5pC23kY6JK7eVEVCerV5zKSkEF7JhdTDDhVHY6BjtJkD11FBtXb6JdqFS56SnaL
         RtHt9XkOpAxLMiAwncNCEYLMwBlHI7CFfRJlEjFWGVxffSfQaxjKj5lLP/9aUSlMEeYj
         4Tg2iKxzd1P73DbGiaElnfxAwsG4Z6fujpy5YF2zhm6Qbfq42Hy19uW/RwaPc9oeV0c/
         QK1ISqMt+5ecccEI3N4Ouf4to2YTU66DYCncY0/u13m42poN0bKRXadMuR0IZBp5ppuM
         CD0i8H0UXVxeATATriHU1ABQB69PJRz5LzOKsXQgNUPI6o3rniKB5UqJHqyNuDXwgcvE
         Y/Tg==
X-Gm-Message-State: APuU4Z9T5Ta6OIZHKadN1OYmUpCi3HFQI8LRPy79BtPkHSr46O2Gud0t
	W6SUofwMaDlH+OGg/qtVe2yygS970ffnNpvMUgUPnXy+GsALYfnaEs0tC9/l8nbT4YEbYzT9kyq
	W93D/
X-Gm-Gg: AYBFou1S5oFBLQCyudq8o5gO1xFDC3FqQnITd2X9T21YeE8Sj8hlS5ZkhWiJus8vUKK
	IWKCQIE0SasFffF1CJ14Ng0mDZtw/ga5p6fQlVez1Vi9TaM01zVu1UqhKV0d1Hq4raSC96YrHnm
	F/2bBNr+roFCCwtkwFFEBL2ikPgksp5tRO6sJ0MbBHdM26iVvWNkW0FArLSJCygFJ5H5vQQDuIj
	1b8r+msqzPjgD5AETz+ScpRNFIW4Rjv29Lf61j1nyKsFyerP8nIXW+AXMnK0DEJDFJC8RGkeY5P
	P25t5xhiAxczE5rOPIk74XG1NdcdlBm6JHGot6pIKS1PCbFr62exvvkjMNRxusZ8gUt2W0o1rk9
	JjRufRc2SFP9gZnqmPbc8vkQ/58+6YviVzouRJpMhnPEZCMGAl+/GP1D4o3LkVH3F/SO3LFgkh6
	oQMoRkpoETqDiEyUSB/xdeLP9FVeBCi52DMgCF+9x/8cjy8gCINrkW7jQZIYyD2I7yRL5dzW5oM
	LDWzWuBaqTSBYEpUaKMO2J5W2alMP0NFotA+Ue/kxWyYnJy9pvO8tWvQ8urVLc8D4PcraxyKoc0
	XmXL61FPWdZ1qAmoR4U6wnieS6ykPxfP7W2uvTTbE03wXORlo8UU4/SXGBcYG7oFDUso6BW9rze
	6e7dTZxX1U/Wp1mr1RDUyJ2advAurkqosc/ZRqwLPTqYyVuwYvnfUyg==
X-Received: by 2002:a05:600c:3b9d:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb5dbfb103mr184815725e9.9.1794814545635;
        Sun, 15 Nov 2026 23:35:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/24] python3-pytest-asyncio: Upgrade 1.4.1.post1 -> 1.5.0
Date: Mon, 16 Nov 2026 09:35:20 +0200
Message-ID: <20261116073532.880420-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132441
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.5.0:

Added:

- A fixture-scope value for asyncio_default_fixture_loop_scope.
  With it, an asynchronous fixture without loop_scope uses its
  scope as its loop scope. This is the behavior of an unset option
  in pytest-asyncio 1.x.

Fixed:

- Invalid arguments to the asyncio marker, including an invalid
  loop_scope, are reported with a message that names the test
  instead of a traceback.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t-asyncio_1.4.1.post1.bb => python3-pytest-asyncio_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_1.4.1.post1.bb => python3-pytest-asyncio_1.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.post1.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.post1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_1.5.0.bb
index 21d5d5f669..513e707321 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "f582d9ea4a1c082195abe8bd29a1fe106aeb1cd435e3dad2d3bc2749935c36a2"
+SRC_URI[sha256sum] = "92c8fa83ca419fd0d4bd6a34df6520dae435841d3733c319343249492adf37f7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

