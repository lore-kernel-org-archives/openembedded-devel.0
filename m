Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7EA7F867
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 20:17:57 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j42so780751wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 12:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3MnSb3DS8thzbCARx6mXQXnV7JrJydtIVVSuPIMpnEA=;
	b=U35gc/2CsQiV2SYyCWGn/Ce4+1+b2aHBgmCxrEoyobswmK2Jh9XyLVYOg/Gfr0+kef
	qOtiTBiAhDJ6jiJyJiCb6Znlby/V2GaoDC4Z1np4J5WzawqxsRvxKH7Aab6CH4o3h87F
	8CDl3isxwAfW+9uk4AZOHqybP80VbW3EK+exVr1spVzPP9JmvCbsS9T/JKR6dROMOhET
	algpYY1lgqsfkanVqwVLmIYgvzeQBPMbw+hzxT4rNnxkyBcjbc92P49oRj2NwPs84AQg
	H7IbqieXos+8Rnf3zK5kHvNDBXt7wsHT7uto8LqshgEGGz4fw4jYPTVOm24RtS/RoUzS
	P4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3MnSb3DS8thzbCARx6mXQXnV7JrJydtIVVSuPIMpnEA=;
	b=Q90uHjeXZxjuBS3ZWL0Bn8qYy3//kmmv4Q6YcZK6gl41V9IQuqk+yIcApe7Wobo6xD
	wmvglSt9l6LnZSsFhAThsUsmnYw9465OOz2Q/ME25PduysMf2bq+hiGmnTiQxuN24/dQ
	TsYdPrYe78PyGG+xbry/dOGbjrNN22oYD83uNVYkTD2/mXWmAbUk+wBfQWK6obIEuPD2
	TkhSIPm4+tBt+z0u5Ch/LcojfLSgEJDm2Ol6EW+UrwWlczV0nYum42+mO7w+XyV8qYPe
	k1zu7zk2bktESgieH+9wMZjX1PKO7hLdyMBRf7Yx9ZiWiS6iyI+OXv5vmn7H0hgKYJM5
	7TsA==
X-Gm-Message-State: APjAAAXGUfmZoltJj8c3DhWi0VcgYyGErfr3fsT9toPu3wm6JLggYG8q
	o2ncb8CjzwS6cFPi9Chvv/kOpZSyiyA=
X-Google-Smtp-Source: APXvYqw86JB+xFvStV9rOH4as3ItPVaAn5h+6n18gbaF6u3uoC/Fo9nYXxrPqH4rhIVwEeuu3TFxGQ==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr1168132wrr.138.1579551477044; 
	Mon, 20 Jan 2020 12:17:57 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	d8sm50174339wre.13.2020.01.20.12.17.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 12:17:56 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 20:17:47 +0000
Message-Id: <20200120201750.29842-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH 0/3]: remove python2 recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jan 2020 20:17:57 -0000

Clean-up [meta-python] from all reference to python2 and replace
inherited classes pointing to python3 in all recipes.

Andrey Zhizhikin (3):
  meta-python: remove python2 recipes from layer
  meta-python: rename python2 recipes to python3 eqiuvalent
  meta-python: update recipes to use python3 classes

 .../gateone/gateone_git.bb                    |  2 +-
 .../python-gsocketpool_0.1.6.bb               |  2 -
 .../python-h2/python-h2_3.1.1.bb              |  3 --
 .../python-hpack/python-hpack_3.0.0.bb        |  3 --
 .../python-hyperframe_5.2.0.bb                |  3 --
 .../python-mprpc/python-mprpc_0.1.17.bb       |  2 -
 .../python-priority/python-priority_1.3.0.bb  |  3 --
 .../python-pyconnman_0.2.0.bb                 |  5 --
 ...on-pyro4_4.77.bb => python3-pyro4_4.77.bb} |  2 +-
 .../python-pytun/python-pytun_2.3.0.bb        |  2 -
 ...ift_0.13.0.bb => python3-thrift_0.13.0.bb} |  2 +-
 ...on-txws_0.9.1.bb => python3-txws_0.9.1.bb} |  2 +-
 .../telepathy/telepathy-python_0.15.19.bb     |  2 +-
 .../recipes-devtools/gyp/gyp-py2_git.bb       |  2 -
 .../python-jsonref/python-jsonref.inc         |  2 +-
 ...-jsonref_0.2.bb => python3-jsonref_0.2.bb} |  0
 .../recipes-devtools/python/pamela_0.3.0.bb   |  2 +-
 .../recipes-devtools/python/pyrtm_0.4.2.bb    |  2 +-
 .../python/python-alembic_1.3.2.bb            |  2 -
 .../python/python-anyjson_0.3.3.bb            |  2 -
 .../python/python-appdirs_1.4.3.bb            |  2 -
 .../python/python-asn1crypto_1.3.0.bb         |  7 ---
 .../python/python-astroid_2.3.3.bb            | 10 ----
 .../python/python-atomicwrites_1.3.0.bb       |  2 -
 .../python/python-attr_0.3.1.bb               |  2 -
 .../python/python-attrs_19.3.0.bb             |  6 ---
 .../python/python-automat_0.8.0.bb            |  2 -
 .../python-aws-iot-device-sdk-python_1.4.7.bb |  4 --
 .../python/python-babel_2.7.0.bb              |  6 ---
 .../python/python-backports-abc_0.5.bb        | 11 ----
 ...ython-backports-functools-lru-cache_1.5.bb |  2 -
 .../python/python-backports-ssl_3.7.0.1.bb    | 18 -------
 .../python/python-bcrypt_3.1.7.bb             |  6 ---
 .../python/python-beautifulsoup4_4.8.2.bb     |  2 -
 .../python/python-behave_1.2.6.bb             |  8 ---
 .../python/python-bitarray_1.2.1.bb           |  2 -
 .../python/python-blinker_1.4.bb              |  2 -
 .../python/python-cachetools_4.0.0.bb         |  2 -
 .../python/python-can_3.3.2.bb                |  8 ---
 .../python/python-certifi_2019.11.28.bb       |  2 -
 .../python/python-cffi_1.13.2.bb              |  6 ---
 .../python/python-chardet_3.0.4.bb            |  4 --
 .../python/python-cheetah_2.4.4.bb            | 16 ------
 .../python/python-click_7.0.bb                |  4 --
 .../python/python-cmd2_0.9.23.bb              | 14 -----
 .../python/python-coloredlogs_10.0.bb         |  2 -
 .../python/python-configargparse_0.15.1.bb    |  3 --
 .../python/python-configparser_3.8.1.bb       |  3 --
 .../python/python-constantly_15.1.0.bb        |  2 -
 .../python/python-contextlib2_0.6.0.bb        |  3 --
 .../python/python-crcmod_1.7.bb               |  2 -
 .../python/python-cryptography-vectors_2.8.bb |  2 -
 .../python/python-cryptography_2.8.bb         | 22 --------
 .../python/python-cython_0.29.14.bb           | 10 ----
 .../python/python-daemon_2.1.2.bb             | 27 ----------
 .../python/python-daemonize_2.5.0.bb          | 16 ------
 .../python/python-dateutil_2.8.1.bb           |  2 -
 .../python/python-dbus_1.2.14.bb              | 32 ------------
 .../python/python-dbusmock_0.16.7.bb          | 25 ---------
 .../python/python-decorator_4.4.1.bb          |  4 --
 .../python/python-django-south_1.0.2.bb       |  2 -
 .../python/python-django_1.11.14.bb           | 11 ----
 .../python-djangorestframework_3.9.0.bb       |  2 -
 .../python/python-dnspython_1.16.0.bb         |  2 -
 .../python/python-docutils_0.15.2.bb          | 15 ------
 .../python/python-dominate_2.4.0.bb           |  2 -
 .../python/python-editor_1.0.4.bb             |  2 -
 .../python/python-engineio_3.11.2.bb          |  2 -
 .../python/python-enum34_1.1.6.bb             | 11 ----
 .../python/python-epydoc_3.0.1.bb             | 19 -------
 .../python/python-evdev_1.2.0.bb              |  2 -
 .../python/python-feedformatter_0.4.bb        |  2 -
 .../python/python-feedparser_5.2.1.bb         | 17 -------
 .../python/python-flask-babel_0.12.2.bb       |  2 -
 .../python/python-flask-bcrypt_0.7.1.bb       | 12 -----
 .../python/python-flask-bootstrap_3.3.7.1.bb  |  2 -
 .../python/python-flask-login_0.4.1.bb        |  2 -
 .../python/python-flask-mail_0.9.1.bb         |  2 -
 .../python/python-flask-migrate_2.5.2.bb      |  2 -
 .../python/python-flask-nav_0.6.bb            |  2 -
 .../python/python-flask-navigation_0.2.0.bb   | 15 ------
 .../python/python-flask-pymongo_2.3.0.bb      |  2 -
 .../python/python-flask-restful_0.3.7.bb      |  2 -
 .../python/python-flask-script_2.0.6.bb       |  2 -
 .../python/python-flask-sijax_0.4.1.bb        |  4 --
 .../python/python-flask-socketio_4.2.1.bb     |  2 -
 .../python/python-flask-sqlalchemy_2.4.1.bb   |  2 -
 .../python/python-flask-uploads_0.2.1.bb      |  2 -
 .../python/python-flask-user_0.6.19.bb        |  2 -
 .../python/python-flask-wtf_0.14.2.bb         |  2 -
 .../python/python-flask-xstatic_0.0.1.bb      |  2 -
 .../python/python-flask_1.1.1.bb              |  2 -
 .../python/python-funcsigs_1.0.2.bb           | 18 -------
 .../python/python-functools32_3.2.3-2.bb      | 10 ----
 .../python/python-future_0.18.2.bb            |  2 -
 .../python/python-gdata_2.0.18.bb             | 21 --------
 .../python/python-gevent_1.4.0.bb             |  4 --
 .../python/python-greenlet_0.4.15.bb          |  2 -
 .../python/python-grpcio-tools_1.14.1.bb      |  2 -
 .../python/python-grpcio_1.19.0.bb            |  6 ---
 .../python/python-html5lib_1.0.1.bb           |  2 -
 .../python/python-humanfriendly_4.18.bb       |  2 -
 .../python/python-humanize_0.5.1.bb           |  2 -
 .../python/python-hyperlink_19.0.0.bb         |  2 -
 .../python/python-idna_2.8.bb                 |  2 -
 .../python/python-imaging_1.1.7.bb            | 48 -----------------
 .../python/python-importlib-metadata_0.23.bb  |  7 ---
 .../python/python-incremental_17.5.0.bb       |  2 -
 .../python/python-inflection_0.3.1.bb         |  4 --
 .../python/python-intervals_1.10.0.bb         |  2 -
 .../python/python-ipaddress_1.0.23.bb         |  2 -
 .../python/python-ipy_1.00.bb                 |  2 -
 .../python/python-iso8601_0.1.12.bb           |  2 -
 .../python/python-isodate_0.6.0.bb            |  2 -
 .../python/python-isort_4.3.21.bb             |  2 -
 .../python/python-itsdangerous_1.1.0.bb       |  6 ---
 .../python/python-javaobj-py3_0.4.0.1.bb      |  2 -
 .../python/python-jinja2_2.10.3.bb            |  8 ---
 .../python/python-jsonpatch_1.24.bb           |  4 --
 .../python/python-jsonpointer_2.0.bb          |  4 --
 .../python/python-jsonschema_3.2.0.bb         | 12 -----
 .../python/python-lazy-object-proxy_1.4.3.bb  |  2 -
 .../python/python-linecache2_1.0.0.bb         | 13 -----
 .../python/python-lockfile_0.12.2.bb          | 19 -------
 .../python/python-lrparsing_1.0.16.bb         |  2 -
 .../python/python-lxml_4.4.2.bb               |  2 -
 .../python/python-m2crypto_0.30.1.bb          |  2 -
 .../python/python-mako_1.1.0.bb               |  2 -
 .../python/python-markupsafe_1.1.1.bb         |  6 ---
 .../python/python-mccabe_0.4.0.bb             | 20 --------
 .../python/python-mock_3.0.5.bb               | 22 --------
 .../python/python-monotonic_1.5.bb            | 10 ----
 .../python/python-more-itertools_5.0.0.bb     |  7 ---
 .../python/python-msgpack_0.6.2.bb            |  2 -
 .../python/python-ndg-httpsclient_0.5.1.bb    |  6 ---
 .../python/python-netaddr_0.7.19.bb           |  6 ---
 .../python/python-netifaces_0.10.9.bb         |  2 -
 .../python/python-networkx_2.2.bb             |  8 ---
 .../python/python-numeric_24.2.bb             | 16 ------
 .../python/python-packaging_20.0.bb           |  2 -
 .../python/python-paho-mqtt_1.5.0.bb          |  6 ---
 .../python/python-pam_1.8.2.bb                | 15 ------
 .../python/python-parse-type_0.4.2.bb         |  2 -
 .../python/python-parse_1.14.0.bb             |  2 -
 .../python/python-passlib_1.7.2.bb            |  2 -
 .../python/python-paste_3.2.3.bb              | 17 -------
 .../python/python-pathlib2_2.3.5.bb           |  6 ---
 .../python/python-pbr_5.4.4.bb                | 13 -----
 .../python/python-pep8_1.7.1.bb               | 16 ------
 .../python/python-periphery_2.0.1.bb          |  5 --
 .../python/python-pexpect_4.7.0.bb            |  2 -
 .../python/python-pika_1.1.0.bb               |  2 -
 .../python/python-pint_0.9.bb                 |  2 -
 .../python/python-pip_19.3.1.bb               | 14 -----
 .../python/python-pluggy_0.13.1.bb            |  2 -
 .../python/python-ply_3.11.bb                 |  2 -
 .../python/python-pretend_1.0.9.bb            |  2 -
 .../python/python-prettytable_0.7.2.bb        |  3 --
 .../python/python-progress_1.5.bb             |  2 -
 .../python/python-prompt-toolkit_2.0.10.bb    |  6 ---
 .../python/python-protobuf_3.9.2.bb           |  2 -
 .../python/python-psutil_5.6.7.bb             |  6 ---
 .../python/python-ptyprocess_0.6.0.bb         |  2 -
 .../python/python-py_1.8.1.bb                 |  2 -
 .../python/python-pyalsaaudio_0.8.4.bb        |  2 -
 .../python/python-pyasn1-modules_0.2.7.bb     |  2 -
 .../python/python-pyasn1_0.4.8.bb             |  6 ---
 .../python/python-pybind11_2.4.3.bb           |  2 -
 .../python/python-pybluez_0.22.bb             |  2 -
 .../python/python-pycodestyle_2.5.0.bb        | 10 ----
 .../python/python-pycparser_2.19.bb           |  6 ---
 .../python/python-pycrypto_2.6.1.bb           |  9 ----
 .../python/python-pycryptodome_3.9.4.bb       |  2 -
 .../python/python-pycurl_7.43.0.3.bb          |  2 -
 .../python/python-pydbus_0.6.0.bb             |  2 -
 .../python/python-pyelftools_0.25.bb          |  2 -
 .../python/python-pyexpect_1.0.19.bb          |  2 -
 .../python/python-pyfirmata_1.1.0.bb          |  3 --
 .../python/python-pyflakes_2.1.1.bb           | 16 ------
 .../python/python-pyflame_1.6.7.bb            |  4 --
 .../python/python-pygpgme_0.3.bb              | 26 ----------
 .../python/python-pyhamcrest_1.9.0.bb         | 10 ----
 .../python/python-pyiface_0.0.11.bb           |  2 -
 .../python/python-pyinotify_0.9.6.bb          |  6 ---
 .../python/python-pyjks_19.0.0.bb             |  2 -
 .../python/python-pyjwt_1.7.1.bb              |  2 -
 .../python/python-pylint_1.8.3.bb             |  4 --
 .../python/python-pymisp_2.4.119.1.bb         |  2 -
 .../python/python-pymongo_3.10.0.bb           |  2 -
 .../python/python-pymysql_0.9.3.bb            |  2 -
 .../python/python-pynetlinux_1.1.bb           |  2 -
 .../python/python-pyopenssl_19.1.0.bb         |  2 -
 .../python/python-pyparsing_2.4.6.bb          |  2 -
 .../python/python-pyperclip_1.7.0.bb          |  7 ---
 .../python/python-pyperf_1.7.0.bb             |  4 --
 .../python/python-pyrex-native_0.9.9.bb       |  5 --
 .../python/python-pyrex_0.9.9.bb              | 22 --------
 .../python/python-pyroute2_0.5.7.bb           |  6 ---
 .../python/python-pyrsistent_0.15.7.bb        |  2 -
 .../python/python-pyserial_3.4.bb             |  4 --
 .../python/python-pysmi_0.3.4.bb              | 16 ------
 .../python/python-pysnmp_4.4.9.bb             | 26 ----------
 .../python/python-pysocks_1.7.1.bb            |  2 -
 .../python/python-pysqlite_2.8.3.bb           |  2 -
 .../python/python-pystache_0.5.4.bb           |  2 -
 ...ython-pytest-helpers-namespace_2019.1.8.bb |  7 ---
 .../python/python-pytest-runner_5.2.bb        |  5 --
 .../python-pytest-tempdir_2019.10.12.bb       |  7 ---
 .../python/python-pytest_5.3.2.bb             |  9 ----
 .../python/python-pytz_2019.3.bb              |  2 -
 .../python/python-pyudev_0.21.0.bb            |  9 ----
 .../python/python-pyusb_1.0.2.bb              |  2 -
 .../python/python-pyyaml_5.2.bb               |  2 -
 .../python/python-pyzmq_17.1.0.bb             |  2 -
 .../python/python-rdflib_4.2.2.bb             |  2 -
 .../python/python-redis_2.10.6.bb             |  2 -
 .../python/python-requests-oauthlib_1.3.0.bb  |  3 --
 .../python/python-requests_2.22.0.bb          |  4 --
 .../python/python-rfc3339-validator_0.1.1.bb  |  2 -
 .../python/python-rfc3986-validator_0.1.1.bb  |  2 -
 .../python/python-rfc3987_1.3.8.bb            |  2 -
 ...thon-robotframework-seriallibrary_0.3.1.bb |  2 -
 .../python/python-robotframework_3.0.4.bb     |  6 ---
 .../python/python-scandir_1.10.0.bb           | 14 -----
 .../python/python-scrypt_0.8.6.bb             |  3 --
 .../python/python-sdnotify_0.3.2.bb           |  2 -
 .../python/python-selectors34_1.2.bb          | 12 -----
 .../python/python-semver_2.8.1.bb             |  2 -
 .../python/python-serpent_1.28.bb             |  2 -
 .../python/python-setuptools-scm_3.3.3.bb     |  4 --
 .../python/python-sh_1.12.14.bb               |  8 ---
 .../python/python-sijax_0.3.2.bb              | 11 ----
 .../python/python-simplejson_3.17.0.bb        |  4 --
 .../python/python-singledispatch_3.4.0.3.bb   | 12 -----
 .../python/python-slip-dbus_0.6.5.bb          |  2 -
 .../python/python-smbus_4.1.bb                |  2 -
 .../python/python-snakefood_1.4.bb            | 51 -------------------
 .../python/python-snimpy_0.8.13.bb            | 20 --------
 .../python/python-socketio_4.3.1.bb           |  2 -
 .../python/python-soupsieve_1.9.4.bb          |  4 --
 .../python/python-sparts_0.7.3.bb             | 22 --------
 .../python/python-speaklater_1.3.bb           |  2 -
 .../python/python-sqlalchemy_1.3.12.bb        |  2 -
 .../python/python-sqlparse_0.3.0.bb           |  2 -
 .../python/python-statistics_1.0.3.5.bb       | 15 ------
 .../python/python-stevedore_1.31.0.bb         |  2 -
 .../python/python-strict-rfc3339_0.7.bb       |  2 -
 .../python/python-subprocess32_3.2.7.bb       | 15 ------
 .../python/python-systemd_234.bb              |  2 -
 .../python/python-toml_0.10.0.bb              |  6 ---
 .../python/python-tornado-redis_2.4.18.bb     | 18 -------
 .../python/python-tornado_6.0.3.bb            |  8 ---
 .../python/python-tqdm_4.41.1.bb              |  2 -
 .../python/python-traceback2_1.4.0.bb         | 15 ------
 .../python/python-twisted_19.10.0.bb          |  8 ---
 .../python/python-twitter_3.8.0.bb            |  3 --
 .../python/python-twofish_0.3.0.bb            |  2 -
 .../python/python-typing_3.7.4.1.bb           |  2 -
 .../python/python-tzlocal_2.0.0.bb            |  2 -
 .../python/python-ujson_1.35.bb               |  2 -
 .../python/python-unidiff_0.5.5.bb            |  2 -
 .../python/python-urllib3_1.25.7.bb           |  2 -
 .../python/python-vcversioner_2.16.0.0.bb     | 17 -------
 .../python/python-versiontools_1.9.1.bb       |  2 -
 .../python/python-visitor_0.1.3.bb            |  2 -
 .../python/python-vobject_0.9.6.1.bb          | 15 ------
 .../python/python-waitress_1.4.2.bb           |  2 -
 .../python/python-wcwidth_0.1.8.bb            |  2 -
 .../python/python-webcolors_1.8.1.bb          |  2 -
 .../python/python-webdav_0.1.2.bb             | 19 -------
 .../python/python-webencodings_0.5.1.bb       |  2 -
 .../python/python-werkzeug_0.16.0.bb          |  7 ---
 .../python/python-whoosh_2.7.4.bb             |  6 ---
 .../python/python-wrapt_1.11.2.bb             |  2 -
 .../python/python-wtforms_2.2.1.bb            |  2 -
 .../python/python-xlrd_1.2.0.bb               |  2 -
 .../python-xstatic-font-awesome_4.7.0.0.bb    |  2 -
 .../python/python-xstatic_1.0.2.bb            |  2 -
 .../recipes-devtools/python/python-yappi.inc  |  2 +-
 .../python/python-yappi_1.0.bb                |  2 -
 .../python/python-zipp_0.6.0.bb               |  2 -
 .../python/python-zopeinterface_4.7.1.bb      |  4 --
 ...hon3-robotframework-seriallibrary_0.3.1.bb |  2 +-
 ...python-cson_git.bb => python3-cson_git.bb} |  2 +-
 ..._3.7.7.0.bb => python3-pyephem_3.7.7.0.bb} |  2 +-
 .../python-pyparted/python-pyparted_3.11.3.bb |  8 ---
 .../pywbem/python-pywbem_0.15.0.bb            | 20 --------
 287 files changed, 12 insertions(+), 1679 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
 delete mode 100644 meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
 delete mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
 delete mode 100644 meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.77.bb => python3-pyro4_4.77.bb} (94%)
 delete mode 100644 meta-python/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
 rename meta-python/recipes-connectivity/python-thrift/{python-thrift_0.13.0.bb => python3-thrift_0.13.0.bb} (95%)
 rename meta-python/recipes-connectivity/python-txws/{python-txws_0.9.1.bb => python3-txws_0.9.1.bb} (95%)
 delete mode 100644 meta-python/recipes-devtools/gyp/gyp-py2_git.bb
 rename meta-python/recipes-devtools/python-jsonref/{python-jsonref_0.2.bb => python3-jsonref_0.2.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python-alembic_1.3.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-asn1crypto_1.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-astroid_2.3.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-attr_0.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-attrs_19.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-automat_0.8.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-babel_2.7.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-backports-abc_0.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-bcrypt_3.1.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-behave_1.2.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-bitarray_1.2.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-blinker_1.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-cachetools_4.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-can_3.3.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-certifi_2019.11.28.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-cffi_1.13.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-click_7.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-cmd2_0.9.23.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-configparser_3.8.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-crcmod_1.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography-vectors_2.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography_2.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-cython_0.29.14.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-daemonize_2.5.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-dateutil_2.8.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-dbus_1.2.14.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-decorator_4.4.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-django_1.11.14.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-dnspython_1.16.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-docutils_0.15.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-dominate_2.4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-editor_1.0.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-engineio_3.11.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-evdev_1.2.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-feedformatter_0.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-babel_0.12.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-login_0.4.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-migrate_2.5.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-restful_0.3.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-socketio_4.2.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-wtf_0.14.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-flask_1.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-future_0.18.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-gdata_2.0.18.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent_1.4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-grpcio_1.19.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-html5lib_1.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-humanize_0.5.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-hyperlink_19.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-idna_2.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-inflection_0.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-intervals_1.10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ipy_1.00.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-iso8601_0.1.12.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-isodate_0.6.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-isort_4.3.21.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-itsdangerous_1.1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-jinja2_2.10.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpointer_2.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-lxml_4.4.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-mako_1.1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-markupsafe_1.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-mock_3.0.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-monotonic_1.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-msgpack_0.6.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-networkx_2.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-numeric_24.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-packaging_20.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pam_1.8.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-parse_1.14.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-passlib_1.7.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-paste_3.2.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pbr_5.4.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-periphery_2.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pexpect_4.7.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pika_1.1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pint_0.9.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pip_19.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pluggy_0.13.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ply_3.11.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pretend_1.0.9.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-progress_1.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-protobuf_3.9.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-psutil_5.6.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ptyprocess_0.6.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-py_1.8.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyasn1_0.4.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pybind11_2.4.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pybluez_0.22.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pycodestyle_2.5.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pycparser_2.19.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pydbus_0.6.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyelftools_0.25.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyexpect_1.0.19.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyfirmata_1.1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflakes_2.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyiface_0.0.11.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyjks_19.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyjwt_1.7.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pylint_1.8.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pymisp_2.4.119.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pymongo_3.10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyopenssl_19.1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyparsing_2.4.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyperclip_1.7.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyperf_1.7.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyroute2_0.5.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyrsistent_0.15.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyserial_3.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pysmi_0.3.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pysocks_1.7.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pystache_0.5.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest-runner_5.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest_5.3.2.bb
 delete mode 100755 meta-python/recipes-devtools/python/python-pytz_2019.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyusb_1.0.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyyaml_5.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-redis_2.10.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-requests_2.22.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3987_1.3.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-robotframework_3.0.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-scrypt_0.8.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-sdnotify_0.3.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-selectors34_1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-semver_2.8.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-serpent_1.28.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-sh_1.12.14.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-sijax_0.3.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-smbus_4.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-snakefood_1.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-snimpy_0.8.13.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-sparts_0.7.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-speaklater_1.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-stevedore_1.31.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-systemd_234.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-toml_0.10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-tornado_6.0.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-tqdm_4.41.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-twisted_19.10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-twitter_3.8.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-twofish_0.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-typing_3.7.4.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ujson_1.35.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-unidiff_0.5.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-urllib3_1.25.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-vobject_0.9.6.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-waitress_1.4.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-wcwidth_0.1.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-webcolors_1.8.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-werkzeug_0.16.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-wrapt_1.11.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-wtforms_2.2.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-xlrd_1.2.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-xstatic_1.0.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-yappi_1.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-zipp_0.6.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-zopeinterface_4.7.1.bb
 rename meta-python/recipes-extended/python-cson/{python-cson_git.bb => python3-cson_git.bb} (96%)
 rename meta-python/recipes-extended/python-pyephem/{python-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.0.bb} (94%)
 delete mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
 delete mode 100644 meta-python/recipes-extended/pywbem/python-pywbem_0.15.0.bb

-- 
2.17.1


