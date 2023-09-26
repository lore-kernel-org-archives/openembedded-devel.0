Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53356E7F12C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:18:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.3013.1695763126084045996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6zVI2HA;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-578b4997decso7626552a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695763125; x=1696367925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi3/U2Ph41QNiYSj/dZrzSMZGtR5VRB3SlWdnd4QH5g=;
        b=L6zVI2HArn8WHIUnqbQqqNZUqB1wPM4g0VJjuzp+l8Vj3VPyBidf95gs4/relJODlj
         vleVJriPPuwpzj6wrWvCduXlFp3rEwTupniLIynEjM3dwV24PEVzy0CJQhcIVdouN6uo
         hIAgDJEwkN4yvYAU7OEdVuhp7fDRmGntUE6QQMT36QpTKphE7bB1elEyJJdjpjjZL7bS
         oVc7upRfphw1dpuF2fif0YVV7RmvE3JSpnQJ9GYDUfz3HXbcbTBb1NsNYqKtbhgtp7XF
         rtaQvh95yfLGT/PncQ27vWnYndYKWjgyxp5VoBxQ21BzKhK6xKLFOdtcnrhPHjjtfe/K
         nqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695763125; x=1696367925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fi3/U2Ph41QNiYSj/dZrzSMZGtR5VRB3SlWdnd4QH5g=;
        b=Vj9eOinZLVws08EPVeW1Q+oUL0DRoYKQrwxNb17mgLarMClj8sEpfAhUZTnxgWEtsL
         RVB5HfZx/puKL4drr+EGX3D5T3f3SkMTtHYWm0XKblOtnv1RAtwfnTPNr7+J1z/W1bAD
         FsESNmek9hHQLH8j63Fj/3pxYsVtO9TC5SiG0uBywgxjkN8MPGZqrGSjU5N0+5+YTNeo
         ZM0s6BkfNra2kxscO8oyzuM2KPlLpX/UBAisQhsyJZNEPir+ic1ZNXmmzTy4Nxh8l78A
         8U1Udb0OolBQuvPZfT7ywg2lCMJ116c9KB2GUraVBcfA71/YSrGxGdYpAJsEAArRoXmm
         aC4A==
X-Gm-Message-State: AOJu0Yws6MAhc8CtgXN/3fTguh5NoQBOWk5o3+hB7rM+cAZ0fisCDwnc
	aMBKp++0HRHVgWCIG9K0Z0tNSmRVW6CpNg==
X-Google-Smtp-Source: AGHT+IGG/JhmOfZV3zoXVNmpNPE9nCWItebYgLLlY9qr+Rmng/kCrX3QQoOYjQk6Ms5NPGCR5PEkrQ==
X-Received: by 2002:a17:90b:1916:b0:26b:c3f:1503 with SMTP id mp22-20020a17090b191600b0026b0c3f1503mr10833532pjb.17.1695763125289;
        Tue, 26 Sep 2023 14:18:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id f18-20020a637552000000b005777a50c14csm10069865pgn.0.2023.09.26.14.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:18:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] cpp-netlib: Fix buildpaths in generated cmake files
Date: Tue, 26 Sep 2023 14:18:42 -0700
Message-ID: <20230926211842.4168206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105150

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
index b2bdb86c0d..bda5177fc4 100644
--- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
@@ -23,3 +23,8 @@ inherit cmake pkgconfig
 DEPENDS = "zlib boost openssl"
 
 EXTRA_OECMAKE:append = " -DCPP-NETLIB_BUILD_TESTS=OFF -DCPP-NETLIB_BUILD_EXAMPLES=OFF"
+
+do_install:append() {
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/cppnetlibConfig.cmake
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/cppnetlibTargets-noconfig.cmake
+}
-- 
2.42.0


