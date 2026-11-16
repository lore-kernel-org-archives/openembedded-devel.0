Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34282.1794851648546610145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=k5EGNl6+;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a315ed211so103921eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851648; x=1795456448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZHTOYpPWzzQcvE6RrBd2wj2gWV0ll/64BAg3ybEYXY=;
        b=k5EGNl6+nE+/SsxU6sUOH5tZbcO1PajR3nictk5TeLJAtBNkggF460nw7nUPdG/LL/
         HCiIh+v0uOHdQU/vXFy62MSnVds/7kU6J20pb7iCHGsgRYKg9GXhHuryOidXnUNGceQ9
         eNwOcw0JKXDSiX5rJd8wJwakj2lKcJbA1GblwWJVvuxDOk+izv+4zv1Jph936ZYm35n/
         VierxWlriX8k8vM95hhOgChDTirAsFnGWCrT6tCaIDGAjxReJdl77VHY9RNvZMcpvnAj
         vkv7AO0D5vDlZyU8gwXv6KXb9PX41FduYATCDYhC6LAdHcgt8Coru8bMQO63uY0y+5TL
         We8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851648; x=1795456448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZHTOYpPWzzQcvE6RrBd2wj2gWV0ll/64BAg3ybEYXY=;
        b=kWbR2riz0ru9BqaN/zcy5dVmE9DbKplGd/NyqcuwRkoUaABxRPa7E7k/ZmWt7l0S68
         j6rH/NR80zfQKAL3EAq363nHtvrbRJJ7VXIa8VoL4IKM3Y8pLfbMuHqTYyBjBiF9guLf
         qv8xlZ1pGcqiabDulBGePWsdLgkj8jTDrJgfY1rnjgQJZfc6cSYemQisL8VK622O5Q5F
         DQB1merIhtlKybNybLPP5JACHuFKdnw9O+5sVdQfh/Opf6c89IIPYz0CI5lBCHmGNL7n
         88ZqJNcNT0Njre+imztzhYSipq0/x0MNWiftG9ZesAF57th8A+AUwe4+JwDFrsAyLd3p
         ik3w==
X-Gm-Message-State: APuU4Z+9Bb8khU0VipJzj03+ulhW2aO/NK8Cpi6Edx1aiuRwoLQ63E59
	gxw1RUWlg4oYDhfreDDBpcNCDZklGylGdeQsAg3Ja0caQizTNBMvn3NkvcRRDmwc
X-Gm-Gg: AZFdTZfrBfjKvzDO9hlpacs9Ncwulz8EJL9tiLEP0hs0/Pa5Dpe7NAaSqg8/zOm0RyT
	XooovqZx4ueado1MHCFbbUbjLewy3IPW+74Rvlt3rmG9yHCrHTvgdKc0twJiBvoDWyRPdCF3LXW
	t6gHRQXlfz+hOYPLe1GrWErGOhdw26t2aCx4a6dv+q+uUZRIQW48pZbBr+SsNSgLEwtalCZzQRV
	i6W5IbYYlUnZkBNAg7wrBF23tIv35Gyzlbepe+DIHWYCRuBTScEDGQ5o3nPX5ZB+GE6L9sDnkxV
	dxkjTRm54Cr+uO9c3f58z5ebUPewGwE9edG30LBF7wCw75jIZkbA5qYuAB4VzAZyWiY8KyQ+HTd
	HAWRoJgRNg0PD/59+Ik6cLAGkfhHEoPd8BeqzemSLSy5a3IOZawvofY+sRRoFm2iRwtUWvK8X2m
	JmjoCyeR81FQoiQclIJk8nVpHAU0YZc429E3ODUImFtdV7QbSAWA2HUw9QardDrmUW+fXXcGsxq
	bCdqfrO9g1huqpJYHzwKXz7+6jV7u7tNx8hp9IyXQI2rfSkCXp5ZeGWgzkqVemaxXSCrD/cuPr8
	/PiQ93uYsqSVb8rFneZ37CrLbfMssIXOZMkra+NhTU1igX+zPkfWPs1+luapvQ3qqsWTGRKC7pg
	YfIo2nfND0e7lu6VthrITk85uUhvByoEpVK0FG/TgOVQc1jGypAD4r60cwvWPYo7j7L88/f8RN9
	Ov4G04OI6NgwGNfK6Qz95sOjjaDaf1k3SF2xHpiLfUsyl1BfOhe1T4kBQTM5PO/Dp0ivvqd1Gzo
	O6KpPVDuyVPzRTwWE+i6aYi4VxhsMmt0c37QAEdLnX0GnqFNZGK9Dzu5yOxW9FcyssilmtSC4Ks
	++oy
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr164377eec.26.1794851647627;
        Mon, 16 Nov 2026 09:54:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 004/105] python3-async-timeout: upgrade 4.0.3 -> 5.0.1
Date: Mon, 16 Nov 2026 09:52:16 -0800
Message-ID: <20261116175359.342679-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132460
Content-Type: text/plain; charset="utf-8"

Changes:
- 5.0.0: asyncio_timeout is now fully compatible with the standard
  asyncio.Timeout while keeping the old asyncio_timeout.Timeout API.
- Breaking: drop the deprecated sync context manager support; use
  "async with timeout(...)" instead.
- 5.0.1: miscellaneous fix only (issue 423).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...3-async-timeout_4.0.3.bb => python3-async-timeout_5.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-async-timeout_4.0.3.bb => python3-async-timeout_5.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_5.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-async-timeout_5.0.1.bb
index 33a8bc7896..699bcea711 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_5.0.1.bb
@@ -8,11 +8,10 @@ HOMEPAGE = "https://github.com/aio-libs/async-timeout"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fa41f15bb5f23b6d3560c5845eb8d57"
 
-SRC_URI[sha256sum] = "4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f"
+SRC_URI[sha256sum] = "d9321a7a3d5a6a5e187e824d2fa0793ce379a202935782d555d6e9d2735677d3"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE_SDIST = "async-timeout"
 
 DEPENDS += "python3-wheel-native"
 
