Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C64C77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 11:25:39 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.13893.1683717937594485119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 04:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VPXy+6Tr;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-559f1819c5dso106644757b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683717937; x=1686309937;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5QzQHh0ki0dijaM2Iqm2siY31haKuqWhLclehNdskI=;
        b=VPXy+6TrLaBWRWdwD9DSziKPJCw6mUPV3mvan2JnBs6/fIjB53+48hwj/Gx+hgarIP
         s7NdU03cTzsPLVAs6yfIOJTDrCqDklBRD8L8Nbpa8m9uJOpcSVncPwQkujGjfJ79GS5/
         n+s50xo67Hefk7Kj+Y+nXg+nM3nTzK8p4cbokFiYK72xLPU1Mvz6RIrAI/Jbqn5M+SKv
         s2QgSk9tt0tL79dWam390KM5Ib32dtRd762I6meHk5cjFmaRU610TOWMaAOdN6gw8QhS
         KU/VWGZ3dhyh8DLFyNE3hRRvSnp6ki1wxoZP5xCiXtOMDOQwohnQtwSEAR+1ci0FTnHM
         gdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683717937; x=1686309937;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5QzQHh0ki0dijaM2Iqm2siY31haKuqWhLclehNdskI=;
        b=NOlg36YljD1cRb6JraIVsAk1+82MMuW7H5f2M795z9vkrCOuiCQYPLqFvbgN726xJ+
         WZRKsvNkzGtyFzdsxbzKn4Qs2oBELg6To1Rymq0jSibAkiUfisAh8jbTY2e9UcT3B7WH
         gFPlPkT1Th8jF7Nv++dH3Yrm7CTBKFPIH8ZGzfUaumKvDiT46wwpeP6rtbVoXlgU9onF
         5ZC+Av0Y3QybrHIxkfgM1hhQKP375KMwyGci+k+2lbiUnAfhQfNORjzEgpRbVp/J6PKI
         w8ApQtfspXTk8dEPhwxjBU5jqXqxufuFVpAr1gV5wPKoDovzs/Q5Jsx4MN+Zq7xfxxPT
         rxfA==
X-Gm-Message-State: AC+VfDyunSJB9M8LsSk1oISr7PyqQCaTAyLnTXozwIHhl0Bs4ci4bp63
	t4n1PyK30sTMLrHJScY+JAU=
X-Google-Smtp-Source: ACHHUZ6MZutpMbx8AoLZdUlTpXbkxYjC7O6JdjLnFhowtnNO2LJebWW7S7nxpVqVUdYPaJLhNhb+Jg==
X-Received: by 2002:a0d:d58f:0:b0:55a:a1dd:3f04 with SMTP id x137-20020a0dd58f000000b0055aa1dd3f04mr18017209ywd.30.1683717936672;
        Wed, 10 May 2023 04:25:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:8122:c224:cc78:85c7? ([2600:1700:9190:ba10:8122:c224:cc78:85c7])
        by smtp.gmail.com with ESMTPSA id m194-20020a0dcacb000000b0055d8ce6d686sm4031251ywd.1.2023.05.10.04.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 04:25:36 -0700 (PDT)
Message-ID: <a50f215b-ca3c-77c9-b14e-2479f2ae8296@gmail.com>
Date: Wed, 10 May 2023 07:25:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request: May 10th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102529

The following changes since commit 3d1ec70ed319c1b7f561fcda7b8cd0c2e0b2c262:

   dleyna-{server,renderer}: fix dev-so QA issue with multilib 
(2023-04-18 06:45:59 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to cbbaa82238cd60f08c9b9cb58dde59d5f9318c7b:

   python3-gcovr: Add missing runtime dependency (2023-05-08 09:51:05 -0400)

----------------------------------------------------------------
Arsalan H. Awan (1):
       meta-networking/licenses/netperf: remove unused license

Changqing Li (1):
       redis: upgrade 7.0.9 -> 7.0.10

Jasper Orschulko (1):
       python3-gcovr: Add missing runtime dependency

Valeria Petrov (1):
       apache2: upgrade 2.4.56 -> 2.4.57

  meta-networking/licenses/netperf                                | 43 
-----------------------------
  .../recipes-extended/redis/{redis_7.0.9.bb => redis_7.0.10.bb} |  2 +-
  meta-python/recipes-devtools/python/python3-gcovr_5.2.bb        | 2 +-
  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31 
+++++++++++++++++++++
  .../apache2/{apache2_2.4.56.bb => apache2_2.4.57.bb} |  3 +-
  5 files changed, 35 insertions(+), 46 deletions(-)
  delete mode 100644 meta-networking/licenses/netperf
  rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb => 
redis_7.0.10.bb} (96%)
  create mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb => 
apache2_2.4.57.bb} (98%)


