Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9157.1596906257399757803
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p3G8qsY1;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id t10so2656401plz.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VveTlptQPiMd4KS2YK1vgx4IOt0mMT9MhrwW0fdjH6Q=;
        b=p3G8qsY1EkgL3TcXycVCMEHQyWdmPFN6N4jQqVORBppCXgmbt9NfWTUNJLhNau8I5e
         25RBrRxF5JA0pX50RVNnRD9OAx2kndYLSIAYMracYB2u8H4R3F9EMxeKk7M64CLx7LrC
         XwuWkrPAa6qCfI0gvWTejAtHxZ1PpFJaNBQVy1ZqcbSfF7L21dGRpGMHUHZsL5cRO+c1
         XxKewwBmYhg5suk+WKmTRrxGyQ1hDPtxqaQuunVjv5aqMfwAJXLD0zymF6erri2jssIG
         W4HhaxF2AM4f5TwOeJidBuzQWLOshG8TxsALsLd6Pj8dDsubL/mjOTqzB+xWQar3m1We
         46oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VveTlptQPiMd4KS2YK1vgx4IOt0mMT9MhrwW0fdjH6Q=;
        b=dL80Vugz6PuRmHu20v6P476MiCgWkg5k9ccYAYyplbtr+teBY9rDi8AFd8qS387d1v
         Dw5O3mN+LRwPDfDapFb35p9vmkhUOewjVo+Qog1BXsG9Cn9Gnadrx6D8C5gFFfOlnmEx
         8ulGYmvueyD/cV4fyS5S2rbCxAvacLSnRLt7Rx0gRKRZrQezWgpVIZUsdKzXfJE598JB
         Hc9UqYMvgT651aQErbGgNmlFaOxOOCpQZeziUaELKnoUkb2+8KOszBs0kWiZSHnWiV4L
         GbOgej9z0Aagy5YssYVcXVV+Cbw7ih5W7vnDu9xMKrcAN8aaRFGAgRAsesycnLJbOdaS
         dcsA==
X-Gm-Message-State: AOAM533cYeTx9SVOZS5mZ/Pw7hQ3cqJYJkL2ZMhoKTeMrNoTuLK+uRQP
	ToW1kzxs5RJWnMIXuilUYwVo8Q2mh2U=
X-Google-Smtp-Source: ABdhPJzSjqUVFtl02Ioc5BJw0vTdp1nGM0Vc1wdUj7pmMHnKM9TZNRFaiObI5FoshLarmaRSY4LbWg==
X-Received: by 2002:a17:90b:4b03:: with SMTP id lx3mr18507009pjb.143.1596906256716;
        Sat, 08 Aug 2020 10:04:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 7/9] python3-backcall: add recipe
Date: Sat,  8 Aug 2020 10:04:05 -0700
Message-Id: <20200808170407.2326879-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-backcall_0.2.0.bb                 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
new file mode 100644
index 0000000000..56b1485342
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Specifications for callback functions passed in to an API"
+HOMEPAGE = "https://github.com/takluyver/backcall"
+AUTHOR = "Thomas Kluyver <thomas@kluyver.me.uk>"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40e56b724d016484a7f790ec826d3ffc"
+
+PYPI_PACKAGE = "backcall"
+
+SRC_URI[md5sum] = "1f4c9a370c78743406296f48e56e8821"
+SRC_URI[sha256sum] = "5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e"
+
+inherit setuptools3 pypi
-- 
2.28.0

