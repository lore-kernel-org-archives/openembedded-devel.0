Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A86FC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:57:53 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.1585.1646247472452852959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kXglveIa;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id e6so2424985pgn.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GPoHrqaU4F/9dgacQKsqIWLiNeCi+uTzPg3u4WyBidA=;
        b=kXglveIarOOFExRFpKHBn6SbuizJ9wu2tTwPcjRxLlJxtxUf7Urf9dR1VjTF7pK9Bp
         ksG5QFR1RjCLL6Gk6mzTNPAn6EXAM9MVXAYlC7m6A8kJCnQnXNuiIkdZtnluSm+tsq58
         TU1F/u+rzxWE2WCnaJR4WBtG1euH6DCqTvlUbaq9Ote+Ww4MQ/t7jIEpUjQe+CH4Bl3q
         79A0jFkdC4XUhwpVPzvOVsO9IEizlMQRDn7/W5xWbOndyJQ+yi29pRh6cyC0NILZMwqM
         aNSmaPn4ZUzlglSb4L3vEDaq64GMPajuHr3AKg/E3vkCg5TklMBtnoTcPKO0YLusGkEY
         sYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPoHrqaU4F/9dgacQKsqIWLiNeCi+uTzPg3u4WyBidA=;
        b=10qqBzEtKBXAP46eNySsNnqIn9XNG+j6aIomNnOB2krq8xm7b8DXmZ5ilMFYl0MMsX
         hzj+sXgpG9dqaDd644DyzjX8U/uK8aPiLcyFMUQJBn4352lv3tp9sov+fOGPDMvynWaE
         sjxVbDQGJ4AhTQYWxFJ8Y8ITDPgqNEhzgv2IQxYiH+fZKGRuD/YPQgEkB42EyfGLgdiU
         59lMSQZexNlVUhF6aBSeZY3xRhb9y5YQXzp1V2hQ7pjceTvsBZ+VKZPRzBWK7+r0afEG
         A0xkXLeW318TKmRMGXoD/yqFVMYrCHcJrXMupCMYaHP5jTd1pGvIumCLcI8wJgnlShk9
         6qyA==
X-Gm-Message-State: AOAM5306EGVNbvQfJTVzcvxY8W9tds2IcDe3K7u4RBgf/E38S8HiDftI
	SrHIHdxkoQJEMiJH0V1rzD7vGW/ycy46Mw==
X-Google-Smtp-Source: 
 ABdhPJzzz0n0bAOyj7us+dO4Yb5BxWhZOCEgupw1tNyUSWDq1AjK1hCUQj8D/JK+6r3gGEMrh4/Shg==
X-Received: by 2002:a63:1e48:0:b0:373:9ac7:ff1e with SMTP id
 p8-20020a631e48000000b003739ac7ff1emr26542172pgm.45.1646247471794;
        Wed, 02 Mar 2022 10:57:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm5560011pjb.46.2022.03.02.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:57:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-dbussy: Define PIP_INSTALL_PACKAGE
Date: Wed,  2 Mar 2022 10:57:45 -0800
Message-Id: <20220302185746.2402043-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302185746.2402043-1-raj.khem@gmail.com>
References: <20220302185746.2402043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 18:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95702

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-dbussy_1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index 0cf9dc8a7d..1911182fcd 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "DBussy"
+
 RDEPENDS:${PN} += "\
     python3-asyncio \
     python3-core \
-- 
2.35.1


