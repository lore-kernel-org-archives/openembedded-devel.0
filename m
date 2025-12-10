Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A0D3C90F
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:16:53 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16389.1765376207888610478
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQDPyGWV;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29ba9249e9dso96981965ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376207; x=1765981007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0A62RDy4XePkjPIWHwe3f6TytCVEEl15NqiLrlDjIe8=;
        b=cQDPyGWVGd0lDJeo0/2mqZkXohw8P36tc/NtDCVxrqaIs/Q7IFwkX0PX85CUhFinMy
         VdpD76vQyc1agmRE56LF32qs/9pqSqj4r7SKtlDAl1jTdgsp76kg6/3adzeBJnHIDmWr
         7wObiomC4OY45OJRV7OfMESQbTowCFJR9LlZeJinra47WB85rs5JwuzOD6gHjswliULw
         gLOqLudr2tt0ikDtW57akdeOHN84mGUnPBtvTdgVaJAvID5QDrih33FONBxLlFglZGvt
         K6jWo++UhjYGH46yPOlEhqls//6Is3Tg/8Zs+obFYBaDPb5a7nDhRArQb1zHhHKvUKNX
         AqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376207; x=1765981007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0A62RDy4XePkjPIWHwe3f6TytCVEEl15NqiLrlDjIe8=;
        b=BRPEkWbvYoo0eGris1qH3befz9Ur9Y6W+OG+yNCWLm/V7VplGabPejazt37Oaz1hdO
         XwINAb6whUWQY0lYI4NGYvJ5aongDM5/q3VJIcGxUTO2OWNM9awiu+dZl9aiTs35RNbw
         jbt1lg8mXUMlmSsBxqhyFOSmHsHwp+2sHpu/aU2zrUqRN5m0KGbnNm9HAie1TnB0vuF9
         yf8VV2i/r1ZuziuQLZZbqOZRQ9K2FeLD7anlzNFSQIU/+SkzvIM47cTD4EqqKXle7CXX
         FWtlHXl1MNpi721iy1CzkQSfKKUUM1H3QqDuJqG/vvuqZrWri1HIckgn7J289BXljnFU
         WD7g==
X-Gm-Message-State: AOJu0YwEpXNokO3Z3yXd37Eb2dkvD7Rvln20jhVxjOErq4HcqlO+v4Qv
	TcMHcGVan1g2+e9CScNzj9pWg0cLxEGQIZ1SwT61uE3WJrpx7TQHBrZf8yXa/Q==
X-Gm-Gg: AY/fxX6JFzD3bSv+WSm5Q7lT9d39oQ2UjVsmX3PK+Lo8u5QNbF4OfKjlrrVzeR1oHRq
	0YOizbpoHtGBPxYG8bPuoERF5NuMIt/8o2Z8PaB2SUqn8ak64nKQoI3p6xBRcG11idYHyEuYkcY
	3ll6GjdqXeyxMEXYXYDF34hostDIgVgITBZDU8NN3usu/34Wlw4mUzb/IPW6KGDahtmYzgo8BWP
	XnCYBnGbnScEZ5WuREd3vyvg3N48P+CPZWLDSUSi0ayj2boFYfCgnuTNQL4rMdKucbCEYxSRe8G
	MdM+LHAsOwjG7H5tEotdeIjd5Hwuh1KUEQX1glV8MDS5keRS8Za1iZmrph45klF2kSuAnbBfDu8
	CKjbPOWDwAtGqGnH6//i0zQRneDYVsMIInvDeFNHimbj8KMaklOcatH6mElzd3LeKUOuuaK8lml
	eiEZJchqgiQgh9aku8vb5U2LE=
X-Google-Smtp-Source: AGHT+IFJvI3l9vDyUuwQjoWtIDHWQi312pkPTDGeTlYSJ12Llcszijh/Q+YZ6884xIXPHG2pKbCVng==
X-Received: by 2002:a17:903:3205:b0:29e:9c82:a91e with SMTP id d9443c01a7336-29ec229cbfbmr27858885ad.7.1765376206918;
        Wed, 10 Dec 2025 06:16:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm15955166a12.11.2025.12.10.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:16:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 1/7] nginx: switch to libpcre2
Date: Wed, 10 Dec 2025 19:46:33 +0530
Message-ID: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122549

From: Hongxu Jia <hongxu.jia@windriver.com>

NGINX 1.22 and later supports PCRE2 [1]

[1] https://github.com/nginx/nginx/commit/c6fec0b027569a4e0b1d8aaee7dea0f2e4d6052b

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3e308aacb03631eb1ed27baad7fc28f21075e3a4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index bcc384bd8a..fe23eb397b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -9,7 +9,7 @@ LICENSE = "BSD-2-Clause"
 
 SECTION = "net"
 
-DEPENDS = "libpcre zlib"
+DEPENDS = "libpcre2 zlib"
 
 SRC_URI = " \
     http://nginx.org/download/nginx-${PV}.tar.gz \

