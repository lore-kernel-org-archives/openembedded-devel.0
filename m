Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D553DD2E03E
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:42:59 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1473.1764924179274675370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Jn9WYKfD;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b736d883ac4so315939666b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 00:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764924177; x=1765528977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bq8DWv/Ki3ROpvUbSjUwONe1qjAJrI2tXhHu/yb5Jwg=;
        b=Jn9WYKfD7m8nVsyA5nD2SehOcI4mRUthZJ+8v4Pm4IbwFH3K9G7kny/g1FY8iLHbi+
         eDTNI5Op2Ore8J/+wY583veS0tMD+LWEPuXHpDI0NNbDVD6L5faChFCIDeNRSSXzZRei
         XKO+MWZVLPn5yBI2prLCR/lDY5QwqhAXPys9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764924177; x=1765528977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq8DWv/Ki3ROpvUbSjUwONe1qjAJrI2tXhHu/yb5Jwg=;
        b=U7uqI5uiiNwiwI0UP6uND8fFqsLHir3HWrVCi7f3Pp9Gv/8COGSz7Be3n5fEsQUdW8
         rQdW1gciejw2WMW76Eer5h43t50gutcm/+o5gU89PFSOFcZ28S9FHoKSKUwAtNeqc6Z6
         4mKkMV2hcodVgTSYlPkxUcnX7Q+WvoOI2rzsjh3m+LnAPPxnySux4KhyL6DsSejYpdJE
         d5ZVFc/f9o6l+exL3gej6Q3WKFX0zdZiWW62TnTv9pfRQXPwI4U9k+gMIFjAq1ps0VMR
         Zg+VVVE1c/Ys46nLup1z2yTnnI7b9uCjiynKeevlxvZzVRfTWD/uF0u+dIfrr8bx/7Kb
         uT+g==
X-Gm-Message-State: AOJu0YwlDf5umM3zJ1YfqrYCKRVoQ+9AbI7eAuBpL5eCF6yAkIVg4xG2
	lH9y8NyKPd0lUxp+mYXI8dm4XfXUtugDk4z7XdEPqtUNnwvT9NFrqOzmfSyAijRUu7bDSTn32ZI
	jPJx2
X-Gm-Gg: ASbGnctBB2w8vzeO4WqJlbcxtCNo+EFnPuwHdNQ93QhIOBKqCZGJyf0B2Jz+M2AfPgM
	4wDbv31ttoVIDA5ZcEgVpG79Hm7b6aHHYAR4csrySByMxxEaslaNwCO/8sIcomF1IYxnTin+VLm
	2UuTXK5AzfzDKMs4ZkR/A4Mz2jbYgJtpy3jRr7NTOH1DmkEfO7KQUChGHBv6zTwuRmj2w5f6IXk
	bJO3NAUyR48M5gYl2D9Vu4X0IHdDS32kn7WwW28do0vIGmgUS2xUU3mfVhNSDD392CsB12l8OYK
	Fd9znDuTdJ2M6RgIxyIqfs+FGExTgGq5GQUEofAiWJThY967QqGMfdGl5cvc4zr3RU7yV+XueF3
	RHEi2ih8oNDBm+gg4SvTTAKBNMlCuMzoCrMA+fDWhAW6fJM6reYOydUq0scb1Jx2NC1MDC5dMlH
	Q6jU6dd23tVRf/6t+0hIKqo21M
X-Google-Smtp-Source: AGHT+IHBDERUGX91fs19oxuLnrvnxd/hfQr/sLPNtQp6xdNlk5boHPYehE1t9aAel9ldlE0Q2j7jdg==
X-Received: by 2002:a17:907:1c17:b0:b70:e15b:286a with SMTP id a640c23a62f3a-b79dc7788f1mr937805466b.57.1764924177188;
        Fri, 05 Dec 2025 00:42:57 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a53d2fsm309926766b.68.2025.12.05.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 00:42:56 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-autobahn: Upgrade 24.4.2 -> 25.11.1
Date: Fri,  5 Dec 2025 10:42:54 +0200
Message-ID: <20251205084254.1810158-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 08:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122342

Upgrade to release 25.11.1:

- WAMP Flatbuffers serialization test coverage; WAMP message
  classes refactoring
- Add WAMP serdes functional and benchmark testing;
  WAMP-Flatbuffers; WAMP Serializer Composition (transport/payload)
- Add vendored Flatbuffers

Fixes:
WARNING: python3-autobahn-25.11.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-autobahn_24.4.2.bb => python3-autobahn_25.11.1.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_24.4.2.bb => python3-autobahn_25.11.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
index d785a76cc7..45d2fd5e8c 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
@@ -3,9 +3,13 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
 
-SRC_URI[sha256sum] = "a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9"
+SRC_URI[sha256sum] = "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    python3-cffi-native \
+"
 
 RDEPENDS:${PN} += " \
     python3-twisted \
-- 
2.47.3


