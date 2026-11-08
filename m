Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2945.1794165957131800979
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so127943f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165955; x=1794770755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dm6VLxPFj2e4Yp0gMQQd4Dl+hIDXZEoHVS62PU+/Bs=;
        b=ubJuvibUmrzyjlDUGfYfXi04Ym6VAaxU2SCOomqAW6+NvDQedlY3OYbliJpVfaJr1w
         HhHmp6o9QAUJFsXbWRKdPHbsHH2KC1AVfLjPwPwpWtj78z5nOe5z9Uw8iaItWJdFnHDp
         HqSR7jkhsKdVNuu5iSuHO7Ijh6PZX8P5NfA+6O2Edeo8Vyk0793OQ1uI5A6FLS/HQcvk
         axnipVw3SQwmG5yUIrh3O3P0NNxuvH3eY871B97Z/hkNcl+48abF90/Cja8ikIl16QuP
         DfoExlmrzdS9uCKfpaZNc9iXXzg7+vemruts2MItNxIj6eWmNTfvl/egkajIMKwNaD/u
         zqzw==
X-Gm-Message-State: APuU4Z9l9LPzD9HPQ0PlXvv/YgeCYwIQk949TG4eL1iZ2IqEla4jSEgk
	84tNMGB+PIeqLKLkbPJXhnxKvw+NT1tHaDvaXT4i3FoyvJjQie6SH8WnaN37Xw==
X-Gm-Gg: AYBFou2dciow77nWnnEipeag1w28UFS8pbbUd068wwlbwlRR9S3UvyeQRTf+4+YLizj
	neUSMXURTqW5Y3oUIjkHajoFKHK2JABcl/CoO1tJY00kT+RhX9B8UH5u3ZUfMxCzmJhko1UTmX6
	O/aAYACmlsPGlNqhCapk6+cw9/vDLu7nGnDyYgmTNuPF3BNm1SuoLtLYuhyixejSFfQq0MPGv8J
	hZ5q9OFp5NjOQdVNmV+DINM14NN1zn8j7AO9PSdwxUEBhrpnUtxWqCj6rsw3IMW4b4p+nJyMV66
	L0evZAeQ7Q+Q4oppIBLbvcTLhI3KF6aji2FaPTf0KFNCgyFi9yjPsXfHMOBL9kPQXAqC7k19fi+
	DaZJj8Yaj9c7oEp6F9L2Ojt83vwhPSiC4cIgfsnDOAApgIuIQ88lvNOg/LaehXs7JiKvXIM8F84
	YwQ2ixI2We58CYruQN7YDVLxkYLhxTHA9qMOn0D40ZHRaXIFPyXrgxuuzPG9u2bnxL/oUYPGex7
	lFvFWEQ+314sxq+RPT3VqY6nBk/n3OuZOx4cEsXdFC9Y6UJfdtfDbzN6rTm1XoJ3g7wAYr2TgnH
	jZsRFdGSkA6RQeNwkrmAYWA4FNjuLaQzPrCEuDyZjrfMPPNsQNUoWY5t/ODZFvRMZW/8IWXLyde
	W/4ksHuqMPTdwqD4PDlvJ2VH3UOE5Df8gqabZq5X1i3X89NZOMFgKyGoNUp2G7OK2fcUlWChCDP
	+eGyYD
X-Received: by 2002:a05:600c:34c4:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4b962a42ca0mr40747865e9.14.1794165955197;
        Sun, 08 Nov 2026 11:25:55 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1a517sm160930535e9.12.2026.11.08.11.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:54 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 4/6] python3-truststore: add recipe
Date: Sun,  8 Nov 2026 20:25:47 +0100
Message-ID: <20261108192549.1082715-5-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192549.1082715-1-thomas@roosesweb.de>
References: <20261108192549.1082715-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132019
Content-Type: text/plain; charset="utf-8"

httpx2 and httpcore2 require truststore. Home Assistant 2026.11 pins
truststore 0.10.4.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 .../python/python3-truststore_0.10.4.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb b/meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb
new file mode 100644
index 0000000000..1d778a8642
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Verify certificates using native system trust stores"
+DESCRIPTION = "Truststore is a library which exposes native system \
+    certificate stores (ie \"trust stores\") through an ssl.SSLContext-like \
+    API."
+HOMEPAGE = "https://github.com/sethmlarson/truststore"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=74420fc3965c4558a4a1529e63c2867f"
+
+SRC_URI[sha256sum] = "9d91bd436463ad5e4ee4aba766628dd6cd7010cf3e2461756b3303710eebc301"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += "python3-io"
-- 
2.56.0

