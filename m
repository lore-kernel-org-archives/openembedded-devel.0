Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22888C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 20:03:53 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.26107.1639253031594610223
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=a/MFUz1B;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id b19so16526940ljr.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DpC7605nfWApfzznmhUa4ZbqN62Ch5n3sb4rKMmpv4g=;
        b=a/MFUz1BbdZtAcUdh8XVTZbp3LFwJ00gOhkGBfdIRIaNXKcNelF+bTr9K1fx3EmZHz
         16xOuu0FfQg97YPyR1SCLU0evfAnn0J8TQBmO0g6P5bG6FOasZHGg73ATK4krXXTR722
         /5VX/PJwJpRjM5OnIe27FBWBvWmVs5tber8ulYC0ccEPM+tzjG+CkEPo9Qs+l/PY7Q7f
         BSdRqdKZc3DpNhBgTU2T97EaiCP/sewoi7wdZ5ixjXF1t9h5lSwIxR4l18BU5GB6lMGr
         EdfNDjn4ivfEIz4knbE6n3blr5ryI6NMU2JAS6H+8SNrC2mFHewEhtNmM+QmEwazn5pJ
         x9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DpC7605nfWApfzznmhUa4ZbqN62Ch5n3sb4rKMmpv4g=;
        b=GdXVl5Gaogelcw0PHoQ4roGQW5rS73JCiIx+XgWzsSvqvJt/82+kGfPkahWi4/JpAi
         ieMIWGYJ3dTdriZIRkkhMmfvbwGCL+N/hPrIQ05IlPGav/Udf7fdmnh3pprPGoy2ASxf
         GFAAtLvv0SzaYvXcYvTfvibmdSBsXXAMe/jDhZHZ7MYrSXQ3TzP7XcTl24MZ5kDDLxj6
         ObGrKkKh15AeCqX/Szc96cLQoXM8gsNx3hf+tELHVIgl6gx6GhPe2xw20AdvZxgmWmD4
         xzNcbN8RynUhg68SrRu3BS1kENsGQjL5Gss0nIngQpKeUppzKAC+endi5XlavXdG4FP1
         QbJA==
X-Gm-Message-State: AOAM532lwnpSQbZm4soz4n7svKtEKM/6cOSaIitk8QutL6XafwkbXF4v
	bf71mHBRPeuHb+qmDQvbi77Xoiwbtcf9NnWU
X-Google-Smtp-Source: 
 ABdhPJwzUadTE4IF9NQNmgKuQYDJPx2QpPPNBzarI/DdYld8Mo5VXBPIHEVQ22Yo4Y/7RtFWU9Wriw==
X-Received: by 2002:a2e:b947:: with SMTP id 7mr20553183ljs.89.1639253029353;
        Sat, 11 Dec 2021 12:03:49 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 f18sm722318ljc.104.2021.12.11.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 12:03:48 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-imageio: update to 2.13.3
Date: Sat, 11 Dec 2021 21:03:46 +0100
Message-Id: <20211211200346.2611977-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 20:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94299

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-imageio_2.11.1.bb => python3-imageio_2.13.3.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.11.1.bb => python3-imageio_2.13.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.11.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.13.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.13.3.bb
index eddbef8b0..38aa5f181 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.13.3.bb
@@ -5,8 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-
-SRC_URI[sha256sum] = "73e53bbf21777173232cd7a1c66361516b58cd09d4828a10dcfe83bb14c2b187"
+SRC_URI[sha256sum] = "bb87b272e1e9b05d242e11f8d88d030aefa68ca95daf3accc986d0b782ae3cd5"
 
 inherit pypi setuptools3
 
-- 
2.25.1


