Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4863FC77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 05:37:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.12751.1682660248155290317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 22:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VOkKtFdc;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63b5465fc13so7288619b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 22:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682660247; x=1685252247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=836eEewqgDGElkwq+tiqM7RiEmpcp8Pvg1N0mZRZG44=;
        b=VOkKtFdcUPwucGl1pmtx7tnpFQC8BWfszGiT5v1xFAqzkRNXcf3y/hkU9re4+bD/P+
         gHqDzbx6PrHgjlNi8XRyBvpd1BiR+xyWDDyzQ4wYgCCFN+HKYd2KFVJQAsRDBNfP3OmJ
         ncRMQliDOzn0n0+Vta68ocTC8TWcnIKPvFqjYfiOoxRYFi0ikZHbYRgQjMCYqgt3TfkD
         tb/I/Bdb0o+ZdkuPc/Wk2nYet6IrzY8ODvkPEbYxE8G8xAwaliF1KBDVQiMKlBqOiJli
         jNfUrPkT88aZRdUpS+1P/egCyeM4Yu6bJXHtsWL/X3nNd/Z1Q4X7uq8WukVhpkAk9q+V
         pgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682660247; x=1685252247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=836eEewqgDGElkwq+tiqM7RiEmpcp8Pvg1N0mZRZG44=;
        b=VhluI1sh+/MFDxkTArUsXLcs7ueWygB0Z/0wkY4zuKZxxKIbeLbg0e0H5fDaX90zBp
         9uhEMbUy//g8FCIkqkCQ9BnJxMouSakb8ks56JwUE3szY20RRBfTWawUDSwCmwSUPv2T
         by/GRWkkmlgt3L9QylrT0ieePgz6mgN2gP1WE24ycOsN3pwyznTrO6NclUt1o/x2EvOs
         vUSCrzKAubF3vA/Eo1HMIR/3sfdo9TkRsI3UiSr43YipQzwglQV5YNFKwlJHS1lkM6TI
         PyQKikLDB/J0hOdVDZyGDVfZXptUYB5RjdUFaKtHg8F1Am4MW944dfnjvPHmZtwYyFBx
         Tojg==
X-Gm-Message-State: AC+VfDxFX2LYo9VJhGYZ8byl4Eeptd6ZBSI/mioCdfo9YMetHJNJ6TZy
	fLFKWqiTp+ZJiPnWVoKtGrwjHPy79LZoSA==
X-Google-Smtp-Source: ACHHUZ4G/a91qjxanZmLyZUKwW1mLgNQc4tKPHD1koL1laJrI3lOpv5waNJLEgE7vwYXwNfttBnT/Q==
X-Received: by 2002:aa7:88c7:0:b0:63b:5f78:d6db with SMTP id k7-20020aa788c7000000b0063b5f78d6dbmr5639363pff.21.1682660247244;
        Thu, 27 Apr 2023 22:37:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5002])
        by smtp.gmail.com with ESMTPSA id s12-20020a056a00178c00b0062e12f945adsm14160771pfg.135.2023.04.27.22.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 22:37:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-click: Fix ptest failure
Date: Thu, 27 Apr 2023 22:37:24 -0700
Message-Id: <20230428053724.3608477-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Apr 2023 05:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102222

test_bytes_args fails especially on musl, therefore use mocked sys.stdin.encoding

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-tests-Fix-test_bytes_args.patch      | 41 +++++++++++++++++++
 .../python/python3-click_8.1.3.bb             |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch

diff --git a/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch b/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
new file mode 100644
index 0000000000..e69a37c405
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
@@ -0,0 +1,41 @@
+From da83bd7ca0959027086115f23534957b0917aaa5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 27 Apr 2023 22:21:24 -0700
+Subject: [PATCH] tests: Fix test_bytes_args
+
+sys.stdin.encoding is readonly therefore use Mocking to wrap it.
+Sourced from - Alpine
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_arguments.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_arguments.py b/tests/test_arguments.py
+index 735df4b..3395c55 100644
+--- a/tests/test_arguments.py
++++ b/tests/test_arguments.py
+@@ -1,4 +1,5 @@
+ import sys
++from unittest import mock
+ 
+ import pytest
+ 
+@@ -86,9 +87,12 @@ def test_bytes_args(runner, monkeypatch):
+         ), "UTF-8 encoded argument should be implicitly converted to Unicode"
+ 
+     # Simulate empty locale environment variables
+-    monkeypatch.setattr(sys.stdin, "encoding", "utf-8")
+     monkeypatch.setattr(sys, "getfilesystemencoding", lambda: "utf-8")
+     monkeypatch.setattr(sys, "getdefaultencoding", lambda: "utf-8")
++    # sys.stdin.encoding is readonly, needs some extra effort to patch.
++    stdin = mock.Mock(wraps=sys.stdin)
++    stdin.encoding = "utf-8"
++    monkeypatch.setattr(sys, "stdin", stdin)
+ 
+     runner.invoke(
+         from_bytes,
+-- 
+2.40.1
+
diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb b/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
index 006742f153..9b8ea94c2a 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
@@ -13,6 +13,7 @@ SRC_URI[sha256sum] = "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37
 inherit pypi setuptools3 ptest
 
 SRC_URI += " \
+	file://0001-tests-Fix-test_bytes_args.patch \
 	file://run-ptest \
 "
 
-- 
2.40.1


