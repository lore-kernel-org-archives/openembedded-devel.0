Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE0FFED9F6
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:23:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81724.1773768231871867669
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nG4lLYlN;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485392de558so36264925e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768230; x=1774373030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6ZBhW7BFuVEPLcGNG2UmQcMsiP26TNH5lAl3NjccQk=;
        b=nG4lLYlNIp+L1GWS1NOPV8ntOKk5A6dgwnd7QegbmrLD+AGCLqjwvwG9iU2kJ9TnWh
         Aq0JJRMMslVqRDdWZkU453eCEMn5mX94ciF62iJBlieXDF2nCgH7uN9WXdkU6DsxrMRX
         PbZIKKxUCEuGMG+XwbA+gU96LDMYnwRHhYL1++X3x4gMNbyVizeVos2cygvdkXt9sMj6
         mVFG79g4K3RtQZWuhMcik/XSbu7lzA+PuTMerFzeuWADFZpz16XfyX1DzMNPODn9o4+4
         YRXrJYwJLWOzJeHtSRlZSqkS9Eni4PQAzuoz7HEYq8mJUA98zGwSN57wJb3fkMM6x4vh
         Wmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768230; x=1774373030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6ZBhW7BFuVEPLcGNG2UmQcMsiP26TNH5lAl3NjccQk=;
        b=on3S//A505fyVolVHyF8wqZgRm1zYUH1YkPcVUeNKcRNn7ZV2kGkWmroaOh2yvNspB
         uRYd7zgCfU2X+zN/d85DvF4Zwgrykh3Gdct9dWUQlPdOMXFpuRmXMjpJSSH2WS10JWB8
         rR2v2v3u0NgElpkmSMkVUnajBYyuzfTE7tFBoy66pdNzD7eOzwZZF9HOYUmF0KO7wFzh
         euaK48n8KvhFj7nHxA8IcZ7HAeAk0e2FoCiDl/+EvnqnGt3b36mHnnnJ3cmJQeqJlj7r
         1h0XWNIGcV9G3bvv+3MiPBxz84bAGqIEhsl2mgWu8TdsXuT6mu0H+TyYZzAMJLNFgxqS
         NYwQ==
X-Gm-Message-State: AOJu0YwQzu6gj9mhiYyzDJgwgfpIeo6Pwpa/LV6fVzPIeNe9/G5rjg5T
	Dtx+z8/HcOGHP5WTTNu5jZbEiXEMv0Ypy4Q2fIdLnTvbTq4rRw7wRZCgdY3nRQ==
X-Gm-Gg: ATEYQzxTT1Cf8+yF/MdwoPdJLhIffU98fj750UdPNDAc+3f9J8JfAADHxSekeBEm3l9
	qRKx8XiShrPEUU/3V8+EwqCn63MP+DPObd7aeuecEi49ltKBt+/LX8gNKUZmATvoLUQc5oj59s5
	GykauctnsQG9gdbOfKsEyuS5Z9l1Y8cQ5BDFSMHJpRXjVfSMr7SySSAcT+wTlrFwNY/8PjXDd44
	63Y8G3qpyrwFZfC7xOfJuvSQhNxZ1BB+uqrnnHI6AEKV71heiz5B8ycqXu/+btqaDmAt8TxWAfH
	c8plde10JwPe+5A/zH9mWrAG5ews1hd65oEgkkYnTt3XdhbJL8aIH87qyFBPQ57DlB8hrU2rJii
	dXfvL5rdympIbfnU0RwwZ8xQybMTF95TeEwTDNCmQ+JzMwAo2Aw7t64CcMYAUFR7uVyKsFSYU9O
	MtF9tpc0NZr7eCfVTq1rvC
X-Received: by 2002:a05:600c:5394:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-486f445fb3fmr5631325e9.24.1773768230042;
        Tue, 17 Mar 2026 10:23:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm61717385e9.2.2026.03.17.10.23.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:23:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/7] python-pyjwt: upgrade 2.11.0 -> 2.12.1
Date: Tue, 17 Mar 2026 18:23:44 +0100
Message-ID: <20260317172346.2862459-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317172346.2862459-1-skandigraun@gmail.com>
References: <20260317172346.2862459-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125327

Contains fix for CVE-2026-32597. Since NVD tracks this CVE
without version info, mark the CVE explicitly patched.

Changes:
2.12.1:
Add typing_extensions dependency for Python < 3.11

2.12.0:
chore(docs): fix docs build
Annotate PyJWKSet.keys for pyright
fix: close HTTPError to prevent ResourceWarning on Python 3.14
chore: remove superfluous constants
chore(tests): enable mypy
Bump actions/download-artifact from 7 to 8
fix: do not store reference to algorithms dict on PyJWK
Use PyJWK algorithm when encoding without explicit algorithm
Validate the crit (Critical) Header Parameter defined in RFC 7515 §4.1.11. (CVE-2026-32597)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-pyjwt_2.11.0.bb => python3-pyjwt_2.12.1.bb}      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.11.0.bb => python3-pyjwt_2.12.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.11.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index 4e81efe45f..28eceece97 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -5,11 +5,12 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "35f95c1f0fbe5d5ba6e43f00271c275f7a1a4db1dab27bf708073b75318ea623"
+SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
 
 PYPI_PACKAGE = "pyjwt"
 CVE_PRODUCT = "pyjwt"
 CVE_STATUS[CVE-2025-45768] = "disputed: vulnerability can be avoided if the library is used correctly"
+CVE_STATUS[CVE-2026-32597] = "fixed-version: fixed in 2.12.0"
 
 inherit pypi python_setuptools_build_meta
 
@@ -19,3 +20,4 @@ RDEPENDS:${PN} = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+

