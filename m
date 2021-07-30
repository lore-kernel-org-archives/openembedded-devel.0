Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.21344.1627633434223872454
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 01:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NNOM2yFs;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id o5so15411735ejy.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5dWCbgAJT4kiNxJSql4ptfYPdd988i39Rr1d2mlZPw=;
        b=NNOM2yFsfUqVC5erLVaZDrUEmyIDNSNOFvf3/38BfdjW0HhyU+ayKYcMaNxCqrA9pt
         ytvCeh1xhMFuvwr7CY3Xm8C8gLsdhwsa3WgbQ2td9dlvay5mT8aUmCXXwmsB/6EffJku
         /0x/SqQUyc2hUMukcvFIfAtxN9oWhUKTEoK5jpRiJoGegs3AUzFL+p1HTOe0sA7/5G9O
         G8hae3D7bvOKl0TPp80QQ3Q6ZDYIxRrT4N+rB6R2hUdYHy4g4kFeiRhrE6x2YUPx13Qb
         hbHXCh1TFTrU1Kal9idFvE90c2SbF9YYI0DY9ql2/0y9E7VEDcTXwxdevvhKd/34ioXP
         mM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5dWCbgAJT4kiNxJSql4ptfYPdd988i39Rr1d2mlZPw=;
        b=IZWfcJk0SkNpkmykYNZFFiuQJYxRlZl98hQKUCHNHCrlc2D/H9eYNRWrjEHtIABOsW
         eHfttTNvQeVh/TxdezEwJEOiwczxbMxpO9OJZBK+8SQu/5M1aytIdQFNnLwKbNB7ysGr
         KoFpOK/6Q4EILts7Jd6/DWEZNdrfzsOqLTJDo3A+AYPqCJyl7w4euqcH4uaFxwyCA5ko
         SdsfPvBoEI9NzxMpNHsrXjlvyuRTDlB9hF46gNZz2KiZ3OsJuf+PCDNP81243QSl+FJs
         qERAv4G7mFfeTVQf5uUnmWmciuV7TLQ+C9wxy50GQwoWXnfNGFx0t+yYzT14WEZ+G3G2
         pzww==
X-Gm-Message-State: AOAM5321PDa1OXSzGm/9z0PGJMXZIJqY4SphwbKfnRAbpGugqf6CEaFr
	2GPIFlqDTj5xcF+G7iIs/cdYSUCOKOrfIg==
X-Google-Smtp-Source: ABdhPJx/e6bq9/LNMiIc4CUT+95WAuSuoBEiJfgEPFfOYuIAN9WEDiGJolwE5CmiP/FD3fDx3ayMnA==
X-Received: by 2002:a17:906:4546:: with SMTP id s6mr1469759ejq.357.1627633431610;
        Fri, 30 Jul 2021 01:23:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r15sm367148edw.46.2021.07.30.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 01:23:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][WIP][PATCH 1/2] Convert to new override syntax
Date: Fri, 30 Jul 2021 10:23:48 +0200
Message-Id: <20210730082349.8729-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the result of automated script (0.9.0) conversion:

oe-core/scripts/contrib/convert-overrides.py .

converting the metadata to use ":" as the override character instead of "_".

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/distutils-base.bbclass                |  2 +-
 classes/distutils.bbclass                     |  2 +-
 classes/python-backports-init.bbclass         |  4 +-
 classes/pythonnative.bbclass                  |  2 +-
 .../python2-target-recipes-blacklist.inc      |  6 +-
 kas/kas-meta-python2-ptest-image.yml          | 10 +--
 recipes-connectivity/gateone/gateone_git.bb   |  8 +--
 .../python-gsocketpool_0.1.6.bb               |  2 +-
 .../python-mprpc/python-mprpc_0.1.17.bb       |  2 +-
 .../python-networkmanager_2.1.bb              |  2 +-
 .../python-pyconnman_0.2.0.bb                 |  2 +-
 .../python-pyro4/python-pyro4_4.77.bb         |  2 +-
 .../python-thrift/python-thrift_0.13.0.bb     |  4 +-
 .../telepathy/telepathy-python_0.15.19.bb     |  6 +-
 .../packagegroup-meta-python2.bb              | 10 +--
 .../python/python-alembic_1.3.2.bb            |  2 +-
 recipes-devtools/python/python-amqp_2.5.2.bb  |  2 +-
 .../python/python-anyjson_0.3.3.bb            |  2 +-
 .../python/python-asn1crypto_1.3.0.bb         |  2 +-
 .../python/python-astroid_2.3.3.bb            |  6 +-
 .../python/python-attrs_19.3.0.bb             |  2 +-
 .../python/python-automat_0.8.0.bb            |  6 +-
 .../python-aws-iot-device-sdk-python_1.4.7.bb | 10 +--
 recipes-devtools/python/python-babel_2.7.0.bb |  2 +-
 ...hon-backports-functools-lru-cache_1.6.1.bb |  4 +-
 .../python/python-backports-init_1.0.bb       |  2 +-
 .../python/python-backports-ssl_3.7.0.1.bb    |  2 +-
 .../python/python-bcrypt_3.1.7.bb             |  2 +-
 .../python/python-beautifulsoup4_4.8.2.bb     |  4 +-
 .../python/python-behave_1.2.6.bb             |  2 +-
 .../python/python-booleanpy_3.7.bb            |  6 +-
 recipes-devtools/python/python-can_3.3.2.bb   |  2 +-
 recipes-devtools/python/python-cffi_1.13.2.bb |  4 +-
 .../python/python-chardet_3.0.4.bb            | 10 +--
 .../python/python-cheetah_2.4.4.bb            |  4 +-
 recipes-devtools/python/python-click_7.0.bb   |  2 +-
 recipes-devtools/python/python-cmd2_0.8.9.bb  |  2 +-
 .../python/python-coloredlogs_10.0.bb         |  6 +-
 .../python/python-configargparse_0.15.1.bb    |  2 +-
 .../python/python-configparser_3.8.1.bb       |  2 +-
 .../python/python-constantly_15.1.0.bb        |  2 +-
 recipes-devtools/python/python-cpuset_1.6.bb  |  2 +-
 recipes-devtools/python/python-crcmod_1.7.bb  |  2 +-
 .../python/python-cryptography_2.8.bb         | 12 ++--
 .../python/python-cython_0.29.14.bb           |  6 +-
 .../python/python-daemon_2.1.2.bb             |  4 +-
 .../python/python-daemonize_2.5.0.bb          |  2 +-
 .../python/python-dateutil_2.8.1.bb           |  4 +-
 recipes-devtools/python/python-dbus_1.2.14.bb |  6 +-
 .../python/python-dbusmock_0.16.7.bb          |  2 +-
 .../python/python-decorator_4.4.1.bb          |  2 +-
 .../python/python-deprecated_1.2.7.bb         |  2 +-
 .../python/python-distutils-extra_2.39.bb     |  2 +-
 .../python/python-django-south_1.0.2.bb       |  2 +-
 .../python/python-django_1.11.26.bb           |  4 +-
 .../python-djangorestframework_3.9.0.bb       |  2 +-
 .../python/python-dnspython_1.16.0.bb         |  2 +-
 .../python/python-docker_4.2.0.bb             |  2 +-
 .../python/python-dominate_2.4.0.bb           |  2 +-
 .../python/python-engineio_3.11.2.bb          |  4 +-
 .../python/python-epydoc_3.0.1.bb             |  2 +-
 recipes-devtools/python/python-evdev_1.2.0.bb |  6 +-
 .../python/python-feedformatter_0.4.bb        |  2 +-
 .../python/python-feedparser_5.2.1.bb         |  2 +-
 .../python/python-flask-babel_0.12.2.bb       |  2 +-
 .../python/python-flask-bcrypt_0.7.1.bb       |  2 +-
 .../python/python-flask-bootstrap_3.3.7.1.bb  |  2 +-
 .../python/python-flask-login_0.4.1.bb        |  2 +-
 .../python/python-flask-mail_0.9.1.bb         |  2 +-
 .../python/python-flask-migrate_2.5.2.bb      |  2 +-
 .../python/python-flask-nav_0.6.bb            |  2 +-
 .../python/python-flask-navigation_0.2.0.bb   |  2 +-
 .../python/python-flask-pymongo_2.3.0.bb      |  2 +-
 .../python/python-flask-restful_0.3.7.bb      |  2 +-
 .../python/python-flask-script_2.0.6.bb       |  2 +-
 .../python/python-flask-sijax_0.4.1.bb        |  2 +-
 .../python/python-flask-socketio_4.2.1.bb     |  2 +-
 .../python/python-flask-sqlalchemy_2.4.1.bb   |  2 +-
 .../python/python-flask-uploads_0.2.1.bb      |  2 +-
 .../python/python-flask-user_0.6.19.bb        |  2 +-
 .../python/python-flask-wtf_0.14.2.bb         |  2 +-
 .../python/python-flask-xstatic_0.0.1.bb      |  4 +-
 recipes-devtools/python/python-flask_1.1.1.bb |  2 +-
 .../python/python-future_0.18.2.bb            |  2 +-
 .../python/python-gdata_2.0.18.bb             |  4 +-
 .../python/python-gevent_1.4.0.bb             |  8 +--
 .../python/python-grpcio-tools_1.14.1.bb      |  4 +-
 .../python/python-grpcio_1.27.1.bb            |  6 +-
 .../python/python-html5lib_1.0.1.bb           |  2 +-
 .../python/python-humanfriendly_4.18.bb       |  2 +-
 .../python/python-humanize_0.5.1.bb           |  2 +-
 .../python/python-hyperlink_19.0.0.bb         |  4 +-
 .../python/python-hypothesis_4.50.2.bb        |  2 +-
 recipes-devtools/python/python-idna_2.8.bb    |  4 +-
 .../python/python-imaging_1.1.7.bb            |  2 +-
 .../python/python-importlib-metadata_0.23.bb  |  2 +-
 .../python/python-incremental_17.5.0.bb       |  4 +-
 .../python/python-inflection_0.3.1.bb         |  2 +-
 .../python/python-iso8601_0.1.12.bb           |  2 +-
 .../python/python-isodate_0.6.0.bb            |  2 +-
 .../python/python-isort_4.3.21.bb             |  2 +-
 .../python/python-itsdangerous_1.1.0.bb       |  2 +-
 .../python/python-javaobj-py3_0.4.0.1.bb      |  4 +-
 .../python/python-jinja2_2.10.3.bb            |  2 +-
 .../python/python-jsonpatch_1.24.bb           |  2 +-
 .../python/python-jsonpointer_2.0.bb          |  2 +-
 .../python/python-jsonschema_3.2.0.bb         |  4 +-
 recipes-devtools/python/python-kombu_4.6.6.bb |  4 +-
 recipes-devtools/python/python-ldap_3.2.0.bb  |  4 +-
 .../python/python-license-expression_1.2.bb   |  4 +-
 .../python/python-lockfile_0.12.2.bb          |  2 +-
 recipes-devtools/python/python-lxml_4.4.2.bb  | 18 ++---
 .../python/python-m2crypto_0.30.1.bb          |  8 +--
 recipes-devtools/python/python-mako_1.1.0.bb  |  2 +-
 .../python/python-markupsafe_1.1.1.bb         |  2 +-
 .../python/python-mccabe_0.4.0.bb             |  2 +-
 recipes-devtools/python/python-mock_3.0.5.bb  |  2 +-
 .../python/python-monotonic_1.5.bb            |  2 +-
 .../python/python-msgpack_0.6.2.bb            |  2 +-
 .../python/python-native_2.7.18.bb            |  6 +-
 .../python/python-ndg-httpsclient_0.5.1.bb    |  4 +-
 .../python/python-netaddr_0.7.19.bb           |  2 +-
 .../python/python-networkx_2.2.bb             |  2 +-
 .../python/python-packaging_20.0.bb           |  2 +-
 .../python/python-paho-mqtt_1.5.0.bb          |  2 +-
 recipes-devtools/python/python-pam_1.8.2.bb   |  2 +-
 .../python/python-pamela_0.3.0.bb             |  2 +-
 .../python/python-parse-type_0.4.2.bb         |  2 +-
 .../python/python-parse_1.14.0.bb             |  2 +-
 .../python/python-passlib_1.7.2.bb            |  2 +-
 recipes-devtools/python/python-paste_3.2.3.bb |  4 +-
 .../python/python-pathlib2_2.3.5.bb           |  2 +-
 recipes-devtools/python/python-pbr_5.4.4.bb   |  4 +-
 recipes-devtools/python/python-pep8_1.7.1.bb  |  2 +-
 .../python/python-pexpect_4.7.0.bb            |  2 +-
 recipes-devtools/python/python-pika_1.1.0.bb  |  2 +-
 recipes-devtools/python/python-pip_19.3.1.bb  |  2 +-
 .../python/python-pluggy_0.13.1.bb            |  2 +-
 recipes-devtools/python/python-ply_3.11.bb    |  2 +-
 .../python/python-prettytable_0.7.2.bb        |  2 +-
 .../python/python-progress_1.5.bb             |  2 +-
 .../python/python-prompt-toolkit_2.0.10.bb    |  2 +-
 .../python/python-protobuf_3.9.2.bb           |  2 +-
 .../python/python-psutil_5.6.7.bb             |  4 +-
 .../python/python-ptyprocess_0.6.0.bb         |  2 +-
 .../python/python-pyalsaaudio_0.8.4.bb        |  2 +-
 .../python/python-pyasn1-modules_0.2.7.bb     |  2 +-
 .../python/python-pyasn1_0.4.8.bb             |  2 +-
 .../python/python-pybluez_0.22.bb             |  2 +-
 .../python/python-pycodestyle_2.5.0.bb        |  4 +-
 .../python/python-pycparser_2.19.bb           |  2 +-
 .../python/python-pycrypto_2.6.1.bb           |  2 +-
 .../python/python-pycryptodomex_3.9.4.bb      |  6 +-
 .../python/python-pydbus_0.6.0.bb             |  2 +-
 .../python/python-pyfirmata_1.1.0.bb          |  2 +-
 .../python/python-pyflakes_2.1.1.bb           |  2 +-
 .../python/python-pyflame_1.6.7.bb            | 12 ++--
 .../python/python-pygobject_3.34.0.bb         |  8 +--
 recipes-devtools/python/python-pygpgme_0.3.bb |  2 +-
 .../python/python-pyinotify_0.9.6.bb          |  2 +-
 .../python/python-pyjks_19.0.0.bb             |  2 +-
 recipes-devtools/python/python-pyjwt_1.7.1.bb |  2 +-
 .../python/python-pylint_1.8.3.bb             |  6 +-
 .../python/python-pymisp_2.4.119.1.bb         |  4 +-
 .../python/python-pymongo_3.10.1.bb           |  6 +-
 .../python/python-pymysql_0.9.3.bb            |  2 +-
 .../python/python-pyopenssl_19.1.0.bb         |  6 +-
 .../python/python-pyparsing_2.4.6.bb          |  2 +-
 .../python/python-pyperclip_1.7.0.bb          |  2 +-
 .../python/python-pyperf_1.7.0.bb             |  2 +-
 .../python/python-pyrex-native_0.9.9.bb       |  2 +-
 recipes-devtools/python/python-pyrex_0.9.9.bb |  2 +-
 .../python/python-pyroute2_0.5.7.bb           |  4 +-
 .../python/python-pyrsistent_0.15.7.bb        |  4 +-
 recipes-devtools/python/python-pyrtm_0.4.2.bb | 10 +--
 .../python/python-pyserial_3.4.bb             |  8 +--
 recipes-devtools/python/python-pysmi_0.3.4.bb |  2 +-
 .../python/python-pysnmp_4.4.9.bb             |  2 +-
 .../python/python-pysocks_1.7.1.bb            |  2 +-
 .../python/python-pysqlite_2.8.3.bb           |  4 +-
 .../python/python-pystache_0.5.4.bb           |  2 +-
 ...ython-pytest-helpers-namespace_2019.1.8.bb |  2 +-
 .../python/python-pytest-runner_5.2.bb        |  4 +-
 .../python-pytest-tempdir_2019.10.12.bb       |  2 +-
 .../python/python-pytest_4.6.9.bb             |  8 +--
 recipes-devtools/python/python-pytz_2019.3.bb |  2 +-
 .../python/python-pyudev_0.21.0.bb            |  4 +-
 .../python/python-pyyaml_5.4.1.bb             |  2 +-
 .../python/python-pyzmq_17.1.0.bb             |  8 +--
 .../python/python-rdflib_4.2.2.bb             |  2 +-
 .../python/python-redis_2.10.6.bb             |  2 +-
 .../python/python-requests-oauthlib_1.3.0.bb  |  2 +-
 .../python/python-requests_2.23.0.bb          |  4 +-
 .../python/python-rfc3339-validator_0.1.1.bb  |  6 +-
 .../python/python-rfc3986-validator_0.1.1.bb  |  6 +-
 ...thon-robotframework-seriallibrary_0.3.1.bb |  2 +-
 .../python/python-robotframework_3.0.4.bb     |  2 +-
 .../python/python-scrypt_0.8.6.bb             |  4 +-
 .../python/python-selectors34_1.2.bb          |  2 +-
 .../python/python-serpent_1.28.bb             |  2 +-
 .../python/python-setuptools-scm_3.3.3.bb     |  6 +-
 recipes-devtools/python/python-setuptools.inc |  8 +--
 .../python/python-setuptools_42.0.2.bb        |  6 +-
 recipes-devtools/python/python-sh_1.12.14.bb  |  2 +-
 .../python/python-simplejson_3.17.0.bb        |  6 +-
 .../python/python-slip-dbus_0.6.5.bb          |  4 +-
 .../python/python-snakefood_1.4.bb            |  4 +-
 .../python/python-snimpy_0.8.13.bb            |  2 +-
 .../python/python-socketio_4.3.1.bb           |  2 +-
 .../python/python-soupsieve_1.9.4.bb          |  2 +-
 .../python/python-sparts_0.7.3.bb             |  2 +-
 .../python/python-sqlalchemy_1.3.12.bb        |  2 +-
 .../python/python-stevedore_1.31.0.bb         |  2 +-
 recipes-devtools/python/python-systemd_234.bb |  6 +-
 recipes-devtools/python/python-toml_0.10.0.bb |  2 +-
 .../python/python-tornado-redis_2.4.18.bb     |  4 +-
 .../python/python-tornado_6.0.3.bb            |  8 +--
 recipes-devtools/python/python-tqdm_4.41.1.bb |  2 +-
 .../python/python-traceback2_1.4.0.bb         |  2 +-
 .../python/python-twisted_19.10.0.bb          | 72 +++++++++----------
 .../python/python-twitter_3.8.0.bb            |  2 +-
 recipes-devtools/python/python-ujson_1.35.bb  |  2 +-
 .../python/python-unidiff_0.5.5.bb            |  2 +-
 .../python/python-urllib3_1.25.7.bb           |  2 +-
 .../python/python-vcversioner_2.16.0.0.bb     |  4 +-
 recipes-devtools/python/python-vine_1.1.4.bb  |  2 +-
 .../python/python-vobject_0.9.6.1.bb          |  2 +-
 .../python/python-waitress_1.4.2.bb           |  2 +-
 .../python/python-webcolors_1.8.1.bb          |  2 +-
 .../python/python-webencodings_0.5.1.bb       |  2 +-
 .../python/python-werkzeug_0.16.0.bb          |  6 +-
 recipes-devtools/python/python-which_1.1.0.bb |  2 +-
 .../python/python-whoosh_2.7.4.bb             |  2 +-
 .../python/python-wrapt_1.11.2.bb             |  2 +-
 .../python/python-wtforms_2.2.1.bb            |  2 +-
 recipes-devtools/python/python-xlrd_1.2.0.bb  |  2 +-
 recipes-devtools/python/python-yappi_1.0.bb   |  2 +-
 recipes-devtools/python/python-zipp_0.6.0.bb  |  2 +-
 .../python/python-zopeinterface_4.7.1.bb      | 14 ++--
 recipes-devtools/python/python.inc            |  4 +-
 recipes-devtools/python/python_2.7.18.bb      | 42 +++++------
 .../python-cson/python-cson_git.bb            |  4 +-
 .../python-pyephem/python-pyephem_3.7.7.0.bb  |  2 +-
 .../python-pyparted/python-pyparted_git.bb    |  8 +--
 .../pywbem/python-pywbem_0.15.0.bb            |  6 +-
 .../dnssec-conf/dnssec-conf_2.02.bb           |  2 +-
 246 files changed, 461 insertions(+), 461 deletions(-)

diff --git a/classes/distutils-base.bbclass b/classes/distutils-base.bbclass
index 9f398d7..803dc8b 100644
--- a/classes/distutils-base.bbclass
+++ b/classes/distutils-base.bbclass
@@ -1,4 +1,4 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
-RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
+RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base pythonnative
diff --git a/classes/distutils.bbclass b/classes/distutils.bbclass
index 3759b58..860d744 100644
--- a/classes/distutils.bbclass
+++ b/classes/distutils.bbclass
@@ -10,7 +10,7 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
     --install-data=${datadir}"
 
 DISTUTILS_PYTHON = "python"
-DISTUTILS_PYTHON_class-native = "nativepython"
+DISTUTILS_PYTHON:class-native = "nativepython"
 
 distutils_do_configure() {
         if [ "${CLEANBROKEN}" != "1" ] ; then
diff --git a/classes/python-backports-init.bbclass b/classes/python-backports-init.bbclass
index 727bc4a..0d8d82c 100644
--- a/classes/python-backports-init.bbclass
+++ b/classes/python-backports-init.bbclass
@@ -1,7 +1,7 @@
 inherit python-dir
 
-RDEPENDS_${PN} += "python-backports-init"
+RDEPENDS:${PN} += "python-backports-init"
 
-do_install_prepend() {
+do_install:prepend() {
     rm -rf $(find . -path "*/backports/__init__.py" -type f)
 }
diff --git a/classes/pythonnative.bbclass b/classes/pythonnative.bbclass
index 0e9019d..b34302c 100644
--- a/classes/pythonnative.bbclass
+++ b/classes/pythonnative.bbclass
@@ -5,7 +5,7 @@ PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 # PYTHON_EXECUTABLE is used by cmake
 PYTHON_EXECUTABLE="${PYTHON}"
 EXTRANATIVEPATH += "python-native"
-DEPENDS_append = " python-native "
+DEPENDS:append = " python-native "
 
 # python-config and other scripts are using distutils modules
 # which we patch to access these variables
diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index f55ed0b..71833dd 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -3,10 +3,10 @@
 # from other layers:
 # meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
 PNBLACKLIST[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this , then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-RDEPENDS_packagegroup-meta-oe-dbs-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'mysql-python', d)}"
+RDEPENDS:packagegroup-meta-oe-dbs-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'mysql-python', d)}"
 # meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
 PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-RDEPENDS_packagegroup-meta-oe-support-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'lio-utils', d)}"
+RDEPENDS:packagegroup-meta-oe-support-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'lio-utils', d)}"
 # meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
 PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-RDEPENDS_packagegroup-meta-oe-extended-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'openlmi-tools', d)}"
+RDEPENDS:packagegroup-meta-oe-extended-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'openlmi-tools', d)}"
diff --git a/kas/kas-meta-python2-ptest-image.yml b/kas/kas-meta-python2-ptest-image.yml
index a2ee8ca..512e96e 100644
--- a/kas/kas-meta-python2-ptest-image.yml
+++ b/kas/kas-meta-python2-ptest-image.yml
@@ -9,16 +9,16 @@ target: meta-python2-ptest-image
 
 local_conf_header:
   enable_gtk_in_qemu: |
-    DISTRO_FEATURES_append = "opengl"
-    PACKAGECONFIG_pn-qemu-system-native = "fdt alsa kvm virglrenderer glx gtk+"
+    DISTRO_FEATURES:append = "opengl"
+    PACKAGECONFIG:pn-qemu-system-native = "fdt alsa kvm virglrenderer glx gtk+"
   enable_ptest_and_testimage: |
     IMAGE_CLASSES += " testimage"
-    DISTRO_FEAURES_append = " ptest"
+    DISTRO_FEAURES:append = " ptest"
     EXTRA_IMAGE_FEATURES = "debug-tweaks"
     TESTIMAGE_AUTO = "1"
     TEST_SUITES = " ping ssh python2 ptest"
     TEST_QEMUPARAMS += "-smp 4 -m 8192"
     TEST_RUNQEMUPARAMS = "kvm gl-es gtk"
     IMAGE_ROOTFS_SIZE ?= "8192"
-    IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
-    IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
+    IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
+    IMAGE_INSTALL:append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
diff --git a/recipes-connectivity/gateone/gateone_git.bb b/recipes-connectivity/gateone/gateone_git.bb
index 83e417c..0220798 100644
--- a/recipes-connectivity/gateone/gateone_git.bb
+++ b/recipes-connectivity/gateone/gateone_git.bb
@@ -21,7 +21,7 @@ DISTUTILS_INSTALL_ARGS += " \
     --install-scripts=${bindir} \
     --skip_init_scripts"
 
-do_install_append() {
+do_install:append() {
 
     # fix up hardcoded paths
     for file in gateone.service gateone-init 80oe.conf; do
@@ -46,8 +46,8 @@ do_install_append() {
     install -d ${D}${localstatedir}/lib/gateone
 }
 
-FILES_${PN} = "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
-RDEPENDS_${PN} = "mime-support \
+FILES:${PN} = "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PN} = "mime-support \
                   openssh-ssh \
                   python-compression \
                   python-contextlib \
@@ -81,7 +81,7 @@ RDEPENDS_${PN} = "mime-support \
                   bash \
 "
 
-SYSTEMD_SERVICE_${PN} = "gateone.service"
+SYSTEMD_SERVICE:${PN} = "gateone.service"
 INITSCRIPT_NAME = "gateone"
 
 PNBLACKLIST[gateone] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb b/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
index 1100dd3..7fb9643 100644
--- a/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
+++ b/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 DEPENDS += "${PYTHON_PN}-gevent"
-RDEPENDS_${PN} += "${PYTHON_PN}-gevent"
+RDEPENDS:${PN} += "${PYTHON_PN}-gevent"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
diff --git a/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb b/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
index ed24992..ad1dca6 100644
--- a/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
+++ b/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 
 DEPENDS += "${PYTHON_PN}-gevent"
-RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
+RDEPENDS:${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
 
 SRC_URI[md5sum] = "8d97961051422f3de315613434982d3b"
 SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a"
diff --git a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
index 78775e3..e3b05c9 100644
--- a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
+++ b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca
 PYPI_PACKAGE = "python-networkmanager"
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "networkmanager python-dbus python-six"
+RDEPENDS:${PN} = "networkmanager python-dbus python-six"
 
 python() {
     if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
diff --git a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
index e1f5a14..d72579b 100644
--- a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
+++ b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     connman \
     python-dbus \
     python-future \
diff --git a/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb b/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
index a767779..a082132 100644
--- a/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
+++ b/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "Pyro4"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-selectors34 \
     ${PYTHON_PN}-serpent \
diff --git a/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb b/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
index f3c4bd8..09cd98d 100644
--- a/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
+++ b/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
@@ -8,9 +8,9 @@ SRC_URI[sha256sum] = "9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9
 inherit pypi setuptools
 
 # Use different filename to prevent conflicts with thrift itself
-PYPI_SRC_URI_append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
+PYPI_SRC_URI:append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-stringold \
diff --git a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 640296d..362a823 100644
--- a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
 
 DEPENDS = "libxslt-native"
-RDEPENDS_${PN} += "python-dbus"
+RDEPENDS:${PN} += "python-dbus"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://parallel_make.patch \
@@ -19,12 +19,12 @@ inherit autotools pythonnative
 SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
 SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
 
-FILES_${PN} += "\
+FILES:${PN} += "\
     ${libdir}/python*/site-packages/telepathy/*.py \
     ${libdir}/python*/site-packages/telepathy/*/*.py \
 "
 
-do_install_append () {
+do_install:append () {
     rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
     rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
     rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 45f2ed7..6183203 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -7,12 +7,12 @@ PACKAGES = ' \
     packagegroup-meta-python2 \
 '
 
-RDEPENDS_packagegroup-meta-python2 = "\
+RDEPENDS:packagegroup-meta-python2 = "\
     packagegroup-meta-python2-extended \
     packagegroup-meta-python2-connectivity \
 "
 
-RDEPENDS_packagegroup-meta-python2 = "\
+RDEPENDS:packagegroup-meta-python2 = "\
     python-psutil python-certifi python-flask python-pyroute2 python-pyopenssl python-pylint \
     python-semver python-wrapt python-networkx python-behave python-dominate python-flask-user \
     python-attrs python-humanize python-six python-flask-login python-zopeinterface python-sijax \
@@ -64,14 +64,14 @@ RDEPENDS_packagegroup-meta-python2 = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
 
-RDEPENDS_packagegroup-meta-python2-extended = "\
+RDEPENDS:packagegroup-meta-python2-extended = "\
     python-cson \
     python-pyephem \
     python-pyparted \
     python-pywbem \
 "
 
-RDEPENDS_packagegroup-meta-python2-connectivity = "\
+RDEPENDS:packagegroup-meta-python2-connectivity = "\
     python-gsocketpool \
     python-mprpc \
     python-networkmanager \
@@ -82,7 +82,7 @@ RDEPENDS_packagegroup-meta-python2-connectivity = "\
     python-txws \
 "
 
-RDEPENDS_packagegroup-meta-python2-ptest = "\
+RDEPENDS:packagegroup-meta-python2-ptest = "\
     python-booleanpy-ptest \
     python-cryptography-ptest \
     python-pygpgme-ptest \
diff --git a/recipes-devtools/python/python-alembic_1.3.2.bb b/recipes-devtools/python/python-alembic_1.3.2.bb
index 9c527e5..7f85c88 100644
--- a/recipes-devtools/python/python-alembic_1.3.2.bb
+++ b/recipes-devtools/python/python-alembic_1.3.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "3b0cb1948833e062f4048992fbc97ecfaaaac24aaa0d83a1202a99fb58
 
 PYPI_PACKAGE = "alembic"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-editor \
     ${PYTHON_PN}-mako \
diff --git a/recipes-devtools/python/python-amqp_2.5.2.bb b/recipes-devtools/python/python-amqp_2.5.2.bb
index 5ae271e..0f314db 100644
--- a/recipes-devtools/python/python-amqp_2.5.2.bb
+++ b/recipes-devtools/python/python-amqp_2.5.2.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "77f1aef9410698d20eaeac5b73a87817365f457a507d82edf292e12cbb
 PYPI_PACKAGE = "amqp"
 inherit setuptools pypi
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
 	python-vine \
 	"
 
diff --git a/recipes-devtools/python/python-anyjson_0.3.3.bb b/recipes-devtools/python/python-anyjson_0.3.3.bb
index 6845569..6843972 100644
--- a/recipes-devtools/python/python-anyjson_0.3.3.bb
+++ b/recipes-devtools/python/python-anyjson_0.3.3.bb
@@ -10,6 +10,6 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
 SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-simplejson"
+RDEPENDS:${PN} += "${PYTHON_PN}-simplejson"
 
 PNBLACKLIST[python-anyjson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-asn1crypto_1.3.0.bb b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
index 3abb699..49e52dc 100644
--- a/recipes-devtools/python/python-asn1crypto_1.3.0.bb
+++ b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
@@ -15,7 +15,7 @@ PYPI_PACKAGE = "asn1crypto"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
diff --git a/recipes-devtools/python/python-astroid_2.3.3.bb b/recipes-devtools/python/python-astroid_2.3.3.bb
index 44b0a71..11c4f45 100644
--- a/recipes-devtools/python/python-astroid_2.3.3.bb
+++ b/recipes-devtools/python/python-astroid_2.3.3.bb
@@ -25,12 +25,12 @@ PACKAGES =+ "${PN}-tests"
 
 inherit pypi setuptools
 
-FILES_${PN}-tests += " \
+FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/astroid/test* \
     ${PYTHON_SITEPACKAGES_DIR}/astroid/__pycache__/test* \
 "
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-backports-functools-lru-cache \
     ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-enum34 \
@@ -44,7 +44,7 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-wrapt \
 "
 
-RDEPENDS_${PN}-tests_class-target += "\
+RDEPENDS:${PN}-tests:class-target += "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
 "
diff --git a/recipes-devtools/python/python-attrs_19.3.0.bb b/recipes-devtools/python/python-attrs_19.3.0.bb
index 0e39922..869df01 100644
--- a/recipes-devtools/python/python-attrs_19.3.0.bb
+++ b/recipes-devtools/python/python-attrs_19.3.0.bb
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "5b2db50fcc31be34d32798183c9bd062"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-subprocess \
diff --git a/recipes-devtools/python/python-automat_0.8.0.bb b/recipes-devtools/python/python-automat_0.8.0.bb
index 55f5388..f48d95b 100644
--- a/recipes-devtools/python/python-automat_0.8.0.bb
+++ b/recipes-devtools/python/python-automat_0.8.0.bb
@@ -7,12 +7,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-automat:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-automat:"
 
 SRC_URI[md5sum] = "47e980a48201a1dabe37fa11f0187013"
 SRC_URI[sha256sum] = "269a09dfb063a3b078983f4976d83f0a0d3e6e7aaf8e27d8df1095e09dc4a484"
 
-SRC_URI_append = " \
+SRC_URI:append = " \
     file://0001-setup.py-remove-the-dependency-on-m2r.patch \
 "
 
@@ -22,7 +22,7 @@ PYPI_PACKAGE = "Automat"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
    ${PYTHON_PN}-attrs \
    ${PYTHON_PN}-six \
 "
diff --git a/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb b/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
index f067c88..b3fd1a5 100644
--- a/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
+++ b/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
 SECTION = "devel/python"
 
 LICENSE = "Apache-2.0 & (EPL-1.0 | EDL-1.0)"
-LICENSE_${PN}-examples = "Apache-2.0"
+LICENSE:${PN}-examples = "Apache-2.0"
 LIC_FILES_CHKSUM = "\
     file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
@@ -17,7 +17,7 @@ inherit pypi setuptools
 
 PYPI_PACKAGE = "AWSIoTPythonSDK"
 
-do_install_append() {
+do_install:append() {
         install -d -m0755 ${D}${datadir}/${BPN}/examples
         cp --preserve=mode,timestamps -R ${S}/samples/* ${D}${datadir}/${BPN}/examples
         # this requires the full blown AWS Python SDK
@@ -26,7 +26,7 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-examples"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
@@ -38,9 +38,9 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
 "
 
-RDEPENDS_${PN}-examples += "${PN} ${PYTHON_PN}-argparse"
+RDEPENDS:${PN}-examples += "${PN} ${PYTHON_PN}-argparse"
 
-FILES_${PN}-examples = "${datadir}/${BPN}/examples"
+FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-babel_2.7.0.bb b/recipes-devtools/python/python-babel_2.7.0.bb
index cb23645..49805ba 100644
--- a/recipes-devtools/python/python-babel_2.7.0.bb
+++ b/recipes-devtools/python/python-babel_2.7.0.bb
@@ -15,7 +15,7 @@ inherit pypi setuptools
 
 CLEANBROKEN = "1"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-difflib \
     ${PYTHON_PN}-distutils \
diff --git a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
index 62cc619..7277292 100644
--- a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
+++ b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
@@ -13,7 +13,7 @@ DEPENDS += "python-setuptools-scm-native"
 
 inherit setuptools pypi python-backports-init
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-threading \
@@ -24,7 +24,7 @@ do_install() {
     install ${B}/backports/functools_lru_cache.py ${D}${PYTHON_SITEPACKAGES_DIR}/backports/
 }
 
-FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/functools_lru_cache.py"
+FILES:${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/functools_lru_cache.py"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-backports-init_1.0.bb b/recipes-devtools/python/python-backports-init_1.0.bb
index cbb0351..0666d9e 100644
--- a/recipes-devtools/python/python-backports-init_1.0.bb
+++ b/recipes-devtools/python/python-backports-init_1.0.bb
@@ -22,7 +22,7 @@ do_install() {
     install ${WORKDIR}/backports/__init__.py ${D}${PYTHON_SITEPACKAGES_DIR}/backports/
 }
 
-FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py"
+FILES:${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
index 4734e6d..3d0bd2e 100644
--- a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
+++ b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
@@ -16,6 +16,6 @@ PYPI_PACKAGE = "backports.ssl_match_hostname"
 
 inherit pypi setuptools python-backports-init
 
-RDEPENDS_${PN} += "${PYTHON_PN}-pkgutil"
+RDEPENDS:${PN} += "${PYTHON_PN}-pkgutil"
 
 PNBLACKLIST[python-backports-ssl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-bcrypt_3.1.7.bb b/recipes-devtools/python/python-bcrypt_3.1.7.bb
index 9da9c47..db2ef3b 100644
--- a/recipes-devtools/python/python-bcrypt_3.1.7.bb
+++ b/recipes-devtools/python/python-bcrypt_3.1.7.bb
@@ -13,7 +13,7 @@ DEPENDS += "${PYTHON_PN}-cffi-native"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-shell \
diff --git a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
index be7b3fe..15595cd 100644
--- a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
+++ b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
@@ -13,13 +13,13 @@ SRC_URI[sha256sum] = "05fd825eb01c290877657a56df4c6e4c311b3965bda790c613a3d6fb01
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-html5lib \
     ${PYTHON_PN}-lxml \
     ${PYTHON_PN}-soupsieve \
 "
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-logging \
 "
diff --git a/recipes-devtools/python/python-behave_1.2.6.bb b/recipes-devtools/python/python-behave_1.2.6.bb
index 61b57af..da4632b 100644
--- a/recipes-devtools/python/python-behave_1.2.6.bb
+++ b/recipes-devtools/python/python-behave_1.2.6.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5ccc
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-parse-type \
diff --git a/recipes-devtools/python/python-booleanpy_3.7.bb b/recipes-devtools/python/python-booleanpy_3.7.bb
index 759996a..d2f0dcc 100644
--- a/recipes-devtools/python/python-booleanpy_3.7.bb
+++ b/recipes-devtools/python/python-booleanpy_3.7.bb
@@ -12,11 +12,11 @@ PYPI_PACKAGE = "boolean.py"
 
 inherit pypi setuptools ptest
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-lang \
 "
 
-RDEPENDS_${PN}-ptest += "\
+RDEPENDS:${PN}-ptest += "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-pytest \
 "
@@ -26,7 +26,7 @@ do_install_ptest() {
     cp -rf ${S}/boolean/test_boolean.py  ${D}${PTEST_PATH}/boolean/
 }
 
-FILES_${PN}-test = ""
+FILES:${PN}-test = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-can_3.3.2.bb b/recipes-devtools/python/python-can_3.3.2.bb
index 2f46526..1c8ffa1 100644
--- a/recipes-devtools/python/python-can_3.3.2.bb
+++ b/recipes-devtools/python/python-can_3.3.2.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE="python-can"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-logging \
diff --git a/recipes-devtools/python/python-cffi_1.13.2.bb b/recipes-devtools/python/python-cffi_1.13.2.bb
index 68a7326..d8f91fe 100644
--- a/recipes-devtools/python/python-cffi_1.13.2.bb
+++ b/recipes-devtools/python/python-cffi_1.13.2.bb
@@ -12,11 +12,11 @@ DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-subprocess \
 "
 
-RDEPENDS_${PN}_class-target = " \
+RDEPENDS:${PN}:class-target = " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-pycparser \
diff --git a/recipes-devtools/python/python-chardet_3.0.4.bb b/recipes-devtools/python/python-chardet_3.0.4.bb
index ea02f4e..50cf3dc 100644
--- a/recipes-devtools/python/python-chardet_3.0.4.bb
+++ b/recipes-devtools/python/python-chardet_3.0.4.bb
@@ -14,23 +14,23 @@ DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
 PACKAGES =+ "${PN}-cli"
 
-RDEPENDS_${PN}-cli = "${PN} "
+RDEPENDS:${PN}-cli = "${PN} "
 
-FILES_${PN}-cli += " \
+FILES:${PN}-cli += " \
     ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
 "
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-logging \
 "
 
 inherit pypi setuptools
 
-do_install_append() {
+do_install:append() {
     mv ${D}${bindir}/chardetect ${D}${bindir}/chardetect-py2
 }
 
-RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
+RDEPENDS:${PN} += "${PYTHON_PN}-argparse"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-cheetah_2.4.4.bb b/recipes-devtools/python/python-cheetah_2.4.4.bb
index 57fc683..453befd 100644
--- a/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -7,8 +7,8 @@ PR = "r3"
 PYPI_PACKAGE = "Cheetah"
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-pickle python-pprint"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "python-pickle python-pprint"
+RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-click_7.0.bb b/recipes-devtools/python/python-click_7.0.bb
index 720d271..404877e 100644
--- a/recipes-devtools/python/python-click_7.0.bb
+++ b/recipes-devtools/python/python-click_7.0.bb
@@ -21,7 +21,7 @@ PYPI_PACKAGE = "Click"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-threading \
diff --git a/recipes-devtools/python/python-cmd2_0.8.9.bb b/recipes-devtools/python/python-cmd2_0.8.9.bb
index 8f0815c..07a46a7 100644
--- a/recipes-devtools/python/python-cmd2_0.8.9.bb
+++ b/recipes-devtools/python/python-cmd2_0.8.9.bb
@@ -17,7 +17,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-pyparsing \
diff --git a/recipes-devtools/python/python-coloredlogs_10.0.bb b/recipes-devtools/python/python-coloredlogs_10.0.bb
index b1f3411..c403910 100644
--- a/recipes-devtools/python/python-coloredlogs_10.0.bb
+++ b/recipes-devtools/python/python-coloredlogs_10.0.bb
@@ -17,15 +17,15 @@ SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e
 
 inherit pypi setuptools
 
-do_compile_prepend() {
+do_compile:prepend() {
     sed -ie "s/find_pth_directory(),/'',/g" ${S}/setup.py
 }
 
-do_install_append() {
+do_install:append() {
     rm -rf ${D}${datadir}
 }
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-humanfriendly \
 "
 
diff --git a/recipes-devtools/python/python-configargparse_0.15.1.bb b/recipes-devtools/python/python-configargparse_0.15.1.bb
index 68554a6..f140e66 100644
--- a/recipes-devtools/python/python-configargparse_0.15.1.bb
+++ b/recipes-devtools/python/python-configargparse_0.15.1.bb
@@ -18,7 +18,7 @@ inherit pypi setuptools
 PACKAGECONFIG ?= "yaml"
 PACKAGECONFIG[yaml] = ",,,${PYTHON_PN}-pyyaml"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-shell \
 "
diff --git a/recipes-devtools/python/python-configparser_3.8.1.bb b/recipes-devtools/python/python-configparser_3.8.1.bb
index b6f4058..b8daf0d 100644
--- a/recipes-devtools/python/python-configparser_3.8.1.bb
+++ b/recipes-devtools/python/python-configparser_3.8.1.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "bc37850f0cc42a1725a796ef7d92690651bf1af37d744cc63161dac62c
 
 inherit pypi setuptools python-backports-init
 
-RDEPENDS_${PN} += "python-pkgutil"
+RDEPENDS:${PN} += "python-pkgutil"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-constantly_15.1.0.bb b/recipes-devtools/python/python-constantly_15.1.0.bb
index e42ca33..3fe4048 100644
--- a/recipes-devtools/python/python-constantly_15.1.0.bb
+++ b/recipes-devtools/python/python-constantly_15.1.0.bb
@@ -12,6 +12,6 @@ SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba5914
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-json"
+RDEPENDS:${PN} += "${PYTHON_PN}-json"
 
 PNBLACKLIST[python-constantly] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cpuset_1.6.bb b/recipes-devtools/python/python-cpuset_1.6.bb
index 2a797df..eb9adaf 100644
--- a/recipes-devtools/python/python-cpuset_1.6.bb
+++ b/recipes-devtools/python/python-cpuset_1.6.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/lpechacek/cpuset.git;protocol=https;"
 
 inherit distutils
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     python-core \
     python-re \
     python-logging \
diff --git a/recipes-devtools/python/python-crcmod_1.7.bb b/recipes-devtools/python/python-crcmod_1.7.bb
index c15db9c..9b9117f 100644
--- a/recipes-devtools/python/python-crcmod_1.7.bb
+++ b/recipes-devtools/python/python-crcmod_1.7.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f2
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-unittest"
+RDEPENDS:${PN} += "${PYTHON_PN}-unittest"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-cryptography_2.8.bb b/recipes-devtools/python/python-cryptography_2.8.bb
index b694c59..d56e85f 100644
--- a/recipes-devtools/python/python-cryptography_2.8.bb
+++ b/recipes-devtools/python/python-cryptography_2.8.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-asn1crypto \
@@ -31,7 +31,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-six \
 "
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-numbers \
@@ -41,7 +41,7 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-threading \
 "
 
-RDEPENDS_${PN}-ptest += " \
+RDEPENDS:${PN}-ptest += " \
     ${PN} \
     ${PYTHON_PN}-cryptography-vectors \
     ${PYTHON_PN}-hypothesis \
@@ -60,7 +60,7 @@ do_install_ptest() {
     cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
 }
 
-FILES_${PN}-dbg += " \
+FILES:${PN}-dbg += " \
     ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
 "
 
@@ -72,12 +72,12 @@ DEPENDS += " \
     ${PYTHON_PN}-enum34 \
 "
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-ipaddress \
 "
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-ipaddress \
     ${PYTHON_PN}-contextlib \
diff --git a/recipes-devtools/python/python-cython_0.29.14.bb b/recipes-devtools/python/python-cython_0.29.14.bb
index 606e031..22c5bd0 100644
--- a/recipes-devtools/python/python-cython_0.29.14.bb
+++ b/recipes-devtools/python/python-cython_0.29.14.bb
@@ -18,7 +18,7 @@ PYPI_PACKAGE = "Cython"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-distribute \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
@@ -30,7 +30,7 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-xml \
 "
 
-RDEPENDS_${PN}_class-nativesdk += "\
+RDEPENDS:${PN}:class-nativesdk += "\
     nativesdk-${PYTHON_PN}-misc \
     nativesdk-${PYTHON_PN}-netserver \
     nativesdk-${PYTHON_PN}-pkgutil \
@@ -40,7 +40,7 @@ RDEPENDS_${PN}_class-nativesdk += "\
     nativesdk-${PYTHON_PN}-xml \
 "
 
-do_install_append() {
+do_install:append() {
 	# Make sure we use /usr/bin/env python
 	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
diff --git a/recipes-devtools/python/python-daemon_2.1.2.bb b/recipes-devtools/python/python-daemon_2.1.2.bb
index ea2f7cc..9bd0808 100644
--- a/recipes-devtools/python/python-daemon_2.1.2.bb
+++ b/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pagure.io/python-daemon/"
 SECTION = "devel/python"
 
 DEPENDS += "python-docutils-native"
-RDEPENDS_${PN} = "python-docutils \
+RDEPENDS:${PN} = "python-docutils \
                   python-lockfile (>= 0.10) \
                   python-resource \
 "
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "261c859be5c12ae7d4286dc6951e87e9e1a70a882a8b41fd926efc1ec4
 #     i = p.rfind('/') + 1
 # AttributeError: 'NoneType' object has no attribute 'rfind'
 #S = "${WORKDIR}/python-daemon"
-SRC_URI_append = " \
+SRC_URI:append = " \
                   file://0001-Workaround-for-issue-2-1.patch \
 "
 
diff --git a/recipes-devtools/python/python-daemonize_2.5.0.bb b/recipes-devtools/python/python-daemonize_2.5.0.bb
index 8db5ae3..17d13b6 100644
--- a/recipes-devtools/python/python-daemonize_2.5.0.bb
+++ b/recipes-devtools/python/python-daemonize_2.5.0.bb
@@ -5,7 +5,7 @@ SRCNAME = "daemonize"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
                python-fcntl \
                python-unixadmin \
                python-logging \
diff --git a/recipes-devtools/python/python-dateutil_2.8.1.bb b/recipes-devtools/python/python-dateutil_2.8.1.bb
index 40127e3..8ed0cbd 100644
--- a/recipes-devtools/python/python-dateutil_2.8.1.bb
+++ b/recipes-devtools/python/python-dateutil_2.8.1.bb
@@ -16,10 +16,10 @@ PYPI_PACKAGE = "python-dateutil"
 inherit pypi setuptools
 
 PACKAGES =+ "${PN}-zoneinfo"
-FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
+FILES:${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
 
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS:${PN}:class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-six \
diff --git a/recipes-devtools/python/python-dbus_1.2.14.bb b/recipes-devtools/python/python-dbus_1.2.14.bb
index 3ac6c27..50d9959 100644
--- a/recipes-devtools/python/python-dbus_1.2.14.bb
+++ b/recipes-devtools/python/python-dbus_1.2.14.bb
@@ -22,11 +22,11 @@ EXTRA_OECONF += "--disable-documentation"
 export STAGING_LIBDIR
 export STAGING_INCDIR
 
-RDEPENDS_${PN} = "python-io python-logging python-stringold python-threading python-xml"
+RDEPENDS:${PN} = "python-io python-logging python-stringold python-threading python-xml"
 
-FILES_${PN}-dev += "${libdir}/pkgconfig"
+FILES:${PN}-dev += "${libdir}/pkgconfig"
 
-do_install_append() {
+do_install:append() {
     # Remove files that clash with python3-dbus; their content is same
     rm ${D}${includedir}/dbus-1.0/dbus/dbus-python.h ${D}${libdir}/pkgconfig/dbus-python.pc
 }
diff --git a/recipes-devtools/python/python-dbusmock_0.16.7.bb b/recipes-devtools/python/python-dbusmock_0.16.7.bb
index ebfa9f4..bd88045 100644
--- a/recipes-devtools/python/python-dbusmock_0.16.7.bb
+++ b/recipes-devtools/python/python-dbusmock_0.16.7.bb
@@ -18,7 +18,7 @@ PYPI_PACKAGE = "python-dbusmock"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-dbus \
     ${PYTHON_PN}-pygobject \
     ${PYTHON_PN}-xml \
diff --git a/recipes-devtools/python/python-decorator_4.4.1.bb b/recipes-devtools/python/python-decorator_4.4.1.bb
index 9fa21f7..4ad2d87 100644
--- a/recipes-devtools/python/python-decorator_4.4.1.bb
+++ b/recipes-devtools/python/python-decorator_4.4.1.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "54c38050039232e1db4ad7375cfce6748d7b41c29e95a081c8a6d2c303
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-stringold \
     "
diff --git a/recipes-devtools/python/python-deprecated_1.2.7.bb b/recipes-devtools/python/python-deprecated_1.2.7.bb
index ca3956f..f1fd1c4 100644
--- a/recipes-devtools/python/python-deprecated_1.2.7.bb
+++ b/recipes-devtools/python/python-deprecated_1.2.7.bb
@@ -13,6 +13,6 @@ inherit pypi setuptools
 
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
-RDEPENDS_${PN} += "python-wrapt"
+RDEPENDS:${PN} += "python-wrapt"
 
 PNBLACKLIST[python-deprecated] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-distutils-extra_2.39.bb b/recipes-devtools/python/python-distutils-extra_2.39.bb
index 7e5d221..6afe59d 100644
--- a/recipes-devtools/python/python-distutils-extra_2.39.bb
+++ b/recipes-devtools/python/python-distutils-extra_2.39.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "723f24f4d65fc8d99b33a002fbbb3771d4cc9d664c97085bf37f3997ae
 
 inherit setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     python-distutils \
 "
 
diff --git a/recipes-devtools/python/python-django-south_1.0.2.bb b/recipes-devtools/python/python-django-south_1.0.2.bb
index 05a3517..249bd9b 100644
--- a/recipes-devtools/python/python-django-south_1.0.2.bb
+++ b/recipes-devtools/python/python-django-south_1.0.2.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "South"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-django \
     "
 
diff --git a/recipes-devtools/python/python-django_1.11.26.bb b/recipes-devtools/python/python-django_1.11.26.bb
index 38a976e..89d3100 100644
--- a/recipes-devtools/python/python-django_1.11.26.bb
+++ b/recipes-devtools/python/python-django_1.11.26.bb
@@ -14,11 +14,11 @@ PYPI_PACKAGE = "Django"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>1(\.\d+)+)"
 
-FILES_${PN} += "${datadir}/django"
+FILES:${PN} += "${datadir}/django"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-ctypes \
diff --git a/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/recipes-devtools/python/python-djangorestframework_3.9.0.bb
index baaa4e3..e726ea0 100644
--- a/recipes-devtools/python/python-djangorestframework_3.9.0.bb
+++ b/recipes-devtools/python/python-djangorestframework_3.9.0.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "djangorestframework"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-django \
 "
 
diff --git a/recipes-devtools/python/python-dnspython_1.16.0.bb b/recipes-devtools/python/python-dnspython_1.16.0.bb
index 4a4f18d..690bbf3 100644
--- a/recipes-devtools/python/python-dnspython_1.16.0.bb
+++ b/recipes-devtools/python/python-dnspython_1.16.0.bb
@@ -19,7 +19,7 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-math \
diff --git a/recipes-devtools/python/python-docker_4.2.0.bb b/recipes-devtools/python/python-docker_4.2.0.bb
index cb1d303..f3bfc4a 100644
--- a/recipes-devtools/python/python-docker_4.2.0.bb
+++ b/recipes-devtools/python/python-docker_4.2.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "19f803f6a7113301daa5d82a2d1d0c30"
 SRC_URI[sha256sum] = "ddae66620ab5f4bce769f64bcd7934f880c8abe6aa50986298db56735d0f722e"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
 	python-misc \
 	python-six \
 	python-docker-pycreds \
diff --git a/recipes-devtools/python/python-dominate_2.4.0.bb b/recipes-devtools/python/python-dominate_2.4.0.bb
index 72261e9..74a1d37 100644
--- a/recipes-devtools/python/python-dominate_2.4.0.bb
+++ b/recipes-devtools/python/python-dominate_2.4.0.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "a92474b4312bd8b4c1789792f3ec8c571cd8afa8e7502a2b1c64dd48cd
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-threading \
     "
diff --git a/recipes-devtools/python/python-engineio_3.11.2.bb b/recipes-devtools/python/python-engineio_3.11.2.bb
index 2d84227..89c52ff 100644
--- a/recipes-devtools/python/python-engineio_3.11.2.bb
+++ b/recipes-devtools/python/python-engineio_3.11.2.bb
@@ -13,13 +13,13 @@ PYPI_PACKAGE = "python-engineio"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-logging \
 "
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-six \
 "
 
diff --git a/recipes-devtools/python/python-epydoc_3.0.1.bb b/recipes-devtools/python/python-epydoc_3.0.1.bb
index f168340..2c53695 100644
--- a/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ b/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af6172
 
 inherit pypi distutils
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-stringold \
diff --git a/recipes-devtools/python/python-evdev_1.2.0.bb b/recipes-devtools/python/python-evdev_1.2.0.bb
index ef6f2dc..b030f61 100644
--- a/recipes-devtools/python/python-evdev_1.2.0.bb
+++ b/recipes-devtools/python/python-evdev_1.2.0.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-evdev:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-evdev:"
 
 SRC_URI += " file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch"
 
 SRC_URI[md5sum] = "53e440943dfa2514f95b3c448d6a36cb"
 SRC_URI[sha256sum] = "b03f5e1be5b4a5327494a981b831d251a142b09e8778eda1a8b53eba91100166"
 
-do_compile_prepend() {
+do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c
 }
 
@@ -18,7 +18,7 @@ DISTUTILS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/i
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
diff --git a/recipes-devtools/python/python-feedformatter_0.4.bb b/recipes-devtools/python/python-feedformatter_0.4.bb
index af42547..20fabad 100644
--- a/recipes-devtools/python/python-feedformatter_0.4.bb
+++ b/recipes-devtools/python/python-feedformatter_0.4.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-xml \
diff --git a/recipes-devtools/python/python-feedparser_5.2.1.bb b/recipes-devtools/python/python-feedparser_5.2.1.bb
index 399c058..307b56c 100644
--- a/recipes-devtools/python/python-feedparser_5.2.1.bb
+++ b/recipes-devtools/python/python-feedparser_5.2.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "bd030652c2d08532c034c27fcd7c85868e7fa3cb2b17f230a44a6bbc92
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-html \
diff --git a/recipes-devtools/python/python-flask-babel_0.12.2.bb b/recipes-devtools/python/python-flask-babel_0.12.2.bb
index 6da09ad..201b24a 100644
--- a/recipes-devtools/python/python-flask-babel_0.12.2.bb
+++ b/recipes-devtools/python/python-flask-babel_0.12.2.bb
@@ -14,7 +14,7 @@ PYPI_PACKAGE = "Flask-Babel"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-babel \
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-speaklater \
diff --git a/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb b/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
index 9f2e1b4..fb78a34 100644
--- a/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
+++ b/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
@@ -9,6 +9,6 @@ PYPI_PACKAGE = "Flask-Bcrypt"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
+RDEPENDS:${PN} += "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
 
 PNBLACKLIST[python-flask-bcrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb b/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
index d64a057..39c5079 100644
--- a/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
+++ b/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
@@ -14,7 +14,7 @@ PYPI_PACKAGE = "Flask-Bootstrap"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-dominate \
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-visitor \
diff --git a/recipes-devtools/python/python-flask-login_0.4.1.bb b/recipes-devtools/python/python-flask-login_0.4.1.bb
index 39905e1..410f087 100644
--- a/recipes-devtools/python/python-flask-login_0.4.1.bb
+++ b/recipes-devtools/python/python-flask-login_0.4.1.bb
@@ -13,6 +13,6 @@ PYPI_PACKAGE = "Flask-Login"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target = "${PYTHON_PN}-flask"
+RDEPENDS:${PN}:class-target = "${PYTHON_PN}-flask"
 
 PNBLACKLIST[python-flask-login] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-mail_0.9.1.bb b/recipes-devtools/python/python-flask-mail_0.9.1.bb
index 4807f61..31f2de7 100644
--- a/recipes-devtools/python/python-flask-mail_0.9.1.bb
+++ b/recipes-devtools/python/python-flask-mail_0.9.1.bb
@@ -15,6 +15,6 @@ PYPI_PACKAGE = "Flask-Mail"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "${PYTHON_PN}-flask"
 
 PNBLACKLIST[python-flask-mail] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-migrate_2.5.2.bb b/recipes-devtools/python/python-flask-migrate_2.5.2.bb
index 120d23b..f3ce2a8 100644
--- a/recipes-devtools/python/python-flask-migrate_2.5.2.bb
+++ b/recipes-devtools/python/python-flask-migrate_2.5.2.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "Flask-Migrate"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask-sqlalchemy \
     ${PYTHON_PN}-alembic \
     ${PYTHON_PN}-flask \
diff --git a/recipes-devtools/python/python-flask-nav_0.6.bb b/recipes-devtools/python/python-flask-nav_0.6.bb
index fab9060..a7be712 100644
--- a/recipes-devtools/python/python-flask-nav_0.6.bb
+++ b/recipes-devtools/python/python-flask-nav_0.6.bb
@@ -14,7 +14,7 @@ PYPI_PACKAGE = "flask-nav"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-blinker \
     ${PYTHON_PN}-flask \
     "
diff --git a/recipes-devtools/python/python-flask-navigation_0.2.0.bb b/recipes-devtools/python/python-flask-navigation_0.2.0.bb
index 33a635e..28c8059 100644
--- a/recipes-devtools/python/python-flask-navigation_0.2.0.bb
+++ b/recipes-devtools/python/python-flask-navigation_0.2.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "Flask-Navigation"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-blinker \
     ${PYTHON_PN}-flask \
     "
diff --git a/recipes-devtools/python/python-flask-pymongo_2.3.0.bb b/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
index 068b3fe..b78e298 100644
--- a/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
+++ b/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
@@ -14,6 +14,6 @@ PYPI_PACKAGE = "Flask-PyMongo"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
 
 PNBLACKLIST[python-flask-pymongo] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-restful_0.3.7.bb b/recipes-devtools/python/python-flask-restful_0.3.7.bb
index 2d5c229..7421004 100644
--- a/recipes-devtools/python/python-flask-restful_0.3.7.bb
+++ b/recipes-devtools/python/python-flask-restful_0.3.7.bb
@@ -13,6 +13,6 @@ inherit pypi setuptools
 
 PYPI_PACKAGE = "Flask-RESTful"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "${PYTHON_PN}-flask"
 
 PNBLACKLIST[python-flask-restful] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-script_2.0.6.bb b/recipes-devtools/python/python-flask-script_2.0.6.bb
index b12865a..b6e8417 100644
--- a/recipes-devtools/python/python-flask-script_2.0.6.bb
+++ b/recipes-devtools/python/python-flask-script_2.0.6.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE = "Flask-Script"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     "
 
diff --git a/recipes-devtools/python/python-flask-sijax_0.4.1.bb b/recipes-devtools/python/python-flask-sijax_0.4.1.bb
index 1c09264..fd480f8 100644
--- a/recipes-devtools/python/python-flask-sijax_0.4.1.bb
+++ b/recipes-devtools/python/python-flask-sijax_0.4.1.bb
@@ -15,6 +15,6 @@ PYPI_PACKAGE = "Flask-Sijax"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-sijax"
+RDEPENDS:${PN} = "${PYTHON_PN}-sijax"
 
 PNBLACKLIST[python-flask-sijax] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-socketio_4.2.1.bb b/recipes-devtools/python/python-flask-socketio_4.2.1.bb
index 93a0adb..9c233fa 100644
--- a/recipes-devtools/python/python-flask-socketio_4.2.1.bb
+++ b/recipes-devtools/python/python-flask-socketio_4.2.1.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "Flask-SocketIO"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-socketio \
     "
diff --git a/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb b/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
index 96fa033..09b5546 100644
--- a/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
+++ b/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
@@ -15,6 +15,6 @@ PYPI_PACKAGE = "Flask-SQLAlchemy"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
 
 PNBLACKLIST[python-flask-sqlalchemy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-uploads_0.2.1.bb b/recipes-devtools/python/python-flask-uploads_0.2.1.bb
index 8f69ce4..dcd4392 100644
--- a/recipes-devtools/python/python-flask-uploads_0.2.1.bb
+++ b/recipes-devtools/python/python-flask-uploads_0.2.1.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "Flask-Uploads"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     "
 
diff --git a/recipes-devtools/python/python-flask-user_0.6.19.bb b/recipes-devtools/python/python-flask-user_0.6.19.bb
index 310613c..270ef53 100644
--- a/recipes-devtools/python/python-flask-user_0.6.19.bb
+++ b/recipes-devtools/python/python-flask-user_0.6.19.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "Flask-User"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-flask \
+RDEPENDS:${PN} = "${PYTHON_PN}-flask \
     ${PYTHON_PN}-flask-login \
     ${PYTHON_PN}-flask-mail \
     ${PYTHON_PN}-babel"
diff --git a/recipes-devtools/python/python-flask-wtf_0.14.2.bb b/recipes-devtools/python/python-flask-wtf_0.14.2.bb
index 4502820..6cab518 100644
--- a/recipes-devtools/python/python-flask-wtf_0.14.2.bb
+++ b/recipes-devtools/python/python-flask-wtf_0.14.2.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "Flask-WTF"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-itsdangerous \
     ${PYTHON_PN}-json \
diff --git a/recipes-devtools/python/python-flask-xstatic_0.0.1.bb b/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
index 4732a6d..63a0344 100644
--- a/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
+++ b/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
@@ -12,14 +12,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=659968f6ebd4b70b6c3190d20b4a924c"
 SRC_URI[md5sum] = "2f56023e1444c8bd1fec41afe93de743"
 SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381490133"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-flask-xstatic:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-flask-xstatic:"
 SRC_URI += "file://remove-pip-requires.patch"
 
 PYPI_PACKAGE = "Flask-XStatic"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-xstatic \
     "
diff --git a/recipes-devtools/python/python-flask_1.1.1.bb b/recipes-devtools/python/python-flask_1.1.1.bb
index c633108..dfe62b3 100644
--- a/recipes-devtools/python/python-flask_1.1.1.bb
+++ b/recipes-devtools/python/python-flask_1.1.1.bb
@@ -15,7 +15,7 @@ PYPI_PACKAGE = "Flask"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-click \
     ${PYTHON_PN}-itsdangerous \
     ${PYTHON_PN}-jinja2 \
diff --git a/recipes-devtools/python/python-future_0.18.2.bb b/recipes-devtools/python/python-future_0.18.2.bb
index eb9b308..1b01807 100644
--- a/recipes-devtools/python/python-future_0.18.2.bb
+++ b/recipes-devtools/python/python-future_0.18.2.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_append_class-target = " python-misc"
+RDEPENDS:${PN}:append:class-target = " python-misc"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes-devtools/python/python-gdata_2.0.18.bb b/recipes-devtools/python/python-gdata_2.0.18.bb
index 6053a29..505c9a9 100644
--- a/recipes-devtools/python/python-gdata_2.0.18.bb
+++ b/recipes-devtools/python/python-gdata_2.0.18.bb
@@ -10,9 +10,9 @@ S = "${WORKDIR}/gdata.py-${PV}"
 
 inherit pypi distutils
 
-FILES_${PN} += "${datadir}"
+FILES:${PN} += "${datadir}"
 
-RDEPENDS_${PN} = " \
+RDEPENDS:${PN} = " \
     ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-netserver \
diff --git a/recipes-devtools/python/python-gevent_1.4.0.bb b/recipes-devtools/python/python-gevent_1.4.0.bb
index d7d3886..28fc516 100644
--- a/recipes-devtools/python/python-gevent_1.4.0.bb
+++ b/recipes-devtools/python/python-gevent_1.4.0.bb
@@ -13,9 +13,9 @@ SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15
 
 DEPENDS += "libevent ${PYTHON_PN}-greenlet"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-gevent:"
 
-SRC_URI_append = " \
+SRC_URI:append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
     file://0002-setup.py-do-not-query-for-include-dir.patch \
 "
@@ -23,7 +23,7 @@ SRC_URI_append = " \
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-greenlet \
     ${PYTHON_PN}-mime \
     ${PYTHON_PN}-pprint \
@@ -33,7 +33,7 @@ RDEPENDS_${PN} = "\
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
 # so always force a cross compile
-do_configure_append() {
+do_configure:append() {
 	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
 	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
 }
diff --git a/recipes-devtools/python/python-grpcio-tools_1.14.1.bb b/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
index 25dcc93..5d076d0 100644
--- a/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
+++ b/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62
 SRC_URI[md5sum] = "b2fabfb54c7824c1e49a02de2aa6628e"
 SRC_URI[sha256sum] = "4ce5aa660d7884f23aac1eafa93b97a4c3e2b512edff871e91fdb6ee86ebd5ea"
 
-DEPENDS_append = " ${PYTHON_PN}-grpcio"
+DEPENDS:append = " ${PYTHON_PN}-grpcio"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
+RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-grpcio_1.27.1.bb b/recipes-devtools/python/python-grpcio_1.27.1.bb
index 6619652..82c3748 100644
--- a/recipes-devtools/python/python-grpcio_1.27.1.bb
+++ b/recipes-devtools/python/python-grpcio_1.27.1.bb
@@ -5,18 +5,18 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
+SRC_URI:append:class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
                                 file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
 "
 SRC_URI[md5sum] = "ccaf4e7eb4f031d926fb80035d193b98"
 SRC_URI[sha256sum] = "a899725d34769a498ecd3be154021c4368dd22bdc69473f6ec46779696f626c4"
 
-DEPENDS_append = " ${PYTHON_PN}-protobuf"
+DEPENDS:append = " ${PYTHON_PN}-protobuf"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-protobuf \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
diff --git a/recipes-devtools/python/python-html5lib_1.0.1.bb b/recipes-devtools/python/python-html5lib_1.0.1.bb
index 642b0de..aafa65d 100644
--- a/recipes-devtools/python/python-html5lib_1.0.1.bb
+++ b/recipes-devtools/python/python-html5lib_1.0.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-lxml \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-webencodings \
diff --git a/recipes-devtools/python/python-humanfriendly_4.18.bb b/recipes-devtools/python/python-humanfriendly_4.18.bb
index 7553922..d26f80e 100644
--- a/recipes-devtools/python/python-humanfriendly_4.18.bb
+++ b/recipes-devtools/python/python-humanfriendly_4.18.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85b
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-html \
diff --git a/recipes-devtools/python/python-humanize_0.5.1.bb b/recipes-devtools/python/python-humanize_0.5.1.bb
index 9a0380e..6a6df3b 100644
--- a/recipes-devtools/python/python-humanize_0.5.1.bb
+++ b/recipes-devtools/python/python-humanize_0.5.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac2513447
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
 "
 
diff --git a/recipes-devtools/python/python-hyperlink_19.0.0.bb b/recipes-devtools/python/python-hyperlink_19.0.0.bb
index 270f27c..61ff3f6 100644
--- a/recipes-devtools/python/python-hyperlink_19.0.0.bb
+++ b/recipes-devtools/python/python-hyperlink_19.0.0.bb
@@ -9,7 +9,7 @@ SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-stringold \
@@ -17,7 +17,7 @@ RDEPENDS_${PN} += "\
 
 PACKAGES =. "${PN}-test "
 
-FILES_${PN}-test += " \
+FILES:${PN}-test += " \
         ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
 "
 
diff --git a/recipes-devtools/python/python-hypothesis_4.50.2.bb b/recipes-devtools/python/python-hypothesis_4.50.2.bb
index b01e488..0f639b8 100644
--- a/recipes-devtools/python/python-hypothesis_4.50.2.bb
+++ b/recipes-devtools/python/python-hypothesis_4.50.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "${PYTHON_PN}-attrs"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-enum34 \
     "
 
diff --git a/recipes-devtools/python/python-idna_2.8.bb b/recipes-devtools/python/python-idna_2.8.bb
index ca7a1aa..398d593 100644
--- a/recipes-devtools/python/python-idna_2.8.bb
+++ b/recipes-devtools/python/python-idna_2.8.bb
@@ -8,12 +8,12 @@ SRC_URI[sha256sum] = "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS:${PN}:class-target = "\
     ${PYTHON_PN}-codecs \
 "
 
 # Remove bundled egg-info
-do_compile_prepend() {
+do_compile:prepend() {
     rm -rf ${S}/idna.egg-info
 }
 
diff --git a/recipes-devtools/python/python-imaging_1.1.7.bb b/recipes-devtools/python/python-imaging_1.1.7.bb
index 395a5cc..cd4a3d1 100644
--- a/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -45,6 +45,6 @@ do_install() {
     sed -i -e 's:/usr/local/bin/:${bindir}/env :g' ${D}${bindir}/*
 }
 
-RDEPENDS_${PN} += "python-lang python-stringold"
+RDEPENDS:${PN} += "python-lang python-stringold"
 
 PNBLACKLIST[python-imaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-importlib-metadata_0.23.bb b/recipes-devtools/python/python-importlib-metadata_0.23.bb
index a0f6362..e63f375 100644
--- a/recipes-devtools/python/python-importlib-metadata_0.23.bb
+++ b/recipes-devtools/python/python-importlib-metadata_0.23.bb
@@ -15,7 +15,7 @@ inherit pypi setuptools
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-zipp \
     ${PYTHON_PN}-pathlib2 \
     python-compression \
diff --git a/recipes-devtools/python/python-incremental_17.5.0.bb b/recipes-devtools/python/python-incremental_17.5.0.bb
index 6b4a937..2e44794 100644
--- a/recipes-devtools/python/python-incremental_17.5.0.bb
+++ b/recipes-devtools/python/python-incremental_17.5.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-twisted \
     ${PYTHON_PN}-click \
 "
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += " \
 # -native is needed to build python[3]-twisted, however, we need to take steps to
 # prevent a circular dependency. The build apparently does not use the part of
 # python-incremental which uses python-twisted, so this hack is OK.
-RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
+RDEPENDS:${PYTHON_PN}-incremental-native:remove = "${PYTHON_PN}-twisted-native"
 BBCLASSEXTEND = "native"
 
 PNBLACKLIST[python-incremental] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-inflection_0.3.1.bb b/recipes-devtools/python/python-inflection_0.3.1.bb
index 8ed9ba1..add8ec4 100644
--- a/recipes-devtools/python/python-inflection_0.3.1.bb
+++ b/recipes-devtools/python/python-inflection_0.3.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4ed
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-pytest \
 "
diff --git a/recipes-devtools/python/python-iso8601_0.1.12.bb b/recipes-devtools/python/python-iso8601_0.1.12.bb
index ae5d0e1..db8ddc5 100644
--- a/recipes-devtools/python/python-iso8601_0.1.12.bb
+++ b/recipes-devtools/python/python-iso8601_0.1.12.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098ed
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
 "
 
diff --git a/recipes-devtools/python/python-isodate_0.6.0.bb b/recipes-devtools/python/python-isodate_0.6.0.bb
index e107cf3..b1eaca9 100644
--- a/recipes-devtools/python/python-isodate_0.6.0.bb
+++ b/recipes-devtools/python/python-isodate_0.6.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-six \
 "
 
diff --git a/recipes-devtools/python/python-isort_4.3.21.bb b/recipes-devtools/python/python-isort_4.3.21.bb
index 97ce045..a3905c4 100644
--- a/recipes-devtools/python/python-isort_4.3.21.bb
+++ b/recipes-devtools/python/python-isort_4.3.21.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
 "
diff --git a/recipes-devtools/python/python-itsdangerous_1.1.0.bb b/recipes-devtools/python/python-itsdangerous_1.1.0.bb
index 0efa71e..5e2cbab 100644
--- a/recipes-devtools/python/python-itsdangerous_1.1.0.bb
+++ b/recipes-devtools/python/python-itsdangerous_1.1.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools
 
 CLEANBROKEN = "1"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-simplejson \
     ${PYTHON_PN}-zlib \
diff --git a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
index 6c3ef75..597cb28 100644
--- a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
+++ b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
@@ -12,12 +12,12 @@ SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-typing \
     "
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-logging \
     "
diff --git a/recipes-devtools/python/python-jinja2_2.10.3.bb b/recipes-devtools/python/python-jinja2_2.10.3.bb
index cf26245..0320144 100644
--- a/recipes-devtools/python/python-jinja2_2.10.3.bb
+++ b/recipes-devtools/python/python-jinja2_2.10.3.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "Jinja2"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
diff --git a/recipes-devtools/python/python-jsonpatch_1.24.bb b/recipes-devtools/python/python-jsonpatch_1.24.bb
index 79bb4ca..0850982 100644
--- a/recipes-devtools/python/python-jsonpatch_1.24.bb
+++ b/recipes-devtools/python/python-jsonpatch_1.24.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "cbb72f8bf35260628aea6b508a107245f757d1ec839a19c34349985e2c
 inherit pypi setuptools
 
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-jsonpointer \
     ${PYTHON_PN}-netclient \
diff --git a/recipes-devtools/python/python-jsonpointer_2.0.bb b/recipes-devtools/python/python-jsonpointer_2.0.bb
index 07d6657..1cf4982 100644
--- a/recipes-devtools/python/python-jsonpointer_2.0.bb
+++ b/recipes-devtools/python/python-jsonpointer_2.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83
 inherit pypi setuptools
 
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-re \
 "
diff --git a/recipes-devtools/python/python-jsonschema_3.2.0.bb b/recipes-devtools/python/python-jsonschema_3.2.0.bb
index 1b22ae8..2be8ead 100644
--- a/recipes-devtools/python/python-jsonschema_3.2.0.bb
+++ b/recipes-devtools/python/python-jsonschema_3.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-jsonschema:"
 
 SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
 SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
@@ -30,7 +30,7 @@ PACKAGECONFIG[nongpl] = ",,,\
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-contextlib \
diff --git a/recipes-devtools/python/python-kombu_4.6.6.bb b/recipes-devtools/python/python-kombu_4.6.6.bb
index 0c28908..b01215d 100644
--- a/recipes-devtools/python/python-kombu_4.6.6.bb
+++ b/recipes-devtools/python/python-kombu_4.6.6.bb
@@ -16,9 +16,9 @@ inherit setuptools pypi
 
 PYPI_PACKAGE = "kombu"
 
-FILES_${PN}-doc += "${datadir}/${SRCNAME}"
+FILES:${PN}-doc += "${datadir}/${SRCNAME}"
 
-RDEPENDS_${PN} = " \
+RDEPENDS:${PN} = " \
         python-amqp \
         "
 
diff --git a/recipes-devtools/python/python-ldap_3.2.0.bb b/recipes-devtools/python/python-ldap_3.2.0.bb
index 30c829e..326d02e 100644
--- a/recipes-devtools/python/python-ldap_3.2.0.bb
+++ b/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -18,13 +18,13 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
 SRC_URI[md5sum] = "fe22522208dc9b06d16eb70f8553eaab"
 SRC_URI[sha256sum] = "7d1c4b15375a533564aad3d3deade789221e450052b21ebb9720fb822eccdb8e"
 
-do_configure_prepend() {
+do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' setup.cfg
     sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' setup.cfg
 }
 
 
-RDEPENDS_${PN} = " \
+RDEPENDS:${PN} = " \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-pyasn1 \
diff --git a/recipes-devtools/python/python-license-expression_1.2.bb b/recipes-devtools/python/python-license-expression_1.2.bb
index 5ec1222..9572526 100644
--- a/recipes-devtools/python/python-license-expression_1.2.bb
+++ b/recipes-devtools/python/python-license-expression_1.2.bb
@@ -9,11 +9,11 @@ SRC_URI[sha256sum] = "7960e1dfdf20d127e75ead931476f2b5c7556df05b117a73880b22ade1
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-booleanpy \
     "
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-logging \
     "
 
diff --git a/recipes-devtools/python/python-lockfile_0.12.2.bb b/recipes-devtools/python/python-lockfile_0.12.2.bb
index 22183c4..1097ce8 100644
--- a/recipes-devtools/python/python-lockfile_0.12.2.bb
+++ b/recipes-devtools/python/python-lockfile_0.12.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Platform-independent file locking module"
 HOMEPAGE = "http://launchpad.net/pylockfile"
 SECTION = "devel/python"
 
-RDEPENDS_${PN} = "python-threading"
+RDEPENDS:${PN} = "python-threading"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
diff --git a/recipes-devtools/python/python-lxml_4.4.2.bb b/recipes-devtools/python/python-lxml_4.4.2.bb
index d083de3..7cfedbc 100644
--- a/recipes-devtools/python/python-lxml_4.4.2.bb
+++ b/recipes-devtools/python/python-lxml_4.4.2.bb
@@ -37,17 +37,17 @@ DISTUTILS_INSTALL_ARGS += " \
 
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-DEBUG_OPTIMIZATION_remove_mips = " -Og"
-DEBUG_OPTIMIZATION_append_mips = " -O"
-BUILD_OPTIMIZATION_remove_mips = " -Og"
-BUILD_OPTIMIZATION_append_mips = " -O"
+DEBUG_OPTIMIZATION:remove:mips = " -Og"
+DEBUG_OPTIMIZATION:append:mips = " -O"
+BUILD_OPTIMIZATION:remove:mips = " -Og"
+BUILD_OPTIMIZATION:append:mips = " -O"
 
-DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
-DEBUG_OPTIMIZATION_append_mipsel = " -O"
-BUILD_OPTIMIZATION_remove_mipsel = " -Og"
-BUILD_OPTIMIZATION_append_mipsel = " -O"
+DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
+DEBUG_OPTIMIZATION:append:mipsel = " -O"
+BUILD_OPTIMIZATION:remove:mipsel = " -Og"
+BUILD_OPTIMIZATION:append:mipsel = " -O"
 
-RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
+RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-m2crypto_0.30.1.bb b/recipes-devtools/python/python-m2crypto_0.30.1.bb
index ac5615e..6bd6170 100644
--- a/recipes-devtools/python/python-m2crypto_0.30.1.bb
+++ b/recipes-devtools/python/python-m2crypto_0.30.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-m2crypto:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-m2crypto:"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://cross-compile-platform.patch \
@@ -19,7 +19,7 @@ PYPI_PACKAGE = "M2Crypto"
 
 inherit pypi siteinfo setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-logging \
@@ -32,7 +32,7 @@ RDEPENDS_${PN} += "\
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
 
-SWIG_FEATURES_x86 = "-D__i386__"
+SWIG_FEATURES:x86 = "-D__i386__"
 SWIG_FEATURES_x32 = "-D__ILP32__"
 SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
 export SWIG_FEATURES
@@ -40,7 +40,7 @@ export SWIG_FEATURES
 # Get around a problem with swig, but only if the
 # multilib header file exists.
 #
-do_configure_prepend() {
+do_configure:prepend() {
     ${CPP} -dM - < /dev/null | grep -v '__\(STDC\|REGISTER_PREFIX\|GNUC\|STDC_HOSTED\)__' \
     | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > ${S}/SWIG/gcc_macros.h
 
diff --git a/recipes-devtools/python/python-mako_1.1.0.bb b/recipes-devtools/python/python-mako_1.1.0.bb
index c6e79a0..ee6051c 100644
--- a/recipes-devtools/python/python-mako_1.1.0.bb
+++ b/recipes-devtools/python/python-mako_1.1.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = " \
+RDEPENDS:${PN} = " \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netclient \
diff --git a/recipes-devtools/python/python-markupsafe_1.1.1.bb b/recipes-devtools/python/python-markupsafe_1.1.1.bb
index ad979c7..ef4eadb 100644
--- a/recipes-devtools/python/python-markupsafe_1.1.1.bb
+++ b/recipes-devtools/python/python-markupsafe_1.1.1.bb
@@ -15,7 +15,7 @@ PYPI_PACKAGE = "MarkupSafe"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-re ${PYTHON_PN}-stringold"
+RDEPENDS:${PN} += "${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-mccabe_0.4.0.bb b/recipes-devtools/python/python-mccabe_0.4.0.bb
index 1c5ae4f..62503af 100644
--- a/recipes-devtools/python/python-mccabe_0.4.0.bb
+++ b/recipes-devtools/python/python-mccabe_0.4.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca498226886
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     python-prettytable \
     python-cmd2 \
     python-pyparsing"
diff --git a/recipes-devtools/python/python-mock_3.0.5.bb b/recipes-devtools/python/python-mock_3.0.5.bb
index 46c8d90..b91d233 100644
--- a/recipes-devtools/python/python-mock_3.0.5.bb
+++ b/recipes-devtools/python/python-mock_3.0.5.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools
 DEPENDS += " \
     python-pbr-native"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     python-prettytable \
     python-cmd2 \
     python-pyparsing \
diff --git a/recipes-devtools/python/python-monotonic_1.5.bb b/recipes-devtools/python/python-monotonic_1.5.bb
index e898f50..a33c09a 100644
--- a/recipes-devtools/python/python-monotonic_1.5.bb
+++ b/recipes-devtools/python/python-monotonic_1.5.bb
@@ -7,6 +7,6 @@ SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-io ${PYTHON_PN}-re ${PYTHON_PN}-threading"
+RDEPENDS:${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-io ${PYTHON_PN}-re ${PYTHON_PN}-threading"
 
 PNBLACKLIST[python-monotonic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-msgpack_0.6.2.bb b/recipes-devtools/python/python-msgpack_0.6.2.bb
index ff66a0f..43c4eb1 100644
--- a/recipes-devtools/python/python-msgpack_0.6.2.bb
+++ b/recipes-devtools/python/python-msgpack_0.6.2.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE = "msgpack"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-io \
 "
 
diff --git a/recipes-devtools/python/python-native_2.7.18.bb b/recipes-devtools/python/python-native_2.7.18.bb
index 5b29c9f..95a8a86 100644
--- a/recipes-devtools/python/python-native_2.7.18.bb
+++ b/recipes-devtools/python/python-native_2.7.18.bb
@@ -23,7 +23,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
 
 inherit native
 
-EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
+EXTRA_OECONF:append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
 
 EXTRA_OEMAKE = '\
   LIBC="" \
@@ -31,12 +31,12 @@ EXTRA_OEMAKE = '\
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
 '
 
-do_configure_append() {
+do_configure:append() {
 	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
 # Cross-compiling Python needs a native pgen, build it here for use later.
-do_compile_append() {
+do_compile:append() {
 	oe_runmake Parser/pgen
 }
 
diff --git a/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb b/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
index de702b2..be10bac 100644
--- a/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
+++ b/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
@@ -24,7 +24,7 @@ DEPENDS += " \
 
 inherit pypi setuptools update-alternatives
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-pyopenssl \
@@ -33,7 +33,7 @@ RDEPENDS_${PN} += " \
 
 UPSTREAM_CHECK_REGEX = ""
 
-ALTERNATIVE_${PN} = "ndg_httpclient"
+ALTERNATIVE:${PN} = "ndg_httpclient"
 ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
 ALTERNATIVE_PRIORITY = "20"
 
diff --git a/recipes-devtools/python/python-netaddr_0.7.19.bb b/recipes-devtools/python/python-netaddr_0.7.19.bb
index 0a94904..ac73410 100644
--- a/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ b/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c77
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-textutils \
     ${PYTHON_PN}-xml \
diff --git a/recipes-devtools/python/python-networkx_2.2.bb b/recipes-devtools/python/python-networkx_2.2.bb
index 09bbab6..5a96abb 100644
--- a/recipes-devtools/python/python-networkx_2.2.bb
+++ b/recipes-devtools/python/python-networkx_2.2.bb
@@ -11,6 +11,6 @@ inherit pypi setuptools
 
 PYPI_PACKAGE_EXT = "zip"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-decorator"
+RDEPENDS:${PN} += "${PYTHON_PN}-decorator"
 
 PNBLACKLIST[python-networkx] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-packaging_20.0.bb b/recipes-devtools/python/python-packaging_20.0.bb
index 994db81..0c81246 100644
--- a/recipes-devtools/python/python-packaging_20.0.bb
+++ b/recipes-devtools/python/python-packaging_20.0.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
+RDEPENDS:${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
 
 PNBLACKLIST[python-packaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-paho-mqtt_1.5.0.bb b/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
index a5e0269..eb55beb 100644
--- a/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
+++ b/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
@@ -15,7 +15,7 @@ inherit pypi setuptools
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-math \
diff --git a/recipes-devtools/python/python-pam_1.8.2.bb b/recipes-devtools/python/python-pam_1.8.2.bb
index 405cbdc..72b90ff 100644
--- a/recipes-devtools/python/python-pam_1.8.2.bb
+++ b/recipes-devtools/python/python-pam_1.8.2.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "python-pam"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "libpam"
+RDEPENDS:${PN} = "libpam"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
diff --git a/recipes-devtools/python/python-pamela_0.3.0.bb b/recipes-devtools/python/python-pamela_0.3.0.bb
index 96f81d3..3721947 100644
--- a/recipes-devtools/python/python-pamela_0.3.0.bb
+++ b/recipes-devtools/python/python-pamela_0.3.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "pamela"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "libpam"
+RDEPENDS:${PN} = "libpam"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
diff --git a/recipes-devtools/python/python-parse-type_0.4.2.bb b/recipes-devtools/python/python-parse-type_0.4.2.bb
index faaa498..bf7bce7 100644
--- a/recipes-devtools/python/python-parse-type_0.4.2.bb
+++ b/recipes-devtools/python/python-parse-type_0.4.2.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "parse_type"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-parse"
+RDEPENDS:${PN} += "${PYTHON_PN}-parse"
 
 PNBLACKLIST[python-parse-type] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-parse_1.14.0.bb b/recipes-devtools/python/python-parse_1.14.0.bb
index 90f22dc..d692bfb 100644
--- a/recipes-devtools/python/python-parse_1.14.0.bb
+++ b/recipes-devtools/python/python-parse_1.14.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "95a4f4469e37c57b5e924629ac99926f28bee7da59515dc5b8078c4c3e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-numbers \
diff --git a/recipes-devtools/python/python-passlib_1.7.2.bb b/recipes-devtools/python/python-passlib_1.7.2.bb
index 6e250fc..44b0e31 100644
--- a/recipes-devtools/python/python-passlib_1.7.2.bb
+++ b/recipes-devtools/python/python-passlib_1.7.2.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
diff --git a/recipes-devtools/python/python-paste_3.2.3.bb b/recipes-devtools/python/python-paste_3.2.3.bb
index 75638c9..d7d7225 100644
--- a/recipes-devtools/python/python-paste_3.2.3.bb
+++ b/recipes-devtools/python/python-paste_3.2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools for using a Web Server Gateway Interface stack"
 HOMEPAGE = "http://pythonpaste.org/"
 LICENSE = "MIT"
-RDEPENDS_${PN} = "python-six"
+RDEPENDS:${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "8bdc7f6be907eed7cd63868c79d88af2b87d02d840fb5acfc93d4bda57
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
 
-FILES_${PN} += "/usr/lib/*"
+FILES:${PN} += "/usr/lib/*"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
diff --git a/recipes-devtools/python/python-pathlib2_2.3.5.bb b/recipes-devtools/python/python-pathlib2_2.3.5.bb
index f9b02ea..fee2853 100644
--- a/recipes-devtools/python/python-pathlib2_2.3.5.bb
+++ b/recipes-devtools/python/python-pathlib2_2.3.5.bb
@@ -14,7 +14,7 @@ inherit pypi setuptools
 
 # Needs python-misc for ntpath
 # Could probably be removed by patching out Windows code
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-six \
     python-misc \
     python-scandir \
diff --git a/recipes-devtools/python/python-pbr_5.4.4.bb b/recipes-devtools/python/python-pbr_5.4.4.bb
index c7caebf..ad7bbd0 100644
--- a/recipes-devtools/python/python-pbr_5.4.4.bb
+++ b/recipes-devtools/python/python-pbr_5.4.4.bb
@@ -10,9 +10,9 @@ SRC_URI[sha256sum] = "139d2625547dbfa5fb0b81daebb39601c478c21956dc57e2e07b74450a
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-pip"
+RDEPENDS:${PN} += "${PYTHON_PN}-pip"
 
-do_install_append() {
+do_install:append() {
         if [ -f ${D}${bindir}/pbr ]; then
                 mv ${D}${bindir}/pbr ${D}${bindir}/pbr-2
         fi
diff --git a/recipes-devtools/python/python-pep8_1.7.1.bb b/recipes-devtools/python/python-pep8_1.7.1.bb
index e6c9acd..e4aeee9 100644
--- a/recipes-devtools/python/python-pep8_1.7.1.bb
+++ b/recipes-devtools/python/python-pep8_1.7.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     python-prettytable \
     python-cmd2 \
     python-pyparsing"
diff --git a/recipes-devtools/python/python-pexpect_4.7.0.bb b/recipes-devtools/python/python-pexpect_4.7.0.bb
index 42aa472..188c71f 100644
--- a/recipes-devtools/python/python-pexpect_4.7.0.bb
+++ b/recipes-devtools/python/python-pexpect_4.7.0.bb
@@ -11,7 +11,7 @@ UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-terminal \
diff --git a/recipes-devtools/python/python-pika_1.1.0.bb b/recipes-devtools/python/python-pika_1.1.0.bb
index 383031d..a297c11 100644
--- a/recipes-devtools/python/python-pika_1.1.0.bb
+++ b/recipes-devtools/python/python-pika_1.1.0.bb
@@ -15,7 +15,7 @@ inherit pypi setuptools
 
 PYPI_PACKAGE = "pika"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-tornado \
     ${PYTHON_PN}-twisted \
diff --git a/recipes-devtools/python/python-pip_19.3.1.bb b/recipes-devtools/python/python-pip_19.3.1.bb
index 71d1f28..c1592ab 100644
--- a/recipes-devtools/python/python-pip_19.3.1.bb
+++ b/recipes-devtools/python/python-pip_19.3.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "21207d76c1031e517668898a6b46a9fb1501c7a4710ef5dfd6a40ad9e6
 inherit pypi setuptools
 
 # Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
-RDEPENDS_${PN}_class-target = "python-modules python-distribute python-misc"
+RDEPENDS:${PN}:class-target = "python-modules python-distribute python-misc"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-pluggy_0.13.1.bb b/recipes-devtools/python/python-pluggy_0.13.1.bb
index ab9a196..885cf25 100644
--- a/recipes-devtools/python/python-pluggy_0.13.1.bb
+++ b/recipes-devtools/python/python-pluggy_0.13.1.bb
@@ -7,7 +7,7 @@ SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
 SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
+RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
                    ${PYTHON_PN}-more-itertools \
 "
 
diff --git a/recipes-devtools/python/python-ply_3.11.bb b/recipes-devtools/python/python-ply_3.11.bb
index 567d20b..2513723 100644
--- a/recipes-devtools/python/python-ply_3.11.bb
+++ b/recipes-devtools/python/python-ply_3.11.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-shell \
 "
diff --git a/recipes-devtools/python/python-prettytable_0.7.2.bb b/recipes-devtools/python/python-prettytable_0.7.2.bb
index 22b7244..1362ea6 100644
--- a/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -15,7 +15,7 @@ inherit setuptools
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-do_install_append() {
+do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
     for f in $perm_files; do
         chmod 644 "${f}"
diff --git a/recipes-devtools/python/python-progress_1.5.bb b/recipes-devtools/python/python-progress_1.5.bb
index 614ce5e..dcf4582 100644
--- a/recipes-devtools/python/python-progress_1.5.bb
+++ b/recipes-devtools/python/python-progress_1.5.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7da
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-math \
 "
diff --git a/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb b/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
index 0b2e421..4886d64 100644
--- a/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
+++ b/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "prompt_toolkit"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-subprocess \
diff --git a/recipes-devtools/python/python-protobuf_3.9.2.bb b/recipes-devtools/python/python-protobuf_3.9.2.bb
index a708722..8079e48 100644
--- a/recipes-devtools/python/python-protobuf_3.9.2.bb
+++ b/recipes-devtools/python/python-protobuf_3.9.2.bb
@@ -17,7 +17,7 @@ CLEANBROKEN = "1"
 
 UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-logging \
diff --git a/recipes-devtools/python/python-psutil_5.6.7.bb b/recipes-devtools/python/python-psutil_5.6.7.bb
index bfd16b8..f765b24 100644
--- a/recipes-devtools/python/python-psutil_5.6.7.bb
+++ b/recipes-devtools/python/python-psutil_5.6.7.bb
@@ -9,13 +9,13 @@ inherit pypi setuptools
 
 PACKAGES =+ "${PN}-tests"
 
-FILES_${PN}-tests += " \
+FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
     ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
 "
 
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
diff --git a/recipes-devtools/python/python-ptyprocess_0.6.0.bb b/recipes-devtools/python/python-ptyprocess_0.6.0.bb
index 6601c92..9f6b60f 100644
--- a/recipes-devtools/python/python-ptyprocess_0.6.0.bb
+++ b/recipes-devtools/python/python-ptyprocess_0.6.0.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-core \
 "
 
diff --git a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
index b769e51..174610f 100644
--- a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
+++ b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
@@ -11,6 +11,6 @@ DEPENDS += "alsa-lib"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "libasound"
+RDEPENDS:${PN} += "libasound"
 
 PNBLACKLIST[python-pyalsaaudio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb b/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
index e6cd671..dd1c686 100644
--- a/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
+++ b/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe8
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pyasn1"
+RDEPENDS:${PN} = "${PYTHON_PN}-pyasn1"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-pyasn1_0.4.8.bb b/recipes-devtools/python/python-pyasn1_0.4.8.bb
index 4772beb..d4ed208 100644
--- a/recipes-devtools/python/python-pyasn1_0.4.8.bb
+++ b/recipes-devtools/python/python-pyasn1_0.4.8.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a47
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-logging \
diff --git a/recipes-devtools/python/python-pybluez_0.22.bb b/recipes-devtools/python/python-pybluez_0.22.bb
index 3f5a08f..62ccec5 100644
--- a/recipes-devtools/python/python-pybluez_0.22.bb
+++ b/recipes-devtools/python/python-pybluez_0.22.bb
@@ -19,7 +19,7 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     bluez5 \
     ${PYTHON_PN}-fcntl \
 "
diff --git a/recipes-devtools/python/python-pycodestyle_2.5.0.bb b/recipes-devtools/python/python-pycodestyle_2.5.0.bb
index 5824cc2..de5e7e3 100644
--- a/recipes-devtools/python/python-pycodestyle_2.5.0.bb
+++ b/recipes-devtools/python/python-pycodestyle_2.5.0.bb
@@ -10,9 +10,9 @@ SRC_URI[sha256sum] = "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-lang"
+RDEPENDS:${PN} += "${PYTHON_PN}-lang"
 
-do_install_append () {
+do_install:append () {
         if [ -f ${D}${bindir}/pycodestyle ]; then
                 mv ${D}${bindir}/pycodestyle ${D}${bindir}/pycodestyle-2
         fi
diff --git a/recipes-devtools/python/python-pycparser_2.19.bb b/recipes-devtools/python/python-pycparser_2.19.bb
index 91b4b79..17bcc41 100644
--- a/recipes-devtools/python/python-pycparser_2.19.bb
+++ b/recipes-devtools/python/python-pycparser_2.19.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "a988718abfad80b6b157acce7bf130a30876d27603738ac39f14099324
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-ply \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-subprocess \
diff --git a/recipes-devtools/python/python-pycrypto_2.6.1.bb b/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 1f55325..8d2e633 100644
--- a/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.pycrypto.org/"
 LICENSE = "PSFv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-pycrypto:"
 
 DEPENDS += " gmp"
 
diff --git a/recipes-devtools/python/python-pycryptodomex_3.9.4.bb b/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
index 8867acc..f863b56 100644
--- a/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
+++ b/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
@@ -10,18 +10,18 @@ SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-math \
 "
 
-RDEPENDS_${PN}-tests += " \
+RDEPENDS:${PN}-tests += " \
     ${PYTHON_PN}-unittest \
 "
 
 PACKAGES =+ "${PN}-tests"
 
-FILES_${PN}-tests += " \
+FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/__pycache__/ \
 "
diff --git a/recipes-devtools/python/python-pydbus_0.6.0.bb b/recipes-devtools/python/python-pydbus_0.6.0.bb
index 6795aba..853edef 100644
--- a/recipes-devtools/python/python-pydbus_0.6.0.bb
+++ b/recipes-devtools/python/python-pydbus_0.6.0.bb
@@ -11,6 +11,6 @@ S = "${WORKDIR}/pydbus-${PV}"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pygobject"
+RDEPENDS:${PN} = "${PYTHON_PN}-pygobject"
 
 PNBLACKLIST[python-pydbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyfirmata_1.1.0.bb b/recipes-devtools/python/python-pyfirmata_1.1.0.bb
index b250376..c805bcf 100644
--- a/recipes-devtools/python/python-pyfirmata_1.1.0.bb
+++ b/recipes-devtools/python/python-pyfirmata_1.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84ddcef430b7c44caa22b2ff4b37a3df"
 PYPI_PACKAGE = "pyFirmata"
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-pyserial \
 "
 
diff --git a/recipes-devtools/python/python-pyflakes_2.1.1.bb b/recipes-devtools/python/python-pyflakes_2.1.1.bb
index 22abd37..96ba9a4 100644
--- a/recipes-devtools/python/python-pyflakes_2.1.1.bb
+++ b/recipes-devtools/python/python-pyflakes_2.1.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e54
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-prettytable \
     ${PYTHON_PN}-cmd2 \
     ${PYTHON_PN}-pyparsing"
diff --git a/recipes-devtools/python/python-pyflame_1.6.7.bb b/recipes-devtools/python/python-pyflame_1.6.7.bb
index 21f26c9..ab0d32d 100644
--- a/recipes-devtools/python/python-pyflame_1.6.7.bb
+++ b/recipes-devtools/python/python-pyflame_1.6.7.bb
@@ -22,11 +22,11 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
 
-COMPATIBLE_HOST_libc-musl_class-target = "null"
-COMPATIBLE_HOST_mipsarch_class-target = "null"
-COMPATIBLE_HOST_aarch64_class-target = "null"
-COMPATIBLE_HOST_powerpc_class-target = "null"
-COMPATIBLE_HOST_riscv64_class-target = "null"
-COMPATIBLE_HOST_riscv32_class-target = "null"
+COMPATIBLE_HOST:libc-musl:class-target = "null"
+COMPATIBLE_HOST:mipsarch:class-target = "null"
+COMPATIBLE_HOST:aarch64:class-target = "null"
+COMPATIBLE_HOST:powerpc:class-target = "null"
+COMPATIBLE_HOST:riscv64:class-target = "null"
+COMPATIBLE_HOST:riscv32:class-target = "null"
 
 PNBLACKLIST[python-pyflame] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pygobject_3.34.0.bb b/recipes-devtools/python/python-pygobject_3.34.0.bb
index d825f05..2e9cacd 100644
--- a/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-EXTRA_OEMESON_append = " -Dpython=python2"
+EXTRA_OEMESON:append = " -Dpython=python2"
 
 PACKAGECONFIG ??= "stagedir"
 
@@ -31,10 +31,10 @@ PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
 PACKAGECONFIG[stagedir] = "-Dstagedir=${PYTHON_SITEPACKAGES_DIR}, -Dstagedir="", , "
 
 BBCLASSEXTEND = "native"
-RDEPENDS_${PN} = "python-io python-pkgutil"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} = "python-io python-pkgutil"
+RDEPENDS:${PN}:class-native = ""
 
-do_install_append() {
+do_install:append() {
     # Remove files that clash with python3-pygobject; their content is same
     rm -r ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig
 }
diff --git a/recipes-devtools/python/python-pygpgme_0.3.bb b/recipes-devtools/python/python-pygpgme_0.3.bb
index ac49f75..82b5d39 100644
--- a/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -16,7 +16,7 @@ SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
 SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
 
 DEPENDS += "gpgme"
-RDEPENDS_${PN} += "gnupg"
+RDEPENDS:${PN} += "gnupg"
 
 inherit pypi setuptools ptest
 
diff --git a/recipes-devtools/python/python-pyinotify_0.9.6.bb b/recipes-devtools/python/python-pyinotify_0.9.6.bb
index 4a9fc0c..e0fcb4f 100644
--- a/recipes-devtools/python/python-pyinotify_0.9.6.bb
+++ b/recipes-devtools/python/python-pyinotify_0.9.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-misc \
diff --git a/recipes-devtools/python/python-pyjks_19.0.0.bb b/recipes-devtools/python/python-pyjks_19.0.0.bb
index 03f3452..3f28015 100644
--- a/recipes-devtools/python/python-pyjks_19.0.0.bb
+++ b/recipes-devtools/python/python-pyjks_19.0.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "9ce5b40289bcdffcd6a8e7118b333ba8ba2ec4c9ebc5e324885cc8a697
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-javaobj-py3 \
     ${PYTHON_PN}-pyasn1 \
     ${PYTHON_PN}-pyasn1-modules \
diff --git a/recipes-devtools/python/python-pyjwt_1.7.1.bb b/recipes-devtools/python/python-pyjwt_1.7.1.bb
index d2830b5..8fc4df1 100644
--- a/recipes-devtools/python/python-pyjwt_1.7.1.bb
+++ b/recipes-devtools/python/python-pyjwt_1.7.1.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cba
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "${PYTHON_PN}-cryptography"
+RDEPENDS:${PN} = "${PYTHON_PN}-cryptography"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-pylint_1.8.3.bb b/recipes-devtools/python/python-pylint_1.8.3.bb
index a0a5011..641dec1 100644
--- a/recipes-devtools/python/python-pylint_1.8.3.bb
+++ b/recipes-devtools/python/python-pylint_1.8.3.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools python-dir
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
-do_install_append(){
+do_install:append(){
     rm ${D}${bindir}/pylint
     cat >> ${D}${bindir}/pylint <<EOF
 #!/usr/bin/env ${PYTHON_PN}
@@ -22,12 +22,12 @@ EOF
 }
 
 PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests+= " \
+FILES:${PN}-tests+= " \
     ${PYTHON_SITEPACKAGES_DIR}/pylint/test/ \
     ${PYTHON_SITEPACKAGES_DIR}/pylint/testutils.py \
 "
 
-RDEPENDS_${PN} += "${PYTHON_PN}-astroid \
+RDEPENDS:${PN} += "${PYTHON_PN}-astroid \
                    ${PYTHON_PN}-backports-functools-lru-cache \
                    ${PYTHON_PN}-isort \
                    ${PYTHON_PN}-numbers \
diff --git a/recipes-devtools/python/python-pymisp_2.4.119.1.bb b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
index 995540d..70e8406 100644
--- a/recipes-devtools/python/python-pymisp_2.4.119.1.bb
+++ b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
@@ -13,13 +13,13 @@ SRC_URI[sha256sum] = "594ea0a9e150052232425009eac6dd104a80f494d0e273cc48dd114d7e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_append_class-target = " \
+RDEPENDS:${PN}:append:class-target = " \
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-jsonschema \
 "
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-cachetools \
     ${PYTHON_PN}-deprecated \
     ${PYTHON_PN}-requests \
diff --git a/recipes-devtools/python/python-pymongo_3.10.1.bb b/recipes-devtools/python/python-pymongo_3.10.1.bb
index 62d2216..f7755b0 100644
--- a/recipes-devtools/python/python-pymongo_3.10.1.bb
+++ b/recipes-devtools/python/python-pymongo_3.10.1.bb
@@ -15,9 +15,9 @@ inherit pypi setuptools
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
-FILES_${PYTHON_PN}-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
+FILES:${PYTHON_PN}-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
 
-RDEPENDS_${PYTHON_PN}-bson += " \
+RDEPENDS:${PYTHON_PN}-bson += " \
      ${PYTHON_PN}-datetime \
      ${PYTHON_PN}-json \
      ${PYTHON_PN}-netclient \
@@ -25,7 +25,7 @@ RDEPENDS_${PYTHON_PN}-bson += " \
      ${PYTHON_PN}-threading \
 "
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-bson \
     ${PYTHON_PN}-pprint \
 "
diff --git a/recipes-devtools/python/python-pymysql_0.9.3.bb b/recipes-devtools/python/python-pymysql_0.9.3.bb
index f4d8c50..51384ba 100644
--- a/recipes-devtools/python/python-pymysql_0.9.3.bb
+++ b/recipes-devtools/python/python-pymysql_0.9.3.bb
@@ -16,6 +16,6 @@ inherit pypi setuptools
 
 PYPI_PACKAGE = "PyMySQL"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-cryptography"
+RDEPENDS:${PN} += "${PYTHON_PN}-cryptography"
 
 PNBLACKLIST[python-pymysql] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyopenssl_19.1.0.bb b/recipes-devtools/python/python-pyopenssl_19.1.0.bb
index 7fae532..c334d31 100644
--- a/recipes-devtools/python/python-pyopenssl_19.1.0.bb
+++ b/recipes-devtools/python/python-pyopenssl_19.1.0.bb
@@ -13,14 +13,14 @@ PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools
 
 PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
+FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 
-RDEPENDS_${PN}_class-target = " \
+RDEPENDS:${PN}:class-target = " \
     ${PYTHON_PN}-cryptography \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
 "
-RDEPENDS_${PN}-tests = "${PN}"
+RDEPENDS:${PN}-tests = "${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-pyparsing_2.4.6.bb b/recipes-devtools/python/python-pyparsing_2.4.6.bb
index aa8695c..2092a10 100644
--- a/recipes-devtools/python/python-pyparsing_2.4.6.bb
+++ b/recipes-devtools/python/python-pyparsing_2.4.6.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "4c830582a84fb022400b85429791bc551f1f4871c33f23e44f353119e9
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-json \
diff --git a/recipes-devtools/python/python-pyperclip_1.7.0.bb b/recipes-devtools/python/python-pyperclip_1.7.0.bb
index ae7a23b..be569ad 100644
--- a/recipes-devtools/python/python-pyperclip_1.7.0.bb
+++ b/recipes-devtools/python/python-pyperclip_1.7.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "979325468ccf682104d5dcaf753f869868100631301d3e72f47babdea5
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-subprocess \
diff --git a/recipes-devtools/python/python-pyperf_1.7.0.bb b/recipes-devtools/python/python-pyperf_1.7.0.bb
index 1c1e451..c93c106 100644
--- a/recipes-devtools/python/python-pyperf_1.7.0.bb
+++ b/recipes-devtools/python/python-pyperf_1.7.0.bb
@@ -23,7 +23,7 @@ PYPI_PACKAGE = "pyperf"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-fcntl \
diff --git a/recipes-devtools/python/python-pyrex-native_0.9.9.bb b/recipes-devtools/python/python-pyrex-native_0.9.9.bb
index 620753b..3c64c2f 100644
--- a/recipes-devtools/python/python-pyrex-native_0.9.9.bb
+++ b/recipes-devtools/python/python-pyrex-native_0.9.9.bb
@@ -1,7 +1,7 @@
 require python-pyrex_${PV}.bb
 inherit native pythonnative
 DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
+RDEPENDS:${PN} = ""
 PR = "r3"
 
 PNBLACKLIST[python-pyrex-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrex_0.9.9.bb b/recipes-devtools/python/python-pyrex_0.9.9.bb
index 1f5b539..1169e8f 100644
--- a/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -19,6 +19,6 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-FILES_${PN} += "${datadir}/${baselib}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
+FILES:${PN} += "${datadir}/${baselib}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
 
 PNBLACKLIST[python-pyrex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyroute2_0.5.7.bb b/recipes-devtools/python/python-pyroute2_0.5.7.bb
index c17bf11..1b5719d 100644
--- a/recipes-devtools/python/python-pyroute2_0.5.7.bb
+++ b/recipes-devtools/python/python-pyroute2_0.5.7.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI[md5sum] = "371683b62314211b8bc9807ac8ef1144"
 SRC_URI[sha256sum] = "963fce07da2841456d39e3b932b071f6de28d23dadfae014022d67a752916f98"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-pyroute2:"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-io \
diff --git a/recipes-devtools/python/python-pyrsistent_0.15.7.bb b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
index 618a767..40dd572 100644
--- a/recipes-devtools/python/python-pyrsistent_0.15.7.bb
+++ b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
@@ -8,11 +8,11 @@ SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-six \
 "
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-numbers \
 "
 
diff --git a/recipes-devtools/python/python-pyrtm_0.4.2.bb b/recipes-devtools/python/python-pyrtm_0.4.2.bb
index bffd0b1..22f852a 100644
--- a/recipes-devtools/python/python-pyrtm_0.4.2.bb
+++ b/recipes-devtools/python/python-pyrtm_0.4.2.bb
@@ -12,25 +12,25 @@ inherit pypi setuptools
 
 PACKAGES =+ "${PN}-tests ${PN}-samples"
 
-FILES_${PN}-samples += " \
+FILES:${PN}-samples += " \
     ${PYTHON_SITEPACKAGES_DIR}/rtm/samples \
 "
 
-FILES_${PN}-tests += " \
+FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/rtm/tests \
 "
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
 "
 
-RDEPENDS_${PN}-samples += " \
+RDEPENDS:${PN}-samples += " \
     ${PN} \
 "
 
-RDEPENDS_${PN}-tests += " \
+RDEPENDS:${PN}-tests += " \
     ${PN} \
     ${PYTHON_PN}-unittest \
 "
diff --git a/recipes-devtools/python/python-pyserial_3.4.bb b/recipes-devtools/python/python-pyserial_3.4.bb
index fc0a131..b2765b7 100644
--- a/recipes-devtools/python/python-pyserial_3.4.bb
+++ b/recipes-devtools/python/python-pyserial_3.4.bb
@@ -9,17 +9,17 @@ inherit pypi setuptools
 
 PACKAGES =+ "${PN}-java ${PN}-osx ${PN}-win32 ${PN}-tools"
 
-FILES_${PN}-java = " \
+FILES:${PN}-java = " \
     ${PYTHON_SITEPACKAGES_DIR}/serial/*java* \
     ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*java* \
 "
 
-FILES_${PN}-osx = " \
+FILES:${PN}-osx = " \
     ${PYTHON_SITEPACKAGES_DIR}/serial/tools/*osx* \
     ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*osx* \
 "
 
-FILES_${PN}-win32 = " \
+FILES:${PN}-win32 = " \
     ${PYTHON_SITEPACKAGES_DIR}/serial/*serialcli* \
     ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*serialcli* \
     ${PYTHON_SITEPACKAGES_DIR}/serial/*win32* \
@@ -30,7 +30,7 @@ FILES_${PN}-win32 = " \
     ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*windows* \
 "
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
diff --git a/recipes-devtools/python/python-pysmi_0.3.4.bb b/recipes-devtools/python/python-pysmi_0.3.4.bb
index d7c3de9..c642181 100644
--- a/recipes-devtools/python/python-pysmi_0.3.4.bb
+++ b/recipes-devtools/python/python-pysmi_0.3.4.bb
@@ -13,6 +13,6 @@ SRC_URI[sha256sum] = "bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-ply"
+RDEPENDS:${PN} = "python-ply"
 
 PNBLACKLIST[python-pysmi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysnmp_4.4.9.bb b/recipes-devtools/python/python-pysnmp_4.4.9.bb
index edb37a8..eecdf51 100644
--- a/recipes-devtools/python/python-pysnmp_4.4.9.bb
+++ b/recipes-devtools/python/python-pysnmp_4.4.9.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-RDEPENDS_${PN} += "python-pycryptodomex \
+RDEPENDS:${PN} += "python-pycryptodomex \
                    python-pyasn1 \
                    python-pysmi \
 "
diff --git a/recipes-devtools/python/python-pysocks_1.7.1.bb b/recipes-devtools/python/python-pysocks_1.7.1.bb
index 0bfc893..c4050b3 100644
--- a/recipes-devtools/python/python-pysocks_1.7.1.bb
+++ b/recipes-devtools/python/python-pysocks_1.7.1.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "PySocks"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
diff --git a/recipes-devtools/python/python-pysqlite_2.8.3.bb b/recipes-devtools/python/python-pysqlite_2.8.3.bb
index 2f4d6fe..59216cc 100644
--- a/recipes-devtools/python/python-pysqlite_2.8.3.bb
+++ b/recipes-devtools/python/python-pysqlite_2.8.3.bb
@@ -13,11 +13,11 @@ inherit pypi setuptools
 
 DEPENDS += "${PYTHON_PN}-pip"
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
     sqlite3 \
 "
 
-FILES_${PN}-doc += "${datadir}"
+FILES:${PN}-doc += "${datadir}"
 
 PNBLACKLIST[python-pysqlite] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pystache_0.5.4.bb b/recipes-devtools/python/python-pystache_0.5.4.bb
index 95a953c..58cbaf1 100644
--- a/recipes-devtools/python/python-pystache_0.5.4.bb
+++ b/recipes-devtools/python/python-pystache_0.5.4.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "f7bbc265fb957b4d6c7c042b336563179444ab313fb93a719759111eab
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-netserver \
 "
 
diff --git a/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb b/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
index fd357bb..09c1849 100644
--- a/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
+++ b/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "4eff23a19f92410c0166f6dffbfa8901d3e14a80e97d70cd08428b6d59
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     python-pytest \
     "
 
diff --git a/recipes-devtools/python/python-pytest-runner_5.2.bb b/recipes-devtools/python/python-pytest-runner_5.2.bb
index 111ad61..0851cf6 100644
--- a/recipes-devtools/python/python-pytest-runner_5.2.bb
+++ b/recipes-devtools/python/python-pytest-runner_5.2.bb
@@ -10,11 +10,11 @@ inherit pypi setuptools
 DEPENDS += " \
     ${PYTHON_PN}-setuptools-scm-native"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
+RDEPENDS:${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
                   ${PYTHON_PN}-io"
 
 # Dependency only exists for python2
-RDEPENDS_${PN} += "python-argparse python-compiler"
+RDEPENDS:${PN} += "python-argparse python-compiler"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb b/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
index 8bc8fa6..c07f9da 100644
--- a/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
+++ b/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     python-pytest \
     "
 
diff --git a/recipes-devtools/python/python-pytest_4.6.9.bb b/recipes-devtools/python/python-pytest_4.6.9.bb
index b3ac32b..c32da21 100644
--- a/recipes-devtools/python/python-pytest_4.6.9.bb
+++ b/recipes-devtools/python/python-pytest_4.6.9.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "19e8f75eac01dd3f211edd465b39efbcbdc8fc5f7866d7dd49fedb30d8
 
 inherit update-alternatives pypi setuptools
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-atomicwrites \
     ${PYTHON_PN}-attrs \
@@ -31,13 +31,13 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-wcwidth \
 "
 
-RDEPENDS_${PN}-ptest += "\
+RDEPENDS:${PN}-ptest += "\
     ${PYTHON_PN}-hypothesis \
 "
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pytest:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-pytest:"
 
-ALTERNATIVE_${PN} += "py.test pytest"
+ALTERNATIVE:${PN} += "py.test pytest"
 
 NATIVE_LINK_NAME[pytest] = "${bindir}/pytest"
 ALTERNATIVE_TARGET[pytest] = "${bindir}/pytest"
diff --git a/recipes-devtools/python/python-pytz_2019.3.bb b/recipes-devtools/python/python-pytz_2019.3.bb
index c8c4a10..6e51c3a 100755
--- a/recipes-devtools/python/python-pytz_2019.3.bb
+++ b/recipes-devtools/python/python-pytz_2019.3.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "c3d84a465fc56a4edd52cca8873ac0df"
 SRC_URI[sha256sum] = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be"
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-io \
diff --git a/recipes-devtools/python/python-pyudev_0.21.0.bb b/recipes-devtools/python/python-pyudev_0.21.0.bb
index 62c83b0..e6ed7e4 100644
--- a/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -8,12 +8,12 @@ SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371
 
 inherit pypi setuptools
 
-do_configure_prepend() {
+do_configure:prepend() {
     sed -i "/import pyudev/d" ${S}/setup.py
     sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
 }
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-misc \
diff --git a/recipes-devtools/python/python-pyyaml_5.4.1.bb b/recipes-devtools/python/python-pyyaml_5.4.1.bb
index 76799f8..2ea1eac 100644
--- a/recipes-devtools/python/python-pyyaml_5.4.1.bb
+++ b/recipes-devtools/python/python-pyyaml_5.4.1.bb
@@ -12,7 +12,7 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "46e25294c7efec23d4072ed6a7777f46"
 SRC_URI[sha256sum] = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
 "
 
diff --git a/recipes-devtools/python/python-pyzmq_17.1.0.bb b/recipes-devtools/python/python-pyzmq_17.1.0.bb
index a0288f2..c6654d3 100644
--- a/recipes-devtools/python/python-pyzmq_17.1.0.bb
+++ b/recipes-devtools/python/python-pyzmq_17.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
                     file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
 DEPENDS = "zeromq"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
 SRC_URI[md5sum] = "aecdfc328193fbd81f6dc23228319943"
@@ -13,11 +13,11 @@ SRC_URI[sha256sum] = "2199f753a230e26aec5238b0518b036780708a4c887d4944519681a920
 
 inherit pypi pkgconfig setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-multiprocessing"
+RDEPENDS:${PN} += "${PYTHON_PN}-multiprocessing"
 
-FILES_${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
+FILES:${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
 
-do_compile_prepend() {
+do_compile:prepend() {
     echo [global] > ${S}/setup.cfg
     echo zmq_prefix = ${STAGING_DIR_HOST} >> ${S}/setup.cfg
     echo have_sys_un_h = True >> ${S}/setup.cfg
diff --git a/recipes-devtools/python/python-rdflib_4.2.2.bb b/recipes-devtools/python/python-rdflib_4.2.2.bb
index f1fa4fe..8036330 100644
--- a/recipes-devtools/python/python-rdflib_4.2.2.bb
+++ b/recipes-devtools/python/python-rdflib_4.2.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc2
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-isodate \
     ${PYTHON_PN}-pyparsing \
 "
diff --git a/recipes-devtools/python/python-redis_2.10.6.bb b/recipes-devtools/python/python-redis_2.10.6.bb
index 943e0d3..534fdf9 100644
--- a/recipes-devtools/python/python-redis_2.10.6.bb
+++ b/recipes-devtools/python/python-redis_2.10.6.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e9
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
 "
 
diff --git a/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb b/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
index a1cf2f2..976a197 100644
--- a/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
+++ b/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8b
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-requests"
+RDEPENDS:${PN} += "${PYTHON_PN}-requests"
 
 
 PNBLACKLIST[python-requests-oauthlib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-requests_2.23.0.bb b/recipes-devtools/python/python-requests_2.23.0.bb
index bdfe3d5..88119f3 100644
--- a/recipes-devtools/python/python-requests_2.23.0.bb
+++ b/recipes-devtools/python/python-requests_2.23.0.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-requests:"
 
 SRC_URI[md5sum] = "abfdc28db1065bbd0bc32592ac9d27a6"
 SRC_URI[sha256sum] = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-chardet \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-idna \
diff --git a/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb b/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
index ec4773f..469b174 100644
--- a/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
+++ b/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/naimetti/rfc3339-validator"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3339-validator:"
 
 SRC_URI[md5sum] = "9d8899041d83f98180bddd8b62ee7e99"
 SRC_URI[sha256sum] = "20a600d01fbb1f793cbb6f4ec4ebb2104f4c9e80d74d5f78350b63ecc6cccd08"
@@ -12,11 +12,11 @@ PYPI_PACKAGE = "rfc3339_validator"
 
 inherit pypi setuptools
 
-SRC_URI_append = " \
+SRC_URI:append = " \
     file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
 "
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-six \
diff --git a/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb b/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
index 1b31961..30db433 100644
--- a/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
+++ b/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/naimetti/rfc3986-validator"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3986-validator:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3986-validator:"
 
 SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
 SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
@@ -12,11 +12,11 @@ PYPI_PACKAGE = "rfc3986_validator"
 
 inherit pypi setuptools
 
-SRC_URI_append = " \
+SRC_URI:append = " \
     file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
 "
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     python-core \
 "
 
diff --git a/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb b/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
index 352d67a..575e292 100644
--- a/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
+++ b/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE = "robotframework-seriallibrary"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pyserial \
     ${PYTHON_PN}-robotframework \
 "
diff --git a/recipes-devtools/python/python-robotframework_3.0.4.bb b/recipes-devtools/python/python-robotframework_3.0.4.bb
index b700640..97364af 100644
--- a/recipes-devtools/python/python-robotframework_3.0.4.bb
+++ b/recipes-devtools/python/python-robotframework_3.0.4.bb
@@ -15,7 +15,7 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "ee753415645ff4831ff0d366a0467fe7"
 SRC_URI[sha256sum] = "ab94257cbd848dfca7148e092d233a12853cc7e840ce8231af9cbb5e7f51aa47"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-difflib \
     ${PYTHON_PN}-docutils \
diff --git a/recipes-devtools/python/python-scrypt_0.8.6.bb b/recipes-devtools/python/python-scrypt_0.8.6.bb
index 5176653..46cdad4 100644
--- a/recipes-devtools/python/python-scrypt_0.8.6.bb
+++ b/recipes-devtools/python/python-scrypt_0.8.6.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=168ff75417f75a83e63c8875292d44dc"
 HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-scrypt:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-scrypt:"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741
 
 inherit pypi setuptools python-dir
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
 "
 
 
diff --git a/recipes-devtools/python/python-selectors34_1.2.bb b/recipes-devtools/python/python-selectors34_1.2.bb
index 579841f..e8bf2ec 100644
--- a/recipes-devtools/python/python-selectors34_1.2.bb
+++ b/recipes-devtools/python/python-selectors34_1.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "09f5066337f8a76fb5233f267873f89a27a17c10bf79575954894bb716
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-six \
     "    
 
diff --git a/recipes-devtools/python/python-serpent_1.28.bb b/recipes-devtools/python/python-serpent_1.28.bb
index 717df16..942cef1 100644
--- a/recipes-devtools/python/python-serpent_1.28.bb
+++ b/recipes-devtools/python/python-serpent_1.28.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-numbers \
     "    
diff --git a/recipes-devtools/python/python-setuptools-scm_3.3.3.bb b/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
index 9fd9ef4..c6f2516 100644
--- a/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
+++ b/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
@@ -9,10 +9,10 @@ PYPI_PACKAGE = "setuptools_scm"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
-RDEPENDS_${PN}_class-native = "${PYTHON_PN}-setuptools-native"
+RDEPENDS:${PN}:class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
+RDEPENDS:${PN}:class-native = "${PYTHON_PN}-setuptools-native"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
+RDEPENDS:${PN} += "${PYTHON_PN}-argparse"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes-devtools/python/python-setuptools.inc b/recipes-devtools/python/python-setuptools.inc
index 5f427fd..3684e6c 100644
--- a/recipes-devtools/python/python-setuptools.inc
+++ b/recipes-devtools/python/python-setuptools.inc
@@ -8,14 +8,14 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
-SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
+SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI[md5sum] = "5ac69b66a6f7d4785517017f37df28e9"
 SRC_URI[sha256sum] = "c5b372090d7c8709ce79a6a66872a91e518f7d65af97fca78135e1cb10d4b940"
 
 DEPENDS += "${PYTHON_PN}"
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
   ${PYTHON_PN}-compile \
   ${PYTHON_PN}-compression \
   ${PYTHON_PN}-ctypes \
@@ -33,7 +33,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-unittest \
   ${PYTHON_PN}-xml \
 "
-do_install_prepend() {
+do_install:prepend() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
 
@@ -43,4 +43,4 @@ BBCLASSEXTEND = "native nativesdk"
 # and easy_install. Ship it in a separate package so that it can be used by
 # minimal distributions.
 PACKAGES =+ "${PYTHON_PN}-pkg-resources "
-FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
+FILES:${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
diff --git a/recipes-devtools/python/python-setuptools_42.0.2.bb b/recipes-devtools/python/python-setuptools_42.0.2.bb
index 4cc316e..c1df12b 100644
--- a/recipes-devtools/python/python-setuptools_42.0.2.bb
+++ b/recipes-devtools/python/python-setuptools_42.0.2.bb
@@ -4,8 +4,8 @@ PROVIDES = "python-distribute"
 
 inherit setuptools
 
-RREPLACES_${PN} = "python-distribute"
-RPROVIDES_${PN} = "python-distribute"
-RCONFLICTS_${PN} = "python-distribute"
+RREPLACES:${PN} = "python-distribute"
+RPROVIDES:${PN} = "python-distribute"
+RCONFLICTS:${PN} = "python-distribute"
 
 PNBLACKLIST[python-setuptools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sh_1.12.14.bb b/recipes-devtools/python/python-sh_1.12.14.bb
index 03640e4..8dd214a 100644
--- a/recipes-devtools/python/python-sh_1.12.14.bb
+++ b/recipes-devtools/python/python-sh_1.12.14.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "sh"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-core \
diff --git a/recipes-devtools/python/python-simplejson_3.17.0.bb b/recipes-devtools/python/python-simplejson_3.17.0.bb
index 89002a3..91e5800 100644
--- a/recipes-devtools/python/python-simplejson_3.17.0.bb
+++ b/recipes-devtools/python/python-simplejson_3.17.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
@@ -17,8 +17,8 @@ RDEPENDS_${PN} += "\
 "
 
 PACKAGES =+ "${PN}-tests"
-RDEPENDS_${PN}-tests = "${PN} ${PYTHON_PN}-unittest"
-FILES_${PN}-tests+= " \
+RDEPENDS:${PN}-tests = "${PN} ${PYTHON_PN}-unittest"
+FILES:${PN}-tests+= " \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
     ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
 "
diff --git a/recipes-devtools/python/python-slip-dbus_0.6.5.bb b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
index 6099ecf..f91c370 100644
--- a/recipes-devtools/python/python-slip-dbus_0.6.5.bb
+++ b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 SRC_URI[md5sum] = "28ae5f93853466c44ec96706ba2a1eb4"
 SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
 
-do_compile_prepend() {
+do_compile:prepend() {
     sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
 }
 
@@ -28,7 +28,7 @@ do_compile_prepend() {
 # python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
 CLEANBROKEN = "1"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-dbus \
     ${PYTHON_PN}-decorator \
     ${PYTHON_PN}-pygobject \
diff --git a/recipes-devtools/python/python-snakefood_1.4.bb b/recipes-devtools/python/python-snakefood_1.4.bb
index f85b284..766ce43 100644
--- a/recipes-devtools/python/python-snakefood_1.4.bb
+++ b/recipes-devtools/python/python-snakefood_1.4.bb
@@ -43,9 +43,9 @@ SRC_URI[sha256sum] = "295784668032254e7391ca99ba7060edd3ae4eca1a330ac11627b18ab5
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = " python-logging python-compiler python-shell"
+RDEPENDS:${PN} = " python-logging python-compiler python-shell"
 # the above modules do not have a -native counterpart
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes-devtools/python/python-snimpy_0.8.13.bb b/recipes-devtools/python/python-snimpy_0.8.13.bb
index 173e66d..8ed665d 100644
--- a/recipes-devtools/python/python-snimpy_0.8.13.bb
+++ b/recipes-devtools/python/python-snimpy_0.8.13.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "98b1790977b435332c03ab2603f6621eeeee69a50453ac01ca55dc7696
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-cffi \
+RDEPENDS:${PN} = "python-cffi \
                   python-pycparser \
                   python-pysnmp \
                   python-setuptools \
diff --git a/recipes-devtools/python/python-socketio_4.3.1.bb b/recipes-devtools/python/python-socketio_4.3.1.bb
index fa99f33..e7ab2c8 100644
--- a/recipes-devtools/python/python-socketio_4.3.1.bb
+++ b/recipes-devtools/python/python-socketio_4.3.1.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
 PACKAGECONFIG[client] = ",,,${PYTHON_PN}-requests ${PYTHON_PN}-websocket-client"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-engineio \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-math \
diff --git a/recipes-devtools/python/python-soupsieve_1.9.4.bb b/recipes-devtools/python/python-soupsieve_1.9.4.bb
index 8c73a53..2767c1a 100644
--- a/recipes-devtools/python/python-soupsieve_1.9.4.bb
+++ b/recipes-devtools/python/python-soupsieve_1.9.4.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1ed
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
+RDEPENDS:${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-sparts_0.7.3.bb b/recipes-devtools/python/python-sparts_0.7.3.bb
index 945e076..e306d17 100644
--- a/recipes-devtools/python/python-sparts_0.7.3.bb
+++ b/recipes-devtools/python/python-sparts_0.7.3.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "b25707c349079a7c888155e7fdfd8394df2da9aca9c8eee4e205528cb1
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
                python-subprocess \
                python-six \
                python-argparse \
diff --git a/recipes-devtools/python/python-sqlalchemy_1.3.12.bb b/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
index fb76625..ce6125f 100644
--- a/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
+++ b/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
@@ -11,7 +11,7 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "02a46be841903b60c52a83342d3ced8e"
 SRC_URI[sha256sum] = "bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-logging \
diff --git a/recipes-devtools/python/python-stevedore_1.31.0.bb b/recipes-devtools/python/python-stevedore_1.31.0.bb
index 1f91e4b..fc96485 100644
--- a/recipes-devtools/python/python-stevedore_1.31.0.bb
+++ b/recipes-devtools/python/python-stevedore_1.31.0.bb
@@ -11,7 +11,7 @@ inherit pypi setuptools
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
+RDEPENDS:${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes-devtools/python/python-systemd_234.bb b/recipes-devtools/python/python-systemd_234.bb
index 680d81e..907ea99 100644
--- a/recipes-devtools/python/python-systemd_234.bb
+++ b/recipes-devtools/python/python-systemd_234.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
 PYPI_PACKAGE = "systemd-python"
 DEPENDS += "systemd (<=234)"
-RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
+RDEPENDS:${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit pypi features_check setuptools
@@ -14,10 +14,10 @@ SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
 SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
 
 # allow for common patches for python- and python3-systemd
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-systemd:"
 
 SRC_URI += "file://endian.patch"
 
-SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
+SRC_URI:append:libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
 
 PNBLACKLIST[python-systemd] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-toml_0.10.0.bb b/recipes-devtools/python/python-toml_0.10.0.bb
index 6e54315..5189776 100644
--- a/recipes-devtools/python/python-toml_0.10.0.bb
+++ b/recipes-devtools/python/python-toml_0.10.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
 "
 
diff --git a/recipes-devtools/python/python-tornado-redis_2.4.18.bb b/recipes-devtools/python/python-tornado-redis_2.4.18.bb
index 2413f99..998a28c 100644
--- a/recipes-devtools/python/python-tornado-redis_2.4.18.bb
+++ b/recipes-devtools/python/python-tornado-redis_2.4.18.bb
@@ -13,8 +13,8 @@ SRC_URI[sha256sum] = "8fd3b324158291ad5fb7f5f8dc2e8763b2895556bd2a44f2dd721b703c
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "python-tornado"
+RDEPENDS:${PN} += "python-tornado"
 
-RDEPENDS_${PN}-test += "${PN} python-tornado"
+RDEPENDS:${PN}-test += "${PN} python-tornado"
 
 PNBLACKLIST[python-tornado-redis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tornado_6.0.3.bb b/recipes-devtools/python/python-tornado_6.0.3.bb
index a7c1fdb..3bf29c2 100644
--- a/recipes-devtools/python/python-tornado_6.0.3.bb
+++ b/recipes-devtools/python/python-tornado_6.0.3.bb
@@ -10,24 +10,24 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
 SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
+RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
                    ${PYTHON_PN}-ctypes"
 
-RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
+RDEPENDS:${PN}-test += "${PN} ${PYTHON_PN}-unittest"
 
 PACKAGES =+ "\
     ${PN}-test \
 "
 
-FILES_${PN}-test = " \
+FILES:${PN}-test = " \
     ${libdir}/${PYTHON_DIR}/site-packages/*/test \
     ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
 "
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-backports-abc \
     ${PYTHON_PN}-backports-ssl \
     ${PYTHON_PN}-singledispatch \
diff --git a/recipes-devtools/python/python-tqdm_4.41.1.bb b/recipes-devtools/python/python-tqdm_4.41.1.bb
index 05d6a3f..b181ed2 100644
--- a/recipes-devtools/python/python-tqdm_4.41.1.bb
+++ b/recipes-devtools/python/python-tqdm_4.41.1.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "aa3d5fd173c9fea7408cad14c0e73d5d"
 SRC_URI[sha256sum] = "4789ccbb6fc122b5a6a85d512e4e41fc5acad77216533a6f2b8ce51e0f265c23"
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-numbers \
diff --git a/recipes-devtools/python/python-traceback2_1.4.0.bb b/recipes-devtools/python/python-traceback2_1.4.0.bb
index 7dea468..b7145f9 100644
--- a/recipes-devtools/python/python-traceback2_1.4.0.bb
+++ b/recipes-devtools/python/python-traceback2_1.4.0.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools
 
 CLEANBROKEN = "1"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-linecache2"
+RDEPENDS:${PN} = "${PYTHON_PN}-linecache2"
 
 PNBLACKLIST[python-traceback2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-twisted_19.10.0.bb b/recipes-devtools/python/python-twisted_19.10.0.bb
index 72a87c8..e5f511d 100644
--- a/recipes-devtools/python/python-twisted_19.10.0.bb
+++ b/recipes-devtools/python/python-twisted_19.10.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
 
 # allow for common patches for python- and python3-twisted
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-twisted:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-twisted:"
 
 SRC_URI += "file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch"
 
@@ -20,7 +20,7 @@ SRC_URI[md5sum] = "f2d70f7a66ecdf54152310164cceadfe"
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
 
-do_install_append() {
+do_install:append() {
     # remove some useless files before packaging
     find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
 }
@@ -49,7 +49,7 @@ DEPENDS += " \
     ${PYTHON_PN}-incremental-native \
 "
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     ${PN}-bin \
     ${PN}-core \
     ${PN}-conch \
@@ -63,7 +63,7 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = " \
+RDEPENDS:${PN}-core = " \
     ${PYTHON_PN}-automat \
     ${PYTHON_PN}-constantly \
     ${PYTHON_PN}-core \
@@ -81,9 +81,9 @@ RDEPENDS_${PN}-core = " \
     ${PYTHON_PN}-zopeinterface \
 "
 
-RDEPENDS_${PN}-test = "${PN}"
+RDEPENDS:${PN}-test = "${PN}"
 
-RDEPENDS_${PN}-conch = " \
+RDEPENDS:${PN}-conch = " \
     ${PN}-core \
     ${PN}-protocols \
     ${PYTHON_PN}-bcrypt \
@@ -92,39 +92,39 @@ RDEPENDS_${PN}-conch = " \
     ${PYTHON_PN}-pyasn1 \
 "
 
-RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-names = "${PN}-core"
-RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-words += "${PN}-core"
-RDEPENDS_${PN}-flow += "${PN}-core"
-RDEPENDS_${PN}-pair += "${PN}-core"
-RDEPENDS_${PN}-dbg = "${PN}"
+RDEPENDS:${PN}-mail = "${PN}-core ${PN}-protocols"
+RDEPENDS:${PN}-names = "${PN}-core"
+RDEPENDS:${PN}-news = "${PN}-core ${PN}-protocols"
+RDEPENDS:${PN}-runner = "${PN}-core ${PN}-protocols"
+RDEPENDS:${PN}-web += "${PN}-core ${PN}-protocols"
+RDEPENDS:${PN}-words += "${PN}-core"
+RDEPENDS:${PN}-flow += "${PN}-core"
+RDEPENDS:${PN}-pair += "${PN}-core"
+RDEPENDS:${PN}-dbg = "${PN}"
 
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
+ALLOW_EMPTY:${PN} = "1"
+FILES:${PN} = ""
 
-FILES_${PN}-test = " \
+FILES:${PN}-test = " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/test \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy/test/ \
 "
 
-FILES_${PN}-protocols = " \
+FILES:${PN}-protocols = " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \
 "
 
-FILES_${PN}-zsh = " \
+FILES:${PN}-zsh = " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/zsh \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/zshcomp.* \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/twisted-completion.zsh \
 "
 
-FILES_${PN}-conch = " \
+FILES:${PN}-conch = " \
     ${bindir}/ckeygen \
     ${bindir}/tkconch \
     ${bindir}/conch \
@@ -134,7 +134,7 @@ FILES_${PN}-conch = " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/conch  \
 "
 
-FILES_${PN}-core = " \
+FILES:${PN}-core = " \
 ${bindir}/manhole \
 ${bindir}/mktap \
 ${bindir}/twistd \
@@ -223,59 +223,59 @@ ${PYTHON_SITEPACKAGES_DIR}/twisted/_threads/ \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/positioning/ \
 "
 
-FILES_${PN}-mail = " \
+FILES:${PN}-mail = " \
 ${bindir}/mailmail \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_mail.py* \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/mail \
 "
 
-FILES_${PN}-names = " \
+FILES:${PN}-names = " \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_names.py* \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/names \
 "
 
-FILES_${PN}-news = " \
+FILES:${PN}-news = " \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_news.py* \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/news \
 "
 
-FILES_${PN}-runner = " \
+FILES:${PN}-runner = " \
 ${libdir}/site-packages/twisted/runner/portmap.so \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/runner\
 "
 
-FILES_${PN}-web = " \
+FILES:${PN}-web = " \
 ${bindir}/websetroot \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_web.py* \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/web\
 "
 
-FILES_${PN}-words = " \
+FILES:${PN}-words = " \
 ${bindir}/im \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_words.py* \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/words\
 "
 
-FILES_${PN}-flow = " \
+FILES:${PN}-flow = " \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_flow.py* \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/flow \"
 
-FILES_${PN}-pair = " \
+FILES:${PN}-pair = " \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/pair \
 "
 
-FILES_${PN}-dbg += " \
+FILES:${PN}-dbg += " \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/*/.debug \
 ${PYTHON_SITEPACKAGES_DIR}/twisted/*/*/.debug \
 "
 
-FILES_${PN}-doc += " \
+FILES:${PN}-doc += " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/_pydoctortemplates/ \
 "
 
-RDEPENDS_${PN}-src = "${PN}"
-FILES_${PN}-src = " \
+RDEPENDS:${PN}-src = "${PN}"
+FILES:${PN}-src = " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/*.py \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/*/*.py \
@@ -283,9 +283,9 @@ FILES_${PN}-src = " \
 
 inherit pypi python-dir setuptools
 
-RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
+RDEPENDS:${PN}-core += "${PYTHON_PN}-contextlib"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PN}-news \
 "
 
diff --git a/recipes-devtools/python/python-twitter_3.8.0.bb b/recipes-devtools/python/python-twitter_3.8.0.bb
index 1bd13cc..a90bd95 100644
--- a/recipes-devtools/python/python-twitter_3.8.0.bb
+++ b/recipes-devtools/python/python-twitter_3.8.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "tweepy"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
         ${PYTHON_PN}-pip \
         ${PYTHON_PN}-pysocks \
         ${PYTHON_PN}-requests \
diff --git a/recipes-devtools/python/python-ujson_1.35.bb b/recipes-devtools/python/python-ujson_1.35.bb
index 017fa23..cc81ba5 100644
--- a/recipes-devtools/python/python-ujson_1.35.bb
+++ b/recipes-devtools/python/python-ujson_1.35.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a22
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
     "
diff --git a/recipes-devtools/python/python-unidiff_0.5.5.bb b/recipes-devtools/python/python-unidiff_0.5.5.bb
index dbc32ae..98030cb 100644
--- a/recipes-devtools/python/python-unidiff_0.5.5.bb
+++ b/recipes-devtools/python/python-unidiff_0.5.5.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "9c9ab5fb96b6988b4cd5def6b275492442c04a570900d33aa637310578
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-io \
 "
diff --git a/recipes-devtools/python/python-urllib3_1.25.7.bb b/recipes-devtools/python/python-urllib3_1.25.7.bb
index a185215..f6375ef 100644
--- a/recipes-devtools/python/python-urllib3_1.25.7.bb
+++ b/recipes-devtools/python/python-urllib3_1.25.7.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e4
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-cryptography \
     ${PYTHON_PN}-email \
diff --git a/recipes-devtools/python/python-vcversioner_2.16.0.0.bb b/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
index dbea395..c5a2f5e 100644
--- a/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
+++ b/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
@@ -9,10 +9,10 @@ SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-subprocess \
     "
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes-devtools/python/python-vine_1.1.4.bb b/recipes-devtools/python/python-vine_1.1.4.bb
index 19b622f..66ae96b 100644
--- a/recipes-devtools/python/python-vine_1.1.4.bb
+++ b/recipes-devtools/python/python-vine_1.1.4.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c5
 
 inherit setuptools pypi
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
         "
 
 PNBLACKLIST[python-vine] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-vobject_0.9.6.1.bb b/recipes-devtools/python/python-vobject_0.9.6.1.bb
index dd5faea..d7718dc 100644
--- a/recipes-devtools/python/python-vobject_0.9.6.1.bb
+++ b/recipes-devtools/python/python-vobject_0.9.6.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "96512aec74b90abb71f6b53898dd7fe47300cc940104c4f79148f0671f
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-numbers \
     "
diff --git a/recipes-devtools/python/python-waitress_1.4.2.bb b/recipes-devtools/python/python-waitress_1.4.2.bb
index d982b4f..9ab73f1 100644
--- a/recipes-devtools/python/python-waitress_1.4.2.bb
+++ b/recipes-devtools/python/python-waitress_1.4.2.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "67a60a376f0eb335ed88967c42b73983a58d66a2a72eb9009a42725f74
 
 inherit setuptools pypi
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-logging \
diff --git a/recipes-devtools/python/python-webcolors_1.8.1.bb b/recipes-devtools/python/python-webcolors_1.8.1.bb
index 50b6d16..113b8ef 100644
--- a/recipes-devtools/python/python-webcolors_1.8.1.bb
+++ b/recipes-devtools/python/python-webcolors_1.8.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "030562f624467a9901f0b455fef05486a88cfb5daa1e356bd4aacea043
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS:${PN}:class-target = "\
     ${PYTHON_PN}-stringold \
 "
 
diff --git a/recipes-devtools/python/python-webencodings_0.5.1.bb b/recipes-devtools/python/python-webencodings_0.5.1.bb
index 184d743..3f74c9b 100644
--- a/recipes-devtools/python/python-webencodings_0.5.1.bb
+++ b/recipes-devtools/python/python-webencodings_0.5.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab1674858
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-json \
 "
diff --git a/recipes-devtools/python/python-werkzeug_0.16.0.bb b/recipes-devtools/python/python-werkzeug_0.16.0.bb
index b6c2e94..625723a 100644
--- a/recipes-devtools/python/python-werkzeug_0.16.0.bb
+++ b/recipes-devtools/python/python-werkzeug_0.16.0.bb
@@ -18,14 +18,14 @@ PYPI_PACKAGE = "Werkzeug"
 CLEANBROKEN = "1"
 
 PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests+= " \
+FILES:${PN}-tests+= " \
     ${PYTHON_SITEPACKAGES_DIR}/werkzeug/test* \
     ${PYTHON_SITEPACKAGES_DIR}/werkzeug/__pycache__/test* \
     ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/test* \
     ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/__pycache__/test* \
 "
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-difflib \
     ${PYTHON_PN}-email \
@@ -43,7 +43,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-zlib \
 "
 
-RDEPENDS_${PN}-tests = " \
+RDEPENDS:${PN}-tests = " \
     ${PN} \
     ${PYTHON_PN}-unittest \
 "
diff --git a/recipes-devtools/python/python-which_1.1.0.bb b/recipes-devtools/python/python-which_1.1.0.bb
index b417d0f..df30fa1 100644
--- a/recipes-devtools/python/python-which_1.1.0.bb
+++ b/recipes-devtools/python/python-which_1.1.0.bb
@@ -11,7 +11,7 @@ PYPI_SRC_URI = "git://github.com/trentm/which"
 
 S = "${WORKDIR}/git"
 
-do_install_append() {
+do_install:append() {
     rmdir -p --ignore-fail-on-non-empty ${D}${STAGING_BINDIR_NATIVE}
     rmdir -p --ignore-fail-on-non-empty ${D}${datadir}
 }
diff --git a/recipes-devtools/python/python-whoosh_2.7.4.bb b/recipes-devtools/python/python-whoosh_2.7.4.bb
index ef0c078..151fa9e 100644
--- a/recipes-devtools/python/python-whoosh_2.7.4.bb
+++ b/recipes-devtools/python/python-whoosh_2.7.4.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b4537
 PYPI_PACKAGE = "Whoosh"
 PYPI_PACKAGE_EXT = "zip"
 
-RDEPENDS_${PN} += " \
+RDEPENDS:${PN} += " \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-multiprocessing \
     ${PYTHON_PN}-netclient \
diff --git a/recipes-devtools/python/python-wrapt_1.11.2.bb b/recipes-devtools/python/python-wrapt_1.11.2.bb
index 7a5cf4e..96e30da 100644
--- a/recipes-devtools/python/python-wrapt_1.11.2.bb
+++ b/recipes-devtools/python/python-wrapt_1.11.2.bb
@@ -28,7 +28,7 @@ inherit pypi setuptools
 
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
-RDEPENDS_${PN}_append_class-target = "\
+RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-threading \
 "
diff --git a/recipes-devtools/python/python-wtforms_2.2.1.bb b/recipes-devtools/python/python-wtforms_2.2.1.bb
index 1bae8ae..2af5eb6 100644
--- a/recipes-devtools/python/python-wtforms_2.2.1.bb
+++ b/recipes-devtools/python/python-wtforms_2.2.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a6930
 
 PYPI_PACKAGE = "WTForms"
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
     "
diff --git a/recipes-devtools/python/python-xlrd_1.2.0.bb b/recipes-devtools/python/python-xlrd_1.2.0.bb
index 9c67e52..b3ea14d 100644
--- a/recipes-devtools/python/python-xlrd_1.2.0.bb
+++ b/recipes-devtools/python/python-xlrd_1.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-devtools/python/python-yappi_1.0.bb b/recipes-devtools/python/python-yappi_1.0.bb
index cb80af0..11c1c20 100644
--- a/recipes-devtools/python/python-yappi_1.0.bb
+++ b/recipes-devtools/python/python-yappi_1.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-threading \
diff --git a/recipes-devtools/python/python-zipp_0.6.0.bb b/recipes-devtools/python/python-zipp_0.6.0.bb
index 0ef2caa..8009ee4 100644
--- a/recipes-devtools/python/python-zipp_0.6.0.bb
+++ b/recipes-devtools/python/python-zipp_0.6.0.bb
@@ -7,7 +7,7 @@ SRC_URI[md5sum] = "d4451a749d8a7c3c392a9edd1864a937"
 SRC_URI[sha256sum] = "3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f9bcd8e"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
+RDEPENDS:${PN} += "${PYTHON_PN}-more-itertools"
 
 inherit pypi setuptools
 
diff --git a/recipes-devtools/python/python-zopeinterface_4.7.1.bb b/recipes-devtools/python/python-zopeinterface_4.7.1.bb
index 99c9213..4eefbd6 100644
--- a/recipes-devtools/python/python-zopeinterface_4.7.1.bb
+++ b/recipes-devtools/python/python-zopeinterface_4.7.1.bb
@@ -9,19 +9,19 @@ PYPI_PACKAGE = "zope.interface"
 
 PACKAGES =. "${PN}-test "
 
-RPROVIDES_${PN} += "zope-interfaces"
+RPROVIDES:${PN} += "zope-interfaces"
 
-RDEPENDS_${PN}_class-target += "${PYTHON_PN}-datetime"
+RDEPENDS:${PN}:class-target += "${PYTHON_PN}-datetime"
 
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
-FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
-FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
-FILES_${PN}-test += " \
+FILES:${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
+FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
+FILES:${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
+FILES:${PN}-test += " \
         ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
         ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
 "
 inherit pypi setuptools
 
-RDEPENDS_${PN}-test += "python-unittest python-doctest"
+RDEPENDS:${PN}-test += "python-unittest python-doctest"
 
 PNBLACKLIST[python-zopeinterface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/python.inc
index dc5807a..7325f8c 100644
--- a/recipes-devtools/python/python.inc
+++ b/recipes-devtools/python/python.inc
@@ -47,13 +47,13 @@ EXTRA_OECONF = "\
   ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no \
 "
 
-do_configure_prepend() {
+do_configure:prepend() {
 	libdirleaf="$(echo ${libdir} | sed -e 's:${prefix}/::')"
 	sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
 		${S}/configure.ac
 }
 
-do_install_append () {
+do_install:append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
 		-e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
 		${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
index 7350562..898e7b9 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -4,7 +4,7 @@ DEPENDS = "libffi bzip2 gdbm openssl \
            readline sqlite3 zlib virtual/crypt"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
-DISTRO_SRC_URI_linuxstdbase = ""
+DISTRO_SRC_URI:linuxstdbase = ""
 SRC_URI += " \
            file://01-use-proper-tools-for-cross-build.patch \
            file://03-fix-tkinter-detection.patch \
@@ -54,7 +54,7 @@ EXTRA_OEMAKE = "PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
                 STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
                 "
 
-do_configure_append() {
+do_configure:append() {
 	rm -f ${S}/Makefile.orig
         autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
@@ -125,7 +125,7 @@ do_install() {
     mv ${D}/${bindir}/2to3 ${D}/${bindir}/2to3-${PYTHON_MAJMIN}
 }
 
-do_install_append_class-nativesdk () {
+do_install:append:class-nativesdk () {
 	create_wrapper ${D}${bindir}/python2.7 PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
@@ -148,33 +148,33 @@ py_package_preprocess () {
 	(cd ${PKGD}; python -m py_compile ./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py)
 }
 
-PACKAGES_remove = "${PN}"
+PACKAGES:remove = "${PN}"
 
 # manual dependency additions
-RPROVIDES_${PN}-modules = "${PN}"
-RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
-RRECOMMENDS_${PN}-crypt = "${MLPREFIX}openssl"
+RPROVIDES:${PN}-modules = "${PN}"
+RRECOMMENDS:${PN}-core:append:class-nativesdk = " nativesdk-python-modules"
+RRECOMMENDS:${PN}-crypt = "${MLPREFIX}openssl"
 
 # package libpython2
 PACKAGES =+ "lib${BPN}2"
-FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
+FILES:lib${BPN}2 = "${libdir}/libpython*.so.*"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
-RDEPENDS_${PN}-modules += "${PN}-misc"
+FILES:${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
+RDEPENDS:${PN}-modules += "${PN}-misc"
 
 # ptest
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils sed"
-RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests unzip tzdata-europe coreutils sed"
+RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 # catch manpage
 PACKAGES += "${PN}-man"
-FILES_${PN}-man = "${datadir}/man"
+FILES:${PN}-man = "${datadir}/man"
 
 # Nasty but if bdb isn't enabled the package won't be generated
-RDEPENDS_${PN}-modules_remove = "${@bb.utils.contains('PACKAGECONFIG', 'bdb', '', '${PN}-bsddb', d)}"
+RDEPENDS:${PN}-modules:remove = "${@bb.utils.contains('PACKAGECONFIG', 'bdb', '', '${PN}-bsddb', d)}"
 
-RDEPENDS_${PN}-dev = ""
+RDEPENDS:${PN}-dev = ""
 
 BBCLASSEXTEND = "nativesdk"
 
@@ -214,24 +214,24 @@ python(){
             newpackages.append(pypackage)
 
         # "Build" python's manifest FILES, RDEPENDS and SUMMARY
-        d.setVar('FILES_' + pypackage, '')
+        d.setVar('FILES:' + pypackage, '')
         for value in python_manifest[key]['files']:
-            d.appendVar('FILES_' + pypackage, ' ' + value)
+            d.appendVar('FILES:' + pypackage, ' ' + value)
             if include_pycs == '1':
                 if value.endswith('.py'):
-                    d.appendVar('FILES_' + pypackage, ' ' + value + '?')
+                    d.appendVar('FILES:' + pypackage, ' ' + value + '?')
 
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
             if '${PN}' in value:
                 value=value.split('-')[1]
-            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
-        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
+            d.appendVar('RDEPENDS:' + pypackage, ' ' + pn + '-' + value)
+        d.setVar('SUMMARY:' + pypackage, python_manifest[key]['summary'])
 
     # Prepending so to avoid python-misc getting everything
     packages = newpackages + packages
     d.setVar('PACKAGES', ' '.join(packages))
-    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
+    d.setVar('ALLOW_EMPTY:${PN}-modules', '1')
 }
 
 # Files needed to create a new manifest
diff --git a/recipes-extended/python-cson/python-cson_git.bb b/recipes-extended/python-cson/python-cson_git.bb
index 7bc86c0..185df0a 100644
--- a/recipes-extended/python-cson/python-cson_git.bb
+++ b/recipes-extended/python-cson/python-cson_git.bb
@@ -12,8 +12,8 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN}_class-native = ""
-DEPENDS_append_class-native = " python-native "
+RDEPENDS:${PN}:class-native = ""
+DEPENDS:append:class-native = " python-native "
 
 inherit setuptools
 
diff --git a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
index 535c6da..7e0945c 100644
--- a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
+++ b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "ephem"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-math \
     "
diff --git a/recipes-extended/python-pyparted/python-pyparted_git.bb b/recipes-extended/python-pyparted/python-pyparted_git.bb
index 485bf5c..76981be 100644
--- a/recipes-extended/python-pyparted/python-pyparted_git.bb
+++ b/recipes-extended/python-pyparted/python-pyparted_git.bb
@@ -22,15 +22,15 @@ DEPENDS += "parted"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN}_class-target += " \
+RDEPENDS:${PN}:class-target += " \
     parted (>= 2.3) \
 "
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN}:class-native = ""
 
 inherit distutils
 
-RDEPENDS_${PN} += "python-stringold python-codecs python-math python-subprocess"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS:${PN} += "python-stringold python-codecs python-math python-subprocess"
+RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
diff --git a/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
index eee8416..6661ac5 100644
--- a/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
@@ -34,13 +34,13 @@ DEPENDS += " \
 "
 
 
-do_install_append() {
+do_install:append() {
     mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
 
     rm -f ${D}${bindir}/*.bat
 }
 
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
@@ -58,7 +58,7 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-xml \
 "
 
-ALTERNATIVE_${PN} = "mof_compiler pywbemcli wbemcli"
+ALTERNATIVE:${PN} = "mof_compiler pywbemcli wbemcli"
 ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
 ALTERNATIVE_TARGET[pywbemcli] = "${bindir}/pywbemcli"
 ALTERNATIVE_TARGET[wbemcli] = "${bindir}/wbemcli"
diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
index 05a4625..0954eb8 100644
--- a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
+++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -32,7 +32,7 @@ do_install () {
     install -m 0644 packaging/fedora/dnssec.sysconfig ${D}${sysconfdir}/sysconfig/dnssec
 }
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     bind-utils \
     curl \
     python \
-- 
2.30.2

