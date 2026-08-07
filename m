Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA813C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:10:25 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37223.1786086616092134174
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=COTP7sV/;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3580158b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 00:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786086615; x=1786691415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7ddvqUbZL6k3VzdxEvQymGYVQsULAOyM7GNWDG6BHQ=;
        b=COTP7sV/8p4Us3gvs9gnAmWavRNIuGYFTSSTLnKJbGKdoTps6JkQ4tZ4geJ7WQ6/UC
         62k8WOzbsKpVCedlRVItHZq+HvWB/sSniq+fm9k88/FXoKPuvZiHZd8HgFzGZp/Xa+VE
         TjiBnaXtZ7Mp5kluBXY0fQjTFQF/ek04zJZyEV9411XU/7GjV921fO+c7cWHOYRfe+nd
         oz2IOZZX3Yh9tPDPujDBC/yfjoOoFb+31w/u82E6sjdbNeFZ0e55WFbZ8Yos++b43JXp
         4HGCHa3ePKzAfA1Ft3biFlvO/n9lyvsNarLsjjxV3MRGMqypzeBse5OiEkZjG7Kgslq7
         TQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786086615; x=1786691415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7ddvqUbZL6k3VzdxEvQymGYVQsULAOyM7GNWDG6BHQ=;
        b=KvH/wbOlFY3r3dDSK9jeJPeEtZY18TeBbpzMMmZbo5oGKQMuyiIz8ebA6TpQeeZqtg
         JAV5UWn8k9VzMkrKQA9Fep9JFpOrbFYtoRS8qBnMkM0flO08j8cXjgvFkndn4RZkupr9
         WfNOcVRpgp3iumn0XxLJKF9G1G8Fj7PGWlnuSh8F33WUfzs4WeVEu8v6pQBGfKq1N52N
         Jgokp03kAyUuiVaoEcYYuj7vKk+Mtch1XmNuvkqX89av1mxbXLhtK/AM+XO6IkGGHcLU
         FCwsi0c3bBh8LwEwV+Oc6fHz1EPSzeRfR6H9oU0L/Is3ccJQtESU1dPtMovCK5WjGUBq
         YWWQ==
X-Gm-Message-State: AOJu0YznCE15V3MokqLMA5ZiwwM+bW7As2tPqpGGRtM+FtqNL4hj/Bfw
	mj0WgZyLmYts519Roj/ka5Vm6C+dLyvqg5U5jH4tVKf1Ke5J7Z4rcPuWD8zZyA==
X-Gm-Gg: AR+sD11/Cspyx0pA3YJpmoAnfApRsqebQ5wOSfyCfpjaUmsEez2B3bUzkFHv2dqzVNP
	Le0/2VqSln9fsz1rNt69CyR5A8dzmlFLrb3VPSB6dggq5VLiHf37xkqyWNP++xKSw8tzhBrB3el
	5lQNIMaxZ9H94ilYxWo6DfRmXuALmNPVXnQs+oKQ8KtNTUGEHY+5biVW0+nXzaFRt0KwihR5B9t
	H2S8/1KdZcgDYYo6M4t9ykM4JCYJAu9UFGr8GlC/IznE1lcwwmTVWq2Wz4Y+LHRoKfNkbLmlPJm
	wqhBUpLuQEO32E5HnAU3jc/Cj4oQTaTtmxyu3H24emNKP6UfeKjMxtrerbYSdMeCEsMtAn05ONd
	TKto9vYreE/aGild/0FgMOkLzmQqS/1x8hJf2kjQl+Yo63iWzZw5yY+lMmMKCkmszjltBafrvHF
	3akRAPBkbCfA1H6LPg01jaJ4rTczcvvWPrfG41AdDFcVpyuvek64z6T/w4/NSRYgl9KKCFh08bJ
	Q==
X-Received: by 2002:a05:6a00:3d99:b0:84f:5cd7:e3c6 with SMTP id d2e1a72fcca58-84f5cd7e459mr2071406b3a.5.1786086615396;
        Fri, 07 Aug 2026 00:10:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e99asm520440b3a.33.2026.08.07.00.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:10:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 4/6] nginx: upgrade 1.25.5 -> 1.26.0
Date: Fri,  7 Aug 2026 19:09:49 +1200
Message-ID: <20260807070953.2275518-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
References: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 07:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128861

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Stable branch 1.26.0 is off 1.25.5 and identical
https://github.com/nginx/nginx/compare/release-1.25.5...release-1.26.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nginx/{nginx-1.25.5 => nginx-1.26.0}/CVE-2025-23419.patch   | 0
 .../nginx/{nginx-1.25.5 => nginx-1.26.0}/CVE-2026-28755.patch   | 0
 .../recipes-httpd/nginx/{nginx_1.25.5.bb => nginx_1.26.0.bb}    | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx-1.25.5 => nginx-1.26.0}/CVE-2025-23419.patch (100%)
 rename meta-webserver/recipes-httpd/nginx/{nginx-1.25.5 => nginx-1.26.0}/CVE-2026-28755.patch (100%)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.5.bb => nginx_1.26.0.bb} (77%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2025-23419.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
rename to meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2025-23419.patch
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2026-28755.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch
rename to meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2026-28755.patch
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
similarity index 77%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
index bb2dda0c13..75e05fac6f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
@@ -8,5 +8,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
 SRC_URI:append = " file://CVE-2026-28755.patch"
 
-SRC_URI[sha256sum] = "2fe2294f8af4144e7e842eaea884182a84ee7970e11046ba98194400902bbec0"
+SRC_URI[sha256sum] = "d2e6c8439d6c6db5015d8eaab2470ab52aef85a7bf363182879977e084370497"
 

