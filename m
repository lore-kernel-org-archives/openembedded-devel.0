Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CD5D2E033
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:03:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1079.1764921805874687117
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WDBo5ELu;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297e264528aso18285415ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 00:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1764921804; x=1765526604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30DQnTicUaWtK4JRmveIKHNeK62DoQ6Yex2b/FCDCFQ=;
        b=WDBo5ELuiBfZe8sbMk18k1lrGjUynDOAKUilF5gtsu9Nv/vB2A3d/y0FITpwphZRu8
         XUAwAJWO/crdl2IjWtGkChM1yMI0xEXGOXo9oEIOdUhGbbIx2TVkkUKffDxpTb6MQGMr
         rPzvB1lKw18pC5kRS+W451Rzu9NLy0U4iq0Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764921804; x=1765526604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30DQnTicUaWtK4JRmveIKHNeK62DoQ6Yex2b/FCDCFQ=;
        b=uJKNCwuvbdXhPjWNf+HmuvoAhm9ap8CJ0FRPzrl1CY3hRq3oLGhYVv7r9rdI/jFVWN
         hpwW9Mq2kbXNdKsySQSdfQYi8VTe/xb/PHizbgO8KvAszqaYzsn1XF6mb7GjmrvSGok6
         1R/Hai3UqcO2BGZ8ZFa6q7XoMdNnFYKg4FQqsQb/edT9hwG1q7WJGWt6tdyZIy3pSj0j
         1i9cx4fwOS34zQut6+xKBS2Xw7hF01UVJThVNJ9qoQKY98eQhrsQ0TcdqQ1NOqSe1BMs
         d9kSb3hURP8uOVOllV7BzLJRx9h1cqYayXWBgNo0wk2xo8ngAgsBpERD/keGDLiFGUMO
         fpnQ==
X-Gm-Message-State: AOJu0YyX+lwazO/m897b2+U8/k149mmXy+sxxYlL/pMtzWh+nWz4r8iD
	xVqFHUo+8wimbhKEgg0qOuHGtxdidyckjUNvcDSd2Ud6mZnNYOYRWVPN4qAGixqKU/YzxjbMQkm
	GaXO4
X-Gm-Gg: ASbGnctw/86KuHBNuwvUCpTkIsfjNo76+TVyooE15wb0gl5Pq30MRtFTUCmqN4Ez8+D
	p09CWobHEBXFR/Yr2nZP4uuD1Hb1j2isdhcu9voYEkCxWpYVZTYfpyX//doBTQp5NpXEFM78nhM
	Ef3Aiy9rAuna2ihfFKdpKQTZ0lGOyIJip33zVplXvnHmghPQsy85yUETwzrKXJTBSpBuH6Lsign
	O+Vr48VlwZ3/hvha48NQFbdZBcyF30G5UXY9GNSyxur9TaxPIBRwoverVpsHwM70VbCkRxntGBS
	+k2rY6hnqfEDcsXcBI3NuYR6WYYElR2t6Taw6+yLnStWj1BVF7FSdk0iGoqL83RtZhl2J5lPbuS
	w/SBA9UeUIkg3PY5BL0p/Xhxi9/QuH6W4fJOMMhhGbmJoOOrK1F9BdkfDeG6JRcP8SLYfBhmVE6
	ySej+1YeBK4jYYnE52mj5dtGc=
X-Google-Smtp-Source: AGHT+IGHMSQMPKacN86kj5ep8+7Teu+pHYqEVsMjhRDrZI5+Ziz0CWwnOnQQd8x2H1z9e38YRKNOjw==
X-Received: by 2002:a17:902:d48a:b0:295:8dbb:b3cc with SMTP id d9443c01a7336-29da1ea3c0cmr62529185ad.42.1764921804488;
        Fri, 05 Dec 2025 00:03:24 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:7205:8451:cf5d:1824:de5d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabbb1sm40016575ad.82.2025.12.05.00.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 00:03:23 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][patch] net-snmp: Update Upstream-status in the net-snmp-5.9.4-kernel-6.7.patch
Date: Fri,  5 Dec 2025 13:33:10 +0530
Message-ID: <20251205080310.2715426-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 08:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122339

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
index 3f978d5f80..9111ed8ae2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
@@ -8,7 +8,7 @@ This breaks the hard-coded assumptions about the Ip line length.
 Add compatibility to parse Linux 6.7 Ip header while keep support
 for previous versions.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
-- 
2.43.0


