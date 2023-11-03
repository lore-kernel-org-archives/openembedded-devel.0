Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98477C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:10:59 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.63456.1699042252942720235
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HCHlzHIY;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: festevam@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9b315828aaso568605276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699042251; x=1699647051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM9g164omL8jbJt6sW92CccCg5kuPq6Ldz5U77eMtIY=;
        b=HCHlzHIYC8OKB7UsO9XKU3HTP2PU+/8feo6Kf0N2mHYLAATIoUST84SMQt+x5KFJTW
         nhsrDhFVQbtUvo/VgbU8ovETxfZbLTFWYQBD3HgG6cJnm4NnNICOST+6f8qSaXqcOZYU
         7b9Z2QMANtTgtUpixVPQF5puFwj0UkVTn3WueOWLrKhDN23zt7IzicqAzidHv2kCLhUx
         NpY2Ma+a1qG547Aa9rDbgJjwzV3WzRlNhwr30k64bxykj//9j5SBxUAe4jIsu3bspKtK
         tNXekRdBOSgFqK9m57XAeWkg6KobvRW6ex3mreq2kwYuthhHkGYXiDJdITxa1H9GKFyb
         SFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699042251; x=1699647051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM9g164omL8jbJt6sW92CccCg5kuPq6Ldz5U77eMtIY=;
        b=oaCSBEMWrMBVwfEO1DQIBm5onVadFnDJ6ZTLM8MN/+i0Kwb/PeBvNkfB7rBcihAYjy
         fNik/Iv2DgqHE2Js8lFRdxbBRZhK1V4xt2tpeqRJdKJSwIJA8F0b8KFn6nYgO7nUBz+l
         6HtjgGRAWX/wdS7KZOW8M/S89x0+5ILqzmgUpfRxdCNL3/m3XHM6nu0ZVQLbUiv4Go8g
         HJmU0u5nSN3tBh2ZE1uxvLcUBXmnjk7NnfULUWE8gUGL92F/A8grSOC7armdcNzRF/49
         6KKNaNt9YTLUnunKeHHAWv/p8yN1uIH6uUCipXvVwLCwYsSRDDYg1a7TQjS12jFlPeN2
         XGHA==
X-Gm-Message-State: AOJu0YzfU79n6wl7b1sfAHaARQ9t1kkq870DlwSa6SlrNDLc0csMePKF
	noFjYbr3lGnM3tfWRoOjJIghmYd5I2k=
X-Google-Smtp-Source: AGHT+IHMB1XeqJDR0w+V5626BLk9N+zfL/ytNnvafCp11N16EtO+pSQoQ3+nudXeGWqoQLg+ukkLxg==
X-Received: by 2002:a25:4d8b:0:b0:da4:10e4:d544 with SMTP id a133-20020a254d8b000000b00da410e4d544mr3946110ybb.1.1699042251665;
        Fri, 03 Nov 2023 13:10:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fe70:4f05:3ab8:f73c])
        by smtp.gmail.com with ESMTPSA id a18-20020a25ae12000000b00d9cd730e4d0sm1213389ybj.26.2023.11.03.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:10:51 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] multipath-tools: Use https for github
Date: Fri,  3 Nov 2023 17:10:35 -0300
Message-Id: <20231103201035.14120-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103201035.14120-1-festevam@gmail.com>
References: <20231103201035.14120-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106089

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../recipes-support/multipath-tools/multipath-tools_0.9.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
index ae4b3b9bf..a7a9019e3 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \
-- 
2.34.1


