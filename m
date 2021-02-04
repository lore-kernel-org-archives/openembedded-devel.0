Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.578.1612481320379415621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 15:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C6fH6xND;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id e12so2600214pls.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 15:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lbAkbX04/M/chqfAWe/VgMk/EPrmiD3s+zamyvD0I8E=;
        b=C6fH6xNDnWEX6MinluwyKgnoTUmDG6sTadkaMVREdsSef4jwcv5fCN9e06/ryax/+2
         XGLOGbp11rK9m/x9m3zSYi2wCo6uVT6GWq0Nwg1sA52gFOZYYztYbnGUUY8WRtg1uppj
         rDF2p2yAHvbKpfdEtNsaa10kLNXf4NwT60hE4d+NdoFtF0LlXo/4/21VxdHzN6bPvtoH
         D2Npe4K74YQ5ukYTNcZJkl6HIPLbgn/nJxvb9Be6VJ8D58AWJn2Kb/3ulro5vu/a62/H
         bpxGdz8HwdnkrJgnN5uAqYU0v1nUdhIhaw8/zZyolFAlGcuXNDr4uRKs6Y/F9IXEbPT1
         nuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lbAkbX04/M/chqfAWe/VgMk/EPrmiD3s+zamyvD0I8E=;
        b=RcTqwO5qdCM+XPTEoAXVzc8xW0cVgAbd+J3I9jY7oQPfPTVFYTN+eXdr9FREJszCUM
         l7clvVwJtsS6KV5+ZChyKwhTbWKOiTH4gBN7CYKCAOZde/xzXQWsGWnTIi8uur9epVKN
         uNf/uQViO61hacTdGNM0AHieGL6rp7sPpeEn5ATjCLBj/LYfeTo/y0rrPdCmPrb7y6mO
         SMTgjk0RLzj8vLMD9WCZutjgqputS41oUmhFGEU3FV4bnPfuBRorqbcOQZkR4fToK479
         Uj9gDhYfcSvJ3wcMehlzNvzCQ9oCsVKPKn0TckAKDTBUGoBb5v9rMa8FAsEi0iIATE4G
         FABg==
X-Gm-Message-State: AOAM530qAD0nof92C3JD84quZ3rAacLIy8Ms/cKmp9KAOsQKG691/9Hb
	e3aPwPVr/fTjwUFCv7lCpVgifK4Zm/V7Aw==
X-Google-Smtp-Source: ABdhPJy4p7FaQ/U987JGDPiGg8hIcjBSRvhMbZ4Qc8Rw2M70J7/cvv5WnkkJKrSce0Z9frNkDm5J7g==
X-Received: by 2002:a17:902:ec8f:b029:e2:9b48:69b with SMTP id x15-20020a170902ec8fb02900e29b48069bmr1668716plg.18.1612481319645;
        Thu, 04 Feb 2021 15:28:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id k6sm7886467pgk.36.2021.02.04.15.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 15:28:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] net-snmp: Remove hardcoded paths to build host in net-snmp-config
Date: Thu,  4 Feb 2021 15:28:35 -0800
Message-Id: <20210204232836.655046-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204232836.655046-1-raj.khem@gmail.com>
References: <20210204232836.655046-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New autconf detects that NSC_LDFLAGS are hardcoded to use -L/usr/lib
therefore edit these variables during build so that they have
cross-compile friendly values when net-snmp-config is used during build
of dependent packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.9.bb | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index 6a4d5b1eff..051e168f02 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
@@ -103,11 +103,10 @@ do_configure_prepend() {
 }
 
 do_configure_append() {
-    if [ "${HAS_PERL}" = "1" ]; then
-        sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=${STAGING_DIR_TARGET}\$\{includedir\}@g" \
-            -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L${STAGING_DIR_TARGET}\$\{libdir\}@g" \
-            -i ${B}/net-snmp-config
-    fi
+    sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=${STAGING_DIR_TARGET}\$\{includedir\}@g" \
+        -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L${STAGING_DIR_TARGET}\$\{libdir\}@g" \
+        -e "s@^NSC_LDFLAGS=\"-L.* @NSC_LDFLAGS=\"-L${STAGING_DIR_TARGET}\$\{libdir\} @g" \
+        -i ${B}/net-snmp-config
 }
 
 do_install_append() {
@@ -135,11 +134,10 @@ do_install_append() {
     sed -e 's@${STAGING_DIR_HOST}@@g' \
         -i ${D}${libdir}/pkgconfig/netsnmp*.pc
 
-    if [ "${HAS_PERL}" = "1" ]; then
-        sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
-            -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
-            -i ${D}${bindir}/net-snmp-config
-    fi
+    sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
+        -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
+        -e "s@^NSC_LDFLAGS=\"-L.* @NSC_LDFLAGS=\"-L\$\{libdir\} @g" \
+        -i ${D}${bindir}/net-snmp-config
 
     oe_multilib_header net-snmp/net-snmp-config.h
 }
-- 
2.30.0

