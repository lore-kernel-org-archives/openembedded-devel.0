Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05000CF2584
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:53 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7414.1763525567425961310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JXVqXmPD;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3434700be69so8405167a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525564; x=1764130364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuXGVX74nnhIWcLjJEVNAg3dESdAzcVLLIkGl8JbCX8=;
        b=JXVqXmPDnyEl6XXwgSkHYcvncAlBlXHQ+zHSNcfz1dmZqe3WTygckud0/UC925AJrx
         Ez3nbUaFnA+2m2oA5Lc6pks3HkFLbX1KBj/LMGrzNoUkrdY+ysJG+G5DknNKRquUvzhl
         BhhY+1eijFWNijohLOSvmLKeqzeZxQQccBxkZy7ebOPDw3q+9Jwj/aV2zaJs4bUbs9An
         rji18HIYo7MpFtcbfizhGwaWLG7LbPTahD9umaZwiPqQ1CbCFYBoMoz+KVOzW8X3x/bi
         5lkD06cAL5gTu1UR2UPhyhBNvrZhhP0bM4NjcE63KdQqcliUzrOysQcu4Os8QPiVMVci
         LJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525564; x=1764130364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SuXGVX74nnhIWcLjJEVNAg3dESdAzcVLLIkGl8JbCX8=;
        b=jwPPk+7H+K+YPQgqqo8+Ns6lIQADONdtAjeMmLDqYsoR4KP+KYDOWZkQEffDny9/3M
         pKcP6RpB/QccUSL7mO6iIs6lAdlVhk6LQemsFJEvwH/saQ//5r9//sn5XKK2PJ4HKItq
         Ztw/8eClGjsa1NEaznryGGkOVComH1WGQKIZlWBa84v3dGF8pP3pD+nwYzSWQsWYreiP
         89h1KUDJmepJHgtwYjIXvplELpTWctEqdR2QUoGFMS/N0ZDwDC/A7xGztb5TOIAg+WZB
         HwA8gS8oHffKWUaNJ5mi637jgKaS7yX8KI7HfGzzp8ZeFw0kpNeKPS/jMm1/rwE6FeS0
         kdYg==
X-Gm-Message-State: AOJu0YwKdwhjlAVDbsLU9PW5B5XJrvtV0Djh8r6WCctz4xOnOtIpwIDO
	/9MDhMLxHVBkveyaBwV19MfAgfs4CYbx3FZGsrpvhtz5i9uc5U0t/dXVPqQegxnVSf8=
X-Gm-Gg: ASbGncutD4gpoTEF5x9v+OMBL0mQJbENzdQcelp1gxhEGgiNDhpMEz/jCVy4cVEtZCc
	bolilGRqa6Fhk8hO0kMH1/9IqVrcy++25Qbq6bQkm2YRLzT0L5HJXjzMqgaeWcfcPc8hcNJRnFO
	3WqKD3m2Me8uqUOEDjqEFxhLcINH+OCGUZaMiTT90e+HnOpdWrh+DXDQHQxoiZ6/lmuPiF07FTG
	GuZeT4xh3woVNLVDeSYpKTgYfx0rxdXV1rMSAn9DmzuMG1wEuE5D9Qw75qxruxtvL+UajiSzPAa
	+1IlH9i4if0qNTE3LGf4aF7lrMgJ5V/SFwiwqXwYUyXWOZSqQULqPhJHiTcUzOzPUaZuomwoBvc
	hueSDYF4Yi1feItjcG724fq6fjY1oXXm5GIDHfGKpCwStuItWF69+7+0yAIYdgqd/a8yMDUjPno
	4nqSO0Ch0EIrKX4rqj+DcuehFcDkG6cqiElMHvR5KO1fsw+ZfJi+Uu7nuh2EzPuNwf1Tyz2BIz+
	Bq5ZBoByQ+wByjUbZxfpn+bWkGuIc897R9SaAV38oQ=
X-Google-Smtp-Source: AGHT+IHwgAyFsvCCqQvrJQ8NEv7QJMVXkOdxiY/mB7OdTSVuc3DuCPsQwNPru6PKw48N9Zd6Hn4/DA==
X-Received: by 2002:a05:7022:1305:b0:119:fa62:2672 with SMTP id a92af1059eb24-11b4130b889mr4948066c88.40.1763525564483;
        Tue, 18 Nov 2025 20:12:44 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 7/9] python3-google-auth: Upgrade to 2.43.0
Date: Tue, 18 Nov 2025 20:12:33 -0800
Message-ID: <20251119041235.2448193-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121882

Skip ptests needing pyopenssl module when its not available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ts-skip-when-pyopenssl-isn-t-availab.patch | 34 +++++++++++++++++++
 ....40.3.bb => python3-google-auth_2.43.0.bb} |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.40.3.bb => python3-google-auth_2.43.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch b/meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch
new file mode 100644
index 0000000000..5ee13f3d63
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch
@@ -0,0 +1,34 @@
+From 35eea881e1aeb27fc12cfb301e497e72e59e720f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Nov 2025 17:23:09 -0800
+Subject: [PATCH] make the TLS tests skip when pyopenssl isn't available
+
+In some distributions e.g. yocto
+pyOpenSSL is a packageconfig and disabled by default,
+and it means pyopenssl.py module is not installed as a result.
+
+This test fails plainly when it can not find urllib3.contrib.pyopenssl
+instead skip the test if it does not find the module.
+
+Upstream-Status: Submitted [https://github.com/googleapis/google-auth-library-python/pull/1873]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/transport/test__custom_tls_signer.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/transport/test__custom_tls_signer.py b/tests/transport/test__custom_tls_signer.py
+index 3a33c2c..6f88ddf 100644
+--- a/tests/transport/test__custom_tls_signer.py
++++ b/tests/transport/test__custom_tls_signer.py
+@@ -18,7 +18,10 @@ import os
+ import mock
+ import pytest  # type: ignore
+ from requests.packages.urllib3.util.ssl_ import create_urllib3_context  # type: ignore
+-import urllib3.contrib.pyopenssl  # type: ignore
++urllib3_pyopenssl = pytest.importorskip(
++    "urllib3.contrib.pyopenssl",
++    reason="urllib3.contrib.pyopenssl not available in this environment",
++)
+ 
+ from google.auth import exceptions
+ from google.auth.transport import _custom_tls_signer
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.40.3.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.40.3.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
index b7498dcc99..aa94035eb6 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.40.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "500c3a29adedeb36ea9cf24b8d10858e152f2412e3ca37829b3fa18e33d63b77"
 SRC_URI += " \
+        file://0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch \
         file://run-ptest \
 "
+SRC_URI[sha256sum] = "88228eee5fc21b62a1b5fe773ca15e67778cb07dc8363adcb4a8827b52d81483"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

