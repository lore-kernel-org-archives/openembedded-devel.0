Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1872EEB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:50:36 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.7940.1687852233689074414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=N/GJbqj4;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b7541d885cso1162655a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687852232; x=1690444232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePUtpbGZePzbSnG2uUJFHrcuSmz+Scz9ps8KAAiP0JA=;
        b=N/GJbqj4DukV3D2v9hp02UsPQSOchW/dt8Nk940Ram/iDk5ksARUYwo4GBIKElJmmp
         ShuRO+Z8jZFAOGUUdv+MXbnYiRYDhCGrh+wXfcMZLjKPyHAzi+qgDSR1fF5i5efAbk7B
         0tw7SbpNP5MJa1zFELTfgCsgU0dC3bsJECkNS1D/y7sPjbYr6NGQgHLsh6CebvKpLlB8
         Tm5i4MfB5MEUTe9F62mxrosKmFLeK1TxExjUO06W8n643DmeCxHKUQ+S74BVD888IAie
         W6lVYRBf9ZroS8kKlhOm3quJ+tn9ai4xuBAPbSoJ/Iipf1n8eupAEWM5LkP8ERWRQc3t
         V99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852232; x=1690444232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePUtpbGZePzbSnG2uUJFHrcuSmz+Scz9ps8KAAiP0JA=;
        b=HAC7w6YcSJf510h2+PJDtIHBDCp8SBByHM+lbbXccKNECUb6pZThCCCb8mZFVIcCvV
         Y/NA+C4JYfwxrxsz677SzJfEq/dSg9zklBz5Y3kBMvXUkFupbattHr4gftJQBJQV3DU5
         E2sPdpASmVNaiq5fscBfU0rvn0kZWi3TAMlgfOSWzcqZAcmZg520I6ATa3gNmAPoNDc/
         729+NXgX+WSQQyEQ/NNLTyM0SB8fVhfVP66RY02IIWXMpqFbQA8JCyLUYDRgXGG3rxHd
         dVee3dKsntM5Pq6drQUs9hogszZLpuYLMbZtmyECDSXvOnojErmIMAlxlcYXVjDKPLP0
         +AjQ==
X-Gm-Message-State: AC+VfDzHW9KxwBuyryD2XNNih37CtQPShXpAUTOL5t3orJhvYaUWmEAn
	RjJOWum2+8+LnJx7eGfN3HjAl9lPC1o=
X-Google-Smtp-Source: ACHHUZ6iplKJUGMdjwrHaEnrCvUzz8aA60zT4ck5eV/7XSF82qhy0wKWRetwaHwXklA2Os2WUF2PKQ==
X-Received: by 2002:a05:6830:11ce:b0:6b7:e9ad:db90 with SMTP id v14-20020a05683011ce00b006b7e9addb90mr2310646otq.11.1687852232270;
        Tue, 27 Jun 2023 00:50:32 -0700 (PDT)
Received: from localhost.localdomain ([223.233.81.169])
        by smtp.gmail.com with ESMTPSA id q136-20020a632a8e000000b0055b0c330b30sm568874pgq.84.2023.06.27.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:50:31 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	koen@dominion.thruhere.net
Subject: [meta-oe][dunfell][PATCH] c-ares: whitelist CVE-2023-31124
Date: Tue, 27 Jun 2023 13:20:13 +0530
Message-Id: <20230627075013.23809-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103615

CVE-2023-31124 applies only when cross-compiling using autotools.
Yocto cross-compiles via cmake which is also listed as official workaround.

See:
* https://nvd.nist.gov/vuln/detail/CVE-2023-31124
* https://github.com/c-ares/c-ares/security/advisories/GHSA-54xr-f67r-4pc4

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 66254583b..152d91332 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -23,3 +23,7 @@ PACKAGES =+ "${PN}-utils"
 FILES_${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# this vulneribility applies only when cross-compiling using autotools
+# yocto cross-compiles via cmake which is also listed as official workaround
+CVE_CHECK_WHITELIST += "CVE-2023-31124"
-- 
2.25.1


