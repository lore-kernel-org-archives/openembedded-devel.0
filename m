Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.3564.1618693581042793063
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=twu9QMc3;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id d10so21536813pgf.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FQjWFyIC17jTpvEn1ViYnKRh5LqK1hJSQzYx1DZ+x64=;
        b=twu9QMc3ZPhU52GPyH2I5kU5Xri1ZJA9L2hn5U0nEBS7V07LkGGtwK3JJLQ4tYSqS3
         JOwmc7H75QFOGsuoVeaEDhHzvK+qe1PdWJy501NvtlYKDgMjBRCimQFwyy1PtEZl390q
         3jctpwBH5Hx1JLC4wbESSLgSzOJHvRexq4sJB4AyLbi8mLMLsNJ7X/nvptQMoXoApFjA
         ekxXcEVAkup2r3o9AbvffK4ZaKNYxb7sL83hwLysA6TSJ3who6UE8rkh6j4hBbr/3AIH
         OR1mZFrAG2fCX4QVHTzZpku6XnYTCyaTeosYtVdb+X0RC/hn9A6QckijgTB3vghwtzwQ
         4Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FQjWFyIC17jTpvEn1ViYnKRh5LqK1hJSQzYx1DZ+x64=;
        b=JMhwz6coB14/2kXZu1FhnrSrWt3xrPB9DCRkhdCyRnxoRWFII7xA2pY+IG7rVgaCGP
         bn2VfzTaJbe4kWCvlWrZjcEkmn+9NwDTeUyu/zTDMTbgW7qJeCht+eha9ROkcolhObEZ
         LR5gHkI5gveuUSveLS8O0j9Asgt5/3KbhNhQHKjTgM1fHozGS6o1HAGx82UujVXrb6Pc
         ygMugJiqdfCCNpg+3yJ4D2H7w2k9ToOvTo2tNyXVNttlurjtPipKn+zPyNz1lN2Wa/HO
         +f6EyiFaFU2qcumRHDtVHYkSURyYQLn5XBf30IR2Txkydo1I0XMjuxKoBEls4Nyaa/op
         uMwQ==
X-Gm-Message-State: AOAM531tcr+xsaXCox49Q3XBlaRUAbqbnC6Kua0GnFVe7dV/WeBDBi28
	j9wg/Gjfl581UekpPzVI+ITwuLH/j98bIQ==
X-Google-Smtp-Source: ABdhPJyi/uoM3RHZi1yEhjnjGIT51nfvOM4mxx39OPk4qaqoZXEh6Vxfo0LhOFStit8/3x9Bj7gbcg==
X-Received: by 2002:a05:6a00:2303:b029:249:b91e:72f0 with SMTP id h3-20020a056a002303b0290249b91e72f0mr13015782pfh.80.1618693580464;
        Sat, 17 Apr 2021 14:06:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 15/50] python3-cerberus: Upgrade 1.3.2 -> 1.3.3
Date: Sat, 17 Apr 2021 14:05:24 -0700
Message-Id: <964eebf3478bfe36ea12f78d2a1a00f45202617f.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Minor code refactoring of the recipe and upgrade to release 1.3.3:

- Classes can be used as constraint for the type rule
- The abstract base classes of the standard library's
  collections.abc module are available as named types for the
  type rule
- Generic type aliases from the :mod:`typing` module can be used
  as constraints for the type rule, including parametrized ones
  a.k.a. compound types
- Support for Python 3.5 is removed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 4d94ced1ec43e7c9c0f8a24a5d3a2e7a219a7286)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...cerberus_1.3.2.bb => python3-cerberus_1.3.3.bb} | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.2.bb => python3-cerberus_1.3.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
index 61a76f5f635..fa0bbb0aad9 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
@@ -1,11 +1,11 @@
-# The PyPI package uses a capital letter so we have to specify this explicitly
-PYPI_PACKAGE = "Cerberus"
-
-inherit pypi setuptools3
-
 SUMMARY = "Lightweight, extensible schema and data validation tool for Python dictionaries."
+HOMEPAGE = "http://docs.python-cerberus.org/"
+SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
 
-SRC_URI[md5sum] = "6e648b38b468617a06745d1e8a96c848"
-SRC_URI[sha256sum] = "302e6694f206dd85cb63f13fd5025b31ab6d38c99c50c6d769f8fa0b0f299589"
+# The PyPI package uses a capital letter so we have to specify this explicitly
+PYPI_PACKAGE = "Cerberus"
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "eec10585c33044fb7c69650bc5b68018dac0443753337e2b07684ee0f3c83329"
-- 
2.17.1

