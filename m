Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33674.1794851726757422140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XigCnm77;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4891771eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851726; x=1795456526; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvVPmmjtJ4/6gnLv4sJGi+IdOardUZkEVOZ9g2rNbHI=;
        b=XigCnm774Ql3kT/kT6MJzvzeaOXrGHH1qjNewymVpM0ePJP36guHlqBjewn1bPjmPp
         2s/1cGZUQHHmUUel+AQjng83AoMPMx/R9NhBgcZ0wFQ5l4uV+Omr94EeSOzKE6WshesN
         ++aia82TWbjINFAb+K70pakqbYC4Gd3xRM6yGt/dNtGcn2ypqrqlFKIV8rLDGS8UJ/0I
         gD9+q3k2l6y6BeJzsVa7OD9xaqiK9UvOzAXusLjg0mrip/9hC3ts2INN1AItFbIq1puj
         b0qiEIAD4dRRmxKJz8nRN6OEZyb6aYszHNQ2Omi/fHROEmxCX1iOu5/Ynpw9ZCocUNp9
         S5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851726; x=1795456526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvVPmmjtJ4/6gnLv4sJGi+IdOardUZkEVOZ9g2rNbHI=;
        b=qfkLmsw1c3n3VZ/8qXv/82c9TnG/ygHF64bvmXLYGJ88V4AyFNHPZ5FhvdQdXWVdS5
         JcJen1KPZF8v3o2/O2rFZP2xOWqjIOOGzqjSz47O+j1wLxX0FBWDOMcM1eX/VtvJ8qJ2
         LPT2dQRyB7cydcWWF2+l8GL+JR0HwufseInM9e0g+5J357xnsObJj4l3wY4kLV1cOvSc
         VjI1Pu9wfZ2B5vhKzscRRb3E5Tg5fjyLROyKAAHCHyjh7CLG4XL1U8/E9D9zf+PAc5Xc
         4+ud2A6HJb/3dn2ODUGcejoLjYHI7QtmxhiBG15Edvrmw2MQhLx9FjevXpNCg8MJH0jx
         BaJg==
X-Gm-Message-State: APuU4Z9BWxmIasivnZioW+rRV+aRMO2tWmADdwBVYwTPgUU4J5SziPB5
	Ir6PhrugR0CtMG0DkhIG57dxz5P7qYKXb5ZmayhLw4SVKQObbuJtkf9dbMJ4Xhn4
X-Gm-Gg: AZFdTZdJAywlYXgSScCiMWlCs89fIqTC0byaaiac+wSSg/i4UQSPUsW10oUUyDvHjp9
	XUsUcZv6lDEs09qTLQBYTVaO1feVi1vGB2Tq/KG6g3OeaWbngbDaw3UpKszhNRzUlRdt7dW/6hJ
	2HV9LTTaWKOqSyTZCoIDS4hj/yIujAD/kG4+iQVxr/H1R8YdwHZpHn1nsyAWFdEyLadZRvp3Rxn
	Hykt5wPK71IrHMSw0Eam5yg0xZ9TvOiLy94K+jJ4cPjXyfvrklxngNG5Q9sAxmPGnKjTNmfMSqx
	FXc7AaI79oaAFW3PL7KtN6jxo14kEmadGOvQR6MFubsz3fT1pHit/s99bndRepgWNE8b6Osrijx
	NWwpZA/q97q0WYLheNIu1Jezewj8jkan/+mL/3QsFIr3M5ZX1TPi2PVGCL0rvGFunJfnQR7uk21
	3zl2a79V2gD9Gk1Ftx9CdI2KRW7vej9wyK7Xou5m6rUhm93KzAcCsNuuBBCuEviZgDoRRF10jW6
	VYAJyuoKpu8hLlkxQD/SNTcMT/ub8sLFrFV0bUt55kkt9joSZbLxNd2EDgbjbNEpzuNj4u8d9Ag
	CdoQQL40/700UAqystSZ8hSXzoBXYwHxuuCk5RvbTamhQFyQJOt0cBZrAAEk9KnRLTP9wnpdhkY
	vidvzKLYYR972ap3VIsssOla1+rmUqHMJxWnxerOpsy/T6Ce26y0EcCQjuM1TLshgh3BMarhPTW
	NS1/0K72aOtPXGr5rB8E5n2rGOLVEk8YAsnuTtkFpO5V3/7Oj2XruCvCWE6DyrI4xFo+8pE2tkQ
	xHYDpLHohR8aC8MwSpmuVPIADt2IAC3R7l2gaQgO2/YDSwSVtb+StF7UkZuSKVckVcJ5YrCIpop
	KSFy
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr11582816eec.26.1794851726005;
        Mon, 16 Nov 2026 09:55:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 058/105] python3-pkcs11: upgrade 0.7.0 -> 0.10.1
Date: Mon, 16 Nov 2026 09:53:10 -0800
Message-ID: <20261116175359.342679-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132514
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; inherit python_setuptools_build_meta.

License-Update: The license text moved from README.rst to a LICENSE file
(same MIT text).

Changes:
- 0.9.0: internal restructuring to allow loading and unloading
  multiple PKCS#11 libraries; better search/encrypt/sign operation
  and cancellation handling; batch search and attribute fetching.
- Support user-supplied attribute mappings (AttributeMapper), AES-GCM
  and AES-CTR, CKR_PIN_LEN_RANGE mapping, fixed X.509 EC public key
  extraction. No public API breaks except for users extending the
  shim classes in the types module.
- 0.9.1-0.9.5: GOSTR attribute types, CK_SESSION_HANDLE exposed
  read-only, per-flag fallback when a token mishandles multi-attribute
  fetches.
- 0.10.0-0.10.1: Python 3.14 and 3.15 wheels.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pkcs11_0.7.0.bb => python3-pkcs11_0.10.1.bb}  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pkcs11_0.7.0.bb => python3-pkcs11_0.10.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pkcs11_0.10.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pkcs11_0.10.1.bb
index dfbd76ecd6..c2e1b768cb 100644
--- a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.10.1.bb
@@ -3,14 +3,13 @@ DESCRIPTION = "A high level, “more Pythonic” interface to the PKCS#11 (Crypt
 HOMEPAGE = "https://pypi.org/project/python-pkcs11/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=337;endline=358;md5=f68bda54505b4002e6ec86e08125ef79"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f68bda54505b4002e6ec86e08125ef79"
 
-SRC_URI[sha256sum] = "9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c50290803286f9e46bf7"
+SRC_URI[sha256sum] = "e0d7ccede3b3145a678d7c8c59b3c64dcebeb77c9146ad3394a4b1309c4ab2a2"
 
 PYPI_PACKAGE = "python-pkcs11"
-PYPI_PACKAGE_SDIST = "python-pkcs11"
 
-inherit pypi setuptools3 cython
+inherit pypi python_setuptools_build_meta cython
 
 BBCLASSEXTEND = "native"
 
