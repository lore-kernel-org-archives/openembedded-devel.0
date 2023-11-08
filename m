Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE237C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 18:02:18 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.21607.1699466532044865381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 10:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=J/thfVK/;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.181, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77784edc2edso465547485a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1699466530; x=1700071330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsIKYc+BRUBLD6TpGBf3xM1FVf2CyK0xmpQTX0gZG/0=;
        b=J/thfVK/4JUn8vjfsXNkWc6As2M5DU7HItDEPouf87ryeSEohZza9VC+Zn+xsTRcrB
         Zawk+xphIb5wRjxYsiKGW+YO++Tz6LwLH+vxRpu9Iqy65zC3px82ODPtPKZDkKL0DaB2
         PD+TiPnJqY32oalMCDTSVmaCxfGrwy6/hJIpysiyhnm4kjASl0aCAAUs6/cYYmO1Z3cl
         hKYXlER2HEHjRc/yTXUYR0NCPdvNL95/qzFmy77XYTM2g4h/wk+gOJ9wcLP4Y++FnZ1d
         mgVSoTuId0rWG6EfGmYyxqs16CX/X2owAvnjWyRgsiKq+g4QPs15ZVRVipOgpcQg8T8x
         jU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699466530; x=1700071330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsIKYc+BRUBLD6TpGBf3xM1FVf2CyK0xmpQTX0gZG/0=;
        b=Q30WSnGZZxGd6bxv3w6IGRIuUy8V+QZ15m5Wd0z2rnstE6CE6tmfaAnsfPdS1VbGFO
         Wl5IGf4m5j9fDl87diEH57uumVduLJwyKSo9nSWOIKC5SOMY97YbDdL3+HoNfa+wwLqa
         zmBxNOkPaQNiSp6exUSWeZzzmzyydJUrVLUu8T6/hHnCFoxyLkG1pe6UPlOikoOceFri
         Xsdq5+PaEpLAJM3poilqmqWVryJEddmDJWDsitCwKVCkdRZkZWqMIJbn/2M/6VwJcBTP
         XawjCbpGPDKqn/k9eJAHj1hv4gDqvDHZiwt0hN9LURu4LtKuZk7SPTpyVEC8EgTufblR
         OvWA==
X-Gm-Message-State: AOJu0YwLf0Dpe8Q/Ejeywu2jtWbELYQzw5RWN6jkdm1P7TNtcAIk49l0
	eZ4sJyGtakQwgAzWOMW0ZpQhI+z24SwBNzRImucJTw==
X-Google-Smtp-Source: AGHT+IFtESGSrNK3R+uO5FQfrM+vtRiYPCbG7OkLnt97COqxUPcI/BZDvzlXL9t4GYXWbqdgHah+xQ==
X-Received: by 2002:ad4:574d:0:b0:66f:ae2b:7a with SMTP id q13-20020ad4574d000000b0066fae2b007amr2898437qvx.10.1699466530512;
        Wed, 08 Nov 2023 10:02:10 -0800 (PST)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id bu7-20020ad455e7000000b0064f5d70d072sm1325643qvb.37.2023.11.08.10.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:02:10 -0800 (PST)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 0/2] The meta-python layer has been updated with two significant changes:
Date: Wed,  8 Nov 2023 15:02:04 -0300
Message-Id: <20231108180206.3263886-1-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 18:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106483

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

1. **Addition of `python3-aniso8601`:** A new recipe has been added for the
`python3-aniso8601` package, which is a library for parsing ISO 8601 strings.
This addition includes specifying the BSD-3-Clause license and providing a
checksum for the license file, as well as the source's sha256sum for
verification purposes.

2. **Modification to `python3-flask-restx`:** The existing recipe for
`python3-flask-restx` has been updated to replace its dependency on
`python3-isodate` with the newly added `python3-aniso8601` package.
This change ensures compatibility with the updated requirements of
Flask-RESTx for ISO 8601 date and time handling.

Arthur Oliveira (2):
  python3-aniso8601: Add ISO 8601 parsing library
  python3-flask-restx: Switch dependency from isodate to aniso8601

 .../recipes-devtools/python/python3-aniso8601_9.0.1.bb    | 8 ++++++++
 .../recipes-devtools/python/python3-flask-restx_1.2.0.bb  | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb

-- 
2.39.2


