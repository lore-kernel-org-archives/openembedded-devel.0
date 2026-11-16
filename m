Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4.1794851755730050635
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AKzY/14U;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso3344713eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851755; x=1795456555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjb7RLQ4bsmlfNrRl+qyAvC4v0hx7B7OVqkx5MhJdeA=;
        b=AKzY/14U0ApZyK1WKjwolearmbtPzegwAjumr2iIJVbo7OiGfe7v4g508r3Dl1l9qQ
         MNbPofnBEd0k4pSAynA9XUvmyK3bmM+f+FL3E53oVWgNSMLYngk23BVHA72UhwuKuVfz
         pz7Gpvt18G4Ajz4wWTvkWt1gg2z0SKezbOdCMFxmKRracDeBWdXgZeQtHBoyPEV0Rnq4
         t2jMrA6DEhYKmCCrfEaBml2zIHjLW+zwjuboC/MLhJfdwXZIvq5K7V0o3TXhOj0+MXm1
         JXZ7tSkYOfOftDJXkOi2nQtRC3CM1B97Y0q84qE//tCOy+NjAjrZfSlrYs2chDFryHwj
         L8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851755; x=1795456555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjb7RLQ4bsmlfNrRl+qyAvC4v0hx7B7OVqkx5MhJdeA=;
        b=re63p1tA346zCQDOExdfRsrkxsqHTcIJegyGIonBqIO+RtRPQnIYLPxdgc1oIjPVKl
         FJO+s+2lP9jmhtMww2XcHXDQ8z724BaI8R23uJd0PXtUSRc6OoypM5rq3ZIK2hy10OaG
         CLyM8xpxiHsF7vJp8CshimiXUSRLGeJVQgN0awA2J6HT4/5fcKdqetgXkMD9RD5HLudb
         HLg1hh2zqStc40a3fDJhcpU3aPZTeVxrXvMrbXxKlczm/6TKpJYd+E/nLTO7cO6WxFIQ
         SegU8jaASCiIfP/ZHBrdF6yE7d/CEKd7KU5SZ8EVNvhSZWRjxsGyqu9alAoeqBduUaYP
         XrEw==
X-Gm-Message-State: APuU4Z/VzZ4nxWjcxA6tk/FiKbJCnsUkxRWJBokOB0XTljnvhwovhRK1
	Lun+3R+bDxoJOuGjXkFiygf9tZ6XRp/zc4Nt7Qv8f/S7HgCSh6U3NxXIxSN5gy71
X-Gm-Gg: AZFdTZeg0yoyW8CxbWroedR06nmX4tRNAkgFdFsJ4BdxZjFE9WsdUSTK+qS45pKoeD8
	VZ3f5DaoCTlI1lfufW2Cyacr5y44UVY2kSpBjQJPmNBBn6IN9IK482p8DLiyu7lu56T3xj9JbGi
	lvqyFPrYOHzGlD/BRy7N7+axxeyJLylXepMh9EC0+t43V30kwIVmsff9Ux+lbJQ8XSYQjMh4yvx
	EmPF+2HXNP/cVSsnj3kOe1SqYjoMFv1SE118k4cM+da+Hfa00tFptt7m1a+jon3ahWlUUVe4kBc
	Xph3IB9t8URBSp1xVgCuyCm4uxV7IFqh1yXdiFBwwt2vO2d65wYmhA8f3VB0ATPmnZbcCVQ3Ep5
	3cQXIatb0woGj4oeLj6wOHGWeZxARrprSGdvrD/zmhu3UWZZVlfAbH8vrv5MXGrk0EKDqUsyvhV
	Y2GdK4HoC8R0dyFEweIK8IJ7nK6Ejcl49mwhSrtk+V9bHDbbMee4ua2c/3ylKacvkFMyzLJS71d
	AT5jOjVQgeB3WyYHERcytrO24TpKk5b5LYqdVt/1Kp3Neo0EJDXgW5911gQm8EEoipCZZ8miRPo
	Ow2CRMLNVzfbAvoVZ4UbmqKFQzqfndHPBxgskMJVTy1EZrJi7uEMkFa9lZN0ZkCnZmSKApEOBjq
	Zuh+3Z4mskm2CbkiUAVzukY5mU7otzwv8kiFS3b33v+od5hzPB5Qdn41YBRVp4Lx3XTZOl2F2Lt
	b1XlNdgUPhwCYnKhtIHq029EcElct6nkhT0na3PUNcofHBmqkqoJ8wUgY3CoC2omwiC67uSK4HN
	9HG3qP4dwwBYJs4UQNeE7aCZl7u0kdRegsXXPXJiqpkTNrLAZ167FXmK8cwHNLOeQp9u5Pq4wNu
	UoTH
X-Received: by 2002:a05:7301:da82:b0:37b:2731:fd7e with SMTP id 5a478bee46e88-37b2731ff62mr7591291eec.2.1794851755064;
        Mon, 16 Nov 2026 09:55:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 083/105] python3-rlp: upgrade 4.1.0 -> 5.0.0
Date: Mon, 16 Nov 2026 09:53:35 -0800
Message-ID: <20261116175359.342679-83-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132538
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; build with python_setuptools_build_meta,
setuptools-scm and wheel instead of pip.

Changes:
- Packaging moved to pyproject.toml with setuptools>=75 and
  setuptools_scm[toml]>=8 build requirements; requires Python 3.10+.
- Runtime dependency is eth-utils>=2; optional rust-backend extra
  (rusty-rlp>=0.2.1). Test/doc dependencies moved to dependency
  groups.
- Lowered pin on wheel; project template and newsfragments removed.
- Upstream release notes are minimal; major bump is mostly project
  management changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-rlp_4.1.0.bb => python3-rlp_5.0.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rlp_4.1.0.bb => python3-rlp_5.0.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb b/meta-python/recipes-devtools/python/python3-rlp_5.0.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-rlp_5.0.0.bb
index cfd155b514..95f337f987 100644
--- a/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rlp_5.0.0.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00854fa80a84236706b11f47f23e61e7"
 
-SRC_URI[sha256sum] = "be07564270a96f3e225e2c107db263de96b5bc1f27722d2855bd3459a08e95a9"
+SRC_URI[sha256sum] = "ae8ac791160c160e270f9c7df76e68f4d42bb86a13726d807b9357c312d0bac4"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-DEPENDS += "python3-pip-native"
+DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
 RDEPENDS:${PN} += " \
     python3-eth-utils \
