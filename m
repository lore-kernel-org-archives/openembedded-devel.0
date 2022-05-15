Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608E5C4321E
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:50 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.17037.1652622587872429778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qg42eG9m;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id v10so11757677pgl.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4nJcICwIYV1XcQqNBOi6XC47tPh2dFkbaO9Q9YImdjM=;
        b=Qg42eG9meT4hIyQhOUOdU30cCAobqFN+NWznJp3wriEhzTqdiCPBhlPwXjSHP60SEk
         A0rr5V+UfFKtYbRDyNcolP7lTeH2XIlVAaKinaeiJtYCoDlQE72DVidZulRYeGPY7RJe
         RrW8J4O1lde42jCwqfDB9snNVT5L27UyFNFfWQkxmlBbs1c3x/KUh6A0Bc78BpbUBwq5
         1nuAgsHRJntxDAyi19zUgL+rwPPMrsBlm9f1qJjcrKu3GX6Srxz8skMqBfeEqkzk1zjT
         Uk3i+P01eFWwyxZPWQ2q9b23Y4z9wHicbsHw3RwtGSF7hi2YHdWpXDbC/znLpHjV/GrW
         9qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4nJcICwIYV1XcQqNBOi6XC47tPh2dFkbaO9Q9YImdjM=;
        b=d3Wnb8WrQ6osNV/ECyvpb4zi8cxGxL90YJVpObOVTlC4UD6LtqVQ1VUC84/JhvxpGa
         5daWg0gwJs3WG99F2lHfXMRfL0fmEUqiUcaAc1OmN3SuX63U1VAh3piKO1zDRpoeha2/
         xKNWTjgH8lp4okhvpSbtIawzbFYT5+ZRdQOG6eN7KxAv7PZtJqNGlX3cCmQksZzKGTbc
         JEGx0UGADfMplCe0NofJii1KR7etF+EwE1C0KStDHan3FNyvTo6hP/dEgj3VpT++U+BX
         izRK1aZ2EcBO3/B4pTljaLVSA/Jt8B4XlXx88HR46sON+8YXZ58TzTd5pqHwtBrvK9d0
         VmsA==
X-Gm-Message-State: AOAM531e5zRBVPAZ1++mti5IYem23a1BeE7LXqP6u5RUYAfLugguukWg
	V+NFxQQ+eLYGfngRJfMAfLxVPKI7aLmHNQ==
X-Google-Smtp-Source: 
 ABdhPJw8Ak496CF6tT85v3llTjoZTvK4dmAISVnrA70qGtzWhzMncnTsP2XrxkOvMrh43p5dXKe37g==
X-Received: by 2002:a05:6a00:2408:b0:4f7:a8cb:9b63 with SMTP id
 z8-20020a056a00240800b004f7a8cb9b63mr13320107pfh.33.1652622586988;
        Sun, 15 May 2022 06:49:46 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 16/22] openldap: Upgrade 2.5.9 -> 2.5.12
Date: Sun, 15 May 2022 06:49:16 -0700
Message-Id: 
 <8c54b3c147a238576c3933ac28f43e19b5930a25.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97113

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

License-Update: Copyright year updated to 2022
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6c2bd3c0fae072e23f6572d5448fce5e5f4fae08)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openldap/{openldap_2.5.9.bb => openldap_2.5.12.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.5.9.bb => openldap_2.5.12.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.5.9.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.12.bb
index 958a21b9c1..e4475e5069 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5cc6ef74da4ad25d707c4f5903d64975 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=beceb5ac7100b6430640c61655b25c1f \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -25,8 +25,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
 "
 
-SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
-SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364e6fb9e"
+SRC_URI[sha256sum] = "d5086cbfc49597fa7d0670a429a9054552d441b16ee8b2435412797ab0e37b96"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.25.1


