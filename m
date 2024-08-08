Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306DDC52D7B
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:38:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.64645.1723135124435452953
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ko5auztl;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fda7fa60a9so11244235ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723135123; x=1723739923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+4g0JcFuZstHP6oOlRZ65PbMcnum2xzb7+QVdQoPhc=;
        b=ko5auztlPVww2zP+hbpGmBkWqAj8oR85AswfYwGs7VcY5GcMaPd4gt2r6s2ElhO2zU
         4uCuz9g+j8xiagf1EN3IOuPPYVUQGrSRxL5ZE5V9yI5ncg6Qmsl1QtpQpAKPCRhepZRR
         m7I9221Xv+gvmmGT3rRk8DBPOKDUqPiJayAYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135123; x=1723739923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+4g0JcFuZstHP6oOlRZ65PbMcnum2xzb7+QVdQoPhc=;
        b=dCd4doLwGXncE/HvciCLFx6qzTy7z0XCQhYKN/xFBDRcHx4Oj2d6wwI37IEFN8QRpg
         ZNrMHdlJfZCGYTLeT2HDxaodw62itSHUhuzIHJis8BcKmX7rOq+g+QUYBUPrV/VXcfRd
         l7oA9LfaH2E2+J5VTfNx4waq8bgUYfGPQOkRrcnDlCoIB3rhwSOYnVsFi3ArsDCw5w6l
         f40gCvaqCFGPkUR4bjnGXzSrPcV2vUP73ctkUesKqr15ttOkWszGHfWE/O1wNw/MJxU4
         JS3ExFMKawQmsGD3+RUxRXiU3DkwJkKm0g09x8tOSlnYVafxW1DPKeIe0JU8pZRNH5Z1
         AbTg==
X-Gm-Message-State: AOJu0YzOnvF8GuKY7/E4tOJ3pbLKbnEAKTmi6Eb4IMPbBcZrI1AQB6Uf
	HC5pBK0j6VRMDSukccMVb1WYiYIZpUwe+IY9I8wsD7azz0vOtvw1e7x24Sdk1G69RAZiYyCqP7F
	8Dc8=
X-Google-Smtp-Source: AGHT+IHjCoJio1UoojZkrwMekOMUW43NBD4dMJdU08igwD8yBqBNhvWHEseI/jglN8Tg4CVAjVjU/w==
X-Received: by 2002:a17:902:d2ce:b0:200:8d3f:bb8e with SMTP id d9443c01a7336-200952e2ad9mr30667555ad.51.1723135122418;
        Thu, 08 Aug 2024 09:38:42 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b5cf47sm3674023a91.56.2024.08.08.09.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:38:41 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 0/5] Upgrade python3-pydantic-*
Date: Thu,  8 Aug 2024 09:38:24 -0700
Message-ID: <cover.1723134758.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111669

From: Tim Orling <tim.orling@konsulko.com>

We've had some trouble with python3-pydantic being upgrading without the
required version of python3-pydantic-core being available. To ensure we
do not keep having this happen, this series sets RECIPE_NO_UPDATE_REASON
in python3-pydantic.

There were a number of missing ptest dependencies, including python3-tzdata
which we did not have a recipe for yet. This series adds this new recipe.

Upstream has a patch, not yet in a release, for the TMPDIR [build-paths]
contamination which was injecting RUSTFLAGS into the _pydantic-core.*.so.
This series backports that patch.

The following changes since commit 49d707e0301d7bcbad386cbf3dd205ef6fdc561c:

  python3-cachetools: Upgrade 5.3.3 -> 5.4.0 (2024-08-02 08:52:53 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/python3-pydantic-upgrade
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-pydantic-upgrade

Tim Orling (5):
  python3-tzdata: add recipe for v2024.1
  python3-tzdata: enable ptest
  python3-pydantic-core: upgrade 2.18.4 -> 2.21.0
  python3-pydantic: upgrade 2.7.3 -> 2.8.2
  python3-pydantic-core: backport patch

 .../ptest-packagelists-meta-python.inc        |   1 +
 .../python/python3-pydantic-core-crates.inc   | 280 ++++++++++--------
 ...sion-from-1.76-to-1.75-in-Cargo.toml.patch |  29 --
 ...8.4.bb => python3-pydantic-core_2.21.0.bb} |  16 +-
 ...tic_2.7.3.bb => python3-pydantic_2.8.2.bb} |   8 +-
 .../python/python3-tzdata/run-ptest           |   3 +
 .../python/python3-tzdata_2024.1.bb           |  24 ++
 7 files changed, 198 insertions(+), 163 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.18.4.bb => python3-pydantic-core_2.21.0.bb} (80%)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.3.bb => python3-pydantic_2.8.2.bb} (87%)
 create mode 100644 meta-python/recipes-devtools/python/python3-tzdata/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb

-- 
2.46.0


