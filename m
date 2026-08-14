Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D55C5DF67
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 00:38:31 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3630.1786667908407104145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 17:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Lx0PG/k4;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d049069377so5952715ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 17:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786667908; x=1787272708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVU9dhdmpGoGdJCMhiHj1YXDhX/u+GUUIjJLosoqvvU=;
        b=Lx0PG/k43JNVKx2ZKZpChbsBmpC9QtTX3FH8CfAZLe5zqrZiEQBtKhs3HMa0yzNCtt
         2di9PJ6Tz1dvkr155eFa5LTTlOCdLfgpaGgRo5w+5DKC6i/NnCixcQZ8vQAt3xfAYiFv
         AqIg4HaAoUr+4vmHngjsPXGR5LoZRh6i28KaMBF8jaxLphhh7kZA7w7QiJd3bSUs9U2I
         LIubGmTNdNjXnHebYrteTsecZJH/9zk2m15bjyfnjSEVcAp7ww3ciS/1YRiWklpHjBiE
         ZskGo60Kb7GsNYyAjI7mHs2ZA7O7LAfMQeA/22wNCRgReeKZfDIDdarOP1i4fdoSM9/w
         H6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786667908; x=1787272708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BVU9dhdmpGoGdJCMhiHj1YXDhX/u+GUUIjJLosoqvvU=;
        b=IFPnlrTOZ7K9Z8LicZLEFhSpRpvai4C/40YT9T+aeECoAEaoSBucISdCO3xtAZ9crh
         gmRdQNtddJjXo7/sadp3NOwRxBXdpww1zbbiRglKwtQQM3SpOok21K0ovCSzWwNkoPz9
         /Ctp+Bh3ocFiZuXlz6hEpHp6WYdxgoUsRFNukadbIEKQVLcPz18xbR17AGAIirynxx6Z
         nxiug8mxvh7WfyjGch7Jp6kT9RbS5uSaNtPOsALZpemoijVxbqbZtE4861u4lHWnhI5U
         QHdYuqaVOMKNod0Vnh2aTSSDQCNO646CkynXDlXGGnC54goRJ6QES9YuwTM9NJ9C/goy
         LTAg==
X-Gm-Message-State: AOJu0Yx6Vq78C2LSm2sQYTSEhRQuW2hs99xGPFrYsRNtdg3n9GaqPp26
	tXdNs+5rKi4vw755F78FY+P9zpotu/ei/K5334xNFL5518wFgD3swPp8rjYK0w==
X-Gm-Gg: AR+sD10/TIP2gnNnm+DADc9Ba8XvZpw0LUWFL73YGzldOT4Xxw618GQVm4rgIELclQA
	cH/enGjnZtcj8UZFhBv6n7ZRIbNgsV53uBFVPla59qkRFYDrVQyW6kzzIbs6l+4dXqiEdlXFrQl
	Jr/1f3+ITOwCk+GS+WvreQp+kf+YupXK107c020OvjIbZXqGq6Yu3XrXPb+9KIoLfUBCrOPwjZ0
	0YTXWiVTquOkFInchJjWSf15qTKkxukDPYPVLnyLkxg4YmYWNQ3q0Xn9xq27uuxI7El4R1z8snT
	YUvn+JXhySTyekQ6To0mstkNqklt52Ujd6ezgZGqngj0E55wDBT/yw/bi46I7YG6MjtMfMzDmfT
	I7XWIM8QqLmYsw3It2Bmbx9a8MIav1FbT5hjNRlImwWnRx0BRatJ/I2DY6WiL0498a54UUAJt7P
	j7LCCHkjrGDnxbz5Wu3o+mBENVkYx46BKjPSqfouYrcZ1al/a2QmSZPrDrQYGW/LQRfu38Dq2ni
	88bQ5BDfYkmYPleOsCx3QzwLj7pDGi3TINp08q2lvl00uQ4QYlfmmAWesdU08EDOHFuPe/s4qQv
	fqymwhgS6djtK7g5uN1uAWN0k+Q93q0FhNjYmm2ABaVzv7ZQYmFbmHbez1uIHW6npy2tQhyO5ey
	58YDv8jlMCXDg/kV4JqsNW9Jf4jHZMWXgPcxs1dkz+zmO+Q==
X-Received: by 2002:a17:90b:3d83:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3933bcf00eemr1969505a91.21.1786667907563;
        Thu, 13 Aug 2026 17:38:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm3236209c88.2.2026.08.13.17.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 17:38:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/4] python3-m2crypto: add SWIG py2/py3 C-API compat patch
Date: Thu, 13 Aug 2026 17:38:17 -0700
Message-ID: <20260814003819.1417656-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814003819.1417656-1-khem.raj@oss.qualcomm.com>
References: <20260814003819.1417656-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 00:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129026

_rsa.i, _lib.i and _ec.i use the Python 2 C-API names PyInt_AsLong,
PyInt_FromLong and PyString_FromString. Python 3.14 no longer ships
any fallback definitions for them, so the generated _m2crypto_wrap.c
fails to compile:

  src/SWIG/_m2crypto_wrap.c:4895:21: error: call to undeclared function 'PyInt_AsLong'
  src/SWIG/_m2crypto_wrap.c:9842:26: error: call to undeclared function 'PyString_FromString'

Add a patch mapping them to their Python 3 equivalents in the shared
raw-C block emitted ahead of the %include'd modules that use them.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...to.i-add-py2-py3-C-API-compat-macros.patch | 41 +++++++++++++++++++
 .../python/python3-m2crypto_0.48.0.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0002-_m2crypto.i-add-py2-py3-C-API-compat-macros.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0002-_m2crypto.i-add-py2-py3-C-API-compat-macros.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0002-_m2crypto.i-add-py2-py3-C-API-compat-macros.patch
new file mode 100644
index 0000000000..d65920341a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0002-_m2crypto.i-add-py2-py3-C-API-compat-macros.patch
@@ -0,0 +1,41 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Subject: _m2crypto.i: add py2/py3 C-API compat macros
+
+_rsa.i, _lib.i and _ec.i use the Python 2 C-API names PyInt_AsLong,
+PyInt_FromLong and PyString_FromString. Python 3.14 no longer ships
+any fallback definitions for them, so the generated _m2crypto_wrap.c
+fails to compile:
+
+  src/SWIG/_m2crypto_wrap.c:4895:21: error: call to undeclared function 'PyInt_AsLong'
+  src/SWIG/_m2crypto_wrap.c:9842:26: error: call to undeclared function 'PyString_FromString'
+
+Map them to their Python 3 equivalents in the shared raw-C block that
+is emitted ahead of the %include'd modules that use them.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/SWIG/_m2crypto.i
++++ b/src/SWIG/_m2crypto.i
+@@ -64,6 +64,21 @@
+ static PyObject *x509_store_verify_cb_func;
+ %}
+
++%{
++#ifndef PyInt_Check
++#define PyInt_Check(x) PyLong_Check(x)
++#endif
++#ifndef PyInt_AsLong
++#define PyInt_AsLong(x) PyLong_AsLong(x)
++#endif
++#ifndef PyInt_FromLong
++#define PyInt_FromLong(x) PyLong_FromLong(x)
++#endif
++#ifndef PyString_FromString
++#define PyString_FromString(x) PyUnicode_FromString(x)
++#endif
++%}
++
+ %include <openssl/opensslv.h>
+
+ /* Bring in STACK_OF macro definition */
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
index 96c8a8797a..1a06fca017 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=8099b0e569f862ece05740a
 SRC_URI[sha256sum] = "178e290f558ddf0379aaefd34c0a8ddb21f21502594e588f928dda85f1ad202b"

 SRC_URI += "file://0001-setup.py-Make-the-cmd-available.patch"
+SRC_URI += "file://0002-_m2crypto.i-add-py2-py3-C-API-compat-macros.patch"

 CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
 CVE_STATUS[CVE-2020-25657] = "fixed-version: the used version (0.46.2) contains the fix already"

