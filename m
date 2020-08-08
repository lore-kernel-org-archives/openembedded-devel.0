Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.8974.1596906253725267333
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WohmunMr;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id v15so2524708pgh.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69w8HTigqJUZCVcRylk1YppFFi5gjI1PG6K6Es4sUB0=;
        b=WohmunMryfeAwXd/VryQesup1vuRl6jl6xECjRkFMR2AcI6GLquhC/0qSfQ2XWQRvg
         xsg4bf9cLNHUx5/BQUyXBSGrbKAeQ0YX2ZT/YRizek9kByxf1ZjJNrZr9udvEqV1dvqR
         ceIbxutvjh8keX18pEYZlGKwEiyXSX5RI66VrvxL4RvWTUti4uUkn69dZx6vB4asxDnN
         fGkGr/ZpNex2CWWKESgXiKA0WDHl7eiEqX9G4yVrwWEvnLSdp51FK6wcjZuI3vYW1sML
         SlZRRdWXM5yN2Iimk02kAxfT88uJB9oP7Re+PmQmdjgB8Qeuc9lOhw7dDqxsUBeKQPf/
         AGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69w8HTigqJUZCVcRylk1YppFFi5gjI1PG6K6Es4sUB0=;
        b=YN/TKxrZ4eSxfKud7P1FV/Tbu3lpqsEosSK/vxsVVb05mv9O9pAMLdyUBTbD+TJBsy
         bGW81B7GgeZBITtrHhYaI/xvJyAIAvXqmc9Un+YlbcEDzKmEwidD8V3+SVuCP/Wy0gbi
         t+/gX38kvZbxL8Kjm2kk9GlwWujn6VAGZ8X0T6QYX2MgHbDgx/zMR/6CodRjvA1ozh6z
         6bvf0nAGAmuITmNMc0p6bkq4E2llipWJYM04b3qIDtpQE1AghNqiVXLqYyJPPOCh7ZeC
         sPhhuml6OSMk0sntbSPlW3kAvnpsGuno+NhG0BFFnA9VHJltlcNr7w+mC8PTRfsncewX
         h3sQ==
X-Gm-Message-State: AOAM533EJFyyAfEE9s1cJitnrxRsyFxQtFyj8cIjsaNnFXknf3K2b8F1
	Obsf+X9osomQxE2VG9xcms4cYXHB76g=
X-Google-Smtp-Source: ABdhPJwiUnG84kOrWpxdxMvBj8g1LMA4eDH/CKMtqCyJlf1F1wSKl+l4x/1cRvN93xZ9AZzLCykujA==
X-Received: by 2002:a63:4c57:: with SMTP id m23mr15540312pgl.77.1596906252932;
        Sat, 08 Aug 2020 10:04:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 3/9] python3-traitlets: add recipe
Date: Sat,  8 Aug 2020 10:04:01 -0700
Message-Id: <20200808170407.2326879-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-traitlets_4.3.3.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
new file mode 100644
index 0000000000..edfb3abfaf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Traitlets Python config system"
+HOMEPAGE = "http://ipython.org"
+AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
+
+PYPI_PACKAGE = "traitlets"
+
+SRC_URI[md5sum] = "3a4f263af65d3d79f1c279f0247077ef"
+SRC_URI[sha256sum] = "d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-ipython-genutils \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-decorator \
+"
+
+inherit setuptools3 pypi
-- 
2.28.0

