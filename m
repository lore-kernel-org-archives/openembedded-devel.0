Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.1670.1597283638922829986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 18:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=REjEDSI6;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id f5so1922956plr.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 18:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U/kYGpVZDmTANm+/WQmlXr/qvrdSTpjtwT2QtsvPdus=;
        b=REjEDSI6IiLBCa/yorxHuJsSoRlgh8kUl2IkHaq+7Dk3ewynKO71aHYDHXrs6MrpqB
         GExkKuKG/hG0MneinDGEkMS4lPxh69uDowJvMG9WA0fEVQIGPQ5uTmmBZhTZFtpFHcqF
         lk2I8nDBwc5o8IPQXmXh0OKjI1yHInOz3o2yvcMjeKyIijIG0oGfYvvkI3yG+TrLL7E5
         i+SiadfEvSAXw06zzffvB6qXznvjl22cUab7IOr8ItKaxjFRUjKs4MXBc7VsCa3ODs1T
         dCMPxzC67Pg1ns1X5O3cjS0ObRHPsYN5blqroL8i8i3T1y8zV6pLzLjK4dBjXa1m6Edq
         eTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U/kYGpVZDmTANm+/WQmlXr/qvrdSTpjtwT2QtsvPdus=;
        b=N6CJ1gEN6mGyuQqbFLDWG2N/PMe9Sxufe8PWFyA+g3+nuyNUAMPDx0ZszsJF5emC16
         w34LwjOt5YuhnlRtjL2EU73gwf9qcfQ5UfQfKpPK2vfMGMkaCJlICK1ph+yvmxTOo7pW
         Eq84R76P78Eej2e4WZVovQpx/Zu6mbvmh/UF2mBZDcr4UxzCI+vjoqRgXO0ZW8clp1ot
         Q08ItlPVvhvJexDZF/bWMijMs4bwlLtb7/YSOKt+pRmWS1gJLGV9LsbJ376RErrvxJiD
         h0HSm1dX0MYOQH/ARu0fxGgK3giFiH0JAv3kpgnDCy1+6lVLd9OcUMcPdHqI2FvH9Da4
         iZvA==
X-Gm-Message-State: AOAM530o60bMuY/KnJ6HJ/8RxhYuFzlayGT6dKYzlxKtUv46HrzJSODt
	SaGoVGcXNCgt0ql36sAX7BpnF5evzLA=
X-Google-Smtp-Source: ABdhPJz9lWBz9/b6zlvnY/yZv5Mfv6tbN8xfNpbRWTf11pNvLAGqdgBsgA/A7SJsCUAmdKfIVPeriQ==
X-Received: by 2002:a17:902:b602:: with SMTP id b2mr1985474pls.280.1597283638132;
        Wed, 12 Aug 2020 18:53:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id o4sm3453578pjs.51.2020.08.12.18.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 18:53:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/4] tvheadend: Update to latest tip
Date: Wed, 12 Aug 2020 18:53:52 -0700
Message-Id: <20200813015352.2318764-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813015352.2318764-1-raj.khem@gmail.com>
References: <20200813015352.2318764-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-allocate-space-for-buf-on-heap.patch this is already fixed upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-allocate-space-for-buf-on-heap.patch | 46 -------------------
 .../recipes-dvb/tvheadend/tvheadend_git.bb    |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch
deleted file mode 100644
index cbd76b6abf..0000000000
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-allocate-space-for-buf-on-heap.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d4a405f87fc215c14e610a25b5a6b14060c1ef15 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Dec 2019 13:53:52 -0800
-Subject: [PATCH] allocate space for buf on heap
-
-Avoids
-| src/epggrab/module/xmltv.c:204:47: error: '%s' directive output may be truncated writing between 2 and 2147483645 bytes into a region of size 115 [-Werror=format-truncation=]
-|   204 |   snprintf(buf, sizeof(buf)-1, "ddprogid://%s/%s", mod->id, s);
-|       |                                               ^~
-
-Upstream-Status: Submitted [https://github.com/tvheadend/tvheadend/pull/1324]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/epggrab/module/xmltv.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/epggrab/module/xmltv.c b/src/epggrab/module/xmltv.c
-index 34ab05bdb..b1a956614 100644
---- a/src/epggrab/module/xmltv.c
-+++ b/src/epggrab/module/xmltv.c
-@@ -197,11 +197,12 @@ static void parse_xmltv_dd_progid
-   (epggrab_module_t *mod, const char *s, char **uri, char **suri,
-    epg_episode_num_t *epnum)
- {
--  char buf[128];
-   if (strlen(s) < 2) return;
- 
-+  char* buf = (char *)malloc(strlen(s) + strlen(mod->id) + 13);
-+  buf[strlen(s) + strlen(mod->id) + 12] = '\0';
-   /* Raw URI */
--  snprintf(buf, sizeof(buf)-1, "ddprogid://%s/%s", mod->id, s);
-+  snprintf(buf, strlen(s) + strlen(mod->id) + 12, "ddprogid://%s/%s", mod->id, s);
- 
-   /* SH - series without episode id so ignore */
-   if (strncmp("SH", s, 2))
-@@ -219,6 +220,7 @@ static void parse_xmltv_dd_progid
-       if (buf[e+1]) sscanf(&buf[e+1], "%hu", &(epnum->e_num));
-     }
-   }
-+  free(buf);
- }
- 
- /**
--- 
-2.24.1
-
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 20faef047e..82c2cbe086 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
 
 SRC_URI = "git://github.com/tvheadend/tvheadend.git \
            file://0001-adjust-for-64bit-time_t.patch \
-           file://0001-allocate-space-for-buf-on-heap.patch \
            "
 
-SRCREV = "fda89e85e0b6ae796d8a09e178d3937aa7869270"
+SRCREV = "ce09077056f9c6558c188d135cec3be85cc9c200"
 PV = "4.3+git${SRCPV}"
 PKGV = "4.3+git${GITPKGV}"
 
-- 
2.28.0

