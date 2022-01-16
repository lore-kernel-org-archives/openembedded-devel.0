Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87372C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.29795.1642310957430791075
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WTMFcSRX;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id n11so14940776plf.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PfVIgZJx7iJf+/khIlAPETktMaH+knHhjBBbJFqs/AA=;
        b=WTMFcSRX9E/ebhWEOSZ2qGN18HlAKAIoOGN14nymcDNUmIcB8iw3tcoMhsUwFZXAFp
         795oTBNSR8vDEYxy9bohJUpxC0VhgUv79ewwQQaHk/LepLZ9fEcd/nywVnYY1C6psSKW
         SEYWZr4e0XEX1m76LAhvvV4HW0kYB5nCU6m3LrwF5QwzpSJvAfYrxRSWPaNcuS4HmO9/
         bILgckmigx2rEUXPPnxdctmEHw/JH9GoPKaZvYybUXHY3EqokDTZS2aE884gzsTqGm86
         EIJQ8YYPdMf7W4bmjpFrnfzskfTgBNuJ3n/8yz6L1LD+TGmV0k0iWX1dewM57lq0JD/7
         1Zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PfVIgZJx7iJf+/khIlAPETktMaH+knHhjBBbJFqs/AA=;
        b=5+zt2yBo6ugwRp0YeX8NJoy5ihpYhhxzGdjGc+A+nldOEOFtYjRBERbnMO70qpjepF
         wGNebabt9RjVH3Z8TcHNe1321ta1vm6SHHOoKXfng4TJZoQTwavrgDgmk91m+C4DZ27g
         IUapqCFnZoWaxh35mPqtdL6xkhRUrrKGh29Pacvz2JSPirx/4iYTZoRD/b+rpQryh3qi
         Io1MuzNv9x/PzDTb8eEWlbELPthKRmHzaIjkARPOYu+XHTxAqhlgS47N67Mcc3sIVK5J
         O4LUnro9kYOUIy6SHNkluDL4HR63GhwE2M3OXz1FKhFMBvfv4e6nr3nTdsE9CpyjSRdP
         hs3w==
X-Gm-Message-State: AOAM533Nm/rbiSlih2Yk5XTssYBMKyptMCIrxwbfbIQjIaVXMcv3M25n
	8TBZSep7XdZZCKQlsfj2fGlu/501UfGNmw==
X-Google-Smtp-Source: 
 ABdhPJyRb3YVhzhdZAiw7i4doz78Vhz9VEMnqGo/87sWyKoBsxp4Gj++Tj3kApswq1qt/IkRQgRr+g==
X-Received: by 2002:a17:902:ea06:b0:14a:6827:8cf9 with SMTP id
 s6-20020a170902ea0600b0014a68278cf9mr16508215plg.100.1642310956542;
        Sat, 15 Jan 2022 21:29:16 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/7] setuptools-rust and python3-cryptography
Date: Sat, 15 Jan 2022 21:28:57 -0800
Message-Id: <cover.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94875

This series upgrades python3-cryptography from the last version to be
purely Python/C extensions (3.3.2) to the latest version which also
includes Rust extensions (36.0.1).

This has been tested (including full ptest runs) on:
  - qemux86-64
  - qemux86-musl
  - qemuarm64

The test cases require an absolute minimum of 1 GB of free memory
according to the documentation, but in practice it was more performant
to have 2 GB of free memory. For this reason a check-memfree.py test is
added to run-ptest to avoid OOM/Exit code 9 in the ptest-runner. The
test cases were run with:

    runqemu nographic slirp qemuparams="-m 2176 -smp 4"

On x86-64 with kvm this takes about 5 minutes.

The results are 2856+/-2 passed, 1654+/-2 skipped. Of the skipped tests
1600 of them are because of unsupported "counter location middle_fixed"
in https://github.com/pyca/cryptography/pull/2773. A further ~35 test
cases are skipped because of not setting --wychefproof-root, but even
when the Google wychefproof repository is cloned and the option is set,
it adds another ~5000 skipped test cases:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=timo/wip-python3-cryptography-ptest&id=fff4da6e70c97265e17a82f1d043ab16039d510e

Upstream uses python3-pytest-xdist to parallize test cases (and
python3-pytest-shard to distribute amongst workers), but this uses
stdin/stdout and therefore we have no output to ptest-runner.

This series introduces two helper classes pyo3.bbclass and
setuptools_rust.bbclass for Python/Rust projects.

The setuptools_rust.bbclass wraps PyO3, Cargo and the newly added
python3-setuptools-rust-native recipe. Since oe-core only supports
native rustc at this time, only a native recipe is provided.

To demonstrate that these classes are applicable to multiple recipes, we
also introduce python3-pyruvate, a WSGI implementation in Rust.

While we are at it we upgrade python3-pytest-subtests from 0.5.0 to
0.6.0.

The following changes since commit df5c1a31fdb8325d1c514f9ed8a7b3805dc581ac:

  python3-diskcache: Upgrade 5.3.0 -> 5.4.0 (2022-01-10 10:35:02 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib timo/python3-cryptography_36.0.1
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-cryptography_36.0.1

Tim Orling (7):
  python3-setuptools-rust-native: add v1.1.2 recipe
  pyo3.bbclass: add class for PyO3 cross-compilation
  setuptools3_rust.bbclass: setuptoools Rust plugin
  python3-pyruvate: add recipe for v1.1.2
  python3-pytest-subtests: upgrade 0.5.0 -> 0.6.0
  python3-cryptography-vectors: upgrade 35.0.0 => 36.0.1
  python3-cryptography: upgrade 3.3.2 -> 36.0.1

 meta-python/classes/pyo3.bbclass              |  30 +++++
 meta-python/classes/setuptools3_rust.bbclass  |  11 ++
 ...=> python3-cryptography-vectors_36.0.1.bb} |   5 +-
 .../0001-Cargo.toml-specify-pem-version.patch |  31 +++++
 .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ++++
 .../python3-cryptography/check-memfree.py     |  10 ++
 .../python/python3-cryptography/h-test.patch  |  10 --
 .../python3-cryptography/openssl3.patch       |  62 ---------
 .../python/python3-cryptography/run-ptest     |   4 +-
 .../python/python3-cryptography_3.3.2.bb      |  68 ----------
 .../python/python3-cryptography_36.0.1.bb     | 121 ++++++++++++++++++
 .../python/python3-pyruvate_1.1.2.bb          | 119 +++++++++++++++++
 .../python/python3-pytest-subtests_0.5.0.bb   |  16 ---
 .../python/python3-pytest-subtests_0.6.0.bb   |  20 +++
 .../python3-setuptools-rust-native_1.1.2.bb   |  26 ++++
 15 files changed, 403 insertions(+), 158 deletions(-)
 create mode 100644 meta-python/classes/pyo3.bbclass
 create mode 100644 meta-python/classes/setuptools3_rust.bbclass
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_35.0.0.bb => python3-cryptography-vectors_36.0.1.bb} (72%)
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
 create mode 100755 meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography/openssl3.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb

-- 
2.30.2


