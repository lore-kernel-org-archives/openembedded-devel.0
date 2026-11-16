Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33649.1794851690759089289
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=chVkz2Rd;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37198ed3727so120042eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851690; x=1795456490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49kmxFnQugvsK6zIn1gtShlXLcbgCgWK/76ImzuISOQ=;
        b=chVkz2Rd0yIMqCHMWuEQje8wZlFMWxxEtpeHRKzX0qccc9fLG8yK2/eL0a8BCe4SDF
         yb9JGPQQKbkfpZNqzIg2yjb42E65XMUwmJWcTvj1Ug1ctgUOy49yEsjl61FId1Id/f+e
         YtWBZaijEMniY8h7oRwOGHsXj8TS7jk/haIFt3Ta0wU+7fn08B1SAMaWKx5NGvvE1fxH
         Sg9+wJrjranXOva6VsKo8ERt3gfOWCqAyq72iLZnAyC87FukxPRV+7HhKQddE6qlI7S4
         5eT867c60GBATSuJDuZqd4Ogh2HGsfI0ZEz/1WeZG9gidmpzEJifHQz8Ha9evXVPed6X
         FP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851690; x=1795456490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49kmxFnQugvsK6zIn1gtShlXLcbgCgWK/76ImzuISOQ=;
        b=N9h6X8FQo+BAcpJPtwVHbu9/fahCIJFwSXUk/SERDCGXXtuSGMq0tO0NokN2cSgJqy
         5YW5Cl1lH1CM7qRSs2VPpcIgCFFV5siILy2fN7dfBje3KKD34xVK6hoV+9fJN5B+RXRn
         h3EOqLFoT6G/3ca61coLtcimTrZefi/icsxfFGUyGlKF7JbzT1NsDSIPqMMwyJW1w4Q+
         M+y/FUy/RMZZWBY+GIV5k8F/G6F3nFTCk1CD96NeCaniN7iiqTadflxzw81Ab/odPX/A
         eWOJ6WDvFbFM4TYdl8DVdgRVqF1S02ZTvH8sqt42IJQhCXLFVUPvlbqdgDKJkCzieU91
         fyUw==
X-Gm-Message-State: APuU4Z9azTKx8pIYtQ67V8NgHn3L3PjbaNNMBBt99aGj7+Gu2EsjZ4Sr
	THKRKZTGq46YCmkDb8uRI+ULDCREzaVVoNNwfPuRXd0OajSHpp7VFi/XLZ9dKdMB
X-Gm-Gg: AZFdTZdu8S617gvgnz5le9bDvCaToOY6+1EESW3+B40MbIOVUeHohAPTwgW5LP2G2aG
	A3uOQ59urOoAbvz/n2VaS/JXTYbIZrYBT/EgFez/u95+ZGAJiev++Q7riQJmLDlz4klGU0VPzTJ
	XRY2Js8T4ur4vz7rnBmjmG9C3pkGAR0jwCkWL4bJi1sDO5UfTEM0ZuTPU0IOzgKS/8DKTs4VOxr
	PEXgvsb9WwLtURomkwicW0tKP/QvnmEWdac1RBoi0MTUlMJ+i/lJ94u/H7bx2gGItswMwUOh4lM
	O7RQ+Zzgsuhq/rBHTTleh0dIoYVskWw5Lt8cmz47TtHja8KYKZ2TFtET5lhoKQPo0MvSkmCdRp+
	fnxICG5o3MfI0kJ/aZKK7mVSy5eNb+HV/67e0w7K1VUcTUY11i6z5Gn8NaC/6scvCDdtYzF1h+A
	YxFgEJ7RCjHmliHSinGQDrQIEsZSz5T/tyFzKBWx0fn6vFRUHT8Y404JRqI4XA3FqpRQ8jgPeFX
	PoRIcezchuSlbzDdI/fmzLCB+BrFnDo/qk86HovsnRtRh95ZzuntPAfE4SK1aMpDxlu4uchPYj0
	ORV6pX7XhaId5G1dI8oxlDw18qdx1DwpBCpeHMKh/GY4q/BymX/w6yE9uUBTLviudSebXNCZMzH
	jAylZYIfEd91fMdCFOadHzoXU6Ny1jnfQTgQG8hqitACuI3NVFMc1gCU2qLtzxeUf0gRx/55YP7
	gR8VOlt75xPtUWo1lU7A5N20tHUmbZ1CXqmTURyit52Lw4iXkg1ldeZCh3R3HHg/xy1MeAQDeiP
	AmXhAqvmbk3eOUYzYDggeWp6wljk+oR7KSqV9OyZKJ6j1GuBRos/zfqw/rrAwipGmkBWE21jnVV
	81LR
X-Received: by 2002:a05:7300:2a93:b0:359:27e6:b684 with SMTP id 5a478bee46e88-3810bf5360amr211652eec.3.1794851689943;
        Mon, 16 Nov 2026 09:54:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 033/105] python3-flask-user: upgrade 0.6.19 -> 1.0.2.2
Date: Mon, 16 Nov 2026 09:52:45 -0800
Message-ID: <20261116175359.342679-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132489
Content-Type: text/plain; charset="utf-8"

Drop Flask-Login from setup_requires, which made setuptools try to fetch
it from PyPI at build time, and add the new runtime dependencies
(bcrypt, cryptography, Flask-SQLAlchemy).

License-Update: Upstream relicensed from BSD-2-Clause to MIT in 1.0;
LICENSE updated to MIT.

Changes:
- BREAKING: v1.0 is not compatible with 0.6; UserManager properties and
  methods are now overridden or extended by subclassing. Custom form
  class attributes renamed (register_form -> RegisterFormClass).
- Password hashing is configurable through passlib CryptContext
  settings; minimum passlib raised from 1.6 to 1.7.
- TokenManager accepts parts of the password so tokens are invalidated
  after a password change; it also accepts non-integer user IDs.
- Add MongoDB (Flask-MongoEngine) and DynamoDB (Flask-Flywheel) support
  and an EmailAdapter interface (SMTP, sendmail, SendGrid, custom).
- Remove callbacks/auth0; drop Python 2.6 and 3.3; add Slovak, Polish
  and Ukrainian translations; fix crashes with USER_ENABLE_INVITE_USER
  and with username change when USER_ENABLE_EMAIL is false.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ser_0.6.19.bb => python3-flask-user_1.0.2.2.bb} | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
rename to meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
index 5faf74b03d..42bd50b95f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "Customizable User Account Management for Flask; Register \
 Confirm email, Login, Change username, Change password, Forgot Password \
 and more."
 HOMEPAGE = "https://github.com/lingthio/Flask-User"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5aabce758ead32427c145173bc555403"
 
-SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+SRC_URI[sha256sum] = "c9785febc2fc7ca15c69cfff1c8dabc2788f25043b54a33f73a6c2a9daf7fbe4"
 
 PYPI_PACKAGE_SDIST = "Flask-User"
 
@@ -14,12 +14,20 @@ CVE_PRODUCT = "flask-user_project:flask-user"
 
 inherit pypi setuptools3
 
+# setup_requires would make setuptools fetch Flask-Login from PyPI at build time
+do_configure:prepend() {
+    sed -i -e "s/setup_requires=\['Flask-Login',\] + pytest_runner/setup_requires=pytest_runner/" ${S}/setup.py
+}
+
 RDEPENDS:${PN} = " \
     python3-babel \
+    python3-bcrypt \
     python3-blinker \
+    python3-cryptography \
     python3-flask \
     python3-flask-login \
     python3-flask-mail \
+    python3-flask-sqlalchemy \
     python3-flask-wtf \
     python3-passlib \
 "
