Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA65C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 18:56:03 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.1050.1645815362649239963
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jTuF+vRD;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so5659599pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0139WTzjEprit5PmX30dS6od0LX8u2DOK71UOmjYLvU=;
        b=jTuF+vRDhSlbSgknMSADCl/v4T5I3VtNTqCdlAdNk4K2+flON8ef2thqP9Mi3bBu9f
         ixQulUy6GxdhVqgj/zMoRprPCELm01zmkiZ6Wa47cZKZ6w+6kWaXr+VFZcC0JK3fKV81
         wWw2Hrpuk83fPfwuRE2qNNASTwwQHoKLj5vidHVDzsXhBBUzl5uql+K0+clHMj9UU02r
         cGduNO9o/oxV0ybZJe6W9tpqOIcEZMRgN52sBfya4hbBNule/UULJW8ftJTJ0zj0zhJc
         xdR743lLH94/OGrSl6WIHt5aelgvoXOI7UM2jWgzeAJDvm2+P50FOOby88KMpa5fRWH2
         8u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0139WTzjEprit5PmX30dS6od0LX8u2DOK71UOmjYLvU=;
        b=LsOMIbNoFiEJHAyPM86l2muM+ETAH39UxFj9KZaucg62y9IA4ZdrqZ4PHv+v/1Fgqh
         E2pGcPoPk5dQ8IoGhHr3vQGlsk7BN3hDyrRJ88dXXH7H3ahpmJXi8aOkCbtyYcui7IYL
         F3l+azy2jK0WKRcXFm0Zj29sppy9fuXw3azFMWPD00QZdo4oSeUdrRF1p5Pk+6+KuV3e
         KSPAo+/I1rR/8OoE0YvDGyMdNHZ59iW4D42iPQgHY5IIYBZHtGX9DXp5/H3uLj9olveR
         JjZ4z2klfqxWWtkURs5+evyr2dO/gfyVyn+BVXmB1Jg390J8oDV3UpA3ddJ9ZBp8B0jd
         skTw==
X-Gm-Message-State: AOAM5325d335ylGgoJ0YjQGC2n9bocStpxABf+mxBUXxWS6JWE5fyyAU
	altYhvNzqtqmF9r7Ym1VlKs3iXN/z2BMvA==
X-Google-Smtp-Source: 
 ABdhPJzaE4ShjN1b0BfhWkIYkW2gXQeOThSE65lWx3SAQkbLeKeVCZgfrKy5CjUOThsJlV3dL1klVQ==
X-Received: by 2002:a17:902:8498:b0:150:d71c:39e0 with SMTP id
 c24-20020a170902849800b00150d71c39e0mr3970986plo.168.1645815361656;
        Fri, 25 Feb 2022 10:56:01 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001bc62ecad28sm9990150pje.41.2022.02.25.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 10:56:01 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pyruvate: fix wheel build
Date: Fri, 25 Feb 2022 10:55:51 -0800
Message-Id: <20220225185551.1458871-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225185551.1458871-1-tim.orling@konsulko.com>
References: <20220225185551.1458871-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 18:56:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95526

Like python3-setuptools-rust-native, the wheel is being built in
${S}/dist rather than ${B}/dist so set PIP_INSTALL_DIST_PATH
accordingly.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index b83302d44c..4429e4c32a 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -14,6 +14,8 @@ S = "${WORKDIR}/pyruvate-${PV}"
 
 inherit pypi setuptools3_rust
 
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
 # crossbeam-* -> std::sync::atomic AtomicI64, AtomicU64
 # not supported on mips/powerpc with 32-bit pointers
 # https://doc.rust-lang.org/std/sync/atomic/#portability
-- 
2.30.2


