Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C404CAC5AD
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.10160.1758189216240539440
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UmDwuq1B;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so1268487a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189214; x=1758794014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSi8UsOq3u9uoDvwYCVzxZplH0BhGHJTrVUAgT1qeog=;
        b=UmDwuq1Bmg7NYcs0PWa/28mzAm3Eqx1O/T9NXrtT97caqD+LfeNiU7WaKfdPRx0yYR
         jHKJCCK1/3UBrXQYWhPnis9SnOFb9JhmAvtdc1XKyPc4bbs5tA3SIt35PSuw8ol5ddR9
         Bcz6neHu3Y+72eISl2WxCazW42yY/7ZNsn/8uhfuPcKmziZUEgpT8vHAq1QWlLnrWHjk
         6g75y61SWJD+kgM9FeAAz/sZ0R5mM7knGGcN4jq7J87qWO0Gcvm1eti0QkoWBLtkX/TH
         YviNC8+Ux0ha1N+fJMtwORrTtAmO/9ea2JM0aFijwtSAa+2WaFns9ggfWwwxV1eMfKPj
         36tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189214; x=1758794014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSi8UsOq3u9uoDvwYCVzxZplH0BhGHJTrVUAgT1qeog=;
        b=DYQR1Xg3k8ijjIVjiIrREld0zR5GxCiLZMKh2CKzzobXFQ+3oJoLLeJU5SiAJ82Tts
         fXv+08uBfHatPg2c0gx2MUTN5XiBoKc2MaBIZx/Mz4eHWOTnt7pCSl0NbWrVOxKK8jgY
         VIZla97N3gULxwajctLjt1Ton0wgjpVkviJNwoCEqXTyh46F+2k3/LUS9shJBD8XmG2o
         BpjRabRHLVaHrea+xAk/br0UHRhieOsaYaL3eEdkm8WhOg5mtu+LXUlOeMbUpJDLcw+X
         e14yzXj1zHLu8CIWaOjm+2wyQbZoip2swB2BwIMQdtsaNGkZpXH0h6WnKjHKvq0jP+7m
         aFpw==
X-Gm-Message-State: AOJu0Ywu5YE0BX2/GClx0jVr93/Pnu1L85qF+oSZPHtCslXxxJr6x8+8
	fwWQeAumLcjikpqLzD/AXURNhexLu2km+wL/Bw99w+/wxIbxtV/4HhTUZQ5dbw==
X-Gm-Gg: ASbGncvOebkwo0Z/+rN2exfFIw4VqXzyuoinG4Vex3d1doaFqI3vgqR6DWPv4GJ8V6+
	cieg70SZ4WDKAXwMhiAzgfrN1EGX/ILONEsiCRNEmOJMQ7Q/JEoAx5fgngqtQPkpIU7dqifq717
	Qmgz8qhJ6zNY4OVVtv4V5o3oFRypHqAezJUClNbEEOeR4f9YxfDCIF8yYxCZHGiVUOg/jUUYEYi
	1sBmBzTq6BZea49aVyInWalJeDLk9ULUgmbNWV4a+HqHt+MeYK8R0JADVGWQFpoJqv3E8IZ+47c
	7clWJ2kPXMQUnFFX0TzA8ol/VTvsVnhDE8bti8e9w9hBz7sRJ+794WDvgY+XHIEc9Nj9emJPDZh
	OTcoiWl8BW/R3GhvBJyRXzSC+ZfMmpE+wkKuZCgk=
X-Google-Smtp-Source: AGHT+IG/47onCiBLUhoMkH1NgqA2ZDJlhds5+tDm7NXeLRNXILTchH782/6/XxRTHkgQNGrX/RgZww==
X-Received: by 2002:a05:6402:510a:b0:62f:4f44:4f5c with SMTP id 4fb4d7f45d1cf-62f84213d59mr5589778a12.1.1758189214451;
        Thu, 18 Sep 2025 02:53:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 02/10] catch2: upgrade 2.13.7 -> 2.13.10
Date: Thu, 18 Sep 2025 11:53:24 +0200
Message-ID: <20250918095332.3369767-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119543

From: alperak <alperyasinak1@gmail.com>

v2.13.10:
    Fixes:

        -Fixed issue with catch_discover_tests when there is multiple of 256 tests (#2401, #2503)
        -Catch2-provided main and wmain are explicitly marked as __cdecl when compiled with MSVC (#2486, #2487)
        -Improved break-into-debugger behaviour for ARM Macs. It should now be possible to step execution after the break (#2422)
        -Replaced deprecated std::aligned_storage (#2419, #2420)

v2.13.9:
    Fixes:

        -Fixed issue with -# (filename-as-tag) flag when __FILE__ expands into filename without directories (#2328, #2393)
        -Fixed CAPTURE macro not being variadic when disabled through CATCH_CONFIG_DISABLE (#2316, #2378)

v2.13.8:
    Fixes:

        -Made Approx::operator() const (#2288)
        -Improved pkg-config files (#2284)
        -Fixed warning suppression leaking out of Catch2 when compiled with clang.exe (#2280)
        -The macro-generated names for things like TEST_CASE no longer create reserved identifiers (#2336)

    Improvements:

        -Clang-tidy should no longer warn about missing virtual dispatch in FilterGenerator's constructor (#2314)

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1bdab916b1fd70ce9196aedac319df5dd8b6dd15)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-test/catch2/{catch2_2.13.7.bb => catch2_2.13.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.13.7.bb => catch2_2.13.10.bb} (93%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb b/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
similarity index 93%
rename from meta-oe/recipes-test/catch2/catch2_2.13.7.bb
rename to meta-oe/recipes-test/catch2/catch2_2.13.10.bb
index ed50f659d3..85403e3686 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
@@ -6,7 +6,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x;protocol=https"
-SRCREV = "c4e3767e265808590986d5db6ca1b5532a7f3d13"
+SRCREV = "182c910b4b63ff587a3440e08f84f70497e49a81"
 
 S = "${WORKDIR}/git"
 

