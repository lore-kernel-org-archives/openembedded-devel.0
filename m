Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.9006.1596906256414903589
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gq9e459Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 2so2496940pjx.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iJt2nz1BwT0uJiyIsKmyUAPneWHIxXtT3lIdnvNePyw=;
        b=gq9e459QG7e3cecsWkzIa5RHeSebf7pBfvRJuyaHz/mhvrlIAQP73GAlQAsmYFZ57e
         +aZxr+XmWjlWRiMV8uRBXBCf6oRNv+CQg55uYcVRAq+C+ET8UQAiJZHvvHcbdTG94xjQ
         baDYw7Z0KNGm3FtvaC/as3EaKpBse3Fjmp5LYld7muzQrb2piWVN/cOUV4Wdq1kSf5EM
         kf5EOrA4N+/R2a7p8cXjWn+M2Z8mAd/FVX8C/2+3sNyIpmEHjAo1Cp/eVDwSf1V5oeaE
         YXDPNYpYtg0Y47f/VB2z5bIfMJGZeciwcfndKtkm5dzUSNctNxY00PCNckaRsc8g2Yya
         DqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJt2nz1BwT0uJiyIsKmyUAPneWHIxXtT3lIdnvNePyw=;
        b=cim0d6k33Iwk+LjKYwWtwHhXzFylkk/IQ3s1uORuvn8Gg86Gk8DO9wbk9CwEMg5ZQl
         SwJ6m2gn9td6MHqGtq+D9Kc/3EXn9EKnWlvL5K5148tbHD2dUtBaGoqruOC+LFqTPh3m
         dMJbJkrvi2Uso5vk910VpoOIX4vvAROEYs1bJMwgz79haUi/emWG7emviUeNcEGTvycR
         HzXInLGw7byYurht6WFIpsFQIArTJCK2YgLDQTQQH9dlt+p64VxswUsAnCQQbnpFcmNA
         sMCx8WDYBC6Zt9jSb3LPcH6yME7jf8El4FKRVFOoyGZDn+0PAX3hHL6zZYFXEh971r0b
         b21A==
X-Gm-Message-State: AOAM531AwSXvg1jdPZdAGQNw+OYcLUXQYU0ykJze7u7hAYtZAMac8yQF
	Q1R4/4krEQWuwA3WHQjsm/GnTn0yUzw=
X-Google-Smtp-Source: ABdhPJyKr3ahW/3Yi4HCNQ5npnrajg80UO4H4F1RIRYhM8OHcWJjSufeIanMKe8vf8uJkLcyDnc+Pg==
X-Received: by 2002:a17:90a:9502:: with SMTP id t2mr17334474pjo.205.1596906255702;
        Sat, 08 Aug 2020 10:04:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 6/9] python3-pickleshare: add recipe
Date: Sat,  8 Aug 2020 10:04:04 -0700
Message-Id: <20200808170407.2326879-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pickleshare_0.7.5.bb              | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
new file mode 100644
index 0000000000..9d67e4f338
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Tiny 'shelve'-like database with concurrency support"
+HOMEPAGE = "https://github.com/pickleshare/pickleshare"
+AUTHOR = "Ville Vainio <vivainio@gmail.com>"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=905c08218089ffebea3a64c82fc4d7d0"
+
+PYPI_PACKAGE = "pickleshare"
+
+SRC_URI[md5sum] = "44ab782615894a812ab96669a122a634"
+SRC_URI[sha256sum] = "87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca"
+
+inherit setuptools3 pypi
-- 
2.28.0

