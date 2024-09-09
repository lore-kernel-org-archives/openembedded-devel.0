Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE4CECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 11:17:53 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.50554.1725880669142465719
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 04:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Kr/2izIa;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718d6ad6050so2155591b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725880668; x=1726485468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHVjDP+efFfA8Ey4JkXqdalcy3husgRTroE5Zz3r2i8=;
        b=Kr/2izIaW5LniHmDajEjgRaBi0vCKQQIr7NwXrz7V0yczH1UUgcoaUK4bcUKT+l2BX
         aSqAwNX9f9e/ATI64K5SSzhA4Ee37Ykhy4xxOAFmGxkotiHMkTY09k7EwFXNS+guYLHn
         BKeewN5XSwyYsWKJ6aid/ACb/9kknQPCgEaVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880668; x=1726485468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHVjDP+efFfA8Ey4JkXqdalcy3husgRTroE5Zz3r2i8=;
        b=m1xAWzmA0nd5AD/xtg35Lrz84oMly3lISH2/13BCXJ9Ebj+FzfKrEMNQktmMd32RRz
         1AJ8hEfqUJZ4CR32NXg1+uJiRoiM+uHcpcUNg+mdjutY7KtIOk/ykhFXkhysf4rzh5mL
         eTFPP2Og5fNChYbsVch27klzinPniKFdl+ZElKtZyU3ZeYWJiQOeYVRkw2WvuSMO60RA
         wXPxRYNBajmeYL+CcOvgzYuyHc4t85MsUc92qDZhubCUlvQNJoMuxQucZ8vBL9dEXMwN
         SEs3PUfT5sZs2WBTPYAREr9BP8vfV8fuu4ptFSWPIC/OtmScpP9hEwhGzLJNi0tXMY/8
         +IlQ==
X-Gm-Message-State: AOJu0YxTmYi7WXj+H46RW1k/sGWiWVv7MVP12rhgU8JKxkRS2oU1ntT+
	xDFh23EW0KEMDOe5P2KNomcKzgvRbUzoFkVukc+8fLZtK4IovX29JMDrwTtkXtP67RG7HKWWdaL
	95sI=
X-Google-Smtp-Source: AGHT+IHIXmsg9awf6cGRX8fwWShRN8cLDja5ycTA34ZddsU2xH+U9TNaNyr9nxoEbWSa2PT/bLkzyg==
X-Received: by 2002:a05:6a00:85a2:b0:70d:2796:bce8 with SMTP id d2e1a72fcca58-718d5f3370cmr11311382b3a.20.1725880667766;
        Mon, 09 Sep 2024 04:17:47 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:882d:5ef:644c:7a2b:cd09:2eb1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e58965c8sm3440190b3a.15.2024.09.09.04.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:17:46 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][PATCH] wireshark: upgrade 4.2.5 -> 4.2.7
Date: Mon,  9 Sep 2024 16:47:36 +0530
Message-Id: <20240909111736.2253599-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 11:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112177

From: Vijay Anusuri <vanusuri@mvista.com>

CVE's fixed by upgrade:
CVE-2024-8250

Other Changes between 4.2.5 -> 4.2.7
======================================
https://www.wireshark.org/docs/relnotes/wireshark-4.2.7.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.6.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/{wireshark_4.2.5.bb => wireshark_4.2.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.5.bb => wireshark_4.2.7.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index 7cbe3e632..b80710683 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "55e793ab87a9a73aac44336235c92cb76c52180c469b362ed3a54f26fbb1261f"
+SRC_URI[sha256sum] = "2c5de08e19081bd666a2ce3f052c023274d06acaabc5d667a3c3051a9c618f86"
 
 PE = "1"
 
-- 
2.25.1


