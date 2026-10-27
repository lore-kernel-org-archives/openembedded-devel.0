Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14648.1793092844003401419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MWxYyhJ6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44630795e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092842; x=1793697642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2BO7IZv9vDL1TbKNuh6hNyYcAOQQYAPrPzhGCZQfJs=;
        b=MWxYyhJ6RxnGE8L2lWw8PvWlyzD9kWAAGTVEGAPA15bbfScXW2HdqUcBn9hA+OVf4u
         eDim4qcF7nt8luIOHyXq1paDqaNndXoegJiD5DJpOwfC/YbtgQLnRycnXsHRrwOfrAG5
         rov0kJwB4KodA0dSWK+W1Uq445sKHKam+hkwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092842; x=1793697642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2BO7IZv9vDL1TbKNuh6hNyYcAOQQYAPrPzhGCZQfJs=;
        b=SnifC344P8htgQBzKEFm45bD+egYlE7iWFzm3vIGhTIFHM/5OyCJqn7PfZPg4J7e39
         N+UnQ1CDRhq+noh5yuz260A2LJAr1KSPjYBrMGGVJOEX0E96CPgfu8azyf6sqR5j6dMF
         8EoY48PYKHEyrluLK6H7yacQR+f768AePpEUIt3qiTm0DL0SdoeesaXHelCGK+hXBmwK
         DdT4DG9P0SBr2Cfwd/D/8ldQ0ILAPQC9N0MHa8KHjAXMm9fDtHbttkuSwOyu3LoYuTSy
         qWXHN7tFkS3Bpgq+9SU8AT015XvJ4X3g0gz1TtiCP90YlaWzFu50CQghVLhb//fEVuUb
         1WoQ==
X-Gm-Message-State: AFq9FYI86TzvyXliPOxzkl+M9aBu6s3vdnPmfEougfap/El+mnU5MqlV
	NkBSwciyr/3fApLvhQlMhGLY4iUHrUiR3A1LlAORY+AMQj0Uh4JC48o81Z9T72dETcboGucG/r1
	JLt2i
X-Gm-Gg: AYBFou02w7uVqXGgInqsmC31F7mAvleq8GjIX5xjABn6i3JFIbXC4ejx92KsXp0HSKn
	t/DvUQx4aRYDXOjk46CFj3CP+x6PSK9giTVOrML//RWsYTKVRNSfKTBNnemB+ahR4DCLHii4Uwm
	P//2exnHJqQqRaGgtqUiFEQ17PY7r8BJMz5aihxyHpsS5WoN/AN0fSEzGbdL70sgBC1pV7WoBiC
	dhcY3R7mK//JOclFE8Lwtl7N3TwzEPzUNbznVje/9qKGzg8DqiECZ+mugnfnzcFGZu39Qif2CXV
	e/LwQH61YekZvKovXkFwNJ2iPLcnYXKR8L4O/Q16hY+zdkNeDe5fLdswuPAG+WeNZ7qhqY27SsC
	FHITJk1F2yIG0S5rgcYEFBn3fNBvKOvINRajv+FOpFpGwL2MzaON2zMcbcRRvJlgS0P6gRNhW4J
	hOb/w7/8XNYno9CAjEaLQ1tfKk/aRbof7XRddtxjovqMjpnv7vVcjbDjWyOqAbfk4io4SVrqt9j
	qdtjup8oxEPVppqefUunoWi1zKblGWMWQm3eJO4wFpCYqEWtMVRxO7cKgBWOaieJleAwtUSe4Xj
	TB3fFxVNcubR3cj0kg6e+Vey6do27qC856hvUmdT3Kj3PcyDoK2FGvvPuP6a2fbqj2FwFuXr/qB
	NmOES
X-Received: by 2002:a05:600c:c110:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a35ac91142mr160175875e9.7.1793092842343;
        Tue, 27 Oct 2026 02:20:42 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/61] python3-multidict: Upgrade 6.7.1 -> 7.2.1
Date: Tue, 27 Oct 2026 11:19:37 +0200
Message-ID: <20261027092028.782979-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131474
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.1:

- Fixed a regression in 7.2.0 where a subclass of MultiDictProxy or
  CIMultiDictProxy that converted its argument in its own
  __init__() raised TypeError before that __init__() ran; such a
  subclass got an empty multidict until its __init__() set the
  proxied one --.

License-Update: Update LICENSE file. The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-multidict_6.7.1.bb => python3-multidict_7.2.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.7.1.bb => python3-multidict_7.2.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb b/meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
rename to meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb
index 15848fefec..895988c725 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
+DESCRIPTION = "multidict implementation"
 HOMEPAGE = "https://github.com/aio-libs/multidict/"
-
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b4fef6e4b0828c2401fb983363985b39"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b5e9e27554f71f0f132919037cb967b2"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d"
+SRC_URI[sha256sum] = "e8af3e6f1bdbc31fd762b094133b478b89988eaebc63cbe82b1d9e3bbd15cede"
 
 RDEPENDS:${PN}-ptest += " \
     python3-objgraph \
-- 
2.47.3

