Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.47263.1598851867569921649
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WGVvR5uU;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id c142so3861828pfb.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mId0P5RdNK8UfxHMR7GQI63UnwZC9xtA4QSrPad0uAs=;
        b=WGVvR5uUkWOtgrPLISVqk2rXkTHQHJv0Wml1ip/B7tA9rrTu0hGqDJj/GLPfMy9FaD
         krWZmhcmPFFNEq2V+HyNIxBPvfP7dcI8pztUfzh2ym1Me/Xx7+gtjUu4ixMGaoSV11a/
         yPQldYNwFjqAkJK+QBbVEcmchgblwfPjoyf4BqaDpWuW+teLQUZUrtsrEm6FW6Og8Z9Z
         Qvk8FCOJ0xVZk8A/rRLjE2zuAAYU+TCr/3f52D/Ih3T5zRhDUWslElCJkwrLpkANCDbN
         n/YdyORPlHixBmbv1y1JlQ2eWh9kcCrkW3UUL+v14aL2ZjEyUpdQ8/98JvILzUJZdluZ
         RE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mId0P5RdNK8UfxHMR7GQI63UnwZC9xtA4QSrPad0uAs=;
        b=dZaWD7oyvQEsvEyJFJRpITn4Zq/Pb2KsMBafjtaNKOHzFvld1QbNyTMHYvbatB2ByE
         JduNROS/5vUavUWdJcwpqxNPvbCsHfo06hOUyzlnD4isIaFf5yPO539tkLrhilRYG95j
         LflzzQ9/VCm+j/DzWfOC3m+s1q24BQC0rvoiROfFwksS3A6ghlmA5wlSEVlLv877xYwn
         RMZS5mfMG4gAfAlpfdpw9gKuapIGwUlC1OapAFQ/3EsbxA3Qg7/kDZRPn9PYjkbn/8AV
         sC0VbGsDvBtbSFrQ6yAmybeyBdtgkok5EV4kjK+lDjo6qUyjXuYEREVL++1seasWDgoA
         aGvg==
X-Gm-Message-State: AOAM533lsfPf5gQaPaHA3soZKgHBzPi0hjeLg6tOxMzbn3xeQnsa4vKZ
	CEpK12jqlQDxAk4PTRnV7jW21ZDYb5Fqlg==
X-Google-Smtp-Source: ABdhPJwa0GfOO+V/v5BI+xOtpnJEj/qmCAlrpwYs53yXdmnQgsUsfYjheZpFxN0ckiGMutaRx6M4Kg==
X-Received: by 2002:a63:584e:: with SMTP id i14mr12293pgm.433.1598851866803;
        Sun, 30 Aug 2020 22:31:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] libusbgx: Use update-alternatives
Date: Sun, 30 Aug 2020 22:30:53 -0700
Message-Id: <20200831053057.1541321-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831053057.1541321-1-raj.khem@gmail.com>
References: <20200831053057.1541321-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadget-acm-ecm show-gadgets are also provided by older libusbg recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libusbg/libusbg_git.bb   | 5 ++++-
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 7 ++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
index 97d60a6a8a..b1c4663525 100644
--- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
-inherit autotools
+inherit autotools update-alternatives
 
 PV = "0.1.0"
 SRCREV = "a826d136e0e8fa53815f1ba05893e6dd74208c15"
@@ -14,3 +14,6 @@ SRC_URI = "git://github.com/libusbg/libusbg.git \
 
 S = "${WORKDIR}/git"
 
+ALTERNATIVE_${PN} = "gadget-acm-ecm show-gadgets"
+ALTERNATIVE_LINK_NAME[gadget-acm-ecm] = "${bindir}/gadget-acm-ecm"
+ALTERNATIVE_LINK_NAME[show-gadgets] = "${bindir}/show-gadgets"
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index d73ca61060..48fc911434 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "libconfig"
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 PV = "0.2.0+git${SRCPV}"
 SRCREV = "45c14ef4d5d7ced0fbf984208de44ced6d5ed898"
@@ -38,3 +38,8 @@ do_install_append() {
 }
 
 RDEPENDS_${PN} += "libusbgx-config"
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_${PN} = "gadget-acm-ecm show-gadgets"
+ALTERNATIVE_LINK_NAME[gadget-acm-ecm] = "${bindir}/gadget-acm-ecm"
+ALTERNATIVE_LINK_NAME[show-gadgets] = "${bindir}/show-gadgets"
-- 
2.28.0

