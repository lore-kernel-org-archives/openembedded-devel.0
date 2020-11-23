Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web09.31369.1606112685555698596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 22:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hySxKD30;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id v21so13316964pgi.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2020 22:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PL9D4HZiDDyp1pAoTSTjzPhnZ9UjfL9SqEQBaAJSopI=;
        b=hySxKD30Ipo0nqUYHHaNOjM1J603V4PGPtMCSXiEuL0IeNldP8thsH74iKdiKY0ABQ
         R0/4Cx1hfZtUNcDneP4alMxn0yVgwAjnrzCjoBS1UPldawkykEXS/orgTe/5Q0DiHBhk
         fMtUf5daz94ZUkPqvBkxqUmdu2aTbGyi/wjIlc+YscsEH+loZIPB2QR2xP2XtP4h7mqq
         +lIJehXxMbFdEzU6qEFb5MTIjjv9s/gE6fZ/Ro8yMoJEDWYeJ5OQsRe8o8xtvsdUXCvc
         UQ3cmYpkDjLpLJC33EpZFhFXSeiFxvkIU4kAiuAq01Y7oZWIk6CiSLa9Xua1Kz/DxBx0
         8Zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PL9D4HZiDDyp1pAoTSTjzPhnZ9UjfL9SqEQBaAJSopI=;
        b=ZWHvV/Q+K36Q0QZoQ14snUCEkeEiye9tV74AaJFaKbxyku3Hwj5mywe/dl5VgJJAXc
         WyOf0djubBEf+LtWzr5CaWtVtqtdTsHTE8sugC9QWEP/dlku4YZIJLsErZjEEkgaZE3S
         t12uz7NP40GvVkVdNCjNp1NFA7RF+9JX7YUUhJZ1uronRiU050x/J3iI8Mdvncgw3iOt
         7M0rUSRw52Qr4Un30Y7GdwjGD6EuNeIlWFAZ4lxoH7u5FsxXIEFJd6ge/cUYrirnTLtF
         14XvOPfEP4RbTaUwplgq4nUMeuE5ZNA83/732RLYL2BmdNZV6DpGWgaFNrzTbPoo10dY
         zuMg==
X-Gm-Message-State: AOAM533IqzMu+tFhZZRwjNe+xRko+Z75PAlVkaLopVgwWvIUsSMtBnNQ
	NS9beCokrywrcRNgLX5zOFRF8+23UrxxFQ==
X-Google-Smtp-Source: ABdhPJxh+5jc2fwVVGyu7eFib1bHU2xuMwNmkwnmSaJu/wqoyucy+Qp0IemRmQaoJbg9G6auMFM1CQ==
X-Received: by 2002:a17:90b:4b02:: with SMTP id lx2mr24120558pjb.49.1606112684697;
        Sun, 22 Nov 2020 22:24:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id gx24sm12110239pjb.38.2020.11.22.22.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:24:44 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-pytest: Upgrade to 6.1.2
Date: Sun, 22 Nov 2020 22:24:39 -0800
Message-Id: <20201123062441.2998158-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pytest_6.1.0.bb => python3-pytest_6.1.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_6.1.0.bb => python3-pytest_6.1.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
index 1da43c4f9b..6872da5cfa 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
@@ -3,10 +3,10 @@ SUMMARY = "Simple powerful testing with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI[sha256sum] = "d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7"
-
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
+SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e"
+
 inherit update-alternatives pypi setuptools3
 
 RDEPENDS_${PN}_class-target += " \
-- 
2.29.2

