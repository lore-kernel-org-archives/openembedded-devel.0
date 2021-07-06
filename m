Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.7384.1625583205020556328
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MX6vj2IR;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so2041492pjo.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=umgiXGwr1kBWghtsofkCEiI6h3yg7bjXEbR+G95fefM=;
        b=MX6vj2IR9lvybPKViNMjWOJKJ1HvXND3TZ3BBwSujWkXyxpE0IeAFk2HI78canQvb4
         ByQhzzKez/1QzoieeNE/ERqzMw3m28D/lqLZKfWRAzwJ/LfO401qg/NHI4c0pYTJJY6r
         V51LBfFeyo+r+3NXmTwdwzAh4Ldf3fpS762jwzy89OySZwDHTPUlCKg8yon1rR7W9IMH
         NeRN9KLB//GJh2jQuAL5nN1Vj9ENwFvzrnmlfi2eHjUMtgX8fuXRgYjJ13KTFk+O3fzD
         xwVaIg+NH3BCO8V6pwy+gDk5H9AzZzVzIEouXaze1EnYzrMmuFv9LikSiIWvx73zM71w
         HRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=umgiXGwr1kBWghtsofkCEiI6h3yg7bjXEbR+G95fefM=;
        b=rvXbY4Wi36NMjFjhx/7chEStyVO6MeRZKXnHX6ivAQ3d3zESMVYtAOv89MjtDI8O6n
         SzhIAPFY8220BzpzGOHq+OHr+hRA9lrIYSHZX5IrGmuNpQzPhMHKCRpbrFV6RkEIs24i
         XS2BlXUTzIXe+E14mk/LCIYsTa8S3NQL4F0DRtB26XOYQ8FvTXed9WSmXSavaald3cOm
         QQyViA3AePbxCXDLBW/XJzOXlRAS4v3s9++7mncWtZn1Vt4B1AHwJON2YILZaTS+rBYK
         Keoyl6KHSOXt74pVfaFjL/r/C+G2S1QZ/oUmTGrBLlRQabt6JXOK4dK8e7cMHosCdPJR
         2JVA==
X-Gm-Message-State: AOAM531tctar4jGNdBfvinBWGEWaJIn5GtjEea7+EXk9i812X1oFUjgl
	JiJeiLKMSkumo2v8t8o9DABkank4VmZsyA==
X-Google-Smtp-Source: ABdhPJyLVjWRJbTzUR07gKTqn0HYVFEBUqAX087B8dkyv3imOqQpGNXyoIDFdX3eYZNlD3Y435h8vQ==
X-Received: by 2002:a17:90a:bd06:: with SMTP id y6mr21209588pjr.6.1625583204489;
        Tue, 06 Jul 2021 07:53:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:24 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/11] python3-django: upgrade 2.2.22 -> 2.2.23
Date: Tue,  6 Jul 2021 07:53:12 -0700
Message-Id: <91fe0bd0984e7a0625126168051c2af9b61f1ae9.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

2.2.23 is a bugfix release:

- Fixed a regression in Django 2.2.21 where saving FileField would raise a
  SuspiciousFileOperation even when a custom upload_to returns a valid
  file path (#32718).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit f07a8c1376fe9f5eb4fc0ddff8ca1a1b3c3f173b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit b2716ef06a76854497de80c642bf7f63b07f7a6c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.22.bb => python3-django_2.2.23.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.22.bb => python3-django_2.2.23.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.22.bb b/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.22.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.23.bb
index a0b8840259..ab4b68fc87 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "dca447b605dcabd924ac7ba17680cf73"
-SRC_URI[sha256sum] = "db2214db1c99017cbd971e58824e6f424375154fe358afc30e976f5b99fc6060"
+SRC_URI[md5sum] = "d72405637143e201b745714e300bb546"
+SRC_URI[sha256sum] = "12cfc045a4ccb2348719aaaa77b17e66a26bff9fc238b4c765a3e825ef92e414"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1

