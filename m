Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD95C87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 23:14:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.50753.1753571643506951048
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Jul 2025 16:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aqAj9OqY;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24003ed822cso855635ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 16:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753571643; x=1754176443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTbBlHXl6vZ7QclL0vDBrQTfaR7HnR8bqtUzG+lR0dA=;
        b=aqAj9OqYoYGNsd9wLaUutzMNHsHr4PbV9dBQAB6GW//I4dVkfJ0EbfD+DHy6roLoZI
         QeGfTXQA4s2DJR01Jt7k3CeGOJOtGpXCG+9eZmbzxmCKO3AiCDABCovqLy1AzvDPYIrL
         T4/yiDT5tFToGc/kYorNr0sLaIXaQh0kkrJHxeSkEJfLm7DZhrc2cSx1sNCtdb9Qj9ex
         DFX4fSRlIIYHXLubMFLlE1CokpPGmGz3nEZ40WSsaoNchWo6nLbekw5LShTboqHPZ/Ds
         MONIwxU+iUPhBBOl6NcDdh1zaJQ/gGziqGqJOJIT03SX01Z8ruEcfPJB5qdEdmdzBS2+
         SKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753571643; x=1754176443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTbBlHXl6vZ7QclL0vDBrQTfaR7HnR8bqtUzG+lR0dA=;
        b=gGvGt/g5+3GRolt4TvfkRv3mLkzdACJFNXHwX0GeAzGggeNvKGxt8qgVKbL7o9Gy+e
         cLSFDLWYYPAKglFNn5jG/I11XqNrBkc9JZT/dGt/qPti3WN5dAZRiEt7ooTP5VKM4Qsj
         3BSKDlBQukKmIKM6lWSnCUK6LwcWnD5enBkMT1/WaQxKcpfGScj0b/30FtUbQSyqlIWA
         pB14U+40+u4ZSB6R2+vC9UVNc3vjjXgsrLoNeBZ+m9CHUmR2JVLUZkFppti5OBVoLdc4
         JysH50bRCfxiJelIPNL2czVI2ccU1PzvmtbXABjxBGJVpHNL+/8pMKMtc3hWKGo+L4Db
         8BpQ==
X-Gm-Message-State: AOJu0YzOU8zuAVvLmBT8facUx8TzY6JdrHo2/NyHxJ/YEAtJNLn4AhLM
	Wdp3BM3MP2vUAz1wedK93b33QRshf8Ru2P1cgI3RzvI9qz7L4S2IF4JV4/ykP+OrKHQ=
X-Gm-Gg: ASbGncs8ia5mT7+nVvCO4fQEuJu+yb5ArDKXpfL89e5ojjg9qgBo3kPDDD7WoVdY1ah
	9CyWG8p1kujJRYpoKs9y8Gc5YTiJ5jv28+iUJGn6T1pZG87rXKFl5y7P1/vxpXVnCHcVsjdEIkk
	TMfY7XbL6phhy7wuqFTryCxLiP7iVIgOjAKbcd+kCvA7kBmz7sOVfP7eLRgyYoADMQNI1RMRr3l
	Ih1XIC+CwmuVDNm0FLh8RNQqYv5daTaIrtw0eG8THAr37RFAFZJbQU2je02uOU4ZBeYBDe3UnXK
	NHCVsr2/6xQySmCpuMzZpXwP7KBQ6hjGNvsx+aNzzh0tbRi8AJpji93TEPgPVkM79DPveAgOhHx
	TxeJ6eKrG8eO59w==
X-Google-Smtp-Source: AGHT+IEvuh5dlWAAWyxYclk0BQt5Az93zPA4Q4NjCrHXdm/JLbFzapIdu11CyIT1i5Zl0hRo6ynrng==
X-Received: by 2002:a17:902:e750:b0:235:7c6:eba2 with SMTP id d9443c01a7336-23fb30cb5c3mr96885125ad.37.1753571642556;
        Sat, 26 Jul 2025 16:14:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe343836sm23960095ad.73.2025.07.26.16.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 16:14:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pytest-mock: Fix asyncio tests with pytest 8.4+
Date: Sat, 26 Jul 2025 16:14:00 -0700
Message-ID: <20250726231400.766894-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 23:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118742

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ure-to-test_instance_async_method_sp.patch | 32 +++++++++++++++++++
 .../python/python3-pytest-mock_3.14.1.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch
new file mode 100644
index 0000000000..d57c51f880
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch
@@ -0,0 +1,32 @@
+From 17850cde66d52a851a8a15a61f5c97311d30a296 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Jul 2025 16:03:03 -0700
+Subject: [PATCH] Add asyncio fixture to test_instance_async_method_spy
+
+This ensures that this test executes and passes
+with pytest-8.4+
+
+pytest now throws errors for such functions [1]
+which were skipped in older versions
+
+[1] https://github.com/pytest-dev/pytest/issues/11372
+
+Upstream-Status: Submitted [https://github.com/pytest-dev/pytest-mock/pull/516]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_pytest_mock.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
+index 1a51636..b158d97 100644
+--- a/tests/test_pytest_mock.py
++++ b/tests/test_pytest_mock.py
+@@ -523,7 +523,7 @@ def test_callable_like_spy(testdir: Any, mocker: MockerFixture) -> None:
+     assert spy.spy_return == 20
+     assert spy.spy_return_list == [20]
+ 
+-
++@pytest.mark.asyncio
+ async def test_instance_async_method_spy(mocker: MockerFixture) -> None:
+     class Foo:
+         async def bar(self, arg):
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
index 775b77ccc2..f107e20ff5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI += " \
+    file://0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "159e9edac4c451ce77a5cdb9fc5d1100708d2dd4ba3c3df572f14097351af80e"

