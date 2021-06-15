Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.6039.1623741604803704765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 00:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ksa0Yi8A;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: rahultaya96@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id u18so12553534pfk.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Hmm2z1ctWQGgiQOlAT98VcUA2DNKJKLjf44uWrcI7E0=;
        b=Ksa0Yi8AVA54j5QycfSnmlHmRRGrR9Ihoki5G7GxnT84MUslJKG/mXfRvTUkouYXxU
         rv4hQxph8DyT5WwkhtjmDcB49lSxDOF5pg8TKHwA2iarg1DEfQ4fwXmogad8cEWU4EnT
         xAa9X2EAy8DO22j7BgM/QCfjNHXZ8MErvKPKExaU5YOwHCOvEa4ATBoeunW7KZZCE2Qv
         LvhmRGQL1a/jTNhuyimjJzOSlQ1gGP0jEvDmzuER1DHfXcW6ALQZp0E9uCG2HLKdi/4a
         mcN+jJ+yYV6fJSqU8yyL72s7Vsgw+YiZsyLf78d8EIXUjPxlujW/LOehmMeWQOEGF908
         j/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Hmm2z1ctWQGgiQOlAT98VcUA2DNKJKLjf44uWrcI7E0=;
        b=j4Dq8sAaqEr4ZR4FHHfAEi5pKydRJCrL2Oj9ocSuP2DxBBW7A/UEYyPTtbKr58CBqZ
         Z0D3PQNYqg5gzxyBykgVlHwgPjWIkMXzjnXleTUT4kqoZAHngg+5mLydW+r44YM9Kvvz
         AiIPr+5C8jR6jf1ZGDf2LXRGf1kpfhimSihfL8Klr8oimv4pra28VStoMj4RmzRIV7go
         dsDdpNUU4/W2j5CZ32ukv4O1iBBavmt5mNljrn2+jXEYi1Yj9wygIMFYJZzVZQ6fPw4L
         4ULy/pB4pTgyolMmZKlC3NiccJhwtEkLUW5fdlbsNodfJPQdtpsoIVk4QThYauyR6yAo
         Ukwg==
X-Gm-Message-State: AOAM5328dEDx07UMy7/38yWRwCU/4OeEV10usXxF38ZvdnJfY0VUPEjh
	hYuf0Z4Dchz5h2iGX5Y/BDLqwI9iXwYGLkut
X-Google-Smtp-Source: ABdhPJxvutD7NGONbuprjmyunMj+V9lWqEiFLEnvYEHJoMo1YP1mFRnXpN5sf7tiPUf6zL+A2G3Bhg==
X-Received: by 2002:a63:981:: with SMTP id 123mr20860359pgj.187.1623741604137;
        Tue, 15 Jun 2021 00:20:04 -0700 (PDT)
Return-Path: <rahultaya96@gmail.com>
Received: from L-11851.local ([103.93.114.219])
        by smtp.gmail.com with ESMTPSA id j12sm14902630pgs.83.2021.06.15.00.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:20:03 -0700 (PDT)
From: "RAHUL taya" <rahultaya96@gmail.com>
X-Google-Original-From: Rahul <Rahultaya96@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	purushottam.choudhary@kpit.com,
	Rahul Taya <Rahultaya96@gmail.com>
Subject: [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
Date: Tue, 15 Jun 2021 12:49:50 +0530
Message-Id: <20210615071950.12684-1-Rahultaya96@gmail.com>
X-Mailer: git-send-email 2.17.1

As per below reference links this CVE issue seems to be minor and
harmless and as per upstream this is not a real issue in practice.

And as per red hat this issue is marked as low severity.

1. https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
2. https://security-tracker.debian.org/tracker/CVE-2015-5237
3. https://ubuntu.com/security/CVE-2015-5237
4. https://github.com/protocolbuffers/protobuf/issues/760

As per NVD link: https://nvd.nist.gov/vuln/detail/CVE-2015-5237#range-6634983
it affects version upto 3.1(including)

Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
index 4d6c5b255..f845a72a0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
@@ -88,3 +88,11 @@ LDFLAGS_append_arm = " -latomic"
 LDFLAGS_append_mips = " -latomic"
 LDFLAGS_append_powerpc = " -latomic"
 LDFLAGS_append_mipsel = " -latomic"
+
+# As per below links this issue is minor and harmless and
+# as per upstream this is not a real issue in practice.
+# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
+# https://security-tracker.debian.org/tracker/CVE-2015-5237
+# https://ubuntu.com/security/CVE-2015-5237
+# https://github.com/protocolbuffers/protobuf/issues/760
+CVE_CHECK_WHITELIST += "CVE-2015-5237"
-- 
2.17.1

