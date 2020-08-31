Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.57687.1598892703304527748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 09:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bjv2M9Kg;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id g207so899644pfb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k0gRyyHtTC15lSOYMm4aGnhcPrH2gsR82kwc02mTp/k=;
        b=bjv2M9KgK8pVu5tYj4nw+q0AGaojsAHDXA7ZeZF4K850JkhyHu2hjysPPgyJ+ccqqq
         IhavsYmjOnGK83e0UmyuwWhAAfmfVPaU5oNwTet2cgQjV/0upniTsnyYOyaEUW4jP8H1
         lok784Ezd8Qxgs4pbAhLp86WlnT9tacaUvKSuZZCcqFtrp8r+L2WvtLn63u1Im7iZrwh
         cy9lr4gb+fTBHJgGO4EExkHQDobcPO1Xl3TT18NWwrYtk0MHW8inNhW+xXiTgPP7WssM
         vYvj5MJsY5EfQzXnd129QvIQanMwy9yLXHCdcfe84OTa1Iyx8u75WIbYRvVWNz+T9tM2
         NGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k0gRyyHtTC15lSOYMm4aGnhcPrH2gsR82kwc02mTp/k=;
        b=kxGX3E79bCPvIYebIQzyIMuti+DzBoE1PhWiew+ONHylKVzM6KYmwYv/tDnTwLg5S8
         p7SrVPX7CMeONssE/TpP5Y8uGJimK0Ru/R/5jcHAcG4qRUMK2bxwbRRAp6SLL4aK9HcW
         4HB2nee5fld41WtFO+aSQgk2163jSmk5lxfPcSSGRTwLgbFgCSnleuTm9Q3VQwwE2DEE
         KpaEpVjKzHLCCokauRZH8yRx2FNUbuYwE6Yk4LJwBZWHRdwO+OIUgl1ehSXEfLZlZI/S
         ys2RHDg21f7czdOzIcKbhxH/kSCWxdjWEQrOsn4SNtoMtAn5asz/Q5WgX0YcIuo6Yj+z
         a4TA==
X-Gm-Message-State: AOAM531UGT+8v4vAsAJ8Q4h5G9TjnS/H5nqT59rIkdY6nNUE0MKQ2ZgO
	wpQ7EeaxopL8UoETaFvanaZdM6fN9I2Jlw==
X-Google-Smtp-Source: ABdhPJyUx4vmEHWu6H17XGAfLpdqc/nkWRnr8Hmxl1+8SkgPhwCqonORpmPe9D8Rc+QYorWngXHyGw==
X-Received: by 2002:a63:b24b:: with SMTP id t11mr1890518pgo.233.1598892702396;
        Mon, 31 Aug 2020 09:51:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id in12sm115323pjb.29.2020.08.31.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 09:51:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] sharutils: Use update alternatives for uudecode/uuencode
Date: Mon, 31 Aug 2020 09:51:36 -0700
Message-Id: <20200831165136.2817032-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831165136.2817032-1-raj.khem@gmail.com>
References: <20200831165136.2817032-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This can then live with toybox

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 48eb268939..8bbc6815ed 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE="GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-inherit gettext autotools
+inherit gettext autotools update-alternatives
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-build-with-clang.patch \
@@ -25,3 +25,7 @@ do_install_append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+ALTERNATIVE_${PN} = "uudecode uuencode"
+ALTERNATIVE_LINK_NAME[uudecode] = "${bindir}/uudecode"
+ALTERNATIVE_LINK_NAME[uuencode] = "${bindir}/uuencode"
-- 
2.28.0

