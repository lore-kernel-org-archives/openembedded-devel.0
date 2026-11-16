Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33680.1794851742632915938
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sciI8T6z;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3791619605cso7087508eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851742; x=1795456542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSC79QMcv00IoA9BfAapyYMkM6E/+KJ5BI/SUO0iXDM=;
        b=sciI8T6zAYSFOzmeS8kTm5thIWhcKY/UmI5weGXEdUL/3l12cLPmHncEWnmlqNmhpy
         OZWqYnATSnwXs0QUXgnJOv8jEMWbpkoP1gPLVha+X5EXf3MuWIhIinJOmG6Xw1bzo1L0
         VUc2ImkIcs+EdRfJTLVioLGGLxs9nqTBSNhosJQbKX2DBtk32SHiyUqFuBPwo9dCZVD2
         CAKG+0GJsVOAT7VvO+8809QTPMionsX5/Ig5zp9xLMV66YmA6bPSjbZh2xIg0jw9Qhz6
         ixk/VMJkEXrke2e+Zed+Cll1W2NC6ykhmmCFDZjfjcSiQAQihXluZeCv7KBr8dBTW5Nu
         ++ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851742; x=1795456542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSC79QMcv00IoA9BfAapyYMkM6E/+KJ5BI/SUO0iXDM=;
        b=DQ7pAhqFkwdO60cQxufwT2cmRsF/DeEOQ0BHOeYUuw0+n696pdF7AaJxDB6Sb9K+K4
         uU5QzO51hvqLHiBJWpDS4MePe7xhLe5YV27NUSjSpXQ5LRuM2xEx/ykzwFW+616/OPh+
         2eWNLJb48kq+wTe6ogvheFimWRxhHyIABvDWTJ+yklDrekLTVzB5rsZFhtlaw1rSVUgq
         ueS0Rz3wkAyaB2lrF7uk+RXaZG9HMcdhOVahGZLNcWLCcdOG5f1hBL4KFCdNtmv2zke2
         XNqZn1gxOd81QTtVydYNgrdMhXXYEnVR1j2aIPCoZbSydWLx3fPG2q6TA6RhzazqBw9S
         k39w==
X-Gm-Message-State: APuU4Z8JHRpaREondWJ6yAdxHLVq5mstSDbI6+2y3GbiZ1P5fSjuOBeL
	pny3af+o5ZQPDFQYJXLquspBpxTJxX8mUhYt837tWfzRCHjquqwrmJlx21miPz5y
X-Gm-Gg: AZFdTZd01IZQyMU2rBlVYsBIc0P8EAdZzQqjjHk3bylGPeSS2RDGY+P/bnh6bd/w6ZC
	rmkni3IF729pFS5RWCEgyJERiPapzQHwwK9mj8EuuBbZMBnVYT4x23nKmclkWqMLDouzAW9xSaS
	J0lkJQsDNkLhS30yr7o9ebnMB5iLgngh0cI+yp0CO0n+RLFxhYYPIKdhOvJtM2LgmO9tH/aWfXG
	za5uz+f+SQpuPHv40aSJdEALhXk+tSdwg1o8SOIP56Nx645T+efxVhCCiXP2tVf+jyNz6OOvFJD
	B2HOnY5X6CGnzNTZnX2J60c41SRqecNbWoru4e3Y5msxJVF/T+UvH9Eq9Cf77NiB82EiBmstcrv
	3EZf/PM3sA0MYfM6BktopNVK/W4PFDW0ldJiLPL+8agUHq+asfK07vI53obnsB2YhQnleRkDvxV
	hDgFwStESe7CRy0HoHYRo0Isw85jMPnI3cW4POIqfykprh4M2W8pMOY9PDsJFXGVOQU3H1Htnal
	9TKO+u7vhGdVruIaOMj34cRTXnHOjHeiNYXWuxjFFOCQcYebD/qB0KC8d46l4vQxQZixiJ4JtQ1
	vgyVHpDkbydwp9fQqkNApNQPO1hlaB2kQ71r16edswbK1GSJeB4HyR2Br0kdOyx/NwOE8UNhXem
	iOpPTIcmuh0G40bnSMl91TYsxS8HRT74PrsjgO791RGEXmTTWADe3Hn8YFiMGpTn0iWr8OyWFV2
	HBeooxnUewAQ+aZn1KIkLdBS9A8n2tR5jNTasyCiQysVLb9zqI6ovMyJ25/yX7BGPIasL7ifE2J
	xSnchQE/jbaaC9DCMCYD7lV2JGfnkXDhGtbO/P6dY0NcPWKB1pO3NMaC9xoQulhqDpdXgQhntBA
	eICX
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr9788534eec.15.1794851741904;
        Mon, 16 Nov 2026 09:55:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 072/105] python3-pymongo: upgrade 4.19.0 -> 4.20.0
Date: Mon, 16 Nov 2026 09:53:24 -0800
Message-ID: <20261116175359.342679-72-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132528
Content-Type: text/plain; charset="utf-8"

Changes:
- Breaking: removed beta QueryType.PREFIXPREVIEW, SUFFIXPREVIEW and
  SUBSTRINGPREVIEW (use PREFIX/SUFFIX/SUBSTRING, needs MongoDB 9.0+
  and pymongocrypt 1.21.0+); removed the text_opts parameter and
  TextOpts class (use string_opts/StringOpts).
- Client handshake metadata reports a detected coding agent.
- Fix C and pure-Python BSON decoders disagreeing on UUID subtype
  binaries with non-16-byte payload.
- Fix MongoClient(maxPoolSize=0, minPoolSize>0) raising ValueError.
- ObjectId now rejects 24-char strings containing whitespace.
- Disable TLS session reuse on Python 3.11 (CPython memory leak).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pymongo_4.19.0.bb => python3-pymongo_4.20.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.19.0.bb => python3-pymongo_4.20.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.19.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.20.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.19.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.20.0.bb
index 820dc4bc14..df07df8c83 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.20.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3c510dd3c5d9b392d3b33bb5d2a594758acfe8f026fca654253f947ce0af9d40"
+SRC_URI[sha256sum] = "f773b0aec28687587cdeda490463a82debc4566a4a3620dcc8dada9d2c0a1acd"
 
 CVE_PRODUCT = "mongodb:python_driver mongodb:pymongo"
 
