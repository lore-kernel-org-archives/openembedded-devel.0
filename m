Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89B6E8785E
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:14:10 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1600.1770146045025367735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I6lX6Lxw;
 spf=pass (domain: konsulko.com, ip: 209.85.210.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82310b74496so3480849b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 11:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770146044; x=1770750844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whcwR1c0o8DyG5AaqrARDraTGtZVGqQJrl0Vn8OymrU=;
        b=I6lX6LxwQFxv37Y0VfVtrFRz7AbihHz4WtYzwT1uyxp7At+w9Aol3MvNjmBMLvFq/c
         1zLGvL0YsXlWbx2RrO++Ivz78r1V0K7wWGyPIpWeXVQRAqAaTy0IZxGxH8rTFxM1vx1P
         DLyXs+6PFSTjOjWkPc8FhFQR9Ig5AfI422w38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146044; x=1770750844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=whcwR1c0o8DyG5AaqrARDraTGtZVGqQJrl0Vn8OymrU=;
        b=CLZd5RQAnqH38ARP62K8VmMi8rgvMI3EbXmZO/1Aw5U8EMIY3IxcvuzZML4tpgnoA5
         G16pEjSD+FhzCFpauMKq7d79sTw5G8hVMtMcZKQmv6KYCzD9wUvLKmJV5Nzlad98EHtx
         uZDHuMa7swoL5X/aMcKDCHhCjrcqxMPRfNOD+RnCn1anKpiUraT+0lbalDtZoSYJdhsZ
         gBmPCxWGlhQvYKFePT3vZtqWlmAZMMe13yVovtv9saCTNRSgitxRup4y2beN2XrCNj1a
         5RskgXCCWFZf9DJCQMwj8JiifUMk5VA3bNFoepUuy/DbRyciIq2qbNAbpQVYOsYg4X3j
         sd7A==
X-Gm-Message-State: AOJu0YyjWKJEWln3PNiVVnjqq+/MQHB2LXMMPUtF/KVkB4lSMxEQHv+e
	udP7PZdRTcf+UUVHw3QQF1ppbiVZEYfxJVTkReNTkiRep4k+dnlCJovQHUQo8pTSDkHsFC7hQFn
	lh0qb
X-Gm-Gg: AZuq6aJ9Za8g8x/8b67a1WoTpEpRDzb4211CijLR9DXrWCQoiMv+de2uM3CYmzkXX7o
	c8QUtUMrvN46rmn/uiYVS9Fck+h3czMvHejDHnpJS9uL241moJYey0j8clGKgnaYcE5gYl4UBt0
	rRva46NK1djEaiGSBlD1JRi7Fr6Pjwc/wbYGFs8JuU1HA9qDE3lvbLCYSZWfJYkMRVbT3kNQjnZ
	F/MS+lBB14Q9x+yaotFxxbI9R2JvBq1Z1TFnp18VuP53jjvfgrSop9SgrudA9yjNaXO9yYLB703
	//jhf4CbiWgGmoIZB7HqpNMgwVwUYFnSezLOxRWXDQXmV1R/rqwXK/1qHrdG/zczHxSwYSRAvDD
	cfxoCCPQCtOm17QHAD6jRfb/T9HlCUUPxoLcaM8uY4UK/ctaMYtkRba3HErT8sVKvGM+I6U5tLW
	RARMntW/gaW3kjlCKGctRorlDavQnRG70Cxdloyp2BZC1XLPjHUebfhZlS4tN+
X-Received: by 2002:a05:6a00:1485:b0:7e8:4398:b369 with SMTP id d2e1a72fcca58-8241c68909dmr421012b3a.60.1770146043596;
        Tue, 03 Feb 2026 11:14:03 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163fb2sm137663b3a.14.2026.02.03.11.14.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:14:02 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 v2 0/6] Upgrade python3-orjson and enable ptest
Date: Tue,  3 Feb 2026 11:13:49 -0800
Message-ID: <cover.1770145884.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769715106.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124105

From: Tim Orling <tim.orling@konsulko.com>

This series upgrades python3-orjson to 3.11.6 and patches it to support
building on non-x86* architectures like riscv64 and arm64.

python3-faker has some test cases in tests/pytest that cause the
'pytest --autmake' parser to fail to create a "Testsuite summary" so
these have been skipped (there are still 2k+ test cases).

Tested on qemux86-64, qemuriscv64 and qemuarm64.

The following changes since commit 7bbe4a4e200452b1fd6c09c7fcf36c4b229146f6:

  php: upgrade 8.5.1 -> 8.5.2 (2026-01-20 14:35:59 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/python3-orjson-ptest-v2
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-orjson-ptest-v2

for you to fetch changes up to 1ff42dd4deeaa45e3389a0e56ab91a5d679e32e9:

  python3-orjson: use git fetcher; enable ptest (2026-02-03 10:55:33 -0800)

----------------------------------------------------------------

Tim Orling (6):
  python3-orjson: upgrade 3.10.17 -> 3.11.6
  python3-faker: add v40.1.2
  python3-tokenize-rt: add at v6.2.0
  python3-time-machine: add at v3.2.0
  python3-pendulum: add at v3.2.0
  python3-orjson: use git fetcher; enable ptest

 .../ptest-packagelists-meta-python.inc        |   5 +
 .../python/python3-faker/pytest.ini           |   3 +
 .../python/python3-faker_40.1.2.bb            |  48 +++++++
 .../python/python3-orjson-crates.inc          | 124 +++++++++---------
 ...rd-avx512-module-with-x86-target-cfg.patch |  37 ++++++
 ...e-detection-macro-in-pystrref-object.patch |  34 +++++
 .../python/python3-orjson_3.10.17.bb          |  22 ----
 .../python/python3-orjson_3.11.6.bb           |  46 +++++++
 .../python/python3-pendulum-crates.inc        |  52 ++++++++
 .../0001-rust-Cargo.toml-inhibit-strip.patch  |  31 +++++
 .../python/python3-pendulum_3.2.0.bb          |  35 +++++
 .../python/python3-time-machine_3.2.0.bb      |  28 ++++
 .../python/python3-tokenize-rt_6.2.0.bb       |  21 +++
 13 files changed, 404 insertions(+), 82 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-faker/pytest.ini
 create mode 100644 meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pendulum-crates.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pendulum/0001-rust-Cargo.toml-inhibit-strip.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb

-- 
2.43.0


