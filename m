Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F1BC072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 16:14:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.17363.1700064894214873638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 08:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ABl173oP;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40859dee28cso57490425e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700064892; x=1700669692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uW+E4foj1+2IqqM+6tALGIqbnsDBzkCMdQYG4cBZnk0=;
        b=ABl173oPz5+logzzoVMtd91p88Ek4QQ+aZiVe6ENW4vsMgcApdELTJ1KLue3oyrWbV
         x4tVo63Ognw0HRDoWFW9VWnL/ybxikkLB6daSsw1FDdGdWrlIgnYztLvTFlY+xrb1naf
         51zLe6tSfCnGym33xhD1sHMpwzxYxe3fobVr43u0fVoX5gWQROcEii15Cl0KDlQl6SXq
         dQEx4FoFVviUubGVmlMTPQ/FGREb9zGUyMJftl2mhqYKCMiPnvvkgtN/lPUfkIcRJm6X
         FSf4VMdb364derDrWvrJNKN568Ynyml+kuy5Fk+9UQSMOb91mNmeSThAg/fq/qRjAnEa
         isMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700064892; x=1700669692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uW+E4foj1+2IqqM+6tALGIqbnsDBzkCMdQYG4cBZnk0=;
        b=JtbcoUPou/cZVnvfUQvmnFzJbIW5u5ojv9gcOr2oGAu2OAEgN2E4HYzAlVQIGL1+jP
         Kxy150dE7Z/yku7ZRwWs08zkEysLUfm4XGPKWrgnGmMWhYTx24CY15BeCeErBWAog4f8
         8bE3MXt7kDDxE6bvTMbJCpNK0yg+PjhnH82h/grCkhWHBh2V4lWAXoo7MWLysrf27jnh
         GiOZWw7FSDbjOhrZ3OJdf3pMx2GILjARoKQoQdLbIX1Wx70bY0VQsPEw5TxXiFnUa6ZC
         dc+N31ZI1Q6T+TRFc7q0MzUdqbvkiNI5M5G0xbWgDUR0JjW7v4iylZhAGMQmSNJHCoiy
         LyFw==
X-Gm-Message-State: AOJu0YwoDk4YBAt8YGQGhv35uPQ/ObbJUiUWyfg5ZY4yJOzI4VqkRB0d
	Ttd+3u/tof7uPEGlmbDTpqYmDSt/xb+6UktbDU8=
X-Google-Smtp-Source: AGHT+IHxFfQTXh/oqsCdU1vWq7LaC/mGWIrfJbe8ndn8DJLffAafB7mkGYVhu5LqGemdnwhDDsNFhw==
X-Received: by 2002:a05:600c:22c2:b0:406:599f:f934 with SMTP id 2-20020a05600c22c200b00406599ff934mr11287147wmg.12.1700064891713;
        Wed, 15 Nov 2023 08:14:51 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id h38-20020a05600c49a600b004064ac107cfsm123349wmp.39.2023.11.15.08.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:14:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] meta-oe/static-ids: Change postgres to 28 to match forced id in recipe
Date: Wed, 15 Nov 2023 17:14:43 +0100
Message-Id: <20231115161443.2181675-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 16:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106763

Current recipe does impose UID=GID=28 in the recipe code.
Change postgres static ID to match in order to avoid a warning in
reproducibility tests.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/files/static-group-meta-oe  | 2 +-
 meta-oe/files/static-passwd-meta-oe | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-group-meta-oe
index 09c7cab2c..f20c86f65 100644
--- a/meta-oe/files/static-group-meta-oe
+++ b/meta-oe/files/static-group-meta-oe
@@ -2,7 +2,7 @@ redis:x:600:
 xrdp:x:601:
 sanlock:x:602:
 mysql:x:603:
-postgres:x:604:
+postgres:x:28:
 zabbix:x:605:
 mail:x:606:
 nogroup:x:65534:
diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-passwd-meta-oe
index 4c312b7b1..00f3e107e 100644
--- a/meta-oe/files/static-passwd-meta-oe
+++ b/meta-oe/files/static-passwd-meta-oe
@@ -2,7 +2,7 @@ redis:x:600:600::/:/bin/nologin
 xrdp:x:601:601::/:/bin/nologin
 sanlock:x:602:602::/:/bin/nologin
 mysql:x:603:603::/:/bin/nologin
-postgres:x:604:604::/:/bin/nologin
+postgres:x:28:28::/:/bin/nologin
 zabbix:x:605:605::/:/bin/nologin
 cyrus:x:606:nogroup::/:/bin/nologin
 pcp:x:620:nogroup::/:/bin/nologin
-- 
2.30.2


