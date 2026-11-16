Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34324.1794851707611692060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YSW6l+sW;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40319bdso864869eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851707; x=1795456507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNJAGxVZhXxSa08S07PEw13Mjv4LyE6E0u6GT4kVvvM=;
        b=YSW6l+sWxP5CFHFYauICv7OIQ4cGQBx0cNJ5ZUK04L8zohbGFnnVQQ99NU2WkdORdn
         20A7xUr/ZoHPuuHWxi+kMPTvLHAwI/MHGGWaz/FLAjuh8fMOVg86frv3vrUOwUkcPukU
         IhpJP9z027pilK0bpiKZNAJT71M2lhoIEjDmL/lknds0+Jsrl43n20IEJtiUaqGR+hj3
         E5gUtqUXR+eroymYYdRGSIGyGMSs/RwgkHLoyBxZa4W4K7n1ercDVlYnBe9m0HP0HKya
         DUssAhFaOJQWCzS4D4AwF8qf99wK2cVAoNyvlvjHBZfaOd0ZuPDwmzb5FBoe+UzZhnru
         rewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851707; x=1795456507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jNJAGxVZhXxSa08S07PEw13Mjv4LyE6E0u6GT4kVvvM=;
        b=b7TomhMNWQt0XeshZ6IBoVNL9l1H0bNRSXNLbf/GG6S66zSGvdVQhO8jw0XLdK2eYo
         Xfg6xKt+CqE3k7BpAC/ColRsV0JVvRkNCw4adMBAqd/FfNuvRfTC1eXgD0bFFazhMuTc
         kL9o/rOrnieIKvLNET7MptIRJxoQp3r7K4xJ8pLnICaUB95mPd09/G1+NLSsni4aJ0rp
         wEoH7L2GfQam3V3Eqk7U4+crCTgVeG0RqqdD/5Wr3sFYqiRn4sXu52TOqwZEp4JqU9nO
         ZDFzQfccQcUVO/vBjge0YBcNbngfV72Pru3isn5/sbXCffbLjX5AAyPjTYs7jmOKdnIP
         xpew==
X-Gm-Message-State: APuU4Z9gmK3or9awogxG0HK43vg+PA31CO9X0PeDzlQzjZmku2UWZSn8
	DHkAxAMbSeISjKp5tcyslkjXOmVvJ0RnOi/6iPupp+bA9YE4L3Ej02KYme11Fcds
X-Gm-Gg: AZFdTZe4otEP7W0U+wJQcjAScJf4eFqnyjhVTSzyjyY50QW4TfRvvzGgx2ErCGh2d9A
	UVPHH15cdxyGDQIAZ6EQWXk8pWpOKbd4psDGUpMTSmlCRwBM9LUe8uQ9YHAh0KvRCh1iNCP20aR
	A0K9MAoOA47tx/bRexVVLD2b6ZkOsAgsibeLZhJ+8rxGig8FYo1U6hTOcQb113zUzztjM+cjZB+
	iMLH+ZQXUg9x8TbAh6GX83wjUxaYA37PRb8ZXXVZf760ePncPeqkjjdqapAA00Ia7UFrXWhQsvF
	7lQlMGv/au99wImPhdC19mYS7vY6Vw9/73U3+Eumav6LLY/QNXRt2PLlW2xfWrHqRs+MT6o3bDp
	nhTerutL+FsOqboqMpYvFvQCl5LpxRB8DuCr228dG+6tPC7MG0WKtVt/V7xB1fdyBcJ71z/WAZv
	HWw0XN04sDepS9goKZDbdl6uluJYzAHVqdR+lGdgv5UmHG06e7brsZZUQyz71TIKp2NrTp4Ig20
	uUH9eQws7YsDcJ3hsVi18nGtWsdWfcCB58xfpUHALKwhQYQuYiJhlpYseRS1FHJvx08Mq/ZVlWk
	gugv/DeqLkK+pMyuccc44vkJroAxABu5HGuaPLls11kzBqmVUw49mOIew1qzKY2kvrlrybSFxIa
	e4pqh8G5jvFi6FmyrquOza4aYs9Lp0p39LAFlyftfvAnusMju+VZ0uznpGgBcWcpg4Azqs+bDKi
	eJVIzuOIOjJWEnSSrq0k6uc7KU+D8O/0imVWAEgWR+7PtaQdYIcOsluYYxrFLMtqxc4XWlgN48p
	YXg/JUpZ6BSD5Q2x6abBmrxV/O8XhCi8Gxwkgbpt+XTRp1bFO/uwCVhguYhDzqscoyhF3BrCZgH
	co1EB72/J/m3/AxwHeMocKSWyw==
X-Received: by 2002:a05:7301:fd89:b0:369:fe81:a575 with SMTP id 5a478bee46e88-37967ae86famr11075342eec.35.1794851706867;
        Mon, 16 Nov 2026 09:55:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 045/105] python3-javaobj-py3: upgrade 0.4.4 -> 0.6.1
Date: Mon, 16 Nov 2026 09:52:57 -0800
Message-ID: <20261116175359.342679-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132501
Content-Type: text/plain; charset="utf-8"

License-Update: Line endings only (CRLF to LF).

Changes:
- Add a new "v3" parser/writer implementation with full read and write
  support (requires Python 3.12+); v1/v2 remain for Python 2.7 and 3.
- Fix reading of LinkedHashMap in v1/v3, arrays referenced more than
  once in v2, modified UTF-8 handling, and JavaString str/unicode
  comparison; clearer error when a transformer class is passed.
- Build now configured via pyproject.toml with setuptools>=77; type
  hints fixed and package declared typed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...on3-javaobj-py3_0.4.4.bb => python3-javaobj-py3_0.6.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.4.bb => python3-javaobj-py3_0.6.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.6.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.6.1.bb
index beafebba28..15301e1d67 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.6.1.bb
@@ -5,13 +5,12 @@ DESCRIPTION = "python-javaobj is a python library that provides functions\
  representation is a standard data interchange format in Java world."
 HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "e4e3257ef2cf81a3339787a4d5cf924e54c91f095a723f6d2584dae61d4396ed"
+SRC_URI[sha256sum] = "088ff086c6aa2912f342754c43b0ca3a504fb869bb5e6f13395131e87744ef3c"
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE_SDIST = "javaobj-py3"
 
 BBCLASSEXTEND = "native nativesdk"
 
