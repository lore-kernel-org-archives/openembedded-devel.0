Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.3261.1596226733935137236
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 13:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNuTUNV0;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id q17so17923266pls.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1qq6NWTerjGlPnJZna8TDfJuE4wrtlr+Jk44DvYC9r4=;
        b=WNuTUNV088Ya86xGlM5sF1tx58x9v5kNRO24W006q9Ta8RJFGtZ2IU/ggTflUzUx6w
         fdxd9L66+vJLYMUYrYD8qYuopmXIzUCPi+R82EeWF95vpehTKZfDrAhFUoIzCXwknZB+
         qK7rk4sH5w8955i03WRNzAWsNLEJWteIrRmfMzAg2AFidhlifIGMzcWARjKXWbxmiv7e
         OX40zIrjfXi1lgs57b+KVvfIY0zW8ek6koB7+HdDxJNj7ir1mVTIrupq6U/idizgK2c7
         SJN+ji9Lvv+PWK1grw7BH1AZwbADhxfMnOzKKD4WBzwa8NA/CnVnWH+jMlRr3CUrvI7I
         xWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1qq6NWTerjGlPnJZna8TDfJuE4wrtlr+Jk44DvYC9r4=;
        b=GMKxBMO6Wa9SL0hdZrLZQpP7rlkLH1y6W5YOP5oOlKTYPwqeJlA1dBudFURXZrT3bN
         OqD3rSo+ysRlqI1fIu0FUnSlkXJmZEa+6robvuVO9+7Jhjp0Ix8mcOsW0CpPbKkGigT+
         YnQXlLi6vO1ivICFsOYMVbPLrM/m3El8i32dsgYP6oiDxR6PHcjM9sHzjv0hrm1CP6Zw
         PaJ4d+KrrF/fYftuqPchfqgWwWk9anBCJqaZpn+8rfEMAIDfOXhxQuJmlFp3wTdWso8h
         rSt33K7kyPLUi2+2bYnFHeKzbCetWEkjo+Z7L/e8GyAe8/b9QcKQcJkK8o8VSZP2Ay90
         mP7Q==
X-Gm-Message-State: AOAM530+sHr07ugvw4bHlCRSHCDkHiNZanwwF3R6UeeQK6N2+B0U5/L+
	ArEsSUo8OVpvA1pnsVnnk1W2/FGxwqM=
X-Google-Smtp-Source: ABdhPJxqVOpQ6XC1/Q9V7T6XB5rcmwzWpLelvlHJ8OjjbChD+IrqNWptKiunIapGK0a2LAJG7Vuq9A==
X-Received: by 2002:a17:90a:ff16:: with SMTP id ce22mr5779501pjb.160.1596226733113;
        Fri, 31 Jul 2020 13:18:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id s8sm10973727pfc.122.2020.07.31.13.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:18:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-jdatetime: Added recipe
Date: Fri, 31 Jul 2020 13:18:47 -0700
Message-Id: <20200731201848.484776-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731201848.484776-1-raj.khem@gmail.com>
References: <20200731201848.484776-1-raj.khem@gmail.com>
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
index 0000000000..23017c2211
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Jalali implementation of Python's datetime module"
+HOMEPAGE = "https://github.com/slashmili/python-jalali"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
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

