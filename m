Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.9005.1596906255569888547
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XmynKvql;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id u20so2829566pfn.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eG9yuXgeqVjeovtXGNtB36TYGxJHadVv2EV9ei47AIM=;
        b=XmynKvqlF/WZUj3MNcuMXsAjryQy+9VxyHqk2NTDctFevx6ahxD3FAHDDcktu3iVAC
         h8126ENPr/vjeCiJv5oQyfstZpAJeG1VF4qmKOGaxQXmRrGJtNoZi9TKozMZdU3B+c82
         IiCGMgyAE7bqes4sVqgficp8miVtlgjrjfndBEyt4sVXWoUYO5rqP+3ZoMjzIN9tTASf
         0XcytHYZ1aUqD9Rm2YEfQCSYHVrPCcQB7v+rv9l5ixKGeDZg1wXGsiLKO+nv2dZxWvHD
         WoezXq831obJh0kAPuCE90vEbVeIuTTg1g5/jdXJCaiqZ08zNY4V0LvvTo37yy1JhG8u
         FhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eG9yuXgeqVjeovtXGNtB36TYGxJHadVv2EV9ei47AIM=;
        b=APql6ejnQ3mMEVtQuzSCyzPHUQng5cvzPAxKn/m7KYgmUJOPxsOg/6XYwvO3LyzgAz
         yznXaIKQXvsdMzGtXmoDcC0aK+sjXvNzW80KLman+vUJ47AK6CN3Jeyvc7DM0s+J5F0J
         xTFIMMjAYu3M1b/j7c1zpAbUIGMYuAy+4w4viUijMgZS1bQxm0GbMRS8e9dDK67RAZTK
         3ZaLrJ3D5nT6Vs5dKzqCdc8/m8UvI4q+Wd4nPRRmyUMbDMDrjcQZDCGM5tJ6IKIaVpcp
         hI5WO2Kv8VB5yvzSW8qXt6MZfyFWY6EXjo8XrmPq5GVqDoW1qpvYl4RlOxYsN9Bqnst/
         jGBA==
X-Gm-Message-State: AOAM533p7tSewfx0fQ9+h2Hshb8ZHghqIYArxLJvL9b9iwuN+Z9YdkL7
	0Vtv5eabvzu0EZqKTtDwP0ztDe+6Mek=
X-Google-Smtp-Source: ABdhPJyP0PQxv9EhJUO3eQ9ZP1qQy8E9HF5kVqO+QSwg5cqEDvyksv9j+DWY86riqzwovxnpM4Vhnw==
X-Received: by 2002:a65:4b85:: with SMTP id t5mr15683381pgq.36.1596906254836;
        Sat, 08 Aug 2020 10:04:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 5/9] python3-jedi: add recipe
Date: Sat,  8 Aug 2020 10:04:03 -0700
Message-Id: <20200808170407.2326879-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-jedi_0.17.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
new file mode 100644
index 0000000000..aa5e698740
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "An autocompletion tool for Python that can be used for text editors."
+HOMEPAGE = "https://github.com/davidhalter/jedi"
+AUTHOR = "David Halter <davidhalter88@gmail.com>"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
+
+PYPI_PACKAGE = "jedi"
+
+SRC_URI[md5sum] = "f012668907d76cebe9c4766f3b806fcf"
+SRC_URI[sha256sum] = "86ed7d9b750603e4ba582ea8edc678657fb4007894a12bcf6f4bb97892f31d20"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-parso"
+
+inherit setuptools3 pypi
-- 
2.28.0

