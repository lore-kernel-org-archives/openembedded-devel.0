Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E735C61DBE
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:54:04 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28017.1787799236569965462
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FFtMhRaZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so1463920a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799236; x=1788404036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iENykjeAbNPhU0YmyKIqNPBtVPQlmrvwwIbwqSF/va4=;
        b=FFtMhRaZPEBn7lQzcw8Vt8o5lXMDzuTAG/fbv0h8xnCLsBr5e/KFUIg8YwiBtcLAZB
         mdl8okTOuCnzPVx/yM6Kx79FFspo+zKFKsH4CkPQDvOqm1n1RMLU9hRq50OWG9B6Jtos
         IOuKlbUPl+abDv6lB7/gokutNUfGcLjSc6q69DGJeQpqXQUCOi1AO1mp8WHn7WwTClm3
         IFQeNqEe46oaHpq4xqGHOLhQmu21vVfZO75T+QJxAwOwz8UXbv2fASgca2g1tyJu/bNP
         2sFz8zqpi6oLpFzs3kRoRnA/kGkJTAwCogjZo2OLgeORTHPNbUD47Cpo3+QxLtsg3aNR
         2pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799236; x=1788404036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iENykjeAbNPhU0YmyKIqNPBtVPQlmrvwwIbwqSF/va4=;
        b=IkjiDuMZe0iaOWDlI/ViKyBxMud3YOzQ7oEq9J4G9Y7YNXNVUZUORGMRoawszCxzDW
         LU++oNZgNcPqNYyEpb2AjFxVMpVw8b0cZqzrXNYNegcfeYgFUA2WSkuUuQrcVcSLauYD
         O470wr58hc/KJmjcxjNGu+kgZbe6lHoxsO32puRbPVhYG7ZQbT3YGxSljS/j8N+soUC9
         F9PjJG17yuWLFpu6BNe9D3zAS2IDMFktlWWHrHzUWZaW7LdUY3Ihm6nZZMfQS0bJHW7h
         rg39nI08eyS5EBlA216fCmBNyiVOPpdGGoR4JLwYkpV7NRs/C/eVi69jx2Gb2x5xY5e9
         fqmQ==
X-Gm-Message-State: AFuF++mR9VkqI/Vj+HTyp8VcSGBfR7SOJx8/1iQ5ly0nA0EAFv1ZBy19
	UapwIST0eSgEsyuJHwRavU3826UpMftM/j5Xix6PtPgIabHzVpGyqgALetHfNA==
X-Gm-Gg: AR+sD119jFh9IIS4HH33poYBbh91C1Yocqwa0huPx7U6zyJ6cLjNnbbHZ6+q75K/vBo
	Rz2EMDSNqV+y/1MFW88K3ElK94xs73Orx91UeAMre7kANqVedVkuU4xtA3Q63aJ885eRF+IKlLf
	9kHAN4TsiMGfF1FtlTc9+ZABRwtQH3fO/9mwKAek7YgYU+zOtj/NetIzfzdav3iCTmI0D2Fkac3
	pDMP3Rum91zRFcb1Ikbgq9dYUTChOZVr2BjD492RCbo62hW79Dk7ZTH0wY99r16MwbSa6JYqv79
	e4J0rs6kimlVU48hFPoEmNU8OOj+wjfyZr8lbYaVNvIXnH+GlH5tts7ABdcIWfq8YE+DmiNtr8o
	RFMConMuJ+ZH8GWGsltOSFZBGPVH7dtxr5muMKyUIKfk8c+cSRPQQ26i6EhEMHCxLwf+HkMVVFz
	/edm7hzkoXy1P+hy66JcwFr/Qf+IjP5S/ATAAiSLiUPmnuaaH79gXeRvruGsII745IcGR+rM+f
X-Received: by 2002:a05:6a00:2e9e:b0:851:8394:1696 with SMTP id d2e1a72fcca58-853748a6982mr17801486b3a.12.1787799235884;
        Wed, 26 Aug 2026 19:53:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 10/11] dlm: update UPSTREAM_CHECK variables
Date: Thu, 27 Aug 2026 14:53:22 +1200
Message-ID: <20260827025323.1433982-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129530

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version dlm
...
INFO: Current version: 4.3.0
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-extended/dlm/dlm_4.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
index 118b628e7a..1c09a35d0a 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "8dc23b97390236032a2fe19068c7dad23f82fb624732c9bff6898b6996c9b700"
 
-UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
-UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://releases.pagure.org/dlm/"
+UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
 
 LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.license;md5=531f5086ad0f36f6e22cb6085e1c41d5"

