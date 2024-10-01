Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45778CEACED
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:58:01 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.86925.1727801874755570665
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IelyDq8D;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a90349aa7e5so849550566b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727801873; x=1728406673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=updgrKJqZVDvkOVNuCnj9XLxx2WnSBfBhN+eAOEbfT4=;
        b=IelyDq8DBgYuHyrjX0A9T8gxgwJquO9X+bL5QDaKpY+DfX6wxYuLJuGL9p+FeY/DaU
         XklLhRh/jJikqi+WwzpqaI5hcC2+mLmv4ifVQjtvXGUZgDSDRV0796zJyaju+k5bF8gS
         Wion0TRrXHqjxLJBBiaUcsO0Ky0PwMoPP8jW2NfeoD75AnjrMT6Vm3tJeOwbvXin5ioS
         uBvZvGqHC5Dd4rBU7hXvUEDfuZXYObvieVCLKLYq/JGb5S8Oj9G0mb+catxcSgM3JpfI
         Va7YU0QFzcHpdf7CwdNJP8RBJvhdaJaZFXRtiYTrLuv4sptHStaQdKQ+18FHLM+9WyS5
         M/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801873; x=1728406673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=updgrKJqZVDvkOVNuCnj9XLxx2WnSBfBhN+eAOEbfT4=;
        b=I2QbycGqO631XTF/JDHqaRSYc/l4EoHqZBSxbZxojD1HEeiy/B3THNElGdtOaPag4N
         8lGTs/Bm/I30zpan6d1R8yTBFZYpmNZwWxPkm8TStNcbPZ2iG40NEpzpSeJYj/y56VyH
         NS1u7IV3OoOOqx+lyWX6Yb+vRVCgHEJxTagbY9LRMT6uOVs46gnz4jPRApcT4pldCqB2
         +jWm0NZ1T4f6/UK9VB3hDRDBRMOWZEYvQ494lJSMi/zNideQf9CAn4nFebAOPiwREe7O
         dV3JcTY9xlc6NxvOuvSCkkdwRBUDMymRLg3//v3kk1K4fn26jKVg9zu0v7uYdgUbMHEo
         xyKg==
X-Gm-Message-State: AOJu0Yx2H/ZSMheeJDLRjXWDeDFInm8d1N0yajFMmvzrpFp9wbxl2Bwl
	03rvbHUZUgTF6Ugc/s6vEAmer/Zjvh8tTbyibsUusRuDF2iZBjKswIbsxvBUv+w=
X-Google-Smtp-Source: AGHT+IHVTcHa86phvCFp7lC3bSnhLXqfwpE61vmdOrbv1ombiWxSpxu/sTwG/qSC5KqJmg9g7gXDtg==
X-Received: by 2002:a17:906:7949:b0:a8d:2faf:d33d with SMTP id a640c23a62f3a-a98f820092bmr25680066b.9.1727801872551;
        Tue, 01 Oct 2024 09:57:52 -0700 (PDT)
Received: from localhost.localdomain ([176.33.71.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299e5bbsm741575366b.215.2024.10.01.09.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:57:51 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] curlpp: Fix build issue
Date: Tue,  1 Oct 2024 19:57:43 +0300
Message-Id: <20241001165743.1061735-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112636

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...id-conversion-from-int-to-CURLoption.patch | 36 +++++++++++++++++++
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch

diff --git a/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch b/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
new file mode 100644
index 000000000..1712a5346
--- /dev/null
+++ b/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
@@ -0,0 +1,36 @@
+From ebe9144fdfdc8154661b93322cec4a1c43aa75ff Mon Sep 17 00:00:00 2001
+From: alperak <alperyasinak1@gmail.com>
+Date: Tue, 1 Oct 2024 19:45:38 +0300
+Subject: [PATCH] Fix invalid conversion from int to CURLoption
+
+Options.hpp:281:74: error: invalid conversion from 'int' to 'CURLoption' [-fpermissive]
+  281 |         typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
+      |                                                                          ^
+      |                                                                          |
+      |                                                                          int
+
+Fix invalid conversion by adding explicit cast to CURLoption
+
+Upstream-Status: Pending
+
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ include/curlpp/Options.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
+index c705c9d..7c9a501 100644
+--- a/include/curlpp/Options.hpp
++++ b/include/curlpp/Options.hpp
+@@ -278,7 +278,7 @@ namespace options
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_LIMIT> LowSpeedLimit;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_TIME> LowSpeedTime;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_MAXCONNECTS> MaxConnects;
+-	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
++	typedef curlpp::OptionTrait<curl_closepolicy, (CURLoption)CURLOPT_CLOSEPOLICY> ClosePolicy;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FRESH_CONNECT> FreshConnect;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FORBID_REUSE> ForbidReuse;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_CONNECTTIMEOUT> ConnectTimeout;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 131f1873a..cacdc9773 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -8,7 +8,8 @@ DEPENDS = "curl"
 DEPENDS:class-native = "curl-native"
 
 SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https \
-           file://0001-curlpp-config.in-Remove-references-to-absolute-build.patch"
+           file://0001-curlpp-config.in-Remove-references-to-absolute-build.patch \
+           file://0002-fix-invalid-conversion-from-int-to-CURLoption.patch"
 
 SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
 
-- 
2.25.1


