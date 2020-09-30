Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.68.1601487118811804365
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 10:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kh5BiFxO;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id q13so4004800ejo.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 10:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JjZvd/MR5iJ2Aob+ujm/9vO5tolKiQLTk7d3990ekBU=;
        b=Kh5BiFxObZMcLDkndDF5daPzyK47d5vmXCglp7xPQcD2vbj/eXxoOseCOSqix4eulN
         k44faZ3XjjdP+CD0P0LtBWMk2BRhP1rUjgaqgKQGY1+piCqbXWpdMg+uFH5KvVy8KzWn
         FH+UHlprWpW4JVyS1f4fJodeZP663URGjvmY0+9wXAJaFiHm2AZ/8Pr+Tg0YejHqHp2f
         p+MjnQhmsHcqqTFMepMJ35AO6aej9VnJjSyNjS8Ki9j/8OoZsLI6F3Pa01TJLYPSiVK3
         RjU1InMGKTVuvuwzhZs7ljMHJZ2YRQiHWLQ6ZATjeFgow/tbYg9VCvexWTtDi+fwVR78
         R26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JjZvd/MR5iJ2Aob+ujm/9vO5tolKiQLTk7d3990ekBU=;
        b=sCLTaLOlpiluXY38AdgHGOFUXGNgEHGNUhdfVxXCP2aisJbnoyG0EBVjiRLk6UZ9sU
         KiqNbyyPAU/xaKF6g88JvScYW6aLZzNnodV821ltkTtdJYOC/Mdkn6YCDZvJC09sp0e+
         vxsy7aCHaGnruTR6IVTjfQBs2sUPiW+XygQHDhlELOlwdZke3ADpXPheuPpHK7E6/FYe
         J7OUJp/eI3sZQZx6C/NfmmKrzRmXixhK4UjWJvauSh/R993/jAZ3+93ZvnvrYQ4KvIR7
         Ze9aHbEBy9n6znCm7HmNh8rl2HHwOyDgazD+sqX0qmlOzMjZL3kWdrT6TFCzqOVPhEXZ
         SQ/A==
X-Gm-Message-State: AOAM532lULkxfr9CAUB9a3ntuf9H1+wpIxg8towCcwcfXUi+fOisvMMG
	puJ9WB1D/g76aVFwdszKw2LQ6OoKL9xZ4w==
X-Google-Smtp-Source: ABdhPJy1gd2Ekwd5Yl/yfnr+SqBWLKe5fP44b1j9dxXv2TN9rGqt4PLKAbk4DzSFakwG0UKE5XeIVA==
X-Received: by 2002:a17:906:692:: with SMTP id u18mr3850027ejb.43.1601487116858;
        Wed, 30 Sep 2020 10:31:56 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id va25sm1713261ejb.72.2020.09.30.10.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 10:31:56 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: [oe] [meta-python][PATCH v2] python3-pybind11: extend to native and nativesdk
Date: Wed, 30 Sep 2020 17:31:39 +0000
Message-Id: <20200930173139.23303-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930142720.15556-1-andrey.zhizhikin@leica-geosystems.com>
References: <20200930142720.15556-1-andrey.zhizhikin@leica-geosystems.com>

Extend this recipe with native and nativesdk classes to be able to
provide a package in SDK and run on the build system.

Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index 9674ec093..5d57590a1 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -32,3 +32,5 @@ do_install() {
 	distutils3_do_install
 	cmake_do_install
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

