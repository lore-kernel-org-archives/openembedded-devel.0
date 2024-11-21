Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3EFD6E2CA
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:08:39 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.1601.1732154918027057376
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 18:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JD4cxpsh;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7242f559a9fso418602b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 18:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154917; x=1732759717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SU4htqkXALcRv4EQVjym2huWD7hRenrHNgbLjCMvmOM=;
        b=JD4cxpshc5FzzddVt8vTiXM9wYWxykAf3HYZXOHHp/Uf6ICt2fbS6ZHnmvGaRNTIeL
         kVB7CgJvmzD7PQ/HlaF09xfJG5M22a1LFbWxXfryvE9F3xXiSZ1hxpEhDium4NpaCZ5Y
         gg7O0NUzsLhHYc3SvWRbNIhHWx0kBbh5+VFhss/8W2PNCILhYq6+RG3ouZBRrlKcBKln
         bmLrKkg5KNk1RH6yL3NDHJTJ9YPOjyJVkbuNXwh2f7h/+43egA8XtRu0c8V2bP+aRPQz
         dZKwhz0UbqWNcAHyYioINWLEuFEu2p+iii3mZyREFeRXwv7+GP5hYZx2IAy5MfVE+IYW
         p7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154917; x=1732759717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SU4htqkXALcRv4EQVjym2huWD7hRenrHNgbLjCMvmOM=;
        b=Pv2l3KWiiaaM0kMzQBcoURscjzEJdZLUSrIi8vsDzXHPKFMvCD3XX4x0AQ/pPby+75
         wFvkj1BTSSBREKfwUxl0AvpJth28fvmEGb3CBOS+hY5PkGSb6E2Sxan0YyQsE5sNI1E9
         rr81RlRA6J+Yw3YP4ZqYXo2LGHjuvmGqzmAzqmO2EUamLIMl+AbT4J+q2VYVvAg7ot3b
         8W4rOJCSogzYgq6RBOhsKm7QaSBRkYIzpb6ZYOT9DucS7za24eRidJ9RR2gKoskZoI/J
         htgOBb1rCuiuj4AZOCiDT8qtSe/BjQwnH58nU3RnMJc7Y3ptZceor6KlVpBz/NY1SQMf
         23Vg==
X-Gm-Message-State: AOJu0YxpRpoA8VbqUIZ7Q8+toFKe1EfwO6BEjL1aPt0/tUWXPI8mIfel
	FeJMeQX135efWaiIBC4mPW7HZBlsFu9vOkkKfiWK2u9sTv/vBIpiFYzBXQ==
X-Gm-Gg: ASbGncstK6znEUvB0oWARPBjKftfUvk7Lh2oNq7K7IdZsZozVPJHGHhd8XCgsz2cStM
	mcn068IPhwsrEE0I0LmL4/plrTQz6uH6SqvOuxVisaOJuB8iRxdlCq+Ug/7oO4nQ/SOfMBU1P2X
	BXxw/cvkpB4olJSSKG9JZ2cPWO2PUn/pf5TpFma7pz7mX1y+bNMge6zN+b5QVETWXNMi3IO3op3
	POtizFTn9Y2eY/AJ82EH1bfBQ+cgZ/yNJnVgcFb2/nJr/muOQHx
X-Google-Smtp-Source: AGHT+IH/1Wlz+MNA3XL+ygP5/xtkQeC1GHj9C3IpKcPSFtSRj5ibjqyHEnamcoJ/Qxn5dR4lGNZX5g==
X-Received: by 2002:a05:6a00:44cb:b0:724:603f:1f9c with SMTP id d2e1a72fcca58-724bed26276mr5943099b3a.16.1732154917061;
        Wed, 20 Nov 2024 18:08:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beef75e1sm2397550b3a.41.2024.11.20.18.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:08:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-typer: Upgrade to 0.13.1
Date: Wed, 20 Nov 2024 18:08:31 -0800
Message-ID: <20241121020831.884684-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121020831.884684-1-raj.khem@gmail.com>
References: <20241121020831.884684-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 02:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113949

Changes
https://github.com/fastapi/typer/releases/tag/0.13.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...hon3-typer_0.13.0.bb => python3-typer_0.13.1.bb} | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.13.0.bb => python3-typer_0.13.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.13.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.13.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-typer_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.13.1.bb
index 958c823545..465d747829 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.13.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/tiangolo/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "f1c7198347939361eec90139ffa0fd8b3df3a2259d5852a0f7400e476d95985c"
+SRC_URI[sha256sum] = "9d444cb96cc268ce6f8b94e13b4335084cef4c079998a9f4851a90229a3bd25c"
 
 inherit pypi python_setuptools_build_meta ptest
 
@@ -24,13 +24,19 @@ PYPI_PACKAGE = "typer"
 
 RDEPENDS:${PN} += "\
     python3-click \
+    python3-rich \
     python3-shellingham \
+    python3-typing-extensions \
 "
-
+# python3-misc for webbrowser module
 RDEPENDS:${PN}-ptest += "\
     python3-coverage \
+    python3-misc \
+    python3-mypy \
     python3-pytest \
-    python3-typing-extensions \
+    python3-pytest-cov \
+    python3-pytest-xdist \
+    python3-toml \
     python3-unittest-automake-output \
 "
 
@@ -38,4 +44,3 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
-

