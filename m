Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FBBC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 17:17:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.152.1634318228568508006
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=bpHWE8et;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id x27so44203601lfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2xafLwPwGAy9OBDGgad4oSGPGzDkgvAQNMv4AhcpSeg=;
        b=bpHWE8etTfdQaD/vikVnDDEzU8vjJfgkMn+T5oCUgDFcX8AVVQpsPXmB9FwsEw5X+k
         YXO9JDdW1EramWPL2Bt5pRYf98Qx9id3YArcwjEYMtXim7sSxYmLsTcEPO9NDd3Ebj0D
         aUXTnXTPVo9e2knVaySLw/5Ql1zuWsJ25MxuSCbX9Orh4oPFt72YWc0WCW6YiYyVKeim
         I5zlPUcF7OcjRq2W40nR/hFkukegTDIjrnDl2VT/l7ZDSUg1fluJPeHs6N/tyc5n3hw8
         eptLMU3blgtx3kguX5FZGb5RBgzxeJqAN44B7SPd40Bx6c/wHm7Ki8Y+2AutdPxy5GGy
         no+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2xafLwPwGAy9OBDGgad4oSGPGzDkgvAQNMv4AhcpSeg=;
        b=MHbESBtHsMhh6oOldvOZXvETQbeZLzCorEIKOfwRwZDst+BeWWrNW46Cr06yjd8/sa
         zB3asiRweyuvCTcZyShcTqJ8KY0cM54nC8A87rOWfV5YopOOTgjor7ZEbUbE3aBSQlBi
         XfR0xPOvMO44RrW37OIEP8fotcBsnwWoGRWjTR5f8qtFftUp6i5PrmDL1XRYjGdiUYRS
         lFcR865U6itU4hgqCXe/ZtCc1IfnkaukwQ09El5wNrKyaePGTP7GihTkIk68oWyu8Qhi
         TSrJRzzI3FkR99Jl1ssHCwV/vH19Wmhm2po/3yQdO9gvlOxrw5LY5RyfCqMrEXGTA9wf
         e1DQ==
X-Gm-Message-State: AOAM532rrxJ0501l/1o1p1neHIqXO4HLbPteCnJ5MrGTbBffvGqTcdVT
	Edg7pJ0lnTxCYbVR2nH/wN34SFBqymTL6opN
X-Google-Smtp-Source: 
 ABdhPJyEpUHhx4IrUfQuZAlUATwnMO1/Qx99YGbXwBNdrbg3caUxFEI4UUF6xdpCPV4rFBslvWIiEw==
X-Received: by 2002:a05:6512:4020:: with SMTP id
 br32mr11903519lfb.569.1634318226193;
        Fri, 15 Oct 2021 10:17:06 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t20sm617676ljc.40.2021.10.15.10.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:17:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] bdwgc: update to 8.2.0
Date: Fri, 15 Oct 2021 19:17:03 +0200
Message-Id: <20211015171703.717553-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 17:17:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93327

License-Update: copyright information was updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../bdwgc/{bdwgc_8.0.6.bb => bdwgc_8.2.0.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.0.6.bb => bdwgc_8.2.0.bb} (84%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.6.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
similarity index 84%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.0.6.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
index 391fc8751..76738a76c 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.6.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "A garbage collector for C and C++"
-
 DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
  used as a garbage collecting replacement for C malloc or C++ new. It allows\
  you to allocate memory basically as you normally would, without explicitly\
@@ -15,16 +14,16 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
   Empirically, this collector works with most unmodified C programs, simply\
  by replacing malloc with GC_malloc calls, replacing realloc with GC_realloc\
  calls, and removing free calls."
-
 HOMEPAGE = "http://www.hboehm.info/gc/"
+BUGTRACKER = "https://github.com/ivmai/bdwgc/issues"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.QUICK;md5=e3d68fff6b0c661d949d8df559fdc78f"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=7912d9213b3547f8a81aadd08893fe84"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "3e1477b72ef4329a196d67b74da4cbe274d04eff"
-SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_0"
+SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2"
+SRCREV = "47e9106c17b72e9ee5501308f69ea94531e798b3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


