Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33626.1794851659011592513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WH5cybI/;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so5472241eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851658; x=1795456458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4CHa2Nps850IHkR8hC3KxX4IuIKvKEZmFnSHcqi3SQ=;
        b=WH5cybI/21G8enKt/NnOCZLSdlv4FWETuIB7JCgLbEP4Dgn4qIUCjNQhjU+fAD5049
         cfFtmj2S/dIuNsEGToFhkm7DEeabp6HuV/EjArG0VgnW4djId0WFV7M+93IaVvIrgRX4
         ZAWLOy+7IMnpuVqzltJMgUhPLb/3q4x2/BCDWxd/Humfw8cx3Og83VA7zlfRt1MkADD0
         5pEZtb8jDq3Wz/PBhLH93DAmvKgp/3TtKyrFY0RvRkSgXTE86mXY4SoBSOL9itV71QIC
         gmgeP5P50BfeQwNNh3rAB1LGVqethCxvW2GBScNJFibHw9m6NpZK9aH31LC7CqTSfIqX
         3cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851658; x=1795456458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4CHa2Nps850IHkR8hC3KxX4IuIKvKEZmFnSHcqi3SQ=;
        b=kzdjIMtYuZEgkpmcYKIGb5JF7H8nsSNjojfliz0b5zLE0KRVcek1x0qu9s9w14r8jI
         lljTTHi5I9ZSGRjj7l/n7MRnDDJ9Zt6+g3b3xvqkvuWu/UT1FewfVqmGC5eDchk5BrtU
         k4p+drxKQ0XdPU+mbYnhMPnjVJ3F/+rHkLI9JOm9vGETfWTy+JPRoqC0PEMmLm49jIvF
         E+aZ9cDsZpP+E/pIkrEIBlGiXip7b2cHVtfr8ig66keNO5LKMKaf4+tldVTXr53MBHDe
         J5xr+WiP3Y+U5uex2XjA8qrvlty8a3xkXgqvkkLVkuF+fpkdCFgnwVaKU9gRyJd1uh4u
         EL6w==
X-Gm-Message-State: APuU4Z8nFIRr/qQidNFXPDTEkXkEQD455WCAN5OfX13/shhQk830tau7
	9j0Zw/snlYGMQO/Jvcg445/S96hYPMXjRfg9Zqmelug/NDg6mI8LtTyrgaytQ9qJ
X-Gm-Gg: AYBFou0XxOuAqTU7j1Zf6Q6oro4EUJmBn1304K7f4NagbDqad/vSUGHu6Oi3InG0Rre
	4v1s6Mxc+x5YFtP7YtreMQjxqS7dEcCKQZNxubxa2d6zUpS6OicFs5Z6VeOVP8chLNgX6N+bWgk
	R1pHQzb6tkdYWuq642nO8dpxb9SpNxkch+XyV0upTcWM3dkgqOAr1N4+66TaCjqUIQFBqzGDwk6
	rYgARi9U9CGt7bfM1KFIg9zJKyKWs2B8teKiEKMd03eayMEN/GOPgBg0pLqUJsSDMPVFCidAd4D
	33yEfzAR2lTrMPW5OPfOw0EWO5BZ4G+/Np6IclyKsMwxyj+PGqQeMwe6aQvR4yMObpn7kEX1j0A
	+GmgYW3FbLZ0efb7mYh+mNq50UqbDNWy51OwsOAJ16mvuR/YhMwS3vxQgAynRwNFXENwTIJ8fPb
	ImY9wMEkPqc/D1mH0vGOwAnGktysA8jMJTmiQrE7V9wjvc9B3c10zVdAgzFcoGMmhfxf7b5kBoU
	PegL/f1rTRerHy+ExryMYC1fmZxyObF/M+OP8fqtiGc5IQThui46CI5VmfwFYPmaNL5+jAAUO1p
	1n1G3Iis0g+/lOmno0SmbCBDhMBOHYWH3wwxAQolFlRu86wmXpiYRNY3ws7WwD+NG3UlFTR5/Lr
	Ig+o1E7L6hv88NxEtSeSafJcWIDG3T7U2Q6sfNyi4tc9WIDJd7a9EbbyVyN59zaYrZ8/uVVdMiD
	s/7v+Iis6PlkVKFb9J12MsLwyC+P02LLK4ig9Geu/75FYi6D0i3BRFUsBVHZXntmDa7V1yURwfl
	u8nQl1WccXHZbis5s+Q9e10S4wVbsnFxPpxjoUgcucWAxq637o6A8r0x5iAh0HNeyJj/gLvHsOI
	cUCh
X-Received: by 2002:a05:693c:894f:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-379636607famr10736102eec.2.1794851658101;
        Mon, 16 Nov 2026 09:54:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 011/105] python3-cbor2: upgrade 6.2.1 -> 6.3.0
Date: Mon, 16 Nov 2026 09:52:23 -0800
Message-ID: <20261116175359.342679-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132467
Content-Type: text/plain; charset="utf-8"

Changes:
- 6.3.0: add --format=json CLI option to encode JSON as CBOR; encoder
  performance improved significantly.
- Security: fix segfault when encoding self-referential or deeply
  nested CBORTag (GHSA-ffh5-vwcq-7ccw, no CVE ID listed).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-cbor2_6.2.1.bb => python3-cbor2_6.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.2.1.bb => python3-cbor2_6.3.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.2.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.3.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.3.0.bb
index e7856adf6c..73c9e92f42 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.3.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "086c1588bd407a46739da704b5ee7d15225dc998d9582a0519fc6c9a114b25f7"
+SRC_URI[sha256sum] = "fd4d6b3533e966eec3fb33ce0f17e925fc09b512500ab7770867ebec7d7d5dc1"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
