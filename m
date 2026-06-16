Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF840CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:02:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150595.1781604141633095290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KGHF/Twf;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so7668933a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781604140; x=1782208940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNbSt4rLI7QSLQR4mo13pmXhoHYXKEujBhxv+V3rEuU=;
        b=KGHF/TwfIXuP0Ljivwu2emSKJee6fzLcy6QtVB/lUqszbXcWdiwvZU3CuyeEY2yCyt
         ncLgdI9nCLECemTTzx6mQv1aTk8vgN9p76pY1AtuUlfcN2UJcV0WN73iKL2Y/Pe8Fd+1
         psL+aFjKsuG6vrgwaav4x2FY3Nopz/JIqdMLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604140; x=1782208940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNbSt4rLI7QSLQR4mo13pmXhoHYXKEujBhxv+V3rEuU=;
        b=rCyLEnUxLuGAWgf8pNp1wqX+iNoxplF+kV5rBZv4rlxvNw9UyHGQNwdyzLDtt5V9O8
         od1K2bd+AJ6IJHugHbaIyogWWwhPeJpBxYSsrn8m9SRWSIiiiH4ykbqN4JSgE48tKEDB
         Y7v+ZafaibZKuTH8+4HSDOtVe1vjMyeDHzDcVpLaoG1b7cVZBDAnRZN5O/1jFvnlDKVr
         xtAfbNi1U8xFCXcel3dsUI9v7k0J5yR5WfOPpnQHHLKjY5UA5DdM8a7OWRIyJPHMj2O/
         bhWEe9VYV99RUkkx+qkAZTUXecM9Wq26gwAXYcok5Zz0zaDK3B8H2OZT/Kd32nRzPbIV
         u4Og==
X-Gm-Message-State: AOJu0Ywr+Gt6n1xDgQDNNFDOBbZCoqLmMQWwh6JUQRV2j8Q4DNaXBSEf
	skz4TCazemM0TSIR7HX4LQSpUkK3Z0NblFkPDfcJqIdPexiGR+lNQ1Jowez79/RSdZcXKgTji9N
	MXe9W
X-Gm-Gg: Acq92OGYo8W+vxG/kl4EYBjNYxIrQDTFii1q9Lh9CGWXrZldbW4stWwasL7Nt3BHi67
	h7yNgxb6el0kK8LTAJIS3QgXZSvwQAyJkGT6jTAQdLdXkeiL5tLRuz4Ulku/ttpmo0ixBpPSVKK
	ImQFKl2++7bj8l8igBSoMSgu4DVlCEkmokeNepx8Iw+iAFFgI96wDZtTpjACw0TpQuWZywSpUGN
	PQxpa6bTq4RgxyxRH8mVILhUbA331dJBEEa+SYyS0pRNOL0tykEn19u+zDwvoqgL4MwwG/dzdNV
	rnwcHG0k4CGUE2R8oNqbJNWABTHchwXJwMYY4oar4JyYbbB0HrjikqlngfiaEOrD0bhQqwi3SiC
	G850S11wQCQlzEr0TfCrpJznKbE+Gu2mMftkQpcHD18HDO0OVqy+/Wl1gCUz584B6h9a8+Vscad
	bgTH/f409NyFGqT39A7DzvpFCgRcny5irNhUG0
X-Received: by 2002:a05:6402:551a:b0:693:f7e:b6fc with SMTP id 4fb4d7f45d1cf-693c6a838f7mr6345176a12.18.1781604139602;
        Tue, 16 Jun 2026 03:02:19 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2d9becsm40940932f8f.34.2026.06.16.03.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:02:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-aiodns: Upgrade 4.0.0 -> 4.0.4
Date: Tue, 16 Jun 2026 13:02:13 +0300
Message-ID: <20260616100215.3640011-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 10:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127616

Upgrade to release 4.0.4:

- Raise DNSError(ARES_ENODATA) from query() when the answer section
  has no records of the requested qtype, restoring the pycares 4.x
  NODATA contract and avoiding AttributeError for CNAME/SOA/PTR callers
- Add the missing build-backend entry to pyproject.toml so PEP 517
  builds from the sdist work without falling back to the deprecated
  legacy setuptools backend

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiodns_4.0.0.bb => python3-aiodns_4.0.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_4.0.0.bb => python3-aiodns_4.0.4.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_4.0.0.bb b/meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-aiodns_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb
index 2f4459d338..875ec724d3 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d574ab425d1fcb37c9f1ad3961f18527"
 
-SRC_URI[sha256sum] = "17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1"
+SRC_URI[sha256sum] = "cb10e0c0d2591636716ad2fe402e977c16d71bdaf76bb8cb49e8a6633596f736"
 
-PYPI_PACKAGE = "aiodns"
+inherit pypi python_setuptools_build_meta
 
-inherit pypi setuptools3
+DEPENDS += "python3-pycares-native"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.47.3


