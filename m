Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF61AC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 04:26:44 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.6266.1708575999188466854
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 20:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DtEK01ot;
 spf=pass (domain: konsulko.com, ip: 209.85.215.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5dca1efad59so6797900a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 20:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1708575998; x=1709180798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6etmwKZpdxTq5PO+kVpqIJJow5pfqVVcJqOs5+PwtuU=;
        b=DtEK01oty9ktTL9QF2zG8TUL1r5GW7R/r28gqtgK1ynuKoqB70b6btXc1mn/7UcTeU
         j6Wizk7VbC8CqWX288GXW22BKkUFw9Ww6z4WKfWe/vKiaGfDRw5cDyWw2yFXSx1ODcpg
         88+pcKnhnr1gIhEd4uErJGeczJMcJojQAITcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708575998; x=1709180798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6etmwKZpdxTq5PO+kVpqIJJow5pfqVVcJqOs5+PwtuU=;
        b=o+/VpScCmNCitppEtWt4dlAECxvQS758oJTEacaM0B2HazAa8tB7lomLD6Jcd+oUb9
         jeukk76NTYNFo5DHnKzRZYDcBDU3HWtcyI0zPt+oMbdC8mHmUn5SEmBrXHljZRHB6vyf
         9ZOo+++SInf/qFpRxbixE5c1QBFMY1QMw7DfjtW5/PN3D+c3+bNkk0AEvpYe0mBePLJK
         DcRA8vVFn1LwbXAMAT+mtCPcLdpZB0rRHCKGOXCUZtJFnZjwljmQTJROpXWOEU3zGgRZ
         naFsHQ7CTrYpArnJhOrQO7m0siBGGATlR/i5YkDuZoThrQiwXOdoDB6XsBzd+dUUz/7z
         Js7w==
X-Gm-Message-State: AOJu0YxMAOOyDqAlzQYtXJUeeABWgMOkqr8qi/Ixy0uEldzfjDXZKHrL
	FXYRHyFNcHX5eBYGwTcKeE35DmcULU7HhQrnfv6/h73ohCqpXyTSvvy1wmKqdmmly1rweADCYg7
	abXg=
X-Google-Smtp-Source: AGHT+IFrxxFLEl/CPelJaFAer0qTRXU4jrE3UAGkk7DX/3b7XSSDrw5/nMV5PwWPJW7D/W+xnBXt0w==
X-Received: by 2002:a17:90a:ca84:b0:299:4f75:150e with SMTP id y4-20020a17090aca8400b002994f75150emr10098885pjt.47.1708575997839;
        Wed, 21 Feb 2024 20:26:37 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id w13-20020a17090aea0d00b00298c17e8135sm10730082pjy.13.2024.02.21.20.26.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 20:26:37 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] meta-oe-image-ptest: add PTESTS_PROBLEMS_META_OE
Date: Wed, 21 Feb 2024 20:26:29 -0800
Message-Id: <32305e4f0fcb8b47212a70bd6febebc40a9604a6.1708573650.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708573650.git.tim.orling@konsulko.com>
References: <cover.1708573650.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 04:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108979

In oe-core, PTESTS_PROBLEMS are also enabled, so even though
the recipe might have failures or the ptests do not run cleanly,
the BBCLASSEXTEND still works.

Enable the same behavior for meta-oe.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb | 2 +-
 meta-oe/recipes-core/images/meta-oe-image-ptest.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
index e8e1750b0e..da942e8bee 100644
--- a/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/include/ptest-packagelists-meta-oe.inc
 
 # Include the full set of ptests
-PTESTS_META_OE = "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE}"
+PTESTS_META_OE = "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE} ${PTESTS_PROBLEMS_META_OE}"
 
 do_testimage[noexec] = "1"
 do_testimage[depends] = "${@' '.join(['meta-oe-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_OE').split()])}"
diff --git a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
index 4cd1f4497c..b32df0e221 100644
--- a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
@@ -9,7 +9,7 @@ SUMMARY = "meta-oe ptest test image"
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
 HOMEPAGE = "https://www.openembedded.org/"
 
-PTESTS_META_OE = "${PTESTS_SLOW_META_OE} ${PTESTS_FAST_META_OE}"
+PTESTS_META_OE = "${PTESTS_SLOW_META_OE} ${PTESTS_FAST_META_OE} ${PTESTS_PROBLEMS_META_OE}"
 
 IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
 
-- 
2.34.1


