Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3824.1794729035572168014
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Zy8rAPBV;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372bdb942dbso2301657eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729035; x=1795333835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9drJAMyD77EpDPE6YpWDV+pG6L83mpOhWcFN7iA2Vh4=;
        b=Zy8rAPBVLMQknYobVVyXpHi2PaqyVNXcuDWmahAj3CBVXf54Juz0SiVrNeKgqz1SSH
         k4GF29RT6WWLD+eAVOTkrtB54ZNeDzrAw/pDPIAhn/eB4g9WUitK/E/me6/HTBoXZ0EB
         XZ/vL4ONqPKU9hZtMG2tnHJ+qFarkN9GqGSwnQBg0cF3FMbDqpoYzPJfpSrvuYosNQsy
         VbJSwxfIrPbOXipJyaR7mbXHTrJoWp/twuID+QtoSvA3CIxildWqbqZQ7JlTkGgsXfHD
         yzZfOq3mCBPGjWgA23onQ18ScBnn/B37qvo5yWZtlipiOmbJM1daX3ekil+SVA+iToDG
         y6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729035; x=1795333835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9drJAMyD77EpDPE6YpWDV+pG6L83mpOhWcFN7iA2Vh4=;
        b=QrfTgjQqwtjkXcs9Xo6padiqIdDq+fN6qeydzXgBqQzhkcMPyC81HoN4WBhPvjKacU
         PUBN8NdPA42UH+MR0N/2vVafrtyIf4OAgaaSky1o/WT9UsBWcpn5eB1eLfHNmooVJaB3
         iWAvINFBsGgC4VfA5ILct+Yv7OlqZC/fi6sPTED/pcspJeTGNS48/DQ+bVjCo1hONelP
         ojeqslpLbHQnuaEXtGeZ4yhRYWw04bo3Y4LDkJleyzzT/STx0dIpNbAOg/4H0G4IDMxj
         ML3a/KJGJTXOSoiaQnTqhbKxnBZTFVpQAD2OaTjSvo7cxjwGc11T7KZFAxj+ohNKDygV
         S4IQ==
X-Gm-Message-State: APuU4Z/LS3MyVt2xHPrul7Fkb0uUSXj9VryjIJHtac44BL86egi4VSwz
	mrhZT/YHzrfvcE4mt3KDb44O0dILe1HRHU/GRH6PSjVwMq4ue9b/DXhsQL0O7eBP
X-Gm-Gg: AYBFou2roa/oUThJ4HnCOw/9H8cgE4mDUyQMZZJNRTTXGk/cWoekPZsNAwGOvW5P3qs
	XvOOE/KaiVAWoaMAT/3sR1KI4A/L8OgCU66BUIFSMEPu6IWNGKri3Y3VkQfjWfsZfp3bEo+ayJU
	f4ijmb6BIHriQdUpFWkLpLmkQHLa27gH5SLlmaYyj/7oaOL9CVD5aqEoqpnoYQ/+dP9z3tADNJf
	msVZPgPUpFAylCOcZi9M3HMqjVXoZp7Pd4EQpP2y986rot1IgTUKkbNbF9Lu8iBEolndsPUtWlN
	T0GYJj+LMzQoHPLVh/cm+jfr+4yKF+4tmm6GytuPnRq4Yjt48M2x0d5kJ4qiyXndcCTJh1mutzW
	gqX/sRwtFnCJ2f31lOF8iY+DqmFPdGOLM9t988tL7iyYJLWdzb00cAH3XFEcCn8uzWC5SDz3AlV
	om8FlVPhzw6r9m0GtOpp1vkZOnibmSWpKYCl28QHebKjaZroHdN6CjbxuHcZP+7fS/GTJiLAfcM
	p1AzthmLl8KthzlQE0U4GNx5NwmajSCR0Fmw0Dh0nAis2JU0tmSugW3iX8wYSSvT2CfEtuV25CX
	IH2jl91A39dfpJ2zLBk58/K48uMNkdlOkwmBPQsrIAL4/ZhyS5zlWnj+sh5Lc7RgcHJ00leoV6o
	sjhAVru2e86/Men1teftg0zdswQkpcImPHMQEJ7tPdiwlyY+h2AciWVG2TDEsRfg5R5DDw0IJgC
	xGgenWgFtUrV78ceN1WY3nTWC3LIWfxQaRnqlZFemjBg9gUvbJKGIEtLD7epVlwe+qtZhluWLog
	JWDGVSal0jMka2oL9/zgF/8mIoMyW9t0+YZ3QImvXr5AcUOuYeGVvalI7atMNA6PUPPP7+eputZ
	wLHqxJtuphT8fnZrGv7IQz/NlA==
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr6771118eec.30.1794729034772;
        Sat, 14 Nov 2026 23:50:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 46/96] python3-psycopg: upgrade 3.3.6 -> 3.3.8
Date: Sat, 14 Nov 2026 23:48:24 -0800
Message-ID: <20261115074918.2932593-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132316
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-psycopg_3.3.6.bb => python3-psycopg_3.3.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.6.bb => python3-psycopg_3.3.8.bb} (86%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.6.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.8.bb
similarity index 86%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.3.6.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.3.8.bb
index 83a1e33863..40374466c3 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.6.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.8.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "c081f2250df751a943036e42db6df4571c66cd0aabe8291a7a506512b12007d2"
+SRC_URI[sha256sum] = "86c135a9a6f5e98404975c5787e620bf436a7807e088baebd1b20fa48d3b4b4f"
 
 inherit pypi python_setuptools_build_meta
 
