Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A5CC41535
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:11:39 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.63475.1699042293236277143
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GhjMa+1/;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: festevam@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5b1bd27687fso4866887b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699042292; x=1699647092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM9g164omL8jbJt6sW92CccCg5kuPq6Ldz5U77eMtIY=;
        b=GhjMa+1/2jA7cEsGRdXR8nj6rk2dMhmM7gutCwHq/iWj2VZlyV++Mr6qBjWDj1wOOD
         BVVuvQgY8kTfozDpbbS7bvxBa5sepd3RHwxfgMQotmDD/zAM2x6TPJZjpy/Qk1Qg93nt
         XesFPPg97a/cmbtQv0LhHma9BNTQ6t1K44elBe1UJqQj/6ii9sVUp/pgBhlV6db3j/dR
         W/WAjAVGZ2tqVp8HFpzRgh8wT67gcSGqE/u9F7EPBI9/rBjblWvVkE9o0/fYtg6wHlwv
         MkNJse67cDfhd0JO31LzfVMjq5dgwuiiUrjxH5xtLCF30QYpWnQtqQnOA82BWh3RBAqc
         Fq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699042292; x=1699647092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM9g164omL8jbJt6sW92CccCg5kuPq6Ldz5U77eMtIY=;
        b=k0tPz5m2ScckBA7lbyyFSrUcCLyhoqGccT6mjmqYbplnZkvo5QYEUacOQSNxtV1vdG
         UcEAUEMGLvHZAaht0S+W7fiLW1L4OqGIgcSByyosJi476Rrjv26evUSK8uMW0pQ2gpee
         uj3vBVLAWlC3zpZT0CvDK2/vlr6DCYfyw3jaUdkuwh6C60IQstXoeu5ZCE6qn8rGl9t1
         edBnZnlk2XY+7h2BLO34nqhN44vSWEkCc8UZJHjovjvBe8Z6GHOACGDDzY3RMa+p3FNS
         bMr6PTG9ANR6YmaiNokCHi4TtLam1y7Q1ZRSnjFau5uQHp6h8gXjNsGPpKYQgqOB0vtZ
         z+bg==
X-Gm-Message-State: AOJu0YwTk6MuBkGzkZZ2353vk4qReSNe82UldKlIsblx1E4iYgoRAA6N
	HA/53FpMuEwhUSORknHV9RYjQ1HFKA4=
X-Google-Smtp-Source: AGHT+IFusmzhZfRb8vsTH6ynXsk/dZ5Xs13ciYUFHXcQu2viCnHDnbG2KyDLcxVLdQDC+cF6DbAZRQ==
X-Received: by 2002:a05:690c:2f86:b0:5b3:2e6a:ec63 with SMTP id ew6-20020a05690c2f8600b005b32e6aec63mr8446798ywb.1.1699042292001;
        Fri, 03 Nov 2023 13:11:32 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fe70:4f05:3ab8:f73c])
        by smtp.gmail.com with ESMTPSA id c124-20020a814e82000000b0059b50f126fbsm1339848ywb.114.2023.11.03.13.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:11:31 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] multipath-tools: Use https for github
Date: Fri,  3 Nov 2023 17:11:23 -0300
Message-Id: <20231103201124.14216-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103201124.14216-1-festevam@gmail.com>
References: <20231103201124.14216-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106091

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


