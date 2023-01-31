Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC97C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 05:39:21 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.6020.1675143559290735930
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 21:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bFVfLx/M;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso13349794pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 21:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=coKub+zhHs7WT0PSVzFUUhRY0pRZeZeMnr3A3QXGCjo=;
        b=bFVfLx/MeFygYjYmDyTfu4wDkhe1Ew9hT1pJqnGAkBZI5Sc+FpnSKxmeMoRVx+ft9s
         AW+vbiSBptRWE5Szxm80r/b4FWD+/bzxmtXguFYpy2zrDKKwvZJv9V51w5ibqiHAIJBC
         jLd270+UKgX2+w/BETnEs+aLZ3gEY/gIz0Crg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coKub+zhHs7WT0PSVzFUUhRY0pRZeZeMnr3A3QXGCjo=;
        b=36tSMnMZotkTpqAVaxG1YGvUOlnYld8KJlO6dBjXNazylPkAY83sLmnHkvGa2+TLW+
         DPmWVy8gjwoueZWXpeHkdujtcuDfTXt4A+kvqkUZJAoA5h98/W4cUqSyq3w97BImvqhM
         qajVlkltRJEZvx2x+G+HAp3ZwOpoXoIQFeRN6HTOmpya9HS8UBgAbMdQC2lVwManJuJl
         +qN04wzuFR62D4AakY7zUv6tUyPW5/6hwISW7nDe1isdbSmxJuEI0C3cbtB62tVW0Tl9
         GnHWkLlu8NADNBZEfYPVE/6dV3+4dwn9RSGed8Weu9qvwCGAzU58HSAXI2slkegVFixD
         SUaQ==
X-Gm-Message-State: AFqh2kqBO47OLZ5OguBU09DqdsK4On5Z34TO115im1t8DFU2Mux4zILk
	/LSpXaAFjT4x/cvSCvfk+ksjBUDq24PKRJOL
X-Google-Smtp-Source: AMrXdXuFBSdRwMmPVRhT52f0Pq9qbVOh5lCugkO+uKbIpJ6wiPhcr/7EqutOqNNsNlgXVOKq0hq/Bw==
X-Received: by 2002:a17:902:784d:b0:194:92ab:6e23 with SMTP id e13-20020a170902784d00b0019492ab6e23mr42083830pln.27.1675143558422;
        Mon, 30 Jan 2023 21:39:18 -0800 (PST)
Received: from MVIN00024 ([103.250.136.204])
        by smtp.gmail.com with ESMTPSA id c6-20020a170903234600b001947ba0ac8fsm5421919plh.236.2023.01.30.21.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 21:39:18 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 31 Jan 2023 11:09:13 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][dunfell][PATCH] httpd: CVE-2022-36760 mod_proxy_ajp: Possible request smuggling
Date: Tue, 31 Jan 2023 11:09:11 +0530
Message-Id: <20230131053911.92124-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 05:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100870

Upstream-Status: Backport from https://github.com/apache/httpd/commit/d93e61e3e9622bacff746772cb9c97fdcaed8baf

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../apache2/apache2/CVE-2022-36760.patch      | 37 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.54.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-36760.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-36760.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-36760.patch
new file mode 100644
index 0000000000..afa6e398cf
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-36760.patch
@@ -0,0 +1,37 @@
+From d93e61e3e9622bacff746772cb9c97fdcaed8baf Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Tue, 10 Jan 2023 13:20:55 +0000
+Subject: [PATCH] CVE-2022-36760
+
+SECURITY: CVE-2022-36760 (cve.mitre.org)
+
+Ensure connection closure for an invalid Transfer-Encoding header,
+to prevent HTTP request smuggling attack with an AJP proxy.
+
+cleanup on error
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1906542 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream-Status: Backport [https://github.com/apache/httpd/commit/d93e61e3e9622bacff746772cb9c97fdcaed8baf]
+CVE: CVE-2022-36760
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ modules/proxy/mod_proxy_ajp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/modules/proxy/mod_proxy_ajp.c b/modules/proxy/mod_proxy_ajp.c
+index 226ad9b..1449aca 100644
+--- a/modules/proxy/mod_proxy_ajp.c
++++ b/modules/proxy/mod_proxy_ajp.c
+@@ -257,6 +257,8 @@ static int ap_proxy_ajp_request(apr_pool_t *p, request_rec *r,
+             ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, r, APLOGNO(10396)
+                           "%s Transfer-Encoding is not supported",
+                           tenc);
++            /* We had a failure: Close connection to backend */
++            conn->close = 1;
+             return HTTP_INTERNAL_SERVER_ERROR;
+         }
+     } else {
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index 2fdf926292..2bda18d2d2 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
+           file://CVE-2022-36760.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.25.1


