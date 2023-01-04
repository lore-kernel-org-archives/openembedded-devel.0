Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3DBC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:44:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.729.1672861467077272027
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 11:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RV3dO/6+;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z7so17921440pfq.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 11:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nu7tYCTBRmR4zz5Nj/vZ/P3hURzwdiZwCJNsTuiXTzo=;
        b=RV3dO/6+GwcFMFOpcC3ZY2J0jMY4T/A9E0hlw5ogZh4a0dmHfz8yi9vpLZzscJ9rmh
         xEs1kpA1MoMN5NOjPlEyqxJfOEZbjvdUjlDz2x8fGK4JharYMMrlZ3YAUaTkVr7r7omb
         kPPlrtYt7BRqriJd2d/gz+IkMxG6Z8KYhcnVjniVnbgCEPz2WGHM8FEiW9BlP0zDc6oy
         N1oEn2Rbh2FfrnMT4Hm9GoKIitqC7Ulx3a8BFut0gSt/t6/Pamay1YAIlnmyvnygXRWo
         U/Zd/SFeeV4l6G1CCtImI4BCzK3H2dkdbfmFLnzc5pSu96XV6woCeIbjXo5Gt9ZEFxiG
         QH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nu7tYCTBRmR4zz5Nj/vZ/P3hURzwdiZwCJNsTuiXTzo=;
        b=xhXuJ5m7/hW856OAGLGOMJMnqvq7N+92+7oxU/u5Ghz2dUdWPFIQx2M+OCiZx65/6g
         mEPNgzQvEHhS4hmH2s4Py0wlUFVMvo/nKuOmuxMGT/yhBCM7GIcHOKTGVKxMIueYjNGA
         M/Uhl7y29GLrzblC4z2aAhnlcH4tbPoxtydNOAfNobFQuCdCEFcBMDKxZBvrbszliw/u
         1p9D+bsd++NKM2HR2159LgUuKZjTQzQsTmukXDX/UgZjSoNcTxyvurxp402G4e1Kpham
         9+bKXWxWPJZhTxjhab0liL/Qr+w5To46KPdIK7yYP3kEscz7qJ743zK49AGL9lmB5tuA
         l94Q==
X-Gm-Message-State: AFqh2kquUFntOrSiYs1e9W2YkiKnYhzoU/SfFosWzSiQdBMXzFEepx17
	jcfIeCQZs6HehyX/GrtrVdlTcvxNd9g=
X-Google-Smtp-Source: AMrXdXty3TT3VvI8dluzDYlU+bZ6XqEBUXGjO3x/eqM6RzlCD/rMqz1dhUKmvF6OJyensSnWhQeXqQ==
X-Received: by 2002:a05:6a00:1d1f:b0:581:ad48:d480 with SMTP id a31-20020a056a001d1f00b00581ad48d480mr24480405pfx.34.1672861466270;
        Wed, 04 Jan 2023 11:44:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm19817753pfz.157.2023.01.04.11.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 11:44:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] sshpass: Use SPDX identified string for GPLv2
Date: Wed,  4 Jan 2023 11:44:23 -0800
Message-Id: <20230104194423.2386950-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 19:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100402

Fixes
QA Issue: Recipe LICENSE includes obsolete licenses GPLv2 [obsolete-license]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
index 5c52437af8..ad7b083100 100644
--- a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Non-interactive ssh password auth"
 HOMEPAGE = "http://sshpass.sourceforge.net/"
 SECTION = "console/network"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-- 
2.39.0


