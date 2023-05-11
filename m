Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC0CC7EE23
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:05:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.59852.1683813949154268311
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 07:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=kBKckfBo;
 spf=pass (domain: linaro.org, ip: 209.85.216.49, mailfrom: jun.nie@linaro.org)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-250252e4113so5722838a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683813948; x=1686405948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZzYBChk+Y+4FnTAnhrjmA1kZp161oQ438DA4o/vhqg=;
        b=kBKckfBoUDPXxiE8MP3hW8qldzjKiXRJVFwX3ykv1tc/l49TYUPAEQl8XO1HfPcj4l
         PXGuV7ZjJb7mz1a2Ahi33uBdsok+QNQvlvKweMaP/BKllomMdYQL8WrGQDCHAOioOJCb
         nBKPAOGUjZznwspxKlNl55X7J7+AeoqCuyiaCjkMU027egl005kwZSPLqYFdvUHSVDxz
         oBz39l4T3rUaBwMeXn3UYJvh5A45hQrYqBAoo1yMKqVQIQcaYbub0SgLrHYfuQKK2D0a
         3jyC37dgYaJvXNhXOYN1b0agYW+cdTvMZ0c0vN3wT012kqNZkVzSzPuLU2AAwjm1o2+n
         G4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683813948; x=1686405948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZzYBChk+Y+4FnTAnhrjmA1kZp161oQ438DA4o/vhqg=;
        b=bVtCN/gu3rawxc+DvZRZsii55rPRwtDw7it6GWrtyx299ISK7b+OBTSN7nZMuQWled
         a/iCZudXEuQXq443yptfNA6+DZ9LbPmGEVKwT5wIkVKH/xKkK7VlGpJUgT9ZIls+Waa8
         0OVHtc+ybnHHzZvE3kFaJ6gZgxAhv5szgD9N2pp52xFkj9UlRr9PAchSkDi5pEpHJUdJ
         kfFnkCK6hpKC9GhsLG+ZWP4yVS3gd/TS/zMC1egxd0syR4iHW+pPdpQFwM1nqfuuE4jy
         IL6m1sMnXMIVJldS7stTgtLOFsAIexm5bJw/dwIfzrXx3i9QMaQzfmXNMMxH8vtobjEA
         K1PQ==
X-Gm-Message-State: AC+VfDz5ZmS/Jz4HShAlpqBzO3kni+oVs1mzit94DmYRPE2/mDwYtB8U
	iATLPlCl4vFYNh+W7fQJ149TFg==
X-Google-Smtp-Source: ACHHUZ61/jdUB0Dp3JJOWvTtcsc5r7NJcFLUvrCqt1teRoHDX92pnsmumMlGKWAvycAhuGv93AEJvg==
X-Received: by 2002:a17:90b:3881:b0:24e:109a:94e with SMTP id mu1-20020a17090b388100b0024e109a094emr21315449pjb.7.1683813948535;
        Thu, 11 May 2023 07:05:48 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m3-20020a63fd43000000b0051b36aee4f6sm5033731pgj.83.2023.05.11.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:05:47 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe][PATCH v2 0/3] Add necessary lib and python tool to handle CoSWID tag
Date: Thu, 11 May 2023 22:07:41 +0800
Message-Id: <20230511140744.2918627-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 14:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102541

Software Identification (SWID) tags provide an extensible XML-based structure
to identify and describe individual software components, patches, and
installation bundles.

CoSWID supports a similar set of semantics and features as SWID tags, as well
as new semantics that allow us to describe additional types of information,
all in a more memory efficient format.

Changes vs V1:
 - fix libcbor cmake flag and rename recipe with version
 - fix python3-pefile SRC_URI sha value

Jun Nie (3):
  libcbor: Add initial support
  python3-pefile: Add initial support
  python3-uswid: Add initial support

 .../recipes-extended/libcbor/libcbor_0.10.2.bb    | 14 ++++++++++++++
 .../python/python3-pefile_2023.2.7.bb             | 13 +++++++++++++
 .../recipes-devtools/python/python3-uswid_git.bb  | 15 +++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100755 meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-uswid_git.bb

-- 
2.34.1


