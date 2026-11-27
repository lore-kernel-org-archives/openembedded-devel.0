Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10257.1795753002257479961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IsS+bQio;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b546061d58so17750644c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753002; x=1796357802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Y2RltN0crO6RZecu4KQzd4KjOPq7h8nxxsLR50WW24=;
        b=IsS+bQio6qzz10PkQ01Q3Zy8ms6RxZJ5QpssI44lHAJx5JsaJo8Qwz+5KAMm0zwUjn
         gac/HfC043KBg/84XBh5vJnOFjDBzT4ECsjnn9Hq7K8vBmf1mnvETqA6uBdcV2t+PhzO
         gShyzHsiLCH4JlQ5Osj0qqsFenxOgwE1HtxqBzKhHEcPHz3AG22jyte2WRjulEviN1/u
         yHsXCRFJheiXhqZHWoWISpl1aANCaIaJpQSZn1X3udGsFD5ZtLMnBCFPYsQpGWKFPTJy
         bSK0xFxbP7SDnagCXzYRugb9wIF2V8QeMlJyUD8T7lHhXi5VfiAdYg6MseYZdn2ckoU3
         O4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753002; x=1796357802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Y2RltN0crO6RZecu4KQzd4KjOPq7h8nxxsLR50WW24=;
        b=CEkmKLAo3PmaOLLvui97F2oQyUukkBkIR6OFibG91uPYWot94VSaVMy9FcQejbwIEo
         bjJMCF6N+iWzXmFTo+WVdWR4RA3pCN2s1IUrAoXGFwkaxMQH2TnWljC14Zr0khT6ED+v
         Amzfe+EVWInj4YlLHx8CaDuxBQ6X8+R4S1UYOO9UFjGJ9LxFip95f/+cCBBwSNvxIxuY
         xRAjhNnEqfqE8ZWHMxJgWiL5ON7Jj5Emwi+dfKPtdBjiaPE8WTQhGe8xg1IsDn/ISlgr
         1lZMAtZy57eg7aecGKiXCvTRw7grfDAJaoF4yrZ1qlhb9Jjv4fYEMuVHaYpDENYjk9ED
         RaJg==
X-Gm-Message-State: APuU4Z/WRH/hBFrbntvs/GUBBTHIq1ocfDcG/A5VMhpxbUucKmFrty+R
	sk5N3t2Tx6iH6ZKcmSERW5G1jtqsQN5a7BzEgwIsheUe6rat4xzcX1k79k7FBtE9
X-Gm-Gg: AZFdTZfhGmMjt084HO3glfz2nlTPi9Ef0j9CCYN6O9QTutWdyWcGCCYgKjD1ao4C0LS
	D2Q9EGDcDToO+0iAQmgVq4POo8CebUipOKClzL7gYO/sPVbsJMdVYgOo7paxTvwiAr7giWBTsg3
	uMWBFvSz6Ntn1X9NRHkTR2VULSkpXUBtgg8LEo83m6+d1SdeL+BcQJVnoDimySxEWJmgH7qU6cv
	scGsSFbIKLwnBvcIjbdoQzTES4Vopmcz4I6gF2WJBTeqd+TmZqZdFU+YxUwWyx/j8uMJ8l5sC2x
	kRUDIBOlX1OU7cMynZxV4wylDVY8qMRJHabdlKIWCWZdpEq8azDvE96fpXpfhZTaLfJmxmjZbEW
	N4R63yFoMpHWOCa1bVztDZje1v39oOjymlfMdRMef/T+lb77ylBcmt+7O/+rFnZ0O6VFMCAdM+E
	qED6ax0kPXgFR6Yrzl6sBt3iOUpsTnKmZBTAJ15SYsoV5pqjP5HjKGiVKNiWXZCYMpbcP0zPnpM
	tCrHUjhBR+xRoX9n+B4+1sSyDkPwBNSAhZFlWcvU7PZVLsUZXTJYvZ5xavRMSLrZi3f8A7nyxKH
	STFtQJk3/2bCHh9ly0nJqEnwAqs4/Fg5oOKW6szQNhBqSWKG4EjRPeFogh2sWk23KTd3s41cMpC
	m9nbLf54kFN2oiHTJL4VPITK1Uu2q1rmVcNrHVj5J2Cjuzavzkp9q7h02c9AfZ6ZLH3uJeWWMl1
	U7xcbseqo2B9y5at/MbmdGCB9FMEwLt9p+7xKOYTyfiEZN4CwPUhnb23M0RjAeVBzQVnov31b0x
	m5SLbNqAHAcj46d8gFs9vPRBvw6wLhRY+fpKK68k4VfmAJ/NoWdhLjUrZqJO0Z4dcTBbjqakerV
	KO0/5g==
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr15739211c88.22.1795753001517;
        Thu, 26 Nov 2026 20:16:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 22/32] python3-types-setuptools: upgrade 84.2.0.20261104 -> 84.2.0.20261122
Date: Thu, 26 Nov 2026 20:16:04 -0800
Message-ID: <20261127041614.1775064-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133241
Content-Type: text/plain; charset="utf-8"

Updated typeshed stubs for setuptools (typeshed commit 567e5e3e); only
packaging metadata and tool versions changed in the sdist.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ....20261104.bb => python3-types-setuptools_84.2.0.20261122.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_84.2.0.20261104.bb => python3-types-setuptools_84.2.0.20261122.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261104.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261122.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261104.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261122.bb
index 58791a5bc2..429bd02d47 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261104.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261122.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=320eb2c24b8d2e890b
 inherit pypi python_setuptools_build_meta
 
 
-SRC_URI[sha256sum] = "1ec758bbeddf88d52f963fe663beabc2117b6aae73cf3d2902d7dd0df81bd76e"
+SRC_URI[sha256sum] = "5c513edc18ac4e5feb11204c379e15c26b849127f569e8d5284e380986cbdcc8"
 
 BBCLASSEXTEND = "native"
