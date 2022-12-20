Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0581EC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:27:44 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.52971.1671550061084114011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 07:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fTfpm1PT;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id t62so10825944oib.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJbrKF+NAOyPWXcIhohzVQg3D4n1LmQ8pHj4o890gMs=;
        b=fTfpm1PTLVDl3VtGj7R+TtNguwfo27LC+Xvk1L1TW0D7GArTxGQwiCUpO+jy2Tbvbx
         +oUcmOlOhKKorJJ2eqMuVxhb48L6y/RTi+heV86q5+nBzR+F6c0hMZPrxDNREbjUrFiB
         AuegIJV7zCqHF+c0yVeG2fHzxAYTJmviWdjFmB1x4qJ0PIq9Y1phKr9K5zAwG5wT/ZF7
         d8q5TLdnZrlhGeLpQv8kwgWoRBPiwyRqFgnqgH9jC3MvYjdkGPvIZH5VgYYa1aeHYZZL
         iI/YjPkv8ljCl/wrdGfcG3wcTqRzVeWX60FQdMuwkSM8tizhf71fQng0PWIJN5byEPkE
         KVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJbrKF+NAOyPWXcIhohzVQg3D4n1LmQ8pHj4o890gMs=;
        b=aogYISQwFNElAdQUnC9YjsBa7ffIVbAKdnE93+RfJHmwBIYbQhMwk/jl4dE60NX6ML
         WAIIopGl6aqUhq2e7NMJAFgthRvYctK0652zHqE3I1WlRSO1hW1zctKeHcfim0QoxjLU
         y9U3nkpAorGotVrymXbfBu8IGIibgC8M3YVg7l1FkOO8UjY9V5pHxHcHB4Bnfe8GxDp9
         gIV5jBzDYRsZm3KikfVt2ijzSQLeYIBAmywMQHMv1GJ6cvrbpU90ig2AzSVdWlFh++2U
         BZb3GBTT4p0XKcGNfEkBNFSpL8ajOKbs88BjhxmJwYSHu7KMRbE1hNLPshPhbPQOQcci
         3jKw==
X-Gm-Message-State: ANoB5plDU02TQ/uFinx8gqHnFE7kqBn2LNcr6dIuySd5zbUNhk5delI7
	d2R8GQCEtHqGmsfKUYIW9WEglO9IgeQ=
X-Google-Smtp-Source: AA0mqf5dR34/1/VD/YvyMnmNhZ4bd9XJtMXNpFO9cCIhK7QntqVQOzvsCgB9UgMmsdmRm2v1yttaRQ==
X-Received: by 2002:a05:6808:190c:b0:35c:2729:8738 with SMTP id bf12-20020a056808190c00b0035c27298738mr26317790oib.29.1671550058738;
        Tue, 20 Dec 2022 07:27:38 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b])
        by smtp.gmail.com with ESMTPSA id q11-20020a9d578b000000b0066c34486aa7sm5666026oth.73.2022.12.20.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 07:27:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH] imapfilter: Upgrade to 2.7.6
Date: Tue, 20 Dec 2022 10:27:37 -0500
Message-Id: <20221220152737.42702-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 15:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100158

From: Khem Raj <raj.khem@gmail.com>

Use git fetcher to avoid src-uri-bad build QA error

Changes in this release [1]

License-Update: Update copyright years [2]

[1] https://github.com/lefcha/imapfilter/compare/v2.7.5...v2.7.6
[2] https://github.com/lefcha/imapfilter/commit/ce6b9050b284b9944ac52371a4a2254fc73bc219

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8299706b637b76d95716079455c276a825d6f0c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb}          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} (60%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
similarity index 60%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
index 111a8208a9..eb23816e8a 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
@@ -1,11 +1,13 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=db3b99f230f9758fd77e4a0654e2266d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c11d4fd926d3ce7aac13b0ed1e9b3a63"
 
-SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=${BP}.tar.gz \
+# v2.7.6
+SRCREV = "b39d0430f29d7c953581186955c11b461e6c824f"
+SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
            file://ldflags.patch \
 "
-SRC_URI[sha256sum] = "ab19f840712e6951e51c29e44c43b3b2fa42e93693f98f8969cc763a4fad56bf"
+S = "${WORKDIR}/git"
 
 DEPENDS= "openssl lua libpcre2"
 
-- 
2.25.1


