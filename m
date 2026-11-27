Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8063.1795739689844031260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jDbGKwKt;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c336eab8so3981944eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739689; x=1796344489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=op03pZRSAHx4PzMKE4zipohmBn27PZjWcV2RGZFf0OY=;
        b=jDbGKwKtDzRaJOs5QyVV+gAuQs1A3zV/onWfXmG4sR5f6FnLb8VjAOeKS/MNdszhaX
         VOhZXMtg6vzyxzssVNYj/uDKj0+kRxuwF9AiCdE1qdQSV+V1Hclv0bJ1m1UgTKHLGRJ5
         NbOgoEEghzYSVqA3b+DokNYLxj6rylSvAWfviB+6PfYdkBGKKUqoXyuW17iyVOsBMVSY
         jrYu5UqbUWWWqj+xk3Aa4mBwMGBKCEOTXxWVQay8fAHm77dkjtfBPNxeQ3gvWo0VRpdM
         QK00NSz6IaNjw3QEoHm5zfjBukPE3NiwqOlrkff2QZ69o0XU0qdk/GIC/4uy8y4MhRCj
         rprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739689; x=1796344489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=op03pZRSAHx4PzMKE4zipohmBn27PZjWcV2RGZFf0OY=;
        b=EO5oXXrmhaKbhWIctdOpcAB33t/JGqeJ4VVYik9V0D7GUg/4X/GeMuNRRvnRXFPBNe
         R8wLUvg7w3Bes+QSXtUTYfBlSxphyHQTRxC61MaNBfjepWzRwJobDnCtq9B5NZfneRkD
         DYK22SWk3yKsmGUaE+gNmBx8olLrvU70Ru9o7MHcATOL7ydwobYO2oxKHNDvEo+npK3X
         Oi96PFzsVAhWwHh6QTAe5/ZS7/LQPLQjfeq7hxkfPRz3MADGRERgB4VCNRKbXhs/UX9m
         JAyHS5A0HoNdDJo83No3vqESglOBhN1Y48lagyGP9xbXcYVZEq5Oy1KoDpIm2JeTG+cB
         tNIg==
X-Gm-Message-State: APuU4Z8p09NKhtQEi2romgz5Fa2ys/dS7lJ4eExMiXE+SyAljvYqdJZF
	VMuQIDEosUviu7EOpYpO2NFJIUtFTQMwq9lO0EHD8twq1VI3nIU4rLboO8CLPsi6
X-Gm-Gg: AZFdTZdRKA90wPmElxew+kEa/mqAJT8hX28BJQCEOHJJUqNqs1vn6SrUa7dnGCN5+cr
	GaBdBtOLtNzazAH1BdHk5sEM7ot5ezTvxV3btol7ru8syvP4Z1QHYDunoKfC5ytJ6gNZsj+lSak
	xh8OfrYxy0JS5ssoxuetNXHfC5ht2UWS4DxF77nGrdcHfAdAff0d6ZasDZXiqy86WgZEtDCXvzk
	I4YY2kUEQWAA0/CrEASo+mm8sozpBvgLxy3Of6udnpSJY8/AnLjSPTnndPbf+3bahuUuXXvKtu2
	ekW02fVlCB5/2Ihyqrh84Ps8iqVw7Oze95dRuntoCr6UZLkU2S/pxKUCbdK88tHnXCDWm8+UPAL
	6FqwdbGLv1Jy3VclfAOicktyiJZjum2RugqdbA+pVyxm8+g4y7Leqn55jg83wOVI08Fcj8TsFtL
	AQv43FaE6fiDPkKTxewrlvn6Zb8dnsgYdkMJ9rZRf+A1ITPnNXxTnbR5tthnIZUujqbHNDNeGJ2
	eM3QxUBuL6UpRM5LsE03X5B+NbIKQmZ6n8NBl+w8Tr2tPSe2t9ZrBFEhtS/xYrdgC78rCn5Q+YO
	Mr2qh2Uch6dgMMXB/wCw2zgtJ0bc2nS/JwjBLspR41DqqfUTa3Ym4rt/J5QPww/QyBmWiB8TOxh
	gPNEFb1EcSToNhHLJ9k9o3AbSc/8vr3WbpC5FicAIdvWx67Z63Q/MJG3UmesokCeT3DvWynfqNm
	mDi7t2QylkANHKRSH0EP2yRrtBaL77Lp2U+HPFfWcpGfiDyYOsS68hywPcNreMVtE7ZZrA0wq9j
	waMLDRSr8U8tHDPWwefu4kzaGCPvvkxSW1Pfgu5V28i5NGs2J8kY+xSG4UPyqRuqvRrK0jiksXt
	E7EDiw==
X-Received: by 2002:a05:7300:1911:b0:386:ea18:7868 with SMTP id 5a478bee46e88-386ea187930mr1766242eec.2.1795739689177;
        Thu, 26 Nov 2026 16:34:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 18/69] libtreesitter: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:34 -0800
Message-ID: <20261127003425.2166632-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133118
Content-Type: text/plain; charset="utf-8"

The default tag regex matched a fragment of a non-release tag and
reported "3.". Only match vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb b/meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb
index e1e9ab1dce..7a17cfae1e 100644
--- a/meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb
+++ b/meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b83e3e9ab94483903b3bc21d9a1d41ed"
 
 SRC_URI = "git://github.com/tree-sitter/tree-sitter.git;protocol=https;branch=release-0.27;tag=v${PV}"
 SRCREV = "3fb7be49145acfb07e33b61ed5689e2b6771b2e9"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake pkgconfig
 
