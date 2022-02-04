Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92DFC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:27:44 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.12147.1643995664450909705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dKmCrslc;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 o16-20020a17090aac1000b001b62f629953so13702462pjq.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LC6ub9UY+kCbfGfgnj3hcIOv3zo1LavgAOxFEl1v1CI=;
        b=dKmCrslcJGannCXqihmyWrn9Hk5hwORmfvDnBRWy+ttuO7A1tD+d2K6xmgMQqcBvFv
         2/+1kOtZaGbiWgl8BI0O4hvQ7A6TOaKRdJnu1/V1t9mg3J/byX/bcftAVqXh+glgd2di
         ZLbxVlmHl/V1e60lFtZNY+9MiCljmbj3AoehamFWb08dqiEhNoY2l7ITPRM/6ccXsMz2
         ZVkN8aP5yUOZqP3g5hHm0jbkEACJtR6e7vy/TizFQ0nBw7Wnz7XyAtVyjiBaCMBQl/Xx
         hzycbmrK1yRgzgJw3BnFpx5wE/9jG9tAPwppAcnc9S+sGVJ75HnAJd7/u2eyTNWbDHEf
         iaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LC6ub9UY+kCbfGfgnj3hcIOv3zo1LavgAOxFEl1v1CI=;
        b=rtWqjNDYicHs1pSrSpfvXD+eCubWe9NOQP+layRqYQAoCR+qs6ILhBHUI7Ww4A9tk/
         Y1m878CAH0sEFBWjyIJUfF2GJvxzDC30N9nyR6YgBv8TIxSy1QvEWNJHh9LP0RCHDleK
         rHl9o1JZq9FRsfFOH0lZjgwio7nLjndJ1RVHIbNyfvIEJq4wTL/rjqtzQr8LoaDYiffG
         ixX9JACZivHC3+BlpajwF7rAwE8Lb0HnfHSQxcV1wjqaF1wZ6Y8ROygRKwp1Wm0k4jIY
         mHxTSPtWTppzqJtcKwQAaeghCPklbUWbBdLJoyWeO/qSy8d1AzBSIJJrDnpyyxSI013z
         jtfQ==
X-Gm-Message-State: AOAM532FMijYInFJtCgS45aqEaat1Bldiw0857QamtXnK1L7proDvOUL
	rGN6qBF6eC5PW4vVamTUwE7PNPHXBWcEMQ==
X-Google-Smtp-Source: 
 ABdhPJx7czh0u3a7MuZ0zEpC3OJMnbcpp1hcWUPVwonXqwxYUJ8tj80Dv3BY7rYEk8CggdNQQzWapw==
X-Received: by 2002:a17:903:2309:: with SMTP id
 d9mr3969468plh.149.1643995663676;
        Fri, 04 Feb 2022 09:27:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 rm11sm2257954pjb.21.2022.02.04.09.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:27:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] crda: Fix buffer overflow in sscanf
Date: Fri,  4 Feb 2022 09:27:39 -0800
Message-Id: <20220204172739.4009892-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204172739.4009892-1-raj.khem@gmail.com>
References: <20220204172739.4009892-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Feb 2022 17:27:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95225

Fixes build with clang14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Make-alpha2-to-be-3-characters-long.patch | 31 +++++++++++++++++++
 .../recipes-connectivity/crda/crda_3.18.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch

diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
new file mode 100644
index 0000000000..f1d2cbc5a3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
@@ -0,0 +1,31 @@
+From 078e962d345fd0536fe7ba797485ee1a4159c032 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Feb 2022 09:18:30 -0800
+Subject: [PATCH] Make alpha2 to be 3 characters long
+
+Fixes buffer overflow
+reglib.c:969:9: error: 'sscanf' may overflow; destination buffer in argument 3 has size 2, but the corresponding specifier may require size 3 [-Werror,-Wfortify-source]
+                      alpha2,
+                      ^
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ reglib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/reglib.c b/reglib.c
+index e00e9b8..8565a0b 100644
+--- a/reglib.c
++++ b/reglib.c
+@@ -958,7 +958,7 @@ reglib_parse_rules(FILE *fp, struct ieee80211_regdomain *trd)
+ static int reglib_parse_country_dfs(char *line, struct ieee80211_regdomain *rd)
+ {
+ 	char dfs_region_alpha[9];
+-	char alpha2[2];
++	char alpha2[3];
+ 	int hits;
+ 
+ 	memset(rd, 0, sizeof(*rd));
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index f99dfd66f9..9abfd61cf2 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://use-target-word-size-instead-of-host-s.patch \
            file://fix-issues-when-USE_OPENSSL-1.patch \
            file://crda-4.14-python-3.patch \
+           file://0001-Make-alpha2-to-be-3-characters-long.patch \
 "
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
-- 
2.35.1


