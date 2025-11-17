Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630FACEBF96
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:57:12 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6000.1763373429408333151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XSMhcPU/;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so6804189a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 01:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763373428; x=1763978228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bk2vYP9+1n82zghgvLCSzzKRY8M8z+ysjRoft473jg=;
        b=XSMhcPU/A2lFzgmqBa6MWyNpS93CH7acIUqEl0OLWaWBV/J74K2Zkk9kzzQrMKmKri
         zw56jc/PMU/JYDklOP9tyj4CgfhxrZcVfYTP5tlvGsA5c9dLOFTMcdZu4UKSqHFQjuzE
         3RdVFO6hUYGz2iLt0LfytnYkSn0FaTvnB5DXZ5aGu4d14UNQF85dIE/aKcEF78HG8ocQ
         MTJGKOuJ8YmksAotRRJo9wrlMUM+9JlA/t977HX9v1PRvrbScA4qLQZlYazM1f6RH2WA
         ifPDXc9jpzMYmTDccNjQFq51AclsHhACujXwyHRi4cMX2SCtybR73ExsLkNdQMF6uuDC
         F8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373428; x=1763978228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/bk2vYP9+1n82zghgvLCSzzKRY8M8z+ysjRoft473jg=;
        b=JourDaA22YzAcVNdJIsRWzvfjcBiQT14tkdJM7Ryf6PlQcdEQqHVwACSz9jQEGJ2q9
         vcyMMjMwAcO/kxQ4bkrqAdLqFfc17FlwFMQzRtBre8NzEBgi8Nfe0kHxtzs2VJR5XD2d
         ywHOYldJEOIY9NTRtRn3jA3zyDwrpXbsmzFGB5zeWgL7xY2Q7mBc6cdABEF8tmCXZG/S
         NTIVSguBhYva64NmSgyt6c3IucI7mgLBeFzoL3RnsxX3k8Qyjh/f8DwNY/f8Zw2DiFzg
         LMhAcGb+qOBtaDisSjHsM4c9cU0NEWz69KCUyRsWkFndqoS3xLjescNMVS5kSpJHof7t
         Xqlw==
X-Gm-Message-State: AOJu0YztGQgIMWJBGYZvlV4mpgQYspK0CsU9WOGyf1nX3aOv0RUyJlVL
	FqRvWWDJiB2jOusRjnN1AouxgRqXjmQMaUCOpPscQ6roT67SboqnI8zB0hroRA==
X-Gm-Gg: ASbGncs0BKUV/y9sW/rWC1CtohrMskjPX8JESOHv9Rsc6czuXxY/2eK0KZttPIpPzIa
	rZzmG7ppoxZ7IefYCS2xZGFKTN1TB+fYWJ38Jkn9M16nYUFnN3BF5u6FFwdRIYPXV5Kfm1jeUWq
	DysfCjj0IMTGD2YZeFJVt94pZivIXQjXosqcuVTSfTH0BhKOBbENtHARr+e7ef6yMImOFQiSA4f
	BbMqlA4vdukcvhTele2yt2QtqDFE132YWZQTHKVevujyJvkixxGwbtDWslfdfymBO+viNU+8EHD
	kRucFYioQ3tGA+ISVREIGG56tE9fkLtz/UEdzZnSY9UUTxi9uz1blFfYdjkpvjYLcQOD9tb8tTj
	ALZ76yZ8ZDXd89WsGDQbwIIRwYdLq/gYXGiPQum3D3dJxRRmP0ODza1rvwoZAgBYGZYDeaRidcf
	eXM4woXZ8JmwVo719KB7ivZojaRMG6XhuetgU=
X-Google-Smtp-Source: AGHT+IGTthycuge5M4Dq+KAz8MLJ1fvrwX++WYLDc0D7ecN/Qk5WhP016yrBH17Q8ukIBMR2Iqt6pg==
X-Received: by 2002:a05:6402:1456:b0:641:1cd6:fee9 with SMTP id 4fb4d7f45d1cf-64350e045f9mr10959672a12.1.1763373427616;
        Mon, 17 Nov 2025 01:57:07 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a49884dsm9686216a12.20.2025.11.17.01.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:57:07 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [kirkstone][meta-oe][PATCH 4/5] libwebsockets: remove STAGING_LIBDIR with /
Date: Mon, 17 Nov 2025 10:56:58 +0100
Message-ID: <20251117095659.937489-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117095659.937489-1-martin.jansa@gmail.com>
References: <20251117095659.937489-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 09:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121774

From: Martin Jansa <martin.jansa@gmail.com>

* after buildpath warnings fix from:
  https://git.openembedded.org/meta-openembedded/commit/?id=eeef1fddd9052bed4b1a91565260518eb042fed2
  the LibwebsocketsTargets.cmake ends with:
  INTERFACE_LINK_LIBRARIES "ssl;crypto;ssl;crypto;/libcap.so;-lpthread"
  instead of:
  INTERFACE_LINK_LIBRARIES "ssl;crypto;ssl;crypto;/OE/build/.../libwebsockets/4.3.3/lib32-recipe-sysroot/usr/lib/libcap.so;-lpthread"
  which causes e.g. mosquitto to fail in do_compile with:
  ninja: error: '/libcap.so', needed by 'src/mosquitto', missing and no known rule to make it

* this happens only when libwebsocket is built with libcap enabled
  (by libcap in DEPENDS)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index 721406267a..67c1bb4421 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -36,8 +36,8 @@ do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
-    sed -i -e 's|${STAGING_LIBDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
-                                       ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
+    sed -i -e 's|${STAGING_LIBDIR}/||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
+                                        ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
 }
 
 PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev"

