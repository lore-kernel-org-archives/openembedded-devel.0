Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB81D2B950
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.19588.1730817407475154223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9WpO1CE;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea053b5929so45595647b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817406; x=1731422206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgrZ6+cSeGOBgZ7w8eBuhyAGsccQODYCY9BymyxVDQg=;
        b=B9WpO1CEk4r25Al+t1SyTM5vHJMEX2MTq1VJ0KN8osVf8YOLeBMfK7WT8FOtYFJhCJ
         mMXFPp+Wxj1iH3DLTAjCXx13PrZT18EGYKEMI6O//0ePlqZGXt86KgFb7p9hdBiQY4YD
         ygpnBnuzM/EjQcTqf9buyCW3ccooY4c6UQWWDMtPzusLo+kqQH7lLa9qjYPhvEO4g1OZ
         juLIUK8p62ZgHswnW3DrnxvoLZ32GTDfBFd7doel/zIYCyPPnIU/fv+7dJT30jvp5icm
         riHMXVJFqr9iu29w0IvqPxqhBDxhMGYu+2tD0DeS1erNLvxjGbCQuIPMKA1XWMhFd6UK
         CWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817406; x=1731422206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgrZ6+cSeGOBgZ7w8eBuhyAGsccQODYCY9BymyxVDQg=;
        b=Nk4JlmldKLCbjwDxzyArODrdwXY67yD4IT+ry0rGhTws85jSTZP+/g92mi8DFpJJvf
         Cp7kYWZrOnjQsqV1aXp7iIV7V/gZkfQLYdMqxqdM35lQ7n6AYnsQtrR6O6sGwc9fi4XT
         7lYq6mAnEbnHuKLU3OjnQh5tw3bC+rhdwBZTHsnOKfpv8tvP5UK0oBuEK6ltAV6l54YH
         ntW4fpZAgANe7MUEzNxfw+kFm7KtMvOEJkrpCDT1z0alH2O3yyTdtjChjyPGchkOuFiu
         tq9fpioBzmPxQ9GHM9VHsBUnRgucT00fwOGVZk3sdmU3TG8teFkAw1FI8FEerEx5Fe2v
         xawg==
X-Gm-Message-State: AOJu0Yw1fOJ/0xJvcHgEKVeo8CN3jq4CahgxyzZT5hHRO13LoZYWuMOV
	2y8q5VtJa1CavGBZNslhKZvbGVKhBnla7Rz3tjnuCl+QVX3y9PiOa40VEw==
X-Google-Smtp-Source: AGHT+IHIdt4nIrf4mSZxk3/aY539YG25My+cmQvu7eqTpbmA7Oe27yx8CUCeDpBoU9O+lL7TCOgvZA==
X-Received: by 2002:a05:690c:4b0c:b0:6e3:7eb7:b600 with SMTP id 00721157ae682-6ea64c2f2b1mr153014567b3.43.1730817406455;
        Tue, 05 Nov 2024 06:36:46 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 16/90] python3-pyasn1-modules: upgrade 0.4.0 -> 0.4.1
Date: Tue,  5 Nov 2024 09:34:41 -0500
Message-ID: <20241105143638.2301245-17-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113434

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Added support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-pyasn1-modules_0.4.0.bb => python3-pyasn1-modules_0.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.4.0.bb => python3-pyasn1-modules_0.4.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
index 48372d917f..e8c0f960aa 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e905f17b6"
+SRC_URI[sha256sum] = "c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2ab60a7c"
 
 PYPI_PACKAGE = "pyasn1_modules"
 
-- 
2.43.0


