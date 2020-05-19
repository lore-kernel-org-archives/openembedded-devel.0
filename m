Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.13265.1589899432206948431
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ddyPy6UI;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id n15so16376pfd.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LTL7bL1KE5kmPfa/JwVPxEi4D2uWSRCoBw7VoqbDd78=;
        b=ddyPy6UI0M45NQqTLfAP2SNjJg49QNBPmFoO+nvy9DOU8cyVZx8HcrIphzpyMwkDvG
         h1BAtrtzXyyXboudyVFp9rw2vvQtwoQnEuYvwAot38HBy2KCf6sRqRY9Y/AZyH7EMK5w
         4UXmpGxmWbSbjzCWFcl2JCOe3ELyT03+nixZ5SPmxn5Sbg8M7q9X+B/BcT2Fbw4OH1LN
         fLd6txZlN3n1BswD/+YAEraxIoEOVcCBD/VVs2Ie2mkWQ0IAj2FWIdhYIBTQWneHoJmL
         HXmfCTGee/Ebc948nc1wougnCqjJdYWP83cufmHAf6igXsHKcRuZw2T+fvCgxVbfcFh0
         n6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LTL7bL1KE5kmPfa/JwVPxEi4D2uWSRCoBw7VoqbDd78=;
        b=MqAVDDBYmova+JjP6WpTncjYigJ7nk3JII1YtblplGmRH+uQdiyHEXLGmiM+HcGjbC
         Gwjehahb1oAX/AGDccqaGYM6TgR+Zg2q7OLXMf1YOLGe8JD0MTKgorKXDsGCPPhhOpxu
         L+huQJxZc3slC6G5xyQyyfr2d3E9rL8/ynjVozbZOPlvp+MqQxWM6l4V9xqSqmFgF4sN
         DPf7BQssjzy7SvaY9vQKoSL5yEhUqWYTZRJXiUhALiqlUZxfEQeEwI8PXSs5TsCB912B
         iX5/yFLKaG3/f3oKDqJElxPXqSLsqNYrnNc9XlKOUsu8/C407JEgey19bToz8NLzd0p5
         Xr7w==
X-Gm-Message-State: AOAM533WMVW6U/KNL6GO6yEKenKn4Wt7MBRuDJbYfv2VzkAuf7VCo2d8
	PY9Ukn6lp4hfPJz/jxarfBDPif/l
X-Google-Smtp-Source: ABdhPJxirGuaxyjl+d3dbNWj/ctBn1SCawlmAfo/x/Q5GujB+bpmCoqiXO6S5UbsTcR3FD/mSr2fQg==
X-Received: by 2002:aa7:9a96:: with SMTP id w22mr23175969pfi.199.1589899431573;
        Tue, 19 May 2020 07:43:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:51 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 14/18] python3-pyroute2: upgrade 0.5.11 -> 0.5.12
Date: Tue, 19 May 2020 07:43:28 -0700
Message-Id: <20200519144332.12822-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 337094167094536a40d94d3ee74e6355d8fbf2dd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-pyroute2_0.5.11.bb => python3-pyroute2_0.5.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.11.bb => python3-pyroute2_0.5.12.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
index a4b8aa3988..440f8993c9 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "7005db01604663fc2ecc089925980e05"
-SRC_URI[sha256sum] = "05e959f1a89d715158b91fe83b67946a4441e5e098cc225f4df78a3765ac4af2"
+SRC_URI[md5sum] = "4370e9a5875486a1223705ea9b001eff"
+SRC_URI[sha256sum] = "0157801c5496177856c3296b590065e691b041a3adde6fb8ffad2a8d05013ed3"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

