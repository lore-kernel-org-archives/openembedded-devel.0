Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8B1C43217
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:29:05 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.7549.1664864939738313986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=3xogDTb0;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.49,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f49.google.com with SMTP id u10so19619083wrq.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LYb5xbRJXtOYnxdayn6ae0NZ9tRjNwYQayZa2hUcPJY=;
        b=3xogDTb0Idoj4oq77ZF59J2pg0LNqOrsG2LKqq5/1kwuWTpPahFpgDvoio0eRwafMx
         iItqLrTu1Sb4kZhOsEgUUy73UVsmeQqS99OO5BM3DFoxwuhI3sJoB0CwFtCDyim3KTS+
         oMha95hOjUBo6QJAjlcRRtJukj70iFm+QDSWNFqHwBVWf5ZKvTx0yjwMadlPBx6hVN6j
         x7DdavUDt3stzUXpwJkbKx/AcYUTjkEVdRN7nmse7u/zqVPgmD8lGjEtR7vwLqVKK5kD
         i5/r6JHizkulEFbhRyYQvPkFhsoXMOa7zTuZCRzPb7a+w/bLLkwBEbM23538CULi/jJL
         C5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LYb5xbRJXtOYnxdayn6ae0NZ9tRjNwYQayZa2hUcPJY=;
        b=S8lpXIkWgETTow5/csq4/82YKER1SsE822+GTrcuOP1geCtbEU8docchvtnRkifCvu
         z7j2VpZ4MW7BiELKClkl/uZmKBZzFSht9Epm+hnv4e5JAuZFl0/yFghIsdWxG2xUBycg
         bVbV9MW7E168SpJIkpZ72F1eR1BztbA7ezoLhPUzcsJjLex3Kx3FAjSoVnhAvwoXB4yC
         ftB7JxOPYe4mUZMUdV6KyxFjZ/t5aHDXtr7ldUc1lKZKEFYwRMR5BXh7IqRqKOXacZ7p
         vleOzWHtL8waQskhnnK1NKB9raWqSitZk49LpRdaoWLT3B7DQfxyoZnn+k/htgYoew0o
         RXUw==
X-Gm-Message-State: ACrzQf1PWBJ/wPEZnzkkJMP5OiZLca0xP6DmopUpeumKgNoctR4I1GEw
	uwWbP226IcBW3n3URUPxvFPjzp8Mc0lErnv1oSY=
X-Google-Smtp-Source: 
 AMsMyM7/exNws+7KwZgpWhaH3FZuoO/hWiu4Mv9Fbpi8H6RB9rrvYyNmaZqZ7pB1gKZb887ILoNrxA==
X-Received: by 2002:adf:e10f:0:b0:22a:43e8:969f with SMTP id
 t15-20020adfe10f000000b0022a43e8969fmr16094200wrz.292.1664864937891;
        Mon, 03 Oct 2022 23:28:57 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 l22-20020a056000023600b00225239d9265sm11993296wrz.74.2022.10.03.23.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:28:56 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][dunfell][PATCH 2/4] mbedtls: Update to 2.16.12
 stable version
Date: Tue,  4 Oct 2022 08:28:41 +0200
Message-Id: <20221004062843.2541778-2-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004062843.2541778-1-mbriand@witekio.com>
References: <20221004062843.2541778-1-mbriand@witekio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 06:29:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99051

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.16.12.bb} | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.16.12.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
index 0ad1e02630a8..adb8e4a2c994 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
@@ -18,13 +18,16 @@ understand what the code does. It features:                          \
 HOMEPAGE = "https://tls.mbed.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=d32b51202e173d9e438ca20f008209a1 \
+    file://apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    "
 
 SECTION = "libs"
 
-SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
-SRC_URI[md5sum] = "1f629a43c166de2eca808f3e30aa961d"
-SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770"
+SRC_URI = "https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/v${PV}.tar.gz"
+SRC_URI[md5sum] = "f3a7b041c43b35c883632a1773bf61a6"
+SRC_URI[sha256sum] = "294871ab1864a65d0b74325e9219d5bcd6e91c34a3c59270c357bb9ae4d5c393"
 
 inherit cmake
 
-- 
2.34.1


