Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.846.1595458578890804083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvdB7/pN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id w17so1685858ply.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 15:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j8EPHWkCIenPZDV9YwEvNEfFLCudlTQ9SIT0mQz+Mj4=;
        b=BvdB7/pNZ9gyL3m6o3AgCoVMiUgs1wNA29e/epMKdHt8wU6i414r9ETkJIbxLmyEH0
         ryEKV5biaUCtpgDRGuG6c+UlmyHh4fO7GEShurALHrJe49eIEWU5EmzauUnw1qCv0q28
         FFsiu6/HPWDWAORZhtYBSz2joUUO51SrZs84ma8KEWtcJ5GkscmsrUoimtlfadBr9CvD
         EKWHvTs1KnyFLztCbYYhnNQUaeuFAEWWJZ5KeS8gNTSN37tcRHfoUDbuKQGox4Po4icG
         EW3L4i7zah1a41Gvo9SqTN9ZynN55SxuIj30FbblUGOhsFPZno2oKMy3uvAfSnQ7Yj5U
         Xrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j8EPHWkCIenPZDV9YwEvNEfFLCudlTQ9SIT0mQz+Mj4=;
        b=eiaVxOeAs0YVYZQIVgYAJLdXPIsCuUJCwt5kRym6BeESLcVuLGpc64RkKLr5C8ar/p
         RrIRHEtDyZmNXqCckDTKbr4PjSf0/BXdBMYKYdbxlk+VkWVwSKcf/7njVehjVk9hFQUs
         DQvKwgHjcnf+z8b2n6NdrgxgIEfRyXUCk7zJ1U3XoEApg/hp6aIE/fSn1G1inq2feStK
         7VhvgF97TLCXFJzMpK6ehH6yKerfYqaQWQh9tff/XZ5dyl/IoxV3LtuO7XLzsOFtKWXu
         y/Rq9BTgosUOaC4Vhuq7cy8Gs+f0KZh1TP8syVtxg9Q6MIvzFAF3KdZEw5EIJDzXM1C5
         nGzQ==
X-Gm-Message-State: AOAM531owZeThq0pjaHr+NjT3o0IBUQHP7Fr/3xn4b9GQQ07wYa0kbq+
	kFqkj4gGjslW0U4AdxVc5faudQ2YCLs=
X-Google-Smtp-Source: ABdhPJz0pu7gB4KizpdUu+g3DDsye5TnX2ZyeprG4y+axi+5p2q30sPMhxAfUCikD6FKxyNjVic6Xg==
X-Received: by 2002:a17:90b:2348:: with SMTP id ms8mr1420138pjb.5.1595458578196;
        Wed, 22 Jul 2020 15:56:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id k64sm637357pfd.132.2020.07.22.15.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:56:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-dateparser: Added recipe
Date: Wed, 22 Jul 2020 15:56:06 -0700
Message-Id: <20200722225608.3968953-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722225608.3968953-1-raj.khem@gmail.com>
References: <20200722225608.3968953-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created python3 recipe for dateparser.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-dateparser_0.7.6.bb        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb b/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
new file mode 100644
index 0000000000..e4683911e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Provides modules to easily parse localized dates in almost any string formats commonly found on web pages"
+HOMEPAGE = "https://github.com/scrapinghub/dateparser"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
+
+SRC_URI[md5sum] = "78b4bf317f9b844631562abad5ce040b"
+SRC_URI[sha256sum] = "e875efd8c57c85c2d02b238239878db59ff1971f5a823457fcc69e493bf6ebfa"
+
+PYPI_PACKAGE = "dateparser"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-dateutil \
+        ${PYTHON_PN}-tzlocal \
+        ${PYTHON_PN}-ruamel-yaml \
+"
+
+# Ommitted ${PYTHON_PN}-convertdate, ${PYTHON_PN}-jdatetime ${PYTHON_PN}-umalqurra
-- 
2.27.0

