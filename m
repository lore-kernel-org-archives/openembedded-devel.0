Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78767C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 09:17:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.25749.1744535852612443246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kj90Dhqx;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so27818005e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744535851; x=1745140651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7JfGBLseJSgdV7v3tPszsnm+zpiizylJUS0lHnx/dk=;
        b=Kj90DhqxCnaQCzdzwjWJOIgKeBp0qoZvVnKXZ1gMIPzXKqTzsq1L9So+mi87cnDC5f
         JhP7o+thuF1pN3kEf2i83pMbsFD16Dg7PPDq1ZARcrEf5S7v7UvgliNwOgYc1Le2R+ki
         AIgBp+WLexMLATi710fxOcMyY0HhRCEe0WumxuhkbVHTZSLYdyho2Gjmc4Ih4o2OUkBH
         w8Th76RdwDDnAcw8D+i+EgKAjBEvIo045mRQMcOPdun0QDDIu0YrrAQL/82Km8GSWAeo
         gy0959Lb9iuJ8hOvP7cMjQN1u16eGXuEtrYl8AhJy6eA+p+krYasNBaz9NuUkOXG3xNY
         yCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744535851; x=1745140651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7JfGBLseJSgdV7v3tPszsnm+zpiizylJUS0lHnx/dk=;
        b=ClULVy/8DeZnDsMY31TqUUlaB3dIj5m8TLqn1NBi3zM4SqG+gosBrmojVVuQ0qiCAE
         ARm+PnVfos5e0nabm/9qr6W40nxxE9MR7KHi5LLpI5PQWfi8eAyLOV/FsQtUddKZpT68
         W0gII9svyi9+RkehqI59c8GASBuzOWqvUOu815mAS+kXcSpkWFXImi/PIXq/vQmZQ2Ji
         F745j9uvOw8yFW4iHxVEmslcwmX/wamzJ7VC0zRJFbthFtMnX6/W0H2fHtnELQuZWM7O
         6ehoawcqZfoK2u+T8Wq+lQ0vRczhuytQ6xVBu6JikKwtVIBGZQz59x2eV2m1QyWbWFzI
         sg7w==
X-Gm-Message-State: AOJu0YxgR6Tx/SSBHwuMfs4zeiO+i3Mia8c56jfsO7eDtKzDebZSalPP
	BLanpyQ7iIo7HBFAa9IcyO13/pHw328Mqv+z94UbpTGTnyP5KL2PiC0Grw==
X-Gm-Gg: ASbGncuGaCG9kJENnXaNEBOwH0uw+uEb3YW4GeMUy88NPa4rWldlmDtxf1dfupmjpUv
	+QVxc/Tv+C2joDoHz1X0EvjQdYsefNaBii3AFi9FcED0gqKJN/o/M+N4e0qckpSyUKHFQ9HPPRa
	ttFCp8gVaZxjh9Tvk5T9C2NMxUl0LZ89+KEqeUYeS+q6M52vtdVkqbssl+DIxHuP+7rky0cQww5
	flWHvCHb0KI5F/tQWPZVOf9gSEQ/NEEZXle9z7cQCrJ8ecF2sreMJnqXQvLDcw/23CcZa/XNjRE
	3JdEPJ4nqAq7PUtRPYsx+XrntX3FmSLBhaLsZ3GcW/k2wOby0UN675vECYYGHDwBXwPv88M27Tt
	Ipwo4FGiDxG1ZG3WKNH4lLMv5o+MYQP4BLZ1CZn/8gco4i0E=
X-Google-Smtp-Source: AGHT+IF3aUeHrcHJbcJ97VlN0xF+l1GNBDwL5Y9Z49uyZMqwH0Jg697+Y9lVpEw05J96zWA7lKxs+Q==
X-Received: by 2002:a05:600c:34d3:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43f3a92884fmr65816435e9.6.1744535850537;
        Sun, 13 Apr 2025 02:17:30 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44561dsm7591371f8f.92.2025.04.13.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 02:17:30 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-myst-parser: new recipe version 4.0.1
Date: Sun, 13 Apr 2025 11:17:26 +0200
Message-Id: <20250413091726.801828-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 09:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116825

MyST is a rich and extensible flavor of Markdown meant for technical documentation and publishing.

MyST is a flavor of markdown that is designed for simplicity, flexibility, and extensibility.
This repository serves as the reference implementation of MyST Markdown,
as well as a collection of tools to support working with MyST in Python and Sphinx.
It contains an extended CommonMark-compliant parser using markdown-it-py,
as well as a Sphinx extension that allows you to write MyST Markdown in Sphinx.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-myst-parser_4.0.1.bb       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb b/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
new file mode 100644
index 0000000000..01c98b8db1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-myst-parser_4.0.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "An extended commonmark compliant parser, with bridges to docutils/sphinx"
+HOMEPAGE = "https://github.com/executablebooks/MyST-Parser"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
+
+SRC_URI[sha256sum] = "5cfea715e4f3574138aecbf7d54132296bfd72bb614d31168f48c477a830a7c4"
+
+inherit pypi python_flit_core
+
+PYPI_PACKAGE = "myst_parser"
+
+RDEPENDS:${PN} = "\
+    python3-docutils \
+    python3-jinja2 \
+    python3-pyyaml \
+    python3-sphinx \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


