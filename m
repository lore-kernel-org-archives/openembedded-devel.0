Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B820FC77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 06:58:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.25800.1683615518957520331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 23:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=pQEbb/v/;
 spf=pass (domain: linaro.org, ip: 209.85.214.177, mailfrom: jun.nie@linaro.org)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1aaef97652fso37727985ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615518; x=1686207518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+YdVCm4OcU9YMj+PFhMZIkRu8mdlFXbKi/wzLqShN6M=;
        b=pQEbb/v/9+eFUfVmqKYEFypciScNhoxbhdhNCz6JkRHiBe31MUtQv2Y0X8C6Jp2bcs
         1nJGMcI41iAkIrbjqylhDBpdBoYEQpA0zKDMpkrnx9sHIQWFvGXQfgC42g/WDGYFT2ly
         XJHfzvEVOhQQjUjLGsMYzxWbGKOY59TSe6seapngbOsRHiurQFbovdUVWsKZUtNX3L/S
         qQAcOkEtX+X7H8qar8JiJj5RCB1MfHTUPPCQ3N9wjTyHLPLi7GjxnJq1v/o7G1NOzuAG
         hZUvjUONJEqYy5oWJuJVU25LlXP/qLphJPjtb8JZ4ZiC+CFsSSYfnacR/K7GS6+Ey2yI
         h1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615518; x=1686207518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YdVCm4OcU9YMj+PFhMZIkRu8mdlFXbKi/wzLqShN6M=;
        b=NYpoEMR6MW3cVWnFr1cQ6Sc/3/pRKLqfHLaaXHuik1/Z6//C4WzkSLoFq+G2g5kE2E
         bJHaFfiNm2cR6JKeL1dMOPbUwKMlonX82Pa5mjdLbxdTmTRH+7JeVKP4Rzilg4Ls6hXE
         ruOOYsepra/dDTWJyJ502onyubkG5ItQfz9lV1fKpih6hdPsMf6gJ6ISuKxKWshhs5rc
         RxZrGtq81GTpYMtYuBZJYrfxQ/CFi6f/+ae7Y7SePD5I9jF8dERO0Yp4fI/cMJ44S1VW
         GJJWtV5x/3vOH8PP2NSixplpEMGzfgD8hGMOYfx/0SqMqSnhoLwXlIFp+xq8wG8xD9zE
         v4zQ==
X-Gm-Message-State: AC+VfDz3yKMfgxsEArNRhzSulDmZQDAdxrKwaW889JObj4w6Qk3Pbr1C
	IJ6agoERvPfPEfxb2TBi8hVBaA==
X-Google-Smtp-Source: ACHHUZ7WbjA/PQtpY5Nl9sKAv1RqrlrZPlN1hCCC956LYTk6ujAjEjCrFJGyFpcMik3LXEQWJNAGHw==
X-Received: by 2002:a17:902:7b82:b0:1a9:5c41:3f8e with SMTP id w2-20020a1709027b8200b001a95c413f8emr12466534pll.42.1683615518326;
        Mon, 08 May 2023 23:58:38 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm700038plr.190.2023.05.08.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:58:37 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe 0/3] Add necessary lib and python tool to handle CoSWID tag
Date: Tue,  9 May 2023 14:59:37 +0800
Message-Id: <20230509065940.1584276-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 06:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102464

Software Identification (SWID) tags provide an extensible XML-based structure
to identify and describe individual software components, patches, and
installation bundles.

CoSWID supports a similar set of semantics and features as SWID tags, as well
as new semantics that allow us to describe additional types of information,
all in a more memory efficient format.

Jun Nie (3):
  libcbor: Add initial support
  python3-pefile: Add initial support
  python3-uswid: Add initial support

 meta-oe/recipes-extended/libcbor/libcbor_git.bb   | 13 +++++++++++++
 .../python/python3-pefile_2023.2.7.bb             | 13 +++++++++++++
 .../recipes-devtools/python/python3-uswid_git.bb  | 15 +++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100755 meta-oe/recipes-extended/libcbor/libcbor_git.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-uswid_git.bb

-- 
2.34.1


