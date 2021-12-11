Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E053C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:58:20 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.25423.1639249099153765764
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=T2OOiEXT;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.180, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f180.google.com with SMTP id i63so18208187lji.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ueEwCdz3+ywgxfykgVr+mDG7LVtO9jkno7bSZMc3SXU=;
        b=T2OOiEXTv3WFruoYZqHD4w9P8VVXsQVWEa/EGdF/xmOrhxTEe8m2FAwUJZGBElSQWR
         2Xkj8sBovm3DSDo11ujbZdiPKgBT/0eBZwJvNWCqAuUw5ye9kNdlcQUvxmJ5GNJnZnYg
         FROogdJx3rjCGZ9t0OhvANOC7j/e3ePpdXcKOn6/dgCMTyJ+S+ZBgG8W16OLv0RoHGpY
         fBVSpizn1XjvVVKYa5vv5E9zjiAUZatLXxtuRg0t3b0QHC/QDojf5xwoj09SguX297/X
         CS9PkYQs/tO/+FUSXZVJMJTThdONFztxU64jxI5AQBlMOpVQyUBbyd3yvICl/1s71HM3
         SX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ueEwCdz3+ywgxfykgVr+mDG7LVtO9jkno7bSZMc3SXU=;
        b=1xB38M+bt2IVp9EKERPI8EqNDB66F9Bq5hYz9JWtcHr1yjFqagf8ovCg1lt7QmEVSX
         fQFkbScpqkbmkeP8mjqaJWykULuK/tPoOt3UFsmDPWAD1Va4bggFo/h6uUkC/NYIa6Tn
         PgCUHvkQuFRMjS5seTYG3Zjd+RXOmhFTx/BHX2Ol1kfNfVvvg2m0C8c3fQf0T1DPPlwd
         Cv6opZOZPcR+v/ejZ2vxq0k86r/S23O7ZpzbSVyCNyZQBf8BPYsKGgVY+acnfk9JPtFG
         7FiBX46B82xFGti+Vk+nQQ46l3KBo8ryhIgHnIw93kX9rU/4bSLLEAKiWtHigSNye2wf
         lznw==
X-Gm-Message-State: AOAM533PLwyq1PRruh4C/N9b4l9LBUl/w8yTqSlbZ5j3+nin18ofALRC
	R4JxHHHetM4aUzvu4gozpM6WsrJe390W3VIm
X-Google-Smtp-Source: 
 ABdhPJxnzC3wHDZWORHI5ZEIhUXrgCDKuygIPfc+KxDd4Yp+zg3Lqz87wVXMHZRrYfHyMzXnYd/x4g==
X-Received: by 2002:a2e:a80a:: with SMTP id
 l10mr19986374ljq.325.1639249097194;
        Sat, 11 Dec 2021 10:58:17 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id c6sm731652lfc.37.2021.12.11.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:58:16 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-iso8601: update to 1.0.2
Date: Sat, 11 Dec 2021 19:58:15 +0100
Message-Id: <20211211185815.2546139-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:58:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94292

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-iso8601_0.1.16.bb => python3-iso8601_1.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.16.bb => python3-iso8601_1.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.16.bb b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.16.bb
rename to meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
index 2923647c2..474c2a814 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 
-SRC_URI[sha256sum] = "36532f77cc800594e8f16641edae7f1baf7932f05d8e508545b95fc53c6dc85b"
+SRC_URI[sha256sum] = "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


