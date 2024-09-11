Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85444EE01FA
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 01:28:10 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.12615.1726018087475854709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 18:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+M6HaJi;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2053a0bd0a6so14979495ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726018087; x=1726622887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M8QB048L72ZlkY6T4NviCpx75t1azlbLO5kgjic5/FQ=;
        b=L+M6HaJiuW4SfJM7ciWyyQ3oXajAInvlYuOiCJkTBevo2z8cNzZ2ZQhyNPUY0PSIba
         UMPVuomQtUscKOTKZb8KNMYk/zPXFW2acalAkXLuf4WEypfS3LXoqlO3G1tStb6LZMyr
         rsZIZinGwX+5KsY/JFlv1HcL28AWZWIlKaSOYZ5j5pKQ7nZkfQgsm4RtSRtrB1XCs7/W
         EDl3pVJqTmFR0YU4SFnGF8Q92rxFOtTTguc29SpE6wrcSvXyVGO500IwniiEnVB+J6Ul
         kaGee/aYCf7LnK+GWtVQP9HdPrMbJlNh5iu4UpDWfYZQjI4G9M4C/BjMP85eDCuZeSXC
         5vRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726018087; x=1726622887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8QB048L72ZlkY6T4NviCpx75t1azlbLO5kgjic5/FQ=;
        b=T2/6DoaFV/QrMcNAXSsv8ZX/7KLew4cDN6oTiySqzvSFrsL6sNfb5CNezL1YBGJjA/
         2Q+bkMvDnny3sue5+EuFeNA4ioVG1B8E/6xLj2KJNdLb44K4caMxSV9+bf2BA0Rey6vh
         uhS83CBvVSVfewHgdY3joOdK/GKQxTodjfbyn9HDtEe1heWHMljcZs5C53BKTHOlNJR9
         zDOQMcC/JJMv5MPJPCTUz7fGJzgwLULcNQq3Wj7oNJm0YZzhiPzwjnOHiuGWtUjHt+6/
         fKtV/OjXS3tB30Z+uGT3nLjT8nSm+BFbTxm0aeU1MRu2BhVOnpwh2PDvh2lZtfiZDsc0
         t2Eg==
X-Gm-Message-State: AOJu0Yx4BNddV+WQvEIjrUoKjELetcoolMZMwGh7TziBNlmkxUXrpoXU
	BtoesdP3Glk0OCDjzjGFlTyYk1GgZuV2Ns92NXjPk3NQ33s9XJML9ijpbDsc
X-Google-Smtp-Source: AGHT+IH6Psw1zpWlvNtK2kLyStx4rPmfHXIQ5BqgXvip6YkvFV9iEmyWZxGJXusCymKr+SX5Uef33Q==
X-Received: by 2002:a17:902:d491:b0:206:b8b7:85f with SMTP id d9443c01a7336-2075219c917mr17921535ad.3.1726018086505;
        Tue, 10 Sep 2024 18:28:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9f01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e34f73sm54234045ad.86.2024.09.10.18.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 18:28:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Fix build with clang-19
Date: Tue, 10 Sep 2024 18:28:03 -0700
Message-ID: <20240911012803.2929215-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 01:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112235

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Wmissing-template-arg-list-after-te.patch | 41 +++++++++++++++++++
 .../libcereal/libcereal_1.3.2.bb              |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcereal/files/0001-Fix-instances-of-Wmissing-template-arg-list-after-te.patch

diff --git a/meta-oe/recipes-support/libcereal/files/0001-Fix-instances-of-Wmissing-template-arg-list-after-te.patch b/meta-oe/recipes-support/libcereal/files/0001-Fix-instances-of-Wmissing-template-arg-list-after-te.patch
new file mode 100644
index 0000000000..86ee6902f2
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/files/0001-Fix-instances-of-Wmissing-template-arg-list-after-te.patch
@@ -0,0 +1,41 @@
+From 395cd70a8c28a4ea408a227d745fe20ed8af9105 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 10 Sep 2024 18:11:40 -0700
+Subject: [PATCH] Fix instances of
+ -Wmissing-template-arg-list-after-template-kw.
+
+Clang has a new warning that requires a template argument list after using
+the template keyword. Remove uses of the template keyword when we're not
+specifying types.
+
+See https://github.com/llvm/llvm-project/issues/94194 for the upstream
+clang changes
+
+Upstream-Status: Submitted [https://github.com/USCiLab/cereal/pull/835]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/cereal/types/tuple.hpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/cereal/types/tuple.hpp b/include/cereal/types/tuple.hpp
+index 80c68075..5c79eca9 100644
+--- a/include/cereal/types/tuple.hpp
++++ b/include/cereal/types/tuple.hpp
+@@ -95,7 +95,7 @@ namespace cereal
+       template <class Archive, class ... Types> inline
+       static void apply( Archive & ar, std::tuple<Types...> & tuple )
+       {
+-        serialize<Height - 1>::template apply( ar, tuple );
++        serialize<Height - 1>::apply( ar, tuple );
+         ar( CEREAL_NVP_(tuple_element_name<Height - 1>::c_str(),
+             std::get<Height - 1>( tuple )) );
+       }
+@@ -116,7 +116,7 @@ namespace cereal
+   template <class Archive, class ... Types> inline
+   void CEREAL_SERIALIZE_FUNCTION_NAME( Archive & ar, std::tuple<Types...> & tuple )
+   {
+-    tuple_detail::serialize<std::tuple_size<std::tuple<Types...>>::value>::template apply( ar, tuple );
++    tuple_detail::serialize<std::tuple_size<std::tuple<Types...>>::value>::apply( ar, tuple );
+   }
+ } // namespace cereal
+ 
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 6ad20d6370..c2ab0d61b8 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
            file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch \
            file://0001-cmake-Use-idirafter-instead-of-isystem.patch \
            file://0001-doctest-Do-not-use-unnamed-class.patch \
+           file://0001-Fix-instances-of-Wmissing-template-arg-list-after-te.patch \
            file://run-ptest \
 "
 

