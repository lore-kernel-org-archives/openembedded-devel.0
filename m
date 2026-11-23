Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48020.1795411828992760811
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LcwJSgXt;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3869b68caecso3586080eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411828; x=1796016628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DU0lDKSINhOZfsDEvcJYl4ritCXeWD5RVLjUbkPR5Pw=;
        b=LcwJSgXtH33MmCKRc1NLRa7b9H23P/tPH43oGhRHneKlZYDsGIj2WaOGIkGPJJ63Ai
         9zT3wU/oU7NkOql0UPNNUyIUZvhNcEa9vI7Hi+xUlEtnO63/g73qlTOfyB36L5mfaOJS
         MGN8jnSuMo/hA/ZP7Q1BmtWn0ZbXhN00vuUOswnOjcZy1RohOVbrwxqx2dxNuw69HrIH
         KvzW/1g/3AYO0a4XGgameYOtwtrpxVQTP7HVk/jGdvrYOrL/Hz2wor/hUfRiGBmSCDz0
         ctn+Md+lUfjxu5EoBJc26ZaGSy0KU1dKM9KpLA9inqfiWhIGvIXfg3qibn9oYn35MC/I
         Iscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411828; x=1796016628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DU0lDKSINhOZfsDEvcJYl4ritCXeWD5RVLjUbkPR5Pw=;
        b=rRv8dlZAedoHOO3NyriBhsTlaFtlxXwZO1gwkNDmZB0t6U2f3tJLXJ299qnLh8JXhd
         IwwPs5a2/PWFCeC/2FCMNkXuMgXBDgnaDzyHI3YmwLSvYcM+KyXnjHy2ikEiRvItcHhG
         h6PyK8eL9sMVlH6GrC6+RcP0JypdrvWPLCl60+kJ7sm7NWL+Uk8vjXJXSjd5CgqFfRUa
         I8uLSiOAz/kQlR1NuDCsVa9FK2k2KXBO2TX0E+upXhyLzvzWsIudBXbiNSJApHKK+g5/
         yNK6yHwyaPVWQruEZzAOaYGiVzofgIh0XY1IMb4siQ5yUExQIxSQ0uMqkE558exq5FfO
         7inQ==
X-Gm-Message-State: APuU4Z+OWfp3xAZJbh0n9bdf98xlwHV1dTGlZuWPUC6OAIArfJWwav1z
	EiqHFsNLqrsgWTdmXdzRCd54ZwKIKdjEwslMAVEsBVM0OOcp8jrSQiqOvhnBx7dPG1w=
X-Gm-Gg: AZFdTZcKO48ih1wd8sx3mwGDDnlCkECJeVjxfUX+vwET+eaFOgQaxLEEZqAnPrrcfAq
	MQz0ZCBRCmzfLguHN56g1uwbv5zWg7+D7sf5j4YzcvCH5fHss4DIRxdQ8WIhvWatp/gkvU7BTDY
	JWgU2dWWwu9TsJUaQJwsXCcM7zZB7brFiQzZCibbsBuX8SZb/Sgyv2D5iHyHBX4lln77gWh5hKa
	WidWlwNEtt0qPZ1EbMVkhulMQDUBj7ZegkraGbXAFJ9tqjRKTw6osTkuJ4hKn8O3UEs0N92huFk
	Wlz1ZkUKNSHGa9hsCTtElAp+qPILEjCJDIYsrr8odwmvugd+hco0RDcsjmj0+HRkym+LJUtqEKD
	owKuTkStIBDgv2T4YdZaLTHqMXiimLALmCGT6as0Fged2e7UUQ8nFSbNtJhH4oeUgcUBQvWzaZ5
	fDH85rOrGRs9x+UXXFf0oJC+ofMzLDlWcPw3cx3M4Js3ULSi7Z/u76Nw61HV6QQlLB1tBVWDdgc
	LIGaW6N0mJ3YTaHd3IhKmVuiN9uP8joPjBPewnaXh0EpGhwakOX7RM+bRr5zT/+uyqTXhoYpIP+
	4119H5FaqYVgc9T1tF7g6tTbRHmAakz0qihjml6s9N78jH5HpaY+WnZzVeM1/D2UIhH9c0UxmFZ
	UvDlohZ77Vc2/u3NdX31+HQuIkh8RyGEqK+fiuyb6NfXF3HPUpIYVhEwt8CXiv2PhB7XpIgDBx4
	YThMynF6YlMe89gxlFBApZac/L10IRmKYn1xiVHdSG5aMSI8BjZbzAZI2YfS5yst4jmzbMrWLpf
	Irm/AZsvJLYpJ/8GfQgEbmHFvi05HsKkq6oAyzdBnuccfrNz8HXwT1+jjWOdig0xGij6vARBJ7f
	gfou
X-Received: by 2002:a05:693c:8956:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-38570846826mr10599292eec.32.1795411828257;
        Sun, 22 Nov 2026 21:30:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 8/9] tcpslice: upgrade 1.8 -> 1.9
Date: Sun, 22 Nov 2026 21:28:42 -0800
Message-ID: <20261123052953.3658549-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132813
Content-Type: text/plain; charset="utf-8"

Maintenance release with build-system changes only: merge
gmt2local.h into tcpslice.h, require config.h from the tcpslice build,
use mktemp(1) in mkdep/autogen.sh and update config.guess/config.sub.

The tcpslice.c license header is now an SPDX identifier,
BSD-4-Clause-Shortened, which is also the more precise name for the
text it replaced.

License-Update: the license text in tcpslice.c is replaced by the SPDX identifier BSD-4-Clause-Shortened
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../tcpdump/{tcpslice_1.8.bb => tcpslice_1.9.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.8.bb => tcpslice_1.9.bb} (69%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.9.bb
similarity index 69%
rename from meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
rename to meta-networking/recipes-support/tcpdump/tcpslice_1.9.bb
index 3d61160bb0..7017dfa51c 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.9.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "A tool for extracting parts of a tcpdump packet trace."
 HOMEPAGE = "http://www.tcpdump.org/related.html"
 SECTION = "net"
 
-LICENSE = "BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa62c64e"
+LICENSE = "BSD-4-Clause-Shortened"
+LIC_FILES_CHKSUM = "file://tcpslice.c;endline=8;md5=581f80110b7551334693070de9a1f9a8"
 
 SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "082967d6bf793499d3d655cea2149e07c0da97287f1877a6eab88d17cb703d0d"
+SRC_URI[sha256sum] = "3d8c9964ecd3cf98310584f67de5530eb449e7a6bf4613599170ee102bbdd29f"
 
 UPSTREAM_CHECK_REGEX = "tcpslice-(?P<pver>\d+(\.\d+)+)\.tar"
 
