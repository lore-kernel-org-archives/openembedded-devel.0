Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.2448.1625965708216875761
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bfTA5cy/;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so8314551pjo.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cSNyRmf8HMNwbOtBiIV5wOJOhg6zOb4rC3pzDwwzze0=;
        b=bfTA5cy/fo8FI4vep/WOLwJkvmlwl9GNNUP4F+vh8LuwUaGQ7l8uQCUqGYg/y/tKPS
         ev5fCBir4vGqisGRM1KJSpVjpOX58H5l14X8F5CCHH0YmYTdAGPZmImaEMKHDfhjHOgj
         f8CYcodqOPpJ6mRSgach4L/9/gcyMlIgQYFU1WRcVfpUoqRJhBnbgJk/OW/V81fPa4s3
         WNEimSIUlN9YLcmQ8Dqlu6VL8KdTjt/OPnwGuiCPIG66BZyHRZ5+SaFV0gqHvk6xxXEk
         MM2elrZn/AuQIaYl1BYbwieT6fermFzCRW0oNwWE0nHly3xjOSkagS39OZKijvWV8Xu+
         ejrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cSNyRmf8HMNwbOtBiIV5wOJOhg6zOb4rC3pzDwwzze0=;
        b=GJDd2LpyEkveHJW+JiP1nA6lnfONND64de/h6BSIbueUFqXO9Ebbe1URPpfpekE8Aw
         Fw+Kod9mSUHcZG4d4LsF1f8nLS5at/dy4hPyU+VroWNCMo8+wbKyjogjCFf91pCh2XuE
         V0l0HnTIQYs2Jbv3eB1Ige2QZ61L1L3jjrKnXtkqcca6gHIi1DxZWK5+F0BSGWKtCjGJ
         xfYVvrVv9/vuxfgXnWn3C2/vXrn8+CRpcLBZL2ZVuf/P9MQlua7oQiYM+h79GxGaauRk
         igzp8UrVGnC/loIJY+zxJfZCqUlp4f0tL17cXjKvJ3BP+j9EUbhSH8JS5maC65KAOoKW
         6neA==
X-Gm-Message-State: AOAM530o5Bn1ZF2y7DoXt0sNU6K/DeprnRgTRLzmKOnWtAcWOolusqd+
	qXkDvL3B0hXngDpOMU3ToBpM/d+3I8+IYw==
X-Google-Smtp-Source: ABdhPJwvRzqn2aVlgOeV1lR2WnPvqBhHFLc+6HaebWTpTZgPKY0WUxqekoMUa72dS+P0LfcP+WZ9jA==
X-Received: by 2002:a17:902:8505:b029:129:96d3:63aa with SMTP id bj5-20020a1709028505b029012996d363aamr27014397plb.6.1625965707596;
        Sat, 10 Jul 2021 18:08:27 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:27 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 3/8] libextutils-cppguess-perl: upgrade 0.21 -> 0.23
Date: Sun, 11 Jul 2021 01:07:59 +0000
Message-Id: <b7bbd74af49eeb67b44c2236dfd220064278c95a.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0.23 2021-05-31
- added CI - thanks @zmughal
- now recognises MacOS clang - thanks @xenu

0.22 2021-05-29
- Add C++ standard support flag detection - thanks @zmughal!
  See <https://github.com/tsee/extutils-cppguess/pull/24>.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...cppguess-perl_0.21.bb => libextutils-cppguess-perl_0.23.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.21.bb => libextutils-cppguess-perl_0.23.bb} (89%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.21.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
similarity index 89%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.21.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
index a11b4d2dba..876b75c8f0 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.21.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
@@ -12,8 +12,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[md5sum] = "62bdf731bcbe988d07486836e11585f7"
-SRC_URI[sha256sum] = "ff629178321a1e591b83f809712593eae4408a413aa448654bce59b156f24153"
+SRC_URI[sha256sum] = "f96c48984eb6d8efb7d933b34f361d0c8b38335e3e5382e9aeccc0aa519a002c"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-- 
2.30.2

