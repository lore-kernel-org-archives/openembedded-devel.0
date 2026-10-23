Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.932.1792720917795222498
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 19:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GIhNcUe5;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so690016eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 19:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720917; x=1793325717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WljUKgNazIWvQa+RRSH4D5+ZaTxCjJg/dUNQc2MRIEA=;
        b=GIhNcUe5c/N6fZ/97MGS5WoEzsZpy+EJ+EPBVuSDI0VHFzLNI4P8MHRkJ8VXOxADCd
         gfH/Qf5xO5iqhtEr+iXdPQLmRbs0mu2lcL7MegyOXkZKuuzek1fZNJ2MS0iHU7ZtGHTE
         L9YTT/F+f5gsrwNflY7+fn0HsT6M6WVFjFXhZz31Nz6ImxhFxCFa6EroYCUOt0djv8V1
         qajh9bj6WYdhtR1tt/YgyzyaGQabpbWhydvWB29XtlRzdaZxFh3tX4sDLzqtFm/gi3XX
         0DSjK9H7s4ceISFLChymMi0RS7GznFZ2Ov6TReVTOP0pI1J3wzf00/PRSP2GYer5td5n
         tKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720917; x=1793325717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WljUKgNazIWvQa+RRSH4D5+ZaTxCjJg/dUNQc2MRIEA=;
        b=ob94Q1q+fNsLxSI+LHEZO7DKAl3JmQKt9gS38NmebEDyIyE5L8CEAMvPtT9RZd61Af
         ZavFjcnl3xE1v9fBhyZT96ml65zT/g8bzkO+bbeoItli/8IWnFrdkUFE+sBnmGmxzvbH
         5w1MvcoyiGSZRBA9WFG3s5wDSBVlkrckWBbdrclAYsg1OMIuSzgOB57bNtFdRNBYRPa7
         7dAIFpeyn9F81BWkNBQdfmPyaFWLeUQkQr9qdQote43WSrNKfymzUJaBROFnvT8/tC3A
         P2tgtfu0aqkX7+0NXCH03ikMUDTWFdrX4gPIe/GjXdXrHGWIox3b2otqwkrJVQdg9pZ6
         ykRw==
X-Gm-Message-State: AFq9FYKWL2RzNQ2N9CDc+EbcaYxj5LWFc5tDG1xb8izpdRLKWfgWhZmk
	LpfQ7XVn1Quea3F8T8SD9KIPV1S/PhMVWjMk6QH+eDJergWLgldIXjsmTXAvFjzw4PI=
X-Gm-Gg: AYBFou3iJVURJ7BE8K03sXVUOnHof7HcXQeh4K7oHM/fmVp4zAz8hjhROJf3/1NJQoN
	8WNZyqnUEwYFz/j0odv+wmvIYccx0808RkJmucU5dMdyOgDCtUVpF/+UlyJ0OPszy+VdAMBkyuc
	0yDELI0IR0VIxndYG+uKpuJBaM/g62nq+86ZEnWuUBPJaSCSPrtb7C+rbJbNl+1ZV7zE6F3X2XI
	qXQvaGTMc33zTAXGLzYP0Iq98Jd0HzWyGNCUdALJJcRCHpdRb03FdNf/RL4e7eOUATNJef0w9g8
	2RFGBKqqkX0If1X4/xgcaCdJ5LYbuLanZjJot9QCthm45OSzsrpifat11gMVn+oUInQFAHBhhej
	JWpUmicDINECQMIlfcRFFZGVLWyihHyp/QS+PL8y59BGcnwETYxudxA/aOPZ5jGXpuI1zijzmTZ
	EmQYEYCUMoJi/LH0PsTCIVswjNZ6gWtYCUGuxjf5XolLGtV5ajUBXH5Fy81AbUL4UN19Ohw8DhQ
	4I9rZrbPIOji4HhnGQuTGKsAPJLC1sS4gC81Ert4NyxR+uDf10Fu/iH0fl7fr7Ih2mrdLOC/beY
	Nfd6boEmK0xYw+BlGwaTVebknQc0a/ByRpfbQ9okb0fjos0g/LSTG82JruKemx2dn40vB7lCL2+
	/CR/Cmj7+gZjM3n8GSiJYB0UjENy8/mIzGebzQ66F3F10yOhNt3m9YmbCApZ6+sj9SsCuwQhtBP
	xeoZd1QKcyWsZyP+ahGBq0IkeorRFMomMXJisISBXhOu7r3UidbgeSQQWiUnaytkk/C4O2TrdAU
	ofk0Pe2ZEJe3sysNXe01eOdKohoG9E=
X-Received: by 2002:a05:7300:8284:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-369d916cec6mr1051908eec.5.1792720917011;
        Thu, 22 Oct 2026 19:01:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm2079541eec.29.2026.10.22.19.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:01:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/5] python3-anyio: Add missing runtime dependency on typing-extensions
Date: Thu, 22 Oct 2026 19:01:50 -0700
Message-ID: <20261023020154.3881598-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131318
Content-Type: text/plain; charset="utf-8"

anyio 4.15 imports typing_extensions on python < 3.15, so importing
anyio on target fails with ModuleNotFoundError. This broke the
a2wsgi, pytest-httpx and uvicorn ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb b/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
index 8c262a848e..e0d626e0e3 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
@@ -24,4 +24,5 @@ RDEPENDS:${PN} += "\
     python3-numbers \
     python3-io \
     python3-asyncio \
+    python3-typing-extensions \
 "
