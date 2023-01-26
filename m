Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAFDC61DA2
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.68538.1674717464016100701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YUR/UHB5;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id p24so1108379plw.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NrJf9hyRvvhJQNtx13SUFUr28UreczdA2/PYgZx3r8=;
        b=YUR/UHB5rYO0cv1/DSOdBuzmSR7CswxWpXX2HZuLyeff4usnYBtFp5favPvACwmum/
         Ta2tjWUNC406qoDff+mDD4qihFBbdbRwA1arjbGWsadjt98U1n3pjzlFVOfnCCyj1SQ4
         DDk6wfth7OybKmWhPJ659wZFLrGsrWdWNjXUih2BRWM2XLKhKVxLM0l5FU1RxDdLWnfE
         L833ss0rfcXppMZVfWf1nvm/mJ0GnZrDKly0WKIDgndWCOXGXFnuv6JpCFLh6+a7ePIL
         wS9N69Ibsg/hkQtFV1lN3zJKrtxcI9F8puPXcOc951YjjcfY1QdU2vjZZ6kaeQ37Vye0
         eEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NrJf9hyRvvhJQNtx13SUFUr28UreczdA2/PYgZx3r8=;
        b=BVyU3OFFnIwmD1Za7fC2fqf4RYd7CXMuYQs2l04ySQfX0rBfpP82vsphpZXGmDUEnp
         pRs9iVmQrhl5+pZWpr5juXu884T4UWWp4ujkk9RNJPmc6mxq+aYK7CEVljOEfQe/8YBf
         /FzIF3FN4Vh3nQlmclcckjv0nanAx1zw5wgrlDMN/lt7AFvt0yKIdfcBu1z7JtiHiSoj
         BoXieXxMn1xaWpTQWJ4mJKlXUca4YSD67KIe8rheGBfpe3pM7u1NjT6ntBOnsTekslnk
         cB8LaOIkthpnAR25vu+z1TV21FeM/jvRc0c9sZ6vZEUXRGDeedfKc1y2YyRjMwy7E7LN
         Nc/g==
X-Gm-Message-State: AFqh2kqNykJauckfDirV6ISwdL43PbOyyL5XPihuiZV+AmubRmH4feKU
	P4lHrACe4GS+jvGK0yOXnqim5jVU46P+Sw==
X-Google-Smtp-Source: AMrXdXsWzfAA0F4oQEwNqYHu8hWxEnkYYGfdAeLfjAdWOEy0hdmFNwUxrPvb4oiuqI430jGIfOX+lQ==
X-Received: by 2002:a17:903:32c8:b0:194:de51:9af with SMTP id i8-20020a17090332c800b00194de5109afmr28315900plr.22.1674717463137;
        Wed, 25 Jan 2023 23:17:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/13] rdfind: Upgrade to 1.5.0 release
Date: Wed, 25 Jan 2023 23:17:28 -0800
Message-Id: <20230126071735.2444745-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100788

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch     | 2 +-
 .../rdfind/{rdfind_1.4.1.bb => rdfind_1.5.0.bb}                | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/rdfind/{rdfind_1.4.1.bb => rdfind_1.5.0.bb} (74%)

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
index af69c02173..a65d8cb77b 100644
--- a/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
+++ b/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/configure.ac
 +++ b/configure.ac
 @@ -46,7 +46,7 @@ AC_CHECK_HEADER(nettle/sha.h,,[AC_MSG_ER
-  On Debian-ish systems, use \"apt-get install nettle-dev\" to get a system
+  On Debian-ish systems, use "apt-get install nettle-dev" to get a system
   wide nettle install.
  ])]) 
 -AC_CHECK_LIB(nettle,main,,[AC_MSG_ERROR([
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb b/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
similarity index 74%
rename from meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
rename to meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
index f8eb5d38d4..0d776b4e97 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
@@ -9,8 +9,7 @@ SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
            file://0001-configure-Fix-check-for-AC_CHECK_LIB.patch \
 "
 
-SRC_URI[md5sum] = "180418c863b861d1df221bc486a07ce7"
-SRC_URI[sha256sum] = "30c613ec26eba48b188d2520cfbe64244f3b1a541e60909ce9ed2efb381f5e8c"
+SRC_URI[sha256sum] = "4150ed1256f7b12b928c65113c485761552b9496c433778aac3f9afc3e767080"
 
 inherit autotools
 
-- 
2.39.1


