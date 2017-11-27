Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4552D7830D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 21:51:48 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v137so34494491qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 13:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vg2sFGx9nHTANUGOb5MITK9gmVRphDtp9W5IscUszIQ=;
	b=Tzouc57aGVAZAyM8CbD1jgWjNhFYjHikQapaVWnfp1z7J8gm31MDQJwVqMY9/21nrd
	VmdJ2ExXJxTYxEKQKhPnWdREXoLmfBvZ2Ywia20aOX8ic6QVgQhFnw+pSo9hscRoXPk7
	X6ZXLtt7WCGQqMBV9L9M4Vj0YMx+s7qsEyV68yKOThKX7ZC+9J2Vh6BoeOOz3RecMT3M
	dxZ9WAaIyulBVz5RAb30gZJW89POLPXN2T3DBvmOdmqG28LU389ecb0VijnEnNugI8t6
	G2ws2Rtd8t/H1hccEDXF8h9bZVO16H+YYJtA02Z13q1i9Dtp2L3NcnN7qN356ad5IexZ
	UalQ==
X-Gm-Message-State: AJaThX7Z+NgePSb0DeHSXFXHxCYtoMMuEDsR/+qI08x6hkguxjFW1BIM
	uwAxg0WB+KizuNBaCfFJ2WSZL49a
X-Google-Smtp-Source: AGs4zMZQOXd/mNH8+S42MX09mhZUnp1pq1vf4TD9PYDgrsskczch4Mx3O84keZH4kz7h8EBRhS+qeA==
X-Received: by 10.55.33.13 with SMTP id h13mr61551614qkh.176.1511819509741;
	Mon, 27 Nov 2017 13:51:49 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t188sm441830qkf.69.2017.11.27.13.51.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 13:51:49 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 16:51:36 -0500
Message-Id: <1511819496-28013-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cryptography: add -pthread to LD_FLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 21:51:49 -0000

The OpenSSL bindings require pthread to avoid runtime issues that end in stack traces:

File "/usr/lib/python2.7/site-packages/OpenSSL/__init__.py", line 8, in <module>
    from OpenSSL import crypto, SSL
  File "/usr/lib/python2.7/site-packages/OpenSSL/crypto.py", line 16, in <module>
    from OpenSSL._util import (
  File "/usr/lib/python2.7/site-packages/OpenSSL/_util.py", line 6, in <module>
    from cryptography.hazmat.bindings.openssl.binding import Binding
  File "/usr/lib/python2.7/site-packages/cryptography/hazmat/bindings/openssl/binding.py", line 13, in <module>
    from cryptography.hazmat.bindings._openssl import ffi, lib
ImportError: /usr/lib/python2.7/site-packages/cryptography/hazmat/bindings/_openssl.so: undefined symbol: pthread_atfork

[YOCTO #12339]

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index c21c59d..dd71fe0 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -55,4 +55,6 @@ FILES_${PN}-dbg += " \
     ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
 "
 
+LDFLAGS_append = " -pthread"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


