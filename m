Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37961.1795594136171504326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EtHXKjrG;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so8007358c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594135; x=1796198935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVclLtCpJ3tukSFGeEqdfXdpERhkvWARQFITYzxKZTQ=;
        b=EtHXKjrGoza4yb5JTrIw7bRZnYwCMl1mGluiWqQGMUePXFlFRUYxNSnZ86eaBH7Qd1
         3FdEa4RVd9S0a/cjAwfVCGS6spzlMGeHsM3T2aInWUqeP6sNqk/PGvjhrN6OYE3kKal2
         7TDj7b1XMT8bh66dGN7yghK2qyjtfN1369UNEv8fBnd2ukc3skEkSDWrA7ezl+tPzEIB
         RuvbzMxq6Fh2WxXX1xKsQQP3sL1GLNYqdSH/u4ezCAJEEx24bggXNb+It1BVJUag5vIi
         W88YhdpFxHRk2T7lVgyTbzXyTsTjEHInhnr+Vqb4VxRGGShyI+NSZy9tc3XWQcXJnWhB
         VE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594135; x=1796198935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVclLtCpJ3tukSFGeEqdfXdpERhkvWARQFITYzxKZTQ=;
        b=eJqFES1WwynYxIuYoAsE9Jg62ZJXJVirQKqFqOrilWduDB6oDIS2Ptefi6qnyPKvy5
         jVjOb6CRDnHpWdKFvcHWbzKGjBmzasG+zgTaugOxUU9vlv72z31GKw7ITV34UsWWAFPt
         uFHGrdoOFR9YIrPaJM3nfVO92dOaaa5P7OCC3IvcWcL6okyGQv+TgzQZUUi6jYWpPs8N
         wymsMa3rPejPQIaK+lImLJKst6BmulLMRftKxvMkhk8e7csjSOTfwlK0GnqK6oIbKqtO
         0+P/HQLPOQIbgszcvW3YwJnjTG9K6yCZlAkqlWQsruoc/8N0g28Ht9IfNjAIhmBKY52d
         zqNg==
X-Gm-Message-State: APuU4Z/rwImEO80YcrCqYAYy23WO+YVIgxU5ijo/Jyq8FrH2ssBl+m10
	faRmSrg4FVs6qmCBdPviRHp/Fo9kzKi5SVxSTPpjTKu1IuIsAO5qnR2XNu8fdzgW
X-Gm-Gg: AZFdTZdZRenKFE3KD2yqzsYFrP90zig9kgs6SBQ9vTPKfZnTOQYaB/iUsWdJ40TW7BF
	j8K2IXlF+idmFFyWsfedhPdnzuZN1Q0zeiHsUoDN6Llk2FjzpT7Q7+4rrl7RJjdlv6YuatjuYXA
	SG9+Klq0ir0yqST2cwvhagW02kQ74PmtxmCBb5OEnGpPISkmdwv00TjsRXUwheXCZzP2lM2BdPT
	R/8iUjh1vehlUrpzmZ9QyPugqQAglMU5AEwqZK6DIgz2klZL6pBbMCbceWGU5R2u5B/QdNpbqQq
	NSCc5k3vF9oOHm3GmvbgrGX4Zy4eWlK1jhga+YcwzhUC44EBf8rUxu1XCIYtnDXISblv+alTgLl
	WRHmK6muvQHLXu67X6wCPvAu7jWIfqp/91d9iELHCtre2AWIqSwteT2aPL9lRzGoxIPFb+7LB/4
	5rrJft9pphGYlAymQM7CVedtjmBJUiZynLgDI6RKAKTHnsYMPP0TuhKNKTUPe2hvl6OxbmJDOVZ
	AA+Wk6tD7BUVQnoXHg9H971STdnq04llVK45zQ3aESGbHH1NbIvKBCqDod8Ts5tvhKbwMJPwcp2
	HdPXxfq5ZmY9mnPKCc1TTimTnxnkuSgEACFfcPzodTZkklY5/08KhOs4rnpN/dd8G4WBF6GCi2r
	NSO6wLGdP7NMzVHp8Iq2CpO4luTjjfuErKwcNKsBNh26J84ZM0vKCjlUej2YRKyzZgdy16zVrb+
	L+qGtMUDAiFVq8Lcgjh51ifxDVr+KD04NiqF+qsdgsWp3Mw325cow+FB3UJSFRV3nqBy7+MT9NE
	DBgDTBYV9G02BwOWc1q+YAt+EfUhSJu8MusXIDL1fCLsQKM84gMOONT4ysZ+HNQEKO/kaQ9sssq
	C367Tx+21TuZg8swQ+UebbH1lg==
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr13331707eec.11.1795594135341;
        Wed, 25 Nov 2026 00:08:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 04/14] python3-librt: Add recipe
Date: Wed, 25 Nov 2026 00:07:15 -0800
Message-ID: <20261125080732.2419614-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133062
Content-Type: text/plain; charset="utf-8"

librt is the mypyc runtime library: C implementations of standard
library classes and functions used by mypyc compiled code. mypy 2.x
imports librt.internal at module level and requires librt >= 0.16.0.

It is a setuptools C extension. LICENSE is MIT for the library, with
the PSF-2.0 getargsfast.c and the BSD-2-Clause base64 code listed in
the same file. A native variant is needed for python3-mypy-native.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-librt_0.17.0.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-librt_0.17.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-librt_0.17.0.bb b/meta-python/recipes-devtools/python/python3-librt_0.17.0.bb
new file mode 100644
index 0000000000..ede8d657e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-librt_0.17.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Mypyc runtime library"
+DESCRIPTION = "Efficient C implementations of various Python standard \
+library classes and functions, used by mypyc compiled code and by mypy."
+HOMEPAGE = "https://github.com/mypyc/librt"
+LICENSE = "MIT AND PSF-2.0 AND BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=42baf4796d8073a1896b15d602af78f6"
+
+SRC_URI[sha256sum] = "fd18d1f708f78577556a7d76505048b9e3ad6ff61b8d9c91616a5a3f1e6c770b"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "python3-mypy-extensions"
+
+BBCLASSEXTEND = "native nativesdk"
