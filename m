Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DA9D2A015
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9430.1768395676070391817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V27svs7M;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f42a49437so1792001b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395675; x=1769000475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxMNWvtbKDuvoqhKOp0Do8Vgy1AHiQLF+BmMvzbTSGA=;
        b=V27svs7MsRwHiPPMk6Yiu8N3pw05H1ulGB9Buc95w9Pie8Z/KtW6IWuxM5GVtNOgmi
         SLtXxMl8rh4iEgFIYpP5EA8NGUACoOUHpbWhUvkT4fglenq33goxJxG0uLDYQoUBDU7X
         Iw/TTsEl0DxcF2q02KmOdMQQpnV5DibT1duKxWYDd99NyrUJMVBdrjUHJs6/UZy+vSP4
         YwXeQl2PsGZQ7ErfjAUW6D/dbt8kGG+eOW97QCa5L6ayl3iiloqbT8fAK1gTaO3CVCr9
         Wbz3mNa3OPkPsk28NM3AlBXebuugsJb/Gom0dlQ6SZ1TN6YJxW25/1GpPXGLIP2KYEmW
         KZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395675; x=1769000475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxMNWvtbKDuvoqhKOp0Do8Vgy1AHiQLF+BmMvzbTSGA=;
        b=ST+iDy5EKRJMdx8a76wZqe4ThLlSrUU+sTz54gkqdhBKuopq+fRNBwhtlR+VYufKj1
         gQ2zgfDnnrmuozQ/jRZqL7+1CH8tEX5GoP58PJNhpglhaL8EQTqPu6AyDSfM9Uj0Gu7p
         cJrTU5EYGehuvv87V+nG6OvQYcDFU4TrxOrffpVT0u4nqiaoUU7u/vVh5UNls8//JGpE
         3Gl9w9lACBKt9crX7fMSz3xLNtq2ivKVCCtS+H+gKoC4m1jAFSUQhsMkH/JaEOOKFNvX
         DYpfetBn1aW32FJm2XvDQwJt7So0SGk39jIisv6YZ2h0TcvBtACLWN9KsSkSW5BQmuPr
         k5+g==
X-Gm-Message-State: AOJu0YzZE/7mevXanbjjpyzZdk4GqfHppMr3pwK2LPaBfMlUUxqx/f0w
	p07sOFEhTo7uQHRLbs74MinQehyOy5Ast86hexP9JYJ/EaTPWdsm1PX7B2edAQ==
X-Gm-Gg: AY/fxX4S57SZZGxzfXkZshJy9hU6bgmbBuV12sIREE9DFie4CgJKMBZf68QnpquKUlP
	5N53IE62MmoWeFZpIak1UVuNkfDUsDAY2Kv4ByvuZdwHa5N0bLgSmAZVykiorw4YxwsZKAjnth7
	E/Dq0HdDhF0PXdj9TAsvx2+UklSinHEPLJEYrxQAc9Pc53MrAbGbo8YRelS29IAiGpDYp0tpRg8
	v6tZsBMsDbJpa1IZgZGRPKnVkXMquxPUK+S6QBFsCmmGtR6srkm/rG1cYcd0kcQs50HKQ98RDu3
	14zP1FcEnSdG293BiIuBioG4hVrTAvtBxOEo3dLfGOIGsJFwl7c41pIpHxWrISfWz5NtqUCwUmC
	hD6GaaC1fOV278aGXkwsLFbgx7Uy0nrTK8uGi3SLqArEF0Qy4vKmpjXedzSILO0PuQLJ2ZDj8Zr
	9csezdRpDyIcu0uwo6U4Y3Ahc=
X-Received: by 2002:a05:6a20:7f83:b0:35e:11ff:45c1 with SMTP id adf61e73a8af0-38bed0d8a1dmr2683857637.18.1768395673655;
        Wed, 14 Jan 2026 05:01:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 04/20] python3-cob2: upgrade 5.6.3 -> 5.6.4
Date: Thu, 15 Jan 2026 02:00:41 +1300
Message-ID: <20260114130100.1016416-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123457

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fixed compilation of C extension failing on GCC 14
- Fixed compiler warnings when building C extension

https://github.com/agronholm/cbor2/releases/tag/5.6.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-cbor2_5.6.3.bb => python3-cbor2_5.6.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.3.bb => python3-cbor2_5.6.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
index 69573064bc..f0c2964f34 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
@@ -4,7 +4,7 @@ DEPENDS +="python3-setuptools-scm-native"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 
-SRC_URI[sha256sum] = "e6f0ae2751c2d333a960e0807c0611494eb1245631a167965acbc100509455d3"
+SRC_URI[sha256sum] = "1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f5b108793f6983e"
 
 inherit pypi python_setuptools_build_meta ptest
 

