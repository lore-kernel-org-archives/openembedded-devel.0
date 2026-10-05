Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736C1CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 20:35:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30121.1791232518178233170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2026 13:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=U9xHwAcu;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B473153B
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Oct 2026 13:35:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FBF13F66F
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Oct 2026 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791232517; bh=kq2Z309OitWyUAC5j/nrNoYLmp3T6/fTQMkZxUuMX9w=;
	h=From:To:Subject:Date:From;
	b=U9xHwAcuglyZA17GXlFHq9p2eMU44lPfSKTF+SvkjXEgHnxbXc9Eiw9XMaRixhYQ0
	 Uwd2XsrQnKsDMRIE8db+zKTBTEbc4UbjS0swQSkEH6eTFOaDY2HmohRVtUVBCnE1XK
	 Cly0cG2r8wPz33OFlNlpc+H8NIiGTkdNj+lybNG4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] recipes: update for PYPI_PACKAGE change
Date: Mon,  5 Oct 2026 21:35:12 +0100
Message-ID: <20261005203512.1729866-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 20:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130628

The pypi class has slightly changed the semantics of the PYPI_PACKAGE
variable[1], now PYPI_PACKAGE is the normalised package name and the new
variable PYPI_PACKAGE_SDIST is used when the source tarball doesn't match=
.

Update recipes as appropriate: this is mostly deleting now-redundant
assignments but some assignments are still needed where packages are not
uploaded using the modern standards.

[1] oe-core 98049bf86b6 ("classes/pypi: change PYPI_PACKAGE to be normali=
sed")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb               | 2 --
 .../recipes-utils/python3-rtslib-fb/python3-rtslib-fb_2.2.4.bb | 2 --
 .../recipes-devtools/python/python3-pillow-heif_1.8.0.bb       | 2 --
 meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb      | 1 +
 meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb  | 2 +-
 meta-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb          | 2 --
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb     | 2 +-
 .../recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb  | 1 +
 meta-python/recipes-devtools/python/python3-absl_2.1.0.bb      | 1 +
 .../recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb      | 2 ++
 .../recipes-devtools/python/python3-annotated-doc_0.0.5.bb     | 2 --
 .../recipes-devtools/python/python3-annotated-types_0.8.0.bb   | 1 -
 .../recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb   | 1 +
 .../recipes-devtools/python/python3-apply-defaults_0.1.6.bb    | 2 --
 meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb  | 2 +-
 .../recipes-devtools/python/python3-async-timeout_4.0.3.bb     | 2 ++
 .../recipes-devtools/python/python3-asyncio-glib_0.1.bb        | 2 ++
 .../recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb  | 2 ++
 .../recipes-devtools/python/python3-cached-property_2.0.1.bb   | 2 --
 meta-python/recipes-devtools/python/python3-can_4.6.1.bb       | 2 +-
 .../recipes-devtools/python/python3-cassandra-driver_3.29.3.bb | 2 --
 .../recipes-devtools/python/python3-changelog-chug_0.0.3.bb    | 2 --
 .../python/python3-charset-normalizer_3.5.1.bb                 | 2 --
 .../recipes-devtools/python/python3-checksec-py_0.7.5.bb       | 1 -
 .../recipes-devtools/python/python3-click-repl_0.3.0.bb        | 2 ++
 .../recipes-devtools/python/python3-click-spinner_0.1.10.bb    | 2 ++
 .../recipes-devtools/python/python3-configshell-fb_2.0.3.bb    | 2 --
 .../python/python3-cucumber-expressions_20.1.0.bb              | 2 --
 .../python/python3-cucumber-tag-expressions_9.1.0.bb           | 2 --
 .../recipes-devtools/python/python3-custom-inherit_2.4.1.bb    | 2 --
 .../python/python3-cyclonedx-python-lib_11.12.0.bb             | 2 --
 meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb  | 2 ++
 .../recipes-devtools/python/python3-dbus-deviation_0.6.1.bb    | 2 ++
 meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb | 2 --
 meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb | 2 --
 meta-python/recipes-devtools/python/python3-decouple_3.8.bb    | 1 +
 .../recipes-devtools/python/python3-dirty-equals_0.11.bb       | 2 --
 meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb | 2 +-
 .../recipes-devtools/python/python3-django-south_1.0.2.bb      | 3 ++-
 .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb  | 2 --
 meta-python/recipes-devtools/python/python3-editor_1.0.4.bb    | 1 +
 .../recipes-devtools/python/python3-email-validator_2.3.0.bb   | 2 --
 meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb | 2 +-
 .../recipes-devtools/python/python3-et-xmlfile_2.0.0.bb        | 2 --
 meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb   | 2 --
 .../recipes-devtools/python/python3-eth-account_0.13.7.bb      | 1 -
 meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.bb  | 2 --
 .../recipes-devtools/python/python3-eth-keyfile_0.8.0.bb       | 2 ++
 meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb   | 2 ++
 .../recipes-devtools/python/python3-eth-typing_6.0.0.bb        | 2 --
 meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb | 2 --
 .../recipes-devtools/python/python3-fastapi-cli_0.0.27.bb      | 2 --
 .../recipes-devtools/python/python3-file-magic_0.4.1.bb        | 2 ++
 .../recipes-devtools/python/python3-flask-babel_4.0.0.bb       | 2 --
 .../recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb | 2 +-
 .../recipes-devtools/python/python3-flask-cors_6.0.2.bb        | 2 --
 .../recipes-devtools/python/python3-flask-httpauth_4.8.1.bb    | 2 --
 .../recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb    | 2 +-
 .../python/python3-flask-jwt-extended_4.7.4.bb                 | 2 --
 meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb | 2 +-
 .../recipes-devtools/python/python3-flask-limiter_4.1.1.bb     | 2 --
 .../recipes-devtools/python/python3-flask-login_0.6.3.bb       | 2 +-
 .../recipes-devtools/python/python3-flask-mail_0.10.0.bb       | 2 --
 .../recipes-devtools/python/python3-flask-marshmallow_1.5.0.bb | 2 --
 .../recipes-devtools/python/python3-flask-migrate_4.1.0.bb     | 2 --
 meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb   | 3 ++-
 .../recipes-devtools/python/python3-flask-pymongo_3.0.1.bb     | 2 --
 .../recipes-devtools/python/python3-flask-restful_0.3.10.bb    | 2 +-
 .../recipes-devtools/python/python3-flask-restx_1.3.2.bb       | 2 ++
 .../recipes-devtools/python/python3-flask-sijax_0.4.1.bb       | 2 +-
 .../recipes-devtools/python/python3-flask-socketio_5.6.1.bb    | 2 --
 .../recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb  | 2 --
 .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb     | 2 +-
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb       | 2 +-
 .../python/python3-flask-versioned_0.9.4-20101221.bb           | 2 +-
 meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb | 2 --
 .../recipes-devtools/python/python3-flask-xstatic_0.0.1.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb    | 1 -
 meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb     | 3 ++-
 .../recipes-devtools/python/python3-google-api-core_2.19.1.bb  | 2 ++
 .../python/python3-google-api-python-client_2.136.0.bb         | 2 ++
 .../python/python3-google-auth-oauthlib_1.4.1.bb               | 1 -
 .../recipes-devtools/python/python3-google-auth_2.57.0.bb      | 2 --
 .../python/python3-googleapis-common-protos_1.63.2.bb          | 2 ++
 meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb  | 3 +--
 .../recipes-devtools/python/python3-grpcio-channelz_1.76.0.bb  | 1 -
 .../python/python3-grpcio-reflection_1.76.0.bb                 | 1 -
 .../recipes-devtools/python/python3-grpcio-tools_1.76.0.bb     | 2 --
 .../python/python3-hatch-requirements-txt_0.4.1.bb             | 2 --
 meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb  | 3 ++-
 .../python/python3-importlib-metadata_9.0.1.bb                 | 2 --
 .../recipes-devtools/python/python3-inline-snapshot_0.35.4.bb  | 2 --
 .../recipes-devtools/python/python3-intervals_1.10.0.bb        | 1 +
 meta-python/recipes-devtools/python/python3-ipy_1.01.bb        | 2 +-
 .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb  | 2 --
 .../recipes-devtools/python/python3-jalali-core_1.0.0.bb       | 2 --
 .../recipes-devtools/python/python3-javaobj-py3_0.4.4.bb       | 2 ++
 .../recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb       | 2 ++
 .../python/python3-jsonschema-default_1.8.1.bb                 | 2 --
 .../python/python3-keras-applications_1.0.8.bb                 | 1 -
 .../python/python3-keras-preprocessing_1.1.2.bb                | 3 +--
 .../python/python3-lazy-object-proxy_1.12.0.bb                 | 2 --
 .../recipes-devtools/python/python3-legacy-cgi_2.6.4.bb        | 2 --
 meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb | 1 +
 .../recipes-devtools/python/python3-luma-oled_3.15.0.bb        | 2 --
 .../recipes-devtools/python/python3-markdown-it-py_4.2.0.bb    | 1 -
 .../recipes-devtools/python/python3-matplotlib-inline_0.2.2.bb | 2 --
 .../recipes-devtools/python/python3-mdit-py-plugins_0.6.1.bb   | 2 --
 .../recipes-devtools/python/python3-mypy-extensions_1.1.0.bb   | 2 --
 .../recipes-devtools/python/python3-myst-parser_5.1.0.bb       | 2 --
 .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb      | 2 --
 meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb      | 1 +
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb       | 2 ++
 .../python/python3-packageurl-python_0.17.6.bb                 | 2 --
 meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb | 2 --
 .../recipes-devtools/python/python3-parse-type_0.6.6.bb        | 2 --
 .../recipes-devtools/python/python3-pastedeploy_3.1.0.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb | 2 +-
 meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb    | 1 +
 meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb | 2 --
 .../recipes-devtools/python/python3-pre-commit_4.6.2.bb        | 2 --
 .../recipes-devtools/python/python3-precise-runner_0.3.1.bb    | 2 ++
 .../recipes-devtools/python/python3-process-tests_3.0.0.bb     | 2 ++
 .../recipes-devtools/python/python3-prompt-toolkit_3.0.53.bb   | 2 --
 meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.bb | 2 --
 .../recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb        | 2 ++
 .../recipes-devtools/python/python3-py-serializable_2.1.0.bb   | 2 --
 .../recipes-devtools/python/python3-py-ubjson_0.16.1.bb        | 2 ++
 .../recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb    | 3 ---
 meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-pybluez_0.23.bb    | 2 +-
 .../recipes-devtools/python/python3-pydantic-core_2.46.5.bb    | 2 --
 meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb  | 2 +-
 .../recipes-devtools/python/python3-pyproject-api_1.11.0.bb    | 2 --
 .../recipes-devtools/python/python3-pyserial-asyncio_0.6.bb    | 2 ++
 .../recipes-devtools/python/python3-pytest-aiohttp_1.1.1.bb    | 2 --
 .../recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb    | 2 --
 .../recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb  | 2 ++
 .../recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb   | 2 --
 .../recipes-devtools/python/python3-pytest-cov_7.1.0.bb        | 2 --
 .../recipes-devtools/python/python3-pytest-env_1.7.0.bb        | 2 --
 .../recipes-devtools/python/python3-pytest-examples_0.0.18.bb  | 2 --
 .../recipes-devtools/python/python3-pytest-forked_1.6.0.bb     | 2 ++
 .../recipes-devtools/python/python3-pytest-freezer_0.4.9.bb    | 2 --
 .../python/python3-pytest-helpers-namespace_2021.12.29.bb      | 2 ++
 .../recipes-devtools/python/python3-pytest-html_4.2.0.bb       | 2 --
 .../recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb | 2 --
 .../recipes-devtools/python/python3-pytest-httpx_0.36.2.bb     | 2 --
 .../python/python3-pytest-json-report_1.5.0.bb                 | 3 ++-
 .../python/python3-pytest-lazy-fixtures_1.1.4.bb               | 2 --
 .../python/python3-pytest-localserver_0.8.1.bb                 | 2 ++
 .../recipes-devtools/python/python3-pytest-metadata_3.1.1.bb   | 2 --
 .../recipes-devtools/python/python3-pytest-mock_3.15.1.bb      | 2 --
 .../recipes-devtools/python/python3-pytest-picked_0.5.1.bb     | 2 --
 .../recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb    | 2 ++
 .../recipes-devtools/python/python3-pytest-runner_6.0.1.bb     | 2 ++
 .../recipes-devtools/python/python3-pytest-socket_0.7.0.bb     | 2 --
 .../recipes-devtools/python/python3-pytest-sugar_1.1.1.bb      | 2 ++
 .../python/python3-pytest-tempdir_2019.10.12.bb                | 2 ++
 .../recipes-devtools/python/python3-pytest-timeout_2.5.0.bb    | 2 --
 .../recipes-devtools/python/python3-pytest-unordered_0.8.0.bb  | 2 --
 .../recipes-devtools/python/python3-pytest-xdist_3.8.0.bb      | 2 --
 .../recipes-devtools/python/python3-python-dotenv_1.2.1.bb     | 2 --
 .../recipes-devtools/python/python3-python-multipart_0.0.32.bb | 2 --
 .../recipes-devtools/python/python3-python-vlc_3.0.21203.bb    | 2 --
 .../python/python3-python-xmp-toolkit_2.1.0.bb                 | 2 --
 meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb  | 1 +
 .../recipes-devtools/python/python3-requests-file_3.0.1.bb     | 3 ---
 .../recipes-devtools/python/python3-requests-ftp_0.3.1.bb      | 1 +
 .../recipes-devtools/python/python3-requests-futures_1.0.2.bb  | 3 ---
 .../recipes-devtools/python/python3-requests-mock_1.12.1.bb    | 2 ++
 .../recipes-devtools/python/python3-requests-oauthlib_2.0.0.bb | 2 ++
 .../recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb | 2 ++
 .../python/python3-requests-unixsocket_0.4.1.bb                | 2 --
 .../recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb | 2 --
 .../recipes-devtools/python/python3-rich-argparse_1.8.0.bb     | 2 --
 .../recipes-devtools/python/python3-rich-toolkit_0.20.3.bb     | 2 --
 .../python/python3-robotframework-seriallibrary_0.4.3.bb       | 3 ++-
 .../recipes-devtools/python/python3-scikit-build-core_1.0.3.bb | 2 --
 .../recipes-devtools/python/python3-scikit-build_0.19.1.bb     | 2 --
 .../recipes-devtools/python/python3-sentry-sdk_2.64.0.bb       | 2 --
 .../recipes-devtools/python/python3-service-identity_26.1.0.bb | 2 --
 .../python3-setuptools-declarative-requirements_1.3.0.bb       | 2 ++
 .../python/python3-setuptools-git-versioning_3.1.0.bb          | 2 --
 meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb    | 1 +
 meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb | 2 +-
 .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb     | 2 ++
 .../recipes-devtools/python/python3-stack-data_0.6.3.bb        | 2 --
 meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-systemd_235.bb     | 3 ++-
 .../recipes-devtools/python/python3-time-machine_3.2.0.bb      | 2 --
 .../recipes-devtools/python/python3-tokenize-rt_6.2.0.bb       | 2 --
 .../recipes-devtools/python/python3-trafaret-config_2.0.2.bb   | 2 ++
 .../python/python3-types-psutil_7.2.2.20260518.bb              | 2 --
 .../python/python3-types-python-dateutil_2.9.0.20241003.bb     | 2 ++
 .../python/python3-types-setuptools_75.5.0.20241120.bb         | 2 ++
 .../recipes-devtools/python/python3-typing-inspection_0.4.4.bb | 2 --
 .../recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb    | 1 +
 meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb | 2 +-
 .../python/python3-uv-dynamic-versioning_0.14.1.bb             | 2 --
 .../recipes-devtools/python/python3-websocket-client_1.9.2.bb  | 2 --
 .../recipes-devtools/python/python3-wheezy-template_3.2.5.bb   | 2 --
 .../recipes-devtools/python/python3-wpa-supplicant_0.2.bb      | 2 --
 .../recipes-devtools/python/python3-xlsxwriter_3.2.1.bb        | 2 +-
 .../python/python3-xstatic-font-awesome_6.2.1.2.bb             | 2 --
 meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb   | 1 +
 .../recipes-devtools/python/python3-zopeinterface_8.6.bb       | 2 +-
 .../python3-mlcommons-loadgen_6.0.17.bb                        | 2 --
 .../python3-rouge-score/python3-rouge-score_0.1.2.bb           | 2 --
 .../python3-gpt-image/python3-gpt-image_0.9.1.bb               | 2 --
 meta-python/recipes-networking/python/python3-ldap_3.4.8.bb    | 2 +-
 218 files changed, 147 insertions(+), 277 deletions(-)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/=
gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb b/meta-filesystems/dynamic-l=
ayers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_1.0=
.2.bb
index 57f4a7cb8fc..143e310247e 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-s=
ysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-s=
ysfs-proxy/gpiod-sysfs-proxy_1.0.2.bb
@@ -7,8 +7,6 @@ inherit systemd update-rc.d ptest pypi python_pep517 pyth=
on_setuptools_build_met
=20
 DEPENDS +=3D "python3-wheel-native"
=20
-PYPI_PACKAGE =3D "gpiod_sysfs_proxy"
-
 SRC_URI +=3D " \
     file://gpiod-sysfs-proxy.init.in \
     file://run-ptest.in \
diff --git a/meta-filesystems/recipes-utils/python3-rtslib-fb/python3-rts=
lib-fb_2.2.4.bb b/meta-filesystems/recipes-utils/python3-rtslib-fb/python=
3-rtslib-fb_2.2.4.bb
index b9e98ec2e82..3f637ef4638 100644
--- a/meta-filesystems/recipes-utils/python3-rtslib-fb/python3-rtslib-fb_=
2.2.4.bb
+++ b/meta-filesystems/recipes-utils/python3-rtslib-fb/python3-rtslib-fb_=
2.2.4.bb
@@ -5,8 +5,6 @@ DEPENDS =3D "python3-hatchling-native python3-hatch-vcs-n=
ative"
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "rtslib_fb"
-
 SRC_URI[sha256sum] =3D "0084daa651a72b1cacd0eaaf162725df69b991f501cffe87=
e0f67e99224a7267"
=20
 RDEPENDS:${PN} =3D "python3-pyudev"
diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_=
1.8.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.=
8.0.bb
index 0a83129d1d9..8dba299cb64 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.b=
b
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.b=
b
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db6c07a92ae=
d67c33bc346748d7c7e991"
 # While this item does not require it, it depends on libheif which does
 LICENSE_FLAGS =3D "commercial"
=20
-PYPI_PACKAGE =3D "pillow_heif"
-
 inherit pypi python_setuptools_build_meta
=20
 SRC_URI +=3D "file://0001-setup.py-support-cross-compiling.patch"
diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/=
meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
index f5e2cc4da1f..f8dfa7c926f 100644
--- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
@@ -6,6 +6,7 @@ LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 PYPI_PACKAGE =3D "python-gammu"
+PYPI_PACKAGE_SDIST =3D "python-gammu"
=20
 inherit pypi setuptools3 pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.b=
b b/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb
index 01ffa25ac6f..45950a4f77d 100644
--- a/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb
+++ b/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df0e423eea5=
c91e7aa21bdb70184b3e53"
=20
 SRC_URI[sha256sum] =3D "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f0=
744a96d4bd4cef4a"
=20
-PYPI_PACKAGE =3D "APScheduler"
+PYPI_PACKAGE_SDIST =3D "APScheduler"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb b/meta=
-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb
index de0642a93a8..1f2cc4b5e2d 100644
--- a/meta-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb
+++ b/meta-oe/recipes-security/ssh-audit/ssh-audit_3.9.0.bb
@@ -6,6 +6,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2638d424730ffe=
ce235019c6a623c6fa"
=20
 SRC_URI[sha256sum] =3D "f1225d0364b3cb61c7dfb1f5065a6958dbb814d98b2c1dd2=
a779ba2cdef41f61"
=20
-PYPI_PACKAGE =3D "ssh_audit"
-
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.=
9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.=
bb
index 11ce8610fd0..020f167dc36 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} +=3D " \
=20
 inherit setuptools3 pypi
=20
-PYPI_PACKAGE =3D "txWS"
+PYPI_PACKAGE_SDIST =3D "txWS"
=20
 SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "cb93086095d04a5d70f53a75053f7df478ff37e972c3637f=
b55ca4a9e6b94679"
diff --git a/meta-python/recipes-connectivity/python3-pytun/python3-pytun=
_2.4.1.bb b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_=
2.4.1.bb
index 08ec2cf670a..e7e1663b1f0 100644
--- a/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.=
bb
+++ b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.=
bb
@@ -5,5 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D13f7629e8e4989=
b66b4a913ab05a91de"
 SRC_URI[sha256sum] =3D "20b53ea7a09dfe173c00ec0a00eea508b05e959f5dc4b4bb=
698aa52252192f8f"
=20
 PYPI_PACKAGE =3D "python-pytun"
+PYPI_PACKAGE_SDIST =3D "python-pytun"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb b/=
meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
index 5bdb83175d1..96bd8d37fcf 100644
--- a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
 SRC_URI[sha256sum] =3D "7820790efbb316739cde8b4e19357243fc3608a152024288=
513dd968d7d959ff"
=20
 PYPI_PACKAGE =3D "absl-py"
+PYPI_PACKAGE_SDIST =3D "absl-py"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1=
.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
index df4a0adcafa..b91ba604099 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "a3a7ff5264e5bca52e8ae547bbfd0761b=
72495230d438d05b6c0915be6
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "aiohttp-jinja2"
+
 RDEPENDS:${PN} +=3D " \
     python3-jinja2 \
     python3-aiohttp \
diff --git a/meta-python/recipes-devtools/python/python3-annotated-doc_0.=
0.5.bb b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.=
bb
index 1f9164323fc..da5fe0944a2 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
@@ -7,6 +7,4 @@ SRC_URI[sha256sum] =3D "c7e58ce09192557605d8bbd92836d7e1d=
520ac9580096042c0bfd197ef
=20
 inherit pypi python_pdm
=20
-PYPI_PACKAGE =3D "annotated_doc"
-
 RDEPENDS:${PN} +=3D "python3-compression"
diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_=
0.8.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.=
8.0.bb
index 28941262b16..cf71e67632f 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.b=
b
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc6afb13fdc2204=
97ee5cded1e717ed67"
 SRC_URI[sha256sum] =3D "13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a5=
61055cac8f64cab7"
=20
 S =3D "${UNPACKDIR}/annotated_types-${PV}"
-PYPI_PACKAGE =3D "annotated_types"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4=
.13.1.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.1=
3.1.bb
index 431d37c7d78..068be92ddd7 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.b=
b
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.b=
b
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D4b18e4a9f9317=
8eaa50a9a37f26da7f7"
 SRC_URI[sha256sum] =3D "3cd282f5ea7cfb841537fe01f143350fdb1c0b1ce7981443=
a2fa8513fddb6d1a"
=20
 PYPI_PACKAGE =3D "antlr4-python3-runtime"
+PYPI_PACKAGE_SDIST =3D "antlr4-python3-runtime"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-apply-defaults_0=
.1.6.bb b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.=
6.bb
index 6bf61cfcd3c..d17ee3153e2 100644
--- a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.6.bb
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://github.com/bcb/apply_defaults"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc89120516900f96f4c60d35fdc4c3=
f15"
=20
-PYPI_PACKAGE =3D "apply_defaults"
-
 SRC_URI[sha256sum] =3D "3773de3491b94c0fe44310f1a85888389cdc71e1544b343b=
ce0d2bd6991acea5"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.b=
b b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
index 906fbfdc0b2..d2240f95fb3 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D33b8d1ba459a2f=
a4d801acfd1d1b7ceb"
=20
 SRC_URI[sha256sum] =3D "9e85ad35cfc6c938676817c7ae9a1000a7c72a34c71db0c6=
87136c460d12b85e"
=20
-PYPI_PACKAGE =3D "Arpeggio"
+PYPI_PACKAGE_SDIST =3D "Arpeggio"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.=
0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.=
bb
index 2c05f25956a..33a8bc78966 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] =3D "4640d96be84d82d02ed59ea2b7105a0=
f7b33abe8703703cd0ab0bf87c4
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "async-timeout"
+
 DEPENDS +=3D "python3-wheel-native"
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1=
.bb b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
index d73e83de54d..db0c5567445 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D4fbd65380=
cdd255951079008b364516c"
=20
 inherit setuptools3 pypi features_check
=20
+PYPI_PACKAGE_SDIST =3D "asyncio-glib"
+
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 SRC_URI[sha256sum] =3D "fe3ceb2ba5f541330c07ca1bd7ae792468d625bad1acf535=
4a3a7a0b9fd87521"
diff --git a/meta-python/recipes-devtools/python/python3-asyncio-throttle=
_1.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncio-throttle_=
1.0.2.bb
index 040e70940b4..dcda99c0be9 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.=
bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.=
bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] =3D "2675282e99d9129ecc446f917e174bc20=
5c65e36c602aa18603b494856
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "asyncio-throttle"
+
 RDEPENDS:${PN} +=3D "python3-asyncio"
diff --git a/meta-python/recipes-devtools/python/python3-cached-property_=
2.0.1.bb b/meta-python/recipes-devtools/python/python3-cached-property_2.=
0.1.bb
index e1ead95cf1e..6a632a704fa 100644
--- a/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.b=
b
+++ b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.b=
b
@@ -5,8 +5,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb7ff60c4e14f58534201242803d8=
abc"
=20
-PYPI_PACKAGE =3D "cached_property"
-
 SRC_URI[sha256sum] =3D "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222db=
d51cd91230897641"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb b/m=
eta-python/recipes-devtools/python/python3-can_4.6.1.bb
index 4f7a8e9b0a5..a45b3968c09 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De6a600fd5e=
1d9cbde2d983680233ad02"
=20
 SRC_URI[sha256sum] =3D "290fea135d04b8504ebff33889cc6d301e2181a540991166=
09f940825ffe5005"
=20
-PYPI_PACKAGE =3D "python_can"
+PYPI_PACKAGE =3D "python-can"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver=
_3.29.3.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver=
_3.29.3.bb
index c4768836d3f..5c15769e746 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3=
.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3=
.bb
@@ -11,8 +11,6 @@ SRCNAME =3D "cassandra-driver"
 SRC_URI +=3D "file://0001-skip-verifying-the-availability-of-setuptools.=
patch"
 SRC_URI[sha256sum] =3D "ff6b82ee4533f6fd4474d833e693b44b984f58337173ee98=
ed76bce08721a636"
=20
-PYPI_PACKAGE =3D "cassandra_driver"
-
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-changelog-chug_0=
.0.3.bb b/meta-python/recipes-devtools/python/python3-changelog-chug_0.0.=
3.bb
index a34cbebe91e..43e04888f63 100644
--- a/meta-python/recipes-devtools/python/python3-changelog-chug_0.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-changelog-chug_0.0.3.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "98ee1e8be75b6e9d512c35292c3c293a1=
24541a4ec2014a6ec3cf33a3d
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "changelog_chug"
-
 DEPENDS +=3D " \
     python3-semver-native \
     python3-docutils-native \
diff --git a/meta-python/recipes-devtools/python/python3-charset-normaliz=
er_3.5.1.bb b/meta-python/recipes-devtools/python/python3-charset-normali=
zer_3.5.1.bb
index c4403290659..3b56ad38604 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.=
1.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.=
1.bb
@@ -10,8 +10,6 @@ DEPENDS +=3D "python3-setuptools-scm-native python3-myp=
y-native"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
-PYPI_PACKAGE =3D "charset_normalizer"
-
 RDEPENDS:${PN} +=3D " \
 	python3-core \
 	python3-logging \
diff --git a/meta-python/recipes-devtools/python/python3-checksec-py_0.7.=
5.bb b/meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb
index 8d8e54e2274..eabaa4bbdc2 100644
--- a/meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
 PR =3D "r0"
=20
 inherit pypi python_poetry_core
-PYPI_PACKAGE =3D "checksec_py"
 SRC_URI[sha256sum] =3D "892854f95d17a76d8f45a5c0cc597b9f1bebced3fffb9c72=
05d0baaf5eace886"
=20
 SRC_URI +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0=
.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
index b0844ed5a29..cb5827fc303 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "17849c23dba3d667247dc4defe1757fff=
98694e90fe37474f3feebb69c
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "click-repl"
+
 DEPENDS +=3D "python3-wheel-native"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.=
1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.1=
0.bb
index 7f19cc34587..89c89ed8fd4 100644
--- a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] =3D "87eacf9d7298973a25d7615ef57d4782a=
ebf913a532bba4b28a37e366e
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "click-spinner"
+
 RDEPENDS:${PN} +=3D "python3-json"
diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_2=
.0.3.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_2.0.=
3.bb
index 48751575c5e..f963446caa4 100644
--- a/meta-python/recipes-devtools/python/python3-configshell-fb_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_2.0.3.bb
@@ -5,8 +5,6 @@ building simple but nice CLI-based applications."
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34400b68072d710fecd0a2940a0d1=
658"
=20
-PYPI_PACKAGE =3D "configshell_fb"
-
 SRC_URI[sha256sum] =3D "dbb086c16c1603a230f9017ef85baccabfd5d87439a01e96=
3377e50f10220f53"
=20
 inherit pypi python_hatchling
diff --git a/meta-python/recipes-devtools/python/python3-cucumber-express=
ions_20.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-exp=
ressions_20.1.0.bb
index ffce52f03bd..c685d7d0ad0 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-expressions_20=
.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-expressions_20=
.1.0.bb
@@ -8,8 +8,6 @@ SRC_URI[sha256sum] =3D "0d216ec26e36c71b3e5643f2e72c41f9b=
266ef04eaa0c7e47a6e3b2caf
=20
 inherit pypi python_uv_build
=20
-PYPI_PACKAGE =3D "cucumber_expressions"
-
 RDEPENDS:${PN} +=3D " \
     python3-core \
     python3-numbers \
diff --git a/meta-python/recipes-devtools/python/python3-cucumber-tag-exp=
ressions_9.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-=
tag-expressions_9.1.0.bb
index fea5a6d6b10..1efe5f4d705 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-tag-expression=
s_9.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-tag-expression=
s_9.1.0.bb
@@ -8,5 +8,3 @@ SRC_URI +=3D "file://0001-pyprojects-Relax-required-versi=
on-of-uv-to-be-0.12.patch
 SRC_URI[sha256sum] =3D "d960383d5885300ebcbcb14e41657946fde2a59d5c0f485e=
b291bc6a0e228acc"
=20
 inherit pypi python_uv_build
-
-PYPI_PACKAGE =3D "cucumber_tag_expressions"
diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2=
.4.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.=
1.bb
index e7409f77e69..f4033ed0fb9 100644
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://github.com/rsokl/custom_inherit"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Df910a85a4c3da51edf780f17a7=
608434"
=20
-PYPI_PACKAGE =3D "custom_inherit"
-
 SRC_URI +=3D "file://0001-versioneer.py-do-not-use-SafeConfigParser.patc=
h"
 SRC_URI[sha256sum] =3D "7052eb337bcce83551815264391cc4efc2bf70b295a3c52a=
ba64f1ab57c3a8a2"
=20
diff --git a/meta-python/recipes-devtools/python/python3-cyclonedx-python=
-lib_11.12.0.bb b/meta-python/recipes-devtools/python/python3-cyclonedx-p=
ython-lib_11.12.0.bb
index f7a6706e7c6..f11f9ab0266 100644
--- a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11=
.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11=
.12.0.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "16767c4039de90c04e9f03348f8f0ed4b=
8ff842eaa7eefcad3a95685f9
=20
 inherit pypi python_poetry_core
=20
-PYPI_PACKAGE =3D "cyclonedx_python_lib"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb =
b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
index 761c746a245..ab4a1ab9d42 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
@@ -17,4 +17,4 @@ DEPENDS +=3D "python3-wheel-native"
=20
 SRC_URI[sha256sum] =3D "f7b04335adc473de877f5117e26d5f1142f4c9f7cd765408=
f0877757be5afbf4"
=20
-PYPI_PACKAGE =3D "python_daemon"
+PYPI_PACKAGE =3D "python-daemon"
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.b=
b b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index dd3f55edf9a..3b9460c843b 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -8,6 +8,8 @@ SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "78e73e19c63f5b20ffa567001531680d939dc042bf785043=
1877645523c66709"
=20
 PYPI_PACKAGE =3D "python-dateutil"
+PYPI_PACKAGE_SDIST =3D "python-dateutil"
+
 inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-dbus-deviation_0=
.6.1.bb b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.=
1.bb
index e969e854652..1bb351c570e 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "e06b88efe223885d2725df51cf7c9b7b4=
63d1c6f04ea49d4690874318d
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "dbus-deviation"
+
 SRC_URI +=3D "file://0001-Prevent-trying-to-donwload-requierment-which-w=
ill-ca.patch"
=20
 DEPENDS +=3D "python3-sphinx-native"
diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.=
bb b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
index c0c40b6b23a..2f4d43e1121 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D729e372b5ea016=
8438e4fd4a00a04947"
 SRC_URI +=3D "file://0001-pyproject.toml-Remove-upper-version-constraint=
-for-C.patch"
 SRC_URI[sha256sum] =3D "e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df9=
58cee24bef86b8fe"
=20
-PYPI_PACKAGE =3D "dbus_fast"
-
 inherit pypi python_poetry_core cython
=20
 DEPENDS +=3D "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.=
bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
index 9f6aa7ed7ff..e2cc1542946 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94e750c96e5678=
8499b56c81de91431c"
=20
 SRC_URI[sha256sum] =3D "f4eae26909332ada528c0a3549dda8d4f088f9b365153952=
a408e28023a626a5"
=20
-PYPI_PACKAGE =3D "dbus_next"
-
 inherit pypi setuptools3
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-decouple_3.8.bb =
b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
index 20d614a4232..e15b0e0c0c8 100644
--- a/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da46375b26bb7d7=
603565d829a2a51782"
 SRC_URI[sha256sum] =3D "ba6e2657d4f376ecc46f77a3a615e058d93ba5e465c01bbe=
57289bfb7cce680f"
=20
 PYPI_PACKAGE =3D "python-decouple"
+PYPI_PACKAGE_SDIST =3D "python-decouple"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.1=
1.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
index daf8567f071..3add260a218 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.11.bb
@@ -16,8 +16,6 @@ S =3D "${UNPACKDIR}/dirty_equals-${PV}"
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "dirty_equals"
-
 RDEPENDS:${PN} +=3D " \
     python3-pytz \
     python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.6.1.=
bb b/meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
index 8438e31f05d..3af83eed779 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/tox-dev/python-discovery=
"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11610a9d8fd95649cf8159be12b98=
cb7"
=20
-PYPI_PACKAGE =3D "python_discovery"
+PYPI_PACKAGE =3D "python-discovery"
=20
 SRC_URI[sha256sum] =3D "cf87d3627dfb4412437fdd5b13eae402607722998d215679=
93aedbc59b23c15e"
=20
diff --git a/meta-python/recipes-devtools/python/python3-django-south_1.0=
.2.bb b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
index 152e57f105e..528f760a241 100644
--- a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D17;endl=
ine=3D18;md5=3D2155d8ae21e7c231
=20
 SRC_URI[sha256sum] =3D "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b=
381b4fbfef7392f4"
=20
-PYPI_PACKAGE =3D "South"
+PYPI_PACKAGE =3D "south"
+PYPI_PACKAGE_SDIST =3D "South"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch=
_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_=
1.0.3.bb
index fa215314875..5259513f298 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.=
bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.=
bb
@@ -7,8 +7,6 @@ inherit pypi setuptools3
=20
 SRC_URI[sha256sum] =3D "fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb=
32b273936da89604"
=20
-PYPI_PACKAGE =3D "dynamic_dispatch"
-
 DEPENDS +=3D "python3-setuptools-scm-native"
 RDEPENDS:${PN} +=3D "\
   python3-typeguard \
diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb =
b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
index 6ec72d02aa3..99da6d9db7b 100644
--- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907=
fdace235a619d80314"
 SRC_URI[sha256sum] =3D "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349=
ec7847713882327b"
=20
 PYPI_PACKAGE =3D "python-editor"
+PYPI_PACKAGE_SDIST =3D "python-editor"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-email-validator_=
2.3.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.=
3.0.bb
index a9401ccf49c..40c727944ac 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.b=
b
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2890aee62bd2a4=
c3197e2059016a397e"
=20
 SRC_URI[sha256sum] =3D "9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20e=
b10231ba60c54426"
=20
-PYPI_PACKAGE =3D "email_validator"
-
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D "python3-dnspython python3-idna"
diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.14.0.=
bb b/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
index 25940cea6c5..cabee98d000 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D42d0a9e728978f=
0eeb759c3be91536b8"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "python_engineio"
+PYPI_PACKAGE =3D "python-engineio"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-netclient \
diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0=
.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
index 1f119c6bdfb..d1b76e7f29c 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
@@ -19,5 +19,3 @@ RDEPENDS:${PN} +=3D " \
 "
=20
 inherit setuptools3 pypi
-
-PYPI_PACKAGE =3D "et_xmlfile"
diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
index 340e69ee6bb..f945672eda7 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b6a85414b7d05=
8ab1c58e11611c21b2"
=20
 SRC_URI[sha256sum] =3D "178703fa98c07d8eecd5ae569e7e8d159e493ebb6eeb534a=
8fe973fbc4e40ef0"
=20
-PYPI_PACKAGE =3D "eth_abi"
-
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.13=
.7.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
index 00deb53c88a..4b680659db6 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da26e64020156e8=
06cf0054a6d504b301"
=20
 SRC_URI[sha256sum] =3D "5853ecbcbb22e65411176f121f5f24b8afeeaf13492359d2=
54b16d8b18c77a46"
=20
-PYPI_PACKAGE =3D "eth_account"
 CVE_PRODUCT =3D "eth-account"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.b=
b b/meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.bb
index 04a94d20bef..2047526d4ce 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.bb
@@ -16,5 +16,3 @@ PACKAGECONFIG[pysha3python-version-bigger--equals-3-dot=
-9] =3D ",,,python3-safe-py
 PACKAGECONFIG[test] =3D ",,,python3-pytest python3-pytest-xdist"
=20
 RDEPENDS:${PN} +=3D "python3-core python3-logging python3-pycryptodome"
-
-PYPI_PACKAGE =3D "eth_hash"
diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.=
0.bb b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
index 741db5ced05..41ba0321e51 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "02e3c2e564c7403b92db3fef8ecae3d21=
123b15787daecd5b643a57369
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "eth-keyfile"
+
 RDEPENDS:${PN} +=3D " \
     python3-eth-keys \
     python3-pycryptodome \
diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.b=
b b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
index aabfff1b1d0..d9014daccfa 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] =3D "a0abccb83f3d84322591a2c047a1e3aa5=
2ea86b185fa3e82ce311d120c
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "eth-keys"
+
 RDEPENDS:${PN} +=3D "python3-eth-utils"
diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb=
 b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
index 4bdc0c88733..ac70d144392 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "d5b408a8cd20ed496e8e66d0559560d29=
bc21cee482f893936a1f05d0d
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "eth-rlp"
+
 RDEPENDS:${PN} =3D " \
     python3-eth-utils \
     python3-hexbytes \
diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_6.0.0=
.bb b/meta-python/recipes-devtools/python/python3-eth-typing_6.0.0.bb
index 51d1abec7be..a5a09694ef5 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_6.0.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3ef06eb4d43732=
22e59a338e2eb9a795"
=20
 SRC_URI[sha256sum] =3D "315dd460dc0b71c15a6cd51e3c0b70d237eec8771beb8441=
44f3a1fb4adb2392"
=20
-PYPI_PACKAGE =3D "eth_typing"
-
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.=
bb b/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
index 0618814d526..b7a69be37d5 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_6.0.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd3f53e7cc5bf80=
b16eff1f4a38c73182"
=20
 SRC_URI[sha256sum] =3D "eb54b2f82dd300d3142c49a89da195e823f5e5284d432035=
93f87c67bad92a96"
=20
-PYPI_PACKAGE =3D "eth_utils"
-
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.=
27.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
index 02750e67e14..94609b2b0f0 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "1dffb1e40c0c88f2e0171a8a252a2b615=
c1e63ff8c05626649e4badd6a
=20
 inherit pypi python_pdm
=20
-PYPI_PACKAGE =3D "fastapi_cli"
-
 RDEPENDS:${PN} +=3D "\
     python3-difflib \
     python3-pydantic \
diff --git a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1=
.bb b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
index cf0296b018c..c0f992298d2 100644
--- a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D "a91d1483117f7ed48cd0238ad9be36b04=
824d57e9c38ea7523113989e8
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "file-magic"
+
 DEPENDS +=3D "python3-wheel-native"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.=
0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
index b445ec0e1cf..1348d4ccf5e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51917f3e8e858f=
5ae295a7d0e2eb3cc9"
=20
 SRC_URI[sha256sum] =3D "dbeab4027a3f4a87678a11686496e98e1492eb793cbdd77a=
b50f4e9a2602a593"
=20
-PYPI_PACKAGE =3D "flask_babel"
-
 inherit pypi python_poetry_core
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-bootstrap_=
3.3.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-bootstrap_=
3.3.7.1.bb
index e28e41c124f..0019b1bc265 100644
--- a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1=
.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1=
.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Da03749709f061=
18a17349deb5a210619"
=20
 SRC_URI[sha256sum] =3D "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72=
b5da4545ef123ac8"
=20
-PYPI_PACKAGE =3D "Flask-Bootstrap"
+PYPI_PACKAGE_SDIST =3D "Flask-Bootstrap"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2=
.bb b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
index b5a32faa6e4..89c844cff4c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
@@ -7,8 +7,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3D13=
4f1026f0de92fd30e71976590a2868"
=20
-PYPI_PACKAGE =3D "flask_cors"
-
 CVE_PRODUCT =3D "flask-cors"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-flask-httpauth_4=
.8.1.bb b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.=
1.bb
index cd54b163b93..428c39a1ae4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.1.bb
@@ -7,8 +7,6 @@ inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
=20
-PYPI_PACKAGE =3D "flask_httpauth"
-
 SRC_URI[sha256sum] =3D "88499b22f1353893743c3cd68f2ca561c4ad9ef75cd6bcc7=
f621161cd0e80744"
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1=
.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.=
0.bb
index 93ecf084537..21b3d6deb2e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://README.rst;md5=3Dbd59445a234a0c8250b39178d4=
2e3148"
=20
-PYPI_PACKAGE =3D "Flask-Jsonpify"
+PYPI_PACKAGE_SDIST =3D "Flask-Jsonpify"
=20
 SRC_URI[sha256sum] =3D "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529b=
ce943817e2fedbfb"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extend=
ed_4.7.4.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-exten=
ded_4.7.4.bb
index 5d7412f1e2f..aa59c9d7970 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.=
4.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.=
4.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9166295d7c482b=
9440bbb2b5c0fa43ac"
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "flask_jwt_extended"
-
 SRC_URI[sha256sum] =3D "78fd0f460317facf3a0084a6457ffaf2f1dda9eefbd576f9=
4cea35b0eadd5531"
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.=
bb b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
index f7044b314fb..bcc6d532ac2 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dff00db41c47ec84b4567a8b3c246a=
959"
=20
-PYPI_PACKAGE =3D "Flask-JWT"
+PYPI_PACKAGE_SDIST =3D "Flask-JWT"
=20
 SRC_URI[sha256sum] =3D "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089=
cdc5380d323bd0ad"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-limiter_4.=
1.1.bb b/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.=
bb
index 884da17052b..260f7554e5f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-limiter_4.1.1.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2455d5e574=
bc0fc489411ca45766ac78"
=20
 SRC_URI[sha256sum] =3D "ca11608fc7eec43dcea606964ca07c3bd4ec1ae89043a0f6=
7f717899a4f48106"
=20
-PYPI_PACKAGE =3D "flask_limiter"
-
 inherit pypi python_hatchling
=20
 DEPENDS +=3D "python3-hatch-vcs-native"
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.=
3.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
index df22ca112ca..a7bab22e3de 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8aa87a1cd9fa41=
d969ad32cfdac2c596"
=20
 SRC_URI[sha256sum] =3D "5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75=
947bf9c147330333"
=20
-PYPI_PACKAGE =3D "Flask-Login"
+PYPI_PACKAGE_SDIST =3D "Flask-Login"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.=
0.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
index a91a231b951..2054e0483a3 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D201f2b8011=
2efa61b78515bd54e9f138"
=20
 SRC_URI[sha256sum] =3D "44083e7b02bbcce792209c06252f8569dd5a325a7aaa76af=
e7330422bd97881d"
=20
-PYPI_PACKAGE =3D "flask_mail"
-
 inherit pypi python_flit_core
=20
 RDEPENDS:${PN} =3D " \
diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallo=
w_1.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallo=
w_1.5.0.bb
index 9739f31f6ff..d0d35944127 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.5.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.5.0=
.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D27586b20700d75=
44c06933afe56f7df4"
=20
 inherit pypi python_flit_core
=20
-PYPI_PACKAGE =3D "flask_marshmallow"
-
 SRC_URI[sha256sum] =3D "7c06b56e41647eccdb3cd57c25b109f19191b4c62509362b=
d64920cdf601a066"
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.=
1.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.=
bb
index fc64d03d38f..c555d22a858 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b69377f79f3f4=
8c661701236d5a6a85"
=20
 SRC_URI[sha256sum] =3D "1a336b06eb2c3ace005f5f2ded8641d534c18798d64061f6=
ff11f79e1434126d"
=20
-PYPI_PACKAGE =3D "flask_migrate"
-
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb=
 b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
index 16afb1d1cee..a5ec27920ea 100644
--- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -4,9 +4,10 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D2729ee82259d=
601d90d28b0574d12416"
=20
 SRC_URI[sha256sum] =3D "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf3=
6b3aca2e110a33f4"
=20
-
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "flask-nav"
+
 RDEPENDS:${PN} +=3D "\
     python3-blinker \
     python3-flask \
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_3.=
0.1.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.=
bb
index c760ee0219b..928f7587a24 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_3.0.1.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM =3D "file://flask_pymongo/wrappers.py;be=
ginline=3D1;endline=3D24;md5=3D
=20
 SRC_URI[sha256sum] =3D "d225b51c21ceca2e670e6cca79b5c584ad17b96252b48e84=
e3b423ddb73304cc"
=20
-PYPI_PACKAGE =3D "flask_pymongo"
-
 inherit pypi python_setuptools_build_meta python_hatchling
=20
 DEPENDS =3D " \
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.=
3.10.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.1=
0.bb
index 8ea455c6331..4720b65fd28 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] =3D "fe4af2ef0027df8f9b4f797aba20c55=
66801b6ade995ac63b588abf1a5
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "Flask-RESTful"
+PYPI_PACKAGE_SDIST =3D "Flask-RESTful"
=20
 RDEPENDS:${PN} =3D "python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.=
2.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
index bf0f3b374ac..a4fd7c53246 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.2.bb
@@ -8,6 +8,8 @@ CVE_PRODUCT =3D "flask-restx"
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "flask-restx"
+
 RDEPENDS:${PN} +=3D " \
     python3-aniso8601 \
     python3-jsonschema \
diff --git a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.=
1.bb b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
index d518a1877f7..c782c706c37 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D266adc7b91=
1b7c84b837bf77196e1ba6"
=20
 SRC_URI[sha256sum] =3D "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2=
427186925cdc429f"
=20
-PYPI_PACKAGE =3D "Flask-Sijax"
+PYPI_PACKAGE_SDIST =3D "Flask-Sijax"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5=
.6.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.=
1.bb
index edbe6eef085..32d8eaa517f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.1.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38cc2125490960=
4298ce763a6e4440a0"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "flask_socketio"
-
 SRC_URI[sha256sum] =3D "fe5bd995c3ed4da9a98f335d0d830fa1a19d84a64789f626=
5642a671fdacaeac"
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy=
_3.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_=
3.1.1.bb
index c300d0b3880..5cd30e0664d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.=
bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.=
bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dffeffa59c9=
0c9c4a033c7574f8f3fb75"
=20
 SRC_URI[sha256sum] =3D "e4b68bb881802dda1a7d878b2fc84c06d1ee57fb40b874d3=
dc97dabfa36b8312"
=20
-PYPI_PACKAGE =3D "flask_sqlalchemy"
-
 inherit pypi python_flit_core
=20
 RDEPENDS:${PN} =3D "python3-sqlalchemy python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.=
2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.=
bb
index a51ead3c8a2..6328f623322 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3Db712ac634b394=
69660c9bdfb8d03421c"
=20
 SRC_URI[sha256sum] =3D "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e529302=
5810cf9d841ecb02"
=20
-PYPI_PACKAGE =3D "Flask-Uploads"
+PYPI_PACKAGE_SDIST =3D "Flask-Uploads"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.1=
9.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 951020dae98..5faf74b03d8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D97de97cd9d=
6e23c88129d884588ce71a"
=20
 SRC_URI[sha256sum] =3D "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f6=
5a212e4a2c83b302"
=20
-PYPI_PACKAGE =3D "Flask-User"
+PYPI_PACKAGE_SDIST =3D "Flask-User"
=20
 CVE_PRODUCT =3D "flask-user_project:flask-user"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_=
0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-ver=
sioned_0.9.4-20101221.bb
index 3492d5efc84..ed6791d6540 100644
--- a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-2=
0101221.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-2=
0101221.bb
@@ -3,7 +3,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://flaskext/versioned/__init__.py;md5=3Ddcb7d9=
7884bf08c256ff5795766bcd24"
=20
-PYPI_PACKAGE =3D "Flask-Versioned"
+PYPI_PACKAGE_SDIST =3D "Flask-Versioned"
=20
 SRC_URI[sha256sum] =3D "516694dc860a1bc4f22ab60b324a85083c0150522be10928=
2a3bed681057fd34"
=20
diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.=
bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
index 54c6c8904d2..f42b2938e24 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dd98d089889=
e14b227732d45dac3aacc4"
=20
 SRC_URI[sha256sum] =3D "61d5dabc50c3df885c297dcbd80810443a5d632106c8a69c=
ab8ce740f0cdd7cc"
=20
-PYPI_PACKAGE =3D "flask_wtf"
-
 inherit pypi python_hatchling
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.=
0.1.bb b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.=
bb
index c4cad466adc..e4f446066f3 100644
--- a/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
@@ -6,7 +6,7 @@ SRC_URI[sha256sum] =3D "226ea8e97065a9488b59bfe5c94af4c6e=
2ea70a25052e301fb231a1381
=20
 SRC_URI +=3D "file://remove-pip-requires.patch"
=20
-PYPI_PACKAGE =3D "Flask-XStatic"
+PYPI_PACKAGE_SDIST =3D "Flask-XStatic"
=20
 RDEPENDS:${PN} +=3D "\
     python3-flask \
diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb =
b/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
index 5bffae2aef3..94a51dd713b 100644
--- a/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D26e1a171d943c64f00c51f90c256b=
9d4"
=20
 SRC_URI[sha256sum] =3D "fed2afca4cb66832a416404ec02140a5311d8ce7658c0fdd=
92cc022b0cef8266"
-PYPI_PACKAGE =3D "git_pw"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb b=
/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
index e9fe3c78b15..e32afd1fbd7 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
@@ -3,7 +3,8 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5dabe659eadd6d97325b1582e=
41cfc11"
=20
-PYPI_PACKAGE =3D "python_gnupg"
+PYPI_PACKAGE =3D "python-gnupg"
+
 SRC_URI[sha256sum] =3D "5743e96212d38923fc19083812dc127907e44dbd3bcf0db4=
d657e291d3c21eac"
=20
 CVE_PRODUCT =3D "python:python-gnupg"
diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_=
2.19.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2=
.19.1.bb
index 84b384e8ca4..eee2278e403 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.=
bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.=
bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "google-api-core"
+
 SRC_URI[sha256sum] =3D "f4695f1e3650b316a795108a76a1c416e6afb036199d1c1f=
1f110916df479ffd"
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-google-api-pytho=
n-client_2.136.0.bb b/meta-python/recipes-devtools/python/python3-google-=
api-python-client_2.136.0.bb
index d2802815c09..9dfb2d67dd3 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-clien=
t_2.136.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-clien=
t_2.136.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "161c722c8864e7ed39393e2b7eea76ef4=
e1c933a6a59f9d7c70409b663
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "google-api-python-client"
+
 RDEPENDS:${PN} +=3D "\
     python3-logging \
     python3-json \
diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oaut=
hlib_1.4.1.bb b/meta-python/recipes-devtools/python/python3-google-auth-o=
authlib_1.4.1.bb
index e634a922619..2be37a7c775 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.=
4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.=
4.1.bb
@@ -8,7 +8,6 @@ SRC_URI +=3D "file://0001-python3-google-auth-oauthlib-Sk=
ip-failing-3PI-creden.pat
 SRC_URI[sha256sum] =3D "1a83f5f2a8421dedadaa3caf25b3a710dddf85a33a63144b=
e41c2fc79174b106"
=20
 inherit pypi setuptools3 ptest
-PYPI_PACKAGE =3D "google_auth_oauthlib"
=20
 SRC_URI +=3D " \
         file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.57=
.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
index a89800c61ef..7965a2e2b4c 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
@@ -11,8 +11,6 @@ SRC_URI +=3D " \
 "
 SRC_URI[sha256sum] =3D "9b4f96d6a1feb5f7201231f47cfb3de08d8f176f8a61f9e4=
61555116e95a8789"
=20
-PYPI_PACKAGE =3D "google_auth"
-
 RDEPENDS:${PN}-ptest +=3D " \
         python3-aioresponses \
         python3-cryptography \
diff --git a/meta-python/recipes-devtools/python/python3-googleapis-commo=
n-protos_1.63.2.bb b/meta-python/recipes-devtools/python/python3-googleap=
is-common-protos_1.63.2.bb
index 5539d19f683..779f3afa9d6 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-proto=
s_1.63.2.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-proto=
s_1.63.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "googleapis-common-protos"
+
 SRC_URI[sha256sum] =3D "27c5abdffc4911f28101e635de1533fb4cfd2c37fbaa9174=
587c799fac90aa87"
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.b=
b b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
index d2cfbf46a0f..436ade505f0 100644
--- a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
@@ -4,10 +4,9 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D10;endline=3D10;md5=3D=
c2d9994c57f0444e39f1dab19af50254"
 SRC_URI[sha256sum] =3D "2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a772=
15cf644a33513192"
=20
-
 inherit pypi setuptools3
=20
-CLEANBROKEN =3D "1"
+PYPI_PACKAGE_SDIST =3D "gpsd-py3"
=20
 RDEPENDS:${PN} +=3D " \
     python3 \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_=
1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1=
.76.0.bb
index 0f75a7a0844..97184c89a82 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.=
bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.76.0.=
bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D7145f7cdd263359b62
 inherit pypi setuptools3
=20
 DEPENDS +=3D "python3-grpcio"
-PYPI_PACKAGE =3D "grpcio_channelz"
=20
 SRC_URI[sha256sum] =3D "2ab15ef7b2252a9ba31df500bbe295ce5310a8b01ea6f6d6=
7a17172d914a41a8"
=20
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflectio=
n_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflecti=
on_1.76.0.bb
index 910d7955535..6e0a4b0c494 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.76.=
0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D7145f7cdd263359b62
 inherit pypi setuptools3
=20
 DEPENDS +=3D "python3-grpcio"
-PYPI_PACKAGE =3D "grpcio_reflection"
=20
 SRC_URI[sha256sum] =3D "e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d5=
67f3d01b799decb1"
=20
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.7=
6.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.=
bb
index 447ece8594b..36b3eacbf26 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D7145f7cdd263359b62
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "grpcio_tools"
-
 DEPENDS +=3D "python3-grpcio"
=20
 SRC_URI +=3D "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.p=
atch \
diff --git a/meta-python/recipes-devtools/python/python3-hatch-requiremen=
ts-txt_0.4.1.bb b/meta-python/recipes-devtools/python/python3-hatch-requi=
rements-txt_0.4.1.bb
index 8b3218790e0..afbec16e3cd 100644
--- a/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_=
0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hatch-requirements-txt_=
0.4.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D58206c261591d2=
c13b00ab61cec32abe"
=20
 SRC_URI[sha256sum] =3D "2c686e5758fd05bb55fa7d0c198fdd481f8d3aaa3c693260=
f5c0d74ce3547d20"
=20
-PYPI_PACKAGE =3D "hatch_requirements_txt"
-
 inherit pypi python_hatchling
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.b=
b b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
index cc431b33bda..405e23b2f52 100644
--- a/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-idna-ssl_1.1.0.bb
@@ -5,9 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da61b9c5aec879=
6b64a6bf15d42605073"
=20
 SRC_URI[sha256sum] =3D "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f31=
1254d6d0d92c6c7c"
=20
-
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "idna-ssl"
+
 RDEPENDS:${PN} +=3D " \
     python3-idna \
     python3-io \
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metada=
ta_9.0.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metad=
ata_9.0.1.bb
index 623f75756ad..89fc9af8249 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.=
1.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.=
1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daffe5a7d8b988c=
3db245c01075b29e17"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "importlib_metadata"
-
 SRC_URI[sha256sum] =3D "ab830580bc0ef3db61ce8fae716389e5462b67e033018bab=
6d8f80ef17172f99"
=20
 S =3D "${UNPACKDIR}/importlib_metadata-${PV}"
diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_=
0.35.4.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0=
.35.4.bb
index d9eea29c1f3..773a945b113 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.=
bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.=
bb
@@ -8,8 +8,6 @@ SRC_URI[sha256sum] =3D "82432a58b7ea77a172515f5024cd26fde=
a8dc0f873c7a4251e4e0471a9
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "inline_snapshot"
-
 RDEPENDS:${PN} =3D "python3-asttokens \
                   python3-black \
                   python3-click \
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0=
.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
index dd9f88748b0..9ac3a0d39f7 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
@@ -6,6 +6,7 @@ LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D05f1e16a8e59ce3e9a979e881=
816c2ab"
=20
 PYPI_PACKAGE :=3D "python-intervals"
+PYPI_PACKAGE_SDIST :=3D "python-intervals"
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/me=
ta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 631354dece9..437f23975d7 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -15,6 +15,6 @@ inherit pypi setuptools3_legacy ptest-python-pytest
=20
 PTEST_PYTEST_DIR =3D "test"
=20
-PYPI_PACKAGE =3D "IPy"
+PYPI_PACKAGE_SDIST =3D "IPy"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils=
_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_=
0.2.0.bb
index d880d88d2d1..648b51cb73e 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.=
bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.=
bb
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://ipython.org"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3Df7c3032c3ac398265224533a0a=
333a35"
=20
-PYPI_PACKAGE =3D "ipython_genutils"
-
 SRC_URI[sha256sum] =3D "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e=
33785b887c628ba8"
=20
 inherit setuptools3 pypi
diff --git a/meta-python/recipes-devtools/python/python3-jalali-core_1.0.=
0.bb b/meta-python/recipes-devtools/python/python3-jalali-core_1.0.0.bb
index e3a7b02e40f..c1a128fd15e 100644
--- a/meta-python/recipes-devtools/python/python3-jalali-core_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jalali-core_1.0.0.bb
@@ -5,6 +5,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da88966a0e5f405=
7719d2cc2766c6e091"
=20
 SRC_URI[sha256sum] =3D "f4287c70c630323dcf0a3ab26df905ba4d451e230ac1f65b=
3bb2f77797894a2b"
=20
-PYPI_PACKAGE =3D "jalali_core"
-
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.=
4.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
index d71101ee2c3..beafebba287 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] =3D "e4e3257ef2cf81a3339787a4d5cf924=
e54c91f095a723f6d2584dae61d
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "javaobj-py3"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.=
0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
index 8d846ab7208..b15f289266a 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D "05c471281c45ae113f6103d1268ec7a48=
31a2e96aa80de45edc89b11fa
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "jsonpath-rw"
+
 RDEPENDS:${PN} +=3D " \
     python3-decorator \
     python3-logging \
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema-defau=
lt_1.8.1.bb b/meta-python/recipes-devtools/python/python3-jsonschema-defa=
ult_1.8.1.bb
index 03cba50b990..a9ba22f5b4c 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema-default_1.8.=
1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema-default_1.8.=
1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ae09d45eac4aa=
08d013b5f2e01c67f6"
=20
 SRC_URI[sha256sum] =3D "77e35e4a95519c7dbdbe25438c00af33c17bb766cbb0a29a=
2aa9d645ee3c1399"
=20
-PYPI_PACKAGE =3D "jsonschema_default"
-
 inherit pypi python_hatchling
=20
 RDEPENDS:${PN} =3D "python3-rstr"
diff --git a/meta-python/recipes-devtools/python/python3-keras-applicatio=
ns_1.0.8.bb b/meta-python/recipes-devtools/python/python3-keras-applicati=
ons_1.0.8.bb
index ce965b3e438..7488a25d95a 100644
--- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.=
8.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.=
8.bb
@@ -9,7 +9,6 @@ SRCREV ?=3D "3b180cb10eda683dda7913ecee2e6487288d292d"
=20
 inherit setuptools3
=20
-
 BBCLASSEXTEND =3D "native"
=20
 RDEPENDS:${PN} =3D "python3-numpy \
diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocess=
ing_1.1.2.bb b/meta-python/recipes-devtools/python/python3-keras-preproce=
ssing_1.1.2.bb
index f070d79d2ba..4ad8c9c4b96 100644
--- a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1=
.2.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1=
.2.bb
@@ -8,7 +8,6 @@ inherit pypi setuptools3
=20
 SRC_URI[sha256sum] =3D "add82567c50c8bc648c14195bf544a5ce7c1f76761536956=
c3d2978970179ef3"
=20
-PYPI_PACKAGE =3D "Keras_Preprocessing"
+PYPI_PACKAGE_SDIST =3D "Keras_Preprocessing"
=20
 BBCLASSEXTEND =3D "native"
-
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-prox=
y_1.12.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-pro=
xy_1.12.0.bb
index acd84efd213..273211a3e93 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.=
0.bb
@@ -8,8 +8,6 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 SRC_URI[sha256sum] =3D "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d=
51472c0c124c0c61"
=20
-PYPI_PACKAGE =3D "lazy_object_proxy"
-
 inherit pypi python_setuptools_build_meta
=20
 do_install:append() {
diff --git a/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.4=
.bb b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.4.bb
index 85328ed9510..9cc4c5b9310 100644
--- a/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.4.bb
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://github.com/jackrosenthal/legacy-cgi=
"
 LICENSE =3D "PSF-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4b8801e752a2c70ac41a5f9aa243f=
766"
=20
-PYPI_PACKAGE =3D "legacy_cgi"
-
 inherit python_poetry_core pypi python_hatchling
=20
 SRC_URI +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.b=
b b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index d136dcb005b..a1b3819d045 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] =3D "54fd1966d6bd1fcde781596cb86068214=
edeebff1db13a2cea11079e3f
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "lru-dict"
+
 DEPENDS +=3D "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.=
bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
index e19ad562197..70964ce17b7 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
@@ -11,6 +11,7 @@ DEPENDS +=3D "python3-wheel-native"
 SRC_URI[sha256sum] =3D "963c264164d4374f549d57db09599e0ca458cea1bd05e169=
39897619be4e6dbd"
=20
 PYPI_PACKAGE =3D "luma.core"
+PYPI_PACKAGE_SDIST =3D "luma.core"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-pillow \
diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0=
.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
index 2d0d88d7b98..c4d347419e4 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
@@ -12,8 +12,6 @@ DEPENDS +=3D "python3-wheel-native"
=20
 SRC_URI[sha256sum] =3D "16925fe668f484803df0683add800b19e5dd7316a1d64eb0=
6ec2ae817473901e"
=20
-PYPI_PACKAGE =3D "luma_oled"
-
 RDEPENDS:${PN} +=3D " \
 	python3-luma-core \
 "
diff --git a/meta-python/recipes-devtools/python/python3-markdown-it-py_4=
.2.0.bb b/meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.=
0.bb
index 508e89784ec..0bb2b3ca6c8 100644
--- a/meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb
@@ -9,7 +9,6 @@ inherit pypi python_flit_core
=20
 RDEPENDS:${PN} +=3D "python3-mdurl"
=20
-PYPI_PACKAGE =3D "markdown_it_py"
 CVE_PRODUCT =3D "markdown-it-py"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inlin=
e_0.2.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inlin=
e_0.2.2.bb
index bc515c7b4a6..18da32387d4 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2=
.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2=
.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd4692a0eb42ca5=
4892399db2cb35e61e"
=20
 SRC_URI[sha256sum] =3D "72f3fe8fce36b70d4a5b612f899090cd0401deddc4ea90e1=
572b9f4bfb058c79"
=20
-PYPI_PACKAGE =3D "matplotlib_inline"
-
 inherit pypi python_flit_core
=20
 RDEPENDS:${PN} =3D "python3-traitlets"
diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_=
0.6.1.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.=
6.1.bb
index 28a55725a8b..7f1dc9691cd 100644
--- a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.b=
b
+++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.b=
b
@@ -9,6 +9,4 @@ inherit pypi python_flit_core
=20
 RDEPENDS:${PN} +=3D "python3-markdown-it-py"
=20
-PYPI_PACKAGE =3D "mdit_py_plugins"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_=
1.1.0.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.=
1.0.bb
index 33a1551e665..19060eb09f8 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://github.com/python/mypy_extensions"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fe3219e2470a78c0d1837019b8b4=
26e"
=20
-PYPI_PACKAGE =3D "mypy_extensions"
-
 inherit pypi python_flit_core
=20
 SRC_URI[sha256sum] =3D "52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a=
211403730b916558"
diff --git a/meta-python/recipes-devtools/python/python3-myst-parser_5.1.=
0.bb b/meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
index 6471e370cc4..7dc22c5bf89 100644
--- a/meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "ab69322dc6719dcc7f296479dbb70181b=
66df6ed315064f92dbc85c0e1
=20
 inherit pypi python_flit_core
=20
-PYPI_PACKAGE =3D "myst_parser"
-
 RDEPENDS:${PN} =3D "\
     python3-docutils \
     python3-jinja2 \
diff --git a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7=
.2.bb b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
index e483b989072..aaed7d0f7a1 100644
--- a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
@@ -7,6 +7,4 @@ SRC_URI[sha256sum] =3D "342dc97b9e88a6495bae22953ee6063f9=
1d2f03db6f727b62ba5c3092a
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "ninja_syntax"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb b/=
meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
index 25e382088b2..5c0ad65d4a1 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.9.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
 DEPENDS +=3D "python3-wheel-native"
=20
 PYPI_PACKAGE =3D "python3-nmap"
+PYPI_PACKAGE_SDIST =3D "python3-nmap"
=20
 SRC_URI[sha256sum] =3D "8465cfb013f5cdfa8a1050c40cdae600b581ee32f1864ec4=
04927aee49b4262c"
=20
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.=
0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 6dbc9d65382..c5750a777ed 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] =3D "694a8e44c87657c59292ede72891eb91d=
34131f6531463aab3009191c7
=20
 inherit pypi python_flit_core ptest-python-pytest
=20
+PYPI_PACKAGE_SDIST =3D "ordered-set"
+
 PTEST_PYTEST_DIR =3D "test"
diff --git a/meta-python/recipes-devtools/python/python3-packageurl-pytho=
n_0.17.6.bb b/meta-python/recipes-devtools/python/python3-packageurl-pyth=
on_0.17.6.bb
index 4ae0f3a8246..7fbe5f81d4a 100644
--- a/meta-python/recipes-devtools/python/python3-packageurl-python_0.17.=
6.bb
+++ b/meta-python/recipes-devtools/python/python3-packageurl-python_0.17.=
6.bb
@@ -7,6 +7,4 @@ SRC_URI[sha256sum] =3D "1252ce3a102372ca6f86eb968e16f9014=
c4ba511c5c37d95a7f023e2ca
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "packageurl_python"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.=
bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index aa6ffb85266..cecd98fca4b 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8e5f264c69=
88aec56808a3a11e77b913 \
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "paho_mqtt"
-
 SRC_URI[sha256sum] =3D "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4=
f7c3968fc1723834"
=20
 do_install:append() {
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6=
.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
index 43ae9bd1cf6..86f01f12db8 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
@@ -9,8 +9,6 @@ SRC_URI +=3D " \
     file://0001-drop-the-six-dependency.patch \
 "
=20
-PYPI_PACKAGE =3D "parse_type"
-
 inherit pypi ptest python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.=
0.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
index e3405939c7d..92c5b665d6d 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://license.txt;md5=3D1798f29d55=
080c60365e6283cb49779c"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "PasteDeploy"
+PYPI_PACKAGE_SDIST =3D "PasteDeploy"
=20
 SRC_URI[sha256sum] =3D "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed4=
18b6a7ff6a095a95"
=20
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.4.2.=
bb b/meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
index 43a12d7fcf8..3a3372d9dce 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "9b334a31832ba64f74aa72700ee5fd645=
2d79d1d1fa6a0b48333bdb716
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "python_periphery"
+PYPI_PACKAGE =3D "python-periphery"
=20
 RDEPENDS:${PN} +=3D "python3-mmap \
 		python3-ctypes \
diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb =
b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
index 84bc17959a6..dfbd76ecd60 100644
--- a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://README.rst;beginline=3D337;e=
ndline=3D358;md5=3Df68bda54505b
 SRC_URI[sha256sum] =3D "9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c502=
90803286f9e46bf7"
=20
 PYPI_PACKAGE =3D "python-pkcs11"
+PYPI_PACKAGE_SDIST =3D "python-pkcs11"
=20
 inherit pypi setuptools3 cython
=20
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
index 0660bb4ba8a..111444580aa 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
@@ -4,8 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3d8df223c2614dbf1aabdc1ca23c=
c10"
=20
-PYPI_PACKAGE =3D "posix_ipc"
-
 SRC_URI[sha256sum] =3D "6923232111329954a8349f7d99f212b6e96b5206e77fbd39=
aaf1b3cb4a5e9260"
=20
 # Message queue support requires librt for proper linking
diff --git a/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2=
.bb b/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
index 2691fdc4694..285266c7753 100644
--- a/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
@@ -2,8 +2,6 @@ SUMMARY =3D "A framework for managing and maintaining mul=
ti-language pre-commit ho
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db53a93744e3ff841e5fc9a934da8e=
1c8"
=20
-PYPI_PACKAGE =3D "pre_commit"
-
 inherit pypi setuptools3
 SRC_URI[sha256sum] =3D "8f5d7bfb021ecdbcd9d49d89847082dd24172ccde5343900=
81a679ad046e2441"
=20
diff --git a/meta-python/recipes-devtools/python/python3-precise-runner_0=
.3.1.bb b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.=
1.bb
index 53fc31ab83a..37bae4a2aae 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] =3D "1a464209fb4bf0a3f5d5a428310cb2a70=
487a01a6bc3a960d1dda90af8
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
+PYPI_PACKAGE_SDIST =3D "precise-runner"
+
 PTEST_PYTEST_DIR =3D "test"
diff --git a/meta-python/recipes-devtools/python/python3-process-tests_3.=
0.0.bb b/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.=
bb
index a16497b9840..0ffad438bf8 100644
--- a/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-process-tests_3.0.0.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] =3D "e5d57dea7161251e91cadb84bf3ecc8=
5275fb121fd478e579f800777b1
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "process-tests"
+
 RDEPENDS:${PN} +=3D "python3-core"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3=
.0.53.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0=
.53.bb
index 7dd173cfa04..54259a24909 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.b=
b
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.b=
b
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "9ec8a0ad96d5c56148b3f914aa79c1564=
c3fde5d2e6b876e7bc327e353
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "prompt_toolkit"
-
 RDEPENDS:${PN} +=3D " \
     python3-core \
     python3-terminal \
diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.=
bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.bb
index 6d7ef96216a..2dba679d845 100644
--- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da3d6c15f78=
59ae235a78f2758e5a48cf"
=20
 DEPENDS =3D "python3-setuptools-scm-native"
=20
-PYPI_PACKAGE =3D "pure_eval"
-
 inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0=
.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index db0e2a96d80..30760dcd3e4 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] =3D "3cdbbf3fac90dc6f118bfd64384f309=
edeadd902d7c8fb17f02ffa1fc3
=20
 inherit ptest-python-pytest pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "py-cpuinfo"
+
 DEPENDS +=3D "python3-wheel-native"
=20
 SRC_URI +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-py-serializable_=
2.1.0.bb b/meta-python/recipes-devtools/python/python3-py-serializable_2.=
1.0.bb
index 8e2a6111d72..a3f36d11c9a 100644
--- a/meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.b=
b
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "9d5db56154a867a9b897c0163b33a793c=
804c80cee984116d02d49e457
=20
 inherit pypi python_poetry_core
=20
-PYPI_PACKAGE =3D "py_serializable"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 RDEPENDS:${PN} +=3D "python3-defusedxml"
diff --git a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1=
.bb b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
index 0db9d65fd39..d2babb0b4b3 100644
--- a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "b9bfb8695a1c7e3632e800fb83c943bf6=
7ed45ddd87cd0344851610c69
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "py-ubjson"
+
 RDEPENDS:${PN} +=3D " \
     python3-numbers \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0=
.4.2.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.=
2.bb
index 3b3bc799a62..5ae284fb8f8 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
@@ -8,11 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D190f79253=
908c986e6cacf380c3a5f6d"
=20
 SRC_URI[sha256sum] =3D "677091de870a80aae844b1ca6134f54652fa2c8c5a52aa39=
6440ac3106e941e6"
=20
-PYPI_PACKAGE =3D "pyasn1_modules"
-
 inherit pypi ptest-python-pytest python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "python3-pyasn1"
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.b=
b b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
index 80c04d63e5f..6cc0e036387 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
@@ -3,7 +3,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D7c3152b432b96d6dc4a1cb353=
97da9ec"
=20
-PYPI_PACKAGE =3D "PyAudio"
+PYPI_PACKAGE_SDIST =3D "PyAudio"
=20
 SRC_URI[sha256sum] =3D "78dfff3879b4994d1f4fc6485646a57755c6ee3c19647a49=
1f790a0895bd2f87"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb =
b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index 188700be298..9ea2da9df39 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -11,7 +11,7 @@ SRC_URI +=3D "file://0001-Use-Py_ssize_t-when-parsing-b=
uffer-length-fix-426-42.pat
             file://py-3.11.patch "
 SRC_URI[sha256sum] =3D "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f=
55fcd7b8582e90de"
=20
-PYPI_PACKAGE =3D "PyBluez"
+PYPI_PACKAGE_SDIST =3D "PyBluez"
=20
 inherit pypi setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.=
46.5.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.=
5.bb
index 38340cf547c..616656af673 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb
@@ -19,8 +19,6 @@ DEPENDS =3D "python3-maturin-native python3-typing-exte=
nsions"
=20
 inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pyte=
st
=20
-PYPI_PACKAGE =3D "pydantic_core"
-
 RDEPENDS:${PN} +=3D " \
     python3-compression \
     python3-typing-extensions \
diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.=
bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
index 7ec799e0864..347c562e975 100644
--- a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "A Python interface for the Firmata protocol"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84ddcef430b7c44caa22b2ff4b37a=
3df"
=20
-PYPI_PACKAGE =3D "pyFirmata"
+PYPI_PACKAGE_SDIST =3D "pyFirmata"
=20
 RDEPENDS:${PN} =3D "\
     python3-pyserial \
diff --git a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.b=
b b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
index 49f4f7da8be..8228766f122 100644
--- a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D14;endl=
ine=3D14;md5=3D95d480cd6f8471ab
=20
 SRC_URI[sha256sum] =3D "c5f36e8ef0ed3b487a9242ce34c19f9684e418a5bbffd5d3=
67dc1d1604b4cd0b"
=20
-PYPI_PACKAGE =3D "PyLyrics"
+PYPI_PACKAGE_SDIST =3D "PyLyrics"
 PYPI_PACKAGE_EXT =3D "zip"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.=
11.0.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.=
0.bb
index d0e3c90ac8b..d174bda08b7 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11610a9d8fd956=
49cf8159be12b98cb7"
=20
 SRC_URI[sha256sum] =3D "b8807d85a293e6c9f133e6575946fed45f1d42b22d58c780=
b33aa2421a799549"
=20
-PYPI_PACKAGE =3D "pyproject_api"
-
 BBCLASSEXTEND =3D "native nativesdk"
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyserial-asyncio=
_0.6.bb b/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.=
6.bb
index 30ff62a7ed4..2642bf3af1f 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial-asyncio_0.6.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] =3D "b6032923e05e9d75ec17a5af9a98429c4=
6d2839adfaf80604d52e0faac
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "pyserial-asyncio"
+
 RDEPENDS:${PN} +=3D "python3-asyncio python3-core python3-pyserial"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1=
.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.=
1.bb
index 91a619eab11..f4ccb8de758 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.1.bb
@@ -12,8 +12,6 @@ DEPENDS =3D "\
=20
 SRC_URI[sha256sum] =3D "3aa9c9fe26e543eaccc7eb0add381c685ba3ed3e2fed0af7=
4540f63bcd31458d"
=20
-PYPI_PACKAGE =3D "pytest_aiohttp"
-
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "python3-aiohttp"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1=
.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.=
0.bb
index ad3b2e2d2b6..c1803e3eb29 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "c6c0d2259945122819f171a32ecea2c34=
9ead889ee28176caaf4921434
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "pytest_asyncio"
-
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark=
_5.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_=
5.1.0.bb
index ae4b12c2104..791e6df3f07 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.=
bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.=
bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "9ea661cdc292e8231f7cd4c10b0319e56=
a2118e2c09d9f50e1b3d150d2
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "pytest-benchmark"
+
 RDEPENDS:${PN} +=3D "python3-core python3-py-cpuinfo python3-pytest pyth=
on3-aspectlib"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_=
5.0.3.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.=
0.3.bb
index 9ed6659a774..674f1ae87a4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
@@ -8,6 +8,4 @@ SRC_URI[sha256sum] =3D "91afef90e6a96b013495e4702ef5d6358=
614a449e71008cdc194ef6687
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "pytest_codspeed"
-
 RDEPENDS:${PN} =3D "python3-cffi python3-filelock python3-pytest python3=
-rich python3-statistics"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
index 7673a8c5696..1dd90db4587 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
@@ -12,6 +12,4 @@ inherit pypi python_setuptools_build_meta python_hatchl=
ing
 DEPENDS +=3D "python3-setuptools-scm-native python3-hatch-fancy-pypi-rea=
dme-native"
 RDEPENDS:${PN} +=3D "python3-coverage python3-pytest python3-pluggy"
=20
-PYPI_PACKAGE =3D "pytest_cov"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
index 86fd2c9418f..ad30107b0ba 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
@@ -9,8 +9,6 @@ SRC_URI[sha256sum] =3D "0c1dc1101fb8d3ab3611e8f8d657ba06c=
3c0c167fc85c90457e5b27f25
=20
 inherit pypi python_hatchling ptest-python-pytest
=20
-PYPI_PACKAGE =3D "pytest_env"
-
 RDEPENDS:${PN} =3D "python3-pytest python3-tomli"
=20
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-examples_=
0.0.18.bb b/meta-python/recipes-devtools/python/python3-pytest-examples_0=
.0.18.bb
index a4fd03cf56f..68a0c863d75 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-examples_0.0.18.=
bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-examples_0.0.18.=
bb
@@ -15,8 +15,6 @@ RDEPENDS:${PN} +=3D "\
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "pytest_examples"
-
 SRC_URI[sha256sum] =3D "9a464f007f805b113677a15e2f8942ebb92d7d3eb5312e9a=
405d018478ec9801"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.=
6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.=
bb
index f573bf05233..825141faa28 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "4dafd46a9a600f65d822b8f605133ecf5=
b3e1941ebb3588e943b4e3eb7
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "pytest-forked"
+
 PEP517_BUILD_OPTS =3D "--skip-dependency-check"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-freezer_0=
.4.9.bb b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.=
9.bb
index cd09a5c3258..c7bef48e626 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
@@ -11,5 +11,3 @@ RDEPENDS:${PN} =3D "\
     python3-freezegun (>=3D1.0) \
     python3-pytest (>=3D3.6) \
 "
-
-PYPI_PACKAGE =3D "pytest_freezer"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-n=
amespace_2021.12.29.bb b/meta-python/recipes-devtools/python/python3-pyte=
st-helpers-namespace_2021.12.29.bb
index 6698b6dde38..e63b255f7b9 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.12.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.12.29.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "792038247e0021beb966a7ea6e3a70ff5=
fcfba77eb72c6ec8fd6287af8
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "pytest-helpers-namespace"
+
 DEPENDS +=3D "python3-setuptools-scm-native python3-setuptools-declarati=
ve-requirements-native"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.2.=
0.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
index 0889417ad01..63a36c841ff 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d425c8f3157db=
f212db2ec53d9e5132"
=20
 SRC_URI[sha256sum] =3D "b6a88cba507500d8709959201e2e757d3941e859fd17cfd4=
ed87b16fc0c67912"
=20
-PYPI_PACKAGE =3D "pytest_html"
-
 inherit pypi python_hatchling
=20
 DEPENDS +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpserve=
r_1.1.5.bb b/meta-python/recipes-devtools/python/python3-pytest-httpserve=
r_1.1.5.bb
index 4421260005f..0c3e8f84867 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5=
.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5=
.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7f54416ccc5478=
427995b27e5ef38e92"
=20
 SRC_URI[sha256sum] =3D "dc3d82e1fe00e491829d8939c549bf4bd9b39a260f87113c=
619b9d517c2f8ff1"
=20
-PYPI_PACKAGE =3D "pytest_httpserver"
-
 inherit pypi python_poetry_core ptest-python-pytest
=20
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.3=
6.2.bb b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.=
bb
index 2309a96fa52..c2550731970 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
@@ -19,5 +19,3 @@ RDEPENDS:${PN}-ptest +=3D "\
     python3-pytest-cov \
     python3-pytest-asyncio \
 "
-
-PYPI_PACKAGE =3D "pytest_httpx"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-json-repo=
rt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-json-rep=
ort_1.5.0.bb
index 8834a6b5863..53f4d223b98 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.=
0.bb
@@ -5,9 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8b4ca2f2ad5aa=
aebd8eb24f262f8fe60"
=20
 SRC_URI[sha256sum] =3D "2dde3c647851a19b5f3700729e8310a6e66efb2077d674f2=
7ddea3d34dc615de"
=20
-
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "pytest-json-report"
+
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixt=
ures_1.1.4.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-f=
ixtures_1.1.4.bb
index 64aa5d3ce1d..9cac9b85524 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.=
1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.=
1.4.bb
@@ -16,6 +16,4 @@ SRC_URI[sha256sum] =3D "c494b52d798890033d64b28687a4d52=
807c8b0f606d56316e139df0cbe
=20
 inherit pypi python_poetry_core
=20
-PYPI_PACKAGE =3D "pytest_lazy_fixtures"
-
 RDEPENDS:${PN} =3D "python3-pytest"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-localserv=
er_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pytest-localser=
ver_0.8.1.bb
index e9500bd3db1..d60004769f3 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.=
1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.=
1.bb
@@ -7,6 +7,8 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
+PYPI_PACKAGE_SDIST =3D "pytest-localserver"
+
 SRC_URI[sha256sum] =3D "66569c34fef31a5750b16effd1cd1288a7a90b59155d005e=
7f916accd3dee4f1"
=20
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_=
3.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_3.=
1.1.bb
index 64589b31b60..e33fd746d1b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_3.1.1.b=
b
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_3.1.1.b=
b
@@ -8,8 +8,6 @@ SRC_URI[sha256sum] =3D "d2a29b0355fbc03f168aa96d41ff88b1a=
3b44a3b02acbe491801c98a04
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "pytest_metadata"
-
 DEPENDS +=3D "python3-hatch-vcs-native"
=20
 RDEPENDS:${PN} =3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.15=
.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
index 5ed97e436dc..e4951d54cb4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
@@ -12,8 +12,6 @@ SRC_URI[sha256sum] =3D "1849a238f6f396da19762269de72cb1=
814ab44416fa73a8686deac10b0
=20
 inherit pypi python_setuptools_build_meta ptest
=20
-PYPI_PACKAGE =3D "pytest_mock"
-
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked_0.=
5.1.bb b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.=
bb
index 449af2623e1..68f028e6207 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
@@ -15,5 +15,3 @@ RDEPENDS:${PN} +=3D "\
     git \
     python3-pytest (>=3D3.7.0) \
 "
-
-PYPI_PACKAGE =3D "pytest_picked"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-relaxed_2=
.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.=
2.bb
index 6e56d20b8d1..28e941e61c5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D "956ea028ec30dbbfb680dd8e7b4a7fb8f=
80a239595e88bace018bf2c0d
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "pytest-relaxed"
+
 RDEPENDS:${PN} +=3D " \
     python3-core \
     python3-pytest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_6.=
0.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.=
bb
index dd3a8d0234d..7b9395ad79b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
@@ -14,6 +14,8 @@ inherit pypi python_setuptools_build_meta
 DEPENDS +=3D " \
     python3-setuptools-scm-native"
=20
+PYPI_PACKAGE_SDIST =3D "pytest-runner"
+
 RDEPENDS:${PN} =3D "python3-setuptools python3-debugger python3-json pyt=
hon3-io"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-socket_0.=
7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.=
bb
index 86b03724a0a..5ae9bdfa5fc 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-socket_0.7.0.bb
@@ -10,5 +10,3 @@ inherit pypi python_poetry_core
 RDEPENDS:${PN} =3D "python3-pytest"
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-PYPI_PACKAGE =3D "pytest_socket"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1=
.1.bb b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
index 22eb3d52ffd..c401374768d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.1.1.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "73b8b65163ebf10f9f671efab9eed3d56=
f20d2ca68bda83fa64740a92c
=20
 inherit pypi python_poetry_core ptest-python-pytest
=20
+PYPI_PACKAGE_SDIST =3D "pytest-sugar"
+
 DEPENDS +=3D "python3-wheel-native"
=20
 PACKAGECONFIG ?=3D ""
diff --git a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2=
019.10.12.bb b/meta-python/recipes-devtools/python/python3-pytest-tempdir=
_2019.10.12.bb
index b161b016bca..e74d2705ef3 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.=
12.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.=
12.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "e7d91813a9aa991db87dacdef8cfd3f16=
57632d731d56d06238c5ffb63
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "pytest-tempdir"
+
 RDEPENDS:${PN} +=3D " \
     python3-pytest \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2=
.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.=
0.bb
index 8990e29bbad..27f8f688bf3 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8048cd156eda3=
df2e7f111b0ae9ceff"
=20
 SRC_URI[sha256sum] =3D "68c9d82dfe95fa65712e107010c9344e7d8b4afe8c975a7b=
e0d273d939583a93"
=20
-PYPI_PACKAGE =3D "pytest_timeout"
-
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-pytest-unordered=
_0.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-unordered_=
0.8.0.bb
index 293d193f7ce..5aa4f9762d9 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-unordered_0.8.0.=
bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-unordered_0.8.0.=
bb
@@ -10,5 +10,3 @@ inherit pypi setuptools3
 RDEPENDS:${PN} +=3D "python3-pytest"
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-PYPI_PACKAGE =3D "pytest_unordered"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8=
.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
index 7b340e89206..72d3c91502d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
@@ -13,5 +13,3 @@ RDEPENDS:${PN} +=3D " \
     python3-execnet \
     python3-pytest \
 "
-
-PYPI_PACKAGE =3D "pytest_xdist"
diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.=
2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.=
bb
index b16d3c766b5..416dec3a172 100644
--- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
@@ -15,8 +15,6 @@ PACKAGECONFIG ?=3D ""
 PACKAGECONFIG:append =3D "${@bb.utils.contains('PTEST_ENABLED', '1', ' c=
li', '', d)}"
 PACKAGECONFIG[cli] =3D ",,,python3-click"
=20
-PYPI_PACKAGE =3D "python_dotenv"
-
 RDEPENDS:${PN}-ptest +=3D "\
     coreutils \
     python3-sh \
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart=
_0.0.32.bb b/meta-python/recipes-devtools/python/python3-python-multipart=
_0.0.32.bb
index db1a9e0415b..97b68c82e42 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32=
.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32=
.bb
@@ -6,10 +6,8 @@ SRC_URI[sha256sum] =3D "be54b7f3fa167bb83e4fcd936b887b70=
8f4e57fe75911c02aebf53efaf
=20
 inherit pypi python_hatchling ptest-python-pytest
=20
-PYPI_PACKAGE =3D "python_multipart"
 CVE_PRODUCT =3D "python-multipart"
=20
 RDEPENDS:${PN}-ptest +=3D " \
 	python3-pyyaml \
 "
-
diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.2=
1203.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.2120=
3.bb
index 44a14348b21..68009d33fe6 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.21203.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 SRC_URI[sha256sum] =3D "52d0544b276b11e58b6c0b748c3e0518f94f74b1b4cd328c=
83a59eacabead1ec"
=20
-PYPI_PACKAGE =3D "python_vlc"
-
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-python-xmp-toolk=
it_2.1.0.bb b/meta-python/recipes-devtools/python/python3-python-xmp-tool=
kit_2.1.0.bb
index 3a269744d9e..6a2853cf4b8 100644
--- a/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.=
0.bb
@@ -8,8 +8,6 @@ SRC_URI[sha256sum] =3D "ca0aa2c60d418dd2558767db59953ab59=
54fb5b87dc0b50cecd60566b0
=20
 inherit pypi python_flit_core ptest-python-pytest
=20
-PYPI_PACKAGE =3D "python_xmp_toolkit"
-
 DEPENDS +=3D "\
     python3-pytz-native \
 "
diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.b=
b b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
index 761676d2ce0..357a4c8f3c5 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] =3D "81e7260f6297cad564389b700783c0a=
33de71310b9eb01fd013faec5e7
 inherit setuptools3 pypi ptest-python-pytest
=20
 PYPI_PACKAGE =3D "python-rapidjson"
+PYPI_PACKAGE_SDIST =3D "python-rapidjson"
=20
 SETUPTOOLS_BUILD_ARGS +=3D " --rj-include-dir=3D${RECIPE_SYSROOT}${inclu=
dedir}"
=20
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_3.=
0.1.bb b/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.=
bb
index 16f04a4cad8..f5d6e3cb586 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9cc728d6087e43=
796227b0a31422de6b"
=20
 SRC_URI[sha256sum] =3D "f14243d7796c588f3521bd423c5dea2ee4cc730e54a3cac9=
574d78aca1272576"
=20
-PYPI_PACKAGE =3D "requests_file"
-
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
@@ -14,4 +12,3 @@ DEPENDS +=3D "python3-setuptools-scm-native"
 RDEPENDS:${PN} +=3D " \
     python3-requests \
 "
-
diff --git a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3=
.1.bb b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
index db7c5fee0be..206e380da60 100644
--- a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
@@ -12,3 +12,4 @@ RDEPENDS:${PN} +=3D " \
     python3-requests \
 "
=20
+PYPI_PACKAGE_SDIST =3D "requests-ftp"
diff --git a/meta-python/recipes-devtools/python/python3-requests-futures=
_1.0.2.bb b/meta-python/recipes-devtools/python/python3-requests-futures_=
1.0.2.bb
index 5714c3498d5..715542e8bf4 100644
--- a/meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.=
bb
+++ b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.=
bb
@@ -5,11 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De1e50798d0afe=
0e1f87594c6619a2fa5"
=20
 SRC_URI[sha256sum] =3D "6b7eb57940336e800faebc3dab506360edec9478f7b22dc5=
70858ad3aa7458da"
=20
-PYPI_PACKAGE =3D "requests_futures"
-
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D " \
     python3-requests \
 "
-
diff --git a/meta-python/recipes-devtools/python/python3-requests-mock_1.=
12.1.bb b/meta-python/recipes-devtools/python/python3-requests-mock_1.12.=
1.bb
index 248526b00bb..678e0fb48e0 100644
--- a/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb
@@ -7,3 +7,5 @@ DEPENDS =3D "python3-setuptools-scm-native"
 SRC_URI[sha256sum] =3D "e9e12e333b525156e82a3c852f22016b9158220d2f47454d=
e9cae8a77d371401"
=20
 inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE_SDIST =3D "requests-mock"
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthli=
b_2.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthli=
b_2.0.0.bb
index 71cafb513d3..6cbf54f4a85 100644
--- a/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_2.0.0=
.bb
@@ -5,4 +5,6 @@ SRC_URI[sha256sum] =3D "b3dffaebd884d8cd778494369603a9e7b=
58d29111bf6b41bdc2dcd8720
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "requests-oauthlib"
+
 RDEPENDS:${PN} +=3D "python3-requests python3-oauthlib"
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbel=
t_1.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-toolbel=
t_1.0.0.bb
index 8956dee1f1f..aa8e0a08f37 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0=
.bb
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] =3D "7681a0a3d047012b5bdc0ee37d7f8f0=
7ebe76ab08caeccfc3921ce23c8
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
+PYPI_PACKAGE_SDIST =3D "requests-toolbelt"
+
 RDEPENDS:${PN} +=3D " \
     python3-requests (>=3D2.0.1) \
 "
diff --git a/meta-python/recipes-devtools/python/python3-requests-unixsoc=
ket_0.4.1.bb b/meta-python/recipes-devtools/python/python3-requests-unixs=
ocket_0.4.1.bb
index bf199e75b7f..9cad8044eec 100644
--- a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4=
.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4=
.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907=
fdace235a619d80314"
=20
 SRC_URI[sha256sum] =3D "b2596158c356ecee68d27ba469a52211230ac6fb0cde8b66=
afb19f0ed47a1995"
=20
-PYPI_PACKAGE =3D "requests_unixsocket"
-
 inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validato=
r_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validato=
r_0.1.1.bb
index 28904ef18d4..af7d9ff7153 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1=
.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1=
.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da21b13b5a996f0=
8f7e0b088aa38ce9c6"
=20
 SRC_URI[sha256sum] =3D "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449=
b145d533b240d055"
=20
-PYPI_PACKAGE =3D "rfc3986_validator"
-
 inherit pypi setuptools3
=20
 SRC_URI +=3D "\
diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.=
8.0.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.=
bb
index fa9761b72b9..eee904b34cb 100644
--- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://github.com/hamdanal/rich-argparse"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D06f5c372171ce02f7e6a18f5f57f0=
b69"
=20
-PYPI_PACKAGE =3D "rich_argparse"
-
 SRC_URI[sha256sum] =3D "679df3d832fa94ad6e4bdb07ded088cd7ea2dddc58ae9b2b=
46346a40b06cbc0c"
=20
 inherit pypi python_hatchling
diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.2=
0.3.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.=
bb
index a0b1eed56ec..94c2f0ffc48 100644
--- a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.20.3.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "223dd2cfba325ed55e94933b9e53f3aca=
13e9fdf76622bd564c18109a2
=20
 inherit pypi python_hatchling ptest-python-pytest
=20
-PYPI_PACKAGE =3D "rich_toolkit"
-
 RDEPENDS:${PN} =3D "\
     python3-click \
     python3-rich \
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-s=
eriallibrary_0.4.3.bb b/meta-python/recipes-devtools/python/python3-robot=
framework-seriallibrary_0.4.3.bb
index 4a8fcde41b7..9baf45e910e 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-serialli=
brary_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-serialli=
brary_0.4.3.bb
@@ -6,9 +6,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad407cda031a6=
aaf51a1fecaaa6e7d29"
 SRC_URI +=3D "file://0001-pyproject.toml-Replace-install_requires.patch"
 SRC_URI[sha256sum] =3D "f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06f6f09a03=
fa66bae54777e6bb"
=20
-
 inherit pypi python_poetry_core
=20
+PYPI_PACKAGE_SDIST =3D "robotframework-seriallibrary"
+
 RDEPENDS:${PN} +=3D " \
     python3-pyserial \
     python3-robotframework \
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-cor=
e_1.0.3.bb b/meta-python/recipes-devtools/python/python3-scikit-build-cor=
e_1.0.3.bb
index ff5e4c0da07..a3beddb07cb 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3=
.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3=
.bb
@@ -2,8 +2,6 @@ SUMMARY =3D "Build backend for CMake based projects"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b4e748e5f102e31c9390dcd6fa66=
f09"
=20
-PYPI_PACKAGE =3D "scikit_build_core"
-
 DEPENDS =3D "python3-hatch-vcs-native"
=20
 inherit pypi python_hatchling
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.1=
9.1.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.=
bb
index f10e27a049c..0e4a4030406 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c96d2b08b3cec=
6d3c67fb864d1fd8cc"
=20
 DEPENDS =3D "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-na=
tive"
=20
-PYPI_PACKAGE =3D "scikit_build"
-
 inherit pypi python_hatchling
=20
 SRC_URI[sha256sum] =3D "b9a8d07fca2d5d10d93220bc57a685161d72af1fc76285d5=
5c564ddaa862e584"
diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.=
0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
index 53664449632..a45f4543d6f 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
@@ -17,6 +17,4 @@ RDEPENDS:${PN} +=3D "\
=20
 SRC_URI[sha256sum] =3D "68be2c29e14ae310f8a39e1a79916b6d85c6cb41dcce789d=
14ff05fe293e4c55"
=20
-PYPI_PACKAGE =3D "sentry_sdk"
-
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-service-identity=
_26.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity=
_26.1.0.bb
index 4603f688bca..e09e2054741 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_26.1.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_26.1.0=
.bb
@@ -8,8 +8,6 @@ SRC_URI[sha256sum] =3D "6358c52882c96e66ac4a55eb3a72c7dd4=
a70763f8cc6fa4e70abde2656
=20
 inherit pypi python_hatchling ptest-python-pytest
=20
-PYPI_PACKAGE =3D "service_identity"
-
 DEPENDS +=3D "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-n=
ative"
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-decla=
rative-requirements_1.3.0.bb b/meta-python/recipes-devtools/python/python=
3-setuptools-declarative-requirements_1.3.0.bb
index 44a51b42fbf..1eec33bdfda 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-declarative-=
requirements_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-declarative-=
requirements_1.3.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "57a5b9bb9ad350c278e8aa6be4cdebbcd=
925b9ba71d6a712a178a618cf
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "setuptools-declarative-requirements"
+
 DEPENDS +=3D "python3-wheel-native"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-v=
ersioning_3.1.0.bb b/meta-python/recipes-devtools/python/python3-setuptoo=
ls-git-versioning_3.1.0.bb
index d39fefd7f0d..581b57c10be 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-git-versioni=
ng_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioni=
ng_3.1.0.bb
@@ -16,6 +16,4 @@ RDEPENDS:${PN} +=3D "python3-core python3-datetime pyth=
on3-logging \
 				   python3-packaging python3-pprint python3-setuptools \
 				   python3-tomllib"
=20
-PYPI_PACKAGE =3D "setuptools_git_versioning"
-
 BBCLASSEXTEND +=3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb b=
/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
index dcb9e64d61f..28f79351395 100644
--- a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D16e213d756=
41a392478df50cf0841903"
=20
 SRC_URI[sha256sum] =3D "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5=
f91a0075c6be7c0d"
=20
-PYPI_PACKAGE =3D "Sijax"
+PYPI_PACKAGE_SDIST =3D "Sijax"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb =
b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
index bd0979d0b4f..4a3e7bc8323 100644
--- a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] =3D "b6a107ab06206acc5359d4c5632bd9b22=
d448702a79b3169b0c62e0fb8
 inherit pypi setuptools3
=20
 PYPI_PACKAGE =3D "python-snappy"
+PYPI_PACKAGE_SDIST =3D "python-snappy"
=20
 RDEPENDS:${PN} +=3D "snappy"
diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.17.0.=
bb b/meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
index 1c635b51095..027b1b85dd2 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D42d0a9e728978f=
0eeb759c3be91536b8"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "python_socketio"
+PYPI_PACKAGE =3D "python-socketio"
=20
 SRC_URI[sha256sum] =3D "c3bbfc4937dcfea7c4d1b182afa94d4a30335d153987e8f2=
078b344beacf95a0"
=20
diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.=
1.3.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.=
bb
index 472113b059c..a2407d0ad4a 100644
--- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "5e2773233cedb5fa3d8120eb7f97bcc49=
74b5221b254d33ff16e2f1d41
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "speedtest-cli"
+
 RDEPENDS:${PN} +=3D " \
     python3-misc \
     python3-threading \
diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3=
.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
index c5667d34b72..b6f435946db 100644
--- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.3.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da3d6c15f78=
59ae235a78f2758e5a48cf"
=20
 DEPENDS =3D "python3-setuptools-scm-native"
=20
-PYPI_PACKAGE =3D "stack_data"
-
 inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.b=
b b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
index cbe7fcc2156..7dccd048c7a 100644
--- a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
+++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
@@ -9,6 +9,6 @@ DEPENDS =3D "python3-pytest-runner-native"
=20
 SRC_URI[sha256sum] =3D "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeac=
f3bcd80875c82eff"
=20
-PYPI_PACKAGE =3D "StrEnum"
+PYPI_PACKAGE_SDIST =3D "StrEnum"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b=
/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 269e175cc53..6ff74401d3f 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -3,8 +3,9 @@ HOMEPAGE =3D "https://github.com/systemd/python-systemd"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
-
 PYPI_PACKAGE =3D "systemd-python"
+PYPI_PACKAGE_SDIST =3D "systemd-python"
+
 SRC_URI:append:libc-musl =3D " file://0001-Provide-implementation-of-str=
ndupa-for-musl.patch"
 SRC_URI[sha256sum] =3D "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71=
c8c6b8008e695c0a"
=20
diff --git a/meta-python/recipes-devtools/python/python3-time-machine_3.2=
.0.bb b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
index 450214a7a4c..9b2dd8617d6 100644
--- a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
@@ -8,8 +8,6 @@ PYPI_SRC_URI =3D "git://github.com/adamchainz/time-machin=
e;protocol=3Dhttps;branch=3Dm
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
-PYPI_PACKAGE =3D "time_machine"
-
 RDEPENDS:${PN} +=3D "\
     python3-tzdata \
     python3-unittest \
diff --git a/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.=
0.bb b/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
index ec80ef8ed68..8507f497f05 100644
--- a/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
@@ -10,8 +10,6 @@ inherit pypi setuptools3 ptest-python-pytest
=20
 RDEPENDS:${PN} +=3D "python3-core"
=20
-PYPI_PACKAGE =3D "tokenize_rt"
-
 do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/testing/resources
     cp -rf ${S}/testing/resources/* ${D}${PTEST_PATH}/testing/resources/
diff --git a/meta-python/recipes-devtools/python/python3-trafaret-config_=
2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret-config_2.=
0.2.bb
index d7a987aa3bf..97f24f4d6d4 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.b=
b
+++ b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.b=
b
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "440b6b49e5e975f9a640a2519abb2fedd=
d96eb2aeb1715f87f947a7a07
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "trafaret-config"
+
 RDEPENDS:${PN} +=3D " \
     python3-trafaret \
     python3-pyyaml \
diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2=
.2.20260518.bb b/meta-python/recipes-devtools/python/python3-types-psutil=
_7.2.2.20260518.bb
index f7f3f8e758a..b56ef83775d 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.2026=
0518.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.2026=
0518.bb
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://github.com/python/typeshed"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dec038232ab86edd7354b091c54e19=
0e2"
=20
-PYPI_PACKAGE =3D "types_psutil"
-
 inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "9f825f631463a5b4d26f19f63aebc9ec25f01140d655026f=
3ad8a67841f9b331"
diff --git a/meta-python/recipes-devtools/python/python3-types-python-dat=
eutil_2.9.0.20241003.bb b/meta-python/recipes-devtools/python/python3-typ=
es-python-dateutil_2.9.0.20241003.bb
index 09d919dd822..17c710aeca0 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2=
.9.0.20241003.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2=
.9.0.20241003.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endli=
ne=3D6;md5=3Dc2d9643b4523fdf462
 SRC_URI[sha256sum] =3D "58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719=
bdbe6f3fb0317446"
=20
 inherit pypi setuptools3
+
+PYPI_PACKAGE_SDIST =3D "types-python-dateutil"
diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools=
_75.5.0.20241120.bb b/meta-python/recipes-devtools/python/python3-types-s=
etuptools_75.5.0.20241120.bb
index b9f35406bd0..41b1d0e2c0a 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0=
.20241120.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0=
.20241120.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endli=
ne=3D6;md5=3Dc2d9643b4523fdf462
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "types-setuptools"
+
 SRC_URI[sha256sum] =3D "d3c7e95b0598bf87fede29b3b57b19f5cdcd62a85b9298a7=
b30f8343f6f21c4f"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-typing-inspectio=
n_0.4.4.bb b/meta-python/recipes-devtools/python/python3-typing-inspectio=
n_0.4.4.bb
index 7694732817e..383a878ef54 100644
--- a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4=
.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4=
.bb
@@ -10,8 +10,6 @@ SRC_URI[sha256sum] =3D "547274fa6b0a561ccf549cc9524b999=
a578e737d015d8709d021f9d0d1
=20
 RDEPENDS:${PN}-ptest +=3D "python3-typing-extensions"
=20
-PYPI_PACKAGE =3D "typing_inspection"
-
 do_install_ptest:append() {
 	# test_literal_values_unhashable_type asserts that duplicate unhashable
 	# Literal values (e.g. Literal[[1, 'a'], [1, 'a']]) are preserved, but
diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python=
_2.8.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_=
2.8.0.bb
index e95e4bbfb05..7538e8a88ba 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.=
bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.=
bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "b801a83d6ed75e6df41e44518b4f2a9c2=
21dc2da4bcd5380e3a0feda52
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
+PYPI_PACKAGE_SDIST =3D "u-msgpack-python"
+
 do_install_ptest:append() {
        cp -f ${S}/test_umsgpack.py ${D}${PTEST_PATH}/
 }
diff --git a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb =
b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
index f63cbf22fcd..521f8c28227 100644
--- a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
@@ -7,6 +7,7 @@ SRC_URI +=3D "file://0001-Deal-with-64bit-time_t-default-=
on-32bit-architecture.pat
 SRC_URI[sha256sum] =3D "853697344b64df5537d4ae32ba6fbcf0515d51a9010910f5=
d5019959038b6eba"
=20
 PYPI_PACKAGE =3D "python-uinput"
+PYPI_PACKAGE_SDIST =3D "python-uinput"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.=
bb b/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
index ac94ae5cee5..9d3579c485e 100644
--- a/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unidecode_1.4.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 inherit pypi setuptools3 ptest
=20
-PYPI_PACKAGE =3D "Unidecode"
+PYPI_PACKAGE_SDIST =3D "Unidecode"
=20
 SRC_URI +=3D "file://run-ptest"
=20
diff --git a/meta-python/recipes-devtools/python/python3-uv-dynamic-versi=
oning_0.14.1.bb b/meta-python/recipes-devtools/python/python3-uv-dynamic-=
versioning_0.14.1.bb
index d3682f410aa..6faaa54f46f 100644
--- a/meta-python/recipes-devtools/python/python3-uv-dynamic-versioning_0=
.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uv-dynamic-versioning_0=
.14.1.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14d953809f6381=
e54162e13c2c846fbc"
=20
 SRC_URI[sha256sum] =3D "8642db686ce5c50417035e7a257ac73b7e5c3a7a32c33e45=
bd7e36ba22eeb648"
=20
-PYPI_PACKAGE =3D "uv_dynamic_versioning"
-
 inherit pypi python_hatchling
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-websocket-client=
_1.9.2.bb b/meta-python/recipes-devtools/python/python3-websocket-client_=
1.9.2.bb
index 202a0b0fcda..11ff96a7167 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.=
bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.9.2.=
bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D69c77173fe8892=
e9fdecd46557b957ad"
=20
 SRC_URI[sha256sum] =3D "0fcb57545848be86992e128218fd96dd87a6769ffdb1a968=
dff79632b85604d0"
=20
-PYPI_PACKAGE =3D "websocket_client"
-
 inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-python/recipes-devtools/python/python3-wheezy-template_=
3.2.5.bb b/meta-python/recipes-devtools/python/python3-wheezy-template_3.=
2.5.bb
index fab0d5106a6..08bb7ee9834 100644
--- a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.b=
b
+++ b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.b=
b
@@ -3,8 +3,6 @@ HOMEPAGE =3D "https://github.com/akornatskyy/wheezy.templ=
ate"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa10554c46b94944529c6a886cf85=
631"
=20
-PYPI_PACKAGE =3D "wheezy_template"
-
 SRC_URI[sha256sum] =3D "c7c0bf85af0f70ca2ef4b6ea9a74ef372f73392aa17bea0d=
885dcba7356d0867"
=20
 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0=
.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index 17149bbadb9..db4d8658003 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -8,8 +8,6 @@ SRC_URI[sha256sum] =3D "3ad0f40a696763bb0f4d4dec5b51f6b53=
ccfeb7c16ebb5897349303045
=20
 SRC_URI +=3D "file://0001-cli-drop-the-second-argument-from-click.argume=
nt-dec.patch"
=20
-PYPI_PACKAGE =3D "wpa_supplicant"
-
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D "python3-twisted python3-click python3-txdbus"
diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1=
.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
index eccdc83ca29..e3a8cab12e0 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da4bab8df34=
a9a138b4e0ca56b8559a05"
=20
 inherit pypi setuptools3
=20
-PYPI_PACKAGE =3D "XlsxWriter"
+PYPI_PACKAGE_SDIST =3D "XlsxWriter"
=20
 RDEPENDS:${PN} +=3D " \
 	python3-crypt \
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awe=
some_6.2.1.2.bb b/meta-python/recipes-devtools/python/python3-xstatic-fon=
t-awesome_6.2.1.2.bb
index 97e6dcd66f7..20634a1a2a3 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.=
2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.=
2.1.2.bb
@@ -4,8 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "CC-BY-4.0 AND MIT AND OFL-1.0"
 LIC_FILES_CHKSUM =3D "file://xstatic/pkg/font_awesome/data/LICENSE.txt;m=
d5=3D57f9201afe70f877988912a7b233de47"
=20
-PYPI_PACKAGE =3D "xstatic_font_awesome"
-
 SRC_URI[sha256sum] =3D "9f3cb2f038fad7d352722375d3f25af346da9ee093ed9dc2=
c8c46bd911ab1971"
=20
 DEPENDS +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb=
 b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
index ed73aa48b06..59e22b201ad 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D1418684272f85f400cebf1b1a2=
55c5cd"
=20
-PYPI_PACKAGE =3D "XStatic"
+PYPI_PACKAGE_SDIST =3D "XStatic"
=20
 SRC_URI +=3D "file://0001-remove-pkg_resources-import.patch"
 SRC_URI[sha256sum] =3D "402544cc9e179489441054f09c807804e115ea246907de87=
c0355fb4f5a31268"
diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb=
 b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
index 4d914c63e9a..1c378ec544b 100644
--- a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
@@ -6,5 +6,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D72092419572155ddc2
 SRC_URI[sha256sum] =3D "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda69=
55f96bb9b91e67cd"
=20
 PYPI_PACKAGE =3D "zope.event"
+PYPI_PACKAGE_SDIST =3D "zope.event"
=20
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.=
6.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
index 370e07889fb..06f3fe85ab7 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.6.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Interface definitions for Zope products"
 LICENSE =3D "ZPL-2.1"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e27=
a6966b2"
=20
-PYPI_PACKAGE =3D "zope_interface"
+PYPI_PACKAGE =3D "zope-interface"
=20
 inherit pypi python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/pytho=
n3-mlcommons-loadgen_6.0.17.bb b/meta-python/recipes-devtools/python3-mlc=
ommons-loadgen/python3-mlcommons-loadgen_6.0.17.bb
index c0db4dc8311..6ae25e76367 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlco=
mmons-loadgen_6.0.17.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlco=
mmons-loadgen_6.0.17.bb
@@ -18,8 +18,6 @@ SRC_URI +=3D " \
     file://source-date-epoch.patch \
 "
=20
-PYPI_PACKAGE =3D "mlcommons_loadgen"
-
 SRC_URI[sha256sum] =3D "a2e85d09e3cc0c606f89bfe1fbf97537c8b5b238ae0afbd9=
23ad9c710fcf2ca8"
=20
 # Because the pyproject.toml contains invalid requirements.
diff --git a/meta-python/recipes-devtools/python3-rouge-score/python3-rou=
ge-score_0.1.2.bb b/meta-python/recipes-devtools/python3-rouge-score/pyth=
on3-rouge-score_0.1.2.bb
index 246593df835..a30eb226913 100644
--- a/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-scor=
e_0.1.2.bb
+++ b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-scor=
e_0.1.2.bb
@@ -13,7 +13,5 @@ RDEPENDS:${PN} =3D "\
=20
 inherit setuptools3 pypi
=20
-PYPI_PACKAGE =3D "rouge_score"
-
 SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "c7d4da2683e68c9abf0135ef915d63a46643666f848e558a=
1b9f7ead17ff0f04"
diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-i=
mage_0.9.1.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gp=
t-image_0.9.1.bb
index b3c89e5588f..950b661d0e2 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.=
9.1.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.=
9.1.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd91d608dc8f123=
34a889700389229b7b"
=20
 DEPENDS +=3D "python3-pip"
=20
-PYPI_PACKAGE =3D "gpt_image"
-
 SRC_URI[sha256sum] =3D "07363562ec1cf5b50319ad0389486b576ed43c4682a16a82=
86822af9fd1f4594"
=20
 inherit pypi python3native python_setuptools_build_meta ptest-python-pyt=
est
diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.8.bb =
b/meta-python/recipes-networking/python/python3-ldap_3.4.8.bb
index d34a21ddba5..c501346d2de 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.8.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D36ce9d726d0321=
b73c1521704d07db1b"
=20
 DEPENDS =3D "python3 openldap cyrus-sasl python3-setuptools-scm-native"
=20
-PYPI_PACKAGE =3D "python_ldap"
+PYPI_PACKAGE =3D "python-ldap"
=20
 inherit pypi python_setuptools_build_meta
=20
--=20
2.43.0


