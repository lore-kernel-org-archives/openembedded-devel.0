Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B40C3601A
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.3921.1743454880025100039
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRCMbR6R;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso6531212a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454878; x=1744059678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADEurzGLNSsqbAQIx4S4eJzdCo9HIBEIgB9LQDHL5VI=;
        b=cRCMbR6RoyEaEyT+mhCtPmSsdcvqNTd5e5r5qWM+eNarki55pKFN4sA3bRSK4adxg7
         9QiML3HsWvu35pprnvRKFiqpjtMR7LdalLrf/EYgEZ+fckv8L7khtgKO8dhMBwNg1mjp
         QjMDxqbsG+F5sgeSzroKXXPlM14u2fq1//nrKHpBsxQi4yiGLV+Sqp8ivr0ooF00D8KK
         PWJJLQP4K06r0EFVJ8bRmn5g9TDUotlfaycI1sa9b5gi+VSZCwGWya7yh0rNdfsmt0pI
         U6/o7alGRs2NjO9KOXAiz65FHNph8JFMxhGzFEK45VbpMfXvcegmgYDSNFq2BUK/9H1N
         xUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454878; x=1744059678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADEurzGLNSsqbAQIx4S4eJzdCo9HIBEIgB9LQDHL5VI=;
        b=ZUdiSsGZ8TPlXOh3phOw7V8todXhXIPwn6qeboiMyDOY8U98dCVFQkMjfC2jiM6Htc
         AIhH9O3YRBqT2mTODTzLaNzEjwigxT9UdPg1UDw2XV3weNt0gyGqQGaGaZfuSdkOethZ
         HWBZzhGdOh/SxkQOtqaHCvO/nWGdBB0U0m5z0x9dcr2ssMBgo/1BL44PyReJFQmrZgYQ
         cBMvRtH0AOGl0yQZ1T5Ct7j0m3F6cFbBNoDsNbKXlFeRB7hESN8uxuxc55S+8bWKAwr0
         YJTexztNKldDZWnRKOxoBvdA+6HW3E1cXXEkuWsauOasNubNWlZoTUOBJLInE0bREso6
         r9dA==
X-Gm-Message-State: AOJu0Yzjl7r69WkcZz6ytMdW0ETgJO0naiYWMecK7LkWK6NFDFiOb3wJ
	rjfo2y1BKbSlMlf4fm6lZMlZciIMsslVtsNcGP/cFvWHJqZwFqemx4sQcLit
X-Gm-Gg: ASbGncve8nCerA8whMfRsLPsACKZLvn+V1CtzyzekxXe3S31ZFSexKZpXTNnCGeZ+Bh
	u30i+sIQu4G7xN3M2RmP3juhlUnH8Q/MrvKl+Q8uNABs+hmjCqdl7bj2djxevdlYrl7S/qksJ/f
	LiHJM7r8nsmryKHvJPO1LZ+QNvx1jLVPS08RFuzwY9iQZHn9O7I880aGZfwdbkAXz82U0B+FSDg
	UR608kmzyYoiBcIdbuuCjatsKLy98pLiiF0s/Z2sMJ2P8T+X6x/tl+O7A7Lkg2RUdZbb0aEm6fH
	g5NmYceGjBcvqYZNXrAX6QgosLAukKSHQe/qKYU9bV3bYrbyhjKvIk5SIG5xrSq3jkuXHVOrpj2
	O7Q==
X-Google-Smtp-Source: AGHT+IGmUOODVrH+/0rBQoRwU5BXEsis0j+8evlxqjIWeDs4xcRMkQJh40dV6rxKASSi8kbEX3+UgA==
X-Received: by 2002:a05:6402:5254:b0:5e4:92ca:34d0 with SMTP id 4fb4d7f45d1cf-5edfdaf9104mr9051764a12.20.1743454878045;
        Mon, 31 Mar 2025 14:01:18 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc16d3629sm6080274a12.23.2025.03.31.14.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:17 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 06/21] ldns: Fix buildpaths QA issues
Date: Mon, 31 Mar 2025 23:00:46 +0200
Message-ID: <20250331210101.3460858-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116442

From: Khem Raj <raj.khem@gmail.com>

MJ: Backported from 'ldns: Upgrade to 1.8.4' commit without the upgrade.

Fix buildpaths QA errors while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb b/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
index 16816e62d8..80e5571954 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
@@ -19,5 +19,6 @@ do_install:append() {
     sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
         -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
-        -i ${D}${libdir}/pkgconfig/*.pc
+        -e 's@${RECIPE_SYSROOT}@@g' \
+        -i ${D}${libdir}/pkgconfig/*.pc ${D}${bindir}/ldns-config
 }

