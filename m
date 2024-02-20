Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893FDC5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:10:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.6223.1708402241567110249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XyjyQZpA;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d751bc0c15so45760225ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708402240; x=1709007040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ta3TWklgt+vOf7sfO8qDELOBYiZVoVtv2Ix/9qTRdrs=;
        b=XyjyQZpAomQVMre4iTSAz7cilQ0r/iH/q6K4x+5+7xuZfqbh6fo44sYYjxRgUm73zD
         VpQ9bfyWqJqZY3+vh7YIxRioXfV3h/kLiIICzXVlxFYuQwSzgReqU9uvZsikWdixg7rq
         cS3Md6yN5KzpbJFMydw8cIl6n+4qy6gy6Zm9ZpB+pSsjUBP6avHSElc5k3WQTq4RLyUY
         2u52gd8rrrRyEV1ah4122ry5Q3TVjtLv9IVDcVDI0nTr9GD4NDOxMej3+Sfw23/w/vDw
         ZFqyc2KN7ksS6DuQ0urlDH/FM4UuuUt0FsMYdvhmJ6bJeNPMxrWZStVKyLDBTCCamSeQ
         zrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708402241; x=1709007041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ta3TWklgt+vOf7sfO8qDELOBYiZVoVtv2Ix/9qTRdrs=;
        b=u45H8dGhl08zUY71wxxD8BX9jndVgLmrJTwW4uucTI7iSDErUKjmvw27t5oPkFc+pL
         hBDSpPQdDwnRk+POwVXoP6EEs7Z7gsM+AvMHjYKzsJZMBblEN/La24tQRCIMbaX8XeCS
         SHenDv2MEgKGX4jwcZDMaOx/60jarMOK7OuJQT/WpjT8s6oTF0ejiErxhbn4Ee77XOl4
         bqQoKwuubjZ0sbLOt8RSxUKoDCKsxk4Kls/hV00CjIa++DE2Os9pxv02mZTCWGnlzRkp
         k7issf2e6VC8ZuhPwRhp6SDtUnLBx8wMnKSe2F5COJXofYZea9e3/i+He4MGo597yREc
         QQGg==
X-Gm-Message-State: AOJu0YzhSkNTlZr/ZrPe6kRqgPapIR4PO6TkjNPOJEDDPRMtDzhHCefY
	Hj7b0/5DLE9xNFahUCD4YqZPv5QH2hxKpk41QSV4OWF4a7N1d+00m3SvKLiU
X-Google-Smtp-Source: AGHT+IFm/QJ4UMjXstZuvlw5GaBW673chlY9/zL9aBTFiClR73DggNKGA5HRbrbmgSNsvAREWmzHsQ==
X-Received: by 2002:a17:902:ccc2:b0:1dc:128d:9edd with SMTP id z2-20020a170902ccc200b001dc128d9eddmr1493649ple.39.1708402239286;
        Mon, 19 Feb 2024 20:10:39 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001db45ab819asm5229733plc.106.2024.02.19.20.10.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:10:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 1/5] meta-python: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 20:10:24 -0800
Message-Id: <b526f6a241dcb655f2cfe7ad0dd7272dcf8bc571.1708401702.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708401702.git.tim.orling@konsulko.com>
References: <cover.1708401702.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108902

python 2 is long unsupported, so we no longer need this variable.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Rebase on top of master-next

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
 231 files changed, 846 insertions(+), 846 deletions(-)

diff --git a/meta-python/classes/distutils3-base.bbclass b/meta-python/classes/distutils3-base.bbclass
index 850c535bb1..4f13ea6fe7 100644
--- a/meta-python/classes/distutils3-base.bbclass
+++ b/meta-python/classes/distutils3-base.bbclass
@@ -1,6 +1,6 @@
-DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
-DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
-RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
+DEPENDS:append:class-target = " python3-native python3"
+DEPENDS:append:class-nativesdk = " python3-native python3"
+RDEPENDS:${PN} += "${@['', 'python3-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base python3native python3targetconfig
 
diff --git a/meta-python/classes/distutils3.bbclass b/meta-python/classes/distutils3.bbclass
index a6d8e8763f..909415efa0 100644
--- a/meta-python/classes/distutils3.bbclass
+++ b/meta-python/classes/distutils3.bbclass
@@ -27,9 +27,9 @@ distutils3_do_compile() {
         NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
         build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
+        bbfatal_log "'python3 setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
 
@@ -39,9 +39,9 @@ distutils3_do_install() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
         build --build-base=${B} install --skip-build ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
+        bbfatal_log "'python3 setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -exec grep -q ${D} {} \; \
diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
index c2d58846df..6b3ce25371 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "a83aca08fbe7aacb79fec788c9c0bac936343560ed9ec18b82a13a12c2
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe"
+RDEPENDS:${PN} += "python3-hpack python3-hyperframe"
diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
index a7ed75f018..c49e67c919 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "Pyro4"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-serpent \
-    ${PYTHON_PN}-threading \
+    python3-logging \
+    python3-serpent \
+    python3-threading \
     "
diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
index fae1da2686..4272fc4f24 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.bb
@@ -12,12 +12,12 @@ inherit pypi python_setuptools_build_meta
 BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS += " \
-    ${PYTHON_PN}-pdm-native \
-    ${PYTHON_PN}-pdm-backend-native \
+    python3-pdm-native \
+    python3-pdm-backend-native \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
+    python3-core \
+    python3-json \
+    python3-netclient \
 "
diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 9407586466..ed4e588509 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -20,9 +20,9 @@ FILES:${PN}-tests += " \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
+    python3-json \
+    python3-logging \
+    python3-netclient \
 "
 
 RDEPENDS:${PN}-samples += " \
@@ -31,5 +31,5 @@ RDEPENDS:${PN}-samples += " \
 
 RDEPENDS:${PN}-tests += " \
     ${PN} \
-    ${PYTHON_PN}-unittest \
+    python3-unittest \
 "
diff --git a/meta-python/recipes-devtools/python/python-django-south.inc b/meta-python/recipes-devtools/python/python-django-south.inc
index 4a376391aa..28eb84c563 100644
--- a/meta-python/recipes-devtools/python/python-django-south.inc
+++ b/meta-python/recipes-devtools/python/python-django-south.inc
@@ -13,5 +13,5 @@ inherit pypi
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-django \
+    python3-django \
     "
diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 11d5e63018..d9ab3fd21f 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -13,21 +13,21 @@ FILES:${PN} += "${datadir}/django"
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-xml \
+    python3-compression \
+    python3-ctypes \
+    python3-datetime \
+    python3-email \
+    python3-html \
+    python3-json \
+    python3-logging \
+    python3-multiprocessing \
+    python3-netserver \
+    python3-numbers \
+    python3-pkgutil \
+    python3-pytz \
+    python3-threading \
+    python3-unixadmin \
+    python3-xml \
 "
 
 CVE_PRODUCT = "django"
diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
index 1a729c975b..24c76ce942 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef
 PYPI_PACKAGE = "Flask-Bootstrap"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-dominate \
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-visitor \
+    python3-dominate \
+    python3-flask \
+    python3-visitor \
     "
diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic.inc b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
index 5f4e0858f8..8434d2610b 100644
--- a/meta-python/recipes-devtools/python/python-flask-xstatic.inc
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
@@ -11,6 +11,6 @@ SRC_URI += "file://remove-pip-requires.patch"
 PYPI_PACKAGE = "Flask-XStatic"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-xstatic \
+    python3-flask \
+    python3-xstatic \
     "
diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
index f9fdb6aeb6..3769be0d5d 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "8cbd76cd18c4f870ff39b24284d3ea028fbe8731a58df3aa581e434c57
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-	${PYTHON_PN}-pprint \
+	python3-pprint \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
index 02a0b4ea2c..ec7d62ee2c 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
@@ -11,8 +11,8 @@ PYPI_PACKAGE = "aiodns"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-pycares \
+    python3-asyncio \
+    python3-pycares \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb b/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
index 7992b00f3e..73dc17423e 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
@@ -11,5 +11,5 @@ PYPI_PACKAGE = "aiofiles"
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-asyncio \
+    python3-asyncio \
 "
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
index 694f577b06..df4a0adcaf 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "a3a7ff5264e5bca52e8ae547bbfd0761b72495230d438d05b6c0915be6
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-jinja2 \
-    ${PYTHON_PN}-aiohttp \
+    python3-jinja2 \
+    python3-aiohttp \
 "
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
index 99fb84cd51..2cdd352e59 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
@@ -10,11 +10,11 @@ PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-aiohappyeyeballs \
-    ${PYTHON_PN}-aiosignal \
-    ${PYTHON_PN}-async-timeout \
-    ${PYTHON_PN}-frozenlist \
-    ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-yarl \
-    ${PYTHON_PN}-aiodns \
+    python3-aiohappyeyeballs \
+    python3-aiosignal \
+    python3-async-timeout \
+    python3-frozenlist \
+    python3-multidict \
+    python3-yarl \
+    python3-aiodns \
 "
diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
index 4b5edffdb0..438c771dbc 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.1.bb
@@ -9,8 +9,8 @@ SRC_URI[sha256sum] = "29b5e5ae05938cac195b1969e70bd6ad4e4e2e105d0e565849803d2a99
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-aiohttp \
-	${PYTHON_PN}-asyncio-throttle \
-	${PYTHON_PN}-profile \
-        ${PYTHON_PN}-awesomeversion \
+	python3-aiohttp \
+	python3-asyncio-throttle \
+	python3-profile \
+        python3-awesomeversion \
 "
diff --git a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
index 1463287d0a..fd4ec767c0 100644
--- a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiosignal_1.3.1.bb
@@ -10,5 +10,5 @@ inherit pypi setuptools3
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} = "\
-	${PYTHON_PN}-frozenlist \
+	python3-frozenlist \
 "
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
index 2a9ac2c5d2..c4853c4437 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
@@ -9,11 +9,11 @@ SRC_URI[sha256sum] = "4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc
 PYPI_PACKAGE = "alembic"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-editor \
-    ${PYTHON_PN}-mako \
-    ${PYTHON_PN}-sqlalchemy \
-    ${PYTHON_PN}-misc \
+    python3-dateutil \
+    python3-editor \
+    python3-mako \
+    python3-sqlalchemy \
+    python3-misc \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
index e419fdcf18..6af8989177 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
@@ -10,10 +10,10 @@ SRC_URI[sha256sum] = "5c6837a13ecc1903aab7a545353312049dfedfe5105362ad3a8d9d2078
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-	${PYTHON_PN}-setuptools-scm-native \
+	python3-setuptools-scm-native \
 "
 
 RDEPENDS:${PN} = " \
-	${PYTHON_PN}-six \
-	${PYTHON_PN}-compression \
+	python3-six \
+	python3-compression \
 "
diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
index fffecf521d..90560fabe7 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE = "argcomplete"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
+    python3-core \
+    python3-io \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
index 1a48a88c29..3130e2cb96 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
@@ -10,8 +10,8 @@ inherit pypi setuptools3
 
 # setup.py of Arpeggio needs this.
 DEPENDS += "\
-    ${PYTHON_PN}-pytest-runner-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-pytest-runner-native \
+    python3-wheel-native \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
index ec49d04eb9..90ba5de96f 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
@@ -9,5 +9,5 @@ SRC_URI[sha256sum] = "d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4
 inherit setuptools3 pypi
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-dateutil \
+        python3-dateutil \
         "
diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
index 1b8787215d..b02b15113b 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
@@ -9,8 +9,8 @@ SRC_URI[sha256sum] = "4148645659b08b70d72460ed1921158027a9e53ae8b7234149b1400edd
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "\
-    ${PYTHON_PN}-pytest-runner-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-pytest-runner-native \
+    python3-wheel-native \
 "
 
 PACKAGES =+ "${PN}-tests"
@@ -21,17 +21,17 @@ FILES:${PN}-tests += " \
 "
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-lazy-object-proxy \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-wrapt \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-typing-extensions \
+    python3-lazy-object-proxy \
+    python3-logging \
+    python3-six \
+    python3-wrapt \
+    python3-setuptools \
+    python3-typing-extensions \
 "
 
 RDEPENDS:${PN}-tests:class-target += "\
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-xml \
+    python3-unittest \
+    python3-xml \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
index 5cc4291f78..dbb2fc0ebe 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "b03869718ba9a6eb027e134bfdf69f38a236d681c83c160d510768af11
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-six \
+	python3-six \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
index c16dfd0bf8..3d35780b65 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
@@ -14,5 +14,5 @@ PYPI_PACKAGE = "async-timeout"
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-asyncio \
+    python3-asyncio \
 "
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
index 42a8e0e7b5..d9cc40b1b4 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
@@ -8,14 +8,14 @@ SRC_URI[sha256sum] = "ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad696
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-twisted \
-    ${PYTHON_PN}-zopeinterface \
-    ${PYTHON_PN}-py-ubjson \
-    ${PYTHON_PN}-cbor2 \
-    ${PYTHON_PN}-u-msgpack-python \
-    ${PYTHON_PN}-lz4 \
-    ${PYTHON_PN}-snappy \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-txaio \
-    ${PYTHON_PN}-six \
+    python3-twisted \
+    python3-zopeinterface \
+    python3-py-ubjson \
+    python3-cbor2 \
+    python3-u-msgpack-python \
+    python3-lz4 \
+    python3-snappy \
+    python3-pyopenssl \
+    python3-txaio \
+    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb b/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
index bb29fbd4a6..9e33fe7831 100644
--- a/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
 SRC_URI[sha256sum] = "e56beb84edad19dcc11d30e8d9b895f75deeb5ef5e96b84a467066b3b84bb04e"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 PYPI_PACKAGE = "Automat"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-   ${PYTHON_PN}-attrs \
-   ${PYTHON_PN}-six \
+   python3-attrs \
+   python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
index 35d061f5e6..bdadf7c774 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
@@ -27,15 +27,15 @@ do_install:append() {
 PACKAGES =+ "${PN}-examples"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
+    python3-crypt \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-math \
+    python3-netclient \
+    python3-numbers \
+    python3-threading \
 "
 RDEPENDS:${PN}-examples += "${PN}"
 
diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
index 6283098773..14dedba922 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
@@ -8,11 +8,11 @@ SRC_URI[sha256sum] = "74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-html5lib \
-    ${PYTHON_PN}-lxml \
-    ${PYTHON_PN}-soupsieve \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-logging \
+    python3-html5lib \
+    python3-lxml \
+    python3-soupsieve \
+    python3-html \
+    python3-logging \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index 1dcc7d218e..da4f3047f9 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-parse-type \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
+    python3-parse-type \
+    python3-setuptools \
+    python3-six \
     "
diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
index 6fc2cf4809..0777b6cffb 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
@@ -10,10 +10,10 @@ PYPI_PACKAGE = "bitstring"
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-mmap \
-    ${PYTHON_PN}-numbers \
+    python3-core \
+    python3-io \
+    python3-mmap \
+    python3-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
index 0f639f33e7..678f12b730 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
-  ${PYTHON_PN}-cffi \
+  python3-cffi \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
index c8b8d1dfbf..ebae6b63e6 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
@@ -12,13 +12,13 @@ inherit pypi python_poetry_core
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-can \
-    ${PYTHON_PN}-bitstruct \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-textparser \
-    ${PYTHON_PN}-typing-extensions \
-    ${PYTHON_PN}-diskcache \
-    ${PYTHON_PN}-asyncio \
+    python3-can \
+    python3-bitstruct \
+    python3-core \
+    python3-textparser \
+    python3-typing-extensions \
+    python3-diskcache \
+    python3-asyncio \
 "
 
 CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
index 8ec87fa26a..b8565d17e8 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
@@ -13,16 +13,16 @@ SRC_URI[sha256sum] = "0a34f9534356e5fd33af8cdda109d5e945b6335cb50399b267c46368c4
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-cython \
-    ${PYTHON_PN}-geomet \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
+    python3-cython \
+    python3-geomet \
+    python3-json \
+    python3-misc \
+    python3-multiprocessing \
+    python3-numbers \
+    python3-six \
     libevent \
 "
 
 DEPENDS += "\
-    ${PYTHON_PN}-cython \
+    python3-cython \
 "
diff --git a/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb b/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
index 408dff87bf..64948d2e9d 100644
--- a/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
@@ -9,5 +9,5 @@ SRC_URI[sha256sum] = "f25b3c634efe702896233690f7590e8d6311590910f18dbb763b90419d
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-requests \
+    python3-requests \
 "
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
index 666cb5dc3a..0e6d62fc2b 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-logging \
-	${PYTHON_PN}-codecs \
-	${PYTHON_PN}-json \
+	python3-core \
+	python3-logging \
+	python3-codecs \
+	python3-json \
 "
diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
index 33e42cb3b8..b773ed6b8b 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "17849c23dba3d667247dc4defe1757fff98694e90fe37474f3feebb69c
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-click ${PYTHON_PN}-prompt-toolkit"
+RDEPENDS:${PN} = "python3-click python3-prompt-toolkit"
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
index 29d790b94f..3d37e8b3c7 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
@@ -3,21 +3,21 @@ HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fad7740aa21780c8b9a214f5b320b4ad"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 SRC_URI[sha256sum] = "71873c11f72bd19e2b1db578214716f0d4f7c8fa250093c601265a9a717dee52"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-colorama \
-    ${PYTHON_PN}-pyperclip \
-    ${PYTHON_PN}-wcwidth \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-pydoc \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-numbers \
+    python3-attrs \
+    python3-colorama \
+    python3-pyperclip \
+    python3-wcwidth \
+    python3-compression \
+    python3-pydoc \
+    python3-json \
+    python3-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
index 52e1e68b1b..0f364c424d 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
 
 DEPENDS += " \
-	${PYTHON_PN}-hatchling-native \
+	python3-hatchling-native \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
index 00c2c4e92b..ff72f4c2f6 100644
--- a/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorclass_2.2.2.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "6d4fe287766166a98ca7bc6f6312daf04a0481b1eda43e7173484051c0
 PYPI_PACKAGE="colorclass"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-ctypes \
+    python3-ctypes \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
index d17ab87525..31f75eef62 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
@@ -13,7 +13,7 @@ do_install:append() {
 }
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-humanfriendly \
+    python3-humanfriendly \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
index 2eab701c8a..1c49d891d2 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
@@ -10,12 +10,12 @@ PYPI_PACKAGE = "ConfigArgParse"
 inherit pypi setuptools3
 
 PACKAGECONFIG ?= "yaml"
-PACKAGECONFIG[yaml] = ",,,${PYTHON_PN}-pyyaml"
+PACKAGECONFIG[yaml] = ",,,python3-pyyaml"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-json \
+    python3-core \
+    python3-shell \
+    python3-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
index cb6ca0a82d..2df501aaa6 100644
--- a/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
@@ -7,6 +7,6 @@ SRC_URI[sha256sum] = "aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0efd050b7f
 
 inherit pypi python_poetry_core 
 
-DEPENDS += "${PYTHON_PN}-versioneer-native"
+DEPENDS += "python3-versioneer-native"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-json"
+RDEPENDS:${PN} += "python3-json"
diff --git a/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
index f8f1683601..11d36b53ec 100644
--- a/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f2
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-unittest"
+RDEPENDS:${PN} += "python3-unittest"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
index 6c35ad5807..f9c9704d7f 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
@@ -9,5 +9,5 @@ SRC_URI[sha256sum] = "4503dc59f4ced53a54643272c61dc305d1dbbfbd7d6bdf296948de9f34
 
 inherit pypi setuptools3
 
-DEPENDS += "${PYTHON_PN}-cython-native"
-RDEPENDS:${PN} += "${PYTHON_PN}-toolz"
+DEPENDS += "python3-cython-native"
+RDEPENDS:${PN} += "python3-toolz"
diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
index 79507bdce2..715d3bf120 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
 HOMEPAGE = "https://pagure.io/python-daemon/"
 SECTION = "devel/python"
 
-DEPENDS += "${PYTHON_PN}-docutils-native"
-RDEPENDS:${PN} = "${PYTHON_PN}-docutils \
-                  ${PYTHON_PN}-lockfile (>= 0.10) \
-                  ${PYTHON_PN}-resource \
+DEPENDS += "python3-docutils-native"
+RDEPENDS:${PN} = "python3-docutils \
+                  python3-lockfile (>= 0.10) \
+                  python3-resource \
 "
 
 LICENSE = "Apache-2.0 & GPL-3.0-only"
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
index e281f0f285..c8e8a45c98 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
@@ -13,13 +13,13 @@ inherit pypi python_setuptools_build_meta
 PACKAGES =+ "${PN}-zoneinfo"
 FILES:${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
+    python3-datetime \
+    python3-numbers \
+    python3-six \
+    python3-stringold \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb b/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
index c9c6f9a62e..6d5cafb1d5 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.1.1.bb
@@ -14,5 +14,5 @@ SRC_URI[sha256sum] = "637996211036b6385ef91435e4fae22989472f9d571faba8927ba8253a
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-stringold \
+    python3-stringold \
     "
diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb b/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
index 4b5c78fb03..49d5f01c8f 100644
--- a/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
@@ -9,5 +9,5 @@ SRC_URI[sha256sum] = "e5323eb936458dccc2582dc6f9c322c852a775a27065ff2b0c4970b9d5
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-wrapt \
+	python3-wrapt \
 "
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
index 4ea5aa04a4..04e7f4bfb8 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
@@ -10,10 +10,10 @@ inherit pypi setuptools3
 PYPI_PACKAGE_EXT = "tar.gz"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-profile \
-    ${PYTHON_PN}-core \
+    python3-multiprocessing \
+    python3-logging \
+    python3-profile \
+    python3-core \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
index 8bc498dc4e..09b06553df 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
@@ -10,13 +10,13 @@ PYPI_PACKAGE = "diskcache"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-sqlite3 \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-threading \
+    python3-json \
+    python3-pickle \
+    python3-sqlite3 \
+    python3-core \
+    python3-io \
+    python3-compression \
+    python3-threading \
 "
 
 CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb b/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
index a342432a6b..08a9526783 100644
--- a/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
@@ -10,10 +10,10 @@ SRC_URI[sha256sum] = "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "\
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-json \
-	${PYTHON_PN}-logging \
-	${PYTHON_PN}-shell \
+	python3-core \
+	python3-json \
+	python3-logging \
+	python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.10.bb b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
index 45de692356..c78c8aab5e 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
@@ -4,8 +4,8 @@ inherit setuptools3
 SRC_URI[sha256sum] = "b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-    ${PYTHON_PN}-asgiref \
+    python3-sqlparse \
+    python3-asgiref \
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.2.bb b/meta-python/recipes-devtools/python/python3-django_5.0.2.bb
index 318b624082..3f61dabe07 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.2.bb
@@ -4,6 +4,6 @@ inherit setuptools3
 SRC_URI[sha256sum] = "b5bb1d11b2518a5f91372a282f24662f58f66749666b0a286ab057029f728080"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-    ${PYTHON_PN}-asgiref \
+    python3-sqlparse \
+    python3-asgiref \
 "
diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
index fee8a3a029..c39f37f7e6 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
@@ -12,5 +12,5 @@ PYPI_PACKAGE = "djangorestframework"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-django \
+    python3-django \
 "
diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
index a61ec646f8..3e7f70f04f 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
@@ -9,11 +9,11 @@ PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-stringold \
+    python3-xml \
+    python3-core \
+    python3-numbers \
+    python3-datetime \
+    python3-stringold \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb
index 84c270df64..ce48d9dcf9 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb
@@ -9,12 +9,12 @@ SRC_URI[sha256sum] = "2ffc7a0c7538053a06a7d11495c16c7ad9897dd42be0f64ca7551e9f6e
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-bitarray \
-    ${PYTHON_PN}-eth-abi \
-    ${PYTHON_PN}-eth-keyfile \
-    ${PYTHON_PN}-eth-keys \
-    ${PYTHON_PN}-eth-rlp \
-    ${PYTHON_PN}-eth-utils \
-    ${PYTHON_PN}-hexbytes \
-    ${PYTHON_PN}-rlp \
+    python3-bitarray \
+    python3-eth-abi \
+    python3-eth-keyfile \
+    python3-eth-keys \
+    python3-eth-rlp \
+    python3-eth-utils \
+    python3-hexbytes \
+    python3-rlp \
 "
diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
index 77e6565272..8464dbe403 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.6.0.bb
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "ae72889e60db6acbb3872c288cfa02ed157f4c27630fcd7f9c8442302c
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
-	${PYTHON_PN}-logging \
-	${PYTHON_PN}-pycryptodome \
+	python3-logging \
+	python3-pycryptodome \
 "
diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
index 243f75f5b6..7ee20b9b2b 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_1.0.1.bb
@@ -9,8 +9,8 @@ SRC_URI[sha256sum] = "d61dbda892ee1220f28fb3663c08f6383c305db9f1f5624dc585c9cd05
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
-    ${PYTHON_PN}-eth-utils \
-    ${PYTHON_PN}-hexbytes \
-    ${PYTHON_PN}-rlp \
-    ${PYTHON_PN}-typing-extensions \
+    python3-eth-utils \
+    python3-hexbytes \
+    python3-rlp \
+    python3-typing-extensions \
 "
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
index c091040c5d..be6f9611e7 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
@@ -14,9 +14,9 @@ do_compile:prepend() {
 SETUPTOOLS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
+    python3-ctypes \
+    python3-fcntl \
+    python3-io \
+    python3-shell \
+    python3-stringold \
     "
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
index c1d10eca3f..eb7f76b096 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "3b2eede94d64538cb894eec50302a881e056ed7e057f0e24fb45b28a19
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-dnspython \
-	${PYTHON_PN}-six \
-	${PYTHON_PN}-greenlet \
+	python3-dnspython \
+	python3-six \
+	python3-greenlet \
 "
diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
index a4fece023b..22e58c5668 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.19.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "b4f37c3ac52d8a445af3a66bce57b33b5e90b97c696b7b984f530cf8f0
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
-	${PYTHON_PN}-logging \
-	${PYTHON_PN}-fcntl \
+	python3-logging \
+	python3-fcntl \
 "
diff --git a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
index 837edf7df7..5289ad3745 100644
--- a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
@@ -13,9 +13,9 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     file \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-threading \
+    python3-core \
+    python3-ctypes \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb b/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
index 444c484412..ab0b114e43 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
@@ -12,5 +12,5 @@ BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
 DEPENDS += "\
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-hatch-vcs-native \
 "
diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
index 4d8aee532c..b445ec0e1c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "flask_babel"
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-speaklater \
-    ${PYTHON_PN}-babel \
-    ${PYTHON_PN}-flask \
+    python3-speaklater \
+    python3-babel \
+    python3-flask \
     "
diff --git a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
index 68eb2cefe7..76c6fb7731 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529bce943817e2
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-flask"
+RDEPENDS:${PN} += "python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
index f2eb34d0f7..35bcbc00ae 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d32
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pyjwt ${PYTHON_PN}-flask"
+RDEPENDS:${PN} += "python3-pyjwt python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
index 458ba46b2b..d990d4e80b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
@@ -12,4 +12,4 @@ PYPI_PACKAGE = "Flask-Login"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target = "${PYTHON_PN}-flask"
+RDEPENDS:${PN}:class-target = "python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
index 13f4e0f5a7..87553c17e3 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "Flask-Migrate"
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-flask-sqlalchemy \
-    ${PYTHON_PN}-alembic \
-    ${PYTHON_PN}-flask \
+    python3-flask-sqlalchemy \
+    python3-alembic \
+    python3-flask \
     "
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
index d7edba25c1..3855909fbc 100644
--- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "flask-nav"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-blinker \
-    ${PYTHON_PN}-flask \
+    python3-blinker \
+    python3-flask \
     "
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
index a995a2ea39..1cd4a4b699 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
@@ -12,6 +12,6 @@ PYPI_PACKAGE = "Flask-PyMongo"
 
 inherit pypi setuptools3
 
-DEPENDS = "${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native"
+DEPENDS = "python3-vcversioner python3-vcversioner-native"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "python3-pymongo python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
index 7d5f1ea41d..8ea455c633 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-RESTful"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
index e151fda9d5..6b76e03f8d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
@@ -12,6 +12,6 @@ PYPI_PACKAGE = "Flask-SocketIO"
 SRC_URI[sha256sum] = "bb8f9f9123ef47632f5ce57a33514b0c0023ec3696b2384457f0fcaa5b70501c"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-socketio \
+    python3-flask \
+    python3-socketio \
     "
diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
index 56f63bf036..f5fe1cc446 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_3.1.1.bb
@@ -10,4 +10,4 @@ UPSTREAM_CHECK_REGEX = "/Flask-SQLAlchemy/(?P<pver>(\d+[\.\-_]*)+)"
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "python3-sqlalchemy python3-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
index 388e257a8b..9ac321dec7 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -10,5 +10,5 @@ PYPI_PACKAGE = "Flask-Uploads"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-flask \
+    python3-flask \
     "
diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
index 973bb570b8..509be463f8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
@@ -11,8 +11,8 @@ UPSTREAM_CHECK_REGEX = "/Flask-WTF/(?P<pver>(\d+[\.\-_]*)+)"
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-itsdangerous \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-wtforms \
+    python3-flask \
+    python3-itsdangerous \
+    python3-json \
+    python3-wtforms \
 "
diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
index 7692eb116b..300ca99ddc 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
@@ -16,10 +16,10 @@ inherit pypi python_setuptools_build_meta
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} = " \
-    ${PYTHON_PN}-blinker \
-    ${PYTHON_PN}-click \
-    ${PYTHON_PN}-itsdangerous \
-    ${PYTHON_PN}-jinja2 \
-    ${PYTHON_PN}-profile \
-    ${PYTHON_PN}-werkzeug \
+    python3-blinker \
+    python3-click \
+    python3-itsdangerous \
+    python3-jinja2 \
+    python3-profile \
+    python3-werkzeug \
 "
diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
index 1ce5c84527..4288f2922e 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-    ${PYTHON_PN}-expandvars-native \
-    ${PYTHON_PN}-cython-native \
+    python3-expandvars-native \
+    python3-cython-native \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb b/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
index 6e5899ae23..1a81a38b0f 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
@@ -12,6 +12,6 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 PIP_INSTALL_PACKAGE = "gcovr"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-setuptools ${PYTHON_PN}-pygments ${PYTHON_PN}-multiprocessing"
+RDEPENDS:${PN} += "python3-jinja2 python3-lxml python3-setuptools python3-pygments python3-multiprocessing"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
index 72b2bbcb76..bdf4fc5386 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
@@ -16,10 +16,10 @@ inherit setuptools3
 PIP_INSTALL_PACKAGE = "geomet"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-click \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-six \
+    python3-click \
+    python3-core \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
index ebde34d562..0de0ef8cf7 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
@@ -4,11 +4,11 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
-DEPENDS += "${PYTHON_PN}-greenlet libev libuv c-ares python3-cython-native"
+DEPENDS += "python3-greenlet libev libuv c-ares python3-cython-native"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
-		  ${PYTHON_PN}-mime \
-		  ${PYTHON_PN}-pprint \
+RDEPENDS:${PN} = "python3-greenlet \
+		  python3-mime \
+		  python3-pprint \
 		 "
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
index 4d13b2e78e..ecb15ba3c5 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
@@ -8,18 +8,18 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "032d37b45d1d6bdaf68fb11ff621e2593263a239fa9246e2e94325f9c47876d2"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
+    python3-asyncio \
+    python3-datetime \
+    python3-logging \
+    python3-math \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-googleapis-common-protos \
-    ${PYTHON_PN}-google-auth \
-    ${PYTHON_PN}-grpcio \
-    ${PYTHON_PN}-protobuf \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-requests \
-    ${PYTHON_PN}-six \
+    python3-googleapis-common-protos \
+    python3-google-auth \
+    python3-grpcio \
+    python3-protobuf \
+    python3-pytz \
+    python3-requests \
+    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
index e4de12baec..237c4d238b 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
@@ -9,12 +9,12 @@ SRC_URI[sha256sum] = "f9f32361e16114d62929638fe07f77be30216b079ad316dc2ced859d9f
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-httplib2 \
-    ${PYTHON_PN}-uritemplate \
-    ${PYTHON_PN}-google-api-core \
+    python3-logging \
+    python3-six \
+    python3-json \
+    python3-core \
+    python3-netclient \
+    python3-httplib2 \
+    python3-uritemplate \
+    python3-google-api-core \
 "
diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
index b1e89e4b44..5c071ac413 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "292d2d3783349f2b0734a0a0207b1e1e322ac193c2c09d8f7c613fb7cc
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
-    ${PYTHON_PN}-google-auth \
-    ${PYTHON_PN}-requests-oauthlib \
+    python3-google-auth \
+    python3-requests-oauthlib \
 "
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
index 45098e6628..79c9291a19 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
@@ -8,19 +8,19 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "e863a56ccc2d8efa83df7a80272601e43487fa9a728a376205c86c26aaefa821"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
+    python3-asyncio \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-numbers \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-aiohttp \
-    ${PYTHON_PN}-cachetools \
-    ${PYTHON_PN}-pyasn1-modules \
-    ${PYTHON_PN}-rsa \
-    ${PYTHON_PN}-six \
+    python3-aiohttp \
+    python3-cachetools \
+    python3-pyasn1-modules \
+    python3-rsa \
+    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
index 1536ba5e0d..5df1210dab 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.62.0.bb
@@ -8,6 +8,6 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "83f0ece9f94e5672cced82f592d2a5edf527a96ed1794f0bab36d5735c996277"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-grpcio \
-    ${PYTHON_PN}-protobuf \
+    python3-grpcio \
+    python3-protobuf \
 "
diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
index 506c738133..d381699a89 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.20.1.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE_EXT = "zip"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-logging \
+    python3-logging \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
index 0ec9d95a47..07f5fe4c2a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62
 
 inherit pypi setuptools3
 
-DEPENDS += "${PYTHON_PN}-grpcio"
+DEPENDS += "python3-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
 SRC_URI[sha256sum] = "da08224ab8675c6d464b988bd8ca02cccd2bf0275bceefe8f6219bfd4a4f5e85"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
+RDEPENDS:${PN} = "python3-grpcio"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
index 6bcb31656c..b00f8681c5 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS += "${PYTHON_PN}-protobuf"
+DEPENDS += "python3-protobuf"
 
 SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
@@ -12,9 +12,9 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            "
 SRC_URI[sha256sum] = "dd1d3a8d1d2e50ad9b59e10aa7f07c7d1be2b367f3f2d33c5fade96ed5460962"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
-                  ${PYTHON_PN}-setuptools \
-                  ${PYTHON_PN}-six \
+RDEPENDS:${PN} = "python3-protobuf \
+                  python3-setuptools \
+                  python3-six \
 "
 
 inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index ee44e837e1..d6272a07c3 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -8,10 +8,10 @@ SRC_URI[sha256sum] = "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c1
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-lxml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-webencodings \
-    ${PYTHON_PN}-xml \
+    python3-lxml \
+    python3-six \
+    python3-webencodings \
+    python3-xml \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
index 9614de920e..9318ad9182 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "d7a10bc5ef5ab08322488bde8c726eeee5c8618723fdb399597ec58f3d
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pyparsing \
+    python3-compression \
+    python3-netclient \
+    python3-pyparsing \
 "
diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
index 7d185989d9..b32fe2e1d0 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
@@ -11,14 +11,14 @@ SRC_URI[sha256sum] = "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
+    python3-datetime \
+    python3-fcntl \
+    python3-io \
+    python3-logging \
+    python3-math \
+    python3-numbers \
+    python3-shell \
+    python3-stringold \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
index d74070876d..da1eea4cf7 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
@@ -10,13 +10,13 @@ SRC_URI[sha256sum] = "582a265c931c683a7e9b8ed9559089dea7edcf6cc95be39a3cbc2c5d5a
 inherit pypi python_hatchling
 
 DEPENDS += "\
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-setuptools-scm-native \
+    python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-setuptools \
+    python3-datetime \
+    python3-setuptools \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
index 7cdecf1094..a3fae39c7f 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "427af957daa58bc909471c6c40f74c5450fa123dd093fc53efd2e91d27
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna"
+RDEPENDS:${PN} += "python3-stringold python3-netclient python3-idna"
 
 PACKAGES =. "${PN}-test "
 
diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.2.0.bb
index 6c97c374e0..371bbf2ab5 100644
--- a/meta-python/recipes-devtools/python/python3-ifaddr_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.2.0.bb
@@ -10,5 +10,5 @@ SRC_URI[sha256sum] = "cc0cbfcaabf765d44595825fb96a99bb12c79716b73b44330ea38ee2b0
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-ctypes \
+    python3-ctypes \
 "
diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
index 8653983ca7..e38d694408 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "ae9732e10acf807a22c389aef193f42215718e16bd06eed0c5bb57e103
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-numpy ${PYTHON_PN}-pillow"
+RDEPENDS:${PN} = "python3-numpy python3-pillow"
diff --git a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
index 016bafc134..3d93cc05e9 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
@@ -8,12 +8,12 @@ SRC_URI[sha256sum] = "912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c2
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-twisted \
-    ${PYTHON_PN}-click \
+    python3-twisted \
+    python3-click \
 "
 
 # -native is needed to build python[3]-twisted, however, we need to take steps to
 # prevent a circular dependency. The build apparently does not use the part of
 # python-incremental which uses python-twisted, so this hack is OK.
-RDEPENDS:${PYTHON_PN}-incremental-native:remove = "${PYTHON_PN}-twisted-native"
+RDEPENDS:python3-incremental-native:remove = "python3-twisted-native"
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
index d3b557406c..2ccc98e36b 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
@@ -11,6 +11,6 @@ SRC_URI[sha256sum] = "3278827b803cf006a1df251f3e13374c7d26db779e5a33329cc11789b8
 PYPI_PACKAGE = "inflate64"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-importlib-metadata \
+    python3-core \
+    python3-importlib-metadata \
 "
diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
index 86e4c6454f..7f5dde768f 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
@@ -8,21 +8,21 @@ PYPI_PACKAGE = "ipython"
 SRC_URI[sha256sum] = "48fbc236fbe0e138b88773fa0437751f14c3645fb483f1d4c5dee58b37e5ce73"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-jedi \
-    ${PYTHON_PN}-decorator \
-    ${PYTHON_PN}-pickleshare \
-    ${PYTHON_PN}-traitlets \
-    ${PYTHON_PN}-prompt-toolkit \
-    ${PYTHON_PN}-pygments \
-    ${PYTHON_PN}-backcall \
-    ${PYTHON_PN}-pydoc \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-pexpect \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-sqlite3 \
-    ${PYTHON_PN}-stack-data \
+    python3-setuptools \
+    python3-jedi \
+    python3-decorator \
+    python3-pickleshare \
+    python3-traitlets \
+    python3-prompt-toolkit \
+    python3-pygments \
+    python3-backcall \
+    python3-pydoc \
+    python3-debugger \
+    python3-pexpect \
+    python3-unixadmin \
+    python3-misc \
+    python3-sqlite3 \
+    python3-stack-data \
 "
 
 inherit setuptools3 pypi
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
index 2e8c7e7802..5af1d594b3 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.2.bb
@@ -10,8 +10,8 @@ inherit pypi setuptools3
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-simplejson \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-json \
+    python3-simplejson \
+    python3-netclient \
+    python3-compression \
+    python3-json \
 "
diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb b/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
index 1b65f3bc9e..22a798529f 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools3
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-modules \
+        python3-modules \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
index 8655150b03..018a63a5fa 100644
--- a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
@@ -12,14 +12,14 @@ inherit pypi setuptools3 ptest
 SRC_URI[md5sum] = "e05bdb60fa80f25bc60e73e0c6b7c5dc"
 SRC_URI[sha256sum] = "472872e096eb8df219c23f2689fc336668bdb43d194094b5cc1707e1640acfc8"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+RDEPENDS:${PN} += "python3-compression python3-io python3-pprint python3-shell"
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+	python3-pytest \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb b/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
index f335625188..56395c3b5d 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
@@ -8,12 +8,12 @@ PYPI_PACKAGE = "jedi"
 SRC_URI[sha256sum] = "cf0496f3651bc65d7174ac1b7d043eff454892c708a87d1b683e57b569927ffd"
 
 RDEPENDS:${PN} = " \
-	${PYTHON_PN}-parso \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-compression \
-	${PYTHON_PN}-pydoc \
-	${PYTHON_PN}-compile \
-	${PYTHON_PN}-json \
+	python3-parso \
+	python3-core \
+	python3-compression \
+	python3-pydoc \
+	python3-compile \
+	python3-json \
 "
 
 inherit setuptools3 pypi
diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
index 7b438778e9..54482a69ca 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
@@ -11,9 +11,9 @@ SRC_URI[sha256sum] = "6b632581ea60dd1c133cd25a48ad187b4b91f526623c4b0fb5443ef805
 PYPI_PACKAGE="jsbeautifier"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-shell \
+    python3-core \
+    python3-stringold \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb b/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
index 51b17066ee..15c9b14595 100644
--- a/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+	python3-pytest \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
index 3d6deb2a61..6a1715c6df 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
@@ -8,8 +8,8 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-stringold \
+    python3-json \
+    python3-jsonpointer \
+    python3-netclient \
+    python3-stringold \
 "
diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
index 8fb8c6e88f..f9c232b9c5 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
@@ -16,8 +16,8 @@ DISTUTILS_INSTALL_ARGS += " \
 FILES:${PN} += "${datadir}/*"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-xml \
+    python3-compression \
+    python3-doctest \
+    python3-logging \
+    python3-xml \
 "
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
index 9232a5a917..263c46869f 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-pip-native"
+DEPENDS += "python3-setuptools-scm-native python3-pip-native"
 
 SRC_URI[sha256sum] = "78247b6d45f43a52ef35c25b5581459e85117225408a4128a3daf8bf9648ac69"
 
diff --git a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
index a855c39141..97b3e72364 100644
--- a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
@@ -19,8 +19,8 @@ RDEPENDS:${PN} += " \
         python3 \
 "
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-unittest-automake-output \
+        python3-pytest \
+        python3-unittest-automake-output \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
index c2a18c0fd8..90967f8e56 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "963c264164d4374f549d57db09599e0ca458cea1bd05e16939897619be
 PYPI_PACKAGE = "luma.core"
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-pillow \
-	${PYTHON_PN}-threading \
-	${PYTHON_PN}-smbus2 \
+	python3-pillow \
+	python3-threading \
+	python3-smbus2 \
 "
diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
index 13ced6b204..95f066affe 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
@@ -15,5 +15,5 @@ CLEANBROKEN = "1"
 PYPI_PACKAGE = "luma.oled"
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-luma-core \
+	python3-luma-core \
 "
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index 062a63a39c..1d8c22d196 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -18,13 +18,13 @@ inherit pypi siteinfo setuptools3
 
 DEPENDS += "openssl swig-native"
 RDEPENDS:${PN} += "\
-  ${PYTHON_PN}-datetime \
-  ${PYTHON_PN}-setuptools \
-  ${PYTHON_PN}-logging \
-  ${PYTHON_PN}-netclient \
-  ${PYTHON_PN}-netserver \
-  ${PYTHON_PN}-numbers \
-  ${PYTHON_PN}-xmlrpc \
+  python3-datetime \
+  python3-setuptools \
+  python3-logging \
+  python3-netclient \
+  python3-netserver \
+  python3-numbers \
+  python3-xmlrpc \
 "
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
index 265b28a771..5304917842 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "348e0240c33b60bbdf4e523192ef919f28cb2c3d7d5c7794f74009290f
 
 inherit pypi setuptools3
 
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+DEPENDS += "python3-pytest-runner-native"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
index 01dd8bfb44..236fbd85bc 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a
 
 inherit pypi setuptools3
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += " \
     python3-image \
     python3-math \
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
index 79943b55e4..e88532e73b 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest
 SRC_URI[sha256sum] = "572efc93db7a4d27e404501975ca6d2d9775705c2d922390d878fcf768d92c87"
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-io \
+    python3-io \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -17,7 +17,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+	python3-pytest \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb b/meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb
index c82113101b..2fd698138e 100644
--- a/meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-multivolumefile_0.2.3.bb
@@ -9,13 +9,13 @@ SRC_URI[sha256sum] = "a0648d0aafbc96e59198d5c17e9acad7eb531abea51035d08ce8060dca
 inherit python_setuptools_build_meta pypi
 
 DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-toml-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+    python3-wheel-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-mmap \
+    python3-io \
+    python3-core \
+    python3-mmap \
 "
diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.1.bb b/meta-python/recipes-devtools/python/python3-networkx_3.1.bb
index 7158f7b057..3860238096 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.1.bb
@@ -8,14 +8,14 @@ SRC_URI[sha256sum] = "de346335408f84de0eada6ff9fafafff9bcda11f0a0dfaa931133debb1
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-                   ${PYTHON_PN}-decorator \
-                   ${PYTHON_PN}-netclient \
-                   ${PYTHON_PN}-compression \
-                   ${PYTHON_PN}-numbers \
-                   ${PYTHON_PN}-pickle \
-                   ${PYTHON_PN}-html \
-                   ${PYTHON_PN}-xml \
-                   ${PYTHON_PN}-json \
-                   ${PYTHON_PN}-profile \
-                   ${PYTHON_PN}-threading \
+                   python3-decorator \
+                   python3-netclient \
+                   python3-compression \
+                   python3-numbers \
+                   python3-pickle \
+                   python3-html \
+                   python3-xml \
+                   python3-json \
+                   python3-profile \
+                   python3-threading \
                    "
diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
index a9e0ed208c..8f2e6528db 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "9d793b08dd857e38d0b6ffe9e6b7145d7c485a42dcfea04905ca0cdb60
 SRC_URI += "file://no-scikit-build.patch \
             file://run-ninja-from-path.patch"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 do_install:append () {
 	rm -rf ${D}${bindir}
diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb b/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
index 0a6de2d6b6..5fe9ab4e39 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-DEPENDS += "${PYTHON_PN}-wheel-native"
+DEPENDS += "python3-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
@@ -13,6 +13,6 @@ SRC_URI[sha256sum] = "892b5091cde429fabfb8ba63382b2db8fd795193ba147558d0a7d5534c
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "nmap \
-	${PYTHON_PN}-requests \
-	${PYTHON_PN}-simplejson \
+	python3-requests \
+	python3-simplejson \
 "
diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
index 6185b7b1e9..5a29858177 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.1.bb
@@ -8,5 +8,5 @@ SRC_URI[sha256sum] = "960cb699f1209da80ac39e3ab50aa7342fe8ca9f70606c23447a510550
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-six \
+    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
index 29a3c86067..2ad42247d9 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
@@ -8,5 +8,5 @@ SRC_URI[sha256sum] = "456aa000c6777c5d21b029c52e532f94328d4fb4f15ad2a4dd3dd62db3
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-six \
+	python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
index d78bec046f..d0a8d7a823 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "899d8fb5f8c2555213aea95efca02934c7343df6ace9d7628a5176b176
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-io"
+RDEPENDS:${PN} += "python3-datetime python3-io"
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
index 566279d71c..833fdbcc58 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
@@ -14,9 +14,9 @@ inherit pypi setuptools3
 #
 # Uncomment this line to enable all the optional features.
 #PACKAGECONFIG ?= "test signedtoken signals rsa"
-PACKAGECONFIG[test] = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-pytest ${PYTHON_PN}-pyjwt"
-PACKAGECONFIG[signedtoken] = ",,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt"
-PACKAGECONFIG[signals] = ",,,${PYTHON_PN}-blinker"
-PACKAGECONFIG[rsa] = ",,,${PYTHON_PN}-cryptography"
+PACKAGECONFIG[test] = ",,,python3-blinker python3-cryptography python3-pytest python3-pyjwt"
+PACKAGECONFIG[signedtoken] = ",,,python3-cryptography python3-pyjwt"
+PACKAGECONFIG[signals] = ",,,python3-blinker"
+PACKAGECONFIG[rsa] = ",,,python3-cryptography"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-datetime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-unittest"
+RDEPENDS:${PN} += "python3-core python3-crypt python3-datetime python3-json python3-logging python3-math python3-netclient python3-unittest"
diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
index d78642a9bd..cf3daae6ac 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
@@ -6,4 +6,4 @@ SRC_URI[sha256sum] = "20d38c9ded3daad1e8affab3ff367a70788d4f29ac77ab7aacddc6a6d2
 
 inherit setuptools3 pypi
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint ${PYTHON_PN}-setuptools ${PYTHON_PN}-packaging"
+RDEPENDS:${PN} += "python3-pyserial python3-pint python3-setuptools python3-packaging"
diff --git a/meta-python/recipes-devtools/python/python3-olefile_0.47.bb b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
index 2db0adad8b..bb6fa7a8cc 100644
--- a/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
+++ b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "olefile"
 PYPI_PACKAGE_EXT = "zip"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
+    python3-core \
+    python3-datetime \
+    python3-logging \
 "
diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
index a889210616..4a3254cc53 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
@@ -12,12 +12,12 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "a6f5977418eff3b2d5500d54d9db50c8277a368436f4e4f8ddb1be3422870184"
 
 RDEPENDS:${PN} += "\
-	${PYTHON_PN}-compression \
-	${PYTHON_PN}-io \
-	${PYTHON_PN}-pprint \
-	${PYTHON_PN}-shell \
-	${PYTHON_PN}-jdcal \
-	${PYTHON_PN}-et-xmlfile \
-	${PYTHON_PN}-numbers \
-	${PYTHON_PN}-xml \
+	python3-compression \
+	python3-io \
+	python3-pprint \
+	python3-shell \
+	python3-jdcal \
+	python3-et-xmlfile \
+	python3-numbers \
+	python3-xml \
 "
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index f2f1cf8e45..a391036a73 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+	python3-pytest \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
index 81a6d0a9c9..9055772b57 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "2a8291c81623aec00372b5a85558a372c747cbca8e9934dfe218638b8eefc26f"
 
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+DEPENDS += "python3-pytest-runner-native"
 
 do_install:append() {
         install -d -m0755 ${D}${datadir}/${BPN}/examples
@@ -18,16 +18,16 @@ do_install:append() {
 
 PACKAGES =+ "${PN}-examples"
 
-RDEPENDS:${PN}-examples += "${PN} ${PYTHON_PN}-core"
+RDEPENDS:${PN}-examples += "${PN} python3-core"
 
 FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-threading \
+    python3-io \
+    python3-logging \
+    python3-math \
+    python3-netclient \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
index 5e69fea6c1..91e76d9919 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
@@ -11,9 +11,9 @@ SRC_URI[sha256sum] = "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb4020a77512
 inherit pypi setuptools3
 
 DEPENDS += " \
-    ${PYTHON_PN}-cython-native \
-    ${PYTHON_PN}-numpy-native \
-    ${PYTHON_PN}-versioneer-native \
+    python3-cython-native \
+    python3-numpy-native \
+    python3-versioneer-native \
 "
 
 PACKAGESPLITFUNCS =+ "fix_cythonized_sources"
@@ -29,10 +29,10 @@ fix_cythonized_sources() {
 CFLAGS:append:toolchain-clang = " -Wno-error=deprecated-declarations"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-numpy \
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-dateutil-zoneinfo \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-profile \
+    python3-json \
+    python3-numpy \
+    python3-dateutil \
+    python3-dateutil-zoneinfo \
+    python3-pytz \
+    python3-profile \
 "
diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
index 14c90ffb58..1fc967d953 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "c16703202ff67aed4740c0727df304abe9f3e7851e653533b24de21b33
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-fcntl ${PYTHON_PN}-threading ${PYTHON_PN}-unixadmin"
+RDEPENDS:${PN} += "python3-fcntl python3-threading python3-unixadmin"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
index ce3471da6a..217c821fb4 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "8c07be290bb59f03588915921e29e8a50002acaf2cdc5fa0e0114f9170
 inherit setuptools3 pypi
 
 RDEPENDS:${PN} = " \
-	${PYTHON_PN}-crypt \
-	${PYTHON_PN}-difflib \
-	${PYTHON_PN}-logging \
+	python3-crypt \
+	python3-difflib \
+	python3-logging \
 "
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
index dc692303fe..8b66e25922 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c415
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
+    python3-crypt \
+    python3-logging \
+    python3-netclient \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb b/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
index 3361bb8338..0862eab6a2 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "53cdab727c1469fdc196efd8d7ff8404a3ca91ee43c0a5714736f2020d
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-    ${PYTHON_PN}-pdm-backend-native \
+    python3-pdm-backend-native \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
index f3e03ed309..68507e2482 100644
--- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -9,9 +9,9 @@ SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-prettytable \
-            ${PYTHON_PN}-cmd2 \
-            ${PYTHON_PN}-pyparsing"
+RDEPENDS:${PN} += "python3-prettytable \
+            python3-cmd2 \
+            python3-pyparsing"
 
 SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
 SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
index e284ccc33a..c2764b27d2 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
@@ -10,6 +10,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-periphery"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-mmap \
-		${PYTHON_PN}-ctypes \
-		${PYTHON_PN}-fcntl"
+RDEPENDS:${PN} += "python3-mmap \
+		python3-ctypes \
+		python3-fcntl"
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
index 6ee5b25bda..521df9dcd4 100644
--- a/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
@@ -13,12 +13,12 @@ inherit pypi setuptools3
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-resource \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-ptyprocess \
+    python3-core \
+    python3-io \
+    python3-terminal \
+    python3-resource \
+    python3-fcntl \
+    python3-ptyprocess \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
index 412dcfce40..c90f551056 100644
--- a/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "0e33670e83f6a33ebb0822e43a609c3247178d4a375ff50a4689e266d8
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-fcntl ${PYTHON_PN}-logging ${PYTHON_PN}-io"
+RDEPENDS:${PN} += "python3-fcntl python3-logging python3-io"
diff --git a/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
index d5100dd78e..865accc595 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
@@ -15,12 +15,12 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "pika"
 
 DEPENDS += " \
-	${PYTHON_PN}-setuptools-scm-native \
-	${PYTHON_PN}-toml-native \
+	python3-setuptools-scm-native \
+	python3-toml-native \
 "
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-logging \
-	${PYTHON_PN}-tornado \
-	${PYTHON_PN}-twisted \
+	python3-logging \
+	python3-tornado \
+	python3-twisted \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.23.bb b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
index 82709ea08a..ad3e13e5dd 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
@@ -21,12 +21,12 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-packaging \
+    python3-setuptools \
+    python3-packaging \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+	python3-pytest \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
index 1aa91deac5..9ff4d1318d 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
 SRC_URI[sha256sum] = "deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899"
 
 RDEPENDS:${PN} = "pkgconfig \
-                 ${PYTHON_PN}-shell \
+                 python3-shell \
                  "
 
 inherit pypi python_poetry_core
diff --git a/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
index b4bbfc6c6f..3af94b48f1 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "5289b40d98959b16b3f6927781678935d3df1b7c14947f5d7778e5e04dd9a065"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-sortedcontainers \
+    python3-sortedcontainers \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.6.bb b/meta-python/recipes-devtools/python/python3-progress_1.6.bb
index 1333da98da..59d1f90e98 100644
--- a/meta-python/recipes-devtools/python/python3-progress_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-progress_1.6.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "c9c86e98b5c03fa1fe11e3b67c1feda4788b8d0fe7336c2ff7d5644ccf
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-math \
+    python3-datetime \
+    python3-math \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
index 9f7802b538..8b3b709763 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
@@ -10,16 +10,16 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "prompt_toolkit"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-wcwidth \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-image \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-xml \
+    python3-core \
+    python3-six \
+    python3-terminal \
+    python3-threading \
+    python3-wcwidth \
+    python3-datetime \
+    python3-shell \
+    python3-image \
+    python3-asyncio \
+    python3-xml \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
index 5333d306bd..fad62879b7 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
@@ -17,14 +17,14 @@ UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 DEPENDS += "protobuf"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-unittest \
+    python3-datetime \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-numbers \
+    python3-pkgutil \
+    python3-six \
+    python3-unittest \
 "
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
diff --git a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
index 222eb1e0e8..0db9d65fd3 100644
--- a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-numbers \
+    python3-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb b/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
index f9e6820ce1..3d48b5116f 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
@@ -9,21 +9,21 @@ SRC_URI[sha256sum] = "2a6b0db0441e63a2dd74cbd18f5d9ae7e08dc0e54685aa486361d0db6a
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-toml-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+    python3-wheel-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-pycryptodomex \
-    ${PYTHON_PN}-multivolumefile \
-    ${PYTHON_PN}-pybcj \
-    ${PYTHON_PN}-inflate64 \
-    ${PYTHON_PN}-pyppmd \
-    ${PYTHON_PN}-pyzstd \
-    ${PYTHON_PN}-brotli \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-threading \
+    python3-pycryptodomex \
+    python3-multivolumefile \
+    python3-pybcj \
+    python3-inflate64 \
+    python3-pyppmd \
+    python3-pyzstd \
+    python3-brotli \
+    python3-multiprocessing \
+    python3-datetime \
+    python3-core \
+    python3-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb
index 34ffb97933..8cb176f2b5 100644
--- a/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb
@@ -11,14 +11,14 @@ inherit pypi python_setuptools_build_meta pypi
 #PROVIDES = "python3-pybcj"
 
 DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-toml-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+    python3-wheel-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-compression \
+    python3-email \
+    python3-importlib-metadata \
+    python3-core \
+    python3-compression \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index 219642849d..a38e10eec0 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -22,5 +22,5 @@ do_configure:prepend() {
 
 RDEPENDS:${PN} += "\
     bluez5 \
-    ${PYTHON_PN}-fcntl \
+    python3-fcntl \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
index 978fc0d4a6..b6b0de8809 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
@@ -12,11 +12,11 @@ PYPI_PACKAGE = "pycares"
 
 inherit pypi setuptools3
 
-DEPENDS += "${PYTHON_PN}-cffi-native"
+DEPENDS += "python3-cffi-native"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
+    python3-cffi \
+    python3-idna \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
index 618aba4a67..30add4d2f1 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
@@ -10,11 +10,11 @@ PYPI_PACKAGE = "PyChromecast"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-zeroconf \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-requests \
-    ${PYTHON_PN}-protobuf \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-casttube \
+    python3-logging \
+    python3-zeroconf \
+    python3-json \
+    python3-requests \
+    python3-protobuf \
+    python3-compression \
+    python3-casttube \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
index 5bbc33ade0..02ebeaad79 100644
--- a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84ddcef430b7c44caa22b2ff4b37a3df"
 PYPI_PACKAGE = "pyFirmata"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-pyserial \
+    python3-pyserial \
 "
 
 SRC_URI[md5sum] = "159673cfb56c72ceafc30fe91eedd847"
diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
index bfa4e0a699..eaa24eefe5 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
@@ -7,12 +7,12 @@ SRC_URI[sha256sum] = "c6acbec0923d0cb7e72c22af1926f3e7c97b8e8d69fc7498eabacaf7c9
 
 inherit pypi python_setuptools_build_meta
 
-DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
+DEPENDS += "python3-hatch-vcs-native"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PyHamcrest/"
 UPSTREAM_CHECK_REGEX = "/PyHamcrest/(?P<pver>(\d+[\.\-_]*)+)"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-numbers \
+    python3-six \
+    python3-numbers \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
index 2a09e96949..8d966cfb63 100644
--- a/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
@@ -11,12 +11,12 @@ SRC_URI[sha256sum] = "27bf9bd1bbc1e20f83633208620d56de50f14185055e49504f4f5e94e9
 inherit pypi setuptools3
 
 DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-six-native \
+    python3-setuptools-scm-native \
+    python3-six-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-logging \
+    python3-io \
+    python3-core \
+    python3-logging \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
index ae686871e8..97985a8a1d 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
@@ -12,7 +12,7 @@ inherit setuptools3
 PIP_INSTALL_PACKAGE = "PyMetno"
 
 RDEPENDS:${PN} = "\
-	${PYTHON_PN}-aiohttp (>=3.6.1) \
-	${PYTHON_PN}-async-timeout (>=3.0.1) \
-	${PYTHON_PN}-pytz (>=2019.3) \
+	python3-aiohttp (>=3.6.1) \
+	python3-async-timeout (>=3.0.1) \
+	python3-pytz (>=2019.3) \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
index b0e62bae28..2e934fc028 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
@@ -10,13 +10,13 @@ inherit python_poetry_core pypi
 PIP_INSTALL_PACKAGE = "pymisp"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-jsonschema \
-    ${PYTHON_PN}-requests \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-deprecated \
-    ${PYTHON_PN}-wrapt \
+    python3-dateutil \
+    python3-json \
+    python3-jsonschema \
+    python3-requests \
+    python3-six \
+    python3-deprecated \
+    python3-wrapt \
 "
 
 # Fixes: python3-pymisp requires /bin/bash, but no
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
index 2704637d34..260e134cd2 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
@@ -12,19 +12,19 @@ SRC_URI[sha256sum] = "31dab1f3e1d0cdd57e8df01b645f52d43cc1b653ed3afd535d2891f4fc
 
 inherit pypi setuptools3
 
-PACKAGES =+ "${PYTHON_PN}-bson"
+PACKAGES =+ "python3-bson"
 
-FILES:${PYTHON_PN}-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
+FILES:python3-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
 
-RDEPENDS:${PYTHON_PN}-bson += " \
-     ${PYTHON_PN}-datetime \
-     ${PYTHON_PN}-json \
-     ${PYTHON_PN}-netclient \
-     ${PYTHON_PN}-numbers \
-     ${PYTHON_PN}-threading \
+RDEPENDS:python3-bson += " \
+     python3-datetime \
+     python3-json \
+     python3-netclient \
+     python3-numbers \
+     python3-threading \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-bson \
-    ${PYTHON_PN}-pprint \
+    python3-bson \
+    python3-pprint \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
index f797674e84..5e56a64aa1 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.1.0.bb
@@ -16,4 +16,4 @@ inherit pypi python_setuptools_build_meta
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pymysql/"
 UPSTREAM_CHECK_REGEX = "/pymysql/(?P<pver>(\d+[\.\-_]*)+)"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-cryptography"
+RDEPENDS:${PN} += "python3-cryptography"
diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index 0747c67c19..d27ee23e43 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "PyNaCl"
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "\
-    ${PYTHON_PN}-cffi-native \
+    python3-cffi-native \
     libsodium \
 "
 
@@ -24,8 +24,8 @@ do_install:prepend() {
 }
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-cffi \
+    python3-six \
+    python3-cffi \
     libsodium \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
index 2870ec9c01..dcf0015c59 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-ctypes \
+    python3-ctypes \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
index 3f284f2453..84c61ec8b0 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
 SRC_URI[sha256sum] = "64d8fadce6a74f478f29832c1eaa2a04856655ebff17292d5237fc8317c3a3c5"
 
-DEPENDS += "${PYTHON_PN}-six-native"
+DEPENDS += "python3-six-native"
 
 PYPI_PACKAGE = "pyperf"
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += "${PYTHON_PN}-misc ${PYTHON_PN}-statistics"
+RDEPENDS:${PN} += "python3-misc python3-statistics"
diff --git a/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb
index 053c9adab5..cec21007a2 100644
--- a/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb
@@ -9,12 +9,12 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "1d38ce2e4b7eb84b53bc8a52380b94f66ba6c39328b8800b30c2b5bf31693973"
 
 DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native \
-    ${PYTHON_PN}-toml-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+    python3-wheel-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-importlib-metadata \
+    python3-email \
+    python3-importlib-metadata \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
index 739df2a1ba..aec19949d2 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
@@ -14,10 +14,10 @@ BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
 DEPENDS += "\
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-packaging \
-    ${PYTHON_PN}-tomli \
+    python3-packaging \
+    python3-tomli \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.54.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.54.bb
index e8d75e9d75..6a484b8ae9 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.54.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.54.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "2a72897cfd342382573632d80d38776884a38c8d02353d9d5da4e9e8e8
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-	${PYTHON_PN}-ifaddr \
-	${PYTHON_PN}-requests \
-	${PYTHON_PN}-xmltodict \
+	python3-ifaddr \
+	python3-requests \
+	python3-xmltodict \
 	"
diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
index d31f45131f..3bfa20fcd9 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
@@ -6,12 +6,12 @@ SRC_URI[sha256sum] = "4dcfa4b13a55685c49d3d17c10631eca18c33770f66316f8ef2337b895
 
 DEPENDS = "systemd python3-cython-native"
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-lxml \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-io \
+    python3-xml \
+    python3-lxml \
+    python3-pprint \
+    python3-core \
+    python3-shell \
+    python3-io \
 "
 REQUIRED_DISTRO_FEATURES = "systemd"
 
diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
index 66375dec35..0be97e5c4f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "3904b13dfbfec47f003b8e77fd5b589cd11904a21ddf1ab38a64f204d6
 
 inherit pypi setuptools3
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-coverage python3-pytest"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
index cf62e1f03b..6698b6dde3 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.12.29.bb
@@ -11,5 +11,5 @@ inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native python3-setuptools-declarative-requirements-native"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
index b9023dfcde..37478ee0ae 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "pytest plugin for generating html reports from test results"
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
@@ -11,11 +11,11 @@ PYPI_PACKAGE = "pytest_html"
 inherit pypi python_hatchling
 
 DEPENDS += "\
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb
index 493c241df2..6b108a2d0a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-json-report_1.5.0.bb
@@ -9,10 +9,10 @@ PYPI_PACKAGE = "pytest-json-report"
 
 inherit pypi setuptools3
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytest-metadata \
+    python3-pytest \
+    python3-pytest-metadata \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
index e82213cbe5..163a363f82 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "pytest-metadata is a plugin that allowed for accessing pytest metadata"
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "pytest-metadata"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
index 972c99e38f..dff6af4e0a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
@@ -10,5 +10,5 @@ SRC_URI[sha256sum] = "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.2.0.bb
index da8bc5dd35..a7daa05e6c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.2.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "3b0b95dabf3cb50bac9ef5ca912fa0cfc286526af17afc806824df20c2
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-pytest"
+RDEPENDS:${PN} = "python3-pytest"
diff --git a/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb b/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
index c58981a327..5a2899e132 100644
--- a/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
@@ -8,13 +8,13 @@ SRC_URI[sha256sum] = "a3caa3a11842fc7d5746376f37195e6af5f17c0a15737538bb1cebf656
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-six \
+    python3-core \
+    python3-crypt \
+    python3-ctypes \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-threading \
+    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
index 6fcf346bc4..ed5175fcf7 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
@@ -13,10 +13,10 @@ do_configure:prepend() {
 }
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-fcntl \
+    python3-ctypes \
+    python3-misc \
+    python3-six \
+    python3-threading \
+    python3-fcntl \
     libudev \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
index abe3529119..2282e0300b 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyusb.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905"
 
-DEPENDS += "libusb1 ${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "libusb1 python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
 	python3-logging \
diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
index 8b76397bfe..22868d8df0 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
@@ -24,13 +24,13 @@ DEPENDS += " \
 
 # Adding required python package for the ptest (pytest and pytest->automake report translation)
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-unittest-automake-output \
-    ${PYTHON_PN}-pytz \
+    python3-pytest \
+    python3-unittest-automake-output \
+    python3-pytz \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-core \
+    python3-core \
 "
 
 # Installing the test suite on the target
diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb
index ece92ee3b3..8f5ef415c6 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb
@@ -14,10 +14,10 @@ PYPI_PACKAGE="rarfile"
 
 RDEPENDS:${PN} += "\
     p7zip \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-io \
+    python3-core \
+    python3-datetime \
+    python3-crypt \
+    python3-io \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb
index e02ff7911e..8c2f891c1e 100644
--- a/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_1.3.1.bb
@@ -5,4 +5,4 @@ SRC_URI[sha256sum] = "75beac4a47881eeb94d5ea5d6ad31ef88856affe2332b9aafb52c6452c
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-requests ${PYTHON_PN}-oauthlib"
+RDEPENDS:${PN} += "python3-requests python3-oauthlib"
diff --git a/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb b/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
index 49efd09a4b..7df8ac07c5 100644
--- a/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
@@ -11,6 +11,6 @@ inherit pypi setuptools3
 DEPENDS += "python3-pip-native"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-eth-utils \
-    ${PYTHON_PN}-typing-extensions \
+    python3-eth-utils \
+    python3-typing-extensions \
 "
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
index 4c0bd7e3ec..0f34a1366d 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "robotframework-seriallibrary"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pyserial \
-    ${PYTHON_PN}-robotframework \
+    python3-pyserial \
+    python3-robotframework \
 "
diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
index ca301e46a4..beb71e6a18 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
@@ -16,15 +16,15 @@ PYPI_PACKAGE_EXT = "zip"
 SRC_URI[sha256sum] = "04623f758346c917db182e17591ffa474090560c02ed5a64343902e72b7b4bd5"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-docutils \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-profile \
+    python3-shell \
+    python3-pprint \
+    python3-xml \
+    python3-difflib \
+    python3-threading \
+    python3-html \
+    python3-docutils \
+    python3-ctypes \
+    python3-logging \
+    python3-numbers \
+    python3-profile \
 "
diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.9.bb b/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
index 0a1e359e14..c27cd1d68a 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
@@ -26,14 +26,14 @@ ALTERNATIVE_PRIORITY = "30"
 
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pickle \
+    python3-compression \
+    python3-crypt \
+    python3-doctest \
+    python3-logging \
+    python3-math \
+    python3-multiprocessing \
+    python3-netclient \
+    python3-pickle \
 "
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pyasn1"
+RDEPENDS:${PN} += "python3-pyasn1"
diff --git a/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb b/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
index de326815ac..6ebde30e61 100644
--- a/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "843bc0538b99c93f02b8b50e3e39886c06f2d003b24f48e1aa4cadfa3f
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-logging ${PYTHON_PN}-math"
+RDEPENDS:${PN} += "python3-datetime python3-logging python3-math"
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
index 7f99dd16b8..dde0941ef1 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython exten
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
 
-DEPENDS = "${PYTHON_PN}-hatch-vcs-native ${PYTHON_PN}-hatch-fancy-pypi-readme-native"
+DEPENDS = "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-native"
 
 PYPI_PACKAGE = "scikit_build"
 
@@ -11,11 +11,11 @@ inherit pypi python_hatchling
 SRC_URI[sha256sum] = "b51a51a36b37c42650994b5047912f59b22e3210b23e321f287611f9ef6e5c9d"
 
 RDEPENDS:${PN} = " \
-	${PYTHON_PN}-distro \
-	${PYTHON_PN}-packaging \
-	${PYTHON_PN}-setuptools \
-	${PYTHON_PN}-typing-extensions \
-	${PYTHON_PN}-wheel \
+	python3-distro \
+	python3-packaging \
+	python3-setuptools \
+	python3-typing-extensions \
+	python3-wheel \
 	cmake \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
index 0fb3f3a228..19ac3f67f0 100644
--- a/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
@@ -11,6 +11,6 @@ SRC_URI[sha256sum] = "9983076bcc7e34402a1a9e4d7dabf3729411fd2abb3f3b4be7eba73519
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-profile \
+    python3-core \
+    python3-profile \
 "
diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.11.1.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.11.1.bb
index 6372d3488d..26bc71762e 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.11.1.bb
@@ -9,9 +9,9 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-core \
+    python3-asyncio \
+    python3-numbers \
+    python3-core \
 "
 
 inherit pypi setuptools3 features_check pkgconfig
diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
index ec59c712ba..19095b30db 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
@@ -6,13 +6,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03dc788d9a9486be5e6a1d99c2c1ce3a"
 
 RDEPENDS:${PN} += "\
-	${PYTHON_PN}-urllib3 \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-json \
-	${PYTHON_PN}-logging \
-	${PYTHON_PN}-threading \
-	${PYTHON_PN}-compression \
-	${PYTHON_PN}-datetime \
+	python3-urllib3 \
+	python3-core \
+	python3-json \
+	python3-logging \
+	python3-threading \
+	python3-compression \
+	python3-datetime \
 "
 
 SRC_URI[sha256sum] = "34ad8cfc9b877aaa2a8eb86bfe5296a467fffe0619b931a05b181c45f6da59bf"
diff --git a/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb b/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
index 3a652a58be..cbe000e31c 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
@@ -10,16 +10,16 @@ PYPI_PACKAGE = "sh"
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-resource \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-fcntl \
+    python3-asyncio \
+    python3-codecs \
+    python3-compression \
+    python3-core \
+    python3-io \
+    python3-logging \
+    python3-resource \
+    python3-shell \
+    python3-terminal \
+    python3-threading \
+    python3-unixadmin \
+    python3-fcntl \
 "
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
index 91f6b35b32..cc5b1bc90a 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
@@ -9,13 +9,13 @@ SRC_URI[sha256sum] = "9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24e
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
+    python3-io \
+    python3-netserver \
+    python3-numbers \
 "
 
 PACKAGES =+ "${PN}-tests"
-RDEPENDS:${PN}-tests = "${PN} ${PYTHON_PN}-unittest"
+RDEPENDS:${PN}-tests = "${PN} python3-unittest"
 FILES:${PN}-tests+= " \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index ae4e6f72da..7373b02f53 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -27,7 +27,7 @@ do_compile:prepend() {
 }
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-six \
+    python3-six \
 "
 # http://errors.yoctoproject.org/Errors/Details/184713/
 # python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
index cc4802e6c7..b54cdb005f 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
@@ -13,6 +13,6 @@ CLEANBROKEN = "1"
 PYPI_PACKAGE = "smbus2"
 
 RDEPENDS:${PN} += "\
-        ${PYTHON_PN}-ctypes \
-        ${PYTHON_PN}-fcntl \
+        python3-ctypes \
+        python3-fcntl \
 "
diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
index 72471e956a..b267afc99d 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
@@ -12,17 +12,17 @@ PYPI_PACKAGE = "python-socketio"
 SRC_URI[sha256sum] = "b03186e04b942088781f6286c13604a853e5e35ed59158c51ff7af22fa032e6f"
 
 PACKAGECONFIG ?= "asyncio_client client"
-PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-PACKAGECONFIG[client] = ",,,${PYTHON_PN}-requests ${PYTHON_PN}-websocket-client"
+PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
+PACKAGECONFIG[client] = ",,,python3-requests python3-websocket-client"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-engineio \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-bidict \
+    python3-engineio \
+    python3-logging \
+    python3-math \
+    python3-pickle \
+    python3-json \
+    python3-threading \
+    python3-six \
+    python3-attrs \
+    python3-bidict \
     "
diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
index d60d017d5b..ce71796339 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "a54534acf9b89bc7ed264807013b505bf07f74dbe4bcfa37d32bd063870b087c"
 
-DEPENDS += "${PYTHON_PN}-pbr-native"
+DEPENDS += "python3-pbr-native"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
+RDEPENDS:${PN} += "python3-pbr python3-six"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
index 64e3671e1b..e119a0f11a 100644
--- a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "f7f39c583fd92027bd9d06127b259aee7a5b7945c1f1fa56263811e1e7
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-setuptools \
+    python3-setuptools \
     "
 
 BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
index aa85189ee5..cbe7fcc215 100644
--- a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
+++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba0eb3de1df70bde0ed48488cfd81269"
 
 SRC_URI += "file://0001-patch-versioneer-for-python-3.12-compatibility.patch"
 
-DEPENDS = "${PYTHON_PN}-pytest-runner-native"
+DEPENDS = "python3-pytest-runner-native"
 
 SRC_URI[sha256sum] = "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeacf3bcd80875c82eff"
 
diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 01d42cd5a4..7a7d5a5053 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
 PYPI_PACKAGE = "systemd-python"
 DEPENDS += "systemd (<=235)"
-RDEPENDS:${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging python3-syslog"
+RDEPENDS:${PN} += "systemd python3-syslog python3-logging python3-syslog"
 REQUIRED_DISTRO_FEATURES = "systemd"
 inherit pypi features_check pkgconfig setuptools3
 SRC_URI:append:libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
index a25a1c66d5..75e97355f5 100644
--- a/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
@@ -8,14 +8,14 @@ SRC_URI[sha256sum] = "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-	${PYTHON_PN}-setuptools-scm-native \
-	${PYTHON_PN}-toml-native \
+	python3-setuptools-scm-native \
+	python3-toml-native \
 "
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-html \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-io \
-	${PYTHON_PN}-math \
-	${PYTHON_PN}-profile \
+	python3-html \
+	python3-core \
+	python3-io \
+	python3-math \
+	python3-profile \
 "
diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
index c7e650d943..c1e7c8e1f7 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
@@ -11,5 +11,5 @@ PYPI_PACKAGE = "telnetlib3"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-asyncio \
+    python3-asyncio \
 "
diff --git a/meta-python/recipes-devtools/python/python3-term_2.5.bb b/meta-python/recipes-devtools/python/python3-term_2.5.bb
index 3408b29c17..7d508ad809 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-term_2.5.bb
@@ -8,5 +8,5 @@ SRC_URI[sha256sum] = "846fda941dbb8a7c9f246e99bf5ee731910fc4a4cc54b7e36457c133c9
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-io \
+    python3-io \
 "
diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
index 212a293510..ea6b683991 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
@@ -9,8 +9,8 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "aab9e56047c8ac41ed798fa36d892a37aca6b3e9159f3e0c24bc64a9b3ac7b7a"
 
 DEPENDS += " \
-	${PYTHON_PN}-toml-native \
-	${PYTHON_PN}-hatch-vcs-native \
+	python3-toml-native \
+	python3-hatch-vcs-native \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
index 6d092c6ffe..7a3be97ad4 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
@@ -12,23 +12,23 @@ BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
 DEPENDS += "\
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-cachetools \
-    ${PYTHON_PN}-chardet \
-    ${PYTHON_PN}-colorama \
-    ${PYTHON_PN}-filelock \
-    ${PYTHON_PN}-packaging \
-    ${PYTHON_PN}-platformdirs \
-    ${PYTHON_PN}-pluggy \
-    ${PYTHON_PN}-pyproject-api \
-    ${PYTHON_PN}-tomli \
-    ${PYTHON_PN}-virtualenv \
+    python3-cachetools \
+    python3-chardet \
+    python3-colorama \
+    python3-filelock \
+    python3-packaging \
+    python3-platformdirs \
+    python3-pluggy \
+    python3-pyproject-api \
+    python3-tomli \
+    python3-virtualenv \
 "
 
 # Install all built-in python3 modules, as the software tested with tox might
 # depend on it. Tox will attempt to install all required dependencies
 # in a virtualenv using pip, but this obviously does not include the built-in modules.
-RDEPENDS:${PN} += "${PYTHON_PN}-modules"
+RDEPENDS:${PN} += "python3-modules"
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
index 2a92e61893..ad46a33e0e 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "d88e651f9db8d8551a62556d3cff9e3034274ca5d66e93197cf2490e2d
 
 inherit pypi python_setuptools_build_meta
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
 	python3-logging \
diff --git a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
index 5c5754740b..eee9ab88ba 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "440b6b49e5e975f9a640a2519abb2feddd96eb2aeb1715f87f947a7a07
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-trafaret \
-    ${PYTHON_PN}-pyyaml \
+    python3-trafaret \
+    python3-pyyaml \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-trafaret_2.1.1.bb b/meta-python/recipes-devtools/python/python3-trafaret_2.1.1.bb
index 97c56abde4..5b24206a27 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-trafaret_2.1.1.bb
@@ -8,9 +8,9 @@ SRC_URI[sha256sum] = "d9d00800318fbd343fdfb3353e947b2ebb5557159c844696c5ac24846f
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-urllib3 \
+    python3-datetime \
+    python3-numbers \
+    python3-urllib3 \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
index 0089d6c6e1..e650906aa9 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "8585105b371a04b8316a43d5ce29c098575c2e477850b62b848b964f14
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-ipython-genutils \
-    ${PYTHON_PN}-decorator \
+    python3-ipython-genutils \
+    python3-decorator \
 "
diff --git a/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
index 161b4b2212..2c73861f59 100644
--- a/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
@@ -8,11 +8,11 @@ SRC_URI[sha256sum] = "9e102ef5fdd5a20661eb88fad46338806c3bd32cf1db729603fe3697b1
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "\
-	${PYTHON_PN}-setuptools-scm-native \
+	python3-setuptools-scm-native \
 "
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-importlib-metadata \
+	python3-importlib-metadata \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
index 767ace114a..72a173e6f1 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
@@ -39,7 +39,7 @@ PACKAGES =+ "\
 "
 
 DEPENDS += " \
-    ${PYTHON_PN}-incremental-native \
+    python3-incremental-native \
 "
 
 RDEPENDS:${PN} = "\
@@ -56,22 +56,22 @@ RDEPENDS:${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS:${PN}-core = "${PYTHON_PN}-appdirs \
-                       ${PYTHON_PN}-asyncio \
-                       ${PYTHON_PN}-automat \
-                       ${PYTHON_PN}-constantly \
-                       ${PYTHON_PN}-core \
-                       ${PYTHON_PN}-debugger \
-                       ${PYTHON_PN}-hyperlink \
-                       ${PYTHON_PN}-incremental \
-                       ${PYTHON_PN}-pyhamcrest \
-                       ${PYTHON_PN}-pyserial \
-                       ${PYTHON_PN}-typing-extensions \
-                       ${PYTHON_PN}-unixadmin \
-                       ${PYTHON_PN}-zopeinterface \
+RDEPENDS:${PN}-core = "python3-appdirs \
+                       python3-asyncio \
+                       python3-automat \
+                       python3-constantly \
+                       python3-core \
+                       python3-debugger \
+                       python3-hyperlink \
+                       python3-incremental \
+                       python3-pyhamcrest \
+                       python3-pyserial \
+                       python3-typing-extensions \
+                       python3-unixadmin \
+                       python3-zopeinterface \
 "
 RDEPENDS:${PN}-test = "${PN}"
-RDEPENDS:${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
+RDEPENDS:${PN}-conch = "${PN}-core ${PN}-protocols python3-bcrypt python3-cryptography python3-pyasn1 python3-pickle"
 RDEPENDS:${PN}-mail = "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-names = "${PN}-core"
 RDEPENDS:${PN}-news = "${PN}-core ${PN}-protocols"
diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
index 68908bb64e..23ea996258 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
@@ -11,9 +11,9 @@ PYPI_PACKAGE = "tweepy"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-pip \
-    ${PYTHON_PN}-pysocks \
-    ${PYTHON_PN}-requests \
-    ${PYTHON_PN}-requests-oauthlib \
-    ${PYTHON_PN}-six \
+    python3-pip \
+    python3-pysocks \
+    python3-requests \
+    python3-requests-oauthlib \
+    python3-six \
 "
diff --git a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
index 3b0562421b..b14e353818 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
@@ -8,5 +8,5 @@ SRC_URI[sha256sum] = "f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd40
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-twisted \
+    python3-twisted \
 "
diff --git a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
index be1dab476c..8bfb8a6deb 100644
--- a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
@@ -11,9 +11,9 @@ inherit pypi setuptools3
 PYPI_PACKAGE="unoconv"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-shell \
+    python3-setuptools \
+    python3-core \
+    python3-shell \
 "
 
 do_install:append() {
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
index 0a9ba59452..1858fee25a 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
@@ -12,11 +12,11 @@ BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
 DEPENDS += "\
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-distlib \
-    ${PYTHON_PN}-filelock \
-    ${PYTHON_PN}-platformdirs \
+    python3-distlib \
+    python3-filelock \
+    python3-platformdirs \
 "
diff --git a/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
index bcd64892a2..bdcd4237b5 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_3.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Filesystem events monitoring"
-DEPENDS = "${PYTHON_PN}-argh"
+DEPENDS = "python3-argh"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
@@ -9,10 +9,10 @@ SRC_URI[sha256sum] = "4d98a320595da7a7c5a18fc48cb633c2e73cda78f93cac2ef42d42bf60
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
-    ${PYTHON_PN}-argh \
-    ${PYTHON_PN}-pathtools3 \
-    ${PYTHON_PN}-pyyaml \
-    ${PYTHON_PN}-requests \
+    python3-argh \
+    python3-pathtools3 \
+    python3-pyyaml \
+    python3-requests \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb b/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb
index 00b19bb240..4eea0f0523 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb
@@ -9,18 +9,18 @@ SRC_URI[sha256sum] = "f9e7eefc1b3c3d194868a4ef9583b625c18ea3f31a48ebe143183db748
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-aiohttp \
-    ${PYTHON_PN}-eth-abi \
-    ${PYTHON_PN}-eth-account \
-    ${PYTHON_PN}-eth-hash \
-    ${PYTHON_PN}-eth-typing \
-    ${PYTHON_PN}-eth-utils \
-    ${PYTHON_PN}-hexbytes \
-    ${PYTHON_PN}-jsonschema \
-    ${PYTHON_PN}-protobuf \
-    ${PYTHON_PN}-pydantic \
-    ${PYTHON_PN}-requests \
-    ${PYTHON_PN}-typing-extensions \
-    ${PYTHON_PN}-websockets \
-    ${PYTHON_PN}-pyunormalize \
+    python3-aiohttp \
+    python3-eth-abi \
+    python3-eth-account \
+    python3-eth-hash \
+    python3-eth-typing \
+    python3-eth-utils \
+    python3-hexbytes \
+    python3-jsonschema \
+    python3-protobuf \
+    python3-pydantic \
+    python3-requests \
+    python3-typing-extensions \
+    python3-websockets \
+    python3-pyunormalize \
 "
diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb b/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb
index ea830807c2..78af013320 100644
--- a/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb
@@ -8,10 +8,10 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "ea99368214a4ce613924be99d71db58c269631e95eff4fa09b7354e52dc006a5"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-marshmallow \
-    ${PYTHON_PN}-packaging \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-logging \
+    python3-marshmallow \
+    python3-packaging \
+    python3-core \
+    python3-json \
+    python3-asyncio \
+    python3-logging \
 "
diff --git a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
index ab33ce66e8..cedc790815 100644
--- a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab1674858
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-json \
+    python3-codecs \
+    python3-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
index b202d68552..fc73f1b0a5 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
@@ -12,6 +12,6 @@ SRC_URI[sha256sum] = "10e511ea3a8c744631d3bd77e61eb17ed09304c413ad42cf6ddfa4c778
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-logging \
+    python3-six \
+    python3-logging \
 "
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
index 0c3308d650..f8d2769b41 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
@@ -15,9 +15,9 @@ SRC_URI[sha256sum] = "507e811ecea72b18a404947aded4b3390e1db8f826b494d76550ef45bb
 inherit pypi python_flit_core
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-markupsafe \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-profile \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-json \
+    python3-markupsafe \
+    python3-logging \
+    python3-profile \
+    python3-compression \
+    python3-json \
 "
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
index f99b552c63..84c0528446 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
@@ -9,8 +9,8 @@ SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06
 inherit pypi setuptools3 
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
+    python3-stringold \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
index 1459538ea8..b3ba14ff7f 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
@@ -13,12 +13,12 @@ UPSTREAM_CHECK_REGEX = "/WTForms/(?P<pver>(\d+[\.\-_]*)+)"
 inherit pypi python_hatchling
 
 DEPENDS += "\
-    ${PYTHON_PN}-pip-native \
-    ${PYTHON_PN}-babel-native \
+    python3-pip-native \
+    python3-babel-native \
     "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-markupsafe \
+    python3-netserver \
+    python3-numbers \
+    python3-markupsafe \
     "
diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
index 890743b0c4..97dc683785 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
@@ -9,12 +9,12 @@ PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
 
 DEPENDS += "\
-    ${PYTHON_PN}-elementpath-native \
+    python3-elementpath-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-elementpath \
-    ${PYTHON_PN}-modules \
+    python3-elementpath \
+    python3-modules \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
index 80fe945552..482f0c641b 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
@@ -14,6 +14,6 @@ do_install:append() {
 }
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-logging \
+    python3-logging \
 "
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
index 254d9d035e..f4a51f318e 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
@@ -9,8 +9,8 @@ PYPI_PACKAGE = "XStatic-Font-Awesome"
 SRC_URI[sha256sum] = "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
 
 DEPENDS += " \
-    ${PYTHON_PN}-xstatic \
-    ${PYTHON_PN}-pip \
+    python3-xstatic \
+    python3-pip \
 "
 
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
index df4b7c8885..22bfa365ff 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "XStatic"
 SRC_URI[sha256sum] = "402544cc9e179489441054f09c807804e115ea246907de87c0355fb4f5a31268"
 
 DEPENDS += " \
-    ${PYTHON_PN}-pip \
+    python3-pip \
 "
 
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
index 030ad8812a..93c58c11ca 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
@@ -8,5 +8,5 @@ SRC_URI[sha256sum] = "7dbd98421d8090c521655f1b06ca030067f29df5253a8878126bce3a90
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-pyyaml \
+    python3-pyyaml \
 "
diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
index 1963d899b0..4c7bebe760 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "90c431e99192a044a5e0217afd7ca0ca9824af93190332e6f7baf4da53
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-ifaddr \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-async-timeout \
+    python3-ifaddr \
+    python3-asyncio \
+    python3-async-timeout \
 "
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
index 07e329a4a8..149b6583ad 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
@@ -11,7 +11,7 @@ PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"
 
-RDEPENDS:${PN}:class-target += "${PYTHON_PN}-datetime"
+RDEPENDS:${PN}:class-target += "python3-datetime"
 RDEPENDS:${PN}-test += "python3-unittest python3-doctest"
 
 FILES:${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
index 7854b7562c..7a27bf8db5 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 SRC_URI[sha256sum] = "8c8bf83be676a019d3a483455d8b17b442f2acfc620172f245422ca4fc960dd0"
 
 RDEPENDS:${PN} = " \
-	${PYTHON_PN}-google-auth \
-	${PYTHON_PN}-google-auth-oauthlib \
-	${PYTHON_PN}-strenum \
+	python3-google-auth \
+	python3-google-auth-oauthlib \
+	python3-strenum \
 	"
 
 inherit pypi python_flit_core
diff --git a/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb b/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
index c0b111838c..d87e289c5f 100644
--- a/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
+++ b/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
@@ -9,11 +9,11 @@ inherit pypi
 SRC_URI[sha256sum] = "d486741e451287f69568a4d26d70d9acd73a2bbfa275746c535b4209891cccc6"
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-httplib2 \
-        ${PYTHON_PN}-pyasn1 \
-        ${PYTHON_PN}-pyasn1-modules \
-        ${PYTHON_PN}-rsa \
-        ${PYTHON_PN}-six \
+        python3-httplib2 \
+        python3-pyasn1 \
+        python3-pyasn1-modules \
+        python3-rsa \
+        python3-six \
         "
 
 inherit setuptools3
diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.5.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.5.bb
index 0478d0d5c2..8c9262afb8 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.5.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.5.bb
@@ -11,6 +11,6 @@ PYPI_PACKAGE = "ephem"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-math \
+    python3-datetime \
+    python3-math \
     "
diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
index 5a1d5ddb8f..959f0d51aa 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "5cb5123b5cf9ee70584244246816e9114227e0b98ad9176eede6ad54bf
 
 inherit pypi python_poetry_core
 
-RDEPENDS:${PN} = "${PYTHON_PN}-pygments"
+RDEPENDS:${PN} = "python3-pygments"
diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
index e18aa83df2..69578ba84f 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
@@ -13,6 +13,6 @@ inherit pypi python_setuptools_build_meta
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-fcntl \
-        ${PYTHON_PN}-logging \
+        python3-fcntl \
+        python3-logging \
 "
diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
index ab631b256f..89c05c2a68 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
@@ -9,24 +9,24 @@ SRC_URI[sha256sum] = "921fb57ea2ae3ae2806e18895bb0457697f27221b345c8b05afa4cb304
 inherit pypi setuptools3
 
 RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pyyaml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-pywbem \
-    ${PYTHON_PN}-click \
-    ${PYTHON_PN}-requests \
-    ${PYTHON_PN}-prompt-toolkit \
-    ${PYTHON_PN}-mock \
-    ${PYTHON_PN}-packaging \
-    ${PYTHON_PN}-nocasedict \
-    ${PYTHON_PN}-yamlloader \
-    ${PYTHON_PN}-click-repl \
-    ${PYTHON_PN}-click-spinner \
-    ${PYTHON_PN}-asciitree \
-    ${PYTHON_PN}-tabulate \
-    ${PYTHON_PN}-pydicti \
-    ${PYTHON_PN}-nocaselist \
-    ${PYTHON_PN}-custom-inherit \
+    python3-ply \
+    python3-pyyaml \
+    python3-six \
+    python3-pywbem \
+    python3-click \
+    python3-requests \
+    python3-prompt-toolkit \
+    python3-mock \
+    python3-packaging \
+    python3-nocasedict \
+    python3-yamlloader \
+    python3-click-repl \
+    python3-click-spinner \
+    python3-asciitree \
+    python3-tabulate \
+    python3-pydicti \
+    python3-nocaselist \
+    python3-custom-inherit \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


