Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AFBD2B94D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.19587.1730817406806979481
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iALQKRy6;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ea5b97e31cso44576307b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817406; x=1731422206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mytnjDHGDfKAF+pkyCaoLVsn0dCsr8P6tzeWaiBvaPE=;
        b=iALQKRy6PZ9A2uCmWWSmwWpi7SX7PukTkqcG8HynbmlTXOnNSmjMjRGf8z+ENefAuF
         rgbQ4UAWorbKE9yXtDp9So+aCSuh+y1txkpfCIO0MY5basr9VsisEEHajpKjO5KMKjSX
         QYHxxafPj3Rh07SBYDn5YIL5Ng3b9J5lHV35HKwKfuavJP3I/lFqgi85O8d9+R1M3sgq
         yJXMUfSWtmbVZ8ee8iZ7jtRj+VZuWkdIGwyJw9WGQ4Zx8T50POfNBghdjhHob/7hhuql
         RP10FzITifxd7cIkEC7oJkQfWgweXAViC8Hb1xPq0ePntZS7EVhj5I6gWTcd0fy5BirW
         uMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817406; x=1731422206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mytnjDHGDfKAF+pkyCaoLVsn0dCsr8P6tzeWaiBvaPE=;
        b=YdAZUIPVkjV2VQtl7ABGhHLewpX3KueNhVad+2Bs/Vc+hzFglzA0cC0pcqvhYWtzrk
         4KWwTTu63ytE4KXNUfyygBeMWmMgNXlJKO81rA+1ivgHU4Zi5zFp79EBwAGhDmMYpsDj
         bA5t3fO0ao7S0uoCEhkjhOca3UUj47+Ab6F4PbbYt8/iIb4wwkzGGeida/fI6/R9stoK
         fpLumMEoQTppY4XvdxcA9f4HcAkk1+/xmnMXxwE97WzzCPnIADrwjSrnt91qL8Pt74C4
         AUdSS71XGM0i9m1GIOqRCKtsNLcXHcMo69qjpC1FLItqrxKF6t8qGchUXBByAgLFmIAn
         yLug==
X-Gm-Message-State: AOJu0YyVh+EtftKGwYY+2UZTDUrRmyFNarmLPbplkoL9mlDSXCqMe6fz
	xezwRKF2hCIiHEb5KeoN9x6g0wjAUvpN74r0e3WlzO18h8ExYZpnUgIcSg==
X-Google-Smtp-Source: AGHT+IEZ0jM8ACLolWIfROpRLk8CGBTJHjoV3vb6h3i6vAMrxY3qTh5phYHOigO6nqk+pxIiNjNDZw==
X-Received: by 2002:a05:690c:4b06:b0:6e2:611:7abd with SMTP id 00721157ae682-6ea5591716emr150007937b3.20.1730817405921;
        Tue, 05 Nov 2024 06:36:45 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 15/90] python3-psycopg: upgrade 3.2.1 -> 3.2.2
Date: Tue,  5 Nov 2024 09:34:40 -0500
Message-ID: <20241105143638.2301245-16-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113433

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Drop TypeDef specifications as string from public modules, as they cannot be
  composed by users as typing objects previously could
- Release Python 3.13 binary packages.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-psycopg_3.2.1.bb => python3-psycopg_3.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.1.bb => python3-psycopg_3.2.2.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
index 09c49c6650..f92c556005 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "dc8da6dc8729dacacda3cc2f17d2c9397a70a66cf0d2b69c91065d60d5f00cb7"
+SRC_URI[sha256sum] = "8bad2e497ce22d556dac1464738cb948f8d6bab450d965cf1d8a8effd52412e0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


