Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E826FD0D79F
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 14:40:20 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.13492.1728657612823511784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 07:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0Dp8guy;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a993302fa02so330908866b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728657611; x=1729262411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLkM4/mJSK5BYvKqbpoSsz2IWgFlOnDRTQ/gWOzG6Q0=;
        b=O0Dp8guyQqUalAkFKrhxqmmi8Gxddl/1ibWR26CFE17VCEY9TpdARsJK7LOZ2JQABe
         Luksi+jf0+YbOiXhfhZvMXBrD2hsoGtfXyiZPDC1KK+o25F2woSzjuiSs9FcnykmP9wx
         ++Z273pKEbo3MBOxCR+RTeynw0kZ5MtSJeCEeFkxHEPsN+5sKtl61/B5ZjZpPgjqb+ev
         AZzUAFIa+IiLJ8XOoy2qk98wxfOPYZxBiYyyyy1cbm2PH4H2YLtHduW996LXrqk/gGCY
         dkDwExtSg9waNZrg+VL0V4bnYcQzNmvzjdougbMzXmyShqH3o5JYZ/jyXLUNrNt4OuNL
         zxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728657611; x=1729262411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLkM4/mJSK5BYvKqbpoSsz2IWgFlOnDRTQ/gWOzG6Q0=;
        b=aHSnpLV8gYCs/5Bm7801rPHHZ4XQcx/2ebvNKZgcg9WBRs0/EVcjEWfoWVi/QZKWL0
         m4DCi/72XwbLeOsfqb5VbHTc3iPQEVAVM8H7ack74B3BrzzvNEji3r2fxQA1LoEx1D7q
         K2XcbNb1z/SjNC5end44fM0HLtD9+1Tov+d9uNcbzGy1I8F67pD+Fd5Dybmhl9k+P/Cb
         +p5mJYMU1zIgwCmbDhM5IpSNyXPQBMcUZmuwTF1cP6V/BL+sDLxR6dglGqz6JLEo1tvU
         zSloMz7nqsfATieqegG+QVIYx0G5/ay3E1tKEqCEVSE4+znPZokGApTIXg5HxRWV/d0h
         +rnA==
X-Gm-Message-State: AOJu0YzE1OiEf9PArtE73c2YZFPTVEtAmYrGRxORkiOPZIHGu5OMH7kE
	GWNLxMZqcIA8nOo82x6088RqpHP2r8b3t3pvj99RNpve1fDOprNIAC7FxkHO
X-Google-Smtp-Source: AGHT+IH3R9yPGJRhTdt4Gztd8ljt3ByT3IGhxfW77rNFh2Mi4fkDM8OgtOxa1cEhrM+mr1E4WWlHww==
X-Received: by 2002:a17:907:9809:b0:a99:a44b:e622 with SMTP id a640c23a62f3a-a99b937a769mr220053066b.25.1728657610518;
        Fri, 11 Oct 2024 07:40:10 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80f2928sm217477366b.214.2024.10.11.07.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:40:09 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pint: move PTESTS_PROBLEMS_META_PYTHON to PTESTS_SLOW_META_PYTHON
Date: Fri, 11 Oct 2024 17:40:02 +0300
Message-Id: <20241011144002.2968471-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 14:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112804

- Tested on qemux86-64.

- The PyPi package name defaults to PN without the python3- prefix, so there is no need to set PYPI_PACKAGE as pint, it is by default.

- xfailed tests are known failures upstream.

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 2784
PASS: 2094
SKIP: 676
XFAIL: 12
FAIL: 0
XPASS: 2
ERROR: 0
DURATION: 1611
END: /usr/lib/python3-pint/ptest
2024-10-11T14:34
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 meta-python/recipes-devtools/python/python3-pint_0.24.3.bb  | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 07ae46908..9e828fa5c 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -103,6 +103,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-lz4 \
     python3-marshmallow \
     python3-pillow \
+    python3-pint \
     python3-pytest-localserver \
     python3-scrypt \
     python3-traitlets \
@@ -114,7 +115,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-betamax \
     python3-dnspython \
     python3-fastjsonschema \
-    python3-pint \
     python3-pyzmq \
     python3-whoosh \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb b/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
index 23e9fdb0e..72589dda9 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
@@ -6,8 +6,6 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
-PYPI_PACKAGE = "pint"
-
 inherit pypi ptest python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "d54771093e8b94c4e0a35ac638c2444ddf3ef685652bab7675ffecfa0c5c5cdf"
@@ -21,8 +19,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
-    python3-setuptools \
-    python3-packaging \
+	python3-setuptools \
+	python3-packaging \
 "
 # python3-misc for timeit.py 
 RDEPENDS:${PN}-ptest += " \
-- 
2.25.1


