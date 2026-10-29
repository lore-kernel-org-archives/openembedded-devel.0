Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7652.1793265715190660438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NFAfjPNm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so22425025e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793265713; x=1793870513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxT0pfefAVHWs17gTKYOH+u7DQH1wFaXN3wcg1EOzLk=;
        b=NFAfjPNm9wd7azSZGVtjcy6LUP9woGX0i9gu3WqtSrO4J8Vlb2F+rCLot7wultTAiG
         kuqcFY5L8Y7BvQlpZm8BNllOIf2a2PDquJUEZTuCz/+eYYPs+ja9xqQft1rPSZpcxQMH
         l0+tcfbqdgVa1UnU+RUnvoNFM2hY5IHYe9K+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265713; x=1793870513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxT0pfefAVHWs17gTKYOH+u7DQH1wFaXN3wcg1EOzLk=;
        b=BM6hHfEMKQ2SuuD0QjZnacE3EgqDHZVE4XhHf95EQP3SID3dZNlZNDE9vGjsSmb99q
         fRJEL8h7IFgEvIBW6HJbsgUEw6NCfCQpWiszL/UdsreaxqddzBBzg+QwqnOuzvHL7Ack
         tPpiMEqShtp888LLmQ6x7ZsZ61Q2BYFpB2/zunIpuGYmktTFG46z0VQAI8ellw0lSyiU
         iu7dwTVz4oyFrTAfHqlSAiutOTC6YkokpjB3cIitS/eOeObaraYJ2hOLc/uQnbq3ORYl
         vX0t7aze+f/deftuwSBCP5irdDkQjMrAK/BhcfVw+fzfgKhL6gD/u5l0YGVQnWR/Ds3K
         womA==
X-Gm-Message-State: AFq9FYKHUuGskybxNFBqH397Lt/22rPYlGJV/j9xxIfzwm0Q+A3VI/x0
	nR8a0zSXaxQN27oS7jDVio1H5hekbwdnRKAOWn5n8ey//s8uIPqdTTkJPKDzdlo30Hg+hkneZJX
	5s1CF
X-Gm-Gg: AYBFou2KFEDcwodF6qtXiD0H3eC7T4q0vCbmqPLB3JA6GET+60FkR3u9LkLmjPWfqmI
	utJfaDc+7ZjW4B0+BAVmNHJScNRU9fRG6xfyOJSAcTtcGIgwNtJKXzrW+8hgkiVwRCGg7wkDfWc
	BflzDbBKDh73RjvHFEEMXoEPJc1NqW7fkGgyQrsCGINVUNYOI5aMmXKVgYla5LMwHaEljBlfI4l
	gNn+eFTExVq35LAQDbtpVYZ2fp/G45zPq3h+WTj4roZYwQmbjT++zFrAIY2cHjt70LHe//OlTSX
	eafjngrVmVOjBsUO6gafhIn2tCy5Adq2OqMHCzlrgnrLFmdU4LXwzIoaviTFiOKOm6ODv/09eWw
	YhhhUvkjztoSHs51IaHz6pVM4jvMm1EGMwP3zN/Fa0vm3VR9dtGZbDCFpOA6AY8Xuh6lumT2/Kn
	zTkbOO6X4XmlegqaZw3nKpRZvigCXwYpbjt5hnK3zKuXobfm/2jAxjK4aRDQbTiFCEsVh0CQ9xr
	AEGWeF1Xv6JTiuT78DYs0g9uD3GNwiVz5XlgwBWJ/77NZNVeGqLHMFzWu43rQXTJ5z+5S0oT9WS
	TTesUxH+Y9m7I4QKQRq0SP6nKJyzeTNik32zN34UwfBfEFg0smMNExNXHMvbAQKVQEuQeiCJpEk
	RRylGftQKMfSOB+egwN5J3KB8WP3YC5UOBwzKTuPgn3UDrK9YdzkvqA==
X-Received: by 2002:a05:600c:37c3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a96701830cmr106795345e9.25.1793265713137;
        Thu, 29 Oct 2026 02:21:53 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm31901084f8f.55.2026.10.29.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:21:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 3/4] python3-multidict: Upgrade 6.7.1 -> 7.2.1
Date: Thu, 29 Oct 2026 11:21:46 +0200
Message-ID: <20261029092147.791220-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029092147.791220-1-leon.anavi@konsulko.com>
References: <20261029092147.791220-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131647
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.1:

- Fixed a regression in 7.2.0 where a subclass of MultiDictProxy or
  CIMultiDictProxy that converted its argument in its own
  __init__() raised TypeError before that __init__() ran; such a
  subclass got an empty multidict until its __init__() set the
  proxied one --.

Fix ptest-runner errors.

License-Update: Update LICENSE file. The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-multidict_6.7.1.bb         | 18 ---------
 .../python/python3-multidict_7.2.1.bb         | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb b/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
deleted file mode 100644
index 15848fefec..0000000000
--- a/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
-HOMEPAGE = "https://github.com/aio-libs/multidict/"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b4fef6e4b0828c2401fb983363985b39"
-
-inherit pypi python_setuptools_build_meta ptest-python-pytest
-
-SRC_URI[sha256sum] = "ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-objgraph \
-    python3-psutil \
-    python3-pytest-cov \
-    python3-pytest-codspeed \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb b/meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb
new file mode 100644
index 0000000000..9ec7ea3eec
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb
@@ -0,0 +1,38 @@
+SUMMARY = "The multidict implementation"
+DESCRIPTION = "Multidicts are useful for working with HTTP headers, URL query args etc."
+HOMEPAGE = "https://github.com/aio-libs/multidict/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b5e9e27554f71f0f132919037cb967b2"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+SRC_URI[sha256sum] = "e8af3e6f1bdbc31fd762b094133b478b89988eaebc63cbe82b1d9e3bbd15cede"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-objgraph \
+    python3-psutil \
+    python3-pytest-cov \
+    python3-pytest-codspeed \
+"
+
+do_install_ptest:append () {
+    install -d ${D}${PTEST_PATH}/tools/
+    install -m 0644 ${S}/tools/release_notes_md.py ${D}${PTEST_PATH}/tools/
+    install -m 0644 ${S}/benchmarks/callgrind_driver.py ${D}${PYTHON_SITEPACKAGES_DIR}/
+    install -m 0644 ${S}/benchmarks/benchmark.py ${D}${PYTHON_SITEPACKAGES_DIR}/
+    install -m 0644 ${S}/benchmarks/callgrind_child.py ${D}${PYTHON_SITEPACKAGES_DIR}/
+    install -m 0644 ${S}/benchmarks/istr.py ${D}${PYTHON_SITEPACKAGES_DIR}/
+    install -m 0644 ${S}/benchmarks/operations.py ${D}${PYTHON_SITEPACKAGES_DIR}/
+    install -m 0644 ${S}/benchmarks/render_tables.py ${D}${PYTHON_SITEPACKAGES_DIR}/
+}
+
+FILES:${PN}-ptest += "\
+    ${PYTHON_SITEPACKAGES_DIR}/callgrind_driver.py \
+    ${PYTHON_SITEPACKAGES_DIR}/benchmark.py \
+    ${PYTHON_SITEPACKAGES_DIR}/callgrind_child.py \
+    ${PYTHON_SITEPACKAGES_DIR}/istr.py \
+    ${PYTHON_SITEPACKAGES_DIR}/operations.py \
+    ${PYTHON_SITEPACKAGES_DIR}/render_tables.py \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

