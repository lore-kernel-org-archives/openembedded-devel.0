Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9229B7FBE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:35:33 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n59so6248337pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VRWQD46YXyBOqtbXx6bqIUSQAm4aNYUAC2ggqDGGaU4=;
	b=jX7/dKX+Eu+vn0AX8R88P9wOm+M8iHeGRmOLwcPVpga03jLnd/FhC6k0TmkL3nI3LT
	Eo2a5YcwN4Jz5brsHEb7zSjnZq+19K2OMQw7jT6qhe9WVdv59P01+WRSpvYnFK5VYKsw
	YPMBgo4LOxpNdPnV+rb3Px/1Q0DC7NfVsug7cn8m2FnxqV187wlopVk4r1BCpcpjDHOG
	3X7/Es5uB0uyrhPFDV0lA9FJ+4rB8/wtwqR4elM5YUfzucx4RzjPLgiNY62/83oWLsh7
	whVymmKwELShGI8NGCqCjDwPXeSRBmD672qSslBa74hwFtCVtXTaVtTTIhEeuu/EFvQO
	DMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VRWQD46YXyBOqtbXx6bqIUSQAm4aNYUAC2ggqDGGaU4=;
	b=qWZBuahE2ghFgPuFsC+gDGozkikNe8SoYHZmZZuxtuvGTePEjmdvew2ije1z3hVLY0
	LmKUsKA8FiArTAnLSK4ghA/jEOEVFjQAxNXpI8/cqYGXBvpqp893wTasSLRuAt2Qo2y1
	DXVR+4o5eufIbYSfQAeZLHeF2/AqCugvhcUUf/wRRvuX+QWVUWygvsCEeTm5/7Q6gSBq
	cnQA3X2L2h2p9IKrqEG02jEogtjivNqrEYryBSJ7yg/3zqlz+vIZbjSJRrvlInSDZP4t
	Bq/Vyq9mxuPNGpN2FI7rp4slBOmJLrUQ4LRFOZ/eEBdte9xbeyc4L0+SUHX8G3cP0h81
	6R5Q==
X-Gm-Message-State: APjAAAXJVW9BfCOoThMATdnc2owbzBh8rLXn434qDdYZKjymX0rnyhIc
	25zzhBgIlaMWdJ4FIjLWomrIRMVVPog=
X-Google-Smtp-Source: APXvYqzpp1RBO5LF0WK3AlljwwAhesP5JoZBbOVW+PH9BfyhVFjiR5dmgXzu15zHa09Llzk5XgjMcg==
X-Received: by 2002:a17:90b:2289:: with SMTP id
	kx9mr20647818pjb.94.1579480531570; 
	Sun, 19 Jan 2020 16:35:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z11sm37881115pfk.96.2020.01.19.16.35.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 16:35:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 16:35:24 -0800
Message-Id: <20200120003527.1518697-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120003527.1518697-1-raj.khem@gmail.com>
References: <20200120003527.1518697-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] meta-python: Delete python2 recipes
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
X-List-Received-Date: Mon, 20 Jan 2020 00:35:33 -0000
Content-Transfer-Encoding: 8bit

They must be moved to meta-python2 if needed and aren't there already

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gateone/gateone/80oe.conf.in              | 24 ------
 .../gateone/gateone/gateone-avahi.service     | 10 ---
 .../gateone/gateone/gateone-init.in           | 47 ----------
 .../gateone/gateone/gateone.service.in        | 10 ---
 .../gateone/gateone_git.bb                    | 85 -------------------
 .../python-gsocketpool_0.1.6.bb               |  2 -
 .../python-h2/python-h2_3.1.1.bb              |  3 -
 .../python-hpack/python-hpack_3.0.0.bb        |  3 -
 .../python-hyperframe_5.2.0.bb                |  3 -
 .../python-mprpc/python-mprpc_0.1.17.bb       |  2 -
 .../python-priority/python-priority_1.3.0.bb  |  3 -
 .../python-pyconnman_0.2.0.bb                 |  5 --
 .../python-pyro4/python-pyro4_4.77.bb         | 18 ----
 .../python-pytun/python-pytun_2.3.0.bb        |  2 -
 .../python-thrift/python-thrift_0.13.0.bb     | 18 ----
 .../python-txws/python-txws_0.9.1.bb          | 15 ----
 .../telepathy/telepathy-python_0.15.19.bb     | 32 -------
 .../recipes-core/images/meta-python-image.bb  |  3 +-
 .../packagegroups/packagegroup-meta-python.bb | 76 -----------------
 .../recipes-devtools/gyp/gyp-py2_git.bb       |  2 -
 .../python-jsonref/python-jsonref.inc         |  2 +-
 .../python-jsonref/python-jsonref_0.2.bb      |  1 -
 .../recipes-devtools/python/pamela_0.3.0.bb   | 15 ----
 .../recipes-devtools/python/pyrtm_0.4.2.bb    | 36 --------
 .../python/python-alembic_1.3.2.bb            |  2 -
 .../python/python-anyjson_0.3.3.bb            |  2 -
 .../python/python-appdirs_1.4.3.bb            |  2 -
 .../python/python-asn1crypto_1.3.0.bb         |  7 --
 .../python/python-astroid_2.3.3.bb            | 10 ---
 .../python/python-atomicwrites_1.3.0.bb       |  2 -
 .../python/python-attr_0.3.1.bb               |  2 -
 .../python/python-attrs_19.3.0.bb             |  6 --
 .../python/python-automat_0.8.0.bb            |  2 -
 .../python-aws-iot-device-sdk-python_1.4.7.bb |  4 -
 .../python/python-babel_2.7.0.bb              |  6 --
 .../python/python-backports-abc_0.5.bb        | 11 ---
 ...ython-backports-functools-lru-cache_1.5.bb |  2 -
 .../python/python-backports-ssl_3.7.0.1.bb    | 18 ----
 .../python/python-bcrypt_3.1.7.bb             |  6 --
 .../python/python-beautifulsoup4_4.8.2.bb     |  2 -
 .../python/python-behave_1.2.6.bb             |  8 --
 .../python/python-bitarray_1.2.1.bb           |  2 -
 .../python/python-blinker_1.4.bb              |  2 -
 .../python/python-cachetools_4.0.0.bb         |  2 -
 .../python/python-can_3.3.2.bb                |  8 --
 .../python/python-certifi_2019.11.28.bb       |  2 -
 .../python/python-cffi_1.13.2.bb              |  6 --
 .../python/python-chardet_3.0.4.bb            |  4 -
 .../python/python-cheetah_2.4.4.bb            | 16 ----
 .../python/python-click_7.0.bb                |  4 -
 .../python/python-cmd2_0.9.23.bb              | 14 ---
 .../python/python-coloredlogs_10.0.bb         |  2 -
 .../python/python-configargparse_0.15.1.bb    |  3 -
 .../python/python-configparser_3.8.1.bb       |  3 -
 .../python/python-constantly_15.1.0.bb        |  2 -
 .../python/python-contextlib2_0.6.0.bb        |  3 -
 .../python/python-crcmod_1.7.bb               |  2 -
 .../python/python-cryptography-vectors_2.8.bb |  2 -
 .../python/python-cryptography_2.8.bb         | 22 -----
 .../python/python-cython_0.29.14.bb           | 10 ---
 .../python/python-daemon_2.1.2.bb             | 27 ------
 .../python/python-daemonize_2.5.0.bb          | 16 ----
 .../python/python-dateutil_2.8.1.bb           |  2 -
 .../python/python-dbus_1.2.14.bb              | 32 -------
 .../python/python-dbusmock_0.16.7.bb          | 25 ------
 .../python/python-decorator_4.4.1.bb          |  4 -
 .../python/python-django-south_1.0.2.bb       |  2 -
 .../python/python-django_1.11.14.bb           | 11 ---
 .../python-djangorestframework_3.9.0.bb       |  2 -
 .../python/python-dnspython_1.16.0.bb         |  2 -
 .../python/python-docutils_0.15.2.bb          | 15 ----
 .../python/python-dominate_2.4.0.bb           |  2 -
 .../python/python-editor_1.0.4.bb             |  2 -
 .../python/python-engineio_3.11.2.bb          |  2 -
 .../python/python-enum34_1.1.6.bb             | 11 ---
 .../python/python-epydoc_3.0.1.bb             | 19 -----
 .../python/python-evdev_1.2.0.bb              |  2 -
 .../python/python-feedformatter_0.4.bb        |  2 -
 .../python/python-feedparser_5.2.1.bb         | 17 ----
 .../python/python-flask-babel_0.12.2.bb       |  2 -
 .../python/python-flask-bcrypt_0.7.1.bb       | 12 ---
 .../python/python-flask-bootstrap_3.3.7.1.bb  |  2 -
 .../python/python-flask-login_0.4.1.bb        |  2 -
 .../python/python-flask-mail_0.9.1.bb         |  2 -
 .../python/python-flask-migrate_2.5.2.bb      |  2 -
 .../python/python-flask-nav_0.6.bb            |  2 -
 .../python/python-flask-navigation_0.2.0.bb   | 15 ----
 .../python/python-flask-pymongo_2.3.0.bb      |  2 -
 .../python/python-flask-restful_0.3.7.bb      |  2 -
 .../python/python-flask-script_2.0.6.bb       |  2 -
 .../python/python-flask-sijax_0.4.1.bb        |  4 -
 .../python/python-flask-socketio_4.2.1.bb     |  2 -
 .../python/python-flask-sqlalchemy_2.4.1.bb   |  2 -
 .../python/python-flask-uploads_0.2.1.bb      |  2 -
 .../python/python-flask-user_0.6.19.bb        |  2 -
 .../python/python-flask-wtf_0.14.2.bb         |  2 -
 .../python/python-flask-xstatic_0.0.1.bb      |  2 -
 .../python/python-flask_1.1.1.bb              |  2 -
 .../python/python-funcsigs_1.0.2.bb           | 18 ----
 .../python/python-functools32_3.2.3-2.bb      | 10 ---
 .../python/python-future_0.18.2.bb            |  2 -
 .../python/python-gdata_2.0.18.bb             | 21 -----
 .../python/python-gevent_1.4.0.bb             |  4 -
 .../python/python-greenlet_0.4.15.bb          |  2 -
 .../python/python-grpcio-tools_1.14.1.bb      |  2 -
 .../python/python-grpcio_1.19.0.bb            |  6 --
 .../python/python-html5lib_1.0.1.bb           |  2 -
 .../python/python-humanfriendly_4.18.bb       |  2 -
 .../python/python-humanize_0.5.1.bb           |  2 -
 .../python/python-hyperlink_19.0.0.bb         |  2 -
 .../python/python-idna_2.8.bb                 |  2 -
 .../python/python-imaging_1.1.7.bb            | 48 -----------
 .../python/python-importlib-metadata_0.23.bb  |  7 --
 .../python/python-incremental_17.5.0.bb       |  2 -
 .../python/python-inflection_0.3.1.bb         |  4 -
 .../python/python-intervals_1.10.0.bb         |  2 -
 .../python/python-ipaddress_1.0.23.bb         |  2 -
 .../python/python-ipy_1.00.bb                 |  2 -
 .../python/python-iso8601_0.1.12.bb           |  2 -
 .../python/python-isodate_0.6.0.bb            |  2 -
 .../python/python-isort_4.3.21.bb             |  2 -
 .../python/python-itsdangerous_1.1.0.bb       |  6 --
 .../python/python-javaobj-py3_0.4.0.1.bb      |  2 -
 .../python/python-jinja2_2.10.3.bb            |  8 --
 .../python/python-jsonpatch_1.24.bb           |  4 -
 .../python/python-jsonpointer_2.0.bb          |  4 -
 .../python/python-jsonschema_3.2.0.bb         | 12 ---
 .../python/python-lazy-object-proxy_1.4.3.bb  |  2 -
 .../python/python-linecache2_1.0.0.bb         | 13 ---
 .../python/python-lockfile_0.12.2.bb          | 19 -----
 .../python/python-lrparsing_1.0.16.bb         |  2 -
 .../python/python-lxml_4.4.2.bb               |  2 -
 .../python/python-m2crypto_0.30.1.bb          |  2 -
 .../python/python-mako_1.1.0.bb               |  2 -
 .../python/python-markupsafe_1.1.1.bb         |  6 --
 .../python/python-mccabe_0.4.0.bb             | 20 -----
 .../python/python-mock_3.0.5.bb               | 22 -----
 .../python/python-monotonic_1.5.bb            | 10 ---
 .../python/python-more-itertools_5.0.0.bb     |  7 --
 .../python/python-msgpack_0.6.2.bb            |  2 -
 .../python/python-ndg-httpsclient_0.5.1.bb    |  6 --
 .../python/python-netaddr_0.7.19.bb           |  6 --
 .../python/python-netifaces_0.10.9.bb         |  2 -
 .../python/python-networkx_2.2.bb             |  8 --
 .../python/python-numeric_24.2.bb             | 16 ----
 .../python/python-packaging_20.0.bb           |  2 -
 .../python/python-paho-mqtt_1.5.0.bb          |  6 --
 .../python/python-pam_1.8.2.bb                | 15 ----
 .../python/python-parse-type_0.4.2.bb         |  2 -
 .../python/python-parse_1.14.0.bb             |  2 -
 .../python/python-passlib_1.7.2.bb            |  2 -
 .../python/python-paste_3.2.3.bb              | 17 ----
 .../python/python-pathlib2_2.3.5.bb           |  6 --
 .../python/python-pbr_5.4.4.bb                | 13 ---
 .../python/python-pep8_1.7.1.bb               | 16 ----
 .../python/python-periphery_2.0.1.bb          |  5 --
 .../python/python-pexpect_4.7.0.bb            |  2 -
 .../python/python-pika_1.1.0.bb               |  2 -
 .../python/python-pint_0.9.bb                 |  2 -
 .../python/python-pip_19.3.1.bb               | 14 ---
 .../python/python-pluggy_0.13.1.bb            |  2 -
 .../python/python-ply_3.11.bb                 |  2 -
 .../python/python-pretend_1.0.9.bb            |  2 -
 .../python/python-prettytable_0.7.2.bb        |  3 -
 .../python/python-progress_1.5.bb             |  2 -
 .../python/python-prompt-toolkit_2.0.10.bb    |  6 --
 .../python/python-protobuf_3.9.2.bb           |  2 -
 .../python/python-psutil_5.6.7.bb             |  6 --
 .../python/python-ptyprocess_0.6.0.bb         |  2 -
 .../python/python-py_1.8.1.bb                 |  2 -
 .../python/python-pyalsaaudio_0.8.4.bb        |  2 -
 .../python/python-pyasn1-modules_0.2.7.bb     |  2 -
 .../python/python-pyasn1_0.4.8.bb             |  6 --
 .../python/python-pybind11_2.4.3.bb           |  2 -
 .../python/python-pybluez_0.22.bb             |  2 -
 .../python/python-pycodestyle_2.5.0.bb        | 10 ---
 .../python/python-pycparser_2.19.bb           |  6 --
 .../python/python-pycrypto_2.6.1.bb           |  9 --
 .../python/python-pycryptodome_3.9.4.bb       |  2 -
 .../python/python-pycurl_7.43.0.3.bb          |  2 -
 .../python/python-pydbus_0.6.0.bb             |  2 -
 .../python/python-pyelftools_0.25.bb          |  2 -
 .../python/python-pyexpect_1.0.19.bb          |  2 -
 .../python/python-pyfirmata_1.1.0.bb          |  3 -
 .../python/python-pyflakes_2.1.1.bb           | 16 ----
 .../python/python-pyflame_1.6.7.bb            |  4 -
 .../python/python-pygpgme_0.3.bb              | 26 ------
 .../python/python-pyhamcrest_1.9.0.bb         | 10 ---
 .../python/python-pyiface_0.0.11.bb           |  2 -
 .../python/python-pyinotify_0.9.6.bb          |  6 --
 .../python/python-pyjks_19.0.0.bb             |  2 -
 .../python/python-pyjwt_1.7.1.bb              |  2 -
 .../python/python-pylint_1.8.3.bb             |  4 -
 .../python/python-pymisp_2.4.119.1.bb         |  2 -
 .../python/python-pymongo_3.10.1.bb           |  2 -
 .../python/python-pymysql_0.9.3.bb            |  2 -
 .../python/python-pynetlinux_1.1.bb           |  2 -
 .../python/python-pyopenssl_19.1.0.bb         |  2 -
 .../python/python-pyparsing_2.4.6.bb          |  2 -
 .../python/python-pyperclip_1.7.0.bb          |  7 --
 .../python/python-pyperf_1.7.0.bb             |  4 -
 .../python/python-pyrex-native_0.9.9.bb       |  5 --
 .../python/python-pyrex_0.9.9.bb              | 22 -----
 .../python/python-pyroute2_0.5.7.bb           |  6 --
 .../python/python-pyrsistent_0.15.7.bb        |  2 -
 .../python/python-pyserial_3.4.bb             |  4 -
 .../python/python-pysmi_0.3.4.bb              | 16 ----
 .../python/python-pysnmp_4.4.9.bb             | 26 ------
 .../python/python-pysocks_1.7.1.bb            |  2 -
 .../python/python-pysqlite_2.8.3.bb           |  2 -
 .../python/python-pystache_0.5.4.bb           |  2 -
 ...ython-pytest-helpers-namespace_2019.1.8.bb |  7 --
 .../python/python-pytest-runner_5.2.bb        |  5 --
 .../python-pytest-tempdir_2019.10.12.bb       |  7 --
 .../python/python-pytest_5.3.2.bb             |  9 --
 .../python/python-pytz_2019.3.bb              |  2 -
 .../python/python-pyudev_0.21.0.bb            |  9 --
 .../python/python-pyusb_1.0.2.bb              |  2 -
 .../python/python-pyyaml_5.3.bb               |  2 -
 .../python/python-pyzmq_17.1.0.bb             |  2 -
 .../python/python-rdflib_4.2.2.bb             |  2 -
 .../python/python-redis_2.10.6.bb             |  2 -
 .../python/python-requests-oauthlib_1.3.0.bb  |  3 -
 .../python/python-requests_2.22.0.bb          |  4 -
 .../python/python-rfc3339-validator_0.1.1.bb  |  2 -
 .../python/python-rfc3986-validator_0.1.1.bb  |  2 -
 .../python/python-rfc3987_1.3.8.bb            |  2 -
 ...thon-robotframework-seriallibrary_0.3.1.bb |  2 -
 .../python/python-robotframework_3.0.4.bb     |  6 --
 .../python/python-scandir_1.10.0.bb           | 14 ---
 .../python/python-scrypt_0.8.6.bb             |  3 -
 .../python/python-sdnotify_0.3.2.bb           |  2 -
 .../python/python-selectors34_1.2.bb          | 12 ---
 .../python/python-semver_2.8.1.bb             |  2 -
 .../python/python-serpent_1.28.bb             |  2 -
 .../python/python-setuptools-scm_3.3.3.bb     |  4 -
 .../python/python-sh_1.12.14.bb               |  8 --
 .../python/python-sijax_0.3.2.bb              | 11 ---
 .../python/python-simplejson_3.17.0.bb        |  4 -
 .../python/python-singledispatch_3.4.0.3.bb   | 12 ---
 .../python/python-slip-dbus_0.6.5.bb          |  2 -
 .../python/python-smbus_4.1.bb                |  2 -
 .../python/python-snakefood_1.4.bb            | 51 -----------
 .../python/python-snimpy_0.8.13.bb            | 20 -----
 .../python/python-socketio_4.3.1.bb           |  2 -
 .../python/python-soupsieve_1.9.4.bb          |  4 -
 .../python/python-sparts_0.7.3.bb             | 22 -----
 .../python/python-speaklater_1.3.bb           |  2 -
 .../python/python-sqlalchemy_1.3.12.bb        |  2 -
 .../python/python-sqlparse_0.3.0.bb           |  2 -
 .../python/python-statistics_1.0.3.5.bb       | 15 ----
 .../python/python-stevedore_1.31.0.bb         |  2 -
 .../python/python-strict-rfc3339_0.7.bb       |  2 -
 .../python/python-subprocess32_3.2.7.bb       | 15 ----
 .../python/python-systemd_234.bb              |  2 -
 .../python/python-toml_0.10.0.bb              |  6 --
 .../python/python-tornado-redis_2.4.18.bb     | 18 ----
 .../python/python-tornado_6.0.3.bb            |  8 --
 .../python/python-tqdm_4.41.1.bb              |  2 -
 .../python/python-traceback2_1.4.0.bb         | 15 ----
 .../python/python-twisted_19.10.0.bb          |  8 --
 .../python/python-twitter_3.8.0.bb            |  3 -
 .../python/python-twofish_0.3.0.bb            |  2 -
 .../python/python-typing_3.7.4.1.bb           |  2 -
 .../python/python-tzlocal_2.0.0.bb            |  2 -
 .../python/python-ujson_1.35.bb               |  2 -
 .../python/python-unidiff_0.5.5.bb            |  2 -
 .../python/python-urllib3_1.25.7.bb           |  2 -
 .../python/python-vcversioner_2.16.0.0.bb     | 17 ----
 .../python/python-versiontools_1.9.1.bb       |  2 -
 .../python/python-visitor_0.1.3.bb            |  2 -
 .../python/python-vobject_0.9.6.1.bb          | 15 ----
 .../python/python-waitress_1.4.2.bb           |  2 -
 .../python/python-wcwidth_0.1.8.bb            |  2 -
 .../python/python-webcolors_1.8.1.bb          |  2 -
 .../python/python-webdav_0.1.2.bb             | 19 -----
 .../python/python-webencodings_0.5.1.bb       |  2 -
 .../python/python-werkzeug_0.16.0.bb          |  7 --
 .../python/python-whoosh_2.7.4.bb             |  6 --
 .../python/python-wrapt_1.11.2.bb             |  2 -
 .../python/python-wtforms_2.2.1.bb            |  2 -
 .../python/python-xlrd_1.2.0.bb               |  2 -
 .../python-xstatic-font-awesome_4.7.0.0.bb    |  2 -
 .../python/python-xstatic_1.0.2.bb            |  2 -
 .../recipes-devtools/python/python-yappi.inc  |  2 +-
 .../python/python-yappi_1.0.bb                |  2 -
 .../python/python-zipp_0.6.0.bb               |  2 -
 .../python/python-zopeinterface_4.7.1.bb      |  4 -
 ...hon3-robotframework-seriallibrary_0.3.1.bb |  2 +-
 .../python-cson/python-cson_git.bb            | 21 -----
 .../python-pyephem/python-pyephem_3.7.7.0.bb  | 17 ----
 .../python-pyparted/python-pyparted_3.11.3.bb |  8 --
 .../pywbem/python-pywbem_0.15.0.bb            | 20 -----
 293 files changed, 4 insertions(+), 2097 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone_git.bb
 delete mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
 delete mode 100644 meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
 delete mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
 delete mode 100644 meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
 delete mode 100644 meta-python/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
 delete mode 100644 meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
 delete mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
 delete mode 100644 meta-python/recipes-devtools/gyp/gyp-py2_git.bb
 delete mode 100644 meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/pamela_0.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
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
 delete mode 100644 meta-python/recipes-devtools/python/python-pymongo_3.10.1.bb
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
 delete mode 100644 meta-python/recipes-devtools/python/python-pyyaml_5.3.bb
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
 delete mode 100644 meta-python/recipes-extended/python-cson/python-cson_git.bb
 delete mode 100644 meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
 delete mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
 delete mode 100644 meta-python/recipes-extended/pywbem/python-pywbem_0.15.0.bb

diff --git a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
deleted file mode 100644
index 4503da4221..0000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf.in
+++ /dev/null
@@ -1,24 +0,0 @@
-// Some custom Gate One settings for OpenEmbedded
-{
-    "*": {
-        "gateone": { // These settings apply to all of Gate One
-            "log_file_prefix": "@localstate@/log/gateone.log", // default would be /var/log/gateone/gateone.log
-            "log_file_max_size": 5242880, // 5 megabyte logs for OE by default (default would normally be 100Mb)
-            "log_file_num_backups": 2, // Default is normally 10
-            "origins": ["*"], // Every device has a unique origin
-            "logging": "info",
-            "pid_file": "/run/gateone.pid",
-            "session_dir": "/tmp/gateone",
-            "user_dir": "@localstate@/lib/gateone/users"
-        },
-        "terminal": {
-            // Disabling session logging for embedded devices is a good idea (limited/slow storage)
-            "session_logging": false,
-            "syslog_session_logging": false
-//             "commands": {
-//                 // For some reason this doesn't work (never asks for the password)
-//                 "login": "setsid /bin/login" // Normally this would emulate logging into the host console
-//             }
-        }
-    }
-}
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service b/meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
deleted file mode 100644
index 0f613d18e8..0000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
+++ /dev/null
@@ -1,10 +0,0 @@
-<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
-<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
-
-<service-group>
-  <name replace-wildcards="yes">GateOne on %h</name>
-  <service>
-    <type>_https._tcp</type>
-    <port>443</port>
-  </service>
-</service-group>
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in b/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
deleted file mode 100644
index 86d655c94d..0000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone-init.in
+++ /dev/null
@@ -1,47 +0,0 @@
-#!/bin/sh -e
-### BEGIN INIT INFO
-# Provides:          gateone
-# Required-Start:    networking
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: Gateone HTML5 ssh client
-# Description:       Gateone HTML5 terminal emulator and SSH client.
-### END INIT INFO
-
-. /etc/init.d/functions
-
-NAME=gateone
-DAEMON=@bindir@/gateone
-PIDFILE=/run/gateone.pid
-WORKDIR=@localstate@/lib/gateone
-
-do_start() {
-    cd $WORKDIR
-    @bindir@/python $DAEMON > /dev/null 2>&1 &
-    cd $OLDPWD
-}
-
-do_stop() {
-    kill -TERM `cat $PIDFILE`
-}
-
-case "$1" in
-    start)
-        echo "Starting gateone"
-        do_start
-        ;;
-    stop)
-        echo "Stopping gateone"
-        do_stop
-        ;;
-    restart|force-reload)
-        echo "Restart gateone"
-        do_stop
-        sleep 1
-        do_start
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-        exit 1
-        ;;
-esac
diff --git a/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in b/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
deleted file mode 100644
index 44667275a2..0000000000
--- a/meta-python/recipes-connectivity/gateone/gateone/gateone.service.in
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=GateOne daemon
-ConditionPathExists=|@localstate@/lib/gateone
-
-[Service]
-WorkingDirectory=@localstate@/lib/gateone
-ExecStart=@bindir@/python @bindir@/gateone
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
deleted file mode 100644
index 5d2ca00ef5..0000000000
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
-LICENSE = "AGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=834cbc6995db88433db17cdf8953a428"
-HOMEPAGE = "http://liftoffsoftware.com/Products/GateOne"
-
-PV = "1.2+git${SRCPV}"
-SRCREV = "f7a9be46cb90f57459ebd363d24702de0e651034"
-SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
-           file://gateone-avahi.service \
-           file://80oe.conf.in \
-           file://gateone.service.in \
-           file://gateone-init.in \
-"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools python-dir systemd update-rc.d
-
-DISTUTILS_INSTALL_ARGS += " \
-    --install-data=${PYTHON_SITEPACKAGES_DIR} \
-    --install-scripts=${bindir} \
-    --skip_init_scripts"
-
-do_install_append() {
-
-    # fix up hardcoded paths
-    for file in gateone.service gateone-init 80oe.conf; do
-        sed -e s:@bindir@:${bindir}:g \
-            -e s:@localstate@:${localstatedir}:g \
-            < ${WORKDIR}/$file.in \
-            > ${WORKDIR}/$file
-    done
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
-
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/gateone-init ${D}${sysconfdir}/init.d/gateone
-
-    install -m 0755 -d ${D}${sysconfdir}/avahi/services/
-    install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
-
-    install -m 0755 -d ${D}${sysconfdir}/gateone/conf.d/
-    install -m 0644 ${WORKDIR}/80oe.conf ${D}${sysconfdir}/gateone/conf.d/80oe.conf
-
-    install -d ${D}${localstatedir}/lib/gateone
-}
-
-FILES_${PN} = "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
-RDEPENDS_${PN} = "mime-support \
-                  openssh-ssh \
-                  python-compression \
-                  python-contextlib \
-                  python-crypt \
-                  python-datetime \
-                  python-email \
-                  python-fcntl \
-                  python-futures \
-                  python-html \
-                  python-imaging \
-                  python-io \
-                  python-json \
-                  python-logging \
-                  python-misc \
-                  python-multiprocessing \
-                  python-netclient \
-                  python-pkgutil \
-                  python-pyopenssl \
-                  python-re \
-                  python-setuptools \
-                  python-shell \
-                  python-simplejson \
-                  python-subprocess \
-                  python-syslog \
-                  python-terminal \
-                  python-textutils \
-                  python-tornado \
-                  python-unixadmin \
-                  python-xml \
-                  python-html5lib \
-                  bash \
-"
-
-SYSTEMD_SERVICE_${PN} = "gateone.service"
-INITSCRIPT_NAME = "gateone"
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
deleted file mode 100644
index e96ad1ca1b..0000000000
--- a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-gsocketpool.inc
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
deleted file mode 100644
index b841297420..0000000000
--- a/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-h2.inc
-
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
deleted file mode 100644
index faaeb8555f..0000000000
--- a/meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-hpack.inc
-
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
deleted file mode 100644
index 4f0c9977a8..0000000000
--- a/meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-hyperframe.inc
-
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
deleted file mode 100644
index 6b2ea21932..0000000000
--- a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-mprpc.inc
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb b/meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
deleted file mode 100644
index cbe2625763..0000000000
--- a/meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-priority.inc
-
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
deleted file mode 100644
index 3c12db9446..0000000000
--- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pyconnman.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-dbus python-pprint"
diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
deleted file mode 100644
index 738cf86774..0000000000
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python Remote Objects"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
-
-SRC_URI[md5sum] = "21f015ae93cf9ea2bbbc418a2267e9fb"
-SRC_URI[sha256sum] = "2bfe12a22f396474b0e57c898c7e2c561a8f850bf2055d8cf0f7119f0c7a523f"
-
-PYPI_PACKAGE = "Pyro4"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-selectors34 \
-    ${PYTHON_PN}-serpent \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-zlib \
-    "
diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb b/meta-python/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
deleted file mode 100644
index 3fc587f3a3..0000000000
--- a/meta-python/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pytun.inc
-inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
deleted file mode 100644
index 2d51619d49..0000000000
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python bindings for the Apache Thrift RPC system"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e95cd2f17c70d3180a2b361332319fe0"
-
-SRC_URI[md5sum] = "c3bc8d9a910d2c9ce26f2ad1f7c96762"
-SRC_URI[sha256sum] = "9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9ae7d89"
-
-inherit pypi setuptools
-
-# Use different filename to prevent conflicts with thrift itself
-PYPI_SRC_URI_append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-"
diff --git a/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
deleted file mode 100644
index f3631cda34..0000000000
--- a/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Twisted Web Sockets"
-HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76699830db7fa9e897f6a1ad05f98ec8"
-
-DEPENDS = "python-twisted python-six python-vcversioner python-six-native python-vcversioner-native"
-
-SRC_URI = "git://github.com/MostAwesomeDude/txWS.git"
-SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools
-
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
deleted file mode 100644
index b7aea24a79..0000000000
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Telepathy IM framework - Python package"
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
-
-DEPENDS = "libxslt-native"
-RDEPENDS_${PN} += "python-dbus"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://parallel_make.patch \
-           file://remove_duplicate_install.patch \
-           file://telepathy-python_fix_for_automake_1.12.patch"
-
-PR = "r6"
-
-inherit autotools pythonnative
-
-SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
-SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
-
-FILES_${PN} += "\
-    ${libdir}/python*/site-packages/telepathy/*.py \
-    ${libdir}/python*/site-packages/telepathy/*/*.py \
-"
-
-do_install_append () {
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
-}
diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image.bb
index cc75fe6e4b..6353d389b5 100644
--- a/meta-python/recipes-core/images/meta-python-image.bb
+++ b/meta-python/recipes-core/images/meta-python-image.bb
@@ -2,5 +2,4 @@ require  meta-python-image-base.bb
 
 SUMMARY = "meta-python build test image"
 
-IMAGE_INSTALL += "packagegroup-meta-python \
-                  packagegroup-meta-python3"
+IMAGE_INSTALL += "packagegroup-meta-python3"
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bb05de1f55..12a0562550 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -4,68 +4,14 @@ inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
-    packagegroup-meta-python \
     packagegroup-meta-python3 \
 '
 
-RDEPENDS_packagegroup-meta-python = "\
-    packagegroup-meta-python-extended \
-    packagegroup-meta-python-connectivity \
-"
-
 RDEPENDS_packagegroup-meta-python3 = "\
     packagegroup-meta-python3-extended \
     packagegroup-meta-python3-connectivity \
 "
 
-RDEPENDS_packagegroup-meta-python = "\
-    python-psutil python-certifi python-flask python-pyroute2 python-pyopenssl python-pylint \
-    python-semver python-wrapt python-networkx python-behave python-dominate python-flask-user \
-    python-attrs python-humanize python-six python-flask-login python-zopeinterface python-sijax \
-    python-pyinotify python-stevedore python-pyjwt python-webdav python-twisted python-flask-sijax \
-    python-functools32 python-javaobj-py3 python-pygpgme python-future python-attr \
-    python-flask-xstatic python-m2crypto python-hyperlink python-imaging python-idna python-jinja2 \
-    python-can python-flask-bcrypt python-requests python-paste python-flask-script python-serpent \
-    python-cryptography python-pysmi python-xlrd python-appdirs python-jsonpatch python-bcrypt \
-    python-ndg-httpsclient python-pytest python-linecache2 python-visitor python-backports-abc \
-    python-setuptools-scm python-evdev python-pyjks python-jsonpointer python-cheetah python-gevent \
-    python-smbus python-sqlalchemy python-scrypt python-werkzeug python-anyjson python-pexpect \
-    python-robotframework-seriallibrary python-pyalsaaudio python-pytest-helpers-namespace \
-    python-alembic python-flask-pymongo python-slip-dbus python-pydbus python-automat python-rfc3987 \
-    python-tzlocal python-backports-ssl python-subprocess32 python-asn1crypto python-pybind11 \
-    python-ptyprocess python-babel python-passlib python-sdnotify \
-    python-lazy-object-proxy python-cryptography-vectors python-crcmod python-pyusb python-vobject \
-    python-webcolors python-pyparsing python-beautifulsoup4 python-cffi python-tornado-redis \
-    python-itsdangerous python-pyasn1-modules python-netaddr python-vcversioner \
-    python-sh python-greenlet python-paho-mqtt python-traceback2 python-gdata python-dbusmock \
-    python-whoosh python-lockfile python-isort python-wtforms python-feedparser python-flask-restful \
-    python-pysnmp python-flask-babel python-pytest-tempdir python-flask-nav python-pyzmq python-pyyaml \
-    python-protobuf python-pluggy python-jsonschema python-msgpack \
-    python-periphery python-pint python-pycryptodome python-yappi python-pycrypto python-pretend \
-    python-pyserial python-pyiface python-docutils python-grpcio-tools python-django-south \
-    python-backports-functools-lru-cache python-py python-click python-flask-migrate \
-    python-pyudev python-pystache python-blinker python-prompt-toolkit python-lxml \
-    python-unidiff python-inflection python-twofish python-prettytable python-webencodings \
-    python-mock python-pyexpect python-dnspython python-pysocks python-pynetlinux \
-    python-daemon python-djangorestframework python-typing python-monotonic python-sparts \
-    python-enum34 python-pyperclip python-flask-uploads python-pbr python-parse python-pyflakes \
-    python-pyhamcrest python-mako python-incremental python-tornado python-xstatic-font-awesome \
-    python-cmd2 python-strict-rfc3339 python-pycodestyle python-xstatic python-snakefood \
-    python-pybluez python-flask-navigation python-pyfirmata python-pymongo python-pysqlite \
-    python-progress python-flask-sqlalchemy python-pymisp python-pip python-ujson python-ply \
-    python-pep8 python-dateutil python-pycparser python-daemonize python-astroid python-pyrex \
-    python-markupsafe python-pytest-runner python-grpcio python-mccabe python-pytz python-selectors34 \
-    python-cython python-chardet python-editor python-flask-bootstrap python-html5lib \
-    python-singledispatch python-redis python-flask-mail python-funcsigs python-snimpy python-pyasn1 \
-    python-decorator python-urllib3 python-feedformatter python-iso8601 \
-    python-numeric python-robotframework python-django python-simplejson python-wcwidth \
-    python-configparser python-epydoc python-intervals python-speaklater \
-    python-aws-iot-device-sdk-python python-constantly python-bitarray python-flask-wtf \
-    python-parse-type python-ipaddress python-dbus \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
-"
-
 RDEPENDS_packagegroup-meta-python3 = "\
     python3-pyserial python3-gevent python3-alembic python3-robotframework-seriallibrary \
     python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
@@ -105,13 +51,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
 "
 
-RDEPENDS_packagegroup-meta-python-extended = "\
-    python-pyephem \
-    python-cson \
-    python-pywbem \
-    python-pyparted \
-"
-
 RDEPENDS_packagegroup-meta-python3-extended = "\
     python3-pykickstart \
     python3-meh \
@@ -121,16 +60,6 @@ RDEPENDS_packagegroup-meta-python3-extended = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
 "
 
-RDEPENDS_packagegroup-meta-python-connectivity = "\
-    python-pyro4 \
-    python-pytun \
-    python-mprpc \
-    python-thrift \
-    python-txws \
-    python-pyconnman \
-    python-gsocketpool \
-"
-
 RDEPENDS_packagegroup-meta-python3-connectivity = "\
     python3-pytun \
     python3-mprpc \
@@ -138,11 +67,6 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
     python3-gsocketpool \
 "
 
-RDEPENDS_packagegroup-meta-python-ptest = "\
-    python-pygpgme \
-    python-cryptography \
-    "
-
 RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-cryptography \
     "
diff --git a/meta-python/recipes-devtools/gyp/gyp-py2_git.bb b/meta-python/recipes-devtools/gyp/gyp-py2_git.bb
deleted file mode 100644
index d69b92ce6c..0000000000
--- a/meta-python/recipes-devtools/gyp/gyp-py2_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require gyp.inc
diff --git a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
index 0e69e45345..85f81fdbeb 100644
--- a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
+++ b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
 SRC_URI[md5sum] = "42b518b9ccd6852d1d709749bc96cb70"
 SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
 
-inherit pypi setuptools
+inherit pypi
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb b/meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb
deleted file mode 100644
index d97893f5ab..0000000000
--- a/meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb
+++ /dev/null
@@ -1 +0,0 @@
-require python-jsonref.inc
diff --git a/meta-python/recipes-devtools/python/pamela_0.3.0.bb b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
deleted file mode 100644
index 030c22f8f3..0000000000
--- a/meta-python/recipes-devtools/python/pamela_0.3.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Pamela: yet another Python wrapper for PAM"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=bfb663f37eb99232bc8ccfa4ea8f1202"
-
-SRC_URI[md5sum] = "de6516118d51eb5fc97017f3b6d5c68b"
-SRC_URI[sha256sum] = "1e198446a6cdd87704aa0def7621d62e7c20b0e6068e2788b9a866a8355e5d6b"
-
-PYPI_PACKAGE = "pamela"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "libpam"
-
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "pam"
diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
deleted file mode 100644
index 9d851abe33..0000000000
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Python interface for Remember The Milk API"
-AUTHOR = "Sridhar Ratnakumar / srid"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
-
-PYPI_PACKAGE_EXT = "tar.bz2"
-
-SRC_URI[md5sum] = "7c87da94656b620dfe532ca63d642eb8"
-SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14ee1d933"
-
-inherit pypi setuptools
-
-PACKAGES =+ "${PN}-tests ${PN}-samples"
-
-FILES_${PN}-samples += " \
-    ${PYTHON_SITEPACKAGES_DIR}/rtm/samples \
-"
-
-FILES_${PN}-tests += " \
-    ${PYTHON_SITEPACKAGES_DIR}/rtm/tests \
-"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-"
-
-RDEPENDS_${PN}-samples += " \
-    ${PN} \
-"
-
-RDEPENDS_${PN}-tests += " \
-    ${PN} \
-    ${PYTHON_PN}-unittest \
-"
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.3.2.bb b/meta-python/recipes-devtools/python/python-alembic_1.3.2.bb
deleted file mode 100644
index efcb2b1deb..0000000000
--- a/meta-python/recipes-devtools/python/python-alembic_1.3.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-alembic.inc
diff --git a/meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb
deleted file mode 100644
index 31b8749fe2..0000000000
--- a/meta-python/recipes-devtools/python/python-anyjson_0.3.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-anyjson.inc
diff --git a/meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb
deleted file mode 100644
index e9ff9b3fc3..0000000000
--- a/meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-appdirs.inc
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_1.3.0.bb b/meta-python/recipes-devtools/python/python-asn1crypto_1.3.0.bb
deleted file mode 100644
index 46aace286f..0000000000
--- a/meta-python/recipes-devtools/python/python-asn1crypto_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit setuptools
-require python-asn1crypto.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-textutils \ 
-"
diff --git a/meta-python/recipes-devtools/python/python-astroid_2.3.3.bb b/meta-python/recipes-devtools/python/python-astroid_2.3.3.bb
deleted file mode 100644
index 687394da63..0000000000
--- a/meta-python/recipes-devtools/python/python-astroid_2.3.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit setuptools
-require python-astroid.inc
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-enum34 \
-    ${PYTHON_PN}-backports-functools-lru-cache \
-    ${PYTHON_PN}-re \
-    ${PYTHON_PN}-singledispatch \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb
deleted file mode 100644
index c7b41d603c..0000000000
--- a/meta-python/recipes-devtools/python/python-atomicwrites_1.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-atomicwrites.inc
diff --git a/meta-python/recipes-devtools/python/python-attr_0.3.1.bb b/meta-python/recipes-devtools/python/python-attr_0.3.1.bb
deleted file mode 100644
index 979d6cb687..0000000000
--- a/meta-python/recipes-devtools/python/python-attr_0.3.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-attr.inc
diff --git a/meta-python/recipes-devtools/python/python-attrs_19.3.0.bb b/meta-python/recipes-devtools/python/python-attrs_19.3.0.bb
deleted file mode 100644
index e3bec0fdfd..0000000000
--- a/meta-python/recipes-devtools/python/python-attrs_19.3.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-attrs.inc
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-automat_0.8.0.bb b/meta-python/recipes-devtools/python/python-automat_0.8.0.bb
deleted file mode 100644
index 8ac8c9c0ff..0000000000
--- a/meta-python/recipes-devtools/python/python-automat_0.8.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-automat.inc
diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
deleted file mode 100644
index 490e973917..0000000000
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-aws-iot-device-sdk-python.inc
-
-RDEPENDS_${PN}-examples += "${PYTHON_PN}-argparse"
diff --git a/meta-python/recipes-devtools/python/python-babel_2.7.0.bb b/meta-python/recipes-devtools/python/python-babel_2.7.0.bb
deleted file mode 100644
index f7c166ebab..0000000000
--- a/meta-python/recipes-devtools/python/python-babel_2.7.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-babel.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-backports-abc_0.5.bb b/meta-python/recipes-devtools/python/python-backports-abc_0.5.bb
deleted file mode 100644
index b588a31a30..0000000000
--- a/meta-python/recipes-devtools/python/python-backports-abc_0.5.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "collections.abc from Python 3.5"
-DESCRIPTION = "A backport of recent additions to the 'collections.abc' module"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
-
-PYPI_PACKAGE = "backports_abc"
-
-SRC_URI[md5sum] = "7d1936ec183a3586290adf60f6f96764"
-SRC_URI[sha256sum] = "033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
deleted file mode 100644
index 5e0f2f1e8a..0000000000
--- a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-backports-functools-lru-cache.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
deleted file mode 100644
index 9032a7c1ed..0000000000
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "The ssl.match_hostname() function from Python 3.4"
-DESCRIPTION = "The Secure Sockets layer is only actually secure if you check the hostname in the \
-certificate returned by the server to which you are connecting, and verify that it matches to hostname \
-that you are trying to reach. But the matching logic, defined in RFC2818, can be a bit tricky to implement \
-on your own. So the ssl package in the Standard Library of Python 3.2 and greater now includes a \
-match_hostname() function for performing this check instead of requiring every application to \
-implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b2adbe8bfdeb625c9a01afd9aaa66619"
-
-SRC_URI[md5sum] = "32d2f593af01a046bec3d2f5181a420a"
-SRC_URI[sha256sum] = "bb82e60f9fbf4c080eabd957c39f0641f0fc247d9a16e31e26d594d8f42b9fd2"
-
-PYPI_PACKAGE = "backports.ssl_match_hostname"
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "${PYTHON_PN}-pkgutil"
diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.7.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.7.bb
deleted file mode 100644
index b136aa4895..0000000000
--- a/meta-python/recipes-devtools/python/python-bcrypt_3.1.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-bcrypt.inc
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb b/meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
deleted file mode 100644
index 907285ac10..0000000000
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-beautifulsoup4.inc
diff --git a/meta-python/recipes-devtools/python/python-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python-behave_1.2.6.bb
deleted file mode 100644
index 66221682a0..0000000000
--- a/meta-python/recipes-devtools/python/python-behave_1.2.6.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit setuptools
-require python-behave.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-argparse \
-    ${PYTHON_PN}-enum34 \
-    ${PYTHON_PN}-traceback2 \
-    "
diff --git a/meta-python/recipes-devtools/python/python-bitarray_1.2.1.bb b/meta-python/recipes-devtools/python/python-bitarray_1.2.1.bb
deleted file mode 100644
index f78c7abd23..0000000000
--- a/meta-python/recipes-devtools/python/python-bitarray_1.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-bitarray.inc
diff --git a/meta-python/recipes-devtools/python/python-blinker_1.4.bb b/meta-python/recipes-devtools/python/python-blinker_1.4.bb
deleted file mode 100644
index bc4164e974..0000000000
--- a/meta-python/recipes-devtools/python/python-blinker_1.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-blinker.inc
diff --git a/meta-python/recipes-devtools/python/python-cachetools_4.0.0.bb b/meta-python/recipes-devtools/python/python-cachetools_4.0.0.bb
deleted file mode 100644
index 8c12ad042f..0000000000
--- a/meta-python/recipes-devtools/python/python-cachetools_4.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-cachetools.inc
diff --git a/meta-python/recipes-devtools/python/python-can_3.3.2.bb b/meta-python/recipes-devtools/python/python-can_3.3.2.bb
deleted file mode 100644
index f0edb6408b..0000000000
--- a/meta-python/recipes-devtools/python/python-can_3.3.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-can.inc
-inherit pypi setuptools
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-argparse \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-zlib \
-"    
diff --git a/meta-python/recipes-devtools/python/python-certifi_2019.11.28.bb b/meta-python/recipes-devtools/python/python-certifi_2019.11.28.bb
deleted file mode 100644
index adfe6238ec..0000000000
--- a/meta-python/recipes-devtools/python/python-certifi_2019.11.28.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-certifi.inc
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.13.2.bb b/meta-python/recipes-devtools/python/python-cffi_1.13.2.bb
deleted file mode 100644
index bc667b8056..0000000000
--- a/meta-python/recipes-devtools/python/python-cffi_1.13.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-cffi.inc
-inherit pypi setuptools
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb b/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
deleted file mode 100644
index 3b6feeef11..0000000000
--- a/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-chardet.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
diff --git a/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
deleted file mode 100644
index 20fc2fdc3f..0000000000
--- a/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python template engine and code generation tool"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aff1107514aa6aae948f9fe71fdc393b"
-
-PR = "r3"
-
-PYPI_PACKAGE = "Cheetah"
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "python-pickle python-pprint"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "853917116e731afbc8c8a43c37e6ddba"
-SRC_URI[sha256sum] = "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
diff --git a/meta-python/recipes-devtools/python/python-click_7.0.bb b/meta-python/recipes-devtools/python/python-click_7.0.bb
deleted file mode 100644
index f63e27c843..0000000000
--- a/meta-python/recipes-devtools/python/python-click_7.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools
-require python-click.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-contextlib"
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.23.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.23.bb
deleted file mode 100644
index 17b6ae2858..0000000000
--- a/meta-python/recipes-devtools/python/python-cmd2_0.9.23.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-inherit setuptools
-require python-cmd2.inc
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-pyparsing \
-    ${PYTHON_PN}-pyperclip \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-textutils \
-    "
diff --git a/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
deleted file mode 100644
index 0fc1b258c0..0000000000
--- a/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-coloredlogs.inc
diff --git a/meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb b/meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb
deleted file mode 100644
index 6d64b8d0b2..0000000000
--- a/meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools
-require python-configargparse.inc
-
diff --git a/meta-python/recipes-devtools/python/python-configparser_3.8.1.bb b/meta-python/recipes-devtools/python/python-configparser_3.8.1.bb
deleted file mode 100644
index a8ed1e91b0..0000000000
--- a/meta-python/recipes-devtools/python/python-configparser_3.8.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools
-require python-configparser.inc
-RDEPENDS_${PN} += "python-pkgutil"
diff --git a/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
deleted file mode 100644
index 29b15eb605..0000000000
--- a/meta-python/recipes-devtools/python/python-constantly_15.1.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-constantly.inc
diff --git a/meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb b/meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb
deleted file mode 100644
index 87cffb98fc..0000000000
--- a/meta-python/recipes-devtools/python/python-contextlib2_0.6.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit pypi setuptools
-require python-contextlib2.inc
-
diff --git a/meta-python/recipes-devtools/python/python-crcmod_1.7.bb b/meta-python/recipes-devtools/python/python-crcmod_1.7.bb
deleted file mode 100644
index 45b9a2ce66..0000000000
--- a/meta-python/recipes-devtools/python/python-crcmod_1.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-crcmod.inc
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.8.bb
deleted file mode 100644
index 4975278a99..0000000000
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-cryptography-vectors.inc
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python-cryptography_2.8.bb
deleted file mode 100644
index 9c2f88418d..0000000000
--- a/meta-python/recipes-devtools/python/python-cryptography_2.8.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-inherit pypi setuptools
-require python-cryptography.inc
-
-SRC_URI += " \
-    file://run-ptest \
-"
-
-DEPENDS += " \
-    ${PYTHON_PN}-enum34 \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-enum34 \
-    ${PYTHON_PN}-ipaddress \
-"
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-enum34 \
-    ${PYTHON_PN}-ipaddress \
-    ${PYTHON_PN}-contextlib \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-cython_0.29.14.bb b/meta-python/recipes-devtools/python/python-cython_0.29.14.bb
deleted file mode 100644
index d803a6ed4c..0000000000
--- a/meta-python/recipes-devtools/python/python-cython_0.29.14.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit setuptools
-require python-cython.inc
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Cython/"
-UPSTREAM_CHECK_REGEX = "/Cython/(?P<pver>(\d+[\.\-_]*)+)"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-distribute \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
deleted file mode 100644
index 002da046c4..0000000000
--- a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
-HOMEPAGE = "https://pagure.io/python-daemon/"
-SECTION = "devel/python"
-
-DEPENDS += "python-docutils-native"
-RDEPENDS_${PN} = "python-docutils \
-                  python-lockfile (>= 0.10) \
-                  python-resource \
-"
-
-LICENSE = "Apache-2.0 & GPLv3"
-LIC_FILES_CHKSUM = "file://README;md5=2695c853a2cafc33e68a1d972889ebd2"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "9c57343d81f2a96c51cffeab982b04d2"
-SRC_URI[sha256sum] = "261c859be5c12ae7d4286dc6951e87e9e1a70a882a8b41fd926efc1ec4214f73"
-
-# Fix for build error in Yocto:
-#     i = p.rfind('/') + 1
-# AttributeError: 'NoneType' object has no attribute 'rfind'
-#S = "${WORKDIR}/python-daemon"
-SRC_URI_append = " \
-                  file://0001-Workaround-for-issue-2-1.patch \
-"
-
-PYPI_PACKAGE = "python-daemon"
diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.5.0.bb b/meta-python/recipes-devtools/python/python-daemonize_2.5.0.bb
deleted file mode 100644
index e0f64fcf18..0000000000
--- a/meta-python/recipes-devtools/python/python-daemonize_2.5.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Library to enable your code run as a daemon process on Unix-like systems"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=13e982bf1b7b164b9d6d1665dac83873"
-SRCNAME = "daemonize"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-               python-fcntl \
-               python-unixadmin \
-               python-logging \
-               python-resource \
-"
-
-SRC_URI[md5sum] = "3d64e7a0219ad22e3fca62460f893b6a"
-SRC_URI[sha256sum] = "dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3"
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.8.1.bb b/meta-python/recipes-devtools/python/python-dateutil_2.8.1.bb
deleted file mode 100644
index 12ae4c3118..0000000000
--- a/meta-python/recipes-devtools/python/python-dateutil_2.8.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-dateutil.inc
diff --git a/meta-python/recipes-devtools/python/python-dbus_1.2.14.bb b/meta-python/recipes-devtools/python/python-dbus_1.2.14.bb
deleted file mode 100644
index b89d7d2c8b..0000000000
--- a/meta-python/recipes-devtools/python/python-dbus_1.2.14.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Python bindings for the DBus inter-process communication system"
-SECTION = "devel/python"
-HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
-LICENSE = "MIT & AFL-2.1 | GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4 \
-		    file://dbus-gmain/COPYING;md5=99fece6728a80737c8fd3e7c734c17c4 "
-DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
-
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "c8739234fca9fba26368d1a337abe830"
-SRC_URI[sha256sum] = "b10206ba3dd641e4e46411ab91471c88e0eec1749860e4285193ee68df84ac31"
-S = "${WORKDIR}/dbus-python-${PV}"
-
-inherit distutils-base autotools pkgconfig
-
-# documentation needs python-sphinx, which is not in oe-core or meta-python for now
-# change to use PACKAGECONFIG when python-sphinx is added to oe-core or meta-python
-EXTRA_OECONF += "--disable-documentation"
-
-export STAGING_LIBDIR
-export STAGING_INCDIR
-
-RDEPENDS_${PN} = "python-io python-logging python-stringold python-threading python-xml"
-
-FILES_${PN}-dev += "${libdir}/pkgconfig"
-
-do_install_append() {
-    # Remove files that clash with python3-dbus; their content is same
-    rm ${D}${includedir}/dbus-1.0/dbus/dbus-python.h ${D}${libdir}/pkgconfig/dbus-python.pc
-}
diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
deleted file mode 100644
index ec8c54aacc..0000000000
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# Copyright (c) 2014 LG Electronics, Inc.
-
-SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
-AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
-
-LICENSE = "GPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-SRC_URI[md5sum] = "80f8caa838fad96483a8751e11d384f9"
-SRC_URI[sha256sum] = "2d2ea892fa4633c3ec6ac1e912120ec493047a5c6522849b7d1c95ad755bce75"
-
-SRC_URI += " \
-    file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
-    file://0002-Add-possibility-to-import-templates-from-packages.patch \
-"
-
-PYPI_PACKAGE = "python-dbusmock"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-dbus \
-    ${PYTHON_PN}-pygobject \
-    ${PYTHON_PN}-xml \
-    "
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.4.1.bb b/meta-python/recipes-devtools/python/python-decorator_4.4.1.bb
deleted file mode 100644
index 2a2b455f56..0000000000
--- a/meta-python/recipes-devtools/python/python-decorator_4.4.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-decorator.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-contextlib"
diff --git a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
deleted file mode 100644
index 357b766a3d..0000000000
--- a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-django-south.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.14.bb b/meta-python/recipes-devtools/python/python-django_1.11.14.bb
deleted file mode 100644
index efe23dcb72..0000000000
--- a/meta-python/recipes-devtools/python/python-django_1.11.14.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require python-django.inc
-inherit setuptools
-
-SRC_URI[md5sum] = "38e82b59a1c27bbf98ccf0564ead7426"
-SRC_URI[sha256sum] = "eb9271f0874f53106a2719c0c35ce67631f6cc27cf81a60c6f8c9817b35a3f6e"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-argparse \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-zlib \
-"
diff --git a/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
deleted file mode 100644
index 540d12dc23..0000000000
--- a/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-djangorestframework.inc
-inherit setuptools
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python-dnspython_1.16.0.bb
deleted file mode 100644
index 9dbcd0ffbd..0000000000
--- a/meta-python/recipes-devtools/python/python-dnspython_1.16.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-dnspython.inc
diff --git a/meta-python/recipes-devtools/python/python-docutils_0.15.2.bb b/meta-python/recipes-devtools/python/python-docutils_0.15.2.bb
deleted file mode 100644
index d26e81908b..0000000000
--- a/meta-python/recipes-devtools/python/python-docutils_0.15.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Text processing system for documentation"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
-
-inherit pypi setuptools
-
-PYPI_PACKAGE = "docutils"
-
-SRC_URI[md5sum] = "e26a308d8000b0bed7416a633217c676"
-SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-python/recipes-devtools/python/python-dominate_2.4.0.bb b/meta-python/recipes-devtools/python/python-dominate_2.4.0.bb
deleted file mode 100644
index c19445e728..0000000000
--- a/meta-python/recipes-devtools/python/python-dominate_2.4.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-dominate.inc
diff --git a/meta-python/recipes-devtools/python/python-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python-editor_1.0.4.bb
deleted file mode 100644
index f7a9a8c0d5..0000000000
--- a/meta-python/recipes-devtools/python/python-editor_1.0.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-editor.inc
diff --git a/meta-python/recipes-devtools/python/python-engineio_3.11.2.bb b/meta-python/recipes-devtools/python/python-engineio_3.11.2.bb
deleted file mode 100644
index 7dd6ec0e0d..0000000000
--- a/meta-python/recipes-devtools/python/python-engineio_3.11.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-engineio.inc
diff --git a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
deleted file mode 100644
index d50b5c7c58..0000000000
--- a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "backport of Python 3.4's enum package"
-HOMEPAGE = "https://bitbucket.org/stoneleaf/enum34"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
-
-SRC_URI[md5sum] = "5f13a0841a61f7fc295c514490d120d0"
-SRC_URI[sha256sum] = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"
-
-inherit pypi setuptools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
deleted file mode 100644
index dd9799faf1..0000000000
--- a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Epydoc is a tool for generating API documentation for Python modules, based on their docstrings"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=011c0d78eb6054d731c879132d7313f0"
-HOMEPAGE = "http://epydoc.sourceforge.net/"
-
-SRC_URI[md5sum] = "cdd6f6c76dd8bab5e653a343a0544294"
-SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af61725b6ad1"
-
-inherit pypi distutils
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-re \
-    ${PYTHON_PN}-xml \
-    "
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-evdev_1.2.0.bb b/meta-python/recipes-devtools/python/python-evdev_1.2.0.bb
deleted file mode 100644
index 63541363e3..0000000000
--- a/meta-python/recipes-devtools/python/python-evdev_1.2.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-evdev.inc
diff --git a/meta-python/recipes-devtools/python/python-feedformatter_0.4.bb b/meta-python/recipes-devtools/python/python-feedformatter_0.4.bb
deleted file mode 100644
index 175f94478a..0000000000
--- a/meta-python/recipes-devtools/python/python-feedformatter_0.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-feedformatter.inc
diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
deleted file mode 100644
index b8ee700f04..0000000000
--- a/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Python Atom and RSS feed parser"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c21a7713ef6dc1b99644061c397e7c2a"
-
-SRC_URI[md5sum] = "d552f7a2a55e8e33b2a3fe1082505b42"
-SRC_URI[sha256sum] = "bd030652c2d08532c034c27fcd7c85868e7fa3cb2b17f230a44a6bbc92519bf9"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-stringold \
-    "
-
diff --git a/meta-python/recipes-devtools/python/python-flask-babel_0.12.2.bb b/meta-python/recipes-devtools/python/python-flask-babel_0.12.2.bb
deleted file mode 100644
index 38e78c73f9..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-babel_0.12.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-babel.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
deleted file mode 100644
index d090b345ef..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Bcrypt hashing for Flask."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ee2ee5bee7fe96597770e92db5719a8"
-
-SRC_URI[md5sum] = "d345c36ac6637d3ca9fa942e238d00ca"
-SRC_URI[sha256sum] = "d71c8585b2ee1c62024392ebdbc447438564e2c8c02b4e57b56a4cafd8d13c5f"
-
-PYPI_PACKAGE = "Flask-Bcrypt"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
deleted file mode 100644
index eeaade9a88..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-bootstrap.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-login_0.4.1.bb b/meta-python/recipes-devtools/python/python-flask-login_0.4.1.bb
deleted file mode 100644
index 510cedf220..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-login_0.4.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-login.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
deleted file mode 100644
index 8324da867e..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-mail.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-migrate_2.5.2.bb b/meta-python/recipes-devtools/python/python-flask-migrate_2.5.2.bb
deleted file mode 100644
index ece516f505..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-migrate_2.5.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-migrate.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
deleted file mode 100644
index 30b5b3b3b7..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-nav.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb b/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
deleted file mode 100644
index b2dc96e3c0..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "The navigation of Flask application."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=af2ec695dc1f3eb7bd74f79a68a0d789"
-
-SRC_URI[md5sum] = "d1075ee02a3f69da37e5cadad3395f31"
-SRC_URI[sha256sum] = "c42d30efa989ca877444a410e8a1cd2563546f9effe3d9fe388eedf7a6c69285"
-
-PYPI_PACKAGE = "Flask-Navigation"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-blinker \
-    ${PYTHON_PN}-flask \
-    "
diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
deleted file mode 100644
index d41d023480..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-restful_0.3.7.bb b/meta-python/recipes-devtools/python/python-flask-restful_0.3.7.bb
deleted file mode 100644
index 1968d1d9d2..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-restful_0.3.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-flask-restful.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb b/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
deleted file mode 100644
index b7d55af151..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-script.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb
deleted file mode 100644
index 74738fc2f2..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools
-require python-flask-sijax.inc
-
-SRC_URI[sha256sum] = "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-flask-socketio_4.2.1.bb b/meta-python/recipes-devtools/python/python-flask-socketio_4.2.1.bb
deleted file mode 100644
index 3b9ad33bb0..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-socketio_4.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-flask-socketio.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
deleted file mode 100644
index 3dc355c5da..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-sqlalchemy.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb
deleted file mode 100644
index d39b07f690..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-uploads.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
deleted file mode 100644
index 654d377528..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-user.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-wtf_0.14.2.bb b/meta-python/recipes-devtools/python/python-flask-wtf_0.14.2.bb
deleted file mode 100644
index dbf091bc0f..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-wtf_0.14.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-wtf.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb b/meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
deleted file mode 100644
index dff14a8c05..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask-xstatic.inc
diff --git a/meta-python/recipes-devtools/python/python-flask_1.1.1.bb b/meta-python/recipes-devtools/python/python-flask_1.1.1.bb
deleted file mode 100644
index a0a28ab8bd..0000000000
--- a/meta-python/recipes-devtools/python/python-flask_1.1.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-flask.inc
diff --git a/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb b/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb
deleted file mode 100644
index dad15ee0f3..0000000000
--- a/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+"
-DESCRPTION = " \
-funcsigs is a backport of the `PEP 362`_ function signature features from \
-Python 3.3's `inspect`_ module. The backport is compatible with Python 2.6, \
-2.7 as well as 3.3 and up. 3.2 was supported by version 0.4, but with \
-setuptools and pip no longer supporting 3.2, we cannot make any statement \
-about 3.2 compatibility. \
-"
-
-HOMEPAGE = "http://funcsigs.readthedocs.org"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d6bc91dc8e5793892189fe7481a2d354"
-
-SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
-SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb b/meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb
deleted file mode 100644
index cb4bba4968..0000000000
--- a/meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy."
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
-
-SRC_URI[md5sum] = "09f24ffd9af9f6cd0f63cb9f4e23d4b2"
-SRC_URI[sha256sum] = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"
-
-inherit pypi setuptools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-future_0.18.2.bb b/meta-python/recipes-devtools/python/python-future_0.18.2.bb
deleted file mode 100644
index d95e1ba774..0000000000
--- a/meta-python/recipes-devtools/python/python-future_0.18.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-future.inc
diff --git a/meta-python/recipes-devtools/python/python-gdata_2.0.18.bb b/meta-python/recipes-devtools/python/python-gdata_2.0.18.bb
deleted file mode 100644
index 897581f194..0000000000
--- a/meta-python/recipes-devtools/python/python-gdata_2.0.18.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Google Data APIs Python Client Library"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.txt;md5=4c8f0e6846e52a7fe4943acf462d808d"
-HOMEPAGE = "http://code.google.com/p/gdata-python-client/"
-
-SRC_URI[md5sum] = "13b6e6dd8f9e3e9a8e005e05a8329408"
-SRC_URI[sha256sum] = "56e7d22de819c22b13ceb0fe1869729b4287f89ebbd4bb55380d7bcf61a1fdb6"
-
-S = "${WORKDIR}/gdata.py-${PV}"
-
-inherit pypi distutils
-
-FILES_${PN} += "${datadir}"
-
-RDEPENDS_${PN} = " \
-    ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-xml \
-"
diff --git a/meta-python/recipes-devtools/python/python-gevent_1.4.0.bb b/meta-python/recipes-devtools/python/python-gevent_1.4.0.bb
deleted file mode 100644
index f13bfd7b73..0000000000
--- a/meta-python/recipes-devtools/python/python-gevent_1.4.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require python-gevent.inc
-inherit setuptools
-
-RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
deleted file mode 100644
index c14976ed32..0000000000
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit distutils
-require python-greenlet.inc
diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
deleted file mode 100644
index 5b19bebf1a..0000000000
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-grpcio-tools.inc
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.19.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.19.0.bb
deleted file mode 100644
index 820bea44b4..0000000000
--- a/meta-python/recipes-devtools/python/python-grpcio_1.19.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-grpcio.inc
-
-RDEPENDS_${PN} += " python-enum34 \
-                    python-futures \
-"
diff --git a/meta-python/recipes-devtools/python/python-html5lib_1.0.1.bb b/meta-python/recipes-devtools/python/python-html5lib_1.0.1.bb
deleted file mode 100644
index f5941a2a11..0000000000
--- a/meta-python/recipes-devtools/python/python-html5lib_1.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-html5lib.inc
diff --git a/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
deleted file mode 100644
index 4e03a654c9..0000000000
--- a/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-humanfriendly.inc
diff --git a/meta-python/recipes-devtools/python/python-humanize_0.5.1.bb b/meta-python/recipes-devtools/python/python-humanize_0.5.1.bb
deleted file mode 100644
index 57693093dd..0000000000
--- a/meta-python/recipes-devtools/python/python-humanize_0.5.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-humanize.inc
diff --git a/meta-python/recipes-devtools/python/python-hyperlink_19.0.0.bb b/meta-python/recipes-devtools/python/python-hyperlink_19.0.0.bb
deleted file mode 100644
index 59a9a5c8dd..0000000000
--- a/meta-python/recipes-devtools/python/python-hyperlink_19.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-hyperlink.inc
diff --git a/meta-python/recipes-devtools/python/python-idna_2.8.bb b/meta-python/recipes-devtools/python/python-idna_2.8.bb
deleted file mode 100644
index 2dcf72a292..0000000000
--- a/meta-python/recipes-devtools/python/python-idna_2.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-idna.inc
diff --git a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
deleted file mode 100644
index 60dd7d0a36..0000000000
--- a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "Python Imaging Library (PIL)"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;beginline=92;endline=120;md5=c4371af4579f1e489cf881c1443dd4ec"
-DEPENDS = "freetype jpeg tiff"
-SRCNAME = "Imaging"
-PR = "r5"
-
-SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
-           file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
-           file://allow.to.disable.some.features.patch \
-           file://fix-freetype-includes.patch \
-           file://remove-host-libdir.patch \
-           file://python-imaging-CVE-2016-2533.patch \
-"
-
-SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
-SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-# There isn't enable/disable option, and lcms is in meta-oe, at least make it explicit when enabled
-# setup.py already has FIXME: add mechanism to explicitly *disable* the use of a library
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[lcms] = ",,lcms"
-
-inherit distutils
-
-do_compile() {
-    export STAGING_LIBDIR=${STAGING_LIBDIR}
-    export STAGING_INCDIR=${STAGING_INCDIR}
-    export LCMS_ENABLED=${@bb.utils.contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
-    distutils_do_compile
-}
-
-do_install() {
-    export STAGING_LIBDIR=${STAGING_LIBDIR}
-    export STAGING_INCDIR=${STAGING_INCDIR}
-    export LCMS_ENABLED=${@bb.utils.contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
-    distutils_do_install
-    install -d ${D}${datadir}/doc/${BPN}/html/
-    install -m 0644 ${S}/README ${D}${datadir}/doc/${BPN}/
-    install -m 0644 ${S}/Docs/* ${D}${datadir}/doc/${BPN}/html/
-
-    # get rid of #!/usr/local/bin/python
-    sed -i -e 's:/usr/local/bin/:${bindir}/env :g' ${D}${bindir}/*
-}
-
-RDEPENDS_${PN} += "python-lang python-stringold"
diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
deleted file mode 100644
index 09c5700db5..0000000000
--- a/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit pypi setuptools
-require python-importlib-metadata.inc
-RDEPENDS_${PN} += "python-configparser \
-                   python-contextlib2 \
-                   python-pathlib2 \
-                   python-compression \
-"
diff --git a/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
deleted file mode 100644
index 139ac0c522..0000000000
--- a/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-incremental.inc
diff --git a/meta-python/recipes-devtools/python/python-inflection_0.3.1.bb b/meta-python/recipes-devtools/python/python-inflection_0.3.1.bb
deleted file mode 100644
index 4a9d497912..0000000000
--- a/meta-python/recipes-devtools/python/python-inflection_0.3.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-inflection.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
diff --git a/meta-python/recipes-devtools/python/python-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python-intervals_1.10.0.bb
deleted file mode 100644
index 3c2a33bbc6..0000000000
--- a/meta-python/recipes-devtools/python/python-intervals_1.10.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-intervals.inc
diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb
deleted file mode 100644
index ed4e6cb197..0000000000
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-ipaddress.inc
diff --git a/meta-python/recipes-devtools/python/python-ipy_1.00.bb b/meta-python/recipes-devtools/python/python-ipy_1.00.bb
deleted file mode 100644
index 587a517e39..0000000000
--- a/meta-python/recipes-devtools/python/python-ipy_1.00.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-ipy.inc
diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.12.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.12.bb
deleted file mode 100644
index c543cf9f97..0000000000
--- a/meta-python/recipes-devtools/python/python-iso8601_0.1.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-iso8601.inc
diff --git a/meta-python/recipes-devtools/python/python-isodate_0.6.0.bb b/meta-python/recipes-devtools/python/python-isodate_0.6.0.bb
deleted file mode 100644
index d48e123461..0000000000
--- a/meta-python/recipes-devtools/python/python-isodate_0.6.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-isodate.inc
diff --git a/meta-python/recipes-devtools/python/python-isort_4.3.21.bb b/meta-python/recipes-devtools/python/python-isort_4.3.21.bb
deleted file mode 100644
index fa46d89b5e..0000000000
--- a/meta-python/recipes-devtools/python/python-isort_4.3.21.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-isort.inc
diff --git a/meta-python/recipes-devtools/python/python-itsdangerous_1.1.0.bb b/meta-python/recipes-devtools/python/python-itsdangerous_1.1.0.bb
deleted file mode 100644
index 8c99cb4ca7..0000000000
--- a/meta-python/recipes-devtools/python/python-itsdangerous_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit pypi setuptools
-require python-itsdangerous.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-zlib \
-"
diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb b/meta-python/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
deleted file mode 100644
index ed34740e80..0000000000
--- a/meta-python/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-javaobj-py3.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.10.3.bb b/meta-python/recipes-devtools/python/python-jinja2_2.10.3.bb
deleted file mode 100644
index 5233cf40c0..0000000000
--- a/meta-python/recipes-devtools/python/python-jinja2_2.10.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit pypi setuptools
-require python-jinja2.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-lang \
-    ${PYTHON_PN}-re \
-    ${PYTHON_PN}-textutils \
-"
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb
deleted file mode 100644
index 90cd318026..0000000000
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.24.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-jsonpatch.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_2.0.bb b/meta-python/recipes-devtools/python/python-jsonpointer_2.0.bb
deleted file mode 100644
index e13a776adb..0000000000
--- a/meta-python/recipes-devtools/python/python-jsonpointer_2.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-jsonpointer.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb b/meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb
deleted file mode 100644
index b677c646e7..0000000000
--- a/meta-python/recipes-devtools/python/python-jsonschema_3.2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit pypi setuptools
-require python-jsonschema.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-argparse \
-    ${PYTHON_PN}-contextlib \
-    ${PYTHON_PN}-functools32 \
-    ${PYTHON_PN}-lang \
-    ${PYTHON_PN}-re \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-textutils \ 
-"
diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
deleted file mode 100644
index df4d60bffe..0000000000
--- a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-lazy-object-proxy.inc
diff --git a/meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb b/meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb
deleted file mode 100644
index 386da2daa5..0000000000
--- a/meta-python/recipes-devtools/python/python-linecache2_1.0.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A backport of linecache to older supported Pythons"
-HOMEPAGE = "https://github.com/testing-cabal/linecache2"
-LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=19;endline=19;md5=368ddc8588431c180ae7c33f4fb57519"
-
-DEPENDS = "${PYTHON_PN}-pbr-native"
-
-SRC_URI[md5sum] = "7b25d0289ec36bff1f9e63c4329ce65c"
-SRC_URI[sha256sum] = "4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db78e97c"
-
-inherit pypi setuptools
-
-CLEAN_BROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb b/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
deleted file mode 100644
index 20ea018045..0000000000
--- a/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Platform-independent file locking module"
-HOMEPAGE = "http://launchpad.net/pylockfile"
-SECTION = "devel/python"
-
-RDEPENDS_${PN} = "python-threading"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "a6a1a82957a23afdf44cfdd039b65ff9"
-SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799"
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
diff --git a/meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb b/meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb
deleted file mode 100644
index 2cfe3012e0..0000000000
--- a/meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-lrparsing.inc
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.4.2.bb b/meta-python/recipes-devtools/python/python-lxml_4.4.2.bb
deleted file mode 100644
index 81ccb12d87..0000000000
--- a/meta-python/recipes-devtools/python/python-lxml_4.4.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-lxml.inc
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
deleted file mode 100644
index c612fcdc58..0000000000
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-m2crypto.inc
diff --git a/meta-python/recipes-devtools/python/python-mako_1.1.0.bb b/meta-python/recipes-devtools/python/python-mako_1.1.0.bb
deleted file mode 100644
index 3372eeb28c..0000000000
--- a/meta-python/recipes-devtools/python/python-mako_1.1.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-mako.inc
diff --git a/meta-python/recipes-devtools/python/python-markupsafe_1.1.1.bb b/meta-python/recipes-devtools/python/python-markupsafe_1.1.1.bb
deleted file mode 100644
index 05bbe8a357..0000000000
--- a/meta-python/recipes-devtools/python/python-markupsafe_1.1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-markupsafe.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-re"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
deleted file mode 100644
index 6b63cd7802..0000000000
--- a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "McCabe checker, plugin for flake8"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=f8b50fba1711ecac6bcdb6324f85a66d"
-
-SRC_URI += " \
-           file://0001-python-mccabe-remove-unnecessary-setup_requires-pyte.patch \
-"
-
-SRC_URI[md5sum] = "8c425db05f310adcd4bb174b991f26f5"
-SRC_URI[sha256sum] = "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca49822688642207b"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += " \
-    python-prettytable \
-    python-cmd2 \
-    python-pyparsing"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-mock_3.0.5.bb b/meta-python/recipes-devtools/python/python-mock_3.0.5.bb
deleted file mode 100644
index db71066495..0000000000
--- a/meta-python/recipes-devtools/python/python-mock_3.0.5.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "A Python Mocking and Patching Library for Testing"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
-
-SRC_URI[md5sum] = "d834a46d9a129be3e76fdcc99751e82c"
-SRC_URI[sha256sum] = "83657d894c90d5681d62155c82bda9c1187827525880eda8ff5df4ec813437c3"
-
-inherit pypi setuptools
-
-DEPENDS += " \
-    python-pbr-native"
-
-RDEPENDS_${PN} += " \
-    python-prettytable \
-    python-cmd2 \
-    python-pyparsing \
-    python-mccabe \
-    python-pep8 \
-    python-pyflakes \
-    python-pbr \
-    python-funcsigs \
-"
diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.5.bb b/meta-python/recipes-devtools/python/python-monotonic_1.5.bb
deleted file mode 100644
index 01e7b1ca0a..0000000000
--- a/meta-python/recipes-devtools/python/python-monotonic_1.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
-
-SRC_URI[md5sum] = "9f81cb0e5966479754453dea2b6822f4"
-SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-io ${PYTHON_PN}-re ${PYTHON_PN}-threading"
diff --git a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
deleted file mode 100644
index 6c44df40a3..0000000000
--- a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit pypi setuptools
-require python-more-itertools.inc
-
-SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
-SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
-
-PE = "1"
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.6.2.bb b/meta-python/recipes-devtools/python/python-msgpack_0.6.2.bb
deleted file mode 100644
index 2c2c8f2add..0000000000
--- a/meta-python/recipes-devtools/python/python-msgpack_0.6.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-msgpack.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
deleted file mode 100644
index 9cd881a3ef..0000000000
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-ndg-httpsclient.inc
-inherit pypi setuptools update-alternatives
-
-ALTERNATIVE_${PN} = "ndg_httpclient"
-ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
-ALTERNATIVE_PRIORITY = "20"
diff --git a/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
deleted file mode 100644
index ca5a79a788..0000000000
--- a/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-netaddr.inc
-inherit setuptools
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-textutils \
-"
diff --git a/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
deleted file mode 100644
index c4aa849713..0000000000
--- a/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-netifaces.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-networkx_2.2.bb b/meta-python/recipes-devtools/python/python-networkx_2.2.bb
deleted file mode 100644
index 648f0312f6..0000000000
--- a/meta-python/recipes-devtools/python/python-networkx_2.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-networkx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3376ff7c9c58048c62d91431f7f08cde"
-
-SRC_URI[md5sum] = "82608a3686fb3e61f20cf13bfd3c1b4a"
-SRC_URI[sha256sum] = "45e56f7ab6fe81652fb4bc9f44faddb0e9025f469f602df14e3b2551c2ea5c8b"
-
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-numeric_24.2.bb b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
deleted file mode 100644
index c91d77c81b..0000000000
--- a/meta-python/recipes-devtools/python/python-numeric_24.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A sophisticated Numeric Processing Package for Python"
-SECTION = "devel/python"
-LICENSE = "PSF & LLNL"
-LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
-
-PR = "ml3"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz \
-           file://0001-it-tries-to-define-this-function-differently-than-it.patch \
-"
-S = "${WORKDIR}/Numeric-${PV}"
-
-inherit distutils
-
-SRC_URI[md5sum] = "2ae672656e06716a149acb048cca3093"
-SRC_URI[sha256sum] = "5f72e729eb6ff57442f2a38bfc9931738b59e5077928e2e70d22b4610ff15258"
diff --git a/meta-python/recipes-devtools/python/python-packaging_20.0.bb b/meta-python/recipes-devtools/python/python-packaging_20.0.bb
deleted file mode 100644
index 55d0746bb5..0000000000
--- a/meta-python/recipes-devtools/python/python-packaging_20.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-packaging.inc
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.5.0.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
deleted file mode 100644
index a1031176e4..0000000000
--- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-paho-mqtt.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-pam_1.8.2.bb b/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
deleted file mode 100644
index bac3496186..0000000000
--- a/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Python PAM module using ctypes, py3/py2."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=64326d42471b493c5c088305364ad5da"
-
-SRC_URI[md5sum] = "db71b6b999246fb05d78ecfbe166629d"
-SRC_URI[sha256sum] = "26efe4e79b869b10f97cd8c4a6bbb04a4e54d41186364e975b4108c9c071812c"
-
-PYPI_PACKAGE = "python-pam"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "libpam"
-
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "pam"
diff --git a/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
deleted file mode 100644
index 8e10e801ca..0000000000
--- a/meta-python/recipes-devtools/python/python-parse-type_0.4.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-parse-type.inc
diff --git a/meta-python/recipes-devtools/python/python-parse_1.14.0.bb b/meta-python/recipes-devtools/python/python-parse_1.14.0.bb
deleted file mode 100644
index d31ccc72a1..0000000000
--- a/meta-python/recipes-devtools/python/python-parse_1.14.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-parse.inc
diff --git a/meta-python/recipes-devtools/python/python-passlib_1.7.2.bb b/meta-python/recipes-devtools/python/python-passlib_1.7.2.bb
deleted file mode 100644
index 11c598a084..0000000000
--- a/meta-python/recipes-devtools/python/python-passlib_1.7.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-passlib.inc
diff --git a/meta-python/recipes-devtools/python/python-paste_3.2.3.bb b/meta-python/recipes-devtools/python/python-paste_3.2.3.bb
deleted file mode 100644
index c3d4fddf81..0000000000
--- a/meta-python/recipes-devtools/python/python-paste_3.2.3.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Tools for using a Web Server Gateway Interface stack"
-HOMEPAGE = "http://pythonpaste.org/"
-LICENSE = "MIT"
-RDEPENDS_${PN} = "python-six"
-
-LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
-
-SRC_URI[md5sum] = "7dc6dbd20e358dd95bd42eef5c6cc84c"
-SRC_URI[sha256sum] = "8bdc7f6be907eed7cd63868c79d88af2b87d02d840fb5acfc93d4bda572b1567"
-
-PYPI_PACKAGE = "Paste"
-inherit pypi setuptools
-
-FILES_${PN} += "/usr/lib/*"
-
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
diff --git a/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
deleted file mode 100644
index 6317e1c165..0000000000
--- a/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit pypi setuptools
-require python-pathlib2.inc
-
-RDEPENDS_${PN} += "python-scandir \
-                   python-misc \
-"
diff --git a/meta-python/recipes-devtools/python/python-pbr_5.4.4.bb b/meta-python/recipes-devtools/python/python-pbr_5.4.4.bb
deleted file mode 100644
index 9d7d8d7b0b..0000000000
--- a/meta-python/recipes-devtools/python/python-pbr_5.4.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-inherit setuptools
-# The inc file is in oe-core
-require recipes-devtools/python/python-pbr.inc
-
-SRC_URI[md5sum] = "65cdc32e1a1ff56d481fc15aa8caf988"
-SRC_URI[sha256sum] = "139d2625547dbfa5fb0b81daebb39601c478c21956dc57e2e07b74450a8c506b"
-
-do_install_append() {
-        if [ -f ${D}${bindir}/pbr ]; then
-                mv ${D}${bindir}/pbr ${D}${bindir}/pbr-2
-        fi
-}
-
diff --git a/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
deleted file mode 100644
index 54ce9781af..0000000000
--- a/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python style guide checker"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
-
-SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
-SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += " \
-    python-prettytable \
-    python-cmd2 \
-    python-pyparsing"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python-periphery_2.0.1.bb
deleted file mode 100644
index 8d0240ae20..0000000000
--- a/meta-python/recipes-devtools/python/python-periphery_2.0.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit pypi setuptools
-require python-periphery.inc
-
-SRC_URI[md5sum] = "1d958f02575d4a19734ee2dd92336157"
-SRC_URI[sha256sum] = "5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec"
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.7.0.bb b/meta-python/recipes-devtools/python/python-pexpect_4.7.0.bb
deleted file mode 100644
index 1c46b47a21..0000000000
--- a/meta-python/recipes-devtools/python/python-pexpect_4.7.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pexpect.inc
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python-pika_1.1.0.bb
deleted file mode 100644
index f7e0198673..0000000000
--- a/meta-python/recipes-devtools/python/python-pika_1.1.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pika.inc
diff --git a/meta-python/recipes-devtools/python/python-pint_0.9.bb b/meta-python/recipes-devtools/python/python-pint_0.9.bb
deleted file mode 100644
index 480f088721..0000000000
--- a/meta-python/recipes-devtools/python/python-pint_0.9.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pint.inc
diff --git a/meta-python/recipes-devtools/python/python-pip_19.3.1.bb b/meta-python/recipes-devtools/python/python-pip_19.3.1.bb
deleted file mode 100644
index 2827a1256a..0000000000
--- a/meta-python/recipes-devtools/python/python-pip_19.3.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "PIP is a tool for installing and managing Python packages"
-HOMEPAGE = "https://pip.pypa.io/"
-LICENSE = "MIT & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
-
-SRC_URI[md5sum] = "1aaaf90fbafc50e7ba1e66ffceb00960"
-SRC_URI[sha256sum] = "21207d76c1031e517668898a6b46a9fb1501c7a4710ef5dfd6a40ad9e6757ea7"
-
-inherit pypi setuptools
-
-# Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
-RDEPENDS_${PN}_class-target = "python-modules python-distribute python-misc"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pluggy_0.13.1.bb b/meta-python/recipes-devtools/python/python-pluggy_0.13.1.bb
deleted file mode 100644
index edcd4f512f..0000000000
--- a/meta-python/recipes-devtools/python/python-pluggy_0.13.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pluggy.inc
diff --git a/meta-python/recipes-devtools/python/python-ply_3.11.bb b/meta-python/recipes-devtools/python/python-ply_3.11.bb
deleted file mode 100644
index 2b6165c5be..0000000000
--- a/meta-python/recipes-devtools/python/python-ply_3.11.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-ply.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-pretend_1.0.9.bb b/meta-python/recipes-devtools/python/python-pretend_1.0.9.bb
deleted file mode 100644
index 73b8ed4d7c..0000000000
--- a/meta-python/recipes-devtools/python/python-pretend_1.0.9.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pretend.inc
diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
deleted file mode 100644
index 69ff25927b..0000000000
--- a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools
-require python-prettytable.inc
-
diff --git a/meta-python/recipes-devtools/python/python-progress_1.5.bb b/meta-python/recipes-devtools/python/python-progress_1.5.bb
deleted file mode 100644
index 80608627a6..0000000000
--- a/meta-python/recipes-devtools/python/python-progress_1.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-progress.inc
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
deleted file mode 100644
index 527c905a83..0000000000
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit pypi setuptools
-require python-prompt-toolkit.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.9.2.bb b/meta-python/recipes-devtools/python/python-protobuf_3.9.2.bb
deleted file mode 100644
index f04fc489f0..0000000000
--- a/meta-python/recipes-devtools/python/python-protobuf_3.9.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-protobuf.inc
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.6.7.bb b/meta-python/recipes-devtools/python/python-psutil_5.6.7.bb
deleted file mode 100644
index 9aabfb2069..0000000000
--- a/meta-python/recipes-devtools/python/python-psutil_5.6.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit pypi setuptools
-require python-psutil.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-ptyprocess_0.6.0.bb b/meta-python/recipes-devtools/python/python-ptyprocess_0.6.0.bb
deleted file mode 100644
index 7ca4587714..0000000000
--- a/meta-python/recipes-devtools/python/python-ptyprocess_0.6.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-ptyprocess.inc
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-py_1.8.1.bb b/meta-python/recipes-devtools/python/python-py_1.8.1.bb
deleted file mode 100644
index 5ad2c19766..0000000000
--- a/meta-python/recipes-devtools/python/python-py_1.8.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-py.inc
diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
deleted file mode 100644
index e5153421b4..0000000000
--- a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyalsaaudio.inc
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb b/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
deleted file mode 100644
index eb78884089..0000000000
--- a/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyasn1-modules.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.8.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.8.bb
deleted file mode 100644
index a13c74dda8..0000000000
--- a/meta-python/recipes-devtools/python/python-pyasn1_0.4.8.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit pypi setuptools
-require python-pyasn1.inc
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-lang \
-"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python-pybind11_2.4.3.bb
deleted file mode 100644
index e56743002e..0000000000
--- a/meta-python/recipes-devtools/python/python-pybind11_2.4.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pybind11.inc
diff --git a/meta-python/recipes-devtools/python/python-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
deleted file mode 100644
index 3158f4b647..0000000000
--- a/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pybluez.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-pycodestyle_2.5.0.bb b/meta-python/recipes-devtools/python/python-pycodestyle_2.5.0.bb
deleted file mode 100644
index ec6c12f2f1..0000000000
--- a/meta-python/recipes-devtools/python/python-pycodestyle_2.5.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit setuptools
-require python-pycodestyle.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-lang"
-
-do_install_append () {
-        if [ -f ${D}${bindir}/pycodestyle ]; then
-                mv ${D}${bindir}/pycodestyle ${D}${bindir}/pycodestyle-2
-        fi
-}
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.19.bb b/meta-python/recipes-devtools/python/python-pycparser_2.19.bb
deleted file mode 100644
index 98742737fd..0000000000
--- a/meta-python/recipes-devtools/python/python-pycparser_2.19.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit pypi setuptools
-require python-pycparser.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
deleted file mode 100644
index e13db01b7f..0000000000
--- a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit distutils
-require python-pycrypto.inc
-
-# We explicitly call distutils_do_install, since we want it to run, but
-# *don't* want the autotools install to run, since this package doesn't
-# provide a "make install" target.
-do_install() {
-       distutils_do_install
-}
diff --git a/meta-python/recipes-devtools/python/python-pycryptodome_3.9.4.bb b/meta-python/recipes-devtools/python/python-pycryptodome_3.9.4.bb
deleted file mode 100644
index c7701eb9f9..0000000000
--- a/meta-python/recipes-devtools/python/python-pycryptodome_3.9.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb b/meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb
deleted file mode 100644
index 7ab259265e..0000000000
--- a/meta-python/recipes-devtools/python/python-pycurl_7.43.0.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pycurl.inc
diff --git a/meta-python/recipes-devtools/python/python-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python-pydbus_0.6.0.bb
deleted file mode 100644
index 1722a80cd3..0000000000
--- a/meta-python/recipes-devtools/python/python-pydbus_0.6.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pydbus.inc
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyelftools_0.25.bb b/meta-python/recipes-devtools/python/python-pyelftools_0.25.bb
deleted file mode 100644
index de42025060..0000000000
--- a/meta-python/recipes-devtools/python/python-pyelftools_0.25.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pyelftools.inc
diff --git a/meta-python/recipes-devtools/python/python-pyexpect_1.0.19.bb b/meta-python/recipes-devtools/python/python-pyexpect_1.0.19.bb
deleted file mode 100644
index d26beb7944..0000000000
--- a/meta-python/recipes-devtools/python/python-pyexpect_1.0.19.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pyexpect.inc
diff --git a/meta-python/recipes-devtools/python/python-pyfirmata_1.1.0.bb b/meta-python/recipes-devtools/python/python-pyfirmata_1.1.0.bb
deleted file mode 100644
index d77e0f3853..0000000000
--- a/meta-python/recipes-devtools/python/python-pyfirmata_1.1.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools
-require python-pyfirmata.inc
-
diff --git a/meta-python/recipes-devtools/python/python-pyflakes_2.1.1.bb b/meta-python/recipes-devtools/python/python-pyflakes_2.1.1.bb
deleted file mode 100644
index 1c03f39908..0000000000
--- a/meta-python/recipes-devtools/python/python-pyflakes_2.1.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "passive checker of Python programs"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=5127315117a8561a1504343d59620647"
-
-SRC_URI[md5sum] = "a0f71a15724e553c46e03ba5ed56703c"
-SRC_URI[sha256sum] = "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-prettytable \
-    ${PYTHON_PN}-cmd2 \
-    ${PYTHON_PN}-pyparsing"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb
deleted file mode 100644
index cb08f30a67..0000000000
--- a/meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require python-pyflame.inc
-
-# v1.6.7
-SRCREV = "c151d2f34737f28a1f5266a003b2b0720bbd9f96"
diff --git a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
deleted file mode 100644
index 14e967db88..0000000000
--- a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "A Python module for working with OpenPGP messages"
-DESCRIPTION = "PyGPGME is a Python module that lets you sign, verify, \
-               encrypt and decrypt messages using the OpenPGP format."
-HOMEPAGE = "https://launchpad.net/pygpgme"
-
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"
-
-SRC_URI = "file://run-ptest \
-           file://0001-reflect-2.1-reporting-for-key-imports.patch \
-           file://0002-passphrase_cb-is-deprecated.patch \
-           file://0003-handle-generic-error-when-no-passphrase-callback-pre.patch \
-"
-
-SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
-SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
-
-DEPENDS += "gpgme"
-RDEPENDS_${PN} += "gnupg"
-
-inherit pypi setuptools ptest
-
-do_install_ptest(){
-    install ${S}/test_all.py ${D}${PTEST_PATH}
-    cp -r ${S}/tests ${D}${PTEST_PATH}
-}
diff --git a/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
deleted file mode 100644
index 8dbb79a428..0000000000
--- a/meta-python/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Hamcrest framework for matcher objects"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
-
-PYPI_PACKAGE = "PyHamcrest"
-
-SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
-SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.11.bb b/meta-python/recipes-devtools/python/python-pyiface_0.0.11.bb
deleted file mode 100644
index 854cb30eee..0000000000
--- a/meta-python/recipes-devtools/python/python-pyiface_0.0.11.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pyiface.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
deleted file mode 100644
index 0c9a2c72e1..0000000000
--- a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-pyinotify.inc
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-pyjks_19.0.0.bb b/meta-python/recipes-devtools/python/python-pyjks_19.0.0.bb
deleted file mode 100644
index ce99f28350..0000000000
--- a/meta-python/recipes-devtools/python/python-pyjks_19.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyjks.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyjwt_1.7.1.bb b/meta-python/recipes-devtools/python/python-pyjwt_1.7.1.bb
deleted file mode 100644
index f0a77b674b..0000000000
--- a/meta-python/recipes-devtools/python/python-pyjwt_1.7.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyjwt.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-pylint_1.8.3.bb b/meta-python/recipes-devtools/python/python-pylint_1.8.3.bb
deleted file mode 100644
index 7b51d3fbd5..0000000000
--- a/meta-python/recipes-devtools/python/python-pylint_1.8.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools python-dir
-require python-pylint.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.119.1.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.119.1.bb
deleted file mode 100644
index 1b1fbe956e..0000000000
--- a/meta-python/recipes-devtools/python/python-pymisp_2.4.119.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pymisp.inc
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.10.1.bb b/meta-python/recipes-devtools/python/python-pymongo_3.10.1.bb
deleted file mode 100644
index b1778b2f13..0000000000
--- a/meta-python/recipes-devtools/python/python-pymongo_3.10.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb b/meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb
deleted file mode 100644
index 27d097ee6b..0000000000
--- a/meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pymysql.inc
diff --git a/meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb
deleted file mode 100644
index c45ad6ad66..0000000000
--- a/meta-python/recipes-devtools/python/python-pynetlinux_1.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pynetlinux.inc
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_19.1.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_19.1.0.bb
deleted file mode 100644
index b7d5146130..0000000000
--- a/meta-python/recipes-devtools/python/python-pyopenssl_19.1.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyopenssl.inc
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.4.6.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.4.6.bb
deleted file mode 100644
index 90217f3c3e..0000000000
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.4.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pyparsing.inc
diff --git a/meta-python/recipes-devtools/python/python-pyperclip_1.7.0.bb b/meta-python/recipes-devtools/python/python-pyperclip_1.7.0.bb
deleted file mode 100644
index 6c9fcbd84e..0000000000
--- a/meta-python/recipes-devtools/python/python-pyperclip_1.7.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit setuptools
-require python-pyperclip.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-contextlib \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-pyperf_1.7.0.bb b/meta-python/recipes-devtools/python/python-pyperf_1.7.0.bb
deleted file mode 100644
index a9d5c74883..0000000000
--- a/meta-python/recipes-devtools/python/python-pyperf_1.7.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-pyperf.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-statistics"
diff --git a/meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb b/meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb
deleted file mode 100644
index e8ef1aa12b..0000000000
--- a/meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pyrex_${PV}.bb
-inherit native pythonnative
-DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
-PR = "r3"
diff --git a/meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb
deleted file mode 100644
index c4dd2e69b0..0000000000
--- a/meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Language for writing Python extension modules"
-DESCRIPTION = "Pyrex is a language specially designed for writing Python extension modules. \
-It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
-and the messy, low-level world of C."
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
-SRCNAME = "Pyrex"
-PR = "r4"
-
-SRC_URI = "\
-  http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-  file://pyrex-fix-optimized-mode.patch \
-"
-
-SRC_URI[md5sum] = "515dee67d15d4393841e2d60e8341947"
-SRC_URI[sha256sum] = "5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699fb6b50"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-FILES_${PN} += "${datadir}${base_libdir}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.5.7.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.5.7.bb
deleted file mode 100644
index f25f1b4ab3..0000000000
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.5.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-pyroute2.inc
-inherit setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-pyrsistent_0.15.7.bb b/meta-python/recipes-devtools/python/python-pyrsistent_0.15.7.bb
deleted file mode 100644
index 832eb80381..0000000000
--- a/meta-python/recipes-devtools/python/python-pyrsistent_0.15.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pyrsistent.inc
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
deleted file mode 100644
index fd852a2bf8..0000000000
--- a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-pyserial.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.3.4.bb b/meta-python/recipes-devtools/python/python-pysmi_0.3.4.bb
deleted file mode 100644
index 43aa4b84c7..0000000000
--- a/meta-python/recipes-devtools/python/python-pysmi_0.3.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "SNMP SMI/MIB Parser"
-DESCRIPTION = "A pure-Python implementation of SNMP/SMI MIB \
-  parsing and conversion library. Can produce PySNMP MIB modules. \
-"
-HOMEPAGE = "https://pypi.python.org/pypi/pysmi"
-SECTION = "devel/python"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a088b5c72b59d51a5368ad3b18e219bf"
-
-SRC_URI[md5sum] = "10a9dd140ad512eed9f37344df83ce9d"
-SRC_URI[sha256sum] = "bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e4e8f7c"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "python-ply"
diff --git a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
deleted file mode 100644
index 8883df9d8c..0000000000
--- a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "A pure-Python SNMPv1/v2c/v3 library"
-DESCRIPTION = "SNMP v1/v2c/v3 engine and apps written in pure-Python. \
-  Supports Manager/Agent/Proxy roles, scriptable MIBs, asynchronous \
-  operation (asyncio, twisted, asyncore) and multiple transports.\
-"
-HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
-
-SRCNAME = "pysnmp"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "6d1b514997326bed18f1ae1510f6b1c9"
-SRC_URI[sha256sum] = "d5d1e59780126e963dd92e25993b783295734e71bef181f602e51f7393260441"
-
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-pycrypto \
-                   python-pyasn1 \
-                   python-pysmi \
-"
diff --git a/meta-python/recipes-devtools/python/python-pysocks_1.7.1.bb b/meta-python/recipes-devtools/python/python-pysocks_1.7.1.bb
deleted file mode 100644
index 8a24e4c49a..0000000000
--- a/meta-python/recipes-devtools/python/python-pysocks_1.7.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pysocks.inc
diff --git a/meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb b/meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb
deleted file mode 100644
index 95938f2b68..0000000000
--- a/meta-python/recipes-devtools/python/python-pysqlite_2.8.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pysqlite.inc
diff --git a/meta-python/recipes-devtools/python/python-pystache_0.5.4.bb b/meta-python/recipes-devtools/python/python-pystache_0.5.4.bb
deleted file mode 100644
index a455012471..0000000000
--- a/meta-python/recipes-devtools/python/python-pystache_0.5.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pystache.inc
diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
deleted file mode 100644
index 2b6ee85503..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-pytest-helpers-namespace.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} += " \
-    python-pytest \
-    "
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_5.2.bb b/meta-python/recipes-devtools/python/python-pytest-runner_5.2.bb
deleted file mode 100644
index 1765a732d0..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest-runner_5.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools
-require python-pytest-runner.inc
-
-# Dependency only exists for python2
-RDEPENDS_${PN} += "python-argparse python-compiler"
diff --git a/meta-python/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb b/meta-python/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
deleted file mode 100644
index 8a9b83e3df..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-pytest-tempdir.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} += " \
-    python-pytest \
-    "
diff --git a/meta-python/recipes-devtools/python/python-pytest_5.3.2.bb b/meta-python/recipes-devtools/python/python-pytest_5.3.2.bb
deleted file mode 100644
index 39e50aca97..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest_5.3.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit pypi setuptools
-require python-pytest.inc
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-argparse \
-    ${PYTHON_PN}-compiler \
-    ${PYTHON_PN}-funcsigs \
-"
-ALTERNATIVE_PRIORITY = "10"
diff --git a/meta-python/recipes-devtools/python/python-pytz_2019.3.bb b/meta-python/recipes-devtools/python/python-pytz_2019.3.bb
deleted file mode 100755
index f2ffc596f8..0000000000
--- a/meta-python/recipes-devtools/python/python-pytz_2019.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pytz.inc
diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
deleted file mode 100644
index a3e15014a4..0000000000
--- a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-pyudev.inc
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-contextlib \
-    ${PYTHON_PN}-subprocess \
-"
-
-inherit pypi setuptools
-
diff --git a/meta-python/recipes-devtools/python/python-pyusb_1.0.2.bb b/meta-python/recipes-devtools/python/python-pyusb_1.0.2.bb
deleted file mode 100644
index 99a795b225..0000000000
--- a/meta-python/recipes-devtools/python/python-pyusb_1.0.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pyusb.inc
diff --git a/meta-python/recipes-devtools/python/python-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python-pyyaml_5.3.bb
deleted file mode 100644
index 5a4c92d88f..0000000000
--- a/meta-python/recipes-devtools/python/python-pyyaml_5.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyyaml.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb
deleted file mode 100644
index b690106bbb..0000000000
--- a/meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyzmq.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb b/meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb
deleted file mode 100644
index 7ed0f5f9a0..0000000000
--- a/meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-rdflib.inc
diff --git a/meta-python/recipes-devtools/python/python-redis_2.10.6.bb b/meta-python/recipes-devtools/python/python-redis_2.10.6.bb
deleted file mode 100644
index 6c3ca8516c..0000000000
--- a/meta-python/recipes-devtools/python/python-redis_2.10.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-redis.inc
diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb b/meta-python/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
deleted file mode 100644
index 43189150ab..0000000000
--- a/meta-python/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-requests-oauthlib.inc
-inherit pypi setuptools
-
diff --git a/meta-python/recipes-devtools/python/python-requests_2.22.0.bb b/meta-python/recipes-devtools/python/python-requests_2.22.0.bb
deleted file mode 100644
index 0d7a29f745..0000000000
--- a/meta-python/recipes-devtools/python/python-requests_2.22.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-requests.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
deleted file mode 100644
index 29b8a6e0d1..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-rfc3339-validator.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
deleted file mode 100644
index 9dddbb4a99..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-rfc3986-validator.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-rfc3987_1.3.8.bb b/meta-python/recipes-devtools/python/python-rfc3987_1.3.8.bb
deleted file mode 100644
index dcda5aa46e..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3987_1.3.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-rfc3987.inc
diff --git a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
deleted file mode 100644
index 440f69cbf7..0000000000
--- a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-robotframework-seriallibrary.inc
diff --git a/meta-python/recipes-devtools/python/python-robotframework_3.0.4.bb b/meta-python/recipes-devtools/python/python-robotframework_3.0.4.bb
deleted file mode 100644
index ff7dedb559..0000000000
--- a/meta-python/recipes-devtools/python/python-robotframework_3.0.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-robotframework.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-zlib \
-"
diff --git a/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb b/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
deleted file mode 100644
index 9de272417e..0000000000
--- a/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A better directory iterator and faster os.walk()"
-HOMEPAGE = "https://github.com/benhoyt/scandir"
-AUTHOR = "Ben Hoyt"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=482ee62da51806409d432a80eed4e3ea"
-
-SRC_URI = "git://github.com/benhoyt/scandir.git"
-SRCREV = "982e6ba60e7165ef965567eacd7138149c9ce292"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools
-
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-scrypt_0.8.6.bb b/meta-python/recipes-devtools/python/python-scrypt_0.8.6.bb
deleted file mode 100644
index 9fbd00e049..0000000000
--- a/meta-python/recipes-devtools/python/python-scrypt_0.8.6.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools python-dir
-require python-scrypt.inc
-
diff --git a/meta-python/recipes-devtools/python/python-sdnotify_0.3.2.bb b/meta-python/recipes-devtools/python/python-sdnotify_0.3.2.bb
deleted file mode 100644
index 39ae3fb0bd..0000000000
--- a/meta-python/recipes-devtools/python/python-sdnotify_0.3.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools pypi
-require python-sdnotify.inc
diff --git a/meta-python/recipes-devtools/python/python-selectors34_1.2.bb b/meta-python/recipes-devtools/python/python-selectors34_1.2.bb
deleted file mode 100644
index 69545ebbbc..0000000000
--- a/meta-python/recipes-devtools/python/python-selectors34_1.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Backport of the selectors module from Python 3.4"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2fae0222c31d6c10488d4ab93a863af7"
-
-SRC_URI[md5sum] = "bc855a1c8839a811476c019dc07d92dd"
-SRC_URI[sha256sum] = "09f5066337f8a76fb5233f267873f89a27a17c10bf79575954894bb71686451c"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-six \
-    "    
diff --git a/meta-python/recipes-devtools/python/python-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python-semver_2.8.1.bb
deleted file mode 100644
index 0572feb31b..0000000000
--- a/meta-python/recipes-devtools/python/python-semver_2.8.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-semver.inc
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.28.bb b/meta-python/recipes-devtools/python/python-serpent_1.28.bb
deleted file mode 100644
index 0db3cf98aa..0000000000
--- a/meta-python/recipes-devtools/python/python-serpent_1.28.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-serpent.inc
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
deleted file mode 100644
index 64b36e3a01..0000000000
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-setuptools-scm.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
diff --git a/meta-python/recipes-devtools/python/python-sh_1.12.14.bb b/meta-python/recipes-devtools/python/python-sh_1.12.14.bb
deleted file mode 100644
index 7cb5140d2d..0000000000
--- a/meta-python/recipes-devtools/python/python-sh_1.12.14.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-sh.inc
-inherit setuptools
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-contextlib \
-    ${PYTHON_PN}-lang \
-    ${PYTHON_PN}-textutils \
-"
diff --git a/meta-python/recipes-devtools/python/python-sijax_0.3.2.bb b/meta-python/recipes-devtools/python/python-sijax_0.3.2.bb
deleted file mode 100644
index 4226c42355..0000000000
--- a/meta-python/recipes-devtools/python/python-sijax_0.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "An easy to use AJAX library for Python based on jQuery.ajax"
-HOMEPAGE = "https://github.com/spantaleev/sijax-python"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=16e213d75641a392478df50cf0841903"
-
-PYPI_PACKAGE = "Sijax"
-inherit setuptools
-require python-sijax.inc
-
-SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb b/meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb
deleted file mode 100644
index 24ad9a9608..0000000000
--- a/meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-simplejson.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
deleted file mode 100644
index 44c9505b33..0000000000
--- a/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "functools.singledispatch from Python 3.4"
-DESCRIPTION = "PEP 443 proposed to expose a mechanism in the functools standard library module \
-in Python 3.4 that provides a simple form of generic programming known as single-dispatch \
-generic functions.  This library is a backport of this functionality to Python 2.6 - 3.3"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
-
-SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
-SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
deleted file mode 100644
index 330fa1ba41..0000000000
--- a/meta-python/recipes-devtools/python/python-slip-dbus_0.6.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-slip-dbus.inc
diff --git a/meta-python/recipes-devtools/python/python-smbus_4.1.bb b/meta-python/recipes-devtools/python/python-smbus_4.1.bb
deleted file mode 100644
index 1b95778877..0000000000
--- a/meta-python/recipes-devtools/python/python-smbus_4.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit distutils
-require python-smbus.inc
diff --git a/meta-python/recipes-devtools/python/python-snakefood_1.4.bb b/meta-python/recipes-devtools/python/python-snakefood_1.4.bb
deleted file mode 100644
index e4a6d767dc..0000000000
--- a/meta-python/recipes-devtools/python/python-snakefood_1.4.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "Dependency graphing for Python"
-DESCRIPTION = " Generate dependency graphs from Python code. This \
-dependency tracker package has a few distinguishing characteristics \
-\
-    * It uses the AST to parse the Python files. This is very reliable, \
-      it always runs.\
-    * No module is loaded. Loading modules to figure out dependencies is \
-      almost always problem, because a lot of codebases run initialization \
-      code in the global namespace, which often requires additional setup. \
-      Snakefood is guaranteed not to have this problem (it just runs, no \
-      matter what).\
-    * It works on a set of files, i.e. you do not have to specify a single \
-      script, you can select a directory (package or else) or a set of files.\
-      It finds all the Python files recursively automatically.\
-    * Automatic/no configuration: your PYTHONPATH is automatically adjusted \
-      to include the required package roots. It figures out the paths that \
-      are required from the files/directories given as input. You should not \
-      have to setup ANYTHING.\
-    * It does not have to automatically 'follow' dependencies between modules,\
-      i.e. by default it only considers the files and directories you specify \
-      on the command-line and their immediate dependencies. It also has an \
-      option to automatically include only the dependencies within the \
-      packages of the files you specify.\
-    * It follows the UNIX philosophy of small programs that do one thing well:\
-      it consists of a few simple programs whose outputs you combine via \
-      pipes. Graphing dependencies always requires the user to filter and \
-      cluster the filenames, so this is appropriate. You can combine it with \
-      your favourite tools, grep, sed, etc.\
-\
-A problem with dependency trackers that run code is that they are unreliable, \
-due to the dynamic nature of Python (the presence of imports within function \
-calls and __import__ hooks makes it almost impossible to always do the right \
-thing). This script aims at being right 99% of the time, and we think that \
-given the trade-offs, 99% is good enough for 99% of the uses.\
-"
-AUTHOR = "Martin Blais <blais@furius.ca>"
-HOMEPAGE = "http://furius.ca/snakefood"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI[md5sum] = "56c88667a33d8909b0aabf2ab6903bdf"
-SRC_URI[sha256sum] = "295784668032254e7391ca99ba7060edd3ae4eca1a330ac11627b18ab5923b77"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = " python-logging python-compiler python-shell"
-# the above modules do not have a -native counterpart
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-python/recipes-devtools/python/python-snimpy_0.8.13.bb b/meta-python/recipes-devtools/python/python-snimpy_0.8.13.bb
deleted file mode 100644
index c885a7fbe0..0000000000
--- a/meta-python/recipes-devtools/python/python-snimpy_0.8.13.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Interactive SNMP tool"
-DESCRIPTION = "Snimpy is a Python-based tool providing a simple interface to build SNMP query"
-HOMEPAGE = "https://pypi.python.org/pypi/snimpy"
-SECTION = "devel/python"
-
-DEPENDS += "libsmi python-cffi-native python-vcversioner-native"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=7c53ab2d1240828625c3e093d049d4f4"
-
-SRC_URI[md5sum] = "7c57acac10226df5bf43e10b929942df"
-SRC_URI[sha256sum] = "98b1790977b435332c03ab2603f6621eeeee69a50453ac01ca55dc7696d08535"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "python-cffi \
-                  python-pycparser \
-                  python-pysnmp \
-                  python-setuptools \
-"
diff --git a/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb b/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
deleted file mode 100644
index e25a6b368b..0000000000
--- a/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-socketio.inc
diff --git a/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
deleted file mode 100644
index 55a673ecc5..0000000000
--- a/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-soupsieve.inc
-
-RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
diff --git a/meta-python/recipes-devtools/python/python-sparts_0.7.3.bb b/meta-python/recipes-devtools/python/python-sparts_0.7.3.bb
deleted file mode 100644
index a1253112c8..0000000000
--- a/meta-python/recipes-devtools/python/python-sparts_0.7.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Library for rapid service prototyping with minimal boilerplate"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0c1554636a564da3baf037ac652fc831"
-
-SRC_URI[md5sum] = "6aa8815652c6f5e5e8e5b2ac1813dd87"
-SRC_URI[sha256sum] = "b25707c349079a7c888155e7fdfd8394df2da9aca9c8eee4e205528cb16b7662"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-               python-subprocess \
-               python-six \
-               python-argparse \
-               python-re \
-               python-shell \
-               python-threading \
-               python-logging \
-               python-unixadmin \
-               python-distutils \
-               python-daemonize \
-               python-futures \
-"
diff --git a/meta-python/recipes-devtools/python/python-speaklater_1.3.bb b/meta-python/recipes-devtools/python/python-speaklater_1.3.bb
deleted file mode 100644
index 56fd55577d..0000000000
--- a/meta-python/recipes-devtools/python/python-speaklater_1.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-speaklater.inc
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.3.12.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
deleted file mode 100644
index 53c8fecf70..0000000000
--- a/meta-python/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-sqlalchemy.inc
diff --git a/meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb b/meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb
deleted file mode 100644
index 2b7773fd4f..0000000000
--- a/meta-python/recipes-devtools/python/python-sqlparse_0.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-sqlparse.inc
diff --git a/meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb b/meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb
deleted file mode 100644
index ee3b822a77..0000000000
--- a/meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A port of Python 3.4 statistics module to Python 2.x"
-DESCRIPTION = " \
-A port of Python 3.4 statistics module to Python 2.*, initially done \
-through the 3to2 tool. This module provides functions for calculating \
-mathematical statistics of numeric (Real-valued) data. \
-"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://statistics/__init__.py;beginline=6;endline=16;md5=b76960ee777a1529f60db47ada2a8e6e"
-
-SRC_URI[md5sum] = "d6d97f3a1a7b3192cff99e0f2b5956c3"
-SRC_URI[sha256sum] = "2dc379b80b07bf2ddd5488cad06b2b9531da4dd31edb04dc9ec0dc226486c138"
-
-inherit pypi setuptools
-
-PYPI_PACKAGE = "statistics"
diff --git a/meta-python/recipes-devtools/python/python-stevedore_1.31.0.bb b/meta-python/recipes-devtools/python/python-stevedore_1.31.0.bb
deleted file mode 100644
index 70a00c1315..0000000000
--- a/meta-python/recipes-devtools/python/python-stevedore_1.31.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-stevedore.inc
diff --git a/meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb b/meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb
deleted file mode 100644
index b01ea99a3f..0000000000
--- a/meta-python/recipes-devtools/python/python-strict-rfc3339_0.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-strict-rfc3339.inc
diff --git a/meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb b/meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb
deleted file mode 100644
index f43706923a..0000000000
--- a/meta-python/recipes-devtools/python/python-subprocess32_3.2.7.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A backport of the subprocess module from Python 3.2 for use on 2.x"
-DESCRIPTION = "This is a backport of the subprocess standard library module \
-from Python 3.2 - 3.5 for use on Python 2. It includes bugfixes and some new \
-features.  On POSIX systems it is guaranteed to be reliable when used in \
-threaded applications. It includes timeout support from Python 3.3 and the \
-run() API from 3.5 but otherwise matches 3.2's API."
-LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d3e62baa8fb96b11a59d3f2cd335d5c0"
-
-SRC_URI[md5sum] = "824c801e479d3e916879aae3e9c15e16"
-SRC_URI[sha256sum] = "1e450a4a4c53bf197ad6402c564b9f7a53539385918ef8f12bdf430a61036590"
-
-inherit pypi setuptools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-systemd_234.bb b/meta-python/recipes-devtools/python/python-systemd_234.bb
deleted file mode 100644
index 80f2900776..0000000000
--- a/meta-python/recipes-devtools/python/python-systemd_234.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-systemd.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python-toml_0.10.0.bb
deleted file mode 100644
index 3c4acce678..0000000000
--- a/meta-python/recipes-devtools/python/python-toml_0.10.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-toml.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-"
diff --git a/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb b/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
deleted file mode 100644
index 46a20a5eda..0000000000
--- a/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY  = "Tornado-Redis is an asyncronous Redis client for the Tornado Web Server"
-DESCRIPTION = "Tornado-Redis is a Redis client that uses Tornado's native 'tornado-gen' interface. \
-It can be used alongside redis-py in Tornado applications: \
-tornado-redis to subscribe to Pub/Sub notifications and for blocking commands (such as BLPOP, BRPOP, BRPOPLPUSH); \
-redis-py for other commands."
-HOMEPAGE = "https://github.com/leporo/tornado-redis"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ca307e8f37b5fa7f8dbbec033f7db7de"
-
-SRC_URI[md5sum] = "1c7ec0f645d15400871141c1149e6934"
-SRC_URI[sha256sum] = "8fd3b324158291ad5fb7f5f8dc2e8763b2895556bd2a44f2dd721b703c669046"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "python-tornado"
-
-RDEPENDS_${PN}-test += "${PN} python-tornado"
diff --git a/meta-python/recipes-devtools/python/python-tornado_6.0.3.bb b/meta-python/recipes-devtools/python/python-tornado_6.0.3.bb
deleted file mode 100644
index 193a4db7d2..0000000000
--- a/meta-python/recipes-devtools/python/python-tornado_6.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit pypi setuptools
-require python-tornado.inc
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-backports-abc \
-    ${PYTHON_PN}-backports-ssl \
-    ${PYTHON_PN}-singledispatch \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-tqdm_4.41.1.bb b/meta-python/recipes-devtools/python/python-tqdm_4.41.1.bb
deleted file mode 100644
index b3810097e6..0000000000
--- a/meta-python/recipes-devtools/python/python-tqdm_4.41.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-tqdm.inc
diff --git a/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb b/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
deleted file mode 100644
index 696c875c68..0000000000
--- a/meta-python/recipes-devtools/python/python-traceback2_1.4.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A backport of traceback to older supported Pythons"
-HOMEPAGE = "https://github.com/testing-cabal/traceback2"
-LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=31;endline=31;md5=368ddc8588431c180ae7c33f4fb57519"
-
-DEPENDS = "${PYTHON_PN}-pbr-native"
-
-SRC_URI[md5sum] = "9e9723f4d70bfc6308fa992dd193c400"
-SRC_URI[sha256sum] = "05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030"
-
-inherit pypi setuptools
-
-CLEANBROKEN = "1"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-linecache2"
diff --git a/meta-python/recipes-devtools/python/python-twisted_19.10.0.bb b/meta-python/recipes-devtools/python/python-twisted_19.10.0.bb
deleted file mode 100644
index 5903db3e02..0000000000
--- a/meta-python/recipes-devtools/python/python-twisted_19.10.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit pypi setuptools
-require python-twisted.inc
-
-RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
-
-RDEPENDS_${PN} += " \
-    ${PN}-news \
-"
diff --git a/meta-python/recipes-devtools/python/python-twitter_3.8.0.bb b/meta-python/recipes-devtools/python/python-twitter_3.8.0.bb
deleted file mode 100644
index 6a28b08ae6..0000000000
--- a/meta-python/recipes-devtools/python/python-twitter_3.8.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-twitter.inc
-inherit pypi setuptools
-
diff --git a/meta-python/recipes-devtools/python/python-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python-twofish_0.3.0.bb
deleted file mode 100644
index 85b021594b..0000000000
--- a/meta-python/recipes-devtools/python/python-twofish_0.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-twofish.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-typing_3.7.4.1.bb b/meta-python/recipes-devtools/python/python-typing_3.7.4.1.bb
deleted file mode 100644
index 04ce063c98..0000000000
--- a/meta-python/recipes-devtools/python/python-typing_3.7.4.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-typing.inc
diff --git a/meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb b/meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb
deleted file mode 100644
index b7980dd552..0000000000
--- a/meta-python/recipes-devtools/python/python-tzlocal_2.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-tzlocal.inc
diff --git a/meta-python/recipes-devtools/python/python-ujson_1.35.bb b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
deleted file mode 100644
index b3c6ae66fc..0000000000
--- a/meta-python/recipes-devtools/python/python-ujson_1.35.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-ujson.inc
diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.5.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.5.bb
deleted file mode 100644
index bdb3d27f9a..0000000000
--- a/meta-python/recipes-devtools/python/python-unidiff_0.5.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-unidiff.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.25.7.bb b/meta-python/recipes-devtools/python/python-urllib3_1.25.7.bb
deleted file mode 100644
index 6c81f1db9b..0000000000
--- a/meta-python/recipes-devtools/python/python-urllib3_1.25.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-urllib3.inc
diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
deleted file mode 100644
index e6cc4accea..0000000000
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Python vcversioner, automagically update the project's version"
-HOMEPAGE = "https://github.com/habnabit/vcversioner"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=827a7a91a8d20d3c666b665cd96db8e3"
-
-SRC_URI[md5sum] = "aab6ef5e0cf8614a1b1140ed5b7f107d"
-SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-subprocess \
-    "
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb b/meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb
deleted file mode 100644
index 6bfe82e005..0000000000
--- a/meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-versiontools.inc
diff --git a/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb b/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
deleted file mode 100644
index eee25a543b..0000000000
--- a/meta-python/recipes-devtools/python/python-visitor_0.1.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-visitor.inc
diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.6.1.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.6.1.bb
deleted file mode 100644
index d31f2f5ac9..0000000000
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.6.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Python package for parsing and generating vCard and vCalendar files"
-HOMEPAGE = "http://vobject.skyhouseconsulting.com/"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "06357e96a84d55de2a71b36d39f6853e"
-SRC_URI[sha256sum] = "96512aec74b90abb71f6b53898dd7fe47300cc940104c4f79148f0671f790101"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-numbers \
-    "
diff --git a/meta-python/recipes-devtools/python/python-waitress_1.4.2.bb b/meta-python/recipes-devtools/python/python-waitress_1.4.2.bb
deleted file mode 100644
index 26a628ea02..0000000000
--- a/meta-python/recipes-devtools/python/python-waitress_1.4.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools pypi
-require python-waitress.inc
diff --git a/meta-python/recipes-devtools/python/python-wcwidth_0.1.8.bb b/meta-python/recipes-devtools/python/python-wcwidth_0.1.8.bb
deleted file mode 100644
index ef107c16a1..0000000000
--- a/meta-python/recipes-devtools/python/python-wcwidth_0.1.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-wcwidth.inc
diff --git a/meta-python/recipes-devtools/python/python-webcolors_1.8.1.bb b/meta-python/recipes-devtools/python/python-webcolors_1.8.1.bb
deleted file mode 100644
index a0b6708caf..0000000000
--- a/meta-python/recipes-devtools/python/python-webcolors_1.8.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-webcolors.inc
diff --git a/meta-python/recipes-devtools/python/python-webdav_0.1.2.bb b/meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
deleted file mode 100644
index 7a6437dc53..0000000000
--- a/meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "This project aims to provide an object-oriented Python WebDAV client-side library\
-               based on Python`s standard httplib and Greg Stein`s davlib.\
-               The client shall fully support RFCs 4918 (basic specification),\
-               3744 (access control), and 3253 (versioning)."
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/webdav/WebdavClient.py;endline=15;md5=a1520fad859feb7b0d7f05277bc6ce48"
-HOMEPAGE = "http://sourceforge.net/projects/pythonwebdavlib/"
-SRCNAME = "Python_WebDAV_Library"
-DEPENDS = "python"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/pythonwebdavlib/Python%20WebDAV%20Library%20-%20${PV}/${SRCNAME}-${PV}.zip"
-SRC_URI[md5sum] = "8e49e0ecc5b4327c4f752a544ee10e1a"
-SRC_URI[sha256sum] = "72c029ad1e25de950f59c2f1812d009d2c1691b70e4b5b09f1af9006e8fd5f23"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
diff --git a/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
deleted file mode 100644
index 5de2ed1d7b..0000000000
--- a/meta-python/recipes-devtools/python/python-webencodings_0.5.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-webencodings.inc
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.16.0.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.16.0.bb
deleted file mode 100644
index db41161b35..0000000000
--- a/meta-python/recipes-devtools/python/python-werkzeug_0.16.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit pypi setuptools
-require python-werkzeug.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-zlib \
-"
diff --git a/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
deleted file mode 100644
index 3b4291f40d..0000000000
--- a/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit pypi setuptools
-require python-whoosh.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-subprocess \
-"
diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.11.2.bb b/meta-python/recipes-devtools/python/python-wrapt_1.11.2.bb
deleted file mode 100644
index bb42476574..0000000000
--- a/meta-python/recipes-devtools/python/python-wrapt_1.11.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-wrapt.inc
diff --git a/meta-python/recipes-devtools/python/python-wtforms_2.2.1.bb b/meta-python/recipes-devtools/python/python-wtforms_2.2.1.bb
deleted file mode 100644
index fdb015e8a5..0000000000
--- a/meta-python/recipes-devtools/python/python-wtforms_2.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-wtforms.inc
diff --git a/meta-python/recipes-devtools/python/python-xlrd_1.2.0.bb b/meta-python/recipes-devtools/python/python-xlrd_1.2.0.bb
deleted file mode 100644
index 3a4d709eb4..0000000000
--- a/meta-python/recipes-devtools/python/python-xlrd_1.2.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-xlrd.inc
diff --git a/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
deleted file mode 100644
index 41e85f4a9a..0000000000
--- a/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-xstatic-font-awesome.inc
diff --git a/meta-python/recipes-devtools/python/python-xstatic_1.0.2.bb b/meta-python/recipes-devtools/python/python-xstatic_1.0.2.bb
deleted file mode 100644
index 8073037044..0000000000
--- a/meta-python/recipes-devtools/python/python-xstatic_1.0.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-xstatic.inc
diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
index 54d4087427..49847a918a 100644
--- a/meta-python/recipes-devtools/python/python-yappi.inc
+++ b/meta-python/recipes-devtools/python/python-yappi.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
 SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
 SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
 
-inherit pypi setuptools
+inherit pypi
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-yappi_1.0.bb b/meta-python/recipes-devtools/python/python-yappi_1.0.bb
deleted file mode 100644
index a3bdde5c2d..0000000000
--- a/meta-python/recipes-devtools/python/python-yappi_1.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-yappi.inc
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-zipp_0.6.0.bb b/meta-python/recipes-devtools/python/python-zipp_0.6.0.bb
deleted file mode 100644
index 85949a2a6f..0000000000
--- a/meta-python/recipes-devtools/python/python-zipp_0.6.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-zipp.inc
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.7.1.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.7.1.bb
deleted file mode 100644
index 1bdfd4d376..0000000000
--- a/meta-python/recipes-devtools/python/python-zopeinterface_4.7.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit pypi setuptools
-require python-zopeinterface.inc
-
-RDEPENDS_${PN}-test += "python-unittest python-doctest"
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
index 440f69cbf7..d82b7b96ae 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
@@ -1,2 +1,2 @@
-inherit pypi setuptools
+inherit pypi setuptools3
 require python-robotframework-seriallibrary.inc
diff --git a/meta-python/recipes-extended/python-cson/python-cson_git.bb b/meta-python/recipes-extended/python-cson/python-cson_git.bb
deleted file mode 100644
index efb338cf28..0000000000
--- a/meta-python/recipes-extended/python-cson/python-cson_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-DESCRIPTION = "Python library for CSON (schema-compressed JSON)"
-HOMEPAGE = "https://github.com/gt3389b/python-cson/"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7709d2635e63ab96973055a23c2a4cac"
-
-SRCREV = "f3f2898c44bb16b951d3e9f2fbf6d1c4158edda2"
-SRC_URI = "git://github.com/gt3389b/python-cson.git"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN}_class-native = ""
-DEPENDS_append_class-native = " python-native "
-
-inherit setuptools
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
deleted file mode 100644
index 422f0dbc43..0000000000
--- a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "PyEphem astronomical calculations"
-HOMEPAGE = "http://rhodesmill.org/pyephem/"
-
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
-
-SRC_URI[md5sum] = "46c035b4a903ff26e0d8ad0f1fe6cc35"
-SRC_URI[sha256sum] = "607148429f85412915e32265779c0cf6d09f73aa97cf1ff0d101ac22c69c4436"
-
-PYPI_PACKAGE = "ephem"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-math \
-    "
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
deleted file mode 100644
index 32aa378cc7..0000000000
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-pyparted.inc
-
-inherit distutils
-
-RDEPENDS_${PN} += "python-stringold python-codecs python-math python-subprocess"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem_0.15.0.bb
deleted file mode 100644
index a699f1c7e3..0000000000
--- a/meta-python/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require python-pywbem.inc
-inherit setuptools update-alternatives
-
-DEPENDS += " \
-    ${PYTHON_PN}-m2crypto-native \
-    ${PYTHON_PN}-typing-native \
-"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-argparse \
-    ${PYTHON_PN}-m2crypto \
-    ${PYTHON_PN}-subprocess \
-"
-
-ALTERNATIVE_${PN} = "mof_compiler pywbemcli wbemcli"
-ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
-ALTERNATIVE_TARGET[pywbemcli] = "${bindir}/pywbemcli"
-ALTERNATIVE_TARGET[wbemcli] = "${bindir}/wbemcli"
-
-ALTERNATIVE_PRIORITY = "30"
-- 
2.25.0


