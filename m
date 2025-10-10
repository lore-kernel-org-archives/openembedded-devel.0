Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61007CCD18D
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 17:47:42 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.11213.1760109476597971027
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=plf2srUV;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so16433465e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760109475; x=1760714275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=plf2srUVR8a5uWQcnwq+DfU9WuyKYucO+Xi7REagRqBvA3uXQJyv03nyo+tsf5sSPG
         lOV1s5MO5kQm3x+SpT8E+JhigowuR05alLGUjnY4iFEW3SZy8F9uV7GmkrNEc/f456qt
         QyocxtJixKXa8dRu6RcmpWHr1lukkKYdC8/nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760109475; x=1760714275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=k0YtNb4EyBlwYqTpcyNTrhfZkp4q2qVhNKbpOx4O2Q+gegsF7D3uHuK2rrXLehXBN1
         R1fBFQQUvdVDdpI6pkts+K8i3DoHrYBf2kg5y8lYjLNzi0prAVqLoL4zymF+JXF0mNDX
         b52oFI6sOySrcB9hLY4MxJXnaHOFABZHKcE1n0bPkto8R+/w3UH10V7CN4AOPpoQuD+F
         zIuNyl++AKEiJFXT6F3vixMizvQBun8Rh/iOZ9Q0b+PwHg9NFF9rujfHfYIWLN7eTmEd
         tTp4m9u0mwK79rwVqq0UYdGfDYgD92mVdlx6dAtDsNdNJkWSiEs3ZOeSEQRcEk68Skze
         Y9pw==
X-Gm-Message-State: AOJu0YxjDiXBGSwyfBdCT2D60twUTtCE5/7Gcuus/mFV4b1zgZj87Q8F
	1dyLXGVISlHgZ1BkIc4LUph4xgBYQHVr5mhNtAp4vmE4iDFhyXj3FW3meJbBrAEv8c0DxORR2Ib
	ivKZRQ+CpWlx4
X-Gm-Gg: ASbGncu0eces4GIhcTizqyuW3dQ0Cj8imgIBsN0FwufKWbfJTUZap6K0WBsdeEF55x1
	kixdIGs+UVykWJ7S7PBeItgQ42Kr15Y4Y98h2pSA2TTGaioPTcqZsRp1ykYwiJp8sjLE4HRVJMx
	Dp/rM5m0qxwOn1r3TOy3Nnjt17YZVW97EI44sSyEWA1Z1jMdXFcZqZ9ODoKt5uFvz79tPTNesao
	FIrtBTgQLSD4ZDMcdm0ZIj2tVw+W56VRIfDXO9ioMwBq/lDdN7DHeoKRxEyUsxTIL5bVF3ZzlDg
	94Z3F1y7xgGVTt0Wx2w4JK5XKA/15fStom6ram+8tjnf8HbYSS7Mija+gaCXnqXi7vKsZj7NHLU
	gRsxW69auFi3Ydm1zD2sch26rerYbpHkFfQZ8gZWYl1xZPKuZolOab+XqWPhEhKtTACsvjo5t7h
	dLfyDmWW5uRpQM0ozpSLNfA+2jliZYJdw29fHswtXWkYJzxA==
X-Google-Smtp-Source: AGHT+IGM/7Q4UoDd85pkZJumvzj4HSXq10yNyjJy19m97ZGgpbggxjxNJihNsHMvV1bVO7R/ov6PQA==
X-Received: by 2002:a5d:588c:0:b0:3f4:5bda:2710 with SMTP id ffacd0b85a97d-425829b0578mr10242526f8f.9.1760109474892;
        Fri, 10 Oct 2025 08:17:54 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d404sm4828730f8f.3.2025.10.10.08.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:17:54 -0700 (PDT)
From: "Corentin Guillevic" <corentin.guillevic@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH] libblockdev: improve reproducibility
Date: Fri, 10 Oct 2025 17:17:51 +0200
Message-ID: <20251010151752.779032-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 17:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120483

The --with-smart option behind the feature "smart" relies on the drivedb.h
header, provided by smartmontools package (/usr/share/smartmontools/drivedb.h).

However the dependencies (DEPENDS) miss this package. Furthermore, if the
--with-drivedb option is not used, the configuration step will search for the
file first on the host's rootfs. This may result in the wrong header being picked,
or the --with-smart option being silently disabled due to incomplete dependencies
(causing missing header).

The header is now guaranteed to be present due to an added dependency in the
"smart" feature, and its location is specified by the --with-drivedb option.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index 48e6971d1a..e4078d6862 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup keyutils nss
 PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 PACKAGECONFIG[tools] = "--with-tools,--without-tools,libbytesize libdevmapper"
-PACKAGECONFIG[smart] = "--with-smart,--without-smart,libatasmart"
+PACKAGECONFIG[smart] = "--with-smart --with-drivedb=${RECIPE_SYSROOT}${datadir}/smartmontools,--without-smart,libatasmart smartmontools"
 PACKAGECONFIG[smartmontools] = "--with-smartmontools,--without-smartmontools,json-glib,smartmontools"
 
 export GIR_EXTRA_LIBS_PATH = "${B}/src/utils/.libs"
-- 
2.49.0


