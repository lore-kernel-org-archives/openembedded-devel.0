Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.34592.1611569666545531938
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 02:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NTpVg8tt;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id j18so10073743wmi.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 02:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ds1cT/azQhbXC7GVYbp5j7J0jvA8OYHjnXtDA2fEgnk=;
        b=NTpVg8ttFRRwOTs33rNsK60id6gYVKQUljw03xn++qBAM9+Nbz91QNC6HiF0j2gMTH
         3DXfRCYWGoFxJnmypCxs/dKCm7SANZXKLHeJZMTmKB+sGXAZmq+KVSNejkOuwHjHlrYq
         hnnwMBESSHp4frKRrfvQ/XF77+GXs+5+adIgyr9YGcLfXuwxf0ZNECARXCf8S0TGTnA0
         nBhkqjIXC5eJUIfhEE32uVfWsgIREiPfIACWk1atAjnNmXK5+Wn1rlqVlWMPtLSJ6iPY
         /Rp8Evh9cRGm+MKn4pNybVbBD6vefHArQ45AA8/GiC7ecCUt0mzWzpXRIMpfIqBULOlu
         aRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ds1cT/azQhbXC7GVYbp5j7J0jvA8OYHjnXtDA2fEgnk=;
        b=IUPrFzorsCx4fGtQguZ4BFTbWWrCDyscjmspHwj+zhK6hM1ARIkFLdocKfhJmW3SeN
         gRpz20vPEYz/d7os8SeYP0JWg7DGA69ADGtZjWdsE1U6qd0YT2JwhAUQ7G3644h8GonU
         UyEi1sYb2jDM02Kf4kQUN8QN3emTILO+Jwd1CY0UQbw7W2zIKY7KIRYfFIEQqtY5kQFh
         THOdh+Deiybhlkn2KYFqU4tHt8DYLo+Zg0vjY2oklJri8SqQcJVqV7dgc2BMh/RR42xv
         xnI9z+FE4mTVyNZ0toVvrWjZ7NQDjBom/3ypcwt/JL+OZp0LqvyM6GgJUVTKhYd7t0+1
         wBgQ==
X-Gm-Message-State: AOAM531sB1wUH8iu+t14yX4MuVRu4NKJ0gODXDIVKvHEwtMI7esotJn4
	O2Blg7+CflbJgd6TcAB4k5OeMOhbaUI=
X-Google-Smtp-Source: ABdhPJyEvJWEFBAshGHo7Fm5stRNw1RD5icGKmxT3aKhsS1rGioRiB9BaLwEjbdwCmvwf3wuHjVFvw==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr1247424wmk.183.1611569664815;
        Mon, 25 Jan 2021 02:14:24 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id s4sm21990183wrt.85.2021.01.25.02.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 02:14:23 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [oe][meta-networking][PATCH 1/3] libnftnl: upgrade 1.1.8 -> 1.1.9
Date: Mon, 25 Jan 2021 11:14:10 +0100
Message-Id: <20210125101412.265244-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../libnftnl/{libnftnl_1.1.8.bb => libnftnl_1.1.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.8.bb => libnftnl_1.1.9.bb} (88%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.8.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.9.bb
similarity index 88%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.8.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.9.bb
index f1fd61be7..5532af8d9 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.8.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.9.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "b2cd6d28fab02934c4ddff0699718d74272eccd3"
+SRCREV = "c3fdda6ac8675aea9b35772458544f03157be415"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-- 
2.26.2

