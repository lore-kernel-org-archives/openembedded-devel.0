Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50732CCF2EE
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:41:50 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33612.1768822900574813593
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LnfvQ+yn;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8707005183so702769166b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768822898; x=1769427698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Le8fOSmQnB545dBr7SmXwUYqj+dEqkOOAO+zPH1OBeQ=;
        b=LnfvQ+yntpGuO/5ppeh4XdiblenPLzc0QwoYNJ2uBZh6+Bu+DYbsqnnxLu1SnlfSM8
         agPajsM4jHcBpLg4OEb+Gzt4UQ9/OxbUeUlBkH6/Q4sd30QG/UJ0nEHvmBdf9lwUIo9f
         OZUdPez6e+ZZO5JFMP7qDAP/WLA4NosMBeTKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822898; x=1769427698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le8fOSmQnB545dBr7SmXwUYqj+dEqkOOAO+zPH1OBeQ=;
        b=TA0zePc8GvlvEl7dC0MRb2409npAZAeZ4iEHsiskgYWkvrsgecS2Xe6+tkeXYFLp/2
         Zg7Fzyv0ak7dVtAUeOjFnZX954LykPEQh5O9fxaaTzt16W7h9FkmnV3pIy91Iii52fsI
         lHA6cSu1YV7+pqpTv2EDYSHY18b12Koaief9X1HcTnj+bfAa2FtOif/tABGb/RfLGRD7
         d3gWJDAPUefAyXgjvRgVXrZtLxL3x58B5nxUhLb1A1u5hZXhhJvvFoJsHEbbwKJ7tcOw
         e99dALvxER0LsSExiJOv4RtY5I2rDtyOvd2N7HUJeZSBTQKeASd+2+nbSWoROKsEj31k
         Nt+Q==
X-Gm-Message-State: AOJu0YxIxW83igRStnIc7aPEHu3LgqsvGMQM8tWXwv2Qa2SONxNr6myj
	JMoGO6wL49rPzlziqMp4HNVj6fq6TKWe9dKRWHNoWbI84Wq5bEEUAM8Y1G9Mvy5218wRmL5YIv7
	wx3x6
X-Gm-Gg: AY/fxX7vI8blWGsX/4eWQsjEAhYpXfE7W21XJTQa2zZKDTxeOq9CUecxpIukbGedix2
	MuqmOH3+pG/Z60kBuTUK6cuT/QTs3ZNMd6xe9s9ZuhifCnpo/H/oC0xnRSTIm4ZN9/ZPvOWF2f6
	vjY+Biw9Ld8Sir/yxiRJ7p9a76BxWWydzKXYIauSvtXxuy4tcoLEs9gj3OtMx4pdPYTCI24vuJU
	We6e4KEGVth2BAzRzfuv0ulWen61ru8fHFu0aQdB53dFli28Mwqxj5oK7RcHr7Hnt4EqA07qlmS
	EmdXonqGg8RQHKCvhjhzUuAl1vpgGIFRtri5gqzUdM60BqpoIC03sEElwknwruRp5CuR6OtxuNn
	vhfETUz2dev7Qqz43Mj0u6Nf0jb6ctNjXqjr9MtpFyEiNSb1lyb6oOTa+sLPXJjrnK0lgpbS2Lf
	mRbXJTzcaGw3Z6R/kzaEUq3L0HHQfFUwFBi3M=
X-Received: by 2002:a17:906:fe03:b0:b87:d839:ae8 with SMTP id a640c23a62f3a-b87d8396e16mr233339366b.54.1768822898516;
        Mon, 19 Jan 2026 03:41:38 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c6dsm1087773766b.19.2026.01.19.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:41:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pytokens: Add recipe
Date: Mon, 19 Jan 2026 13:41:35 +0200
Message-ID: <20260119114136.1592429-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 11:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123636

Add pytokens release 0.4.0:

- Various packaging and dev improvements
- Just avoid using uv
- Move setup.cfg to pyproject.toml
- Use mypyc for compilation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-pytokens_0.4.0.bb    | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytokens_0.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytokens_0.4.0.bb b/meta-python/recipes-devtools/python/python3-pytokens_0.4.0.bb
new file mode 100644
index 0000000000..1ec1e31086
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytokens_0.4.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A Fast, spec compliant Python 3.14+ tokenizer that runs on older Pythons."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=627dc9a75d5dcc4759b26bacf13a4c46"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "6b0b03e6ea7c9f9d47c5c61164b69ad30f4f0d70a5d9fe7eac4d19f24f77af2d"
+
+DEPENDS += "python3-mypy-native"
-- 
2.47.3


