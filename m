Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33049EB2716
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:46:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3327.1770756372968891216
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 12:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mY5pXzyC;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so14892585e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 12:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770756371; x=1771361171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXFHiXZAj5HeK9gy8I8h+u1mWYf6geTW7fKznws5weQ=;
        b=mY5pXzyC7rDy3YFrfXdebSvGveaAyW7avzPQmjZWoZnxZS9bonNtNnDetvyVXCNHDu
         o8bn6eapKDnNiV2nHqxQgtMoV6nY24G0IW51AmeVFeIx3Jy4uLjcQ4KNE0CMpPayUX22
         8yl1bCBOgJ21BwIEKBhde0fza3VXkst9QO7DIichZGdbMRdAW364wZkuBMzKfM12w9j4
         NcrTe9rhW6YhX/wtjXuMvP0wTnJqK1k4LN0EaysqAQ1m3om+4N74B8PeFmAXCTBXlrkl
         QveZ8mjdRJHSVPyZumMSh4HW4ykuFFLNqMhfIIm4jbUoHnKZ6fqhD1mAhwMZsnq1a8Or
         m+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770756371; x=1771361171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXFHiXZAj5HeK9gy8I8h+u1mWYf6geTW7fKznws5weQ=;
        b=jwcmWbm6FN8P4WjUjttk+HCK/AZFDDhpK56gZ5jIvhcvPSIcC1Cvf8TlBft9ONFgNM
         sKGon/qdYRmPFNfMfEuD1cHOf9P3PL6X7t5k62mpSmEMKkEAntYMzVwrVXln40O2P+P6
         FeW8GZllXrjg8auS2xWYn35an0FLg39PbKFx8kZ0LlfkFaK+yV6Iw4/DAndzhs1ssn43
         95HOjEnUqMrzTqqaQriGNIhClAQ6r7DOBMfkVT2Yf1gn9yDNKljsqql1HKsXSORalRsm
         Rcag1cAF6K9tdnEqWLX/+L4ATL4QiXySQVnYNv8UlULqwFuX1xr5WLIps5Eao7IRD9aP
         gXGQ==
X-Gm-Message-State: AOJu0YzFSjaJmPgcaQgRRUvQ0ZsREEpwSHE48zVSypphzw1KiHceIj1p
	eELf2vGJn+I1AjZqc7pMgnOIo9GgI5OAwhvqeEgQdlmZX9G1gP7pcfr760jIbg==
X-Gm-Gg: AZuq6aKbVI88XH3ffvQXuOJbKkdagsp093RRbF937O9rq3dXamvFTcChoEsCuFLdZTO
	6clHXoRN2z/sJCjyNDYJ9OT/4arnf6MqtJcBicUJ/CJLX9r1WzRJ6csJu0MhCo+eHRd7xgEetZM
	LdQ4hRA/okTtlAz1Xhd8DaH4JZEGwYOKbAqC45zyxO2XBqVGDKALtxRe/u28pPRlFXsSRJeYYnb
	bk2CoimrIuyX62e/uHkr/w2Poi02GJzCfs9QELLAC6XHgiRZeBR+VXZlMBXTn8uy+9sckzh8Mn3
	dkeTpdlUqVex31crk8DneEjBMSQxF63Fp5Wvam3cTZYnIN4D3uprUERyZTvUntgwu6dGWO21V0n
	Z7p/PjlTk/huX72vDcMNEL3IvWp37jpjuuxReu8CO94DFUa1RuIjK7WvjIW4KhtvRQCIrFG7XJ5
	H4U7LbSlwy2lJHRVhCWtWp
X-Received: by 2002:a05:6000:613:b0:437:719d:a74a with SMTP id ffacd0b85a97d-437719da8femr10316386f8f.58.1770756371175;
        Tue, 10 Feb 2026 12:46:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm20198176f8f.14.2026.02.10.12.46.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 12:46:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 1/2] python3-django: upgrade 5.2.9 -> 5.2.11
Date: Tue, 10 Feb 2026 21:46:09 +0100
Message-ID: <20260210204610.169129-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 20:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124325

Changelog:
5.2.11:
Contains fixes for CVE-2025-13473, CVE-2025-14550, CVE-2026-1207, CVE-2026-1285,
CVE-2026-1287 and CVE-2026-1312

5.2.10:
* Fixed a bug in Django 5.2 where data exceeding max_length was silently
  truncated by QuerySet.bulk_create on PostgreSQL.

* Fixed a bug where management command colorized help (introduced in
  Python 3.14) ignored the --no-color option and the DJANGO_COLORS setting.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_5.2.9.bb => python3-django_5.2.11.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.9.bb => python3-django_5.2.11.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb b/meta-python/recipes-devtools/python/python3-django_5.2.11.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.9.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.11.bb
index c0aff44a78..edf9aabb79 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.11.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
+SRC_URI[sha256sum] = "7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

