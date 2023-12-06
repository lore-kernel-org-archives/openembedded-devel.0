Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C618C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:08:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.33952.1701875278355959785
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1PQXsi3;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c09d62b70so42976535e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701875276; x=1702480076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oG1V9xSC+pvMX3cW7gT3vd/2ldRI4DOF9q+EoIy9r+8=;
        b=Q1PQXsi3EJxjupb1Vxv1TKbq3b6sUbkXj3XdjbWgHKod/nDf2Lel5n+AGAIhn/wKXZ
         4FX/ayk41MgtjjDowjTd0XCPeMkMyh686w+hB9zU23OAiCsdnhYZpKlMYHdUt1J7Q8pe
         GHIw1Gyv2QjR1G5hUMzRIkKuqvXyvGxIbZXNWlFulsjUGqsM0gSkL4KnGIP/Doi8Dx1S
         3poy4Yrpi6KOJdgf8oG/ZcDl+wy4+9zOAKtLJZ+LddiTu7VwEy083xrqmS9cgZbFBbBG
         a3hgTG6QbQ9KAW8ltNkS8s1pCp4bTnHnLyLi9GGTrp/kbZkrbEygkQ+9ETanE7xIr/qs
         aG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701875276; x=1702480076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oG1V9xSC+pvMX3cW7gT3vd/2ldRI4DOF9q+EoIy9r+8=;
        b=g3TfxfS8N0Rk+wk4f4/evhOcsBhTF2yz5dcjULZTFEOkwh4Y/3o10wtYOTGtSV0q0k
         q5FzYLBnb7ezgL8Yf0mJKtI7ZyHa2wFPKfkSLgw16PXWpBHEZmpgrhZ7KsFzIHUOfczi
         XVmTNXj5oHSftdTYkIcnN6r5Fxc/r6WJ0HxKtlq+N1jELVx7AQgxxYi/S1h4YS1k7jYr
         i7O2p8N5UTyaqOaecqC5OMeKvOcUPcSCmxoNgrrZt4zoWhR7QhRbg1wDh0tXzUiXJNfa
         dnQfj4nLT02Y8gZl80JAhNG1kzheyI4YH9btWVa3uaa7nTWRVjClj9diBcd+3WUTJNY0
         2Niw==
X-Gm-Message-State: AOJu0YwgP48YaEg48dNjopTV9Z9jXW7b+/3eF3LYFC4kyorggScO8/dy
	f4hhs+U6oMdAxsUJbvWLR2Ri1H3mFEE=
X-Google-Smtp-Source: AGHT+IF8mcme/pWMTrvLvIScNeGa3ZgCv5uLguhaM+RULcjhsxoLcHZMX2OSVYKLJyigEHkXBHq6AA==
X-Received: by 2002:a7b:ce19:0:b0:40c:2103:4fb1 with SMTP id m25-20020a7bce19000000b0040c21034fb1mr394651wmc.242.1701875276220;
        Wed, 06 Dec 2023 07:07:56 -0800 (PST)
Received: from tst-901239-03.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b004083a105f27sm25456495wmo.26.2023.12.06.07.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:07:55 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: added Python as rdepends
Date: Wed,  6 Dec 2023 16:07:53 +0100
Message-Id: <20231206150753.396406-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 15:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107256

Netdata has plugins.  Some of the written in Python.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
index c56da3744..fc6d35505 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
@@ -80,4 +80,4 @@ do_install:append() {
 
 FILES:${PN} += "${localstatedir}/cache/netdata/ ${localstatedir}/lib/netdata/"
 
-RDEPENDS:${PN} = "bash zlib"
+RDEPENDS:${PN} = "bash python zlib"
-- 
2.34.1


