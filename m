Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7F4C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:14:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.489.1788887643655984351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M7abNOnI;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so36140805ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887643; x=1789492443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqaggVcONmQ1mCunfL4kLYcldsW3I7Norcdq4qldTFc=;
        b=M7abNOnICHZ9Q6IC+t+JfLWkTOBvPNG8IYd4Ajbyk3WZsn1cCTHx2gSC4UXItVBgqz
         24WJ4jp2Ltfo/lyZU9mf0prVWOPrUWWzhopZfCZ6ENv9QC4K5CQnZspFPoW/NNFKve23
         r8mp8upjVGKTMZggw7z8HaybvaE95m4M75i/YG9xsmKnSIhYObrlsb6OJGMC2VBQilCJ
         JTWYkfGqrtQcnkz7yOx/IltcQPBoWue73LapNqkwgPALcSwUL/A1ok5GbqJ70IDzDKX1
         fWxlZfhpwN3YXOFaRlj5pE/qin18CE9qH8Lta3iCGYCfXp5l3AqhI4ygujWmZb3CEbrY
         kgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887643; x=1789492443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqaggVcONmQ1mCunfL4kLYcldsW3I7Norcdq4qldTFc=;
        b=OFvb0M5Fqc8j1vuKdL8JUnCHJ2vdbz8pmU84Zu6hKLNPV/QecCL1nPAYK2lpjprbag
         Gd5Omgg2TYC2OTRK6QFfgydZnstsRX2iq05SYo5Yh1LSIiAG+xj93JXPq7mCtQFOHUF8
         WyC6mowGVDGrd6ZkRoIkzIm6LyL8YshnaGIu19uQOXmK3RCtLuhGTpqof3e9wpaWIuf7
         wcZyjHmgJS4wtZY4Tg7CvV6BITIAwoX+v0Oz2Id+KNwiNzvS+UXKvzZ0Z60qK6PWR6Ew
         okPEWNJTKhJVHBwFOqojGaTPmo9gOs+msMkw57rxyC7bAIAsQv/nzppAMxfhSgmc3fPP
         TSgA==
X-Gm-Message-State: AFuF++nGb6ZczRABbsNVhf/rS7jZtAaJbVWOm2nUhmZBKRPUyJNRHZV0
	aBZ4S3My2puc83Zw/MVXNSpIkykg7t3oYACKkiYMqoarznUpzX4S3d6nr3Edyg==
X-Gm-Gg: AYBFou3QbJ/gdyDwV5enwH+W2ZAz76XnqyT9Gxjgu0PYdyyjLesxpuFjsJa5ookLQkM
	pSBRoUndeqdBIB5RfG20LqaU0dnmRAJI3YH8nzd35KYAPT5PRGNTVNCPC3WHXQlSYZESnaB4ep/
	Av1D1nzCeMtm+P7mlTtrXx778H0XNW6h/UaCJZZW5vts7PSUw66I9R/8arG1BT4Njj4cCHe06Xq
	phqqre7+/TqZ4WKQ9LcUv4knrOpavWLQQMUXNQD73SEwSENfFxnGg5oYsTt1/WU4b5dL2E6Ptc3
	ys13gZFiEmODMLEpP6IumPlBmg9ZrudF5KnXP2elsdTPrLM7SP90VWOBTPPsSgSh/6QxMjXHPHv
	wCswc7vvLXNm9scB/HFMS0HizbaVGigFhK9eloOqWphh+SFGsg/wcPUBYdW6ekaH6lwm/4zPbvA
	lBsvdmPXnKLWwAqlypFHjzK/zqFx/UFUrUYykmaYj0GLpr/dM1wxpryBn45URkV6e6s5jablyv9
	8okEfA3k9pb9hl68wOJoerrEjmE2pHEM+/7YAL3XsO5uDTnRigmJL5lxWbS8QA9JMobH1MaoYgJ
	qZ7xmvGZh4jL2ALi579bjtkzC8NaeGNhca+hETIOuOEvpGLosYX+S+bjsQF6MEI23BBbyPHw/WC
	M4SM3C2zk/VHSqUkx11iO2GQbExWSrfxsJ64jcmjtm4OrFv4=
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr47270690a91.13.1788887642900;
        Tue, 08 Sep 2026 10:14:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm39566297c88.12.2026.09.08.10.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:14:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] pegtl: Fix build with clang-23
Date: Tue,  8 Sep 2026 10:13:52 -0700
Message-ID: <20260908171353.701307-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
References: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 17:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129870

clang 23 enables -Wunused-template under plain -Wall, and every test in
src/test is compiled with -pedantic -Wall -Wextra -Wshadow -Werror, so the
whole test build fails:

  include/tao/pegtl/internal/match_impl.hpp:24:30: error: unused function
    template 'match_no_control' [-Werror,-Wunused-template]

match_no_control() is a namespace-scope static function template in a
header, so it has internal linkage in every translation unit. It is only
ever referenced from other templates, so in a TU where none of those get
instantiated it really is unused and clang says so.

Add a patch declaring the two overloads inline instead, which is the
correct linkage for a function template defined in a header.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-match_no_control-inline-instead-of-.patch | 48 +++++++++++++++++++
 meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl/0001-internal-declare-match_no_control-inline-instead-of-.patch

diff --git a/meta-oe/recipes-extended/pegtl/pegtl/0001-internal-declare-match_no_control-inline-instead-of-.patch b/meta-oe/recipes-extended/pegtl/pegtl/0001-internal-declare-match_no_control-inline-instead-of-.patch
new file mode 100644
index 0000000000..4b0821b9c1
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl/0001-internal-declare-match_no_control-inline-instead-of-.patch
@@ -0,0 +1,48 @@
+From e5997938100dd459ad9473bf574ab9a75e5a0a53 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Sep 2026 05:31:46 +0000
+Subject: [PATCH] internal: declare match_no_control() inline instead of static
+
+Newer clang (23+) enables -Wunused-template for namespace-scope static
+function templates defined in headers. match_no_control() is only ever
+referenced from other templates, so in any translation unit where none of
+those get instantiated the internal-linkage template is genuinely unused
+and the -Werror test build fails:
+
+  include/tao/pegtl/internal/match_impl.hpp:24:30: error: unused function
+    template 'match_no_control' [-Werror,-Wunused-template]
+
+This breaks every test in src/test, since they are all compiled with
+-Wall -Werror.
+
+Declare the two overloads inline instead; that is the correct linkage for
+a function template defined in a header and does not trigger the warning.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ include/tao/pegtl/internal/match_impl.hpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/tao/pegtl/internal/match_impl.hpp b/include/tao/pegtl/internal/match_impl.hpp
+index 8723dae2..c13dd4f7 100644
+--- a/include/tao/pegtl/internal/match_impl.hpp
++++ b/include/tao/pegtl/internal/match_impl.hpp
+@@ -21,7 +21,7 @@ namespace TAO_PEGTL_NAMESPACE::internal
+              template< typename... > class Control,
+              typename ParseInput,
+              typename... States >
+-   [[nodiscard]] static auto match_no_control( ParseInput& in, States&&... st )
++   [[nodiscard]] inline auto match_no_control( ParseInput& in, States&&... st )
+       -> decltype( Rule::template match< A, M, Action, Control >( in, st... ) )
+    {
+       return Rule::template match< A, M, Action, Control >( in, st... );
+@@ -34,7 +34,7 @@ namespace TAO_PEGTL_NAMESPACE::internal
+              template< typename... > class Control,
+              typename ParseInput,
+              typename... States >
+-   [[nodiscard]] static auto match_no_control( ParseInput& in, States&&... /*unused*/ )
++   [[nodiscard]] inline auto match_no_control( ParseInput& in, States&&... /*unused*/ )
+       -> decltype( Rule::match( in ) )
+    {
+       return Rule::match( in );
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb b/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
index afaf8f997b..2ffa570c9f 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
@@ -4,6 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=4.x \
+           file://0001-internal-declare-match_no_control-inline-instead-of-.patch \
            file://run-ptest \
            "
 

