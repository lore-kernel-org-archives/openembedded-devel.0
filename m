Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CEDC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:50:14 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.1304.1683046207924092443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=kLRZilWz;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-74e12e93384so175646385a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683046206; x=1685638206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zFBmY5ii7AukRzohgOpoTSYQj/2BKFF7ExKsCKEe3p0=;
        b=kLRZilWzErt954bvhn0m3Cs3jvu4ZF4yB2h2TyWUVnSEvO/Zl7bcBx9gU5d8AjW4oV
         ObAhdSH43SfuRaaoNUN8VZwZ23DmxSRHqJcUgaX8DY5mjlP0lgh+ijNxQy8N7edoIgh6
         uWnPKmHvx7A2lBB4OV82DWikvt6uFCsF+AShbxL2pe1QBXBhkA56t5qNIfNEYrO17sQC
         toEKvuX+HFSP753ZtPn9TJByDmAK5VV2sJZ/ZgV8oYq1Y1wP7vr35Ger9p9bFqEyzIvR
         IdYaqavSsiQB+X6pDQhj61pHlZ3TcmpnKz/zV+y8ymQCQ32yXOWT/OE4KwYN9JHL88MM
         bFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683046206; x=1685638206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFBmY5ii7AukRzohgOpoTSYQj/2BKFF7ExKsCKEe3p0=;
        b=G3UqN0qlx3tf/PcDXi3iUEIwtP0zD+Yr98Qn/KPAH0c4GZr/1tiy1UFejPMLxYZseG
         9kjTLkF4iWt9pa6w2K1etOlGKJ2eMJ+TNd90BtdZxsjKXc0aX5bvlZJDE1o7rr4km8IO
         Ml78cza88OpJEDr+1XkwlkgB25G1Y+TvXo9ZAhw9iQQ3HIDyDkKjmYHIIxi4ngNiGzxz
         QkVFimJUhJWVDr2LO4uAuX1cIiUJsBb77PSxyj3NzuUyicF3aF7uttGsD0vVb/pZnwqk
         L6Tn7ti/K8PsHtUWxaL2SM0a9DU5Itzzoyf0mBZvFBy/TPS1xiW5FmUqCKTJ6xkOjRNc
         lpGg==
X-Gm-Message-State: AC+VfDw0D0eNc9pLKTi5s642PUob/sRBM2PV83Q/8s0/sjjiOQ4AgZPQ
	g+udFWqcxBbDJaki0XLZiNlYC+BSVwDvFkYDSmk=
X-Google-Smtp-Source: ACHHUZ4LyzAMIWCfZGp1aVZog7LqCgK351AK39TqT/V18XLVQ8yIoUk0Y0cfsUm7xvFj5DzvlafRwQ==
X-Received: by 2002:a05:6214:2421:b0:5ef:4837:cd3f with SMTP id gy1-20020a056214242100b005ef4837cd3fmr6942570qvb.14.1683046206410;
        Tue, 02 May 2023 09:50:06 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id u9-20020a0cf889000000b0061b5afbd8e8sm1531777qvn.52.2023.05.02.09.50.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:50:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/6] Support updated python3-pylint
Date: Tue,  2 May 2023 12:49:59 -0400
Message-Id: <20230502165005.880470-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102265

Patchtest relies on python3-pylint, but it's a very old version in that
repo. Before proceeding with updating, it seemed important to uprev the
recipe in meta-python and add a ptest at the same time. This required
significant changes and the addition of a few new recipes, some of which
also existed in other layers but in older forms: python3-platformdirs,
python3-pytest-mock, python3-tomlkit. I've added ptests for each of
these, as well.

Note that this patch set relies (indirectly) on some changes sent to 
oe-core to update python3-hatchling and add two new recipes that it 
in turn relies on (python3-trove-classifiers and python3-calver), so
the recipes and ptests won't be fully functional until those are merged.

Trevor Gamblin (6):
  python3-platformdirs: Add recipe
  python3-pytest-mock: Add recipe
  python3-tomlkit: Add recipe
  python3-pylint: upgrade 2.14.5 -> 2.17.3
  python3-pylint: add ptest
  ptest-packagelists-meta-python: Add new tests

 .../ptest-packagelists-meta-python.inc        |  4 ++
 .../python/python3-platformdirs/run-ptest     |  3 ++
 .../python/python3-platformdirs_3.5.0.bb      | 35 +++++++++++++++
 ....toml-Remove-hard-coded-dependencies.patch | 24 +++++++++++
 .../python/python3-pylint/run-ptest           |  3 ++
 .../python/python3-pylint_2.14.5.bb           | 18 --------
 .../python/python3-pylint_2.17.3.bb           | 43 +++++++++++++++++++
 .../python/python3-pytest-mock/run-ptest      |  3 ++
 .../python/python3-pytest-mock_3.10.0.bb      | 26 +++++++++++
 .../python/python3-tomlkit/run-ptest          |  3 ++
 .../python/python3-tomlkit_0.11.8.bb          | 23 ++++++++++
 11 files changed, 167 insertions(+), 18 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb

-- 
2.40.0


