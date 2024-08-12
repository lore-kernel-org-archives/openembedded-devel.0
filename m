Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F092C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 03:28:41 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.38427.1723433315970048918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 20:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=exmlEHdf;
 spf=pass (domain: konsulko.com, ip: 209.85.210.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-710d1de6e79so2544484b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 20:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723433315; x=1724038115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4wDPZnw2AK0DGMv5ZvAxaIdARC8UfgPY4lCbTI/LY6Y=;
        b=exmlEHdfwhoG3UHLavPjGz4AfyEzJLhl/1spckNy66rhwrttAKN3yuRT5WpiwceXzI
         eynT9CiGCVPqiP2I3ipwfjSRBhNdPFLx0gv0PPVoqvRPrei14xKIRrFiH7s6ojTngkOl
         OQNOGodtOAxcgFmS9j6/3P9BWHJxpm7FhKOM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723433315; x=1724038115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wDPZnw2AK0DGMv5ZvAxaIdARC8UfgPY4lCbTI/LY6Y=;
        b=ejCGnxenG7+Gl8vDJU5kep/LdSWpUfdMBY5IW6FrWvEn75WGln1QMZ0/g8exv24i1U
         UTjOaQaYqqE0FwILT7mPuS42VR/ilOVH74w8LcVh+P3lOJJtQlstNvDeIrBEWmi9zieV
         RlVnHK0BGWWL2U5Ry71OXZYmSfuYm/J4NHnGHti6VrOz8FHrppWB9pvUQHJXF+b1yfrW
         +Y8QIrbvzp2u8WNULRvR1GBYfx/3HyRsZwQdzWRCAZ4MNBhylaCEPj3GTBq8qRDRHlo4
         82Fjq3Z8r9LaQFifN3pGmru9mqzImwr4+iEanc7PePGUboM2YCU+GnaaQ/w8LQj05men
         fe3Q==
X-Gm-Message-State: AOJu0Yypl+AiV2+Mn0v+rlRB2riaaGjllwyG28kNPFdxecfSWoJ38xd2
	ITUwqywydSRKyqynLfhGRfOft3TDfBFva2XY9P9PSwzmW7fFHxlxeLUWtWL6DP1TrW250rx1DDA
	yokM=
X-Google-Smtp-Source: AGHT+IFZQ5LFVtAo+zD9yBI9vNMPDpZQ9goyE4iqj6iRAqZFGgpX3mWEjXn1/fCMcKiUhrZKbkzKDw==
X-Received: by 2002:aa7:88c5:0:b0:706:34f3:7b60 with SMTP id d2e1a72fcca58-710dcaefb3bmr9207413b3a.23.1723433314832;
        Sun, 11 Aug 2024 20:28:34 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58735e2sm3006185b3a.30.2024.08.11.20.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:28:34 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [scarthgap][meta-python][PATCH 0/6] Fix python3-pydantic-* situation
Date: Sun, 11 Aug 2024 20:28:08 -0700
Message-ID: <cover.1723432397.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 03:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111758

From: Tim Orling <tim.orling@konsulko.com>

Unfortunately, python3-pydantic upgrades without required upgrades to python3-pydantic-core were merged
into "master" (Styhead) which left "scarthgap" in a broken situation.

This series first attempts to take backports from "master" (Styhead) and secondarily takes patches
already sent to the mailing list that were never merged. The goal is to bring as much as possible
to the same functional state as "master" when python3-pydantic-core 2.18.4 was merged.

Additional fixes for TMPDIR [build-paths] and ptest are also added from the mailing list.

Finally, we upgrade to the last python3-pydantic 2.7.x version, 2.7.4,  for bug fixes.

A big thank you to:
  * Frank de Brabander <debrabander@gmail.com> for helping to follow through
    with upstream for the TMPDIR fix and simplifying the ptest RDEPENDS for scarthgap.
  * Richard Leitner <dev@g0hl1n.net> for tirelessly trying to move this fix forward

The following changes since commit 2338409efc51cf2022ff5610a9fb689251706e2b:

  python3-pydantic-core: Fix build with python 3.12.4 (2024-08-03 12:25:17 -0400)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/scarthgap/python3-pydantic
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/scarthgap/python3-pydantic

Frank de Brabander (3):
  python3-pydantic-core: fix incompatible version
  python3-pydantic-core: fix TMPDIR path reference
  python3-pydantic-core: add missing RDEPENDS for ptest

Khem Raj (1):
  python3-pydantic: Upgrade to 2.7.3

Tim Orling (1):
  python3-pydantic: upgrade 2.7.3 -> 2.7.4

Wang Mingyu (1):
  python3-pydantic: upgrade 2.7.0 -> 2.7.1

 .../python/python3-pydantic-core-crates.inc   |  88 ++++++------
 ...-github.com-pyo3-pyo3-from-0.20.2-to.patch | 126 ------------------
 ...ate_self_schema-for-Python-3.12-1299.patch |  29 ----
 ...sion-from-1.76-to-1.75-in-Cargo.toml.patch |  29 ++++
 ...Dont-embed-RUSTFLAGS-in-final-binary.patch |  47 +++++++
 ...6.3.bb => python3-pydantic-core_2.18.4.bb} |  13 +-
 ...tic_2.7.0.bb => python3-pydantic_2.7.4.bb} |   2 +-
 7 files changed, 132 insertions(+), 202 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.3.bb => python3-pydantic-core_2.18.4.bb} (80%)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.0.bb => python3-pydantic_2.7.4.bb} (95%)

-- 
2.46.0


