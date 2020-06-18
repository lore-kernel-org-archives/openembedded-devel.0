Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.10184.1592494091643189096
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rmgaEZDM;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id b201so2959958pfb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=avkymR7x1OAdRoKxs5BEQ4hJ+rhmLzGJijztaokt7cE=;
        b=rmgaEZDMe+NFmar5z5ODwpIsEw4/ls8/U3cK4VfKIdcNXb+x2ouvtvIphJax5uNHAe
         /Lqkvfl3J/1JKIvY02uQL58RNLM4vN+fOI7M3c3Rxas2elRW5q/lvPAzAb96X20PhQTo
         E907LXJfSCRRYDZuyaJ7DBtHg4XCT3k/5/VUQnp90C/+EhT5Mukmg8ljTrcGAdgdYAGl
         a1KFzM6ROhoyu+UE3ojpWmB66d1sB602r6ziOfS9p7ts5Lq6fTI01a+HX6vvS+kIwxIj
         y6Q8I+pqFlI7uqKRs3FOydVh6WmFlA4rlKEUW8DriHV6cua9RAAvUY/0Cu3j6OXRjQUu
         X5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=avkymR7x1OAdRoKxs5BEQ4hJ+rhmLzGJijztaokt7cE=;
        b=Cgw0zC/4+peOQO+yy1pxEDdiudiYLtfCST/zV3DiNR00x3HPl5I5Fz8+b3Q7yogpMy
         TTh7MXi0bjpNwQwuzu3TAdYcB8M93XMFfjv8hj8zECHHK+qzfIhRWo5zTduQKd1c9QC4
         kyeSxnlDftKQPClHROnHsZhrz6yBNwgkHqosvcmtRQdOPg2q/uNourrArb3yhgI5Z4cN
         zJ6Et0FegmQjsvZja1DCmZTXt6y26pVh4Dpw69m50tVIzToEOdAuTRZb4KJOB4YiyhR+
         9U3D0DXLcgvAm2r88ukn23YSMtuMsKlkyveDDrQQ8+Yd8xGVq6pdYHmMSVkB1zcQ5Oji
         MA7Q==
X-Gm-Message-State: AOAM530dz6wkG0rPi40QSbo+GupGDeo60huMN+YRboOh1G6GhY0QbaBH
	KKAPqLl0w5yHP4jDy0tdi3InneSd
X-Google-Smtp-Source: ABdhPJyJ7LcLmtiVkO2B0taFPgL6jNSf7Ffo3UeRrKEZZoQtOMC6h5PoMQyktco6koe1BEsP4nMH/Q==
X-Received: by 2002:a63:2043:: with SMTP id r3mr3436579pgm.299.1592494091016;
        Thu, 18 Jun 2020 08:28:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:10 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/7] python3-flask-versioned: Add package
Date: Thu, 18 Jun 2020 08:28:01 -0700
Message-Id: <20200618152805.13075-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618152805.13075-1-akuster808@gmail.com>
References: <20200618152805.13075-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-flask-versioned_0.9.4-20101221.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
new file mode 100644
index 0000000000..7aaf439b83
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Add version info to file paths."
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://flaskext/versioned/__init__.py;md5=dcb7d97884bf08c256ff5795766bcd24"
+
+PYPI_PACKAGE = "Flask-Versioned"
+SRC_URI[sha256sum] = "516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34"
+
+inherit pypi setuptools3
-- 
2.17.1

