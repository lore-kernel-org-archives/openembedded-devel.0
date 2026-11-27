Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8078.1795739708861826551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K4fzLKco;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so4103500eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739708; x=1796344508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn6JLp1we4MzX8IeBLzqZKV/G+t2lt201057yytgtqs=;
        b=K4fzLKcoevaS/pduThYwWvTNSrrLih7eGy3copQhLe1moKnGUnUv6MjnjzCMvnip9f
         AzU14rF8BVDw36Q+KVDmR5BiTaGE7wvyj1NIDnBrsV5468PjG0gCTqgSVYsgljebY08Q
         lEd5CAgiuYGhsSlKR1hB2T0hZwtGT4VbvsFTinOG75ltdbzvXx1RkcUbvI+U+1eypRhC
         Jz1L6oXdBff5LpauTsPTvYPyvzHT1dGlXQbsgfHe/T7/TaYDw4/vpF02fpdQYqTKEj/d
         RpDX+HdIERIz0czLWg4LYVIzetltmKspj1Nrf/DRMcLK/CSDbFMtz4b8rzaBgHhjpJIN
         3Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739708; x=1796344508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cn6JLp1we4MzX8IeBLzqZKV/G+t2lt201057yytgtqs=;
        b=OCRvJChlzYZFs7Jkma5YxMi2lmVfypJ6FLBFWi89XHYIKz845IMHN2atZcBxLBVRe6
         UN5vPHfUGuTCDm3GuvXAGreA6mOB4SdVOR7P3lOf6Ks7nWkV4VJJMMXfL8zfonpQ8TU6
         ewExwnamqhYGZZpooa2pZCojtg+KHX5TK4A8DUqVGjbFTEuAc+N+23aItXy/pR0gYodK
         vjcXdJovLPNJ2HgtLiMhX+DfqIbdXfgPLG6WM04LXBp47HL5s4jCTOesYCjZ4IBAdBN0
         PnUrOVeRjNw86NgftQBXlmifEgXv4H8yIwR4ARc7xA9RzV5nPt7zt56y0ahZA9TssSHd
         SC0w==
X-Gm-Message-State: APuU4Z8DFVU/P9ITNHlO51nGp0gavfQhNaQVC4FqMCv8Izu8U7w5SvZP
	CqoowppkvpfvaTZP1Xd97jRoIO/w6mGHARCVzZai9r3H1Y5cIa2vDK1e6oeTRv0l
X-Gm-Gg: AZFdTZfWWqu6GoG4oXuJViXWei3kl+gWkQzbcsUAulvZXO0vBxCHaboF2W+Lw5Elk9W
	chmTAT9Idj6PfTh1KdahYDwJPH4OBckBiKHE3H0UPzjP1o+ESqQtu71KROGN5RYT6rDUBKq4PVL
	1G/zKjUm/H7jBM9mwxXF81RvkGnhRYMxu+6UDa3gq7Oiw88CERFZEAHbRgcyoXNZ+fMReif9m9D
	kGgFNrN/CVZYpy2Dh/0pvu3i03c4PSqdHBeAHSJW5+146VMtmhwu1JWfwAk2VH+wmHnN6Eu+KvB
	+apCBfhzm2sQqFgRrRV9gsfxkqJzxvrcrhv0UVDZthbLTlJxUAiRrXQYrRCgDsA3GVa/oqMfpDg
	loP54nbeVjWgoUq/P2c27Wxr6Z3AoT5Z6FjaCaSby7pBoBLK/YqEqXbC7FFX2mq9cc8p9wIPHYJ
	JD5EIchU6pErMc9DBjMaLsOvmjOhehTHpydarUlaez0IqhPdPvkXnI0cHlhE8iEIUX9oEwBaIZs
	fOVEsdrVS+QLO2zPsjmO3v+pSl8WZyk0HkBrFycbHJSoGhoDCyA/32TokiSKvqalWeeE7sgp8to
	5vm+HaR5j8sn5QMG229/7xZTg3hAZBU1tNNwenp6chN3qHqX9K29WZpNk4xExy8dAIb3FLZWBQQ
	Ryj83eRCs0yh5QWRWIxd2ZIv91/UI47qCTWMIVAtLDEfyZn9hBo+7ahhjeTBPs1Mb1wmmI87rSg
	v+qEqqI3aURFjEB08sn6hUVHjrxRT/Pab7QJdYQZdfo1JKMm1nwzkFfnnP4xLLO8/Dqlp5H5F2T
	f3o3VXr/coFXjS2XnHBxYS7nVCZ5BhCHMYAK/2X3xEqZIUE6hJK3QhrSA0lvjKHfkkB9g3qJHIr
	SYPP
X-Received: by 2002:a05:693c:65c3:b0:386:e9bb:d9d3 with SMTP id 5a478bee46e88-386e9bbda7dmr1317936eec.28.1795739708147;
        Thu, 26 Nov 2026 16:35:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 37/69] libsdl-ttf: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:53 -0800
Message-ID: <20261127003425.2166632-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133137
Content-Type: text/plain; charset="utf-8"

The default regex also matched the RPM packages on the release page
(SDL_ttf-2.0.11-1.src.rpm), reporting a bogus "2.0.11-1" version. Match
only the SDL_ttf-<version>.tar.gz source tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
index 2cf3e88f17..68a001858b 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
 "
 SRC_URI[sha256sum] = "724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7"
 
+UPSTREAM_CHECK_REGEX = "SDL_ttf-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 S = "${UNPACKDIR}/SDL_ttf-${PV}"
 
 inherit autotools pkgconfig
