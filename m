Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5763.1794975211566692611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=czmDmjhW;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944a0eso465542c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975211; x=1795580011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxhbfrBCakYO03yQcCoOcbwVtr36PwAhdV2x06bDutg=;
        b=czmDmjhWgsK5rWQ9+LMgzDf5dmlMVmYUhn7Bltq9LddUsQtfr/ZmzsYIZAuvW9HEF2
         wDsjnMAK3pAd6qGd28GvXMTwu9Muv1B7GwI0MtkBx5oJvV6Zu6yVQcubzB0Ugsesefgc
         aCn7idCVUqcOai5Yruj312KVF8OH3mPnht52Trs20dMzkVMjji+1f0EY7zWxe/kLkx2A
         JvuXOHmQVm6B94Xa3r/jHBCfKUgB/Z2DcNHuprKY77i5AFRLPNeSTSEOG+OrRt5WeEng
         yNGzUCwL0Qa1cnBdMmSnX531WYudr5kKOpSGTHHUp9rVXVUgXHJpmmhYwKYZB8Qg41dB
         2xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975211; x=1795580011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxhbfrBCakYO03yQcCoOcbwVtr36PwAhdV2x06bDutg=;
        b=dc4gGdLlB+uibgNTk3DmrLwOMjH+YiiiqoNDxPlamcoDOi3hxHHoKhddZy4HqD+tq6
         HzwcVP5srnJWxZF9p1/rBAxRlRvujY82n+eFYVJSJIfeAc9xjUEPNIXGVmakrJrsDyQV
         NnvEE8kBtCTTi5FmcL3KnzAR0X8tD4qfYUmZvYUdgwWgqUz3/A/v1gI5rQoKn4T5duWH
         bDnO5hptj2U/uAyZggw/0icTO5TSnL4bGcp8CdN+zoEScGuuNtdDpWlcPj16aGWX++N2
         QREDFbIw718idvIPv0LLccaSnDALBTEhnFOYmjb35YMT77xg2kg7fDk5qMCmBGIaw5Zd
         Ep6Q==
X-Gm-Message-State: APuU4Z8WzE03AtJiZ3LTGCM6mkNN85Ig9ssR+7DkIAuBklQ8xX6N71R/
	JHnRRJHvel72/hMJMKizrbSwDx8WGckINEyBfuinnTvXoK5rGYegQSec57QcdAEv
X-Gm-Gg: AYBFou09WvlhYJWGo4DI763eLPdfBP6LspCRppobixD0Sbh6ulK008A7tnbnLHk94gY
	EE7vVaAPlS3QfP53UjW6sXGzTh0cXCypzdMMmIpERhnzyISQ0iL9Ox9jyjsfjh4PwjjA6vrMn2m
	UyFPMpPG1A5CGRYLpfR/r6NxSmjLfUU+1mwdGdcWVBooctpbAVpCNU7DbynXnWCeEbWBYoOs4CB
	Lp6AG2GN3MyNIGDKsKR13OTJzrEmUfIqcLvprmRwbQaZhDPqh+J0FYHwH33jq+nu7EeW47i5aSy
	LjL96MDCmV7gR9zfNMB75yxNduDapj8nI9oJUIQ7NoYq2tpR9KI3m7S15MUZoxdi7+4EZ28vJQp
	lCX0OoI90VZMWjzbl3v0CoWMkjhCs5ME6BYfY3UXOY8qfKdSLc8JeCqEnV37sYMWidoy2+rXfCs
	ilPEtYyeIOZ8SEFesYrkyCjVfoI9yJidndTwCwr4/RHTM1NpwfnQ10sfogP02pDc7ETuZzuWtvK
	k2/YidQzRjBAqpv74pMi0kpGIFgTgSBm0Fme+TnRjycYUZS5mQhQOEH0YrNz0o8VapTn5kHwC6x
	nziZM9ApRvN6OhsESHUMINypMBkgnMubLAlF+vGAzBGBrtsV85UQdFP02qgFcNZxcFPJeL/UoAk
	peRCvszYsqzlBwxImrRkB97+GThjB+/EYoiVq4dtpr8hNQxwu4TXTWFUJzI2LWnGxhU2yk9Cgeb
	OHa6hHBv0gN3tEdbfY79bOW86mxlK/LeTuUMN3BW/PCGmKHW+T+RzaOpZIOfkQhxPJdX596rPjW
	mblnxdrEq2iIeeHe77rjwuTpRuFTLZoFud2ttXlJmsZWZiuztTNv2+gq61oj47C/P9ozDnAdRho
	Z0Yj
X-Received: by 2002:a05:7022:f509:b0:1b5:2746:8cee with SMTP id a92af1059eb24-1b543bcd530mr1311473c88.18.1794975210497;
        Tue, 17 Nov 2026 20:13:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 10/12] python3-python-vlc: Fix LICENSE to LGPL-2.1-or-later
Date: Tue, 17 Nov 2026 20:13:15 -0800
Message-ID: <20261118041317.2287415-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132633
Content-Type: text/plain; charset="utf-8"

vlc.py says LGPL version 2.1 or any later version and COPYING is the
LGPL-2.1 text.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-python-vlc_3.0.21203.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
index 68009d33fe..20dbf6e415 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
@@ -1,6 +1,6 @@
 SUMMARY = "This module provides ctypes-based bindings for the native libvlc API of the VLC video player."
 HOMEPAGE = "wiki.videolan.org/PythonBinding"
-LICENSE = "LGPL-2.0-only"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"

 SRC_URI[sha256sum] = "52d0544b276b11e58b6c0b748c3e0518f94f74b1b4cd328c83a59eacabead1ec"
