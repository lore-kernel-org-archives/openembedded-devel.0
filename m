Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23234.1794814546509110160
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rhmhosaQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so32943155e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814545; x=1795419345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+kEZb67JYUTekTrd20FTMy10mSfczlvBcLHx8KUaZ0=;
        b=rhmhosaQ3vAvr08jDUrqEB3vjf6FBaElWv1A1q0lhXUHJ9OXpTa0N8so7C9whHkkE1
         o/7a50TE+WYfk6GGwDmgBX6XOrRkTPB15+NLpUV8swM+LKcGxw5CQM7D9WS5qeMdNbbB
         X+fg40LJ/VhThGs0ZvzhQaFAC484/bgdDxrp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814545; x=1795419345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+kEZb67JYUTekTrd20FTMy10mSfczlvBcLHx8KUaZ0=;
        b=PnyaZi2thDh5g9MNaG2N4aeB6Y7rtf+HV2TNSTaTCDhtyIU4qfv+RKLIyzU/jOEReu
         fLR62Rlwd44gV62Nxu/AeyFb0lRiAU9ESPy4ys4jKzERBo5tFp8Uk2pJ7Bi+lP6ibOpF
         F2nk6W8pmHoT3o/8AXFMwMkRrFX1MpKSwpGLsf3GJGQDD/MM+no69DLGcpZiGK6obNya
         GjbRCKDBhAoLtr+pMZcnPMizVZSx4KACESeSYgc8sSykkR03VfnfFrewIE5W/Vnnh1kV
         N+lpygatiFp1tpYqB0JxtToW1J7BlA0I6Bsqvnvz+HJZypaBB7Y+T7hR0kBpwWKlW6tl
         AWXw==
X-Gm-Message-State: APuU4Z9ZDSwDLhbtFFIixIMmlmfCk1k2zMd1Su+5lVzrrbAXEurloxR7
	tkRLhfYQ3JKoUm6YTjTWZoH9157l8/nD8KTAUTpFgFT+6mEJOGGykjEuCpgn6LocCj71f1mMFj6
	wBvbY
X-Gm-Gg: AYBFou3fHl2T+CAAMtwv88WUSh7n89c+ksH6j/IG7GSZNqsQB1IhiazqMjRDduGfdnq
	AJ6chzgrPOQgL+B0dhnbCmibJKHAhaXvcWNsg+JcPTIiygaEHxhUZ2cc+sBIqbkHlDWePMmqtUB
	Uy3QTgOBmS0gzwYfWtnuSMmQxvPOM2i0QQ9vuwwQ3Pv6ned3p094+Ap5LrqhzmL1EpB04tuapTP
	LwBk9oCa4LG5MvVbOintLnNwtJTeNuP99j7SEyLRK6+nmtXiNPBi0n5nhUTsySnhXOAlPFjdORG
	uk1tCsMqwamBegKUuXTQpsWVzydfA5O+PKD+2Pss8+7A8m0/F2/MQ11pONjgM+CZqvurGn4P90i
	KzaWWEU6B69uZEBTRNoPCDq5jo4ak0/QpbN8CVe4XO228fIik2Hwl9XvZtMIoE+ERSRyAqNe9EY
	6PGuXXpTmPr4m7TIGN6rj6sgVr5xO8uGdE80GiQ8fQHIR6QGzMjHGAuDMbNwnGa+1clKEdEIVFw
	B07zx+E6FW/zpg17yg9I6CNFKjRS/la8PTqkjIGwgOcK0uvLdPk7lOmNWoK28VFRfKfbKbxHost
	H8rOtJVSbM2GFRO6ftmR8ofzqroZYDfNi2bGWHMTl+NQIZsH/RpvDr6fOxsjO4yUhkliNdd2e9K
	wcjMZ3feD6PowkUHl+bahoPUDXBYPT06G/LVKm6OUaLw/klx4A4JoVw==
X-Received: by 2002:a05:600c:3b96:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb679a8e01mr129911935e9.29.1794814544761;
        Sun, 15 Nov 2026 23:35:44 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/24] python3-pymysql: Upgrade 1.2.3 -> 1.2.4
Date: Mon, 16 Nov 2026 09:35:19 +0200
Message-ID: <20261116073532.880420-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132440
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.4:

- Add missing return statement in caching_sha2_password
- Fix escaped percent signs in executemany postfixes
- Add two password-change error codes to constants/ER.py
- Require a decimal point for fractional seconds
- Check the server certificate when ssl_verify_identity is set
- ci: replace Python 3.9 with 3.15 in test matrix
- ci: adopt GitHub Actions workflow lockfile

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymysql_1.2.3.bb => python3-pymysql_1.2.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_1.2.3.bb => python3-pymysql_1.2.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.2.3.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.2.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pymysql_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.2.4.bb
index 3bda908ff8..2ab29df61b 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.2.4.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[sha256sum] = "d5b288529782e536ae171866df3ca9dc4f6cbfb3cc2f18e6f837fbb90dbc262b"
+SRC_URI[sha256sum] = "491558165b8e11f3644c5f9cfb30cc9c9111ffd54e53d3aa91b9a0a20be2294f"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

