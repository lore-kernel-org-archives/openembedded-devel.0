Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.9882.1613844200038729261
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 10:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BntYbV/T;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id u143so3996817pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 10:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JZisbm42A/1GlKkkHecPiCqAFwbTtsYa4EiGC99KAZg=;
        b=BntYbV/TKbHFQY8SQPmIKQwXqvFwaQCLFBA8HSlcYJHzG4W9m50hiwVOGfgTCOdPhD
         iFZFN684SSpE/IYAkhwitOAo3COsynsDqGN18CB0Y+HA2i1FDWJrVTRgdZy9KeXE+P2g
         jlnE4V2ZvxKIZmWiyfppIXfYNsXbCr76hQ+JliwCogflZTK/a+7hhsXwWmXpfRH509qN
         8fh9SkTHNqjSXDXtd1sM7U6//u751Ci15Eh/C/s89Wr1MJeOfOUTGeWNp5oH60VZzRAE
         UjJXo9k8LSmeJNSkwnE4LSTHDeeBeXANbU+jJvnmqABjADC9A9m/+dlT5l8RpwXMKDQA
         QA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JZisbm42A/1GlKkkHecPiCqAFwbTtsYa4EiGC99KAZg=;
        b=t+04L7itZGrb+0V/Hc8Ql299669iCKP7weAULQs2ybh058c7p9kyqrwtVGErUEAAab
         ZpqNCVi4+mAeSL6VfbspDkd+zsq73ocrV8P5qKV8pxbZFXoXuXr0AI2QehFZiGrWFD6Z
         3cnDY11Da1SK7O/+78gGTlui8qdV5eUfXxm9ws3xN3R4Ui7OKL0D3hTqwr3Uxrfn0lLY
         aOkffqv4emkHooXnm7L6tHivYipEptARKYvoCxzLZ2WupTgTDg1rowG5SCbXLkKaRp4j
         q89CY8Wvph4k7VOfnBrZrxCVOjoE6gTn5ayZQ03uqBJiYSEuhXhiKOc6j7ei/A8JPD6U
         hy2w==
X-Gm-Message-State: AOAM531Zy4XDvEMJn5yY21dHBQVRc5hXP3IudShaXLMlDHhl3TgsS0nV
	Kf9RwWZGXWqgujL2+vTqB6+ERpVXVu4ClA==
X-Google-Smtp-Source: ABdhPJypKLQqMGvvQeTRhJrbNqOrj7z6Odh5KQ4eJGIEKkRohtfxAUahaTSoGMGvCPjMkC9Fz3G8AQ==
X-Received: by 2002:aa7:8499:0:b029:1ec:e88e:1d51 with SMTP id u25-20020aa784990000b02901ece88e1d51mr14677187pfn.12.1613844199444;
        Sat, 20 Feb 2021 10:03:19 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:70a2:885b:8c45:14d6])
        by smtp.gmail.com with ESMTPSA id c17sm12106267pjq.17.2021.02.20.10.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 10:03:19 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 3/5] libplist: Inherit python3targetconfig
Date: Sat, 20 Feb 2021 10:03:14 -0800
Message-Id: <20210220180316.17789-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210220180316.17789-1-akuster808@gmail.com>
References: <20210220180316.17789-1-akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Fixes

configure: error:
  Could not link test program to Python. Maybe the main Python library has been
  installed in some non-standard library path. If so, pass it to configure,
  via the LIBS environment variable.
  Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit be7d2286bfe80835e8e014114aaf587e2930c683)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit a0c26ca2b4c5e18a22b8d6f3c952fb00caf2bd34)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
index 36659e752d..a990deb91f 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "libxml2 glib-2.0 swig python3"
 
-inherit autotools pkgconfig python3native
+inherit autotools pkgconfig python3native python3targetconfig
 
 SRCREV = "3df02d4d0e9008771e8622fdc10de8333b3f0d85"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https \
-- 
2.17.1

