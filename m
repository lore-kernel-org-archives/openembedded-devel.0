Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1275.1591987029308375095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id ec10so4825748qvb.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=t2Ifzr0MpuwfpJwVp9wAywKIDwGbIMOT53EU7sNfifc=;
        b=IVi4jZmKKBmzt5ECx20ooU28Gn17KkFzbX6yspLdKAlIMgKdsYqSpPkZrHUbZTuLKh
         bAicWspC6TEgqwgVxV1iWDr8GfszhEleEQbJb7EyIaMUicTEjMzWGlPq+U0MmeoBeRRC
         S+08TWOGnGYCkGAcArZKxFgtY08B6wtsaXiEGinhX03H2d5nFyz9qQvV8vsnxnkicClF
         kV0o8iTiSvz9/70sH14P/LBaUlfTAXpXJI85EjGkJMLShF8NWd3IQ2IIo0BbimIi505R
         VU7Ezl5Gdt8t/Az8gwOp6dBC/QuaG+hm5o3s7JpurjGfMUVQ6uA+pQjPnAJmyFFicgOS
         62vA==
X-Gm-Message-State: AOAM530uQzBi20ulZUy4JKPH22sE58ncYJCJLEcXbo3GqVB6uKEL0qH0
	g30thlGQzcKrHFbz9tDCRwWi1yCMKHs=
X-Google-Smtp-Source: ABdhPJx3EUCtl/sJgOb5EmND1jeUJPiLTBPvrDgRyPDXge+FTuHIgW5c0Yf8yDsaU1STAPxgiSmDpA==
X-Received: by 2002:ad4:4e14:: with SMTP id dl20mr14341473qvb.101.1591987028141;
        Fri, 12 Jun 2020 11:37:08 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id d140sm5218361qkc.22.2020.06.12.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:07 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 15/22] python3-pathtools3: Add recipe version 0.2.1
Date: Fri, 12 Jun 2020 15:36:00 -0300
Message-Id: <20200612183607.108989-15-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c68dad28f3287d91ed530991929cd896e83da41b)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
2.27.0

