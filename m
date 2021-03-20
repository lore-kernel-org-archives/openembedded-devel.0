Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9313.1616275427960799529
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=0Qanag+u;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id o16so12683200wrn.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=joQIhy/GzFQWarcZLmMYVeu3s/bTVTgd8EMdsvNSyZE=;
        b=0Qanag+ucvdyXvrdC1SOQGWKT20eXaDMuJa6mTAfaUIjkbtvmyz3Mf7SFT5K87dQ7P
         IQBQgBW8lm3voqwCNjajbUrIexnPd+ossW4J3veE/FsGp20yuJ7nTJkIos4P8WLY/OdJ
         LvFp/kpop6tt4rOsX0/sdv8JA7AaQqvVXifIuPKNsNBXOudAi2Fqf5CH32i6LaWuwgbq
         AUzaCHoX0LhKsXU35yiw3Mc+I58fob2uqPYWOtR5WLLsTVnEZkJHMP8+jOjbdvBQS5x1
         3KRLZV9fvUQf3w8P4jNtwH3DHCOwIoVuHmFV/fK5ZllMmw0tKPh96jCCOKRoS8FyzLLX
         AO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joQIhy/GzFQWarcZLmMYVeu3s/bTVTgd8EMdsvNSyZE=;
        b=OfAVZRZ32FbeGPrVnyaPA+HibJiBaW/t/A/GmiyF7a3vQ/dpV52Ukb6HXxpK9PmGFF
         rLFjPQWceaXwLiqt+fQSTrfhD8b1c5hwQdIyza70YjHmo8UnhDFJ+7RUnaQPu6Pno8+e
         dNshGEwRAk7sbka27hUfTtD47Ui3G7WBhY8iAQBUaoYTHrmNAJaIPY520hXP7KHj4N2r
         sYkH8wPqonAjjx0jPT0RbPRUt52apA3bWaGndlSsfRGDCvW47FUArnnV1ibH2SRNwOpw
         wEjYGK+mtDpTfTLIICPRSX0sgACUYLFXMo6j6lPDlHCUruYK6/jPef74Eq9NeDV00qXe
         6obw==
X-Gm-Message-State: AOAM5310+QC7p9QCM8Un+iAyviycSAlc9VeWWnaCRAhvW78d/GN2JLvo
	SOPdJs4A1QSfqi+I2teUz5Sx1w==
X-Google-Smtp-Source: ABdhPJys4CmGJfpzJ8lge54ZloMeknuVn9tKjHXS4Gjjz3TXlWxzM7S1pgIEp/wH17gfIyu5dyyRvw==
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr10622215wra.179.1616275426521;
        Sat, 20 Mar 2021 14:23:46 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p17sm11308962wmq.47.2021.03.20.14.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:23:46 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 1/4] python3-txdbus: new package
Date: Sat, 20 Mar 2021 22:23:06 +0100
Message-Id: <20210320212309.11310-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210320212309.11310-1-brgl@bgdev.pl>
References: <20210320212309.11310-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a recipe for python3-txdbus: a native Python implementation of the
DBus protocol for Twisted applications.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../recipes-devtools/python/python3-txdbus_1.1.2.bb   | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 45d370c77..c5ebb661c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -411,6 +411,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-twitter \
     python3-twofish \
     python3-txaio \
+    python3-txdbus \
     python3-txws \
     python3-typed-ast \
     python3-typeguard \
diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
new file mode 100644
index 000000000..f521a9a68
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A native Python implementation of the DBus protocol for Twisted applications."
+AUTHOR = "Tom Cocagne"
+HOMEPAGE = "https://pypi.org/project/txdbus/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=32;endline=32;md5=2141358b0bce85fc45216ba91735ad50"
+
+SRC_URI[md5sum] = "d397357dee78750385f92ca9c6c1f063"
+SRC_URI[sha256sum] = "8375a5fb68a12054f0def91af800c821fb2232949337756ed975f88d8ea2bc97"
+
+inherit pypi setuptools3
-- 
2.30.1

