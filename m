Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45F9C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 00:48:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.1278.1737679711425636852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 16:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQJlUSIS;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21675fd60feso34389635ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 16:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737679711; x=1738284511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrQEpUHFIMS9DxbT3Q3/gRsRfaLEreSMJO4+gT6UTLc=;
        b=bQJlUSIS339qWDj1Y9f8eOITJg1jsfA4a6RblGGLmRBAO+WiTN8t/naNCiMFvSY7Fv
         Spg9cgal2qzrgFdSDP9a7iRLUDhPng9KcFkt0QIzFHBxFy9Vg5aqL/bqB2FvtXKDPQoo
         eQrxNHcEApg3Cwm/gs8Sdp/qK/L7XPY/Xpv91F8mGblsWaoBkXSWxCWbrVA1nBkCUKHB
         DWXof3GlrfjiGbLJaNtE6CyL9EWUB3hBK1jbJfseb2kxOZiq9ZBO/XCFnfZ3zRcJ5/3K
         oyKUvKoEm8bNQWr/HkCZq2SJylrhhs4oO3T9INXbLspqlUvAS+m8QBkl4T2It4o6z+xZ
         gMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737679711; x=1738284511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrQEpUHFIMS9DxbT3Q3/gRsRfaLEreSMJO4+gT6UTLc=;
        b=ko6wv4/pXT2FAFLuJ0H8IK+5YlWUT/a5oc0bMtUx5tI+U0dgmnEZuwGlf4ve0K501w
         M3ohLsYs483c6+OafJy5ab1/qPjRoo1Kzd9jw+qhYUNQTrUzd+9tO3lBUpACl5CXYLce
         99+tgV/A/434uKIt/ded6julPOoYabTg6VCHsj5ZuUNbZJhO7KQQyK1TSLWRO7iiIV0p
         kK2/rrg6HpVxEQxQup8m+w/lQGw3fDJ/JNEx9oJR7v2jr32O0q3pe0z+rkjLP13SsU5B
         wg/eVCaHahTGIzxBY3dHtaYoUfLtwyT9CZMgKI0L/7MNV/3t4IzNAYC4ipB/NJ9RpY31
         R76g==
X-Gm-Message-State: AOJu0Yy1BbcgcslW5W4lUi3cltRO9bi/1P0ycmVvXgbvmgxP7sa6slDV
	I1VmUgRxRV+gq5XlnYe0cM13lCJ9G5RzqR8yTeUZcgyLSPdnLYby8zali86k
X-Gm-Gg: ASbGncslu9M63QUxrz4sX4Zcf6R3+HdgvxFiApHwMppiqorbwYAiQXoccw6qdA81SfU
	kLbq8hNMVQTGGGuwAk8kORc/gORf1NbaJ/TqbyZMjlzmjRy8PEKPYcXVjRngoIUSRIElN8uSwzz
	1CWdTAom7n9IvN0sBt8fa4V7vXm0Ol/fW4uYP+wUoBQ0RSip4AB8JWr1hMiL1/fQSgcKaJghgfk
	Ghwr8kdrPYHHyiq5FoU/ZeMNS1pXsW9oI9btrGZO05I1MVdoZeNIkU/35Mv9/3c1BHzWFSj
X-Google-Smtp-Source: AGHT+IEPrWK7tLsHfleBh3fGc1J9SX066ktBQ8F9pLRAtk3hSksn7nDc6Rk7On2az9q18CPeiY1gWw==
X-Received: by 2002:a05:6a00:a09:b0:72d:80da:aff with SMTP id d2e1a72fcca58-72daf9c1dfcmr36330330b3a.9.1737679710597;
        Thu, 23 Jan 2025 16:48:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::d2e2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48fe53bddsm475599a12.25.2025.01.23.16.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 16:48:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] tigervnc: Replace using --system-acdir with --aclocal-path
Date: Thu, 23 Jan 2025 16:48:24 -0800
Message-ID: <20250124004825.3525640-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124004825.3525640-1-raj.khem@gmail.com>
References: <20250124004825.3525640-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 00:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115043

This synchronises it with latest autotools class

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
index 47f59c69cf..4d2bb1f063 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
@@ -96,7 +96,7 @@ do_configure:append () {
     if [ -d ${STAGING_DATADIR}/aclocal -a "${STAGING_DATADIR_NATIVE}/aclocal" != "${STAGING_DATADIR}/aclocal" ]; then
         cp-noerror ${STAGING_DATADIR}/aclocal/ ${ACLOCALDIR}/
     fi
-    ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+    ACLOCAL="aclocal --aclocal-path=${ACLOCALDIR}/" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
     chmod +x ./configure
     ${CACHED_CONFIGUREVARS} ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
     cd $olddir

