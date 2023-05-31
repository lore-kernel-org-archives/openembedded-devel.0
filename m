Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4314CC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9096.1685521509908603719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=m1PE8BoB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30aebe2602fso2457816f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521508; x=1688113508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEa+EIqyhdfnGWRt8WGelSS9NIkIP6/mRVGUxRfu4Fk=;
        b=m1PE8BoBpiRmg3f2o/UW+Ij63yqwQeKL7MsSvslwhqYpGlDzRzgIP6NkMXEEhrRpmr
         eW5M4rlwgBtXcXDLbW2kcJN0ODYCBarjDaFQc/nC61b+jQLjtNajl1h0jhaVVDO2M/YC
         RN3eAYkbb8KlLd11wSoBAempKAPvumHBEF2Zbe7ArVfF34+DcrezDhz+19llpJbMotDT
         a3ENpUxu/mIXqOUTXhQbOGRNFEBDBiWe+tsjCEBWyqAppphpy+aUonqVUWwBw7dYxsbA
         PC3Z2wGgjMnC91iEjXkFz3qtXX7bdebsVSeQ9T+C3FERLnbieoLGsbi7WhYdIkMy6TRA
         1qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521508; x=1688113508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEa+EIqyhdfnGWRt8WGelSS9NIkIP6/mRVGUxRfu4Fk=;
        b=d6G/kbj6YmSbIv9+hddPzQ/kimkMiE/1CCAcKgh/dBOyRrTnDNq4VOpcVwRul/cDQd
         gnY0JKr5xJGK6/xB/jxOU8ZzRMN4PkOUotJ95rrVFuYcDlz4tRgbFQ7PTNAzDDJlZk6N
         ksmk7YF0xHg5c4eEb83/1MdYpWU7jT1B4ZX4yER13zcj36+AdU81zGJjcTAPis1dw6pq
         uSNplC6NyKpIELRcrwYVv1SLMEK+HPdyAwDpCRD4UtYgs26zShQThmFWaDlHKGJz5LLh
         9dXt8tMMLXgg94RsB7QK+cQ8dBQnbtSukoDGFRXp+ZuxDwk3jMZ6IAaT6TJoPTp2dr/Q
         3Viw==
X-Gm-Message-State: AC+VfDyrvU10UIe8xYgzBH+1kJIxhetfwXWpJYwMJk86qeZuYWAKqOYN
	3aQOTTpg5bcJSG5tknGWbB2NqA==
X-Google-Smtp-Source: ACHHUZ5aDAtWK/jxNI5x5vj7xKU2SWTpvOrfi2aMamwHvFjiIiVgxA+74fq3sKq8SQIN2o/p9XSc3A==
X-Received: by 2002:adf:e702:0:b0:306:3286:69a2 with SMTP id c2-20020adfe702000000b00306328669a2mr3356421wrm.48.1685521507911;
        Wed, 31 May 2023 01:25:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 000/149] python3: improve run-time dependencies situation
Date: Wed, 31 May 2023 10:22:08 +0200
Message-Id: <20230531082437.10646-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102927

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

A significant number of python recipes don't specify all the run-time
dependencies required to at least be able to import all the installed
modules. This series is the result of a semi-automated run through all
python recipes in meta-python, building minimal images and verifying that
there are no import exceptions.

Most patches just add missing RDEPENDS entries where needed. Some tweak
the coding style if it's inconsistent. There are a few new packages on
which existing recipes depend at run-time but which were not provided
in meta-python previously.

This probably doesn't cover all the corner cases. Ptest packages were not
tested with the assumption that they are being run somewhere and verified
already.

There are also other run-time dependencies that may fail - like python code
executing external programs that may be missing or ctypes opening shared
objects at run-time later than at import-time but in general this series
should at least improve the situation significantly.

There's some space for QA improvement in OE-core - like maybe raising
a warning if a python recipe doesn't specify any RDEPENDS which usually
means they are missing (but the module can also be very simple so this
cannot be a hard fail).

Bartosz Golaszewski (149):
  python3-pyparted: add missing run-time dependencies
  python3-send2trash: add missing run-time dependencies
  python3-pywbem: drop unneeded class from RDEPENDS
  python3-pywbem: don't use PYTHON_PN
  python3-pywbem: order RDEPENDS alphabetically
  python3-pywbem: add missing run-time dependencies
  python3-mock: cleanup RDEPENDS
  python3-mock: add missing run-time dependencies
  python3-cson: fix run-time dependencies
  python3-ldap: don't use PYTHON_PN
  python3-ldap: add missing run-time dependencies
  python3-pyrad: add missing run-time dependencies
  python3-html2text: add missing run-time dependencies
  python3-parse: don't use PYTHON_PN and improve coding style
  python3-parse: add missing run-time dependencies
  python3-meld3: add missing run-time dependencies
  python3-pyiface: add missing run-time dependencies
  python3-mpmath: add missing run-time dependencies
  python3-uswid: add missing run-time dependencies
  python3-xmlrunner: add missing run-time dependencies
  python3-editor: add missing run-time dependencies
  python3-pykwalify: don't use PYTHON_PN and improve coding style
  python3-pykwalify: add missing run-time dependencies
  python3-iperf: add missing run-time dependencies
  python3-sdnotify: add missing run-time dependencies
  python3-service-identity: add missing run-time dependencies
  python3-sqlsoup: add missing run-time dependencies
  python3-sqlalchemy: don't use PYTHON_PN and improve coding style
  python3-sqlalchemy: add missing run-time dependencies
  python3-pure-eval: add missing run-time dependencies
  python3-stack-data: fix coding style
  python3-stack-data: add missing run-time dependencies
  python3-sympy: add missing run-time dependencies
  python3-thrift: don't use PYTHON_PN and improve coding style
  python3-thrift: add missing run-time dependencies
  python3-tomlkit: add missing run-time dependencies
  python3-tornado: drop ${PN} from RDEPENDS
  python3-tornado: fix coding style
  python3-tornado: remove the testing submodule from FILES:${PN}-test
  python3-tornado: add missing run-time dependencies
  python3-trustme: add missing run-time dependencies
  python3-twofish: add missing run-time dependencies
  python3-txws: add missing run-time dependencies
  python3-web3: add missing run-time dependencies
  python3-uefi-firmware: add missing run-time dependencies
  python3-websockets: fix coding style
  python3-websockets: add missing run-time dependencies
  python3-xlrd: fix coding style
  python3-xlrd: add missing run-time dependencies
  python3-versiontools: add missing run-time dependencies
  python3-typeguard: add missing run-time dependencies
  python3-process-tests: add missing run-time dependencies
  python3-pyatspi: add missing run-time dependencies
  python3-pydantic: don't use PYTHON_PN and improve coding style
  python3-pydantic: add missing run-time dependencies
  python3-python-vlc: add missing run-time dependencies
  python3-redis: fix coding style
  python3-redis: add missing run-time dependencies
  python3-raven: add missing run-time dependencies
  python3-pypng: new package
  python3-qrcode: add missing run-time dependencies
  python3-pyusb: fix run-time dependencies
  python3-pytest-mock: add missing run-time dependencies
  python3-pyroute2: fix coding style
  python3-fcntl: add missing run-time dependencies
  python3-pyproject-metadata: add missing run-time dependencies
  python3-pyproj: don't use PYTHON_PN
  python3-pyproj: drop unnecessary run-time dependency
  python3-pyproj: add missing run-time dependencies
  python3-classes: new package
  python3-pylyrics: add missing run-time dependencies
  python3-pyjwt: stop using PYTHON_PN
  python3-pyjwt: add missing run-time dependencies
  python3-javaobj-py3: add missing run-time dependencies
  python3-pyjks: stop using PYTHON_PN
  python3-pyjks: fix run-time dependencies
  python3-pyexpect: add missing run-time dependencies
  python3-pynetlinux: fix relative imports
  python3-pynetlinux: add missing run-time dependencies
  python3-pickleshare: add missing run-time dependencies
  python3-petact: add missing run-time dependencies
  python3-pefile: add missing run-time dependencies
  python3-jsonpath-rw: add missing run-time dependencies
  python3-jsonrpcclient: add missing run-time dependencies
  python3-jstyleson: add missing run-time dependencies
  python3-kconfiglib: add missing run-time dependencies
  python3-libevdev: add missing run-time dependencies
  python3-linux-procfs: add missing run-time dependencies
  python3-lockfile: add missing run-time dependencies
  python3-msm: fix coding style
  python3-lazy: new recipe
  python3-msm: add missing run-time dependencies
  python3-netaddr: stop using PYTHON_PN
  python3-netaddr: add missing run-time dependencies
  python3-ninja-syntax: new package
  python3-ninja: add missing run-time dependencies
  python3-nmap: add missing run-time dependencies
  python3-oslash: add missing run-time dependencies
  python3-padaos: add missing run-time dependencies
  python3-padatious: add missing run-time dependencies
  python3-pako: add missing run-time dependencies
  python3-paramiko: stop using PYTHON_PN
  python3-paramiko: add missing run-time dependencies
  python3-path: fix coding style
  python3-path: add missing run-time dependencies
  python3-ecdsa: don't install tests
  python3-et-xmlfile: fix coding style
  python3-et-xmlfile: add missing run-time dependencies
  python3-flask-user: fix coding style
  python3-flask-user: add missing run-time dependencies
  python3-isort: fix coding style
  python3-isort: add missing run-time dependencies
  python3-isodate: stop using PYTHON_PN
  python3-isodate: add missing run-time dependencies
  python-idna-ssl: add missing run-time dependencies
  python3-hpack: add missing run-time dependencies
  python3-h11: add missing run-time dependencies
  python3-gsocketpool: drop unneeded DEPENDS
  python3-gsocketpool: stop using PYTHON_PN
  python3-gsocketpool: add missing run-time dependencies
  python3-flask-mail: stop using PYTHON_PN
  python3-flask-mail: add missing run-time dependencies
  python3-flask-sijax: stop using PYTHON_PN
  python3-flask-sijax: add missing run-time dependencies
  python3-flask-script: remove recipe
  python3-aioserial: fix coding style
  python3-aioserial: add missing run-time dependencies
  python3-aspectlib: add missing run-time dependencies
  python3-asyncio-throttle: add missing run-time dependencies
  python3-attrdict3: add missing run-time dependencies
  python3-betamax: add missing run-time dependencies
  python3-binwalk: add missing run-time dependencies
  python3-can: fix coding style
  python3-can: add missing run-time dependencies
  python3-click-spinner: add missing run-time dependencies
  python3-colorlog: add missing run-time dependencies
  python3-colorzero: add missing run-time dependencies
  python3-configobj: fix coding style
  python3-configobj: add missing run-time dependencies
  python3-configshell-fb: add missing run-time dependencies
  python3-coverage: fix coding style and RDEPENDS
  python3-custom-inherit: add missing run-time dependencies
  python3-dateparser: fix coding style
  python3-dateparser: add missing run-time dependencies
  python3-tzlocal: fix coding style
  python3-tzlocal: add missing run-time dependencies
  python3-dbus-next: add missing run-time dependencies
  python3-defusedxml: add missing run-time dependencies
  python3-setuptools-scm-git-archive: add missing run-time dependencies

 meta-oe/recipes-security/nmap/nmap_7.80.bb    |  6 +-
 .../python3-gsocketpool_0.1.6.bb              |  7 ++-
 .../python-hpack/python3-hpack_4.0.0.bb       |  2 +
 .../python-thrift/python3-thrift_0.16.0.bb    |  9 +--
 .../python-txws/python3-txws_0.9.1.bb         |  5 ++
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python-flask-script.inc            | 12 ----
 .../python/python-flask-sijax.inc             |  6 +-
 .../python/python-idna-ssl.inc                |  5 ++
 .../python/python3-aioserial_1.3.1.bb         |  6 +-
 .../python/python3-aspectlib_2.0.0.bb         |  5 +-
 .../python/python3-asyncio-throttle_1.0.2.bb  |  2 +
 .../python/python3-betamax_0.8.1.bb           |  6 +-
 .../python/python3-binwalk_2.3.3.bb           |  8 ++-
 .../python/python3-can_4.2.1.bb               | 28 +++++----
 .../python/python3-classes_0.4.1.bb           | 10 ++++
 .../python/python3-click-spinner_0.1.10.bb    |  2 +
 .../python/python3-colorlog_6.7.0.bb          |  2 +
 .../python/python3-colorzero_2.0.bb           |  5 +-
 .../python/python3-configobj_5.0.8.bb         |  5 +-
 .../python/python3-configshell-fb_1.1.29.bb   |  7 ++-
 .../python/python3-coverage_7.2.6.bb          | 19 +++---
 .../python/python3-custom-inherit_2.3.1.bb    |  5 ++
 .../python/python3-dateparser_1.1.8.bb        | 11 ++--
 .../python/python3-dbus-next_0.2.3.bb         |  5 ++
 .../python/python3-defusedxml_0.7.1.bb        |  2 +
 .../python/python3-ecdsa_0.18.0.bb            |  4 ++
 .../python/python3-editor_1.0.4.bb            |  5 ++
 .../python/python3-et-xmlfile_1.1.0.bb        |  8 ++-
 .../python/python3-flask-mail_0.9.1.bb        |  5 +-
 .../python/python3-flask-script_2.0.6.bb      |  2 -
 .../python/python3-flask-user_0.6.19.bb       | 13 ++--
 .../python/python3-h11_0.14.0.bb              |  2 +
 .../python/python3-html2text_2020.1.16.bb     |  2 +
 .../python/python3-iperf_0.1.11.bb            |  6 ++
 .../python/python3-isodate_0.6.1.bb           |  3 +-
 .../python/python3-isort_5.12.0.bb            | 16 ++---
 .../python/python3-javaobj-py3_0.4.3.bb       |  5 ++
 .../python/python3-jsonpath-rw_1.4.0.bb       |  7 ++-
 .../python/python3-jsonrpcclient_4.0.2.bb     |  4 +-
 .../python/python3-jstyleson_0.0.2.bb         |  2 +
 .../python/python3-kconfiglib_14.1.0.bb       |  6 ++
 .../python/python3-lazy_1.5.bb                |  8 +++
 .../python/python3-libevdev_0.11.bb           |  5 ++
 .../python/python3-linux-procfs_0.7.1.bb      |  2 +
 .../python/python3-lockfile_0.12.2.bb         |  5 +-
 .../python/python3-meld3_2.0.1.bb             |  6 ++
 .../python/python3-mock_5.0.2.bb              | 15 +++--
 .../python/python3-mpmath_1.3.0.bb            |  5 +-
 .../python/python3-msm_0.8.8.bb               | 14 ++++-
 .../python/python3-netaddr_0.8.0.bb           |  5 +-
 .../python/python3-ninja-syntax_1.7.2.bb      | 10 ++++
 .../python/python3-ninja_1.11.1.bb            |  7 ++-
 .../python/python3-oslash_0.6.3.bb            |  5 +-
 .../python/python3-padaos_0.1.10.bb           |  2 +
 .../python/python3-padatious_0.4.8.bb         |  8 +++
 .../python/python3-pako_0.3.1.bb              |  7 +++
 .../python/python3-paramiko_3.1.0.bb          | 11 ++--
 .../python/python3-parse_1.19.0.bb            | 13 ++--
 .../python/python3-path_16.6.0.bb             | 12 ++--
 .../python/python3-pefile_2023.2.7.bb         |  6 ++
 .../python/python3-petact_0.1.2.bb            |  6 ++
 .../python/python3-pickleshare_0.7.5.bb       |  2 +
 .../python/python3-process-tests_2.1.2.bb     |  6 ++
 .../python/python3-pure-eval_0.2.2.bb         |  5 ++
 .../python/python3-pyatspi_2.46.0.bb          |  2 +
 .../python/python3-pydantic_1.10.7.bb         | 19 +++---
 .../python/python3-pyexpect_1.0.22.bb         |  2 +
 .../python/python3-pyiface_git.bb             |  6 ++
 .../python/python3-pyjks_20.0.0.bb            | 12 ++--
 .../python/python3-pyjwt_2.7.0.bb             |  5 +-
 .../python/python3-pykwalify_1.8.0.bb         |  7 ++-
 .../python/python3-pylyrics_1.1.0.bb          |  8 ++-
 .../0002-Fixed-relative-imports.patch         | 60 +++++++++++++++++++
 .../python/python3-pynetlinux_1.1.bb          | 11 +++-
 .../python/python3-pypng_0.20220715.0.bb      |  8 +++
 .../python/python3-pyproj_3.5.0.bb            |  8 ++-
 .../python3-pyproject-metadata_0.7.1.bb       |  6 ++
 .../python/python3-pyrad_2.4.bb               |  8 +++
 .../python/python3-pyroute2_0.5.19.bb         | 33 +++++-----
 .../python/python3-pytest-mock_3.10.0.bb      |  6 ++
 .../python/python3-python-vlc_3.0.18122.bb    |  5 ++
 .../python/python3-pyusb_1.2.1.bb             |  2 +-
 .../python/python3-qrcode_7.4.2.bb            |  7 ++-
 .../python/python3-raven_6.10.0.bb            |  5 ++
 .../python/python3-redis_4.5.5.bb             | 12 ++--
 .../python/python3-sdnotify_0.3.2.bb          |  2 +
 .../python/python3-service-identity_21.1.0.bb |  6 ++
 .../python3-setuptools-scm-git-archive_1.1.bb |  1 +
 .../python/python3-sqlalchemy_2.0.15.bb       | 18 +++---
 .../python/python3-sqlsoup_0.9.1.bb           |  2 +
 .../python/python3-stack-data_0.6.2.bb        |  8 ++-
 .../python/python3-sympy_1.12.bb              |  5 +-
 .../python/python3-tomlkit_0.11.8.bb          |  6 ++
 .../python/python3-tornado_6.3.bb             | 22 +++++--
 .../python/python3-trustme_0.9.0.bb           |  7 +++
 .../python/python3-twofish_0.3.0.bb           |  2 +
 .../python/python3-typeguard_4.0.0.bb         |  5 ++
 .../python/python3-tzlocal_5.0.1.bb           |  7 ++-
 .../python/python3-uefi-firmware_1.10.bb      |  5 ++
 .../python/python3-uswid_git.bb               |  6 ++
 .../python/python3-versiontools_1.9.1.bb      |  2 +
 .../python/python3-web3_6.3.0.bb              |  2 +
 .../python/python3-websockets_11.0.3.bb       |  5 +-
 .../python/python3-xlrd_2.0.1.bb              | 10 +++-
 .../python/python3-xmlrunner_1.7.7.bb         |  2 +
 .../python3-attrdict3_2.0.2.bb                |  2 +
 .../python-cson/python3-cson_git.bb           |  3 +-
 .../python3-pyparted_3.12.0.bb                |  5 +-
 .../pywbem/python3-pywbem_1.6.1.bb            | 38 ++++++------
 .../send2trash/python3-send2trash_1.8.0.bb    |  2 +
 .../python/python3-ldap_3.4.3.bb              |  9 +--
 112 files changed, 649 insertions(+), 201 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-classes_0.4.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lazy_1.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pypng_0.20220715.0.bb

-- 
2.39.2


