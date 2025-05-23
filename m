Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C9BC54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:18:56 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.40353.1747970332325839176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 20:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R5ORTWjV;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc6f3fe907so1927925ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 20:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747970331; x=1748575131; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrZpHhWpxdua1VaLGwofoKW2WLIWlwm2kpMwecaNJSw=;
        b=R5ORTWjVuxKaq3EvRY0WMyq8rmPxZtMiPX12UwfsRXvle6ILvO2nCUQ71R0neEgL8Y
         7SMxsD+dtnYlFxRFa6gfbt/ppomOTi0XyoS01xE4VqGEKnoDVnXWuNaUPginbl9xmPlb
         wvvRn4tgNvm8ToEnZX9KjKlencbQq3l8gjIgv9sPUVwReNqxcNVLrfuqgFcHDaqf3oat
         WypFI5oXCce5KwzB6QVLF9/7x/kermbS140XeQYLELq2QNvv0zV1pFtVB2SFjVCTTUBQ
         0K+Xc7Pbq4H9Q6gr/4Cy36sUrZIOgg+HSvZ17oVE69wYYHLvip46LkK4jI7vEDDOKGT8
         iD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747970331; x=1748575131;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrZpHhWpxdua1VaLGwofoKW2WLIWlwm2kpMwecaNJSw=;
        b=sQwhkqMd/yYkoRUH6Nl9bvcu4+xHgNx3qCnc6O7dwKIgoiYZlqnNjtPXGv0AZQVL/e
         MDdjehen5j27nWQyL25DgZtkEOoyp7V6qzrPA08rdyC2RUSq+WYhXbsfx19CefJNsieE
         mo1rw5rXTU/r64P2CmYY5DDJ/baua9t2zrkspwoIEFqPDKyL65Zyu/v+RNG33GTdHgGf
         KRnNzMP1bFfoUAyhTVr9YqAhQNV/6atidxIPZC43+MutQU/JPDztvEeCF9dp04CFa0SP
         txaECJu8tirVAou6CthQGG7RIFDudcpdrfbjN+1Z5t8rV+j3Om5Cb3Y7ltI7FvC4qOtZ
         1okQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDi5V2s3aUPQc68Itbiz6htGmpiFGClqcHr17SKyec+UJQ1scc4SB317kyRoVOXIwN0yhUINJ/lbr7Np9FrRGFx24=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTztLggDDKteRY6dRS9Jv4uv8MZBlKrhcRiTk1ySIRGxWtTwk8
	sW29IBNszPt2mQ29mQQzgTSdyOqYf2zTueZ9ByPhJTAuphQEk5fP6FOu
X-Gm-Gg: ASbGncs11bFjXPoiYp/jL2iFcoQFWWz2G6/157PDKCfyo9PCFe5aWaVPBd54Ldnm/PH
	IE0dmruyRNyFm0GmWtpwLjQ+medCEOMcjxBOjf/n/R7vpPSJzF2XWg2qlJYPPSK6wytHw9VbnXw
	s4XFNEFBMGGObaGzqokZZmuau7TZ2W+aTfRb6JhOtQuE5XCKBMgF5cWgwxSiqE8FDXCe2vduKq4
	CwNpiecDluyJBgd0S8b/Ve5vT4QTErsm1guojXatyzY2pacCyyWsFJjDwRqnoAhPPIP+7AaG3V9
	nei0wJjRVjEI94JJems3mdKVMzE6NgskEoluKJYUlEXuURVZQHXqpiPqFv+7s5DsdQTO4dRahSK
	VIrOQdn4aEbgCCF4bdwKwMaFZLz4j
X-Google-Smtp-Source: AGHT+IFAQRxhhRRz2QVq/pm0GykEaKYcbwHNo7ucTwr9bi2ac1Bl2ZJmo8J0DE1jgX5dmof8D/QzPg==
X-Received: by 2002:a05:6e02:1d92:b0:3dc:635b:6724 with SMTP id e9e14a558f8ab-3dc92c2d16amr22121875ab.10.1747970331513;
        Thu, 22 May 2025 20:18:51 -0700 (PDT)
Received: from [172.26.252.3] (174-29-216-122.hlrn.qwest.net. [174.29.216.122])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc8298d8c6sm12517225ab.69.2025.05.22.20.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 20:18:51 -0700 (PDT)
Message-ID: <b9bb4d2d-a0cd-42e7-9790-6a8f9b6431c5@gmail.com>
Date: Thu, 22 May 2025 21:18:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org,
 joe@deserted.net
Cc: afenkart@gmail.com
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [meta-networking][walnascar][PATCH] chrony: use inherit_defer for
 conditional inherit of useradd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 03:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117603

[ Upstream commit 63df976d8eec0fa714e8da30f4333f8af23c57d3 ]

conditionnal inherit is missed when PACKAGECONFIG privdrop is
activated after this inherit, eg in .bbappend.

Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
Maintainers - resending as mailing list likely bounced

 meta-networking/recipes-support/chrony/chrony_4.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
index 83dee9143b..d21a1c6216 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
@@ -48,7 +48,7 @@ DEPENDS = "pps-tools"
 inherit update-rc.d systemd pkgconfig
 
 # Add chronyd user if privdrop packageconfig is selected
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
 USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
 

