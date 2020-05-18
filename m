Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.43696.1589814040694604503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 08:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=mdJSnUCu;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.195, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f195.google.com with SMTP id 190so10395662qki.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=ZxgpihyUt3HXlo1xq6aj12h+DUjBmqSe4WsFZOZR+zA=;
        b=mdJSnUCuuA7R1aFIx9p16p9AfqaEPKQcsYANiaVJohs1AkVuA1SSbkBDi3GC5wYYfs
         MBEw8X3rXVQwp+STBB6/z4pxE4nsoqubNGmUc+0tcy4nrfoBFG20XtG2is0HksTpi3G1
         vHmGtk62IYPEFQdMvqDEDsRnZwKoUErTllP/845EpdtXgQqvWx1zPBGkglAeDFyGwA5v
         p943khz0bn85wFVXhauKoA1CxPsDjreRxPnVrrxaYxRfUARsPmDgwe5YgEnkwQA/rQKe
         x7tr9/e92Szrt4TvMm+KFCYf+clb2WcP+quloEw1AJGWn2cnNV33P92TBX+y+bKJhSmS
         ScRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZxgpihyUt3HXlo1xq6aj12h+DUjBmqSe4WsFZOZR+zA=;
        b=GxKOnuMeH5mCTpGbZW4eypGuvFWi5Jl+/DLfwlPm0rxqYxyyibRqXK9H1z7/Mmv4pc
         ad24HhBtDtOltcM9x5dEIVs/KxnWrQ0j56VDv1KohZK7qbwnVF12AGW8DasnWgOp9xhI
         Fh4++Kj4Qclm+uegN2EZNFDkwh2+YaFuCPBrJNOp2Am7XJWNzpk08WQCzG9SoVklccJn
         Ex39s9Xly62Mf/M1m9sihLxriRswacbynjLJuvum3xxSkIW7j48w3hGDOJ/+pEDNpuSi
         RH8ED634QLmfBkq7jo1EOvTDcYSG2LLWPs2d2uk/3as7sE0KMDJo6BOiVvVILvHjcuSW
         zI8g==
X-Gm-Message-State: AOAM530qQbrjKlNeYYJKcdeP/gh6VQY6uBLCaEaED3+4LvXYHObIoF92
	lcpqKVNeS2g+ruqQDR8v8UhDq0uqrdc=
X-Google-Smtp-Source: ABdhPJwLhCqq1SKoON8nvjy8hkazUjruhcjkDh3CsV30gq6EOCmvWZAmaT3Y9KflOdSzc4pTRg2ioA==
X-Received: by 2002:a05:620a:1281:: with SMTP id w1mr14760725qki.123.1589814036973;
        Mon, 18 May 2020 08:00:36 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:7449:1d37:9815:91d1])
        by smtp.gmail.com with ESMTPSA id 4sm897562qky.130.2020.05.18.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 08:00:36 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 1/2] python3-pathtools3: Add recipe version 0.2.1
Date: Mon, 18 May 2020 12:00:29 -0300
Message-Id: <20200518150030.27799-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-pathtools3_0.2.1.bb                 | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb b/meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb
new file mode 100644
index 000000000..644f7b119
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Filesystem events monitoring"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=56bd93578433bb99b4fdf7ff481722df"
+
+SRC_URI[sha256sum] = "630c1edc09ef93abea40fc06b10067e5734d8f38cc85867bc61d1a5c9eb7796f"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

