Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.9004.1596906252723982731
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dFrjJd85;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id c6so2505463pje.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y49T2t/v9E/9HVzywlUX/L2LRvfcQT08508sK7UemTM=;
        b=dFrjJd85lxkrS9fuHLeBXPnPFkNo/eSWH9imERpGKEXb8TSpdDq5PGVcX8/czKQhWY
         vV2C+RG7ULIK5k3N2OW9t99tKOxfZRwl1EDTB7P9+pwv8/yapZbded9d7dJIZZhbXkBB
         4pVWmLaze2IYZG5RdIg+tZiZa6yyaJCiprVDaO5QT7cFaP+4puFwGSIDah3PFfyTEVp1
         2zFcr3TV1dgyM9YczU/6BY9kZDrjoP36ySnnhO+Bkh37Q3lhTDXc++DH0SrfsiX1i3UQ
         4rK7wPIqYbMx67EYrD+oh7b0K1AMltOqrjJFkpjJZDR/Wy2gEyaIKhh2uNWW/Cy3fgtz
         FwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y49T2t/v9E/9HVzywlUX/L2LRvfcQT08508sK7UemTM=;
        b=KxSHGAU4sH8+qixmNfMLv1+FrpTJyy3zPWZGval4yu54Hha+dELbBultJDal9rd0jc
         C9RtgYQ4mqfbHwJ94YaFt1D9xYzUW5vLkMu+vpLSyk5BWVlsJowSFyIszAa10aK5kKwz
         X87CSbrZPzQOBoxls790CFiRdmc1XB+qbrp7Kcq7INX5noZSR8NydMF2jJ5lJcux67fw
         SEMqJ8GXBrVet7YeqXg+3ec6ZjT9Xdp1YI7/BnmxFByWgbm+eM1r2G2MOP/hpMi5EagO
         vFzKu/okesOKRMEER+7tht2IPaYC5Zko3Ruma8PNPePI6uryA6mapxvJWn7bIpDMYEH4
         2UVA==
X-Gm-Message-State: AOAM531oqB+36sZ4JJtz7anVF6pctiSaNqnhKE/ESAPXdKoMduRs7mjT
	yiNzXtS09FgY8S4NnmnN0hqz3tBmy2g=
X-Google-Smtp-Source: ABdhPJy4SV9nPDYUnkD7vaaMD0qIDck1ZrhbZOwA6oYpZbFdaklqy5hHm1e+skbZvmuYTXK4sRm/rg==
X-Received: by 2002:a17:90a:d195:: with SMTP id fu21mr18834470pjb.100.1596906251983;
        Sat, 08 Aug 2020 10:04:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 2/9] python3-jdatetime: Added recipe
Date: Sat,  8 Aug 2020 10:04:00 -0700
Message-Id: <20200808170407.2326879-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created python3 recipe for jdatetime.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-jdatetime_3.6.2.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
new file mode 100644
index 0000000000..43f6e18493
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Jalali implementation of Python's datetime module"
+HOMEPAGE = "https://github.com/slashmili/python-jalali"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fc0a323542d2fbe0ad822fa0b1a0a96f"
+
+SRC_URI[md5sum] = "3c9ee1bc7de48ff4d9c773046b2eb081"
+SRC_URI[sha256sum] = "a589e35f0dab89283c1a3de9d70ed6cf657932aaed8e8ce1b0e5801aaab1da67"
+
+PYPI_PACKAGE = "jdatetime"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-modules \
+"
+
-- 
2.28.0

