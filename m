Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.1961.1586720026276642076
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 12:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HsEh3TRZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id c195so8796168wme.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2020 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFy7rhbJJmwVpKmW8ohugvsbDx+ZPKhDJn3d3yw8xhQ=;
        b=HsEh3TRZaWPMcEm9eZIrPFhCmpnLlAM90u6y/4MgB83h241NoRMHqF/R6vfRepRNnP
         lKdcGWoAP18AcFGQLzIvfrugRG6CRVvUxqYs7c2YjSPRWajKsIALjpJdeVDYHwKO5dEO
         T/62uxBBqu5hyh+Z9I7/WaaRrkCf33UcUAeaeO4iAvKmRcXWsdqKKuWi4wjRn6cf/+qO
         Q8tOe+2ZfgZhbS5lQ5jg5ibwZjSAu7w96p5+M65a+96fqmb4eKbmI5t8xst7ToOHroxv
         /njHMLJfQf//mTp19v7XdJoANTm1QPXl2HlkgjCKliyxFkW/lT2pMLMvCGf23Au10QCF
         4BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFy7rhbJJmwVpKmW8ohugvsbDx+ZPKhDJn3d3yw8xhQ=;
        b=ZDjSj0zi31JPGFSKawbkf1iqGGunfzNkzIOhg5SdFm+I7MHtBlYrHIe+h2vL+lu7Nz
         1+mCulG9B0MerfPrRLIMDh5xoAty41qfEmI5V88TurnHbl36eSSoAqoTAgT7aHHRKNaH
         qv+gt3DyZqLmVTE/lbC7JKPsx/7Z69cIvpggyPl03vEkWwXkDBhnDC2O2HZbLbJ4Qtmm
         02j6ve8gmOt84jPYG+U7QbaecbHvQkhTfbiVb+lcQsx+yP1mJx3LvlWPi/FfuVd6T0oI
         UTHS9siy9HQHY2YGkN1RRB9g/iVLQ40Ll+HH4nfJGOsVVRfzk4lT6m3HTW2wy9AICt5a
         KgeQ==
X-Gm-Message-State: AGi0PuZLQKe8DPSKRwKkfmhnxJ8TVpcevTVck3k/1EZgMDeqAabSz7Iw
	N7if2KmoXpwYuwIrQBnIjQDItZ3rnvQ=
X-Google-Smtp-Source: APiQypIQCfTscyS0Mg0RymbsMufHtP5yPrVaVjkF/kvt8ON4nBS9ED7cFZip58/A2Tw5Vn7kRC2A9Q==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr15226103wms.188.1586720024196;
        Sun, 12 Apr 2020 12:33:44 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA21F0F62E347B55C3B6.dip0.t-ipconnect.de. [2003:f0:7f05:da21:f0f6:2e34:7b55:c3b6])
        by smtp.gmail.com with ESMTPSA id c20sm12393341wmd.36.2020.04.12.12.33.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 12:33:43 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] sysdig: upgrade 0.26.5 -> 0.26.6
Date: Sun, 12 Apr 2020 21:33:28 +0200
Message-Id: <20200412193330.16380-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bug fixes
    Rewrite the probe builder (#1576)
    Build fixes for 5.4+ kernels (#1595)
    Use Debian Stable as the base container image (#1605)
    All the fixes incorporated in 0.26.5 (that didn't get artifacts released for tooling reasons)

New features
    Support for s390x and ppc64le architectures

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index 11eb5db9e..8074b2e0e 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -22,8 +22,8 @@ SRC_URI = "git://github.com/draios/sysdig.git;branch=dev \
            file://fix-uint64-const.patch \
            file://aarch64.patch \
           "
-SRCREV = "9fa0d129668fdabf256446be4be35838888052d9"
-PV = "0.26.5"
+SRCREV = "8daeef8da752c5f07f439391bc20c5948eb11470"
+PV = "0.26.6"
 
 S = "${WORKDIR}/git"
 
-- 
2.21.1

