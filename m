Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D20CC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 08:51:02 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.7991.1753347052705115793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jul 2025 01:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIv4z+Of;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso761770e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753347050; x=1753951850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=veQGhL5ATr/2vbP4WiBUOYOZLvBFTaG3frApdoHS5dI=;
        b=NIv4z+OfRUeCiPIVK5hmG4NmtV8Wg6cuUfmytYBIJhCs9V+8Y8LnGGVTVhNgaZbJK6
         h5CGw7z98z/Gfm/at8XloTFUD9SaLPLSwCKeZPcmRYFQB14p1a4fWj8u9w0ei4t7j8s/
         81Kvn/ZkvTutENp97060u7TMXB+QsfQSnQJ1z7pvwVmnFBAO2GUP36rd6kQ6MfYAQ0OH
         GcozcDmDKOvI8TjtOL5qtuVBdJ+tCFGAHtyFZgsZsIBUaMS9o8EYrldhwBV2FENab/Gt
         6E1M3SYC+a8L3uRzSXJpAOSKgzuYnJyWSuLqOvc+JeIcglroo101wIjMpzCbc93JxX7y
         KYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753347050; x=1753951850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veQGhL5ATr/2vbP4WiBUOYOZLvBFTaG3frApdoHS5dI=;
        b=Z3a29gQOOnuLjqqGUAdtuaLkZJVxsgNxN5GfJGdKSmbYtlhQ+wsD09JtUsmcLP/3Yn
         bfPDxSZkY5Vle3gHlBLkirpzMjt70Ca6+dMmGu7knAeOvBRlMp4rjr75B4k4nvA2iMrk
         LcWMpq0KFmHxEB+uzMi+uyozQB3QfEQmGfd6CN9MmrH0SPCgNLqjN+4Tf3RBnMSlhoif
         635hom8Q4MplBBWlByilBNVycsZaK0d8jjWXMGc3Tb8+YoJsXsIiFAIyj/rWAsjEJXZe
         x+2EXxDlJukVmvi3njafE14dSi4aMoyjzR2HArd9tqqa9ucACHkNdIv+WGCh8ve29Q7S
         5Pkw==
X-Gm-Message-State: AOJu0YwPWIQj8rxUSmxnkBIioc6/VCn64IRP2C78prRPB3mwxGNcBObm
	ddGBcGDi6YZe7oUixOsrFeoUUn+RmwE5jO2vAZSW9ZnPPhz/pWN6i35yOzSBKA==
X-Gm-Gg: ASbGncunWIXmH1lT08CUqLiQKxz8SqTh4qlJO0JbyHserxikefzdJZpyYxqMKem97Y+
	aPzHfKaSdxiEWvoktom3cdohC8CRs+y/YK31crxFrZ54K+K6uOnK7wCt6JrJQkSKnM3fBD9RAFr
	sN1jH25dD7Orc4kNjSjVKtq6VZ8RzJwXddHB7FBEh9l+R8XMdDdUy7b0SrIM7E4lCaZ+JYOW1MR
	MIxKiaX3b/rqNcBcdDnP81cmGSEuwKHC3RstjZDOei7GdU6lEo/dVw2Cy0eX8S1I7D0w+3CQ0tE
	YivrgttfjIwnGxy60+O0rmzBusTCUHJfOtnLkv9rvQSok6tXdWNCl5B7FbC5tnjnRz01c0Vq7Zi
	fCigI8SpZrgT7TYD/FQJj7Pu7AUqLLSC+pCV0hw==
X-Google-Smtp-Source: AGHT+IFtUY3RE+QmOZL/4Czbljiwf3gU2lS31o/FqbAcJmuwfXXxQ9nvlHdUC9vLdujZLOvxzMuuAw==
X-Received: by 2002:a05:6512:2344:b0:55a:5217:4392 with SMTP id 2adb3069b0e04-55a52174587mr1648195e87.53.1753347049852;
        Thu, 24 Jul 2025 01:50:49 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b223eesm255555e87.27.2025.07.24.01.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:50:49 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] avro-c++: Fix build for 32-bit targets
Date: Thu, 24 Jul 2025 11:50:41 +0300
Message-ID: <20250724085041.41796-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 08:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118721

Building avro-c++ for 32-bit targets currently fails due to the following warnings being treated as errors:

- `useless-cast` in Symbol.cc
- `conversion` in FileStream.cc

These are promoted to errors because of `-Werror` in the project's build flags.

Fix:

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/parsing/Symbol.cc:91:27:
error: useless cast to type 'int' [-Werror=useless-cast]
91 | adj.push_back(static_cast(it - rs.begin()));
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1plus: all warnings being treated as errors

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:208:41:
error: conversion from 'int64_t' {aka 'long long int'} to 'size_t' {aka 'unsigned int'} may change value [-Werror=conversion]
208 | in_->seek(position - byteCount_ - available_);
| ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:209:22:
error: conversion from 'int64_t' {aka 'long long int'} to 'size_t'
{aka 'unsigned int'} may change value [-Werror=conversion]
209 | byteCount_ = position;
| ^~~~~~~~
cc1plus: all warnings being treated as errors

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/avro/avro-c++_1.12.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.bb b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
index 726a861bc9..61aef88e13 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.12.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
@@ -26,4 +26,16 @@ do_configure:prepend() {
         cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
 }
 
+# Workaround for 32-bit build failures due to -Werror:
+# 'useless-cast' in Symbol.cc and 'conversion' in FileStream.cc
+#
+# A patch has been submitted upstream: https://github.com/apache/avro/pull/3433
+# Once this or an equivalent fix is merged and the recipe upgraded, this can be removed.
+#
+# These errors don't occur when using Clang accordingly to upstream configuration and
+# the workaround flags aren't recognized by Clang either.
+# To avoid unnecessary warnings and keep the build clean across toolchains, the flags are conditionally added
+# using the toolchain-gcc override. This makes it unnecessary to override anything for Clang.
+CXXFLAGS:append:toolchain-gcc = " -Wno-error=useless-cast -Wno-error=conversion"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


