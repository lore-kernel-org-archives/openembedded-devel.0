Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33627.1794851659976249183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TM1fMaGw;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4580305eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851659; x=1795456459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1cG0+KXzisx9uxMquQd3wTdd3dhHTeEIW5brUe3AEo=;
        b=TM1fMaGwZLtZrn8sgZB9bfghgE98t8lle7IazO0pfAei9fb+YwIsdjNAv4wYsycLIj
         l/i9tQzOoMQSvswWmra7Aglx86IC381AtJuONewwF+79YIo34M7PYaFOUS8rSGhNrd1z
         cfvlXnG7uOiOL7O+LKlayEgxB86NAp+EPE3jCEW5/rKlUr46UYdCwYYJ+4qnHrtGGiqe
         YE7QEZMhlr38JkukGZIDp+miETx8FRmcwLxZEKV/qpEP4GOTSkYUw3J8olqcC8tk7mLN
         AST+VT+EmCW6/TgclwJbLy9l6q0IwfE6pulGd+QUVZzYa7dLWLvMfsnHM3eDxaJoenCA
         u6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851659; x=1795456459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K1cG0+KXzisx9uxMquQd3wTdd3dhHTeEIW5brUe3AEo=;
        b=ZPbda/xQeyWnW7mh9UUp0PejAtp4AmsfpD8sNZIuoe+R4tyzsimulrMQWVHdiUmUa1
         2RdyJvVek4szEkab176U7SMMD8vYm+a26VxbQPSUZ4ZAdopGTJ4zdKFFJdeqC5Q6+6E/
         TAk2b4cFWoTI9YE+1I+Al3YragWC9fQU17WBMUdma/diTxZVJEOd+6O9V6jm0M5eJvgu
         e1WNc3s3hTYE/xEVA9jHci5GRW5OfoDQbqPT6OVqJ4IfMFTF022Ojyotkcw1qeXO2WZ/
         KOtmBV+ycg4SuE51lHEqoAAk65WYoUBT3HU8vIE3KKRAhCSdWi7EPkz3sQ0rTbD3seJR
         1D3g==
X-Gm-Message-State: APuU4Z/9fzv9DYtb2lwwb+MAy62iYKppU+NceOtkG7KBRrWb2+PmW+y7
	Hqc5FSBVTYbk+3SHdPMAN+2o18w8UrpRH9qMDSyOTKxFT8iKuq6cG3IpXg/s73U+
X-Gm-Gg: AZFdTZcY7vd2ij4lmh2qSXthvcHzejSprrZVDgJTLvWyvejblgLgKVzP+aJoJpJ18XO
	PA2crAUXZMEr8B20TJTjr4jXFL3b3Evds+C1ktCu/wEtXrLtOhX9HqsrguB75g8MCiCB7l6MqDu
	AxPsATbWwl6Qq4jK+fPUzLr9rdws/S24n1xREysoKM8leNOrQrjfHcxy2JTgCxdlj2N2YXbxbh8
	ZP+Q4q2PtzAwteO4JY5bQbkY3akDsX/ikVoY4gGpSy+AMbL4eY9aLypZ7b3mN1ScZtupiwJN9nR
	I5an1ttqT0tccfXyrD6JyM1lUbpcM1oWGjoqRT/rioruP50/35j0LRuFx/ZJMZ2mfHO+zM/Cqp7
	bc9H49flGPAIoWpeeF4AvVItuViHIy8ztak+t4TUFF2teYdHr1reAj+pmj9ts6C++0NPvNr4Gt1
	77aQIhzproBrOuBufaW1Gwce9Ti2D/XH5lJc2Pzq7OZaYitBQXWEzhMSJWnGgJXrvqCcxHrH1yK
	KhiGDPgx9K86L7c6UP8zzgVR/n58Kn8d2ZZrGWI9Dl2U5hd47ZaDtK5hlIrnXyPbi/Z6Cfm/yQm
	o9zW/+ByvCNxQVHqLFPgj7mGWjtcI+7DgWCT0pShuFNe1n+vOku/5cBTiJv64s7zwjt+eonr2fa
	lImiA34gvFYK0hXIS2hhp673BXhvkUYc9CJ3ZOo+Vb0d0JLq86js0o7C9L+IfokDzm3gIRINNj2
	4lMRW5a9uKYg2e0m+riO60Wncckpv9xCJS3/spnzNsm+TrImN6enTQv1pO0Wy03L0yCRUpWuQf4
	iE7o3NgRtCLV7wFDNOAzpX+aH9WiKFZ2uKW3oby9AOdJPcGHAdpikKxgmtc6eQqbeo58a2do3wf
	DjLYeg==
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr18338828eec.22.1794851659273;
        Mon, 16 Nov 2026 09:54:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 012/105] python3-cchardet: upgrade 2.4.0 -> 2.4.1
Date: Mon, 16 Nov 2026 09:52:24 -0800
Message-ID: <20261116175359.342679-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132468
Content-Type: text/plain; charset="utf-8"

Changes:
- Fix crashes when one UniversalDetector is used from several threads;
  detector methods now hold a per-instance lock.
- Fix UniversalDetector returning freed memory when close() follows
  reset() with language_weights (could raise UnicodeDecodeError).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-cchardet_2.4.0.bb => python3-cchardet_2.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cchardet_2.4.0.bb => python3-cchardet_2.4.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.4.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cchardet_2.4.1.bb
index 6143a477eb..2350cccdad 100644
--- a/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyYoshi/cChardet"
 LICENSE = "MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
 
-SRC_URI[sha256sum] = "7b062e7e92e5ab1a00aaf5c164d5f056daae648ba1f144082baf5b4c229b794e"
+SRC_URI[sha256sum] = "3e3b0b9f11f24b66dc34997035e4d9c570594277e59c878ef004f666b3f45124"
 
 inherit pypi python_setuptools_build_meta cython
 
