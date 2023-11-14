Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2654C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:11:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.13332.1699971068191113494
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 06:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=XSWwUglu;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40839807e82so33428095e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 06:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699971066; x=1700575866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+zMqOvqlKxp+Mnv2lwG0tT58aVP2mHS63LXbxArHG8=;
        b=XSWwUgluzCNevXX2VBtXdM8g8bsE4Sc4NPszWm6V1hOfxXMmqWpG+yp4RsQcxpf7lJ
         ++hWNTlwm2V7T80qFHMsEwxoKikeB1JT9nZUSp7KBX3JGMZYR9H4NwYcHnKSYwz3aT4b
         9QC8tHbPbSJzlJf4zXdt4bXyEk9BKyhV2gwWH0lVgCtSMZm2NaXS8dpWaIPZXtlb3a0k
         CWFxgm8prswt5DFoJLUct1CmPUav5uFa7UaOd2wtSHGx0AWajdN/kV0JDw+zIYgATieu
         +SIOxanv/UlYtnoQkQGXZULOXqUT8y+q9pz6yOWtuoomcM9pvPjtGzQVi+6zVdF7onvO
         ScZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971066; x=1700575866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+zMqOvqlKxp+Mnv2lwG0tT58aVP2mHS63LXbxArHG8=;
        b=X4fviWaouy0W0fIHk158LdPduMhNG6NDcqPVTYHoQupw8kVrcRMt/G+UL/owz4wC/o
         L7FnLQSlvpgtXuA1Q2Tx5IaRrOxaXVFl/2IjvlpgZyVg0SDAyjB07ea27BWGQzYjLAcJ
         TtaWVXrZQR6sPeDMPLLdWN1CHOhcXwzsEKeaUdSIErNPJTnV/keeg4UW3xrnak73zx7K
         7yA79AXJLw5rr+/+2hrbOYBCY4xspUpFJyl2K69xfQPMvCQIk70JKlMM8MRGzWlZHV/U
         /pJbgyT5d5GMCPwKlwtcbfkUbolVXW5V77/u8sIzfQES46lsFJP5r5BYlPd9AEsfaWtY
         AMVw==
X-Gm-Message-State: AOJu0Yz2QCDJQlopsyLkJL+dBE0YzYEXxyh8ESMOXhBSby6KrbE/anfu
	dbENfJLGNAPEDC8VBzQlC41mOvV7EkDuLsA7eaE=
X-Google-Smtp-Source: AGHT+IGCSGiM3AwdjidTiC8k9uDSLLZzlHbSAnGo68WID4xQiCFUEHhOlE2y1AXMBm9gPL6+d1ljwA==
X-Received: by 2002:a05:600c:4fc3:b0:405:3be0:c78d with SMTP id o3-20020a05600c4fc300b004053be0c78dmr2486024wmq.3.1699971065645;
        Tue, 14 Nov 2023 06:11:05 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id fm14-20020a05600c0c0e00b003fee8793911sm11465954wmb.44.2023.11.14.06.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:11:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davidegarde2000@gmail.com>,
	Davide Gardenal <davide.gardenal@huawei.com>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][dunfell][PATCH] usrsctp: add CVE_VERSION to correctly check for CVEs
Date: Tue, 14 Nov 2023 15:10:04 +0100
Message-Id: <20231114141004.3304205-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 14:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106717

From: Davide Gardenal <davidegarde2000@gmail.com>

The current version of usrsctp is not a release so cve-check
is not able to find the product version. CVE_VERSION is now set
to 0.9.3.0  that is the nearest version in the past starting from
the revision we have.
This is done because we don't have the complete 0.9.4.0 release.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 279fce2c87c990c942bcb2b72ea83a67e0d74170)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 4f8e4d428..dcfa7406d 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -23,3 +23,5 @@ PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
 PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
 
 EXTRA_OECONF += "--disable-debug"
+
+CVE_VERSION = "0.9.3.0"
-- 
2.30.2


