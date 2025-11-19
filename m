Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8C8CF257F
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:52 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7546.1763525563689813341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QuY3bJS1;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ba2450aba80so3671793a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525563; x=1764130363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usA3qQJ6YJSDTtDDl8zzYp4xhC+LUz/1mcG1CV5Kk7w=;
        b=QuY3bJS15opg60xtFEWVr//JqBMHr3KrTPjmPNTeSeXC54Gt6A2kBq2cDk9flLja05
         ByuTUVNEr3M/Cns/3Q27HqXAni3fCBWCKvoRUZN2kgDH1FfeK6euFbz9KaGW3vrTD3ID
         tDzzDAkn3y4GYaiWO35WIFV/Wc+4gM8QTaaoy8kgx8epIMBlG9a6sj237UTApUqKLMdx
         HkylUNt1nxYJZ0B0wPXUnUG0trN8kZsX+ZoE5T+v1Wt/Fq4B5riA2XU4oljRpYzI46tn
         pWx+dwGVOgEBA8KESezS3wRVKg0h7YC8SyM6GAR1kKtuydtLYAaXoEBR7vP2gM8OmKUj
         VUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525563; x=1764130363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=usA3qQJ6YJSDTtDDl8zzYp4xhC+LUz/1mcG1CV5Kk7w=;
        b=jKCneccFNNC+GbGK19rViRuyk13cgy31Fc4Kq46VUpsc1Xw+z2KhDrkUJoxEWx+Cy+
         rcs/JloQqWBPC7MY9PwWjpO3320cb8bQA4s2BITxf7vttIZXbu3CYHy9l2WkIE8lvD7t
         iom9SWAIRMj4cU/gbgE+1URG5NM9nIlE6hY701s7RgwXDK2G+wAjWYFIGnkDeyvuAqrQ
         nKSV/QAqO3qxg1oB+Gk9SmY9yvR72S+N1ClHXFo2uXjy7hiLZMniKHPsFOBF+1GEFcQg
         NttVpbEr1nnqT+ZLHz0XvZRVxQYJ9kjg7P8KPAoFSJJ5M6D0RBI1VvD4n/PhDak/Mcba
         gDnA==
X-Gm-Message-State: AOJu0YzhmACItS5FMkJ3xUdsUHJ7VcbMQIbXpIOO072fIlJOzwmnwhbA
	IYvvP4wcH1C8pnwkZOapMxoZK1Po55UuQ7+rBoyOD2cJ9+RuxUeYGenxhvHJU1NDfyQ=
X-Gm-Gg: ASbGncvpyk7rxxuORxc6R9xMrfa7QKC25T9k8OEmpx3Cb2SoSZ/VRUUUYjuXyfAJzJZ
	+ElGNGvCfiyLCCdquW7LtQeEiXwM1vEWDfdNHm2nAQ8vvmd3tZpvjJZNah+n3N21qZ2dZqdKeDn
	cJlcDp020A0dAPIFMGE0vCtc51iWCsicREuucByNK9Rd4NOIPaLB3MlzyHvq0gdu0BsHFc3PUnu
	S4+EjaA6RYjCPf+4uqLTrbw4UtncaSvqC7LOe9QTESK85096hJS8hmMpLxQV+GdBe34GbIi7Fdb
	gBp70mxwhxux9/BM27aG+OaURhVQbtTfXD8gEvMpOMEZbg46QQ0NqzqNEEcnewX9vqP9e+9AbLE
	O/iC0/0IkFyyM0jQFYf1rxuYjKzN8hUpWlMxUinEUf49T2EvGcCrRoDFTpV2ZwtTMRR8H9HoHCE
	bpcjJMsdYLvkwEJEN4xZcqK8qOYns+fZma0l7HQ6ZhzU0jS13oru8Y3tGL8Yj3gVDNMkpL11i6K
	E87Z+UyUtUAfnMb+2mA9jxUEC6aGmBHhJepBohbb6s=
X-Google-Smtp-Source: AGHT+IHOeRUhe8V5TaCuhIBOGfUB5rVuZYfUe8KOKmQvbtxBWsWHCRd1hE08t3Wucsg0DBE6H2V/5g==
X-Received: by 2002:a05:7023:b07:b0:119:e56b:98b9 with SMTP id a92af1059eb24-11b41306c47mr9010864c88.32.1763525562460;
        Tue, 18 Nov 2025 20:12:42 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 5/9] python3-blinker: Fix ptests with pytest 8.4+
Date: Tue, 18 Nov 2025 20:12:31 -0800
Message-ID: <20251119041235.2448193-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121879

pytest 8.4 is less forgiving about functions not marked async and using
it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...yncio-fixture-to-test_async_receiver.patch | 32 +++++++++++++++++++
 .../python/python3-blinker_1.9.0.bb           |  4 +++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-blinker/0001-Add-asyncio-fixture-to-test_async_receiver.patch

diff --git a/meta-python/recipes-devtools/python/python3-blinker/0001-Add-asyncio-fixture-to-test_async_receiver.patch b/meta-python/recipes-devtools/python/python3-blinker/0001-Add-asyncio-fixture-to-test_async_receiver.patch
new file mode 100644
index 0000000000..2f3d1dfa5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-blinker/0001-Add-asyncio-fixture-to-test_async_receiver.patch
@@ -0,0 +1,32 @@
+From 2edb837a27ea52ec98d2c72db3534cc764c41337 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Nov 2025 13:06:49 -0800
+Subject: [PATCH] Add asyncio fixture to test_async_receiver
+
+This ensures that this test executes and passes
+with pytest-8.4+
+
+pytest now throws errors for such functions [1]
+which were skipped in older versions
+
+[1] https://github.com/pytest-dev/pytest/issues/11372
+
+Upstream-Status: Submitted [https://github.com/pallets-eco/blinker/pull/187]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_signals.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test_signals.py b/tests/test_signals.py
+index 93a9c48..da88627 100644
+--- a/tests/test_signals.py
++++ b/tests/test_signals.py
+@@ -256,7 +256,7 @@ def test_strong_receiver() -> None:
+     assert sentinel
+     assert [id(fn) for fn in sig.receivers.values()] == [fn_id]
+
+-
++@pytest.mark.asyncio
+ async def test_async_receiver() -> None:
+     sentinel = []
+
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb b/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
index f82d686a64..7ddcd04b62 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
+SRC_URI += "file://0001-Add-asyncio-fixture-to-test_async_receiver.patch"
 SRC_URI[sha256sum] = "b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf"
 
 inherit pypi python_flit_core ptest-python-pytest
@@ -9,3 +10,6 @@ inherit pypi python_flit_core ptest-python-pytest
 RDEPENDS:${PN} += "\
         python3-asyncio \
 "
+RDEPENDS:${PN}-ptest += "\
+        python3-pytest-asyncio \
+"

