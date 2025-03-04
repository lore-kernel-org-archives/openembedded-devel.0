Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F41C282D2
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:54:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.22213.1741096461939689638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Mar 2025 05:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lbb8vvqu;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948021a45so51818205e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 05:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741096460; x=1741701260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaKCt/3zo1TKdm3Jht5VGk3GEp6L4cFaamk7UJ5eEIM=;
        b=lbb8vvqupQYYeyovQ9pmyiIJ9eGYDWlEpRsuv/34xvnqkNiiHG2mRnkkfakathEbeV
         tHpn7wufzHBu9oQ75AnhVGj7HqdaGzMG06PwBBWP+w9hLNCAVjCrDNzE8QaJsVAKI+D8
         yOncebj8WhdbDm+4FX9qlaEuG34hwLqa6y21A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741096460; x=1741701260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaKCt/3zo1TKdm3Jht5VGk3GEp6L4cFaamk7UJ5eEIM=;
        b=wjaUoFQzCYd8IR779B9IfPiQ3KJXMZhZHf+wB8IdMC8Do5hU5gjgabUkj18k8Bi98J
         xn76UN6SnJjTjxs+bmzI70PXQjDIIRu8i6ByMfT2PPvVAWbtR8hzvKhbsHzQS9xt6Xy0
         DytpaRjmS8ChKy3tGi9ZVsB1m8Alh1hdMZpKqT0CuxTiGRda98NTWP1uUU68C8oxj9cJ
         d9HDsb6EU8BWqp7slUfe2+27xAbW4nPl25S6nvCTU9xoaWInBu9jTWswWnZpedoBsEd2
         ytPWcqR0EYdE7ursIQ3cL19eEp+M3hsZzP3psCkvA4sptx/16tiSpfcjMrSOjtdn5kAf
         8XUw==
X-Gm-Message-State: AOJu0YxRUQiOD17Kl4bZLzAuqU0tEnQPmJiKNTP3EgSiFl6kaDoDisP8
	kZ4lKrowuMrE1eMPQD5NyrtQ8LHtysevgaP6qRavtgrZwls/4upjpZwaJN16q8pSSRLIbLq8VcG
	W
X-Gm-Gg: ASbGnctO8e+V/kVDpkD8zu+vo6/mVQviIIvZ4c1HwXKRM54gYVRs+YgRG2FNrhMY7xt
	8e7CGw+Pxc+dRkzd0sWIiQ9dfvch4eNo1dOn9OlW4BTuuGUppXyWJ9hII2N/eYsivaKILt+/vaX
	MCJKTH3U+rlgnKZWau/zvoAp2L4+1Ogxemypl5/2ymnw2lwGVXt6NhJz05w/QEkuUgbqldz1FTB
	HgVXno4mUFIdbv1rt7Sxz+H9iQnhh9JUuadlYE5bLGFtrAIWECW6BH1GLXgCKS8Djzesudzk5vQ
	BV5juDCQ+Yb53fmMeRJzhzC+Q7Dii9hYvsBBcmUZngzB2E3NxssuQhLLupY=
X-Google-Smtp-Source: AGHT+IGd2pRBMuNWk/+9b35bcbfXXYQusXUkKFCfBVdeqdmlQhn4zQ1+qKMxNiQjCjbB/lsXi9qxYw==
X-Received: by 2002:a05:600c:45d0:b0:43b:cfc2:fff with SMTP id 5b1f17b1804b1-43bcfc210e0mr5061395e9.12.1741096460097;
        Tue, 04 Mar 2025 05:54:20 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d30sm17979983f8f.10.2025.03.04.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:54:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-prettytable: Upgrade 3.14.0 -> 3.15.1
Date: Tue,  4 Mar 2025 15:54:15 +0200
Message-Id: <20250304135416.2142742-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304135416.2142742-1-leon.anavi@konsulko.com>
References: <20250304135416.2142742-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 13:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115740

Upgrade to release 3.15.1:

- Fix IndexError for add_rows() with an empty list
- Fix typing: replace Iterable with indexable Sequence

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-prettytable_3.14.0.bb => python3-prettytable_3.15.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.14.0.bb => python3-prettytable_3.15.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.14.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.15.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.15.1.bb
index 93409cdc82..f5ed6564df 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.15.1.bb
@@ -3,10 +3,9 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
+SRC_URI[sha256sum] = "f0edb38060cb9161b2417939bfd5cd9877da73388fb19d1e8bf7987e8558896e"
 
-SRC_URI[sha256sum] = "b804b8d51db23959b96b329094debdbbdf10c8c3aa75958c5988cfd7f78501dd"
-
-inherit pypi ptest-python-pytest  python_hatchling
+inherit pypi ptest-python-pytest python_hatchling
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-- 
2.39.5


