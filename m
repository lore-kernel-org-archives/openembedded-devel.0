Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.43414.1589813410680788498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UXuKtXiA;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id n15so5226177pjt.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=N3FT7hrxuC3i/jtJpa+Kai/i9dv1fGGHS5BBc1jq8lk=;
        b=UXuKtXiAwM4GXxAkcZcY+woWh4fUeThzyEQzTr0Ltgn496RYoTRxGrpN8Aa3zg+OpA
         KcwDypHB9ifpnqd8rZqamnWLewfc/oh4kSSURYUwJDMHKwch0vYuHyVLJHNSXySStMs0
         OiCRotzEbOjSLDgEoLt0DJIRWbeq2aJ+ZueAncbQznf5bY3EX+UURuPqFdA9N5cdrSPE
         tZy7oEknkPZobeuVXKQYU5POAHx409ghHjOzvczvc9trxljUpUEHFlklBFgVQRN9wBFH
         yszGpl04mxTh+lRulF6WLXgZJj75Wzko3RZrK3Lg4g5SzQ6xrxor5pUgogH9hyknyLlI
         THeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=N3FT7hrxuC3i/jtJpa+Kai/i9dv1fGGHS5BBc1jq8lk=;
        b=eFIpBhw3qONNoPi+AKnYE7ui4XNwu+B4ROe9ZgLr6NqGAGF/Y+aW5un4JELOBaFPpP
         W4MWdQlzui6MDvRx1zaivMEkFiYMwguK6mqyWFAS+mbiHogaw0q9Y3Bz1VmtGp2Ey9ui
         UmJm09sMEwHlRUOVw/CplC90J6ZQ3vlQh4GM4ygqcJGsf1lh3v4zbS+9/4EvhimHP/2u
         JVSGASKrfRl6KiTm114FWE18osYtMMhq6yGPDMO65b9pFectZmK9sf6MYuhk3j6ZlePq
         Ci8+fG11z2pIIA37t79wjm9LmOikgDSkAF/+ZF/5EqEfBMWYDDNT/BfudrVEJFb800uT
         FiCw==
X-Gm-Message-State: AOAM531dP+kW0JIAwFaSbEz5F5y3LPU9oIfidsUKzBUUJ7JY5Ppfsedr
	5Ju0Rq2cgqa2RlyyToT2wPFiQxg3
X-Google-Smtp-Source: ABdhPJw5H/Y8euPuhyc0Txnx3OqL6O9WZabBkQYLt+xr1e8AaxSsJdT3g+boY6L8SpZkHTYg+XaIVg==
X-Received: by 2002:a17:90a:c253:: with SMTP id d19mr20768147pjx.210.1589813410090;
        Mon, 18 May 2020 07:50:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:09 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/57] nginx: remove /var/log/nginx when do_install
Date: Mon, 18 May 2020 07:49:08 -0700
Message-Id: <775ad5a08ec9fa80c6e731d69ca45c22c6664d9e.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

Remove directory /var/log/nginx when do_install because it is created by
volatiles file.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6e9f393605eed1e5f4e317536b1463b83b978bad)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 2824c66529..de080a2b01 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -90,7 +90,7 @@ do_install () {
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /run/${BPN} - - - -" \
             > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
-        echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+        echo "d ${localstatedir}/log/${BPN} 0755 root root -" \
             >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
     install -d ${D}${sysconfdir}/${BPN}
@@ -139,6 +139,8 @@ do_install () {
             -e 's,@BASE_BINDIR@,${base_bindir},g' \
             ${D}${systemd_unitdir}/system/nginx.service
     fi
+
+    rm -rf ${D}${localstatedir}/log/
 }
 
 pkg_postinst_${PN} () {
-- 
2.17.1

