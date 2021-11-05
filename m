Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343F8C4332F
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.5207.1636118167674068842
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NpDbdh0y;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id s24so11126503plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yLXcmtOHH0ELWz57UQqtCxeWHn1AagNkZMz/3Cxpx0A=;
        b=NpDbdh0yHCy13cFRo9jl0L9P1dE5PgY994LY1FgFhaJWxEoLqe68bViJJhlgimLRmv
         KsNQfnEJmly0+mSvjDFU2auSTN2skTkgqD+60LtgJ3vxqS5dLNZh8vUcZqxGOcPZWESY
         eF0oU7ggnDZnaOTvHNTmJ/iJQKHAg+Q0KWBhdLwbaJbcJcc9a/Nu3AwtVnKLV+HF5kxg
         9Uh+rFfqTwPvmikYnhZ/1XYjbDvVrN5GXZMyFICBnm0T8dMoxy1MMQuu1pAxyrcMBaXf
         /KEtx3CaHBZYiuhsw74riVlkFNyOhAVAUT+Q0t42aqRLHJYBtOBl2K18yMK4sC7CiKiI
         j3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yLXcmtOHH0ELWz57UQqtCxeWHn1AagNkZMz/3Cxpx0A=;
        b=N2oL+tj0tXQd9HSFzfB0QHwrvs9FtBDOiqarr+q80SGr+CWdmOdA0+mk8m9cAgGPaa
         Z0lyv+G4ekfN7eV0W0zq7bWhKGY/Yr+JU4FrX86qIQP3TEsD7zbi41jbzl0eKR5J7ahO
         sT4ojesOEtKjV9MJWd7gWT29H1xy/2JXMAl/auf5Qz0wRQAENwkWpIIJShuarB9wNsIy
         eA0nMa82E04rU+hQFp6m4yppAfLMSbme2HhWNh675hJkZnUM3XNGc2SzDj1/mpASge1p
         YrK9eNUV7cugaeRS/qVNepNNPr1U6hsVBzVRc3v/35l8l22WE2zXAjjVf5g/BTF64j7r
         290A==
X-Gm-Message-State: AOAM531LvPI4iVyp67rTKqaM8NLvA6ALlyWnKOH3vBXwuB6bBdIGt4Hb
	puuHxNftHL22b2GJU1LFW2FxipjH+ug=
X-Google-Smtp-Source: 
 ABdhPJyLKFX1qtLWx1ABxGb4e7wL0cRG3grKfNsRxLOaAniB+8fRRYrt/yVZF12pT0UzMoeTzEGm2w==
X-Received: by 2002:a17:90b:4b8d:: with SMTP id
 lr13mr30439428pjb.239.1636118167146;
        Fri, 05 Nov 2021 06:16:07 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/10] spirv-tools: Define SRCREV_FORMAT
Date: Fri,  5 Nov 2021 06:15:53 -0700
Message-Id: 
 <5dd554753d9ee789911e7071b062772e8c1af793.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93838

From: Andreas Weger <weger@hs-mittweida.de>

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Andreas Weger <weger@hs-mittweida.de>

Change-Id: I062eb971a83594315cc674ccb6eba67a14d5656f
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/spir/spirv-tools_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
index 8e8388e8d4..4ec9856616 100644
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -21,6 +21,7 @@ SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
 SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
 SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
 SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
+SRCREV_FORMAT = "spirv-ttols_spirv-headers_effcee_re2_googletest"
 
 inherit cmake python3native
 
-- 
2.25.1


