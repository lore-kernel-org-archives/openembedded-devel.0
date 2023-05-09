Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08122C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 10:36:32 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.28464.1683628589492788782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 03:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iN7EH68L;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ba5e37f60f0so789025276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683628588; x=1686220588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8DhBRTB8T+8DF+9pmc3tpRlPf4MPuimKafvktyOXVw=;
        b=iN7EH68L1s7iewF632fs0QnnKirviwGb8nUV49mn/S2j+8F5kUXSNITA5lk0PMJKnI
         h1p+eAD+EVelGq7/w+HqV9ghgSeLn++DBPsNrUBkj0saSg/MYOUi8vN0M1xxj2alIqFt
         498jUgnxYCj+DBRSLdImgHAOsCAMDxef/dM1JXElRNKWRH50A2gfbhGMBm7J1i5krv59
         lGDOVgTyso1lNqX7q5crUahNcvum6TePq3U2bBpL6w2bVcnrfv6dFr1LEJcJwuinEauA
         DQP7GJEOZ5+lwX/Xq7Hr2Sf/KhhhT2WDbqq1kWSPzoyICK9g82ds7vCad0wrAntrz7PA
         /TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628588; x=1686220588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8DhBRTB8T+8DF+9pmc3tpRlPf4MPuimKafvktyOXVw=;
        b=FfN9pHz5Xloy2VRM8ZTVtbLbgsig5OkHAKuX0Vv0KUFyqJpwtILV2YPNiJrdNHsodq
         lVDlAKVBGymg6rW/vetL33HunNN2ZI1vy0QrIhoD9vTZ6BnXXCoNtKi0j+JZqPI/4a4g
         JC4Aa4UnKzagDNysFkvPvVdMPOCON+kKXHVPfZj11eZIWxjC7okAQO2XJ38RsGct42JE
         ymgSLU0EKLERnR2daT1CdYa0qaAuWOVQCiRoQ0LJfGnus8WBDEHwpDa9K4ZFTlS67ggf
         Z4ZmIGwqCrnYaUwNMFCPCBf0LJJnLEFZbXcUHxg0ojIhSq97KbAEv+WNnejkUcutYyq0
         zCXw==
X-Gm-Message-State: AC+VfDyEXZYvN34RNHzWnbvH5JWZWoetkpCOjAo6PitZ3S8+fF2SW2FA
	EBGlSVAtN1Ms3AOC37oRNXZk5ih28F0=
X-Google-Smtp-Source: ACHHUZ7rBFKVdKhU8Kbem5/KyLCfdxqjDCQysYcM0N5L0FaOpgoXisCkKViQKan2egLIBs8yabLyfw==
X-Received: by 2002:a25:1344:0:b0:b95:8f10:5936 with SMTP id 65-20020a251344000000b00b958f105936mr12223659ybt.54.1683628588506;
        Tue, 09 May 2023 03:36:28 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:183a:1604:2591:7a1e])
        by smtp.gmail.com with ESMTPSA id 207-20020a2502d8000000b00b8f3b826e58sm2978424ybc.19.2023.05.09.03.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:36:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Arsalan H. Awan" <arsalan.awan@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 2/2] meta-networking/licenses/netperf: remove unused license
Date: Tue,  9 May 2023 06:36:24 -0400
Message-Id: <20230509103624.10328-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509103624.10328-1-akuster808@gmail.com>
References: <20230509103624.10328-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 10:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102497

From: "Arsalan H. Awan" <arsalan.awan@siemens.com>

This removes the old unused license for netperf as upstream
moved to using the MIT license for netperf.

See: meta-openembedded commit 587fe5877790b6c2e1d337c351b8f50603ad4db9

Signed-off-by: Arsalan H. Awan <arsalan.awan@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 27bdecd1bcf1fa86bf4ebbc527fceb455efe2970)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/licenses/netperf | 43 --------------------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta-networking/licenses/netperf

diff --git a/meta-networking/licenses/netperf b/meta-networking/licenses/netperf
deleted file mode 100644
index 3f3ceb2fc2..0000000000
--- a/meta-networking/licenses/netperf
+++ /dev/null
@@ -1,43 +0,0 @@
-
- 
-              Copyright (C) 1993 Hewlett-Packard Company
-                         ALL RIGHTS RESERVED.
- 
-  The enclosed software and documentation includes copyrighted works
-  of Hewlett-Packard Co. For as long as you comply with the following
-  limitations, you are hereby authorized to (i) use, reproduce, and
-  modify the software and documentation, and to (ii) distribute the
-  software and documentation, including modifications, for
-  non-commercial purposes only.
-      
-  1.  The enclosed software and documentation is made available at no
-      charge in order to advance the general development of
-      high-performance networking products.
- 
-  2.  You may not delete any copyright notices contained in the
-      software or documentation. All hard copies, and copies in
-      source code or object code form, of the software or
-      documentation (including modifications) must contain at least
-      one of the copyright notices.
- 
-  3.  The enclosed software and documentation has not been subjected
-      to testing and quality control and is not a Hewlett-Packard Co.
-      product. At a future time, Hewlett-Packard Co. may or may not
-      offer a version of the software and documentation as a product.
-  
-  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
-      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
-      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
-      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
-      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
-      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
-      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
-      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
-      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
-  
-  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
-      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
-      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
-      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
- 
-
-- 
2.25.1


