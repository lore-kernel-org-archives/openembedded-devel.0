Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32ADC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.4309.1634338540527714874
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=sFVflHU6;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id i24so46536850lfj.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A57nAEWJMlOmukgSbtxHLcHeufbaieVFlfGOfGimo0=;
        b=sFVflHU6Zl6m/PcfulvaWFUlHznVEA3SP8m9NE46M52Tx7V97EsSFBnAhnQyMuEftq
         aEZgELb4LEUnbXKUR+FjZKd1BD6RyZLnT82pMM3BG689Viil4PQwNMyo2zZ+akhGHtJc
         9GePxbDRdrFMnQdcYvOAiO/F+0Jv7RW1Vrhr6lgHXauASbydk25pVt8GQqum/D07p+aL
         K0hqOEVcwqwnsiOUozevst7BPToEk0NJSe7N0UTBQbWnyRDiI0AdR9oo+cwi2HJXxBgs
         1yDXXrBkAXiCbYyoUGtt4feuyjPQZHtF6oyzV2N9TwzjWBYmOQa9zrBBFlApSX9vsc8X
         ivTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A57nAEWJMlOmukgSbtxHLcHeufbaieVFlfGOfGimo0=;
        b=cpgHnxFsWbjS4zleK8wHu3bwxsy8Lti2RBM9GSyQIyDWxF0Yo7780tQhOVCERUdbZ+
         R3926/ouyq3mhISYxyMQXcOnrGUhL9tKhzmHSscwhPt0JLjuw0AJV9ExwmGsqe0K/hk3
         XT1xngmKVqu7vEQKHo8yEB7dr7FQVtFB6kaC7qS5L83T1ARX7uM7Vc7Dq+pncHddIAwI
         bIR17XC6V8YiSSAn9B7wO8eAAJPRG+AloykKwP/dLhDZbguxXM0JLlc2MVYyrTeJVW8e
         SNd7BpvBBxBT61ATh5OoCV5eNxgbTz9aSZdbc0LwWCj+SPWCQQ31WAS3QpSZ9KabjHd2
         Mzaw==
X-Gm-Message-State: AOAM5324tdwcOFe+KafKgNFdYaVPhYGFYk1TMlMZo1vUe7tsPoBjHCXA
	waz+nI7XkxfzInnxbawxqqYkXqDKkvxfGKul
X-Google-Smtp-Source: 
 ABdhPJx1Boh25X5/9csKxCPu6+svdwqznLz7bcwHUCbE5uYuo5UMA5nhBeVQZjZBATkju+i1a+jOsA==
X-Received: by 2002:ac2:4c94:: with SMTP id
 d20mr13329124lfl.422.1634338538553;
        Fri, 15 Oct 2021 15:55:38 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t18sm652231lfl.289.2021.10.15.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-yarl: update to 1.7.0
Date: Sat, 16 Oct 2021 00:55:36 +0200
Message-Id: <20211015225536.4161623-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93336

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...p-tests-for-semicolon-as-a-separator.patch | 45 -------------------
 ...n3-yarl_1.6.3.bb => python3-yarl_1.7.0.bb} |  9 ++--
 2 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch
 rename meta-python/recipes-devtools/python/{python3-yarl_1.6.3.bb => python3-yarl_1.7.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch b/meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch
deleted file mode 100644
index 1a9d5d02d..000000000
--- a/meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 47eabc562a8883d757e3cff487c6c6e98def5a21 Mon Sep 17 00:00:00 2001
-From: Andrew Svetlov <andrew.svetlov@gmail.com>
-Date: Fri, 28 May 2021 12:42:17 +0300
-Subject: [PATCH] Drop tests for semicolon as a separator
-
-yarl 1.6.3 ptests check the use of semicolons as separators in URLs,
-which are no longer valid by default in newer versions of Python. This
-patch is in python3-yarl master, but there is no release with it yet, so
-backport it until there is a new release.
-
-For more info, see: 
-https://bugs.python.org/issue42967
-https://github.com/aio-libs/yarl/issues/563
-
-Upstream-Status: Backport
-(https://github.com/aio-libs/yarl/commit/47eabc562a8883d757e3cff487c6c6e98def5a21)
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
----
- tests/test_url_query.py | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/tests/test_url_query.py b/tests/test_url_query.py
-index d2ca640..07f858b 100644
---- a/tests/test_url_query.py
-+++ b/tests/test_url_query.py
-@@ -60,14 +60,3 @@ def test_ampersand_as_value():
-     u = URL("http://127.0.0.1/?a=1%26b=2")
-     assert len(u.query) == 1
-     assert u.query["a"] == "1&b=2"
--
--
--def test_semicolon_as_separator():
--    u = URL("http://127.0.0.1/?a=1;b=2")
--    assert len(u.query) == 2
--
--
--def test_semicolon_as_value():
--    u = URL("http://127.0.0.1/?a=1%3Bb=2")
--    assert len(u.query) == 1
--    assert u.query["a"] == "1;b=2"
--- 
-2.31.1
-
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb b/meta-python/recipes-devtools/python/python3-yarl_1.7.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.7.0.bb
index 7bab771f7..acb4b4ac2 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.7.0.bb
@@ -1,14 +1,11 @@
 SUMMARY = "The module provides handy URL class for url parsing and changing"
 HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e581798a7b985311f29fa3e163ea27ae"
 
-SRC_URI[sha256sum] = "8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10"
+SRC_URI[sha256sum] = "8e7ebaf62e19c2feb097ffb7c94deb0f0c9fab52590784c8cd679d30ab009162"
 
-SRC_URI += " \
-    file://run-ptest \
-    file://0001-Drop-tests-for-semicolon-as-a-separator.patch \
-"
+SRC_URI += "file://run-ptest"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.25.1


