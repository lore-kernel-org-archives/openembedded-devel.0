Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9454EF513ED
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 13:46:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9175.1772891191261829602
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 05:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hZUZm/Z7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so122179025e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 05:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772891190; x=1773495990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhuZtLEVT8oRKoslC5LGQnTU2Q18ZTs+o8oHv3OWRIQ=;
        b=hZUZm/Z7fvYNyR/SIdOqcziwBLATJMf1nHZc1c/HwEMLOOksSc4jALpusrcX5LcSIQ
         FHkdJXrql34jgOzIhdlFvW551Sh7gnzStdQwSx62+gsMk1P3JV/jcQYCgdS1K5DVvgin
         pwVrrwXOAigeNdGC4SbNw3VpPxy0V+SNhbcK1F98eP8xQNDS3bh5dIk7V/CNeV36Gve3
         BhhvWVbElN7C8RnkXBYxy7jdXPB+JnJDmbf0l9U1nS5dfhv9faT9YS+yOH/i33j2JPR2
         7Z96tLT3bEx2OeIRuwNUeuJaAf1HOoOqr1WFd2Aylv151vuWUOSIntKW/ggZUcMfDfD/
         IMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772891190; x=1773495990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhuZtLEVT8oRKoslC5LGQnTU2Q18ZTs+o8oHv3OWRIQ=;
        b=gpAjQ+hG0PA47unupp3EfQXqlC5LUgwjCo/ROK9hTLxYw317WwYRpEgZSKufLBM+KH
         yra2EetNN+dwP5ly2tHgBeID6twO2lAzW/ZfPo50V6fsshe+M6eLg+fw59Rap67EJMVg
         IzjrpB71cyEu/SZ5vKigtHbnK/oVvJC9Fi7OM1nMpuzcwkuxLDac6oZTxhlhvZml1LeK
         q8JPUfkB466zSvrUyXG+B/CjmzSmwLe5GOVRjaKCMOjgRF6dCXSvX5/Dt9U6+cB6GwmJ
         lBxEmbGhcZqjpQMkA041zDdC2R5RSmqLGHW3WxvsQBS0m5UyG5PwbmTD4+wuecQSOGMO
         jcNQ==
X-Gm-Message-State: AOJu0YwZwr7cQYMXzLYvGsid32sCAQwjrM+hENlhswBM7GjwaoIVjHrU
	m/cvLpEobyD5A1/RBLv0xTccXhX8pe0YSBj4euFNpL9EicThKHqou19G7TlYRg==
X-Gm-Gg: ATEYQzwIPgkXhmsK78csCYAvJcEBFBWhBZCf30W5sFXxHZlhvYqOkbiJ4WaYZaKwbuF
	mM4NTrQ17PQn+hmc1vy9PQVFL4O6jfqHvul80nGhTiSFPzCgw8frmy8v6jnEeRhRsqICwxduNsv
	US/nkW3CFeP+drMz8ZvAtsSdWwPDDHkZ8e007CUY8WgxtJ2rN1VzvaB2epeEEab8d9/3Wt9oEPU
	OEw5wdiuu581DHXXEhxyktIiDgpsXtwWA4I4HD1fZfUAobsRKrBUytmsOgEbHbUkCuKFD6eeEar
	PMXKbUT3LuyuIt19rrM0E9Oya3tUimzUVnUhqreozvmPbHAl1P8JDDQMKdJY2ZA8ZiWCbLCCIOm
	fA5kFTNuaJ2XS3yyIHVhN55UeAxRn8jg1mjdg49UsizGDVVeaTa7i7fD8QGLeUtTJw8pSmPzDjm
	AoVEAGp8QA68dFx4dK7vpM
X-Received: by 2002:a05:600c:a117:b0:483:7eea:b185 with SMTP id 5b1f17b1804b1-4852695aedemr72841745e9.16.1772891189460;
        Sat, 07 Mar 2026 05:46:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad27e6sm211907935e9.3.2026.03.07.05.46.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 05:46:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] curlpp: upgrade to latest revision
Date: Sat,  7 Mar 2026 14:46:27 +0100
Message-ID: <20260307134627.4068333-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307134627.4068333-1-skandigraun@gmail.com>
References: <20260307134627.4068333-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 13:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124931

The last release was almost a decade ago, but there are quite
a few commits that were added to the project since that.

Instead of waiting for a new release, use the tip of the repository.

Changelog:
https://github.com/jpbarrette/curlpp/compare/v0.8.1...ec1b66e699557cd9d608d322c013a1ebda16bd08

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...id-conversion-from-int-to-CURLoption.patch | 36 -------------------
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |  7 ++--
 2 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch

diff --git a/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch b/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
deleted file mode 100644
index 1712a53462..0000000000
--- a/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ebe9144fdfdc8154661b93322cec4a1c43aa75ff Mon Sep 17 00:00:00 2001
-From: alperak <alperyasinak1@gmail.com>
-Date: Tue, 1 Oct 2024 19:45:38 +0300
-Subject: [PATCH] Fix invalid conversion from int to CURLoption
-
-Options.hpp:281:74: error: invalid conversion from 'int' to 'CURLoption' [-fpermissive]
-  281 |         typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
-      |                                                                          ^
-      |                                                                          |
-      |                                                                          int
-
-Fix invalid conversion by adding explicit cast to CURLoption
-
-Upstream-Status: Pending
-
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- include/curlpp/Options.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
-index c705c9d..7c9a501 100644
---- a/include/curlpp/Options.hpp
-+++ b/include/curlpp/Options.hpp
-@@ -278,7 +278,7 @@ namespace options
- 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_LIMIT> LowSpeedLimit;
- 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_TIME> LowSpeedTime;
- 	typedef curlpp::OptionTrait<long, CURLOPT_MAXCONNECTS> MaxConnects;
--	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
-+	typedef curlpp::OptionTrait<curl_closepolicy, (CURLoption)CURLOPT_CLOSEPOLICY> ClosePolicy;
- 	typedef curlpp::OptionTrait<bool, CURLOPT_FRESH_CONNECT> FreshConnect;
- 	typedef curlpp::OptionTrait<bool, CURLOPT_FORBID_REUSE> ForbidReuse;
- 	typedef curlpp::OptionTrait<long, CURLOPT_CONNECTTIMEOUT> ConnectTimeout;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 25ea1fdefb..2f9f406b86 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -9,10 +9,11 @@ DEPENDS:class-native = "curl-native"
 
 SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https \
            file://0001-curlpp-config.in-Remove-references-to-absolute-build.patch \
-           file://0002-fix-invalid-conversion-from-int-to-CURLoption.patch"
+"
 
-SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
+SRCREV = "ec1b66e699557cd9d608d322c013a1ebda16bd08"
 
+PV .= "+git"
 
 inherit cmake pkgconfig binconfig
 
@@ -23,4 +24,6 @@ do_install:append() {
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
         -i ${D}${libdir}/pkgconfig/*.pc
+
+    sed -i 's@${RECIPE_SYSROOT}@${CMAKE_SYSROOT}@' ${D}${libdir}/cmake/curlpp/curlppTargets.cmake
 }

