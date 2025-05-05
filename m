Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6BFC3ABC2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.45634.1746433884026814822
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 01:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TW0XMhMF;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b350a22cso3338467b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746433883; x=1747038683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8Vb6Q8tEOhxeaWFEOD98sqH6apE9layOtVVEf5R2Dw=;
        b=TW0XMhMFmZEr/wHV84Rflo7Sd8rHHQTTHjLFx7gyMvrTI0c+N9dRwqNYNnDQYEo5O+
         17nbxhl8c16wjuKLsXCKBoTBAu8SsKwoFqj6KNGoRU1yGPKtdUfJ/OM1CzQ+fNGhiGhU
         o1MfbItaKWBGAO0Zw0W+Hm656aePtS5yqSq8C4J8m95ZOgEg1RZ5iRx5eY5dc7fTn3UT
         1+lFC1y94rZNKmjLE1qGbBxl6+Nkzzi7ulj0vCSkab0IjAgUyEgG4yS/rwbA7vwc63/h
         ztzJlOY/wNyIQya15PthGQQWfZyTIhd/idm5TXXQZqy+DHF9tf/SGe/o6d5KdsSeDlsA
         M9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433883; x=1747038683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Vb6Q8tEOhxeaWFEOD98sqH6apE9layOtVVEf5R2Dw=;
        b=CEPINnOB19gSrB/w8NPoucqPg/AzkI6E51NYhsYxkqLp5urk/gz5bNLGxmouVAAH/c
         /ovb1MYD6LB0+3vbnhDWgrpMj1/v0ub4FIygN0JTB7ZUTJHJaWSTsjzySj5YUlvA0jqm
         RxZyVBVPojPN7YVBXxF2b6QBoMe5aILoh2qLQGcLT3lsNivkDSw+PXOns4x1++7+cCt8
         Mj0Uwlxtc2wdjPUVyOcEH5rYEc3JHaVokMvILBiwkS7+NzVkchkEH/ZfoRwZt+BamRz1
         zYVFyTlWoBMeAD8sI7zMSGMPvJKGw3GRlieMDfK2ltgUs+lcPGT2Ib9GI0+eKVLeMrxe
         GgAA==
X-Gm-Message-State: AOJu0YyK9Ot/V1kH68R6LhMU6frt8RS2o1zgggDH5dYhu7dSYvKxnZgC
	ZFbeErlrWtgNR6SagujGFYdMw5WIkhahtQgDDFMWk90L/fumckWl8RyI/DPA
X-Gm-Gg: ASbGncuU2X0XLi//8NrbCgs6ImBrKjddOBtzWEfYHl01uqAehYU115sShBixfHL3o9p
	pGcPdNcvPuKoNlh0OwQuc5+YbOSM7zc9MzGl65t9XLVoBJM4hhCg+ylHxDVJ6sh+FZXlNPjyNMB
	crfs+1OoUFSZIHqbzGMYbhhTKbNoiXg3rlXNcoN5YWTmJcgkcmXFzNYzoRuEyq/aT1btARaonSt
	6yaDPRmTgdX2cPQveANScIsg669bXo2bdYRtwCFaleE6NLTsMc1BzJz5r8fl1TjjzInrWDn6j1U
	3T9RWorCIFhsI835XZgB881/ynyIDvc/fBwv3nmmO/WQSn6D6nyho+Zi35IgQYE=
X-Google-Smtp-Source: AGHT+IGbwkCGau0Vi7kC7eQ++msUR3WWJ39rRKNRB5KTkHEYGQ6pCPZd8+3g599LA9xONFfN6i7B4Q==
X-Received: by 2002:a05:6a00:4c93:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-74058ae669dmr18173885b3a.19.1746433882981;
        Mon, 05 May 2025 01:31:22 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020f4esm6153977b3a.112.2025.05.05.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:31:22 -0700 (PDT)
From: emailaddress.ashish@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 0/4] Fixes SRC_URI for meta-java recipe
Date: Mon,  5 May 2025 14:01:09 +0530
Message-ID: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117304

Below patches fixes the link's used as SRC_URI

- The recipes are failing to feth the compressed tar from the link
  mentioned in the recipe of scarthgap branch.
- These patches fixes the path & tested on qemuarm

Ashish Mishra (4):
  Updates the SRC_URI for xalan-j recipe
  Updates the SRC_URI for xml-commons-resolver recipe
  Updates the SRC_URI for avalon-framework-api recipe
  Updates the SRC_URI for fastjar recipe

 recipes-core/fastjar/fastjar.inc                        | 2 +-
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb   | 2 +-
 recipes-core/xalan-j/xalan-j_2.7.1.bb                   | 2 +-
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)


