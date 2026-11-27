Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8209.1795739711105265168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=s5bpyuoz;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15984750eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739710; x=1796344510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFEnSVWW2CujuPHaBSXOrDKcm/wOmgHNkoyeLZbjErM=;
        b=s5bpyuozOe1VKV4DSC9UlAZFewc4uoY4eljvCgIsO35JJQGInxG4n1j/CyfsL1nZcT
         e9Hx6Yh0RfFA0l3+z+9+h09SS8RJmTs7OtDrzXPx1Je9RfsyfWXvlLUnlhOMhi7bdAlX
         Sd2Ney1fN0CGFCXbCH9TUgzxZjJUDWlEs6qdwdfwNIjw4v8bfJIoQ1WwXIE3kItEs8om
         Rr+G1YzYWT88Cn2e17lEw2pRH/OsytwyKATIBUqTSmjBWkQSb55FkzyI73HEw3BCqkAX
         wmrzdguvFybfoSjKdmbMHI6k2KGrSbCjWkOQCEHehuldTR2Vr1IjmUsnAQsfYMMTRYOp
         DTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739710; x=1796344510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFEnSVWW2CujuPHaBSXOrDKcm/wOmgHNkoyeLZbjErM=;
        b=Snpp+B28AdJRePz0h5jXY8Khw251+sAVDs3w4uV4MPSUaEfp34TzwJ3O/h7jV71dfo
         lPxhDjV4CG9o8ITcqx9PakJLOaTX2jO4PF80Cp2g3wO0XYyce1LxcFPt3d0vhQJ4EuPu
         H8+S7LUmnbfFJ77lbA2F+NDVcWgNR8oz7GFDjyQA6CNc2YlujSny9aqRal+8PZym2Q4E
         QMhvRwV+3fsKyaz3rwKPFLNEh8sY/wQuNrI5GPJv7aStaICbfNTI0dZpV/dSz1TYhLO7
         1P15cqX46ZDqomFahskzuhXOewcBIqdBoZKaF5/4C/oi1HAj2ITPbwwUNtoSlSb4B9hW
         CfrQ==
X-Gm-Message-State: APuU4Z+ZuVavGc3kH3zqcQB1cSmdCc6kLOiVMeedR6R7UehMJhFeMi2o
	aIX+yCqj8Mie3uCSLONeTymd3zvaTGVjoTCYoGFLf8eJ0hUCmvpL6FYDJzPUHCY5
X-Gm-Gg: AZFdTZd4Tmkjj7F2qQwl2MFeSvn/fLiWyg/TfS/BVWNqZN7ri6TuhN3nnmDyeBSNflx
	Ogtno1SfSDiZEwoSVH6Xk+dzqpIaLFMZ9DQtgXD+KRGSf0TPAAoq0mByU/haj5berf37FJC5SXA
	n6OIcc7jZhu/kUYdIreUq3aOj4Grk3UxFNIsWtvlH4IGl2eEkPkmstUophQGQNCVf0BNOoe7+sZ
	DClFWtjiih5Ut9yCl8X4JrUdBSDN+ne8nBEZ+cP1KsTbApfIjly/hxiriLNsQ3jlQcHEIDo0LzJ
	NmuPppC5Mh2DQJ48f/wSjEybtu1YK37HWeXgriFFHWRi1HVZ2j0XN3zdtpf39KSMO9sfc0oNGMI
	QLeJTA362Fd4Z8xfXrtPFABAOT8lXr64tT7U5D6MwDLGL3Jttet7rHeR/SN3YYSj3e4UauFwMQU
	KQplkGTgDvmjbEte68H2/HOVSFDf815qVHI9KJh8Srpf3HH7UcabW0rINaM8epeEbXr5aVvw4jk
	qPEpiKF9Kd2B02feyNnrzSdR05Cw6mZzZxrGMzGkIc1E0jjQQkAnIh+5loJtS9PQ9cjlgG69cCO
	R64soGGB4KgTOcQ7NioBRcGwGwjK01XDrBkgsYyMqLkNczFFczTY46IMYHI5l5UuqEGW+CTdmMw
	mhh1vPejQLXsXSeMim9aPH+SlDhybCQsDc1UrPY75THvOGe2REVRL5kAYEXuSRgczLZYxqeawV4
	FffW4m58aoW6Q6qqxIaXVfzX07WxFj+LjzWtjryP+K7i3hyDg/aIveBh51q+g8FeAxWhLqWW4Lo
	OQlb5RyddW6qSwi4Po40idNrhfoyPk8HaJvTubGDD2hwI4rlAe1Lc9M35NeN5TZw9yqSagJ44UD
	Q7mFSpmmSkMCiWCceQ/zL7op2w==
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr25802392eec.3.1795739710424;
        Thu, 26 Nov 2026 16:35:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 39/69] spirv-shader-generator: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:55 -0800
Message-ID: <20261127003425.2166632-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133139
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up stray numeric tags (e.g. 2021) in
SPIRV-Cross. Only consider the vulkan-sdk-<version> tags that the recipe
fetches.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb b/meta-oe/recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb
index b5f22f08fc..8147b6e408 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_1.4.328.1.bb
@@ -6,6 +6,7 @@ SECTION = "graphics"
 
 SRCREV = "7affe74d77f93a622bb5002789d5332d32e512ee"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "^vulkan-sdk-(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake pkgconfig
 
