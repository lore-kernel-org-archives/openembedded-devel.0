Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8919C433FE
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1881.1652344922537158868
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=3ptZKPRf;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id h16so5522070wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F0w3Qd23ImeCrKVVzHszwH49psdSuoaMZPlNcCrMPSo=;
        b=3ptZKPRfQo/+xVCjj6goq54eyyIxAkfmiPsGrY3mPZYwn2eDCKqoPmbwuwYHUw1ik8
         zucXz5SSuul7qsU0rtUmyp1wgnPnEG4tQaQBydbgppMFU+KrrYLkDzc7aqRfBb684AeB
         +svSzQbrRRkR4CNM3TuQYcy9kmwdKcQD8AewAvsE1TMY/hLJQo6tKJUfMDpPKUDEv2f0
         WrZDXM625yY3dwHg2FVNFrTTaFImJcW/lc78DWbnOcAlzYjk4+R31MFHxbJzwjORh3qF
         n2vJ9dENdV1qb9QOglwPM8MB8GvdhniwlsGbrWjibICB6Q81bVHeleJXDFwjvim8bLom
         JvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0w3Qd23ImeCrKVVzHszwH49psdSuoaMZPlNcCrMPSo=;
        b=5JauPL7CduyP0OqCp5EOU+Zsx4eZ3E5mOBs/D50VH89sq0oTm0mTMoApqe9r7MXOGU
         uNEeuahCugeVT0SrbPjRsMnTQhKo0bUhnANVEUqY3Lz+Lk6X0z1dvkUaF9SbrVCmbUqY
         6E+q/we80AocKL4qV8un4XqDJU/IIje2+Vo1bW3MrOKI5PVq29Yp5Vu+/kWYDR19zt0M
         9i1HLDnwNoNVWRsiIxYnY6s0dX/eZRD4Nt+2EqzvsZ/rA33BhBPb6npf0IVHfZyGtFV7
         XIOGP5S7zi3POAMoQCjMgRFqrpug73GQWKtyEL9cIAGF/rCYM7sz1rbuT0XGIrlYY8o4
         ikuQ==
X-Gm-Message-State: AOAM531JgzBYCBxBlJYQ7EVb74Ykzhb/YMtffUUkB596xd9zbkCCZ/JL
	o5WrHQyEdSGZ2xGgWRl3zejwn7fNOl18tECb
X-Google-Smtp-Source: 
 ABdhPJzxgLmNhPkW+ccthD0WVwFuv72j4FyBZuctWuQnaZQSd0EaWaqH5iYcLvZ7QBkz8uJEooexcw==
X-Received: by 2002:a5d:4d8c:0:b0:20c:57b6:3319 with SMTP id
 b12-20020a5d4d8c000000b0020c57b63319mr25781704wru.536.1652344920931;
        Thu, 12 May 2022 01:42:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 02/16] python3-cytoolz: new package
Date: Thu, 12 May 2022 10:41:38 +0200
Message-Id: <20220512084152.1388464-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97050

Add a recipe for cytoolz: cython implementation of the toolz package.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 +
 .../python/python3-cytoolz_0.11.2.bb                 | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 5edec8f68..5f97bd954 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -86,6 +86,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-custom-inherit \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'python3-cvxopt', '', d)} \
     python3-cycler \
+    python3-cytoolz \
     python3-dateparser \
     python3-dateutil \
     python3-dbus-next \
diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb b/meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb
new file mode 100644
index 000000000..14f597c28
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Cython implementation of the toolz package, which provides high \
+performance utility functions for iterables, functions, and dictionaries."
+HOMEPAGE = "https://github.com/pytoolz/cytoolz"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=efbcddfa5610ca0c07ecfa274a82b373"
+
+SRC_URI[sha256sum] = "ea23663153806edddce7e4153d1d407d62357c05120a4e8485bddf1bd5ab22b4"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-toolz"
-- 
2.34.1


