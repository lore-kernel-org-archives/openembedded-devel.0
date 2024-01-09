Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE9EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:52:10 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.16999.1704808321047474366
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nS3U0EiQ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso699402866b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 05:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1704808319; x=1705413119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mp2SZHWr21YfHqXvWPzBzSgOtyPxI1NhNNqnreVWtmA=;
        b=nS3U0EiQtAbzDI2US4bWQosgS1Fbu0z6WjviQi429hxNI0D3gbqTzXi3tM8xjzE3yo
         tu2pjybol3blps+f/QpO6isKhZxgir7H38VUInLVX4Y4jYPUeyGBqj5dx0XzpBv1USi2
         a46+z6k9FOFRiqcsNfTza3RYoeBCBaCzEGtTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704808319; x=1705413119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mp2SZHWr21YfHqXvWPzBzSgOtyPxI1NhNNqnreVWtmA=;
        b=mP6Ukzfqg7ePzZHxEI2gz2N063QDLwO5Gxl4k6dPr05L24sJqA9mfbuVFfUNUds4uP
         psziG6batd0YCzn4g0BbEiQXTc1gK+qQql+w9oBA8zqUoS12+mslPb0/c/0l0qTQ1OQ9
         FYa96I1bka2ejIRbE0XFWYVkyo7RI4QTtLrN2ocM6w/qvUDYKzNXVx5yRfDGdwU41ORC
         RXnS6pKMqjVZHUYEybFYUOklxZK3Z6OEWhgQkqkCZ3QXZBC/q85kldw5rXfxGX9j5fJK
         WEBsDNCz0gQ7x5v9WaCUs1b5XENJv0GXOLQFstW0hLdonOujNTmJJBewWisQ/eJWFVjK
         Fgeg==
X-Gm-Message-State: AOJu0Yx3PXr0UcBu13HCThnfrgtqXC1cQWFmylaclq1I1+4EMppkeqwE
	KMaOEJVYV1UFyn6/Xw0Mizb3tKslwJXMBNeV802qqr+UtaQ=
X-Google-Smtp-Source: AGHT+IE8RvnzDQ32/2z934C+bRMQJlr9SlC90jLvSVqei6QrcyXsmTmuuVohfHRkzSs2UnMFcmLnYQ==
X-Received: by 2002:a17:906:c211:b0:a23:54aa:311b with SMTP id d17-20020a170906c21100b00a2354aa311bmr826357ejz.34.1704808318961;
        Tue, 09 Jan 2024 05:51:58 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906590e00b00a26c2f13b73sm1084132ejq.143.2024.01.09.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:51:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-webargs: Upgrade 8.3.0 -> 8.4.0
Date: Tue,  9 Jan 2024 15:51:19 +0200
Message-Id: <20240109135121.3460927-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108193

Upgrade to version 8.4.0:

- Add a new class attribute, empty_value to DelimitedList and
  DelimitedTuple, with a default of "". This controls the value
  deserialized when an empty string is seen.
- The rule for default argument names has been made configurable
  by overriding the get_default_arg_name method. This is described
  in the argument passing documentation.
- Drop support for Python 3.7, which is EOL.
- Type annotations for FlaskParser have been improved.

License-Update: Copyright year changes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-webargs_8.3.0.bb             | 13 -------------
 .../python/python3-webargs_8.4.0.bb             | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb b/meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb
deleted file mode 100644
index d8ce4ab40..000000000
--- a/meta-python/recipes-devtools/python/python3-webargs_8.3.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Declarative parsing and validation of HTTP request objects, with built-in support for popular web frameworks."
-HOMEPAGE = "https://github.com/marshmallow-code/webargs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c3ff8567ef1f2a8cf223f30ac5a6f094"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "cab207941b0686c4d086c823632ddcd4343151644341a32fcf50b8eaa71e31c7"
-
-RDEPENDS:${PN} += "\
-    python3-marshmallow \
-    python3-packaging \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb b/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb
new file mode 100644
index 000000000..ea830807c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Declarative parsing and validation of HTTP request objects, with built-in support for popular web frameworks."
+HOMEPAGE = "https://github.com/marshmallow-code/webargs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dfbd4ae0074716275fc229c775723e8f"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "ea99368214a4ce613924be99d71db58c269631e95eff4fa09b7354e52dc006a5"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-marshmallow \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-logging \
+"
-- 
2.39.2


