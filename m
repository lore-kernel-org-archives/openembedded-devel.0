Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D14C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 17:06:06 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.13399.1676135164890336737
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 09:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qI0171ln;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id c15so7032812oic.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFEHRJuk4cn9eu8kSmUNdIH03R+1WMOvllya4ZwsYUA=;
        b=qI0171lnzoQuLezBakf02MdT1kHUxDW9Vl8qKyRdxg1KfGwu7bVYZv1IgoC6pLD7R9
         HPzufk9lgoG+x2ISKWt8NVyy3Y+TG1EuqUAvrRRc8v+nl2u5brSPQI7hEr/TAXbUWhuO
         NoFUZR53WPFaG8N05hppsBPFL/yfXwqFDrTb8WFD2MfKHTn3Ax3KR9SKvaJ3E9VZ/ia6
         zQB8gLbmfrKNNxT9mvq+qFmyn2ZURF5FhhDx72s8uqMi4jwx6JXYHlyrn6zIp2Bemf25
         KYHLqQRUG8kPwT8ucmIEgYVEBEZSiEkUqxz+0V+ZcewUpPtaaVQQz085ft/pPtNtcX/K
         M2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFEHRJuk4cn9eu8kSmUNdIH03R+1WMOvllya4ZwsYUA=;
        b=S/KCYKlrDZqg1SJqQ18ItjXRLyJXoP0h+TdiMGfOnoOSDx3HHSzb+yLav/rboV7sfP
         LYoUjUNrfaM2fp7ScS8U59IgJPUN3jZSPgD8LZG7wtWjk3UGLkLHSS8+yPMMSUXYNJc6
         eoDJwk/2DBVFJwWh30LBzvn5YQWhJ5X1yEIeCy97gKYCytGnyB5DzCwN81afrtjrlhtB
         Lk36S5jJuNWbe7oKFrWI+1epSNbrLwEQ0lR17Ti874iep8zfEJa6hK1Bz2xltKx9u8IA
         RVdnEGkoD1LxNyXUdVBlXKgoEUWRVl7SNFPqDExvoQG7aWSHAWCrumBG13VVyJJQ7PaN
         aK7Q==
X-Gm-Message-State: AO0yUKU1qnKYHEpT/mZ4OJIMZMlgwRJPaGCffzNljlksmHP1oXsDQHhc
	2N3D7jt6dxGXzLSqXr+ppVCFwT+iJOU=
X-Google-Smtp-Source: AK7set8dIeqKl74TAoCvywHpeYezwPiY+eOeBe/aoYEGeKWYsWM8jRlegOJF8aTAUY0i1wDca+iiDQ==
X-Received: by 2002:a05:6808:a9c:b0:378:89a7:2f4f with SMTP id q28-20020a0568080a9c00b0037889a72f4fmr8710918oij.3.1676135163911;
        Sat, 11 Feb 2023 09:06:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id p203-20020aca5bd4000000b0037d8670526esm275932oib.52.2023.02.11.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 09:06:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 1/6] python3-django: upgrade 4.1 -> 4.1.3
Date: Sat, 11 Feb 2023 12:05:56 -0500
Message-Id: <20230211170601.3988339-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 17:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101036

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1e4fd5514d2daf4b9b233bed42683aebc78d9fcf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_4.1.bb => python3-django_4.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.bb => python3-django_4.1.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.bb b/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.3.bb
index 44ea5394da..6d800982af 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "032f8a6fc7cf05ccd1214e4a2e21dfcd6a23b9d575c6573cacc8c67828dbe642"
+SRC_URI[sha256sum] = "678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


