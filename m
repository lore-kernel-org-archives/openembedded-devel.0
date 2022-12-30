Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B595C10F1B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 22:05:46 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.29640.1672437937971845280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 14:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XNxrSooS;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id fy4so23633305pjb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 14:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w74KdtAz7Wi/4et/foI4gGEkEa05iUpgDipvuirfr3c=;
        b=XNxrSooSqGOkEleJXWxibrI+kSx8ukGUdOgc36U0ixox4Nte5ySiTguBFphibxf/r2
         RmEpPz3FodQAzoq/w8gJXGevMp6m8nVFPRKy+0pyGhnc0w4uwPRivkM81tAtWExPGoKH
         JDhtK9mBwNcY0go16jXO6jEBr9JY7btEylpgU7bbz7Wd5T3dY3nkE07l9P2COARST8Oj
         6JgD8kmFGZMhDIP05uPb2aydSipU4wHi90Y23uRsKSwM7Z7dDbO7G5+S00zfeiixmKgw
         0UnwrHMOlqcnR1IlVsrL1wPyEElNLcaM1+A7NuBujbhZyMo3Ud21wmHr++K0AFI2me84
         3V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w74KdtAz7Wi/4et/foI4gGEkEa05iUpgDipvuirfr3c=;
        b=nqTsSFUCu4UAWzMTXMzzE9ePqbs9pEHTLtYp9+fH9rC7MkpiF0U+jZYmtuMMbdDInh
         dtJAAPtVowV7q41ULpA1Cs1/deuxkkXA+hTjr0DYB4Fr8edqV3jdvUpYaW3FCIV6QtIu
         GUKGEurRl1W0eUgMDFH0oeBi85kTCaMmVa5F1ippiXAs4LlJShs4fyvwp9Zu9JDZ23+9
         1t4p3NiOm6TKPEHtT8D6LUfV9mU2zjowJ8yZnYIA0O8FzESDkTXO6i4PxbtYtzcy6O2E
         Ukj1TGYTEI4dT4UD8jxolG3/fhxQNcoe5T3JuhphmPk9mK+DRcp1UrOslsr/WUQL3zAp
         /3SA==
X-Gm-Message-State: AFqh2kpIsw1mJnbaHlYDKeU2j6JaCCkXjmb/p8ZpX9uzBQ9+MBBuc7Rf
	WIBMZ8iyJJZ/w65tMw3KDnjeBVaY85s=
X-Google-Smtp-Source: AMrXdXs7K+unsHjI2f0S1XvByIEoMxUf1mf2JOH6D+FH4tKZL/DksXDOLRDkqfYIRutr2mV4qGtISQ==
X-Received: by 2002:a17:902:ce08:b0:189:81dd:6b8b with SMTP id k8-20020a170902ce0800b0018981dd6b8bmr47383302plg.63.1672437936976;
        Fri, 30 Dec 2022 14:05:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709026e0900b00186f0f59c85sm10779155plk.235.2022.12.30.14.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 14:05:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mozjs-102: Disable mozilla stackwalk on musl
Date: Fri, 30 Dec 2022 14:05:33 -0800
Message-Id: <20221230220533.2614883-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230220533.2614883-1-raj.khem@gmail.com>
References: <20221230220533.2614883-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 22:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100317

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs-102/musl-disable-stackwalk.patch     | 18 ++++++++++++++++++
 .../mozjs/mozjs-102_102.5.0.bb                 |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch
new file mode 100644
index 0000000000..a3ba469a41
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/musl-disable-stackwalk.patch
@@ -0,0 +1,18 @@
+Musl does not have stack unwinder like glibc therefore
+we can not assume that its always available on musl, we
+do need to check for target environment as well which
+could be musl or glibc.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/mozglue/misc/StackWalk.cpp
++++ b/mozglue/misc/StackWalk.cpp
+@@ -44,7 +44,7 @@ using namespace mozilla;
+ #  define MOZ_STACKWALK_SUPPORTS_MACOSX 0
+ #endif
+ 
+-#if (defined(linux) &&                                            \
++#if (defined(linux) && defined(__GLIBC__) &&                      \
+      ((defined(__GNUC__) && (defined(__i386) || defined(PPC))) || \
+       defined(HAVE__UNWIND_BACKTRACE)))
+ #  define MOZ_STACKWALK_SUPPORTS_LINUX 1
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
index a4d88a340a..d38ae10b87 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
            file://py-3.11.patch \
+           file://musl-disable-stackwalk.patch \
            "
 SRC_URI[sha256sum] = "017dd44b1285913f477074802707a4c76ed1a28270ec5a327bbb76574cc057d8"
 
-- 
2.39.0


