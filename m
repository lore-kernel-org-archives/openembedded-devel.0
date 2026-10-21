Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7508.1792574980624019391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S/+4rCQb;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1517bda04a0so521421c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574980; x=1793179780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNQsxVmwqPVTKy5cEzPnePID1JoMFJ87q7zrIsa1rvQ=;
        b=S/+4rCQbRAHg1REWo97VXTC7wIIk9iszPh/ki9sUSnKw0uIApr5fsAAIc4g4cSp0xP
         A09IyYrhb52ayRyjd0ikWuCLLb2BB0GwRpLgxHQyTAyiQ7xdGoPF5TEggSaDXTHdBG9C
         eh8x13wisZA2X5ovHKI+Ihm8P0F0mhjLRNm8QsoX1Z/8YiZizU+9zPjAW6bfjdbyF2rO
         s7pljfgER0cee+LbFxEFm8CUx9gBmyL/gPDSmAj0xNalSLTimfe9kenXiNxdsUTRwzjY
         mL+Zq1jikzXye66uGvUcCSJr8HTVt5CfAh2M8jWmJfukbaWmOfS59WCkfYbmD3sNRPaW
         WHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574980; x=1793179780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNQsxVmwqPVTKy5cEzPnePID1JoMFJ87q7zrIsa1rvQ=;
        b=Xlnq6iE5a67CSCw7iVL0R5erIg2asFEMMPUkUpoOSQlHZfE6/vfrQaMMKSDal/BV6G
         WGAoIBwiUldD1VFvGq/AsguS/Z6uH31sEeXAz3tjRXSx5qT260IoPxuJL9f/VQkB6U0U
         YwAeqPgZhbkOEv1FN8l2Sfrej663xN6xGb3PtjXZKhAB0czwMI0h6KNxmzZh5b+EjTgR
         g1j52p1p5lPL9GJjZWta5aiHhh4U/DSlMZF/juDneMsxlPMJsuXMRVCrIgf3eQto6YSn
         UTnzSDVxrvOBZodizMrl02bs6zTVKYk0ufunoEuO7PP8sA/ouSPNpqpICqsd2+z8h2sj
         EDLw==
X-Gm-Message-State: AFq9FYKwJzcI1ml+6cgNioHj0QpsTl1tlNtqd8T/gQTdmEkzAT7lqSr/
	kL9MRnaeEsedBZnx2C3vhojQyBp+w6l3bo42zeSaI4PyEjjmUphxyy9MshEdQQ==
X-Gm-Gg: AYBFou0TTR8h4qBJnDqBJoxN90P3L/XME5uJ+Uld2Exgak/VzKJD/pe5pG892tGNETh
	nlCCOZyv0r23WIa/vSjt/YaqYV8GY+lYkt4t606LMSBWb6OhqkPAKVrpYi6GEbmzy7PVLxyAOqG
	FxjtjDGst2NGa3KWZ6hZgmd7PvfpTK8fBwG9VdfrShbZES+EdTOM6uhrkyM5AucUeRQnzhHEIPa
	2+X64V1TzxTJ7OD/FWbWarsq0V7dcSOnNlkRJMiOImM0y13rhOXahJCHNadcyBq+kLz4tCU6Cv4
	svqLHckX88oaaVR3GIc5us2al3DJbO9mlEV2eM1Qj3xlqNkPo/9AtYZcOC7SvnbOzR9FtA6XHJC
	CrFIoMNoL+yI1pxK+sHwzBScZSrdNzAulCNY7n4eAYkzcqGtkBVetmEfRAZD1JWBgHk73nL3egf
	JW/XfMbWgZCgHdUV8U2FI61gQQfF2YbXkjhIOcPcJWYXiwNZX44GFas+lM8xFCssb/oDvSb9cpi
	4CmE6xVhTllNbjxRAGRt4TzGyXgbq34QZcPaBVsqHRu3nEC+cMi1mcG2G9DLesfXWoJ3dtnG88O
	8W3vu3FyHU+tq+kSOI/2gdY/+XIYtfbi8A==
X-Received: by 2002:a05:701b:4551:20b0:144:fb87:5b91 with SMTP id a92af1059eb24-190a7c21caemr1732793c88.44.1792574979878;
        Wed, 21 Oct 2026 02:29:39 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 16/44] rapidjson: mark CVE-2024-38517 fixed
Date: Wed, 21 Oct 2026 22:28:29 +1300
Message-ID: <20261021092857.3585453-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131203
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Commit mentioned in the NVD is part of the current version:

$ git log HEAD --oneline | grep 8269bc2b
8269bc2b Prevent int underflow when parsing exponents

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-38517

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index fa20b4d448..f565f0a175 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -21,3 +21,5 @@ EXTRA_OECMAKE += "-DLIB_INSTALL_DIR=${libdir}"
 ALLOW_EMPTY:${PN} = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-38517] = "fixed-version: fixed in the current v1.1.0"
