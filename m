Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D66C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 19:23:37 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.2981.1708370611023609687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 11:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J1cHeA3v;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso3875484a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 11:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708370610; x=1708975410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTL+3ZaAGjwVVMJ2+emsjMgw8I8EvudfBAuBp33R+Oc=;
        b=J1cHeA3vHI73B63eu3DLeeErBEuLgInZHM7nzZ6ADw9vOcf++8Nk1prbYT4ra3IhS4
         zocn30mfLlMoXJ8icerla6buvbo/GLNyL4wJgagmzmB/PgbsrqWnPj/APX++Qvr43yE6
         kS4MPbMXE0CAzxk4f1LydPQHMP9yG2WeuxLAeXpP4SWthoQAVgZbysz66tBM3+uY1cLl
         mjTsicP8nYCzEBxU+YESBaTTJX4CxmDH8OhFPIQJbVLU5wJ5y5QAwN4mNSvaguzbrV00
         lo2hKbIixLOuBTeGAyEdlnu3sdoDvNNohqkRKtpRBdubompSLBG2/ob7TCuGoVJWWtK+
         637Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708370610; x=1708975410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTL+3ZaAGjwVVMJ2+emsjMgw8I8EvudfBAuBp33R+Oc=;
        b=o5c47wIlEjwiRePI5UgNVvT7BJ0/XRTBdv+FKBK2UaLYUC6m3PK9AIQo3ZHvMKG29T
         ZhH8QOC20zmefTWAkcN9kX3yIJrgpPQIGxjQlVqIvplWbwiOOTGfPGsxUsQv0PV1b4yZ
         l+I5spcopQPs5HtIrrMYpnep6eroworV1+MK3YmSyvJ0yp5bG5jsKWjbQ9I8Tu17P4N0
         KjZCT/y9KUzsvxFczwn7YhOVHo48/Yb3wrObzJgsotirZR5PaZdngS3+qebAxeoAdRjX
         TOgMcRGhX3eKo0IrGJqGA6Pc0Tnz0f2qMKceaig83wFUelTVuVoXpvenqZhRSaaC6zLi
         5jeQ==
X-Gm-Message-State: AOJu0YyNWX3tUs+RUw3DzEzE+d7/dWYbLLpUX8mBhE0ggX4GYsKOBEdg
	E5X4BI+hzBi0ukvqhUlnDrIkX4NoXm4Yzj+inx3FQpmgSTLnoUA8mLAgeEV8
X-Google-Smtp-Source: AGHT+IE65g70Q7HAqZaQqLG7C8hqv9v2+dFJU+SkkUFGf6OkO2jV54oK0C82jPvpFUTG+Isy7LG6oQ==
X-Received: by 2002:a17:903:2350:b0:1db:fcc8:7d70 with SMTP id c16-20020a170903235000b001dbfcc87d70mr3036374plh.49.1708370609828;
        Mon, 19 Feb 2024 11:23:29 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id u10-20020a170903304a00b001d7222d8caasm4797723pla.50.2024.02.19.11.23.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 11:23:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/5] python: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 11:23:14 -0800
Message-Id: <cover.1708370337.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108879

python 2 is long unsupported, so we no longer need to carry around the
${PYTHON_PN} variable.

Clean house in all meta-openembedded/* usage.

The following changes since commit ae28f34aab8c7e32e610446fe82868dc020e088a:

  python3-meson-python: move to oe-core (2024-02-19 10:22:55 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/drop-PYTHON_PN
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/drop-PYTHON_PN

Tim Orling (5):
  meta-python: drop ${PYTHON_PN}
  meta-oe: drop ${PYTHON_PN}
  meta-filesystems: drop ${PYTHON_PN}
  meta-networking: drop ${PYTHON_PN}
  meta-gnome: drop ${PYTHON_PN}

 .../sshfs-fuse/sshfs-fuse_3.7.3.bb            |  2 +-
 .../recipes-support/fuse/fuse3_3.16.2.bb      |  2 +-
 .../gnome-shell/gnome-shell_45.3.bb           |  2 +-
 .../python/python3-scapy_2.5.0.bb             |  8 ++---
 .../isomd5sum/isomd5sum_1.2.4.bb              |  6 ++--
 .../libpwquality/libpwquality_1.4.5.bb        |  2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb     | 10 +++---
 meta-oe/recipes-extended/upm/upm_git.bb       | 10 +++---
 meta-oe/recipes-support/libiio/libiio_0.25.bb | 12 +++----
 .../recipes-support/libsoc/libsoc_0.8.2.bb    |  8 ++---
 meta-oe/recipes-support/pcp/pcp_6.0.5.bb      |  2 +-
 meta-python/classes/distutils3-base.bbclass   |  6 ++--
 meta-python/classes/distutils3.bbclass        |  8 ++---
 .../python-h2/python3-h2_4.1.0.bb             |  2 +-
 .../python-pyro4/python3-pyro4_4.82.bb        |  6 ++--
 .../python-jsonref/python3-jsonref_1.1.0.bb   | 10 +++---
 .../recipes-devtools/python/pyrtm_0.4.2.bb    |  8 ++---
 .../python/python-django-south.inc            |  2 +-
 .../recipes-devtools/python/python-django.inc | 30 ++++++++--------
 .../python/python-flask-bootstrap.inc         |  6 ++--
 .../python/python-flask-xstatic.inc           |  4 +--
 .../python/python3-aenum_3.1.15.bb            |  2 +-
 .../python/python3-aiodns_3.1.1.bb            |  4 +--
 .../python/python3-aiofiles_23.2.1.bb         |  2 +-
 .../python/python3-aiohttp-jinja2_1.6.bb      |  4 +--
 .../python/python3-aiohttp_3.9.3.bb           | 14 ++++----
 .../python/python3-aiohue_4.7.1.bb            |  8 ++---
 .../python/python3-aiosignal_1.3.1.bb         |  2 +-
 .../python/python3-alembic_1.13.1.bb          | 10 +++---
 .../python/python3-ansi2html_1.9.1.bb         |  6 ++--
 .../python/python3-argcomplete_3.2.2.bb       |  4 +--
 .../python/python3-arpeggio_2.0.2.bb          |  4 +--
 .../python/python3-arrow_1.3.0.bb             |  2 +-
 .../python/python3-astroid_3.0.3.bb           | 20 +++++------
 .../python/python3-asttokens_2.4.1.bb         |  2 +-
 .../python/python3-async-timeout_4.0.3.bb     |  2 +-
 .../python/python3-autobahn_23.6.2.bb         | 20 +++++------
 .../python/python3-automat_22.10.0.bb         |  6 ++--
 ...python3-aws-iot-device-sdk-python_1.5.2.bb | 18 +++++-----
 .../python/python3-beautifulsoup4_4.12.3.bb   | 10 +++---
 .../python/python3-behave_1.2.6.bb            |  6 ++--
 .../python/python3-bitstring_4.1.4.bb         |  8 ++---
 .../python/python3-brotli_1.1.0.bb            |  2 +-
 .../python/python3-cantools_39.4.4.bb         | 14 ++++----
 .../python/python3-cassandra-driver_3.29.0.bb | 16 ++++-----
 .../python/python3-casttube_0.2.0.bb          |  2 +-
 .../python3-charset-normalizer_3.3.2.bb       |  8 ++---
 .../python/python3-click-repl_0.3.0.bb        |  2 +-
 .../python/python3-cmd2_2.4.3.bb              | 18 +++++-----
 .../python/python3-colorama_0.4.6.bb          |  2 +-
 .../python/python3-colorclass_2.2.2.bb        |  2 +-
 .../python/python3-coloredlogs_15.0.1.bb      |  2 +-
 .../python/python3-configargparse_1.7.bb      |  8 ++---
 .../python/python3-constantly_23.10.4.bb      |  4 +--
 .../python/python3-crcmod_1.7.bb              |  2 +-
 .../python/python3-cytoolz_0.12.3.bb          |  4 +--
 .../python/python3-daemon_3.0.1.bb            |  8 ++---
 .../python/python3-dateutil_2.8.2.bb          | 10 +++---
 .../python/python3-decorator_5.1.1.bb         |  2 +-
 .../python/python3-deprecated_1.2.14.bb       |  2 +-
 .../python/python3-dill_0.3.8.bb              |  8 ++---
 .../python/python3-diskcache_5.6.3.bb         | 14 ++++----
 .../python/python3-distro_1.9.0.bb            |  8 ++---
 .../python/python3-django_4.2.10.bb           |  4 +--
 .../python/python3-django_5.0.2.bb            |  4 +--
 .../python3-djangorestframework_3.14.0.bb     |  2 +-
 .../python/python3-elementpath_4.3.0.bb       | 10 +++---
 .../python/python3-eth-account_0.11.0.bb      | 16 ++++-----
 .../python/python3-eth-hash_0.6.0.bb          |  4 +--
 .../python/python3-eth-rlp_1.0.1.bb           |  8 ++---
 .../python/python3-evdev_1.6.1.bb             | 10 +++---
 .../python/python3-eventlet_0.35.1.bb         |  6 ++--
 .../python/python3-fasteners_0.19.bb          |  4 +--
 .../python/python3-file-magic_0.4.1.bb        |  6 ++--
 .../python/python3-filelock_3.13.1.bb         |  2 +-
 .../python/python3-flask-babel_4.0.0.bb       |  6 ++--
 .../python/python3-flask-jsonpify_1.5.0.bb    |  2 +-
 .../python/python3-flask-jwt_0.3.2.bb         |  2 +-
 .../python/python3-flask-login_0.6.3.bb       |  2 +-
 .../python/python3-flask-migrate_4.0.5.bb     |  6 ++--
 .../python/python3-flask-nav_0.6.bb           |  4 +--
 .../python/python3-flask-pymongo_2.3.0.bb     |  4 +--
 .../python/python3-flask-restful_0.3.10.bb    |  2 +-
 .../python/python3-flask-socketio_5.3.6.bb    |  4 +--
 .../python/python3-flask-sqlalchemy_3.1.1.bb  |  2 +-
 .../python/python3-flask-uploads_0.2.1.bb     |  2 +-
 .../python/python3-flask-wtf_1.2.1.bb         |  8 ++---
 .../python/python3-flask_3.0.2.bb             | 12 +++----
 .../python/python3-frozenlist_1.4.1.bb        |  4 +--
 .../python/python3-gcovr_7.0.bb               |  2 +-
 .../python/python3-geomet_1.1.0.bb            | 12 +++----
 .../python/python3-gevent_24.2.1.bb           |  8 ++---
 .../python/python3-google-api-core_2.16.2.bb  | 22 ++++++------
 ...ython3-google-api-python-client_2.116.0.bb | 16 ++++-----
 .../python3-google-auth-oauthlib_1.2.0.bb     |  4 +--
 .../python/python3-google-auth_2.27.0.bb      | 24 ++++++-------
 ...python3-googleapis-common-protos_1.62.0.bb |  4 +--
 .../python/python3-graphviz_0.20.1.bb         |  2 +-
 .../python/python3-grpcio-tools_1.60.1.bb     |  4 +--
 .../python/python3-grpcio_1.60.1.bb           |  8 ++---
 .../python/python3-html5lib_1.1.bb            |  8 ++---
 .../python/python3-httplib2_0.22.0.bb         |  6 ++--
 .../python/python3-humanfriendly_10.0.bb      | 16 ++++-----
 .../python/python3-humanize_4.9.0.bb          |  8 ++---
 .../python/python3-hyperlink_21.0.0.bb        |  2 +-
 .../python/python3-ifaddr_0.2.0.bb            |  2 +-
 .../python/python3-imageio_2.34.0.bb          |  2 +-
 .../python/python3-incremental_22.10.0.bb     |  6 ++--
 .../python/python3-inflate64_1.0.0.bb         |  4 +--
 .../python/python3-ipython_8.21.0.bb          | 30 ++++++++--------
 .../python/python3-itsdangerous_2.1.2.bb      |  8 ++---
 .../python/python3-jdatetime_4.1.1.bb         |  2 +-
 .../python/python3-jdcal_1.4.1.bb             |  4 +--
 .../python/python3-jedi_0.19.1.bb             | 12 +++----
 .../python/python3-jsbeautifier_1.14.11.bb    |  6 ++--
 .../python/python3-jsmin_3.0.1.bb             |  2 +-
 .../python/python3-jsonpatch_1.33.bb          |  8 ++---
 .../python/python3-langtable_0.0.64.bb        |  8 ++---
 .../python3-lazy-object-proxy_1.10.0.bb       |  2 +-
 .../python/python3-lorem_0.1.1.bb             |  4 +--
 .../python/python3-luma-core_2.4.2.bb         |  6 ++--
 .../python/python3-luma-oled_3.13.0.bb        |  2 +-
 .../python/python3-m2crypto_0.40.1.bb         | 14 ++++----
 .../python/python3-mccabe_0.7.0.bb            |  2 +-
 .../python/python3-mpmath_1.3.0.bb            |  2 +-
 .../python/python3-msgpack_1.0.7.bb           |  4 +--
 .../python/python3-multivolumefile_0.2.3.bb   | 12 +++----
 .../python/python3-networkx_3.1.bb            | 20 +++++------
 .../python/python3-ninja_1.11.1.1.bb          |  2 +-
 .../python/python3-nmap_1.6.0.bb              |  6 ++--
 .../python/python3-nocasedict_2.0.1.bb        |  2 +-
 .../python/python3-nocaselist_2.0.0.bb        |  2 +-
 .../python/python3-ntplib_0.4.0.bb            |  2 +-
 .../python/python3-oauthlib_3.2.2.bb          | 10 +++---
 .../python/python3-obd_0.7.2.bb               |  2 +-
 .../python/python3-olefile_0.47.bb            |  6 ++--
 .../python/python3-openpyxl_3.1.2.bb          | 16 ++++-----
 .../python/python3-ordered-set_4.1.0.bb       |  2 +-
 .../python/python3-paho-mqtt_1.6.1.bb         | 14 ++++----
 .../python/python3-pandas_2.0.3.bb            | 18 +++++-----
 .../python/python3-parallax_1.0.6.bb          |  2 +-
 .../python/python3-parso_0.8.3.bb             |  6 ++--
 .../python/python3-passlib_1.7.4.bb           |  6 ++--
 .../python/python3-pdm_2.12.3.bb              |  2 +-
 .../python/python3-pep8_1.7.1.bb              |  6 ++--
 .../python/python3-periphery_2.4.1.bb         |  6 ++--
 .../python/python3-pexpect_4.9.0.bb           | 12 +++----
 .../python/python3-pid_3.0.4.bb               |  2 +-
 .../python/python3-pika_1.3.2.bb              | 10 +++---
 .../python/python3-pint_0.23.bb               |  6 ++--
 .../python/python3-pkgconfig_1.5.5.bb         |  2 +-
 .../python/python3-portion_2.4.2.bb           |  2 +-
 .../python/python3-progress_1.6.bb            |  4 +--
 .../python/python3-prompt-toolkit_3.0.43.bb   | 20 +++++------
 .../python/python3-protobuf_4.25.2.bb         | 16 ++++-----
 .../python/python3-py-ubjson_0.16.1.bb        |  2 +-
 .../python/python3-py7zr_0.20.8.bb            | 28 +++++++--------
 .../python/python3-pybcj_1.0.2.bb             | 14 ++++----
 .../python/python3-pybluez_0.23.bb            |  2 +-
 .../python/python3-pycares_4.4.0.bb           |  6 ++--
 .../python/python3-pychromecast_13.1.0.bb     | 14 ++++----
 .../python/python3-pyfirmata_1.1.0.bb         |  2 +-
 .../python/python3-pyhamcrest_2.1.0.bb        |  6 ++--
 .../python/python3-pymemcache_4.0.0.bb        | 10 +++---
 .../python/python3-pymetno_0.12.0.bb          |  6 ++--
 .../python/python3-pymisp_2.4.184.bb          | 14 ++++----
 .../python/python3-pymongo_4.6.1.bb           | 20 +++++------
 .../python/python3-pymysql_1.1.0.bb           |  2 +-
 .../python/python3-pynacl_1.5.0.bb            |  6 ++--
 .../python/python3-pyperclip_1.8.2.bb         |  2 +-
 .../python/python3-pyperf_2.6.2.bb            |  4 +--
 .../python/python3-pyppmd_1.1.0.bb            | 10 +++---
 .../python/python3-pyproject-api_1.6.1.bb     |  6 ++--
 .../python/python3-pysonos_0.0.54.bb          |  6 ++--
 .../python/python3-pystemd_0.13.2.bb          | 12 +++----
 .../python/python3-pytest-cov_4.1.0.bb        |  2 +-
 ...on3-pytest-helpers-namespace_2021.12.29.bb |  2 +-
 .../python/python3-pytest-html_4.1.1.bb       |  6 ++--
 .../python3-pytest-json-report_1.5.0.bb       |  6 ++--
 .../python/python3-pytest-metadata_2.0.2.bb   |  4 +--
 .../python3-pytest-tempdir_2019.10.12.bb      |  2 +-
 .../python/python3-pytest-timeout_2.2.0.bb    |  2 +-
 .../python/python3-pyu2f_0.1.5.bb             | 18 +++++-----
 .../python/python3-pyudev_0.24.1.bb           | 10 +++---
 .../python/python3-pyusb_1.2.1.bb             |  2 +-
 .../python/python3-rapidjson_1.14.bb          |  8 ++---
 .../python/python3-rarfile_4.1.bb             |  8 ++---
 .../python/python3-requests-oauthlib_1.3.1.bb |  2 +-
 .../python/python3-rlp_4.0.0.bb               |  4 +--
 ...hon3-robotframework-seriallibrary_0.4.3.bb |  4 +--
 .../python/python3-robotframework_7.0.bb      | 22 ++++++------
 .../python/python3-rsa_4.9.bb                 | 18 +++++-----
 .../python/python3-schedule_1.2.1.bb          |  2 +-
 .../python/python3-scikit-build_0.17.6.bb     | 12 +++----
 .../python/python3-screeninfo_0.8.1.bb        |  4 +--
 .../python/python3-sdbus_0.11.1.bb            |  6 ++--
 .../python/python3-sentry-sdk_1.40.0.bb       | 14 ++++----
 .../python/python3-sh_2.0.6.bb                | 24 ++++++-------
 .../python/python3-simplejson_3.19.2.bb       |  8 ++---
 .../python/python3-slip-dbus_0.6.5.bb         |  2 +-
 .../python/python3-smbus2_0.4.3.bb            |  4 +--
 .../python/python3-socketio_5.11.0.bb         | 22 ++++++------
 .../python/python3-stevedore_5.1.0.bb         |  4 +--
 .../python/python3-stopit_1.1.2.bb            |  2 +-
 .../python/python3-strenum_0.4.15.bb          |  2 +-
 .../python/python3-systemd_235.bb             |  2 +-
 .../python/python3-tabulate_0.9.0.bb          | 14 ++++----
 .../python/python3-telnetlib3_2.0.4.bb        |  2 +-
 .../python/python3-term_2.5.bb                |  2 +-
 .../python/python3-termcolor_2.4.0.bb         |  4 +--
 .../python/python3-tox_4.12.1.bb              | 24 ++++++-------
 .../python/python3-tqdm_4.66.1.bb             |  2 +-
 .../python/python3-trafaret-config_2.0.2.bb   |  4 +--
 .../python/python3-trafaret_2.1.1.bb          |  6 ++--
 .../python/python3-traitlets_5.14.1.bb        |  4 +--
 .../python/python3-twine_4.0.2.bb             |  4 +--
 .../python/python3-twisted_22.10.0.bb         | 30 ++++++++--------
 .../python/python3-twitter_4.14.0.bb          | 10 +++---
 .../python/python3-txaio_23.1.1.bb            |  2 +-
 .../python/python3-unoconv_0.9.0.bb           |  6 ++--
 .../python/python3-virtualenv_20.25.0.bb      |  8 ++---
 .../python/python3-watchdog_3.0.0.bb          | 10 +++---
 .../python/python3-web3_6.15.1.bb             | 28 +++++++--------
 .../python/python3-webargs_8.4.0.bb           | 12 +++----
 .../python/python3-webencodings_0.5.1.bb      |  4 +--
 .../python/python3-websocket-client_1.7.0.bb  |  4 +--
 .../python/python3-werkzeug_3.0.1.bb          | 10 +++---
 .../python/python3-wrapt_1.16.0.bb            |  4 +--
 .../python/python3-wtforms_3.1.2.bb           | 10 +++---
 .../python/python3-xmlschema_3.0.1.bb         |  6 ++--
 .../python/python3-xmodem_0.4.7.bb            |  2 +-
 .../python3-xstatic-font-awesome_6.2.1.1.bb   |  4 +--
 .../python/python3-xstatic_1.0.3.bb           |  2 +-
 .../python/python3-yamlloader_1.3.2.bb        |  2 +-
 .../python/python3-zeroconf_0.131.0.bb        |  6 ++--
 .../python/python3-zopeinterface_6.1.bb       |  2 +-
 .../python3-gspread/python3-gspread_6.0.1.bb  |  6 ++--
 .../python3-oauth2client_4.1.3.bb             | 10 +++---
 .../python-pyephem/python3-pyephem_4.1.5.bb   |  4 +--
 .../python-rich/python3-rich_13.7.0.bb        |  2 +-
 .../python3-portalocker_2.8.2.bb              |  4 +--
 .../pywbemtools/python3-pywbemtools_1.2.0.bb  | 36 +++++++++----------
 242 files changed, 878 insertions(+), 878 deletions(-)

-- 
2.34.1


