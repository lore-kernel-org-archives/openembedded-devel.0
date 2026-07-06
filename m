Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B98C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:12:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146946.1783332728891088813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cMedtS5d;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c733f15aso28952385e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783332727; x=1783937527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANivC0ZS2A4jmtoC0Axkv0N2e5umqtzHDgtcydS9eAg=;
        b=cMedtS5dVk1XWVJSAMDTd3YHX7BirE27tl8hyCrGvXF5HXbi62nkcOg22IWhTBbIhN
         8ehZSiiAvMDQYQ3nQan4Zq3L/9b7uCoaQs++pOpD8iod0khFR/4xtLt8lGLagbSxSfiu
         zW+1IACuc+4y5KxzZGY557Zimg2oYG0Kj96YymtXzA0x7nEXxcV9Q5cGZBT+r/b2/pEd
         bx6dN5qDE7KL3/91VTLPudH9zQm+PGk7cBXEA+WXu4+reY758RO4p2fK19EVc6kt+sdP
         b/xepKQBvtseBLfnIcmOhJIQVRAGWUghZgoVNEE3dV1OTre07OHwPH7TBv+MrLZMAEW2
         2QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332727; x=1783937527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANivC0ZS2A4jmtoC0Axkv0N2e5umqtzHDgtcydS9eAg=;
        b=bRapOkwYSkc5TWtiZXHUPfk+BOnE3U4PPzxA7I5gql+OtK58v8OzbqHAnRl8oWraLA
         VIUj47hdoW8LoMHeNuhjDG4kc9yQWEE6lYF4HIeVfEAV8OWeKfJgwWx6tDhgEvBh6kAc
         f7xtTeLgWfQVQK5QPmFSNwnXTsBAfHwT8YycHPkpEP6LLgcLGuww8eEALQTFYAU9dXwQ
         mDGSJyZO2+hv5S84dIHp3zMbo7UhZHsJQd+eb7yCNyvWmOdeI90F4rhlIhheJsgBvPmA
         PR7+/qJUAO+rRq7jwBNBiO/tltwNBW/h94SBVeZJ47HQlb+iigSXcG3ioatydRtd5QDV
         Qt/g==
X-Gm-Message-State: AOJu0YzHuCdI5OnG35XJFFBlZHzm6JBCnhdOi3FvcdYdifm9Odr/yAZh
	xX6irv5LOn8nKJfCItVa1eqi3iAinmbwwkkOb186Tbbca4XlfEPdzFohOn4Jhzmu3ts=
X-Gm-Gg: AfdE7clM963RLlQvsJGGkRlMs3nBiaaVUGYA9xtOfBEE/1tiIql09n3YI2IQjAxF5oV
	2y/RBX79h9hRfM+RifyTXnZEnfpfprXzVztp3h3CmR+dNdmQlhy/VjTE4USq5LcInirk/RUcnqp
	4i7NxzWsRnA5Ipta1aElRfBs7TVDgLlmxaglDXUWy2LG/olqLmOHNwADSUBupuOeoMArNqQmf9x
	vcsnQk2kXe5Ka7d/x7Zx3T67NGa5l76hnDclq3qZbsLQLm5TwD93nreqNck7v2JFMrqa9ppgomq
	Jn5lfE7M3KhWzmrJz4h6NXrXo/mP6GbgYBGk575L4IDKfpEfM+YvUnffT6jJSeDoCQS4QuqvGoo
	2GfOBgE+FhSnF3t1kmNxj7TT87Yl8bpmkT30odWy/c26bDdVWd5nx+I7MLPEi1wmS8nQPkshIts
	aRfhITQ2bowMQxu+46HPr5twLskcnjOXn03WsZwDgmmnoO7aAkdRDZhNtN21Ig4K9eIdfUldjXt
	pqv2TmOmvuz8xZaT4I2ok0x8rk04qoRNHS6iM8wEwSoDNyd44c=
X-Received: by 2002:a05:600c:3484:b0:493:bd73:c77a with SMTP id 5b1f17b1804b1-493d11f6d05mr116984565e9.29.1783332726766;
        Mon, 06 Jul 2026 03:12:06 -0700 (PDT)
Received: from jan.telenet.be (2a02-1812-512-2c00-916b-7678-824-395b.ip6.access.telenet.be. [2a02:1812:512:2c00:916b:7678:824:395b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm249218845e9.3.2026.07.06.03.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:12:06 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-markdown-it-py: version bump 3.0.0 -> 4.2.0
Date: Mon,  6 Jul 2026 12:11:50 +0200
Message-ID: <20260706101151.1022663-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 10:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128042

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...arkdown-it-py_3.0.0.bb => python3-markdown-it-py_4.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown-it-py_3.0.0.bb => python3-markdown-it-py_4.2.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb b/meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb
index 1944574fdb..508e89784e 100644
--- a/meta-python/recipes-devtools/python/python3-markdown-it-py_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://github.com/executablebooks/markdown-it-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
+SRC_URI[sha256sum] = "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
 
 inherit pypi python_flit_core
 
 RDEPENDS:${PN} += "python3-mdurl"
 
-PYPI_PACKAGE = "markdown-it-py"
+PYPI_PACKAGE = "markdown_it_py"
 CVE_PRODUCT = "markdown-it-py"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


