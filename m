Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EA7C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 16:40:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.13044.1646325617732267008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nmmmm1vF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso4774846pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MK3YeI5adPDnS4YxkMtfbJJcWn8m6QHJusamXxABkI8=;
        b=Nmmmm1vFrOHn9vHtNq4RhFObcs4mrNkEVwdH1rkNjzgpFU++qZYY3yw/STEL5bmiFO
         lczYq5srKJk63AvAp+RUvAxmAd6Cxp8iSniuInyPvERZSvNAbe3A2IeCwWiRpsBBM1er
         +QCsw19TKotghQkWUQOhaKbTUtEF4eL52kmuPeps2AMYs3/3QbqbXub5+Y86Z6QnTqhp
         kXS9Wxw/G6Dl0bu+aYo7Ks8bPpJBkq2aD+FJWF3xn5LpjVSEPZcfe7xezToqWuqZIL5W
         /d2pkqBVFe/VvlQ28Z8VJR9iJwPQmzkYGA6xqj3CfW/fAaL3v0VD3lfoBEfm524FRlys
         vt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MK3YeI5adPDnS4YxkMtfbJJcWn8m6QHJusamXxABkI8=;
        b=mXsNufoz/fpLa7YfmP7xOR7KeciBmndgd5BCBeAWMkHLJdu7VV8E56rGAA+WzwQCge
         saO5AxOTl/2gykPfGCj34L1bDfFKhHJ23E0TpSRUUs5qqY3SsBJJXPLhwcrYpEz4gJeW
         4cuMFZJHXSoI3DBLHgSKxMQJsHbpW0a528TdobEopsfhfekhCsyzr6PbPKMzbX+9mKpA
         pGb0wr9MbDmp2rFjrPTM3GfkPOEHaubImUHSTva6ADEbVXZzvunN/Zg/0u0CdkFrRqtF
         hzy7z6nInQrzCX/Gq8YAOLDhLu5aYIt5jwQKOziHEVbxzJpEe/KCaTB7T7Ywz/aneZzI
         qc4w==
X-Gm-Message-State: AOAM530EvRXtgycO1z5IHnkhIKG2kdmFeBMX08OQCBvzIugX7rbJUVk9
	OANMqD/qxnGu5FZyIq9ulyCGuA0HdxpXWg==
X-Google-Smtp-Source: 
 ABdhPJzhKKMSVBjhfSJsszwvYlx5+0kIZVPX6LpbPh5JweKiYlR4U2Q3RcdR+/51WWsKwD9mUMauZg==
X-Received: by 2002:a17:90a:dd46:b0:1b8:8:7303 with SMTP id
 u6-20020a17090add4600b001b800087303mr6096551pjv.197.1646325616941;
        Thu, 03 Mar 2022 08:40:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 t9-20020a656089000000b00372c36604a7sm2535050pgu.13.2022.03.03.08.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 08:40:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-blivetgui: Set PIP_INSTALL_PACKAGE
Date: Thu,  3 Mar 2022 08:40:13 -0800
Message-Id: <20220303164013.3149208-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303164013.3149208-1-raj.khem@gmail.com>
References: <20220303164013.3149208-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 16:40:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95753

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
index 9522770eff..4bcb45ebd6 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
@@ -18,6 +18,8 @@ REQUIRED_DISTRO_FEATURES = "x11 systemd"
 
 inherit setuptools3 python3native
 
+PIP_INSTALL_PACKAGE = "blivet_gui"
+
 RDEPENDS:${PN} = "python3-pygobject python3 \
                   python3-blivet gtk+3  \
                   python3-pid libreport \
-- 
2.35.1


