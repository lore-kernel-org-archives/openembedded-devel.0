Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26033C7EE2E
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.69129.1683477197108771009
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hvLcREMF;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55a6efe95c9so53779127b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477196; x=1686069196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J2UQXIYvOTOtFPcP8Zm8ZEw97NIPEB+b5xU4TNnPrI=;
        b=hvLcREMFAa8gibVym8ff7hki1vjnoHxZ8BmKxvPRZV8eD+GVdX97AWS4vU5cYTTNDd
         okGQlQ6Yq8A+/yWQ3HW0MOBz9MCUFiUfRv4ZxUDiMSbOqLKBFaRkqFCUI8csdNg3hgez
         Hl7RgqpmYkfzH5dEXy1oEf6QD5iTO/slMrhzvArOo1Bj+JSZ27ksvxjn7MDUs5F7DpDF
         CUfHEPwSI+PQcZCjUgIFYkwR5Mhb5mx95PciOuytPHOYYOEOi4Qtuq3kuKOhyiF+63e5
         nNcHosFTEbfgimpQ98ItRUdeOY93yIFnpMLSoBqtAw2pyeKSaqKCHiy+X/ypsvEEnyOZ
         q4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477196; x=1686069196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J2UQXIYvOTOtFPcP8Zm8ZEw97NIPEB+b5xU4TNnPrI=;
        b=WJqIAnyYsqrQf8jynwqUgh3QWS4KIOwEZr7tl832RJadZCdQBH7g9GeDGM7aKcYBAD
         y00/1bWj55r6Mb4qP2zQv5F3CDzKwQYLS7eDn6grmk+n6KRq9L6h82juWkjOthi7Exka
         nwODHASSE7aVKLxLmhUGrJg1Rq5PbjB0slXUsinoSPptqijZwKjgmaVCmwIqOGb6PriB
         iYnf1M9edw5xoV5Tl/fy6axoTWyKYEWKxJThj0rkksSt2CEHiRkoejEheMmAvtDy3Am5
         YzasM2X9hakh5dJvH/EceCe9sTuXE/DRdG8RYUHYLxl49WPyBdIzmeMgEFn4Cf9qwZx9
         NOUg==
X-Gm-Message-State: AC+VfDzZjAYB+njOVhH2WKnvQba/wGVzJTvhtQ2Csi/joSJ5/gpIYnpF
	e/0y0fiH1CToELB7Zw2S2AyQuOGmiro=
X-Google-Smtp-Source: ACHHUZ6rf94YKa8YgcQG1547+ZyaPZBDdWSevpgcK6Ni/bRkt7mZTrnYUGwem7i5B5o+OnGtLsa65g==
X-Received: by 2002:a81:9256:0:b0:54f:b433:333a with SMTP id j83-20020a819256000000b0054fb433333amr8706146ywg.1.1683477195881;
        Sun, 07 May 2023 09:33:15 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 10/29] libtimezonemap: Point to a working SRC_URI
Date: Sun,  7 May 2023 12:32:46 -0400
Message-Id: <20230507163305.3261044-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102340

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a3aea0b955285cd5e2898c6ca3874861667573b8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index d633b0621d..00d66b418a 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,8 +4,7 @@ SECTION = "devel/lib"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/libt/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[md5sum] = "f85a21994a397fb1ff2d3ec404bdd592"
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
-- 
2.25.1


