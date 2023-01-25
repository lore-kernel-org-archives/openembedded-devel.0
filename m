Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFFFC61DA3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44969.1674653491218567072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BMIc3Y73;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id t14-20020a4ad0ae000000b004f51f61de9fso3133632oor.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNhUt+MkqmZ0PO3IIuF8CduZCOQSpcg9MHZEi2ripwI=;
        b=BMIc3Y73JHr24t/FeXGvGrnnF54sX6f2mQ1zjtV29K3lsopjjm9CZE2SCIzSpfyt1q
         Rqqldf8jyCUJ1LCcaqUkVjXq75jct4+o57HHLyKiJvz/CyVU9iLVRFEKGWKME20jTYsc
         1zfoRqWv1+ycSClgMEsk1ZISy8pNFiQkh87bfO6Y4anYCENSRkbFkOMHHAE688AC7+ck
         EnmHvfd/SYBQMoU7HYa03E9ou4UEPGyzAGMgLbWU25bt0cqJblLYImjSJSnJ6iLE8nKy
         Vb3ImfMx7w01fo14niP4rzUn+dW3Pjh4iH7pPty4maEwFCk5C5U8lxogSK9cZ/lqmchI
         E6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNhUt+MkqmZ0PO3IIuF8CduZCOQSpcg9MHZEi2ripwI=;
        b=mIjraBHG8k6soVwMRNldfR7WQ7fYW/hIdz0wqziZ4ZNc7d9qnbQA3dE10T4mKBt8Fu
         uUDn6VS0j678brS3NRl3nOiywphHw1zINtI3KpjaKakkQ2sNNQ7mz4fj9dn5SHSHuV7W
         /0n8z/f8hCO20GVEMedmckwedXAa4f617BEVDrHvWhqmswClSI041EaPkf03zi+U27dC
         wf5cE233sqjtTtwLH0fzsg9PKCRXi6HpTSInUGG52gS1a7K3eqVklUDTKYoA8qjjISAR
         +4RoGuZn5AIQi+z8/KqSmKFZsb8+SasDWugf6h61wuGPUIO2gGjvqWqlo2wN8+yy6bo2
         fvBw==
X-Gm-Message-State: AO0yUKW3R3EDRf2kuM8chFT/F+bfYBYgXGz6jEOgSV6QzZm9lvGLOgR/
	WOj6bQTmz4CyJFCqIBDenuw7k7L2uMc=
X-Google-Smtp-Source: AK7set9SFSaeMWooVrF49hzpuSU2nQOpDGxp8PCFKnlb+BrCGT9S5sZe8bG8uMaLNi5hO9g7znagHQ==
X-Received: by 2002:a4a:d81a:0:b0:511:d15f:bfe1 with SMTP id f26-20020a4ad81a000000b00511d15fbfe1mr658780oov.1.1674653498799;
        Wed, 25 Jan 2023 05:31:38 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 13/41] audit: upgrade 3.0.8 -> 3.0.9
Date: Wed, 25 Jan 2023 08:30:55 -0500
Message-Id: <8dddba5045929496838336d3ad89925fcd2e19e0.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100748

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    In auditd, release the async flush lock on stop
    Don't allow auditd to log directly into /var/log when log_group is non-zero
    Cleanup krb5 memory leaks on error paths
    Update auditd.cron to use auditctl --signal
    In auparse, if too many fields, realloc array bigger (Paul Wolneykien)
    In auparse, special case kernel module name interpretation
    If overflow_action is ignore, don't treat as an error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 01eb5561da2823a8bb80e790bfbb6cdf320ce09e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.9.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.0.8.bb
rename to meta-oe/recipes-security/audit/audit_3.0.9.bb
index 78439f66fe..dcab7dcc88 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.9.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "54a62e78792fe583267cf80da717ee480b8f42bc"
+SRCREV = "81fa28e0e8b4be83ddba03de8b816a3df510c17e"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1


