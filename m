Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2907.1794165989036089338
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2162845e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165987; x=1794770787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mj/veom7493WDyjJmiUs1pbTgEFJuJYA/hVamR9bdGU=;
        b=g+XXyHJUCV+4pGywvVoFKIugPn3f2N4qHlJfzSCzpF4ep8NCYNfcAJHlINy5j6RHJY
         AeClsaZQc9LpUK+xU5hVB2P/i7ws9Osq7aMyJ+N9NvbUk4ytHkMAEbDk5Pu2fQMl/fMW
         SStr13EIY/20E8BgdgI4ziOGXG2QUakEdV/du1mb/M6Ga2EflQ5uMcovzHSuzrwGGgn1
         RhwcOc4Y76SQlLohSbQyflX3G4shXkLEYsRJ5L6Cy8e/xvOFkTWxzaVbqaCQf436BCiN
         wvgEEf9YIyOvvARyB9DwWlDKWeDGnpbE3JotCCW2EVEE3jSEaLoYhmvTT9s+uVdRMTZj
         3gUQ==
X-Gm-Message-State: APuU4Z+eOINrpfNmnCdc5/0p0P4EJDiX5QgS0pCcP21wIRHi61x4he1J
	2MAB5FgwUMXnuEf+1MNqkefQzK9gm6cOhyZMmbA36P67Jxq6UMtFJoSXqR7InA==
X-Gm-Gg: AYBFou2Vi5MD2hRT3J7TTBbqOG7hWqf4SNBD6EC7LNUGiK8AxqAoO2RM7pB+ClG6ULI
	MzzvSt3QmwHrZai3vWqYtCj9DnH80mSuy/NEMhMiKoDYUaQsV7wWRtJRqBJx9yMDTtiDiqoxZYV
	aab/ppIJKeE6iLgK4R284D5u+qZnxzj37PN3J3tVHojoVyD8x4mZKIia6lOhUfpTZp4nZZM89Nf
	3BTC6RpcfCUVIoI/qq7W3OUdQORjFiz8u5yiZrD9lnTXp3O+xj9XO5PsGtZqPznVeF0uPD3AMQe
	tRqJkHygNPaImRIyR3uQsfJMsTeNNhzGy30qycdqXSmPBMuflgPdK62wKqlwL3saxtBlP4PG61p
	EOX+7gNyPr5/Id+T93lKFtHj8xUVQLQEgbAJglS00nOHOr0bTSGMvRw7OdObW3Y9HZtn2g3gLGA
	mTkrx/kZvGxqjB0lo/Fw0T6HC/w1BsoL/CkgVtSHGh9YLNQLeUwLvNdr+k1Re3mX9Hgp6QNrh55
	1DZyvEuRcEzzv39fp/71LKJ/KzWloCaJsrSUQvq2l1Qi2qsrxVYobD1nNzKrzws4oz4so7f39mP
	vufBAj2JP4jpE/0jZGA/aouwjE6oafDbAhAmHyM7uNoQqVAfYWYXij6V2XD3ohBL/bPWusOmD1t
	wAEXo+nTonYQ0t1TfBqK4iyqVPu+dSi9++Z5ul32/hm6kmP9V6bcdNEIq+Q==
X-Received: by 2002:a05:600c:1d05:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4b963c8c780mr38239215e9.18.1794165987079;
        Sun, 08 Nov 2026 11:26:27 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:26 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 00/13] Python updates for Home Assistant 2026.11
Date: Sun,  8 Nov 2026 20:26:05 +0100
Message-ID: <20261108192623.1082770-1-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132022
Content-Type: text/plain; charset="utf-8"

This series updates meta-python for meta-homeassistant's upgrade to Home
Assistant 2026.11.0. Not every patch is needed for the same reason, so
here is what each group is for:

Needed by the Cython 3.3.1 upgrade sent to openembedded-core (PyAV 19,
which Home Assistant 2026.11 pins, needs Cython 3.3):
- python3-propcache 0.5.4: 0.4.1 with the backported Cython 3.2 patch
  requires Cython ~= 3.2.0 and does not build with Cython 3.3.

Needed as a set:
- python3-pydantic-core 2.50.1 and python3-pydantic 2.14.1: pydantic pins
  pydantic-core exactly; "import pydantic" raises SystemError when they do
  not match.
- python3-google-api-core 2.44.0, python3-googleapis-common-protos 1.76.0
  and the new python3-proto-plus 1.29.0: the old releases declare
  protobuf < 6 while meta-python has 7.36, and google-cloud-pubsub 2.39.2,
  which Home Assistant 2026.11 uses, requires google-api-core >= 2.25.0.
  The old google-api-core still imports with protobuf 7.36; I did not see
  a runtime failure, so this is about the declared requirements.
  meta-python-ai carries proto-plus 1.27.1 as well; once this lands it can
  drop its copy.

Upgrades to the versions Home Assistant 2026.11 pins. I have not seen
these fail with the current versions; they bring the layer in line with
the pins:
- python3-pillow 13.0.0 (pinned by Home Assistant core). It contains the
  fix for CVE-2026-112393, so the backport added in 53cf975e9b is dropped.
- python3-sqlalchemy 2.0.54, python3-lru-dict 1.4.1, python3-orjson
  3.13.0 (pinned by Home Assistant core)
- python3-pychromecast 14.1.1 (cast integration)
- python3-pylint 4.1.3 and python3-pytest-socket 0.8.1 (Home Assistant
  test requirements, used by its ptest)

Recipe notes:
- python3-propcache 0.5.4 requires Cython >= 3.2.0 and has a
  build-inplace config setting, so both local patches are dropped.
- python3-pychromecast 14.1.1 allows setuptools < 85 and wheel < 0.49,
  which OE-Core satisfies, so the relax patch is dropped.
- python3-lru-dict 1.4.1 pins setuptools==80.9.0; relaxed with an
  Inappropriate [oe-specific] patch.
- python3-pytest-socket 0.8.1 moved to uv_build; backport of the upstream
  change that allows uv_build < 0.14.
- python3-pylint 4.1.3: three patches are dropped (two are in 4.1.3, the
  license-files one is not needed with setuptools >= 77). The ptest
  expectation patch was regenerated by running the functional test with
  pylint 4.1.3 and astroid 4.3.4 installed outside the source tree, the
  way the ptest sees pylint.
- python3-google-api-core and python3-googleapis-common-protos: the sdists
  are now named with underscores, which is the pypi.bbclass default, so
  PYPI_PACKAGE_SDIST is dropped.

The series is independent of the "Fixes for pika, pint, haversine and
httpx2" series sent at the same time; both apply to master on their own.

Related changes for the Home Assistant 2026.11 upgrade. They belong
together and are meant to land as a set:

- openembedded-core: python3-cython 3.2.9 -> 3.3.1
  https://github.com/thomas-roos/openembedded-core/commits/ha-2026.11
- meta-openembedded (meta-python): this series and the fixes series
  https://github.com/thomas-roos/meta-openembedded/commits/ha-2026.11
- meta-python-ai: 7 upgrades
  https://github.com/zboszor/meta-python-ai/pull/46
- meta-homeassistant: Home Assistant 2026.3.1 -> 2026.11.0
  https://github.com/meta-homeassistant/meta-homeassistant/pull/207

Testing, on top of master b5d60afb63 with the Cython 3.3.1 upgrade:
- built for qemux86-64 (x86-64-v3): all recipes of the series and
  meta-homeassistant's core-image-homeassistant (Home Assistant 2026.11)
- ptests pass for every changed recipe that has a ptest image: orjson,
  pillow, propcache, pydantic, pydantic-core, pylint
- checked with bodnuti: patchtest pass, no oelint-adv or shellcheck
  findings

AI disclosure: the patches, commit messages and this cover letter were
written with Claude Code (Claude Opus 5.5), as the AI-Generated tags in
each patch say. I reviewed every change, ran the builds and tests above,
and can answer for them.


Thomas Roos (13):
  python3-propcache: upgrade 0.4.1 -> 0.5.4
  python3-pychromecast: upgrade 14.0.10 -> 14.1.1
  python3-pillow: upgrade 12.3.0 -> 13.0.0
  python3-sqlalchemy: upgrade 2.0.52 -> 2.0.54
  python3-lru-dict: upgrade 1.3.0 -> 1.4.1
  python3-pytest-socket: upgrade 0.7.0 -> 0.8.1
  python3-pylint: upgrade 4.0.8 -> 4.1.3
  python3-orjson: upgrade 3.12.0 -> 3.13.0
  python3-pydantic-core: upgrade 2.46.5 -> 2.50.1
  python3-pydantic: upgrade 2.13.5 -> 2.14.1
  python3-proto-plus: add recipe
  python3-googleapis-common-protos: upgrade 1.63.2 -> 1.76.0
  python3-google-api-core: upgrade 2.19.1 -> 2.44.0

 ...1.bb => python3-google-api-core_2.44.0.bb} |   9 +-
 ...ython3-googleapis-common-protos_1.76.0.bb} |   6 +-
 ...pyproject.toml-do-not-pin-setuptools.patch |  25 +++
 ...ict_1.3.0.bb => python3-lru-dict_1.4.1.bb} |   7 +-
 .../python/python3-orjson-crates.inc          |  40 ++--
 ...rd-avx512-module-with-x86-target-cfg.patch |   5 +-
 ...e-detection-macro-in-pystrref-object.patch |  11 +-
 ...son_3.12.0.bb => python3-orjson_3.13.0.bb} |   2 +-
 .../python3-pillow/CVE-2026-112393.patch      | 124 -----------
 ...low_12.3.0.bb => python3-pillow_13.0.0.bb} |   3 +-
 ...1-Update-Cython-to-version-3.2.3-184.patch |  33 ---
 .../0001-build-wheel-in-place.patch           |  31 ---
 ...he_0.4.1.bb => python3-propcache_0.5.4.bb} |   8 +-
 .../python/python3-proto-plus_1.29.0.bb       |  15 ++
 ...roject.toml-relax-build-requirements.patch |  29 ---
 ...0.10.bb => python3-pychromecast_14.1.1.bb} |   3 +-
 .../python/python3-pydantic-core-crates.inc   |  88 ++++----
 ...toml-Update-bitvec-to-use-radium-1.x.patch |  14 +-
 ...6.5.bb => python3-pydantic-core_2.50.1.bb} |   2 +-
 ...c_2.13.5.bb => python3-pydantic_2.14.1.bb} |   2 +-
 ...1-Adjust-test-expectations-for-ptest.patch |  18 +-
 ...l-Keep-tool.setuptools.license-files.patch |  43 ----
 .../0003-astroid-4.1.2-endlineno.patch        | 203 ------------------
 ...s-do-not-pass-asname-to-Import.infer.patch |  39 ----
 ...ylint_4.0.8.bb => python3-pylint_4.1.3.bb} |   5 +-
 ...1-pyproject.toml-allow-uv_build-0.13.patch |  25 +++
 ....7.0.bb => python3-pytest-socket_0.8.1.bb} |   5 +-
 ...2.0.52.bb => python3-sqlalchemy_2.0.54.bb} |   2 +-
 28 files changed, 166 insertions(+), 631 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.19.1.bb => python3-google-api-core_2.44.0.bb} (71%)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.63.2.bb => python3-googleapis-common-protos_1.76.0.bb} (63%)
 create mode 100644 meta-python/recipes-devtools/python/python3-lru-dict/0001-pyproject.toml-do-not-pin-setuptools.patch
 rename meta-python/recipes-devtools/python/{python3-lru-dict_1.3.0.bb => python3-lru-dict_1.4.1.bb} (67%)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.12.0.bb => python3-orjson_3.13.0.bb} (97%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
 rename meta-python/recipes-devtools/python/{python3-pillow_12.3.0.bb => python3-pillow_13.0.0.bb} (94%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch
 rename meta-python/recipes-devtools/python/{python3-propcache_0.4.1.bb => python3-propcache_0.5.4.bb} (68%)
 create mode 100644 meta-python/recipes-devtools/python/python3-proto-plus_1.29.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.10.bb => python3-pychromecast_14.1.1.bb} (72%)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.46.5.bb => python3-pydantic-core_2.50.1.bb} (94%)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.13.5.bb => python3-pydantic_2.14.1.bb} (98%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/0003-astroid-4.1.2-endlineno.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/0004-checkers-variables-do-not-pass-asname-to-Import.infer.patch
 rename meta-python/recipes-devtools/python/{python3-pylint_4.0.8.bb => python3-pylint_4.1.3.bb} (86%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-socket/0001-pyproject.toml-allow-uv_build-0.13.patch
 rename meta-python/recipes-devtools/python/{python3-pytest-socket_0.7.0.bb => python3-pytest-socket_0.8.1.bb} (60%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.52.bb => python3-sqlalchemy_2.0.54.bb} (88%)

-- 
2.56.0

