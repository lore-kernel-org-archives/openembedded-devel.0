Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A7FC6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 11:05:23 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.4156.1676631921281561330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 03:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=NE03UiIJ;
 spf=pass (domain: norberthealth.com, ip: 209.85.208.52, mailfrom: roger@norberthealth.com)
Received: by mail-ed1-f52.google.com with SMTP id dn12so10577325edb.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 03:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIIxBMM26dHWcsXBlFfKKAYGdjrmu1XVKxjZlchdyL4=;
        b=NE03UiIJx3usuu075SZhdfmd2DavsZidbpak/h+46du2rD7gn3Dpxlv56jzDk/8XeN
         2CPRQijz/KUd0OAcxETpEcaBhS6zDOrB7NcdC+7hkhB6rV5YrFhJFXLpK4TQvxfqjOjK
         eQ+ElTC+uxYH4imvfWKJtA7Zjr5aIGxLVGlRNl9Ofyk6zdI+ht5S0iTbNJ4/4jCoLluV
         gu55NDdmKk5Gk9FQvnGeyWmN0nWiKEj1bYhCY4jLOTuxhy0+ZnoVrHq+sEXt7B15AmDz
         VAzRLYGOQ2m3iGdkrOr3ux1IBaAOslhbI/s/Iwsr8gYJUWrrgkRzD5BZ96fcy2nAXCMp
         fDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIIxBMM26dHWcsXBlFfKKAYGdjrmu1XVKxjZlchdyL4=;
        b=ee19TBhxdNI7BsZaWPHM5OcU6ciFDcu1s1u4aOqvOZxOfeMjiMssRLxxMPXfRbVZg/
         TJC17Wx0uK/1tszLx1xeT6+2dtB2jrR118loByhf01kagZ3y2Mm/tJrHs3xKX5QIpXUC
         CyCUzCWQ0czp1GeNRIDhHjflN56oIQ7IfJc66PZPIzQhJ1RpKt3vFXlMtSuSrRlCZJpC
         KynBkWUqQrQj9B4gPjxDzYg0fa7rDdHfockma1UkjZH7aD42NZMn2oyXFxyQ67jWdeRV
         arTikoYUhJ5hiH2LzswPh5ilNXpg6dkLpHuvvA7ZRDzhc1tmpLzdRNuk0UyIM8oAci9B
         rS1g==
X-Gm-Message-State: AO0yUKUSArPfh3oJvF0fqXPJy46zjQGBLhxouCpBuGvX/Pr6Zmui3/TC
	76fOqbz8Yw0AZzKim95f7fz367Hu99rEl0zqmnWmdg==
X-Google-Smtp-Source: AK7set8QvWn7xli6P/lo0mu8JmjMyq43MKf2zyug8xHk1oTWIZrBJXc8m7M/B36p/ddnHvRiHYViOg==
X-Received: by 2002:a17:906:4d81:b0:870:baa6:6762 with SMTP id s1-20020a1709064d8100b00870baa66762mr10137343eju.14.1676631918961;
        Fri, 17 Feb 2023 03:05:18 -0800 (PST)
Received: from localhost.localdomain (196.162.185.81.rev.sfr.net. [81.185.162.196])
        by smtp.gmail.com with ESMTPSA id v6-20020a17090651c600b008b175c46867sm1502606ejk.116.2023.02.17.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 03:05:18 -0800 (PST)
From: Roger Knecht <roger@norberthealth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Roger Knecht <roger@norberthealth.com>
Subject: [meta-oe][dunfell][PATCH] zeromq: 4.3.2 -> 4.3.4
Date: Fri, 17 Feb 2023 12:04:52 +0100
Message-Id: <20230217110452.22833-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 11:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101121

Fixes:
- CVE-2021-20236

Patch changes:
- Refreshed 0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
 ...eLists-txt-Avoid-host-specific-path-to-libsodium.patch | 8 ++++----
 .../zeromq/{zeromq_4.3.2.bb => zeromq_4.3.4.bb}           | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb => zeromq_4.3.4.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
index eb3dee4d3..31f652922 100644
--- a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
+++ b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
@@ -19,8 +19,8 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -1210,7 +1210,7 @@
-   target_link_libraries(libzmq ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+@@ -1440,7 +1440,7 @@ if(BUILD_SHARED)
+   endif()
  
    if(SODIUM_FOUND)
 -    target_link_libraries(libzmq ${SODIUM_LIBRARIES})
@@ -28,8 +28,8 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
      # On Solaris, libsodium depends on libssp
      if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
        target_link_libraries(libzmq ssp)
-@@ -1240,7 +1240,7 @@
-   target_link_libraries(libzmq-static ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+@@ -1485,7 +1485,7 @@ if(BUILD_STATIC)
+   endif()
  
    if(SODIUM_FOUND)
 -    target_link_libraries(libzmq-static ${SODIUM_LIBRARIES})
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
index 02a4c04fd..4381f2d6d 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "2047e917c2cc93505e2579bcba67a573"
-SRC_URI[sha256sum] = "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763"
+SRC_URI[md5sum] = "c897d4005a3f0b8276b00b7921412379"
+SRC_URI[sha256sum] = "c593001a89f5a85dd2ddf564805deb860e02471171b3f204944857336295c3e5"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/libzmq/releases"
 
-- 
2.17.1


