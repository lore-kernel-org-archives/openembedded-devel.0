Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997CEC54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 08:03:44 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.32137.1711526614519123018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 01:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JsjRzO3K;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56bc8cfc19fso7095666a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711526612; x=1712131412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DwiJPa3K1gCdQvRppuAubEsS1ezCuP2pz6EWfq08L4=;
        b=JsjRzO3Kk1yAcTOOGddBoxYAfmthK4ngSXViqeELlGWIfVA7Bj3sBdJc6tOzvBiQTC
         ovgswYz7NFCJ8wfloghZ44yZ/2Xnw0QeROwXENFKYOuh6wsNB/RNYKKKB/LD1UNDV7o0
         JoidmJWO6EhUnVthRXszBwYLZkvQsCdO6qKxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526612; x=1712131412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DwiJPa3K1gCdQvRppuAubEsS1ezCuP2pz6EWfq08L4=;
        b=pjVFTh8OUeZ6QqgE8xszyr/SvAdXZ1hrT8Q/pifU+rqOx4PCMUKvU9HBsdchHoNs0d
         BcAP2yImsrEy0V6p90lBhDLwUJt1nJhvJTT6YzrEyS7rcpvjilhUNq6g9tQWmUS5P0iz
         c3+JsJKvW9t36ndzFNs7q2Pd2mUljO0VlhrR6H2M/JCcW9P8+9cIjfjKQCh1qvvumOyt
         BUDjhcMNmh7v4tcTsOEMWWCI5U8xBu3nEtIAhg1Q7WVUQV5u/YHt+9CFWl5UBLEk5ww4
         lcShJJ3pc9GCUQ155RdSVKbx7M4U2IZDOrTS/poevi/w1A1zQ9ex046VjmC9o4t6tvcu
         cIVQ==
X-Gm-Message-State: AOJu0YydmXYgGvjPvgVYH7VdSzsC9MG7BGtVU5psRDcE5VI5K1k12XL6
	E1CozBAjyEukVRP+iBe8YpAVKL6ABv1y26LzisPHKr+LAd67bc7AXjsNPDDZ04Tnz2vT7QEHrai
	/
X-Google-Smtp-Source: AGHT+IEHTFpAl/H48Ni1ZIL/z7KFkq3XqOWcLlWZ81Ebs4QLmM6cZ0C5XkC3tuD+d3rh/os1OnAGPQ==
X-Received: by 2002:a50:9e65:0:b0:568:fb58:bc4d with SMTP id z92-20020a509e65000000b00568fb58bc4dmr2298241ede.8.1711526612378;
        Wed, 27 Mar 2024 01:03:32 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p11-20020a05640243cb00b0056c3013485csm1008759edc.69.2024.03.27.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:03:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-cachetools: Upgrade 5.3.2 -> 5.3.3
Date: Wed, 27 Mar 2024 10:03:28 +0200
Message-Id: <20240327080328.3910249-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240327080328.3910249-1-leon.anavi@konsulko.com>
References: <20240327080328.3910249-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 08:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109640

Upgrade to version 5.3.3:

- Documentation improvements
- Update CI environment

License-Update: Update copyright years to 2024

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-cachetools_5.3.2.bb => python3-cachetools_5.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.3.2.bb => python3-cachetools_5.3.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.3.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.3.3.bb
index 22060ef04..3ef75d470 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.3.3.bb
@@ -6,7 +6,7 @@ Python 3 Standard Library @lru_cache function decorator."
 SECTION = "devel/python"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ec55353c80c662e4255f8889a0ca558"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
 
 inherit pypi python_setuptools_build_meta ptest
 
@@ -28,6 +28,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "086ee420196f7b2ab9ca2db2520aca326318b68fe5ba8bc4d49cca91add450f2"
+SRC_URI[sha256sum] = "ba29e2dfa0b8b556606f097407ed1aa62080ee108ab0dc5ec9d6a723a007d105"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


