Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9439.1615561148303858397
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q2JTAElF;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j18so1944105wra.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 06:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uTYwnEVBXQkKlaIiZ2KH97KziY4jQQtozlVQH0g4sx4=;
        b=Q2JTAElF6eFexR5IzXM+AklA9w1t/vtuJ86HVnxVUehqwiyHqpRH0GLUolh0FgWGHY
         F5OEThcMBzMl1ydD/O17qsC8mzllQ0c0WVQ2SAv7/2pCh/Hnd1pnrvlNMWcYUAn1ELZ5
         qIrdKTPqkymNybMRYuLwlMk8xKzO14fRKmMl3kWaytAOqH+05k8vfOKeybdTeHdCkXyM
         ocPuL3asB1msmgvYJmga1G7JqOSe56rrabN7sIoHlp272jwU2W6AkVY2MiVcKHCae1T1
         4VrqB/7uyU55wAkbrdFO60UCI/oWc0gXghPql3CXgb8LCfGIdxONCQa+FBqOqr1DWeqX
         35Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uTYwnEVBXQkKlaIiZ2KH97KziY4jQQtozlVQH0g4sx4=;
        b=iXW0LNutZpqiPEvQv1zn30ASvFXxrRPvhd7WdgtfiJWxj/v4hCFcgoSSftCSOCoORR
         Mu4ik/0zd5bgzoAxUZoPYjsTVqptAwBlwsYPYhrvp/IK4jXFibJm02dUvsjSSLAqPIXS
         W4O6O51kHBA8Cj0ffnG2wEdkMWEbA+OzU3wdXlFqSx4AuzXQB9I5EcK4t/ghec4ZrGu1
         YPEFSUMs4fSX8zW7OG7MhO9TPWoA7LGj/PGIJVory+6HP5g3B/K8/7lc7fE3lGTNb7+y
         u3n2EqfqrZTlWHyc0L6Fw7kEHBdUs2/bGZJQhKLd7S6dhq8QXAq2SZ+K+6/oMOy8Zwwd
         /SQw==
X-Gm-Message-State: AOAM5324Na+JlKzsmQm2q4DHhr4HRDVYshHxYITM4DjHJFXi/bWnNnbn
	0vzTte/9m1seZNnp28X1TkpE2yRgq1I=
X-Google-Smtp-Source: ABdhPJz/lV32eE/xx7R+iVdLQN7B3M+TpHyr5gqEVnQV4uzDGiyxGR6xdp38Oj+X4zVW0Jybnx/CVw==
X-Received: by 2002:adf:e392:: with SMTP id e18mr14923444wrm.189.1615561146051;
        Fri, 12 Mar 2021 06:59:06 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g9sm8352694wrp.14.2021.03.12.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:59:05 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] recipes: add conditional PNBLACKLIST in all recipes except python-native
Date: Fri, 12 Mar 2021 15:59:03 +0100
Message-Id: <20210312145903.1829036-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* python-native is an exception because there is still e.g. chromium depending
  on _native_ python and a lot of people use it in some form, once
  https://bugs.chromium.org/p/chromium/issues/detail?id=942720
  is resolved in stable chromium release the same will be set in python-native

* https://www.python.org/doc/sunset-python-2/
* https://python3statement.org/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-connectivity/gateone/gateone_git.bb                   | 2 ++
 .../python-gsocketpool/python-gsocketpool_0.1.6.bb            | 2 ++
 recipes-connectivity/python-h2/python-h2_3.1.1.bb             | 2 ++
 recipes-connectivity/python-hpack/python-hpack_3.0.0.bb       | 2 ++
 .../python-hyperframe/python-hyperframe_5.2.0.bb              | 2 ++
 recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb      | 2 ++
 .../python-networkmanager/python-networkmanager_2.1.bb        | 2 ++
 recipes-connectivity/python-priority/python-priority_1.3.0.bb | 2 ++
 .../python-pyconnman/python-pyconnman_0.2.0.bb                | 2 ++
 recipes-connectivity/python-pyro4/python-pyro4_4.77.bb        | 2 ++
 recipes-connectivity/python-pytun/python-pytun_2.3.0.bb       | 2 ++
 recipes-connectivity/python-thrift/python-thrift_0.13.0.bb    | 2 ++
 recipes-connectivity/python-txws/python-txws_0.9.1.bb         | 2 ++
 recipes-connectivity/telepathy/telepathy-python_0.15.19.bb    | 2 ++
 recipes-core/images/meta-python2-image-base.bb                | 2 ++
 recipes-core/images/meta-python2-image.bb                     | 2 ++
 recipes-core/images/meta-python2-ptest-image.bb               | 2 ++
 recipes-core/packagegroups/packagegroup-meta-python2.bb       | 2 ++
 recipes-devtools/gyp/gyp-py2_git.bb                           | 2 ++
 recipes-devtools/python/python-alembic_1.3.2.bb               | 2 ++
 recipes-devtools/python/python-amqp_2.5.2.bb                  | 2 ++
 recipes-devtools/python/python-anyjson_0.3.3.bb               | 2 ++
 recipes-devtools/python/python-appdirs_1.4.3.bb               | 2 ++
 recipes-devtools/python/python-asn1crypto_1.3.0.bb            | 2 ++
 recipes-devtools/python/python-astroid_2.3.3.bb               | 2 ++
 recipes-devtools/python/python-atomicwrites_1.3.0.bb          | 2 ++
 recipes-devtools/python/python-attr_0.3.1.bb                  | 2 ++
 recipes-devtools/python/python-attrs_19.3.0.bb                | 2 ++
 recipes-devtools/python/python-automat_0.8.0.bb               | 2 ++
 .../python/python-aws-iot-device-sdk-python_1.4.7.bb          | 2 ++
 recipes-devtools/python/python-babel_2.7.0.bb                 | 2 ++
 recipes-devtools/python/python-backports-abc_0.5.bb           | 2 ++
 .../python/python-backports-functools-lru-cache_1.6.1.bb      | 2 ++
 recipes-devtools/python/python-backports-init_1.0.bb          | 2 ++
 recipes-devtools/python/python-backports-ssl_3.7.0.1.bb       | 2 ++
 recipes-devtools/python/python-bcrypt_3.1.7.bb                | 2 ++
 recipes-devtools/python/python-beautifulsoup4_4.8.2.bb        | 2 ++
 recipes-devtools/python/python-behave_1.2.6.bb                | 2 ++
 recipes-devtools/python/python-bitarray_1.2.1.bb              | 2 ++
 recipes-devtools/python/python-blinker_1.4.bb                 | 2 ++
 recipes-devtools/python/python-booleanpy_3.7.bb               | 2 ++
 recipes-devtools/python/python-cachetools_3.1.1.bb            | 2 ++
 recipes-devtools/python/python-can_3.3.2.bb                   | 2 ++
 recipes-devtools/python/python-certifi_2019.11.28.bb          | 2 ++
 recipes-devtools/python/python-cffi_1.13.2.bb                 | 2 ++
 recipes-devtools/python/python-chardet_3.0.4.bb               | 2 ++
 recipes-devtools/python/python-cheetah_2.4.4.bb               | 2 ++
 recipes-devtools/python/python-click_7.0.bb                   | 2 ++
 recipes-devtools/python/python-cmd2_0.8.9.bb                  | 2 ++
 recipes-devtools/python/python-coloredlogs_10.0.bb            | 2 ++
 recipes-devtools/python/python-configargparse_0.15.1.bb       | 2 ++
 recipes-devtools/python/python-configparser_3.8.1.bb          | 2 ++
 recipes-devtools/python/python-constantly_15.1.0.bb           | 2 ++
 recipes-devtools/python/python-contextlib2_0.6.0.bb           | 2 ++
 recipes-devtools/python/python-cpuset_1.6.bb                  | 2 ++
 recipes-devtools/python/python-crcmod_1.7.bb                  | 2 ++
 recipes-devtools/python/python-cryptography-vectors_2.8.bb    | 2 ++
 recipes-devtools/python/python-cryptography_2.8.bb            | 2 ++
 recipes-devtools/python/python-cython_0.29.14.bb              | 2 ++
 recipes-devtools/python/python-daemon_2.1.2.bb                | 2 ++
 recipes-devtools/python/python-daemonize_2.5.0.bb             | 2 ++
 recipes-devtools/python/python-dateutil_2.8.1.bb              | 2 ++
 recipes-devtools/python/python-dbus_1.2.14.bb                 | 2 ++
 recipes-devtools/python/python-dbusmock_0.16.7.bb             | 2 ++
 recipes-devtools/python/python-decorator_4.4.1.bb             | 2 ++
 recipes-devtools/python/python-deprecated_1.2.7.bb            | 2 ++
 recipes-devtools/python/python-distutils-extra_2.39.bb        | 2 ++
 recipes-devtools/python/python-django-south_1.0.2.bb          | 2 ++
 recipes-devtools/python/python-django_1.11.26.bb              | 2 ++
 recipes-devtools/python/python-djangorestframework_3.9.0.bb   | 2 ++
 recipes-devtools/python/python-dnspython_1.16.0.bb            | 2 ++
 recipes-devtools/python/python-docker-pycreds_0.4.0.bb        | 2 ++
 recipes-devtools/python/python-docker_4.2.0.bb                | 2 ++
 recipes-devtools/python/python-docutils_0.15.2.bb             | 2 ++
 recipes-devtools/python/python-dominate_2.4.0.bb              | 2 ++
 recipes-devtools/python/python-editor_1.0.4.bb                | 2 ++
 recipes-devtools/python/python-engineio_3.11.2.bb             | 2 ++
 recipes-devtools/python/python-enum34_1.1.6.bb                | 2 ++
 recipes-devtools/python/python-epydoc_3.0.1.bb                | 2 ++
 recipes-devtools/python/python-evdev_1.2.0.bb                 | 2 ++
 recipes-devtools/python/python-feedformatter_0.4.bb           | 2 ++
 recipes-devtools/python/python-feedparser_5.2.1.bb            | 2 ++
 recipes-devtools/python/python-flask-babel_0.12.2.bb          | 2 ++
 recipes-devtools/python/python-flask-bcrypt_0.7.1.bb          | 2 ++
 recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb     | 2 ++
 recipes-devtools/python/python-flask-login_0.4.1.bb           | 2 ++
 recipes-devtools/python/python-flask-mail_0.9.1.bb            | 2 ++
 recipes-devtools/python/python-flask-migrate_2.5.2.bb         | 2 ++
 recipes-devtools/python/python-flask-nav_0.6.bb               | 2 ++
 recipes-devtools/python/python-flask-navigation_0.2.0.bb      | 2 ++
 recipes-devtools/python/python-flask-pymongo_2.3.0.bb         | 2 ++
 recipes-devtools/python/python-flask-restful_0.3.7.bb         | 2 ++
 recipes-devtools/python/python-flask-script_2.0.6.bb          | 2 ++
 recipes-devtools/python/python-flask-sijax_0.4.1.bb           | 2 ++
 recipes-devtools/python/python-flask-socketio_4.2.1.bb        | 2 ++
 recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb      | 2 ++
 recipes-devtools/python/python-flask-uploads_0.2.1.bb         | 2 ++
 recipes-devtools/python/python-flask-user_0.6.19.bb           | 2 ++
 recipes-devtools/python/python-flask-wtf_0.14.2.bb            | 2 ++
 recipes-devtools/python/python-flask-xstatic_0.0.1.bb         | 2 ++
 recipes-devtools/python/python-flask_1.1.1.bb                 | 2 ++
 recipes-devtools/python/python-funcsigs_1.0.2.bb              | 2 ++
 recipes-devtools/python/python-functools32_3.2.3-2.bb         | 2 ++
 recipes-devtools/python/python-future_0.18.2.bb               | 2 ++
 recipes-devtools/python/python-futures_3.3.0.bb               | 2 ++
 recipes-devtools/python/python-gdata_2.0.18.bb                | 2 ++
 recipes-devtools/python/python-gevent_1.4.0.bb                | 2 ++
 recipes-devtools/python/python-greenlet_0.4.15.bb             | 2 ++
 recipes-devtools/python/python-grpcio-tools_1.14.1.bb         | 2 ++
 recipes-devtools/python/python-grpcio_1.27.1.bb               | 2 ++
 recipes-devtools/python/python-html5lib_1.0.1.bb              | 2 ++
 recipes-devtools/python/python-humanfriendly_4.18.bb          | 2 ++
 recipes-devtools/python/python-humanize_0.5.1.bb              | 2 ++
 recipes-devtools/python/python-hyperlink_19.0.0.bb            | 2 ++
 recipes-devtools/python/python-hypothesis_4.50.2.bb           | 2 ++
 recipes-devtools/python/python-idna_2.8.bb                    | 2 ++
 recipes-devtools/python/python-imaging_1.1.7.bb               | 2 ++
 recipes-devtools/python/python-importlib-metadata_0.23.bb     | 2 ++
 recipes-devtools/python/python-incremental_17.5.0.bb          | 2 ++
 recipes-devtools/python/python-inflection_0.3.1.bb            | 2 ++
 recipes-devtools/python/python-intervals_1.10.0.bb            | 2 ++
 recipes-devtools/python/python-ipaddress_1.0.23.bb            | 2 ++
 recipes-devtools/python/python-ipy_1.00.bb                    | 2 ++
 recipes-devtools/python/python-iso8601_0.1.12.bb              | 2 ++
 recipes-devtools/python/python-isodate_0.6.0.bb               | 2 ++
 recipes-devtools/python/python-isort_4.3.21.bb                | 2 ++
 recipes-devtools/python/python-itsdangerous_1.1.0.bb          | 2 ++
 recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb         | 2 ++
 recipes-devtools/python/python-jinja2_2.10.3.bb               | 2 ++
 recipes-devtools/python/python-jsmin_2.2.2.bb                 | 2 ++
 recipes-devtools/python/python-jsonpatch_1.24.bb              | 2 ++
 recipes-devtools/python/python-jsonpointer_2.0.bb             | 2 ++
 recipes-devtools/python/python-jsonref_0.2.bb                 | 2 ++
 recipes-devtools/python/python-jsonschema_3.2.0.bb            | 2 ++
 recipes-devtools/python/python-kombu_4.6.6.bb                 | 2 ++
 recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb     | 2 ++
 recipes-devtools/python/python-ldap_3.2.0.bb                  | 2 ++
 recipes-devtools/python/python-license-expression_1.2.bb      | 2 ++
 recipes-devtools/python/python-linecache2_1.0.0.bb            | 2 ++
 recipes-devtools/python/python-lockfile_0.12.2.bb             | 2 ++
 recipes-devtools/python/python-lrparsing_1.0.16.bb            | 2 ++
 recipes-devtools/python/python-lxml_4.4.2.bb                  | 2 ++
 recipes-devtools/python/python-m2crypto_0.30.1.bb             | 2 ++
 recipes-devtools/python/python-mako_1.1.0.bb                  | 2 ++
 recipes-devtools/python/python-markupsafe_1.1.1.bb            | 2 ++
 recipes-devtools/python/python-mccabe_0.4.0.bb                | 2 ++
 recipes-devtools/python/python-mock_3.0.5.bb                  | 2 ++
 recipes-devtools/python/python-monotonic_1.5.bb               | 2 ++
 recipes-devtools/python/python-more-itertools_5.0.0.bb        | 2 ++
 recipes-devtools/python/python-msgpack_0.6.2.bb               | 2 ++
 recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb       | 2 ++
 recipes-devtools/python/python-netaddr_0.7.19.bb              | 2 ++
 recipes-devtools/python/python-netifaces_0.10.9.bb            | 2 ++
 recipes-devtools/python/python-networkx_2.2.bb                | 2 ++
 recipes-devtools/python/python-numeric_24.2.bb                | 2 ++
 recipes-devtools/python/python-packaging_20.0.bb              | 2 ++
 recipes-devtools/python/python-paho-mqtt_1.5.0.bb             | 2 ++
 recipes-devtools/python/python-pam_1.8.2.bb                   | 2 ++
 recipes-devtools/python/python-pamela_0.3.0.bb                | 2 ++
 recipes-devtools/python/python-parse-type_0.4.2.bb            | 2 ++
 recipes-devtools/python/python-parse_1.14.0.bb                | 2 ++
 recipes-devtools/python/python-passlib_1.7.2.bb               | 2 ++
 recipes-devtools/python/python-paste_3.2.3.bb                 | 2 ++
 recipes-devtools/python/python-pathlib2_2.3.5.bb              | 2 ++
 recipes-devtools/python/python-pbr_5.4.4.bb                   | 2 ++
 recipes-devtools/python/python-pep8_1.7.1.bb                  | 2 ++
 recipes-devtools/python/python-periphery_2.0.0.bb             | 2 ++
 recipes-devtools/python/python-pexpect_4.7.0.bb               | 2 ++
 recipes-devtools/python/python-pika_1.1.0.bb                  | 2 ++
 recipes-devtools/python/python-pint_0.9.bb                    | 2 ++
 recipes-devtools/python/python-pip_19.3.1.bb                  | 2 ++
 recipes-devtools/python/python-pluggy_0.13.1.bb               | 2 ++
 recipes-devtools/python/python-ply_3.11.bb                    | 2 ++
 recipes-devtools/python/python-pretend_1.0.9.bb               | 2 ++
 recipes-devtools/python/python-prettytable_0.7.2.bb           | 2 ++
 recipes-devtools/python/python-progress_1.5.bb                | 2 ++
 recipes-devtools/python/python-prompt-toolkit_2.0.10.bb       | 2 ++
 recipes-devtools/python/python-protobuf_3.9.2.bb              | 2 ++
 recipes-devtools/python/python-psutil_5.6.7.bb                | 2 ++
 recipes-devtools/python/python-ptyprocess_0.6.0.bb            | 2 ++
 recipes-devtools/python/python-py_1.8.1.bb                    | 2 ++
 recipes-devtools/python/python-pyalsaaudio_0.8.4.bb           | 2 ++
 recipes-devtools/python/python-pyasn1-modules_0.2.7.bb        | 2 ++
 recipes-devtools/python/python-pyasn1_0.4.8.bb                | 2 ++
 recipes-devtools/python/python-pybind11_2.4.3.bb              | 2 ++
 recipes-devtools/python/python-pybluez_0.22.bb                | 2 ++
 recipes-devtools/python/python-pycodestyle_2.5.0.bb           | 2 ++
 recipes-devtools/python/python-pycparser_2.19.bb              | 2 ++
 recipes-devtools/python/python-pycrypto_2.6.1.bb              | 2 ++
 recipes-devtools/python/python-pycryptodomex_3.9.4.bb         | 2 ++
 recipes-devtools/python/python-pycurl_7.43.0.3.bb             | 2 ++
 recipes-devtools/python/python-pydbus_0.6.0.bb                | 2 ++
 recipes-devtools/python/python-pyelftools_0.25.bb             | 2 ++
 recipes-devtools/python/python-pyexpect_1.0.19.bb             | 2 ++
 recipes-devtools/python/python-pyfirmata_1.1.0.bb             | 2 ++
 recipes-devtools/python/python-pyflakes_2.1.1.bb              | 2 ++
 recipes-devtools/python/python-pyflame_1.6.7.bb               | 2 ++
 recipes-devtools/python/python-pygobject_3.34.0.bb            | 2 ++
 recipes-devtools/python/python-pygpgme_0.3.bb                 | 2 ++
 recipes-devtools/python/python-pyhamcrest_1.9.0.bb            | 2 ++
 recipes-devtools/python/python-pyiface_0.0.11.bb              | 2 ++
 recipes-devtools/python/python-pyinotify_0.9.6.bb             | 2 ++
 recipes-devtools/python/python-pyjks_19.0.0.bb                | 2 ++
 recipes-devtools/python/python-pyjwt_1.7.1.bb                 | 2 ++
 recipes-devtools/python/python-pylint_1.8.3.bb                | 2 ++
 recipes-devtools/python/python-pymisp_2.4.119.1.bb            | 2 ++
 recipes-devtools/python/python-pymongo_3.10.1.bb              | 2 ++
 recipes-devtools/python/python-pymysql_0.9.3.bb               | 2 ++
 recipes-devtools/python/python-pynetlinux_1.1.bb              | 2 ++
 recipes-devtools/python/python-pyopenssl_19.1.0.bb            | 2 ++
 recipes-devtools/python/python-pyparsing_2.4.6.bb             | 2 ++
 recipes-devtools/python/python-pyperclip_1.7.0.bb             | 2 ++
 recipes-devtools/python/python-pyperf_1.7.0.bb                | 2 ++
 recipes-devtools/python/python-pyrex-native_0.9.9.bb          | 2 ++
 recipes-devtools/python/python-pyrex_0.9.9.bb                 | 2 ++
 recipes-devtools/python/python-pyroute2_0.5.7.bb              | 2 ++
 recipes-devtools/python/python-pyrsistent_0.15.7.bb           | 2 ++
 recipes-devtools/python/python-pyrtm_0.4.2.bb                 | 2 ++
 recipes-devtools/python/python-pyserial_3.4.bb                | 2 ++
 recipes-devtools/python/python-pysmi_0.3.4.bb                 | 2 ++
 recipes-devtools/python/python-pysnmp_4.4.9.bb                | 2 ++
 recipes-devtools/python/python-pysocks_1.7.1.bb               | 2 ++
 recipes-devtools/python/python-pysqlite_2.8.3.bb              | 2 ++
 recipes-devtools/python/python-pystache_0.5.4.bb              | 2 ++
 .../python/python-pytest-helpers-namespace_2019.1.8.bb        | 2 ++
 recipes-devtools/python/python-pytest-runner_5.2.bb           | 2 ++
 recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb   | 2 ++
 recipes-devtools/python/python-pytest_4.6.9.bb                | 2 ++
 recipes-devtools/python/python-pytoml_0.1.21.bb               | 2 ++
 recipes-devtools/python/python-pytz_2019.3.bb                 | 2 ++
 recipes-devtools/python/python-pyudev_0.21.0.bb               | 2 ++
 recipes-devtools/python/python-pyusb_1.0.2.bb                 | 2 ++
 recipes-devtools/python/python-pyyaml_5.4.1.bb                | 2 ++
 recipes-devtools/python/python-pyzmq_17.1.0.bb                | 2 ++
 recipes-devtools/python/python-rdflib_4.2.2.bb                | 2 ++
 recipes-devtools/python/python-redis_2.10.6.bb                | 2 ++
 recipes-devtools/python/python-requests-oauthlib_1.3.0.bb     | 2 ++
 recipes-devtools/python/python-requests_2.23.0.bb             | 2 ++
 recipes-devtools/python/python-rfc3339-validator_0.1.1.bb     | 2 ++
 recipes-devtools/python/python-rfc3986-validator_0.1.1.bb     | 2 ++
 recipes-devtools/python/python-rfc3987_1.3.8.bb               | 2 ++
 .../python/python-robotframework-seriallibrary_0.3.1.bb       | 2 ++
 recipes-devtools/python/python-robotframework_3.0.4.bb        | 2 ++
 recipes-devtools/python/python-scandir_1.10.0.bb              | 3 ++-
 recipes-devtools/python/python-scrypt_0.8.6.bb                | 2 ++
 recipes-devtools/python/python-sdnotify_0.3.2.bb              | 2 ++
 recipes-devtools/python/python-selectors34_1.2.bb             | 2 ++
 recipes-devtools/python/python-semver_2.8.1.bb                | 2 ++
 recipes-devtools/python/python-serpent_1.28.bb                | 2 ++
 recipes-devtools/python/python-setuptools-scm_3.3.3.bb        | 2 ++
 recipes-devtools/python/python-setuptools_42.0.2.bb           | 2 ++
 recipes-devtools/python/python-sh_1.12.14.bb                  | 2 ++
 recipes-devtools/python/python-sijax_0.3.2.bb                 | 2 ++
 recipes-devtools/python/python-simplejson_3.17.0.bb           | 2 ++
 recipes-devtools/python/python-singledispatch_3.4.0.3.bb      | 2 ++
 recipes-devtools/python/python-six_1.14.0.bb                  | 2 ++
 recipes-devtools/python/python-slip-dbus_0.6.5.bb             | 2 ++
 recipes-devtools/python/python-smbus_4.1.bb                   | 2 ++
 recipes-devtools/python/python-snakefood_1.4.bb               | 2 ++
 recipes-devtools/python/python-snimpy_0.8.13.bb               | 2 ++
 recipes-devtools/python/python-socketio_4.3.1.bb              | 2 ++
 recipes-devtools/python/python-soupsieve_1.9.4.bb             | 2 ++
 recipes-devtools/python/python-sparts_0.7.3.bb                | 2 ++
 recipes-devtools/python/python-speaklater_1.3.bb              | 2 ++
 recipes-devtools/python/python-sqlalchemy_1.3.12.bb           | 2 ++
 recipes-devtools/python/python-sqlparse_0.3.0.bb              | 2 ++
 recipes-devtools/python/python-statistics_1.0.3.5.bb          | 2 ++
 recipes-devtools/python/python-stevedore_1.31.0.bb            | 2 ++
 recipes-devtools/python/python-strict-rfc3339_0.7.bb          | 2 ++
 recipes-devtools/python/python-subprocess32_3.2.7.bb          | 2 ++
 recipes-devtools/python/python-systemd_234.bb                 | 2 ++
 recipes-devtools/python/python-toml_0.10.0.bb                 | 2 ++
 recipes-devtools/python/python-tornado-redis_2.4.18.bb        | 2 ++
 recipes-devtools/python/python-tornado_6.0.3.bb               | 2 ++
 recipes-devtools/python/python-tqdm_4.41.1.bb                 | 2 ++
 recipes-devtools/python/python-traceback2_1.4.0.bb            | 2 ++
 recipes-devtools/python/python-twisted_19.10.0.bb             | 2 ++
 recipes-devtools/python/python-twitter_3.8.0.bb               | 2 ++
 recipes-devtools/python/python-twofish_0.3.0.bb               | 2 ++
 recipes-devtools/python/python-typing_3.7.4.1.bb              | 2 ++
 recipes-devtools/python/python-tzlocal_2.0.0.bb               | 2 ++
 recipes-devtools/python/python-ujson_1.35.bb                  | 2 ++
 recipes-devtools/python/python-unidiff_0.5.5.bb               | 2 ++
 recipes-devtools/python/python-urllib3_1.25.7.bb              | 2 ++
 recipes-devtools/python/python-vcversioner_2.16.0.0.bb        | 2 ++
 recipes-devtools/python/python-versiontools_1.9.1.bb          | 2 ++
 recipes-devtools/python/python-vine_1.1.4.bb                  | 2 ++
 recipes-devtools/python/python-visitor_0.1.3.bb               | 2 ++
 recipes-devtools/python/python-vobject_0.9.6.1.bb             | 2 ++
 recipes-devtools/python/python-waitress_1.4.2.bb              | 2 ++
 recipes-devtools/python/python-wcwidth_0.1.8.bb               | 2 ++
 recipes-devtools/python/python-webcolors_1.8.1.bb             | 2 ++
 recipes-devtools/python/python-webdav_0.1.2.bb                | 2 ++
 recipes-devtools/python/python-webencodings_0.5.1.bb          | 2 ++
 recipes-devtools/python/python-websocket-client_0.57.0.bb     | 2 ++
 recipes-devtools/python/python-werkzeug_0.16.0.bb             | 2 ++
 recipes-devtools/python/python-which_1.1.0.bb                 | 2 ++
 recipes-devtools/python/python-whoosh_2.7.4.bb                | 2 ++
 recipes-devtools/python/python-wrapt_1.11.2.bb                | 2 ++
 recipes-devtools/python/python-wtforms_2.2.1.bb               | 2 ++
 recipes-devtools/python/python-xlrd_1.2.0.bb                  | 2 ++
 .../python/python-xstatic-font-awesome_4.7.0.0.bb             | 2 ++
 recipes-devtools/python/python-xstatic_1.0.2.bb               | 2 ++
 recipes-devtools/python/python-yappi_1.0.bb                   | 2 ++
 recipes-devtools/python/python-zipp_0.6.0.bb                  | 2 ++
 recipes-devtools/python/python-zopeinterface_4.7.1.bb         | 2 ++
 recipes-devtools/python/python_2.7.18.bb                      | 2 ++
 recipes-extended/python-cson/python-cson_git.bb               | 2 ++
 recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb     | 4 ++++
 recipes-extended/python-pyparted/python-pyparted_git.bb       | 2 ++
 recipes-extended/pywbem/python-pywbem_0.15.0.bb               | 2 ++
 recipes-support/dnssec-conf/dnssec-conf_2.02.bb               | 2 ++
 312 files changed, 626 insertions(+), 1 deletion(-)

diff --git a/recipes-connectivity/gateone/gateone_git.bb b/recipes-connectivity/gateone/gateone_git.bb
index 5d2ca00..83e417c 100644
--- a/recipes-connectivity/gateone/gateone_git.bb
+++ b/recipes-connectivity/gateone/gateone_git.bb
@@ -83,3 +83,5 @@ RDEPENDS_${PN} = "mime-support \
 
 SYSTEMD_SERVICE_${PN} = "gateone.service"
 INITSCRIPT_NAME = "gateone"
+
+PNBLACKLIST[gateone] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb b/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
index 6b6e15a..1100dd3 100644
--- a/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
+++ b/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
@@ -11,3 +11,5 @@ SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-gsocketpool] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-h2/python-h2_3.1.1.bb b/recipes-connectivity/python-h2/python-h2_3.1.1.bb
index 33b4c07..efe7ae3 100644
--- a/recipes-connectivity/python-h2/python-h2_3.1.1.bb
+++ b/recipes-connectivity/python-h2/python-h2_3.1.1.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
 SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-h2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb b/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
index 01bc919..ffeb285 100644
--- a/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
+++ b/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
 SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-hpack] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb b/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
index 2ee0487..4d7a055 100644
--- a/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
+++ b/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
 SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-hyperframe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb b/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
index 62cafa8..ed24992 100644
--- a/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
+++ b/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
@@ -12,3 +12,5 @@ SRC_URI[md5sum] = "8d97961051422f3de315613434982d3b"
 SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-mprpc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
index 53e2f9d..78775e3 100644
--- a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
+++ b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
@@ -16,3 +16,5 @@ python() {
     if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
         raise bb.parse.SkipRecipe('Requires networking-layer to be present to provide networkmanager.')
 }
+
+PNBLACKLIST[python-networkmanager] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-priority/python-priority_1.3.0.bb b/recipes-connectivity/python-priority/python-priority_1.3.0.bb
index 5fdc4db..6aa876d 100644
--- a/recipes-connectivity/python-priority/python-priority_1.3.0.bb
+++ b/recipes-connectivity/python-priority/python-priority_1.3.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "4f1ff52f7fa448e9d9cb46337ae86d1e"
 SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-priority] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
index 770cc4b..e1f5a14 100644
--- a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
+++ b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} += "\
     python-numbers \
     python-pprint \
 "
+
+PNBLACKLIST[python-pyconnman] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb b/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
index 738cf86..a767779 100644
--- a/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
+++ b/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-zlib \
     "
+
+PNBLACKLIST[python-pyro4] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb b/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
index 2bc6a7c..b7e1e26 100644
--- a/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
+++ b/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "5ead86b3391acef239535ebcabeb04d2cdc6b40ab14580d28c6da193c2
 PYPI_PACKAGE = "python-pytun"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-pytun] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb b/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
index 2d51619..f3c4bd8 100644
--- a/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
+++ b/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-threading \
 "
+
+PNBLACKLIST[python-thrift] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-txws/python-txws_0.9.1.bb b/recipes-connectivity/python-txws/python-txws_0.9.1.bb
index f3631cd..c89e769 100644
--- a/recipes-connectivity/python-txws/python-txws_0.9.1.bb
+++ b/recipes-connectivity/python-txws/python-txws_0.9.1.bb
@@ -13,3 +13,5 @@ S = "${WORKDIR}/git"
 
 inherit setuptools
 
+
+PNBLACKLIST[python-txws] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index b7aea24..640296d 100644
--- a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -30,3 +30,5 @@ do_install_append () {
     rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
     rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
 }
+
+PNBLACKLIST[telepathy-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/images/meta-python2-image-base.bb b/recipes-core/images/meta-python2-image-base.bb
index 6b43def..834e928 100644
--- a/recipes-core/images/meta-python2-image-base.bb
+++ b/recipes-core/images/meta-python2-image-base.bb
@@ -5,3 +5,5 @@ IMAGE_INSTALL = "packagegroup-core-boot"
 LICENSE = "MIT"
 
 inherit core-image
+
+PNBLACKLIST[meta-python2-image-base.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/images/meta-python2-image.bb b/recipes-core/images/meta-python2-image.bb
index 9fe75ea..ff3113e 100644
--- a/recipes-core/images/meta-python2-image.bb
+++ b/recipes-core/images/meta-python2-image.bb
@@ -3,3 +3,5 @@ require  meta-python2-image-base.bb
 SUMMARY = "meta-python2 build test image"
 
 IMAGE_INSTALL += "packagegroup-meta-python2"
+
+PNBLACKLIST[meta-python2-image.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/images/meta-python2-ptest-image.bb b/recipes-core/images/meta-python2-ptest-image.bb
index ddf5664..8f9db14 100644
--- a/recipes-core/images/meta-python2-ptest-image.bb
+++ b/recipes-core/images/meta-python2-ptest-image.bb
@@ -3,3 +3,5 @@ require  meta-python2-image-base.bb
 SUMMARY = "meta-python2 ptest test image"
 
 IMAGE_INSTALL += "packagegroup-meta-python2-ptest"
+
+PNBLACKLIST[meta-python2-ptest-image.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 5891cc9..45f2ed7 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -89,3 +89,5 @@ RDEPENDS_packagegroup-meta-python2-ptest = "\
 "
 
 EXCLUDE_FROM_WORLD = "1"
+
+PNBLACKLIST[packagegroup-meta-python2.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/gyp/gyp-py2_git.bb b/recipes-devtools/gyp/gyp-py2_git.bb
index 73d8749..714d5d1 100644
--- a/recipes-devtools/gyp/gyp-py2_git.bb
+++ b/recipes-devtools/gyp/gyp-py2_git.bb
@@ -12,3 +12,5 @@ PV = "0.1+git${SRCPV}"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit setuptools
+
+PNBLACKLIST[gyp-py2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-alembic_1.3.2.bb b/recipes-devtools/python/python-alembic_1.3.2.bb
index 6e53ce8..9c527e5 100644
--- a/recipes-devtools/python/python-alembic_1.3.2.bb
+++ b/recipes-devtools/python/python-alembic_1.3.2.bb
@@ -14,3 +14,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlalchemy \
 "
 inherit pypi setuptools
+
+PNBLACKLIST[python-alembic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-amqp_2.5.2.bb b/recipes-devtools/python/python-amqp_2.5.2.bb
index a8bb4a2..5ae271e 100644
--- a/recipes-devtools/python/python-amqp_2.5.2.bb
+++ b/recipes-devtools/python/python-amqp_2.5.2.bb
@@ -13,3 +13,5 @@ inherit setuptools pypi
 RDEPENDS_${PN} += " \
 	python-vine \
 	"
+
+PNBLACKLIST[python-amqp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-anyjson_0.3.3.bb b/recipes-devtools/python/python-anyjson_0.3.3.bb
index 4fe2edb..6845569 100644
--- a/recipes-devtools/python/python-anyjson_0.3.3.bb
+++ b/recipes-devtools/python/python-anyjson_0.3.3.bb
@@ -11,3 +11,5 @@ SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
 SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-simplejson"
+
+PNBLACKLIST[python-anyjson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-appdirs_1.4.3.bb b/recipes-devtools/python/python-appdirs_1.4.3.bb
index 6f6906b..eb8f687 100644
--- a/recipes-devtools/python/python-appdirs_1.4.3.bb
+++ b/recipes-devtools/python/python-appdirs_1.4.3.bb
@@ -11,3 +11,5 @@ SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
 SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-appdirs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-asn1crypto_1.3.0.bb b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
index 2954eef..3abb699 100644
--- a/recipes-devtools/python/python-asn1crypto_1.3.0.bb
+++ b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
@@ -28,3 +28,5 @@ RDEPENDS_${PN}_class-target += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-asn1crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-astroid_2.3.3.bb b/recipes-devtools/python/python-astroid_2.3.3.bb
index bbd1095..44b0a71 100644
--- a/recipes-devtools/python/python-astroid_2.3.3.bb
+++ b/recipes-devtools/python/python-astroid_2.3.3.bb
@@ -48,3 +48,5 @@ RDEPENDS_${PN}-tests_class-target += "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
 "
+
+PNBLACKLIST[python-astroid] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-atomicwrites_1.3.0.bb b/recipes-devtools/python/python-atomicwrites_1.3.0.bb
index 6b0993a..7cdfe99 100644
--- a/recipes-devtools/python/python-atomicwrites_1.3.0.bb
+++ b/recipes-devtools/python/python-atomicwrites_1.3.0.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "ce11f780a4ce0fce8a55d64494a88178"
 SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-atomicwrites] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-attr_0.3.1.bb b/recipes-devtools/python/python-attr_0.3.1.bb
index 88edf13..1c5903f 100644
--- a/recipes-devtools/python/python-attr_0.3.1.bb
+++ b/recipes-devtools/python/python-attr_0.3.1.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "68b9a503991241fb2df28488686b0e1e"
 SRC_URI[sha256sum] = "9091548058d17f132596e61fa7518e504f76b9a4c61ca7d86e1f96dbf7d4775d"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-attr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-attrs_19.3.0.bb b/recipes-devtools/python/python-attrs_19.3.0.bb
index 505256f..0e39922 100644
--- a/recipes-devtools/python/python-attrs_19.3.0.bb
+++ b/recipes-devtools/python/python-attrs_19.3.0.bb
@@ -24,3 +24,5 @@ RDEPENDS_${PN}_class-target += " \
 "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-attrs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-automat_0.8.0.bb b/recipes-devtools/python/python-automat_0.8.0.bb
index 404fa58..55f5388 100644
--- a/recipes-devtools/python/python-automat_0.8.0.bb
+++ b/recipes-devtools/python/python-automat_0.8.0.bb
@@ -26,3 +26,5 @@ RDEPENDS_${PN} += "\
    ${PYTHON_PN}-attrs \
    ${PYTHON_PN}-six \
 "
+
+PNBLACKLIST[python-automat] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb b/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
index a4d3a47..f067c88 100644
--- a/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
+++ b/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
@@ -44,3 +44,5 @@ FILES_${PN}-examples = "${datadir}/${BPN}/examples"
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+PNBLACKLIST[python-aws-iot-device-sdk-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-babel_2.7.0.bb b/recipes-devtools/python/python-babel_2.7.0.bb
index dba0054..cb23645 100644
--- a/recipes-devtools/python/python-babel_2.7.0.bb
+++ b/recipes-devtools/python/python-babel_2.7.0.bb
@@ -29,3 +29,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-babel] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-abc_0.5.bb b/recipes-devtools/python/python-backports-abc_0.5.bb
index b588a31..d96678b 100644
--- a/recipes-devtools/python/python-backports-abc_0.5.bb
+++ b/recipes-devtools/python/python-backports-abc_0.5.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "7d1936ec183a3586290adf60f6f96764"
 SRC_URI[sha256sum] = "033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-backports-abc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
index aee130f..62cc619 100644
--- a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
+++ b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
@@ -27,3 +27,5 @@ do_install() {
 FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/functools_lru_cache.py"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-backports-functools-lru-cache] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-init_1.0.bb b/recipes-devtools/python/python-backports-init_1.0.bb
index 8b226aa..cbb0351 100644
--- a/recipes-devtools/python/python-backports-init_1.0.bb
+++ b/recipes-devtools/python/python-backports-init_1.0.bb
@@ -25,3 +25,5 @@ do_install() {
 FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-backports-init] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
index 126d0ee..4734e6d 100644
--- a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
+++ b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
@@ -17,3 +17,5 @@ PYPI_PACKAGE = "backports.ssl_match_hostname"
 inherit pypi setuptools python-backports-init
 
 RDEPENDS_${PN} += "${PYTHON_PN}-pkgutil"
+
+PNBLACKLIST[python-backports-ssl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-bcrypt_3.1.7.bb b/recipes-devtools/python/python-bcrypt_3.1.7.bb
index 4e473dd..9da9c47 100644
--- a/recipes-devtools/python/python-bcrypt_3.1.7.bb
+++ b/recipes-devtools/python/python-bcrypt_3.1.7.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-subprocess \
 "
+
+PNBLACKLIST[python-bcrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
index 9f9065e..be7b3fe 100644
--- a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
+++ b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
@@ -25,3 +25,5 @@ RDEPENDS_${PN}_append_class-target = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-beautifulsoup4] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-behave_1.2.6.bb b/recipes-devtools/python/python-behave_1.2.6.bb
index d38486e..61b57af 100644
--- a/recipes-devtools/python/python-behave_1.2.6.bb
+++ b/recipes-devtools/python/python-behave_1.2.6.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-traceback2 \
     "
+
+PNBLACKLIST[python-behave] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-bitarray_1.2.1.bb b/recipes-devtools/python/python-bitarray_1.2.1.bb
index 25b9d84..6e02e4d 100644
--- a/recipes-devtools/python/python-bitarray_1.2.1.bb
+++ b/recipes-devtools/python/python-bitarray_1.2.1.bb
@@ -20,3 +20,5 @@ SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245d
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-bitarray] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-blinker_1.4.bb b/recipes-devtools/python/python-blinker_1.4.bb
index a83695a..33047ed 100644
--- a/recipes-devtools/python/python-blinker_1.4.bb
+++ b/recipes-devtools/python/python-blinker_1.4.bb
@@ -14,3 +14,5 @@ SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
 SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-blinker] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-booleanpy_3.7.bb b/recipes-devtools/python/python-booleanpy_3.7.bb
index b80e434..759996a 100644
--- a/recipes-devtools/python/python-booleanpy_3.7.bb
+++ b/recipes-devtools/python/python-booleanpy_3.7.bb
@@ -29,3 +29,5 @@ do_install_ptest() {
 FILES_${PN}-test = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-booleanpy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cachetools_3.1.1.bb b/recipes-devtools/python/python-cachetools_3.1.1.bb
index c2828cd..5220e89 100644
--- a/recipes-devtools/python/python-cachetools_3.1.1.bb
+++ b/recipes-devtools/python/python-cachetools_3.1.1.bb
@@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "8ea2d3ce97850f31e4a08b0e2b5e6c34997d7216a9d2c98e0f3978630d
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-cachetools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-can_3.3.2.bb b/recipes-devtools/python/python-can_3.3.2.bb
index 478570a..2f46526 100644
--- a/recipes-devtools/python/python-can_3.3.2.bb
+++ b/recipes-devtools/python/python-can_3.3.2.bb
@@ -27,3 +27,5 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-wrapt \
     ${PYTHON_PN}-zlib \
 "
+
+PNBLACKLIST[python-can] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-certifi_2019.11.28.bb b/recipes-devtools/python/python-certifi_2019.11.28.bb
index 3c1f8eb..a545965 100644
--- a/recipes-devtools/python/python-certifi_2019.11.28.bb
+++ b/recipes-devtools/python/python-certifi_2019.11.28.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "25b64c7da4cd7479594d035c08c2d809eb4aab3a26e5a990ea98cc450c
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-certifi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cffi_1.13.2.bb b/recipes-devtools/python/python-cffi_1.13.2.bb
index c1d7e41..68a7326 100644
--- a/recipes-devtools/python/python-cffi_1.13.2.bb
+++ b/recipes-devtools/python/python-cffi_1.13.2.bb
@@ -24,3 +24,5 @@ RDEPENDS_${PN}_class-target = " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-cffi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-chardet_3.0.4.bb b/recipes-devtools/python/python-chardet_3.0.4.bb
index 19d7b77..6b8e560 100644
--- a/recipes-devtools/python/python-chardet_3.0.4.bb
+++ b/recipes-devtools/python/python-chardet_3.0.4.bb
@@ -29,3 +29,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-chardet] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cheetah_2.4.4.bb b/recipes-devtools/python/python-cheetah_2.4.4.bb
index 20fc2fd..57fc683 100644
--- a/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -14,3 +14,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "853917116e731afbc8c8a43c37e6ddba"
 SRC_URI[sha256sum] = "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
+
+PNBLACKLIST[python-cheetah] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-click_7.0.bb b/recipes-devtools/python/python-click_7.0.bb
index d54eb02..720d271 100644
--- a/recipes-devtools/python/python-click_7.0.bb
+++ b/recipes-devtools/python/python-click_7.0.bb
@@ -28,3 +28,5 @@ RDEPENDS_${PN} += "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-click] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cmd2_0.8.9.bb b/recipes-devtools/python/python-cmd2_0.8.9.bb
index 74cc5d6..8f0815c 100644
--- a/recipes-devtools/python/python-cmd2_0.8.9.bb
+++ b/recipes-devtools/python/python-cmd2_0.8.9.bb
@@ -31,3 +31,5 @@ RDEPENDS_${PN} += "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-cmd2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-coloredlogs_10.0.bb b/recipes-devtools/python/python-coloredlogs_10.0.bb
index c7f97b3..b1f3411 100644
--- a/recipes-devtools/python/python-coloredlogs_10.0.bb
+++ b/recipes-devtools/python/python-coloredlogs_10.0.bb
@@ -30,3 +30,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-coloredlogs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-configargparse_0.15.1.bb b/recipes-devtools/python/python-configargparse_0.15.1.bb
index e107ecd..68554a6 100644
--- a/recipes-devtools/python/python-configargparse_0.15.1.bb
+++ b/recipes-devtools/python/python-configargparse_0.15.1.bb
@@ -24,3 +24,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-configargparse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-configparser_3.8.1.bb b/recipes-devtools/python/python-configparser_3.8.1.bb
index c864e35..b6f4058 100644
--- a/recipes-devtools/python/python-configparser_3.8.1.bb
+++ b/recipes-devtools/python/python-configparser_3.8.1.bb
@@ -16,3 +16,5 @@ inherit pypi setuptools python-backports-init
 RDEPENDS_${PN} += "python-pkgutil"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-configparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-constantly_15.1.0.bb b/recipes-devtools/python/python-constantly_15.1.0.bb
index 8474485..e42ca33 100644
--- a/recipes-devtools/python/python-constantly_15.1.0.bb
+++ b/recipes-devtools/python/python-constantly_15.1.0.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba5914
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json"
+
+PNBLACKLIST[python-constantly] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-contextlib2_0.6.0.bb b/recipes-devtools/python/python-contextlib2_0.6.0.bb
index ced6011..0915b1c 100644
--- a/recipes-devtools/python/python-contextlib2_0.6.0.bb
+++ b/recipes-devtools/python/python-contextlib2_0.6.0.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-contextlib2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cpuset_1.6.bb b/recipes-devtools/python/python-cpuset_1.6.bb
index 1255a51..2a797df 100644
--- a/recipes-devtools/python/python-cpuset_1.6.bb
+++ b/recipes-devtools/python/python-cpuset_1.6.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} = "\
     python-textutils \
     python-unixadmin \
     "
+
+PNBLACKLIST[python-cpuset] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-crcmod_1.7.bb b/recipes-devtools/python/python-crcmod_1.7.bb
index b15bb2d..c15db9c 100644
--- a/recipes-devtools/python/python-crcmod_1.7.bb
+++ b/recipes-devtools/python/python-crcmod_1.7.bb
@@ -19,3 +19,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "${PYTHON_PN}-unittest"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-crcmod] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cryptography-vectors_2.8.bb b/recipes-devtools/python/python-cryptography-vectors_2.8.bb
index a7c36e2..fc9baa4 100644
--- a/recipes-devtools/python/python-cryptography-vectors_2.8.bb
+++ b/recipes-devtools/python/python-cryptography-vectors_2.8.bb
@@ -23,3 +23,5 @@ UPSTREAM_CHECK_REGEX = ""
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-cryptography-vectors] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cryptography_2.8.bb b/recipes-devtools/python/python-cryptography_2.8.bb
index 1d4b43f..b694c59 100644
--- a/recipes-devtools/python/python-cryptography_2.8.bb
+++ b/recipes-devtools/python/python-cryptography_2.8.bb
@@ -85,3 +85,5 @@ RDEPENDS_${PN}_class-target += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-cryptography] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cython_0.29.14.bb b/recipes-devtools/python/python-cython_0.29.14.bb
index 3e0c6fe..606e031 100644
--- a/recipes-devtools/python/python-cython_0.29.14.bb
+++ b/recipes-devtools/python/python-cython_0.29.14.bb
@@ -48,3 +48,5 @@ do_install_append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-cython] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-daemon_2.1.2.bb b/recipes-devtools/python/python-daemon_2.1.2.bb
index 002da04..ea2f7cc 100644
--- a/recipes-devtools/python/python-daemon_2.1.2.bb
+++ b/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -25,3 +25,5 @@ SRC_URI_append = " \
 "
 
 PYPI_PACKAGE = "python-daemon"
+
+PNBLACKLIST[python-daemon] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-daemonize_2.5.0.bb b/recipes-devtools/python/python-daemonize_2.5.0.bb
index e0f64fc..8db5ae3 100644
--- a/recipes-devtools/python/python-daemonize_2.5.0.bb
+++ b/recipes-devtools/python/python-daemonize_2.5.0.bb
@@ -14,3 +14,5 @@ RDEPENDS_${PN} = "\
 
 SRC_URI[md5sum] = "3d64e7a0219ad22e3fca62460f893b6a"
 SRC_URI[sha256sum] = "dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3"
+
+PNBLACKLIST[python-daemonize] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dateutil_2.8.1.bb b/recipes-devtools/python/python-dateutil_2.8.1.bb
index c265c3a..40127e3 100644
--- a/recipes-devtools/python/python-dateutil_2.8.1.bb
+++ b/recipes-devtools/python/python-dateutil_2.8.1.bb
@@ -27,3 +27,5 @@ RDEPENDS_${PN}_class-target = "\
 "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-dateutil] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dbus_1.2.14.bb b/recipes-devtools/python/python-dbus_1.2.14.bb
index 409e9a3..3ac6c27 100644
--- a/recipes-devtools/python/python-dbus_1.2.14.bb
+++ b/recipes-devtools/python/python-dbus_1.2.14.bb
@@ -30,3 +30,5 @@ do_install_append() {
     # Remove files that clash with python3-dbus; their content is same
     rm ${D}${includedir}/dbus-1.0/dbus/dbus-python.h ${D}${libdir}/pkgconfig/dbus-python.pc
 }
+
+PNBLACKLIST[python-dbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dbusmock_0.16.7.bb b/recipes-devtools/python/python-dbusmock_0.16.7.bb
index ec8c54a..ebfa9f4 100644
--- a/recipes-devtools/python/python-dbusmock_0.16.7.bb
+++ b/recipes-devtools/python/python-dbusmock_0.16.7.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-pygobject \
     ${PYTHON_PN}-xml \
     "
+
+PNBLACKLIST[python-dbusmock] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-decorator_4.4.1.bb b/recipes-devtools/python/python-decorator_4.4.1.bb
index 7249058..9fa21f7 100644
--- a/recipes-devtools/python/python-decorator_4.4.1.bb
+++ b/recipes-devtools/python/python-decorator_4.4.1.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-stringold \
     "
+
+PNBLACKLIST[python-decorator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-deprecated_1.2.7.bb b/recipes-devtools/python/python-deprecated_1.2.7.bb
index da2c760..ca3956f 100644
--- a/recipes-devtools/python/python-deprecated_1.2.7.bb
+++ b/recipes-devtools/python/python-deprecated_1.2.7.bb
@@ -14,3 +14,5 @@ inherit pypi setuptools
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 RDEPENDS_${PN} += "python-wrapt"
+
+PNBLACKLIST[python-deprecated] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-distutils-extra_2.39.bb b/recipes-devtools/python/python-distutils-extra_2.39.bb
index 1668d1e..7e5d221 100644
--- a/recipes-devtools/python/python-distutils-extra_2.39.bb
+++ b/recipes-devtools/python/python-distutils-extra_2.39.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-distutils-extra] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-django-south_1.0.2.bb b/recipes-devtools/python/python-django-south_1.0.2.bb
index c0a1e2f..05a3517 100644
--- a/recipes-devtools/python/python-django-south_1.0.2.bb
+++ b/recipes-devtools/python/python-django-south_1.0.2.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-django-south] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-django_1.11.26.bb b/recipes-devtools/python/python-django_1.11.26.bb
index 94a9884..38a976e 100644
--- a/recipes-devtools/python/python-django_1.11.26.bb
+++ b/recipes-devtools/python/python-django_1.11.26.bb
@@ -40,3 +40,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-django] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/recipes-devtools/python/python-djangorestframework_3.9.0.bb
index 04e56d0..baaa4e3 100644
--- a/recipes-devtools/python/python-djangorestframework_3.9.0.bb
+++ b/recipes-devtools/python/python-djangorestframework_3.9.0.bb
@@ -15,3 +15,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-django \
 "
+
+PNBLACKLIST[python-djangorestframework] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dnspython_1.16.0.bb b/recipes-devtools/python/python-dnspython_1.16.0.bb
index 0c5fb20..4a4f18d 100644
--- a/recipes-devtools/python/python-dnspython_1.16.0.bb
+++ b/recipes-devtools/python/python-dnspython_1.16.0.bb
@@ -27,3 +27,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-threading \
 "
+
+PNBLACKLIST[python-dnspython] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-docker-pycreds_0.4.0.bb b/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
index 4e9b3ac..7d0cbb7 100644
--- a/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
+++ b/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
@@ -7,3 +7,5 @@ inherit pypi setuptools
 
 SRC_URI[md5sum] = "322f570cea6b4661c6ac335683988e18"
 SRC_URI[sha256sum] = "6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4"
+
+PNBLACKLIST[python-docker-pycreds] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-docker_4.2.0.bb b/recipes-devtools/python/python-docker_4.2.0.bb
index cf78cf1..cb1d303 100644
--- a/recipes-devtools/python/python-docker_4.2.0.bb
+++ b/recipes-devtools/python/python-docker_4.2.0.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += " \
 	python-websocket-client \
 	python-backports-ssl \
 "
+
+PNBLACKLIST[python-docker] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-docutils_0.15.2.bb b/recipes-devtools/python/python-docutils_0.15.2.bb
index d26e819..25ae66e 100644
--- a/recipes-devtools/python/python-docutils_0.15.2.bb
+++ b/recipes-devtools/python/python-docutils_0.15.2.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce
 
 BBCLASSEXTEND = "native"
 
+
+PNBLACKLIST[python-docutils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dominate_2.4.0.bb b/recipes-devtools/python/python-dominate_2.4.0.bb
index c6745e2..72261e9 100644
--- a/recipes-devtools/python/python-dominate_2.4.0.bb
+++ b/recipes-devtools/python/python-dominate_2.4.0.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-threading \
     "
+
+PNBLACKLIST[python-dominate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-editor_1.0.4.bb b/recipes-devtools/python/python-editor_1.0.4.bb
index cc6e0a5..d9c3ad1 100644
--- a/recipes-devtools/python/python-editor_1.0.4.bb
+++ b/recipes-devtools/python/python-editor_1.0.4.bb
@@ -12,3 +12,5 @@ SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec78477138
 PYPI_PACKAGE = "python-editor"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-editor] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-engineio_3.11.2.bb b/recipes-devtools/python/python-engineio_3.11.2.bb
index 09188b4..2d84227 100644
--- a/recipes-devtools/python/python-engineio_3.11.2.bb
+++ b/recipes-devtools/python/python-engineio_3.11.2.bb
@@ -22,3 +22,5 @@ RDEPENDS_${PN}_append_class-target = "\
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-six \
 "
+
+PNBLACKLIST[python-engineio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-enum34_1.1.6.bb b/recipes-devtools/python/python-enum34_1.1.6.bb
index d50b5c7..8e7bd8e 100644
--- a/recipes-devtools/python/python-enum34_1.1.6.bb
+++ b/recipes-devtools/python/python-enum34_1.1.6.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-enum34] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-epydoc_3.0.1.bb b/recipes-devtools/python/python-epydoc_3.0.1.bb
index dd9799f..f168340 100644
--- a/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ b/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} += "\
     "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-epydoc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-evdev_1.2.0.bb b/recipes-devtools/python/python-evdev_1.2.0.bb
index 533fa64..ef6f2dc 100644
--- a/recipes-devtools/python/python-evdev_1.2.0.bb
+++ b/recipes-devtools/python/python-evdev_1.2.0.bb
@@ -25,3 +25,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-stringold \
     "
+
+PNBLACKLIST[python-evdev] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-feedformatter_0.4.bb b/recipes-devtools/python/python-feedformatter_0.4.bb
index 2d7aae6..af42547 100644
--- a/recipes-devtools/python/python-feedformatter_0.4.bb
+++ b/recipes-devtools/python/python-feedformatter_0.4.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-xml \
     "
+
+PNBLACKLIST[python-feedformatter] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-feedparser_5.2.1.bb b/recipes-devtools/python/python-feedparser_5.2.1.bb
index b8ee700..399c058 100644
--- a/recipes-devtools/python/python-feedparser_5.2.1.bb
+++ b/recipes-devtools/python/python-feedparser_5.2.1.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-stringold \
     "
 
+
+PNBLACKLIST[python-feedparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-babel_0.12.2.bb b/recipes-devtools/python/python-flask-babel_0.12.2.bb
index b40a676..6da09ad 100644
--- a/recipes-devtools/python/python-flask-babel_0.12.2.bb
+++ b/recipes-devtools/python/python-flask-babel_0.12.2.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-speaklater \
     "
+
+PNBLACKLIST[python-flask-babel] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb b/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
index d090b34..9f2e1b4 100644
--- a/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
+++ b/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
@@ -10,3 +10,5 @@ PYPI_PACKAGE = "Flask-Bcrypt"
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
+
+PNBLACKLIST[python-flask-bcrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb b/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
index eabc600..d64a057 100644
--- a/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
+++ b/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-visitor \
     "
+
+PNBLACKLIST[python-flask-bootstrap] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-login_0.4.1.bb b/recipes-devtools/python/python-flask-login_0.4.1.bb
index df8c181..39905e1 100644
--- a/recipes-devtools/python/python-flask-login_0.4.1.bb
+++ b/recipes-devtools/python/python-flask-login_0.4.1.bb
@@ -14,3 +14,5 @@ PYPI_PACKAGE = "Flask-Login"
 inherit pypi setuptools
 
 RDEPENDS_${PN}_class-target = "${PYTHON_PN}-flask"
+
+PNBLACKLIST[python-flask-login] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-mail_0.9.1.bb b/recipes-devtools/python/python-flask-mail_0.9.1.bb
index 8e20f08..4807f61 100644
--- a/recipes-devtools/python/python-flask-mail_0.9.1.bb
+++ b/recipes-devtools/python/python-flask-mail_0.9.1.bb
@@ -16,3 +16,5 @@ PYPI_PACKAGE = "Flask-Mail"
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "${PYTHON_PN}-flask"
+
+PNBLACKLIST[python-flask-mail] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-migrate_2.5.2.bb b/recipes-devtools/python/python-flask-migrate_2.5.2.bb
index b25167d..120d23b 100644
--- a/recipes-devtools/python/python-flask-migrate_2.5.2.bb
+++ b/recipes-devtools/python/python-flask-migrate_2.5.2.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-alembic \
     ${PYTHON_PN}-flask \
     "
+
+PNBLACKLIST[python-flask-migrate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-nav_0.6.bb b/recipes-devtools/python/python-flask-nav_0.6.bb
index ce9047d..fab9060 100644
--- a/recipes-devtools/python/python-flask-nav_0.6.bb
+++ b/recipes-devtools/python/python-flask-nav_0.6.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-blinker \
     ${PYTHON_PN}-flask \
     "
+
+PNBLACKLIST[python-flask-nav] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-navigation_0.2.0.bb b/recipes-devtools/python/python-flask-navigation_0.2.0.bb
index b2dc96e..33a635e 100644
--- a/recipes-devtools/python/python-flask-navigation_0.2.0.bb
+++ b/recipes-devtools/python/python-flask-navigation_0.2.0.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-blinker \
     ${PYTHON_PN}-flask \
     "
+
+PNBLACKLIST[python-flask-navigation] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-pymongo_2.3.0.bb b/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
index 19a3b9d..068b3fe 100644
--- a/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
+++ b/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
@@ -15,3 +15,5 @@ PYPI_PACKAGE = "Flask-PyMongo"
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
+
+PNBLACKLIST[python-flask-pymongo] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-restful_0.3.7.bb b/recipes-devtools/python/python-flask-restful_0.3.7.bb
index 6138e8a..2d5c229 100644
--- a/recipes-devtools/python/python-flask-restful_0.3.7.bb
+++ b/recipes-devtools/python/python-flask-restful_0.3.7.bb
@@ -14,3 +14,5 @@ inherit pypi setuptools
 PYPI_PACKAGE = "Flask-RESTful"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-flask"
+
+PNBLACKLIST[python-flask-restful] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-script_2.0.6.bb b/recipes-devtools/python/python-flask-script_2.0.6.bb
index a930ee3..b12865a 100644
--- a/recipes-devtools/python/python-flask-script_2.0.6.bb
+++ b/recipes-devtools/python/python-flask-script_2.0.6.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
     "
+
+PNBLACKLIST[python-flask-script] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-sijax_0.4.1.bb b/recipes-devtools/python/python-flask-sijax_0.4.1.bb
index 4013711..1c09264 100644
--- a/recipes-devtools/python/python-flask-sijax_0.4.1.bb
+++ b/recipes-devtools/python/python-flask-sijax_0.4.1.bb
@@ -16,3 +16,5 @@ PYPI_PACKAGE = "Flask-Sijax"
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "${PYTHON_PN}-sijax"
+
+PNBLACKLIST[python-flask-sijax] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-socketio_4.2.1.bb b/recipes-devtools/python/python-flask-socketio_4.2.1.bb
index 6bff30d..93a0adb 100644
--- a/recipes-devtools/python/python-flask-socketio_4.2.1.bb
+++ b/recipes-devtools/python/python-flask-socketio_4.2.1.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-socketio \
     "
+
+PNBLACKLIST[python-flask-socketio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb b/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
index b91c9e2..96fa033 100644
--- a/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
+++ b/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
@@ -16,3 +16,5 @@ PYPI_PACKAGE = "Flask-SQLAlchemy"
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
+
+PNBLACKLIST[python-flask-sqlalchemy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-uploads_0.2.1.bb b/recipes-devtools/python/python-flask-uploads_0.2.1.bb
index 04d73bc..8f69ce4 100644
--- a/recipes-devtools/python/python-flask-uploads_0.2.1.bb
+++ b/recipes-devtools/python/python-flask-uploads_0.2.1.bb
@@ -15,3 +15,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
     "
+
+PNBLACKLIST[python-flask-uploads] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-user_0.6.19.bb b/recipes-devtools/python/python-flask-user_0.6.19.bb
index f231904..310613c 100644
--- a/recipes-devtools/python/python-flask-user_0.6.19.bb
+++ b/recipes-devtools/python/python-flask-user_0.6.19.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} = "${PYTHON_PN}-flask \
     ${PYTHON_PN}-flask-login \
     ${PYTHON_PN}-flask-mail \
     ${PYTHON_PN}-babel"
+
+PNBLACKLIST[python-flask-user] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-wtf_0.14.2.bb b/recipes-devtools/python/python-flask-wtf_0.14.2.bb
index 23162c2..4502820 100644
--- a/recipes-devtools/python/python-flask-wtf_0.14.2.bb
+++ b/recipes-devtools/python/python-flask-wtf_0.14.2.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-wtforms \
 "
+
+PNBLACKLIST[python-flask-wtf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-xstatic_0.0.1.bb b/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
index eea36eb..4732a6d 100644
--- a/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
+++ b/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-xstatic \
     "
+
+PNBLACKLIST[python-flask-xstatic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask_1.1.1.bb b/recipes-devtools/python/python-flask_1.1.1.bb
index 432b944..c633108 100644
--- a/recipes-devtools/python/python-flask_1.1.1.bb
+++ b/recipes-devtools/python/python-flask_1.1.1.bb
@@ -21,3 +21,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-jinja2 \
     ${PYTHON_PN}-werkzeug \
     "
+
+PNBLACKLIST[python-flask] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-funcsigs_1.0.2.bb b/recipes-devtools/python/python-funcsigs_1.0.2.bb
index dad15ee..8df1d9e 100644
--- a/recipes-devtools/python/python-funcsigs_1.0.2.bb
+++ b/recipes-devtools/python/python-funcsigs_1.0.2.bb
@@ -16,3 +16,5 @@ SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
 SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-funcsigs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-functools32_3.2.3-2.bb b/recipes-devtools/python/python-functools32_3.2.3-2.bb
index cb4bba4..5451357 100644
--- a/recipes-devtools/python/python-functools32_3.2.3-2.bb
+++ b/recipes-devtools/python/python-functools32_3.2.3-2.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-functools32] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-future_0.18.2.bb b/recipes-devtools/python/python-future_0.18.2.bb
index 8fa066d..eb9b308 100644
--- a/recipes-devtools/python/python-future_0.18.2.bb
+++ b/recipes-devtools/python/python-future_0.18.2.bb
@@ -16,3 +16,5 @@ inherit pypi setuptools
 RDEPENDS_${PN}_append_class-target = " python-misc"
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-future] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-futures_3.3.0.bb b/recipes-devtools/python/python-futures_3.3.0.bb
index 1636f73..65f2975 100644
--- a/recipes-devtools/python/python-futures_3.3.0.bb
+++ b/recipes-devtools/python/python-futures_3.3.0.bb
@@ -11,3 +11,5 @@ SRC_URI[sha256sum] = "7e033af76a5e35f58e56da7a91e687706faf4e7bdfb2cbc3f2cca6b9bc
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-futures] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-gdata_2.0.18.bb b/recipes-devtools/python/python-gdata_2.0.18.bb
index 897581f..6053a29 100644
--- a/recipes-devtools/python/python-gdata_2.0.18.bb
+++ b/recipes-devtools/python/python-gdata_2.0.18.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN} = " \
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-xml \
 "
+
+PNBLACKLIST[python-gdata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-gevent_1.4.0.bb b/recipes-devtools/python/python-gevent_1.4.0.bb
index 311f672..d7d3886 100644
--- a/recipes-devtools/python/python-gevent_1.4.0.bb
+++ b/recipes-devtools/python/python-gevent_1.4.0.bb
@@ -38,3 +38,5 @@ do_configure_append() {
 	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
 }
 
+
+PNBLACKLIST[python-gevent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-greenlet_0.4.15.bb b/recipes-devtools/python/python-greenlet_0.4.15.bb
index 30ba655..1e6fdd1 100644
--- a/recipes-devtools/python/python-greenlet_0.4.15.bb
+++ b/recipes-devtools/python/python-greenlet_0.4.15.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
 SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
 
 inherit pypi distutils
+
+PNBLACKLIST[python-greenlet] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-grpcio-tools_1.14.1.bb b/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
index 0820169..25dcc93 100644
--- a/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
+++ b/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
@@ -16,3 +16,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-grpcio-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-grpcio_1.27.1.bb b/recipes-devtools/python/python-grpcio_1.27.1.bb
index 6768e7e..6619652 100644
--- a/recipes-devtools/python/python-grpcio_1.27.1.bb
+++ b/recipes-devtools/python/python-grpcio_1.27.1.bb
@@ -29,3 +29,5 @@ export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
 CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-grpcio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-html5lib_1.0.1.bb b/recipes-devtools/python/python-html5lib_1.0.1.bb
index 21b80f2..642b0de 100644
--- a/recipes-devtools/python/python-html5lib_1.0.1.bb
+++ b/recipes-devtools/python/python-html5lib_1.0.1.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-html5lib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-humanfriendly_4.18.bb b/recipes-devtools/python/python-humanfriendly_4.18.bb
index 96f6f83..7553922 100644
--- a/recipes-devtools/python/python-humanfriendly_4.18.bb
+++ b/recipes-devtools/python/python-humanfriendly_4.18.bb
@@ -27,3 +27,5 @@ RDEPENDS_${PN}_class-target += " \
 "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-humanfriendly] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-humanize_0.5.1.bb b/recipes-devtools/python/python-humanize_0.5.1.bb
index e91230d..9a0380e 100644
--- a/recipes-devtools/python/python-humanize_0.5.1.bb
+++ b/recipes-devtools/python/python-humanize_0.5.1.bb
@@ -14,3 +14,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-humanize] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-hyperlink_19.0.0.bb b/recipes-devtools/python/python-hyperlink_19.0.0.bb
index ad68b1b..270f27c 100644
--- a/recipes-devtools/python/python-hyperlink_19.0.0.bb
+++ b/recipes-devtools/python/python-hyperlink_19.0.0.bb
@@ -20,3 +20,5 @@ PACKAGES =. "${PN}-test "
 FILES_${PN}-test += " \
         ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
 "
+
+PNBLACKLIST[python-hyperlink] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-hypothesis_4.50.2.bb b/recipes-devtools/python/python-hypothesis_4.50.2.bb
index 4cf7d5d..b01e488 100644
--- a/recipes-devtools/python/python-hypothesis_4.50.2.bb
+++ b/recipes-devtools/python/python-hypothesis_4.50.2.bb
@@ -20,3 +20,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-enum34 \
     "
+
+PNBLACKLIST[python-hypothesis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-idna_2.8.bb b/recipes-devtools/python/python-idna_2.8.bb
index 74ed8e3..ca7a1aa 100644
--- a/recipes-devtools/python/python-idna_2.8.bb
+++ b/recipes-devtools/python/python-idna_2.8.bb
@@ -18,3 +18,5 @@ do_compile_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-idna] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-imaging_1.1.7.bb b/recipes-devtools/python/python-imaging_1.1.7.bb
index 60dd7d0..395a5cc 100644
--- a/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -46,3 +46,5 @@ do_install() {
 }
 
 RDEPENDS_${PN} += "python-lang python-stringold"
+
+PNBLACKLIST[python-imaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-importlib-metadata_0.23.bb b/recipes-devtools/python/python-importlib-metadata_0.23.bb
index 9a4e8ad..a0f6362 100644
--- a/recipes-devtools/python/python-importlib-metadata_0.23.bb
+++ b/recipes-devtools/python/python-importlib-metadata_0.23.bb
@@ -25,3 +25,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-importlib-metadata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-incremental_17.5.0.bb b/recipes-devtools/python/python-incremental_17.5.0.bb
index c02c58a..6b4a937 100644
--- a/recipes-devtools/python/python-incremental_17.5.0.bb
+++ b/recipes-devtools/python/python-incremental_17.5.0.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += " \
 # python-incremental which uses python-twisted, so this hack is OK.
 RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-incremental] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-inflection_0.3.1.bb b/recipes-devtools/python/python-inflection_0.3.1.bb
index 64c07b2..8ed9ba1 100644
--- a/recipes-devtools/python/python-inflection_0.3.1.bb
+++ b/recipes-devtools/python/python-inflection_0.3.1.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-inflection] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-intervals_1.10.0.bb b/recipes-devtools/python/python-intervals_1.10.0.bb
index 4e0de32..595fb65 100644
--- a/recipes-devtools/python/python-intervals_1.10.0.bb
+++ b/recipes-devtools/python/python-intervals_1.10.0.bb
@@ -15,3 +15,5 @@ PYPI_PACKAGE := "python-intervals"
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-intervals] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ipaddress_1.0.23.bb b/recipes-devtools/python/python-ipaddress_1.0.23.bb
index 7897ed6..bb08da4 100644
--- a/recipes-devtools/python/python-ipaddress_1.0.23.bb
+++ b/recipes-devtools/python/python-ipaddress_1.0.23.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e0
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-ipaddress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ipy_1.00.bb b/recipes-devtools/python/python-ipy_1.00.bb
index 7fdb519..109e4eb 100644
--- a/recipes-devtools/python/python-ipy_1.00.bb
+++ b/recipes-devtools/python/python-ipy_1.00.bb
@@ -17,3 +17,5 @@ inherit pypi setuptools
 PYPI_PACKAGE = "IPy"
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-ipy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-iso8601_0.1.12.bb b/recipes-devtools/python/python-iso8601_0.1.12.bb
index daf9ff0..ae5d0e1 100644
--- a/recipes-devtools/python/python-iso8601_0.1.12.bb
+++ b/recipes-devtools/python/python-iso8601_0.1.12.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-iso8601] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-isodate_0.6.0.bb b/recipes-devtools/python/python-isodate_0.6.0.bb
index aa92338..e107cf3 100644
--- a/recipes-devtools/python/python-isodate_0.6.0.bb
+++ b/recipes-devtools/python/python-isodate_0.6.0.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-isodate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-isort_4.3.21.bb b/recipes-devtools/python/python-isort_4.3.21.bb
index 6c9bebc..97ce045 100644
--- a/recipes-devtools/python/python-isort_4.3.21.bb
+++ b/recipes-devtools/python/python-isort_4.3.21.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-isort] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-itsdangerous_1.1.0.bb b/recipes-devtools/python/python-itsdangerous_1.1.0.bb
index af0b1ff..0efa71e 100644
--- a/recipes-devtools/python/python-itsdangerous_1.1.0.bb
+++ b/recipes-devtools/python/python-itsdangerous_1.1.0.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-simplejson \
     ${PYTHON_PN}-zlib \
 "
+
+PNBLACKLIST[python-itsdangerous] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
index 97468d6..6c3ef75 100644
--- a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
+++ b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN}_append_class-target = "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-javaobj-py3] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jinja2_2.10.3.bb b/recipes-devtools/python/python-jinja2_2.10.3.bb
index b2f6102..cf26245 100644
--- a/recipes-devtools/python/python-jinja2_2.10.3.bb
+++ b/recipes-devtools/python/python-jinja2_2.10.3.bb
@@ -31,3 +31,5 @@ RDEPENDS_${PN} += "\
 CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-jinja2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsmin_2.2.2.bb b/recipes-devtools/python/python-jsmin_2.2.2.bb
index d00d1e2..53884b9 100644
--- a/recipes-devtools/python/python-jsmin_2.2.2.bb
+++ b/recipes-devtools/python/python-jsmin_2.2.2.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
 SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-jsmin] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonpatch_1.24.bb b/recipes-devtools/python/python-jsonpatch_1.24.bb
index 8b280fa..79bb4ca 100644
--- a/recipes-devtools/python/python-jsonpatch_1.24.bb
+++ b/recipes-devtools/python/python-jsonpatch_1.24.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-re \
     ${PYTHON_PN}-stringold \
 "
+
+PNBLACKLIST[python-jsonpatch] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonpointer_2.0.bb b/recipes-devtools/python/python-jsonpointer_2.0.bb
index 0a365ff..07d6657 100644
--- a/recipes-devtools/python/python-jsonpointer_2.0.bb
+++ b/recipes-devtools/python/python-jsonpointer_2.0.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-jsonpointer] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonref_0.2.bb b/recipes-devtools/python/python-jsonref_0.2.bb
index e45952f..01a770e 100644
--- a/recipes-devtools/python/python-jsonref_0.2.bb
+++ b/recipes-devtools/python/python-jsonref_0.2.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-jsonref] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonschema_3.2.0.bb b/recipes-devtools/python/python-jsonschema_3.2.0.bb
index 8074e69..1b22ae8 100644
--- a/recipes-devtools/python/python-jsonschema_3.2.0.bb
+++ b/recipes-devtools/python/python-jsonschema_3.2.0.bb
@@ -57,3 +57,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-jsonschema] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-kombu_4.6.6.bb b/recipes-devtools/python/python-kombu_4.6.6.bb
index 72a9d90..0c28908 100644
--- a/recipes-devtools/python/python-kombu_4.6.6.bb
+++ b/recipes-devtools/python/python-kombu_4.6.6.bb
@@ -21,3 +21,5 @@ FILES_${PN}-doc += "${datadir}/${SRCNAME}"
 RDEPENDS_${PN} = " \
         python-amqp \
         "
+
+PNBLACKLIST[python-kombu] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb b/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
index e32a124..eb94a7a 100644
--- a/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
+++ b/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-lazy-object-proxy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ldap_3.2.0.bb b/recipes-devtools/python/python-ldap_3.2.0.bb
index 8e43dee..30c829e 100644
--- a/recipes-devtools/python/python-ldap_3.2.0.bb
+++ b/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -35,3 +35,5 @@ python() {
     if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
         raise bb.parse.SkipRecipe('Requires networking-layer to be present to provide cyrus-sasl.')
 }
+
+PNBLACKLIST[python-ldap] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-license-expression_1.2.bb b/recipes-devtools/python/python-license-expression_1.2.bb
index 8caccd2..5ec1222 100644
--- a/recipes-devtools/python/python-license-expression_1.2.bb
+++ b/recipes-devtools/python/python-license-expression_1.2.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN}_append_class-target = "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-license-expression] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-linecache2_1.0.0.bb b/recipes-devtools/python/python-linecache2_1.0.0.bb
index 386da2d..cdb7ed5 100644
--- a/recipes-devtools/python/python-linecache2_1.0.0.bb
+++ b/recipes-devtools/python/python-linecache2_1.0.0.bb
@@ -11,3 +11,5 @@ SRC_URI[sha256sum] = "4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db
 inherit pypi setuptools
 
 CLEAN_BROKEN = "1"
+
+PNBLACKLIST[python-linecache2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lockfile_0.12.2.bb b/recipes-devtools/python/python-lockfile_0.12.2.bb
index 20ea018..22183c4 100644
--- a/recipes-devtools/python/python-lockfile_0.12.2.bb
+++ b/recipes-devtools/python/python-lockfile_0.12.2.bb
@@ -17,3 +17,5 @@ DEPENDS += " \
         python-pbr-native \
         "
 
+
+PNBLACKLIST[python-lockfile] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lrparsing_1.0.16.bb b/recipes-devtools/python/python-lrparsing_1.0.16.bb
index ad2a7ce..4cbc92c 100644
--- a/recipes-devtools/python/python-lrparsing_1.0.16.bb
+++ b/recipes-devtools/python/python-lrparsing_1.0.16.bb
@@ -17,3 +17,5 @@ UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
 inherit setuptools
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-lrparsing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lxml_4.4.2.bb b/recipes-devtools/python/python-lxml_4.4.2.bb
index 51ba4b8..d083de3 100644
--- a/recipes-devtools/python/python-lxml_4.4.2.bb
+++ b/recipes-devtools/python/python-lxml_4.4.2.bb
@@ -50,3 +50,5 @@ BUILD_OPTIMIZATION_append_mipsel = " -O"
 RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-lxml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-m2crypto_0.30.1.bb b/recipes-devtools/python/python-m2crypto_0.30.1.bb
index 968dd72..ac5615e 100644
--- a/recipes-devtools/python/python-m2crypto_0.30.1.bb
+++ b/recipes-devtools/python/python-m2crypto_0.30.1.bb
@@ -62,3 +62,5 @@ do_configure_prepend() {
 }
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-m2crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-mako_1.1.0.bb b/recipes-devtools/python/python-mako_1.1.0.bb
index f7e6332..c6e79a0 100644
--- a/recipes-devtools/python/python-mako_1.1.0.bb
+++ b/recipes-devtools/python/python-mako_1.1.0.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} = " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-mako] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-markupsafe_1.1.1.bb b/recipes-devtools/python/python-markupsafe_1.1.1.bb
index 44e72dc..ad979c7 100644
--- a/recipes-devtools/python/python-markupsafe_1.1.1.bb
+++ b/recipes-devtools/python/python-markupsafe_1.1.1.bb
@@ -18,3 +18,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-markupsafe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-mccabe_0.4.0.bb b/recipes-devtools/python/python-mccabe_0.4.0.bb
index 6b63cd7..1c5ae4f 100644
--- a/recipes-devtools/python/python-mccabe_0.4.0.bb
+++ b/recipes-devtools/python/python-mccabe_0.4.0.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += " \
     python-pyparsing"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-mccabe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-mock_3.0.5.bb b/recipes-devtools/python/python-mock_3.0.5.bb
index db71066..46c8d90 100644
--- a/recipes-devtools/python/python-mock_3.0.5.bb
+++ b/recipes-devtools/python/python-mock_3.0.5.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} += " \
     python-pbr \
     python-funcsigs \
 "
+
+PNBLACKLIST[python-mock] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-monotonic_1.5.bb b/recipes-devtools/python/python-monotonic_1.5.bb
index 01e7b1c..e898f50 100644
--- a/recipes-devtools/python/python-monotonic_1.5.bb
+++ b/recipes-devtools/python/python-monotonic_1.5.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-io ${PYTHON_PN}-re ${PYTHON_PN}-threading"
+
+PNBLACKLIST[python-monotonic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-more-itertools_5.0.0.bb b/recipes-devtools/python/python-more-itertools_5.0.0.bb
index e381e75..40f0cfb 100644
--- a/recipes-devtools/python/python-more-itertools_5.0.0.bb
+++ b/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -15,3 +15,5 @@ inherit pypi setuptools
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-more-itertools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-msgpack_0.6.2.bb b/recipes-devtools/python/python-msgpack_0.6.2.bb
index b83bb5c..ff66a0f 100644
--- a/recipes-devtools/python/python-msgpack_0.6.2.bb
+++ b/recipes-devtools/python/python-msgpack_0.6.2.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-io \
 "
+
+PNBLACKLIST[python-msgpack] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb b/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
index 4795f30..de702b2 100644
--- a/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
+++ b/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
@@ -38,3 +38,5 @@ ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
 ALTERNATIVE_PRIORITY = "20"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-ndg-httpsclient] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-netaddr_0.7.19.bb b/recipes-devtools/python/python-netaddr_0.7.19.bb
index 0353c2f..0a94904 100644
--- a/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ b/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-textutils \
     ${PYTHON_PN}-xml \
 "
+
+PNBLACKLIST[python-netaddr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-netifaces_0.10.9.bb b/recipes-devtools/python/python-netifaces_0.10.9.bb
index ba6bd16..5be7329 100644
--- a/recipes-devtools/python/python-netifaces_0.10.9.bb
+++ b/recipes-devtools/python/python-netifaces_0.10.9.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
 SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-netifaces] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-networkx_2.2.bb b/recipes-devtools/python/python-networkx_2.2.bb
index c8d3619..09bbab6 100644
--- a/recipes-devtools/python/python-networkx_2.2.bb
+++ b/recipes-devtools/python/python-networkx_2.2.bb
@@ -12,3 +12,5 @@ inherit pypi setuptools
 PYPI_PACKAGE_EXT = "zip"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-decorator"
+
+PNBLACKLIST[python-networkx] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-numeric_24.2.bb b/recipes-devtools/python/python-numeric_24.2.bb
index c91d77c..6c65ed5 100644
--- a/recipes-devtools/python/python-numeric_24.2.bb
+++ b/recipes-devtools/python/python-numeric_24.2.bb
@@ -14,3 +14,5 @@ inherit distutils
 
 SRC_URI[md5sum] = "2ae672656e06716a149acb048cca3093"
 SRC_URI[sha256sum] = "5f72e729eb6ff57442f2a38bfc9931738b59e5077928e2e70d22b4610ff15258"
+
+PNBLACKLIST[python-numeric] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-packaging_20.0.bb b/recipes-devtools/python/python-packaging_20.0.bb
index e19bca3..994db81 100644
--- a/recipes-devtools/python/python-packaging_20.0.bb
+++ b/recipes-devtools/python/python-packaging_20.0.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
+
+PNBLACKLIST[python-packaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-paho-mqtt_1.5.0.bb b/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
index 01643d5..a5e0269 100644
--- a/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
+++ b/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
 "
+
+PNBLACKLIST[python-paho-mqtt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pam_1.8.2.bb b/recipes-devtools/python/python-pam_1.8.2.bb
index bac3496..405cbdc 100644
--- a/recipes-devtools/python/python-pam_1.8.2.bb
+++ b/recipes-devtools/python/python-pam_1.8.2.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN} = "libpam"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
+
+PNBLACKLIST[python-pam] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pamela_0.3.0.bb b/recipes-devtools/python/python-pamela_0.3.0.bb
index 7c39f28..96f81d3 100644
--- a/recipes-devtools/python/python-pamela_0.3.0.bb
+++ b/recipes-devtools/python/python-pamela_0.3.0.bb
@@ -16,3 +16,5 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 # meta-python recipe did not follow Debian naming
 PROVIDES += "pamela"
+
+PNBLACKLIST[python-pamela] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-parse-type_0.4.2.bb b/recipes-devtools/python/python-parse-type_0.4.2.bb
index c81dade..faaa498 100644
--- a/recipes-devtools/python/python-parse-type_0.4.2.bb
+++ b/recipes-devtools/python/python-parse-type_0.4.2.bb
@@ -11,3 +11,5 @@ PYPI_PACKAGE = "parse_type"
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "${PYTHON_PN}-parse"
+
+PNBLACKLIST[python-parse-type] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-parse_1.14.0.bb b/recipes-devtools/python/python-parse_1.14.0.bb
index 1fd5116..90f22dc 100644
--- a/recipes-devtools/python/python-parse_1.14.0.bb
+++ b/recipes-devtools/python/python-parse_1.14.0.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN}_append_class-target = "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-numbers \
     "
+
+PNBLACKLIST[python-parse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-passlib_1.7.2.bb b/recipes-devtools/python/python-passlib_1.7.2.bb
index e47d18f..6e250fc 100644
--- a/recipes-devtools/python/python-passlib_1.7.2.bb
+++ b/recipes-devtools/python/python-passlib_1.7.2.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
 "
+
+PNBLACKLIST[python-passlib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-paste_3.2.3.bb b/recipes-devtools/python/python-paste_3.2.3.bb
index c3d4fdd..75638c9 100644
--- a/recipes-devtools/python/python-paste_3.2.3.bb
+++ b/recipes-devtools/python/python-paste_3.2.3.bb
@@ -15,3 +15,5 @@ FILES_${PN} += "/usr/lib/*"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
+
+PNBLACKLIST[python-paste] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pathlib2_2.3.5.bb b/recipes-devtools/python/python-pathlib2_2.3.5.bb
index 3d83a29..f9b02ea 100644
--- a/recipes-devtools/python/python-pathlib2_2.3.5.bb
+++ b/recipes-devtools/python/python-pathlib2_2.3.5.bb
@@ -22,3 +22,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pathlib2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pbr_5.4.4.bb b/recipes-devtools/python/python-pbr_5.4.4.bb
index fb0949e..c7caebf 100644
--- a/recipes-devtools/python/python-pbr_5.4.4.bb
+++ b/recipes-devtools/python/python-pbr_5.4.4.bb
@@ -19,3 +19,5 @@ do_install_append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pbr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pep8_1.7.1.bb b/recipes-devtools/python/python-pep8_1.7.1.bb
index 54ce978..e6c9acd 100644
--- a/recipes-devtools/python/python-pep8_1.7.1.bb
+++ b/recipes-devtools/python/python-pep8_1.7.1.bb
@@ -14,3 +14,5 @@ RDEPENDS_${PN} += " \
     python-pyparsing"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pep8] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-periphery_2.0.0.bb b/recipes-devtools/python/python-periphery_2.0.0.bb
index 1a28e23..3be604d 100644
--- a/recipes-devtools/python/python-periphery_2.0.0.bb
+++ b/recipes-devtools/python/python-periphery_2.0.0.bb
@@ -10,3 +10,5 @@ PYPI_PACKAGE = "python-periphery"
 inherit pypi setuptools
 
 SRC_URI[sha256sum] = "2df05528a7668db4fb3faaff516b34ed99e9009ed9610a4efe3ea6c0ea8a3aab"
+
+PNBLACKLIST[python-periphery] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pexpect_4.7.0.bb b/recipes-devtools/python/python-pexpect_4.7.0.bb
index 3efdafd..42aa472 100644
--- a/recipes-devtools/python/python-pexpect_4.7.0.bb
+++ b/recipes-devtools/python/python-pexpect_4.7.0.bb
@@ -21,3 +21,5 @@ RDEPENDS_${PN} = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pexpect] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pika_1.1.0.bb b/recipes-devtools/python/python-pika_1.1.0.bb
index 910a7d5..383031d 100644
--- a/recipes-devtools/python/python-pika_1.1.0.bb
+++ b/recipes-devtools/python/python-pika_1.1.0.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-tornado \
     ${PYTHON_PN}-twisted \
 "
+
+PNBLACKLIST[python-pika] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pint_0.9.bb b/recipes-devtools/python/python-pint_0.9.bb
index 71ddf54..93e081f 100644
--- a/recipes-devtools/python/python-pint_0.9.bb
+++ b/recipes-devtools/python/python-pint_0.9.bb
@@ -22,3 +22,5 @@ SRC_URI[sha256sum] = "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a56
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-pint] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pip_19.3.1.bb b/recipes-devtools/python/python-pip_19.3.1.bb
index 2827a12..71d1f28 100644
--- a/recipes-devtools/python/python-pip_19.3.1.bb
+++ b/recipes-devtools/python/python-pip_19.3.1.bb
@@ -12,3 +12,5 @@ inherit pypi setuptools
 RDEPENDS_${PN}_class-target = "python-modules python-distribute python-misc"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pip] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pluggy_0.13.1.bb b/recipes-devtools/python/python-pluggy_0.13.1.bb
index 4776350..ab9a196 100644
--- a/recipes-devtools/python/python-pluggy_0.13.1.bb
+++ b/recipes-devtools/python/python-pluggy_0.13.1.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
 "
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-pluggy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ply_3.11.bb b/recipes-devtools/python/python-ply_3.11.bb
index 0faec95..567d20b 100644
--- a/recipes-devtools/python/python-ply_3.11.bb
+++ b/recipes-devtools/python/python-ply_3.11.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN}_class-target += "\
 "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-ply] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pretend_1.0.9.bb b/recipes-devtools/python/python-pretend_1.0.9.bb
index 0c7c3c7..5ff1d17 100644
--- a/recipes-devtools/python/python-pretend_1.0.9.bb
+++ b/recipes-devtools/python/python-pretend_1.0.9.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pretend] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-prettytable_0.7.2.bb b/recipes-devtools/python/python-prettytable_0.7.2.bb
index 264a81f..22b7244 100644
--- a/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -27,3 +27,5 @@ UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+PNBLACKLIST[python-prettytable] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-progress_1.5.bb b/recipes-devtools/python/python-progress_1.5.bb
index 01003fc..614ce5e 100644
--- a/recipes-devtools/python/python-progress_1.5.bb
+++ b/recipes-devtools/python/python-progress_1.5.bb
@@ -14,3 +14,5 @@ RDEPENDS_${PN}_class-target += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-progress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb b/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
index 13acbc5..0b2e421 100644
--- a/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
+++ b/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-prompt-toolkit] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-protobuf_3.9.2.bb b/recipes-devtools/python/python-protobuf_3.9.2.bb
index 84ce220..a708722 100644
--- a/recipes-devtools/python/python-protobuf_3.9.2.bb
+++ b/recipes-devtools/python/python-protobuf_3.9.2.bb
@@ -31,3 +31,5 @@ RDEPENDS_${PN} += " \
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native nativesdk"
 
+
+PNBLACKLIST[python-protobuf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-psutil_5.6.7.bb b/recipes-devtools/python/python-psutil_5.6.7.bb
index 82d032f..bfd16b8 100644
--- a/recipes-devtools/python/python-psutil_5.6.7.bb
+++ b/recipes-devtools/python/python-psutil_5.6.7.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-psutil] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ptyprocess_0.6.0.bb b/recipes-devtools/python/python-ptyprocess_0.6.0.bb
index bd4613e..6601c92 100644
--- a/recipes-devtools/python/python-ptyprocess_0.6.0.bb
+++ b/recipes-devtools/python/python-ptyprocess_0.6.0.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-ptyprocess] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-py_1.8.1.bb b/recipes-devtools/python/python-py_1.8.1.bb
index 5038e98..1ecf200 100644
--- a/recipes-devtools/python/python-py_1.8.1.bb
+++ b/recipes-devtools/python/python-py_1.8.1.bb
@@ -11,3 +11,5 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-py] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
index 2cd3e76..b769e51 100644
--- a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
+++ b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
@@ -12,3 +12,5 @@ DEPENDS += "alsa-lib"
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "libasound"
+
+PNBLACKLIST[python-pyalsaaudio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb b/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
index c3df6b1..e6cd671 100644
--- a/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
+++ b/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
@@ -14,3 +14,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} = "${PYTHON_PN}-pyasn1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyasn1-modules] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyasn1_0.4.8.bb b/recipes-devtools/python/python-pyasn1_0.4.8.bb
index 4085579..4772beb 100644
--- a/recipes-devtools/python/python-pyasn1_0.4.8.bb
+++ b/recipes-devtools/python/python-pyasn1_0.4.8.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN}_class-target += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyasn1] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pybind11_2.4.3.bb b/recipes-devtools/python/python-pybind11_2.4.3.bb
index a130980..ebdbf14 100644
--- a/recipes-devtools/python/python-pybind11_2.4.3.bb
+++ b/recipes-devtools/python/python-pybind11_2.4.3.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
 SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-pybind11] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pybluez_0.22.bb b/recipes-devtools/python/python-pybluez_0.22.bb
index 4da2292..3f5a08f 100644
--- a/recipes-devtools/python/python-pybluez_0.22.bb
+++ b/recipes-devtools/python/python-pybluez_0.22.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += "\
     bluez5 \
     ${PYTHON_PN}-fcntl \
 "
+
+PNBLACKLIST[python-pybluez] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycodestyle_2.5.0.bb b/recipes-devtools/python/python-pycodestyle_2.5.0.bb
index 38ed843..5824cc2 100644
--- a/recipes-devtools/python/python-pycodestyle_2.5.0.bb
+++ b/recipes-devtools/python/python-pycodestyle_2.5.0.bb
@@ -19,3 +19,5 @@ do_install_append () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pycodestyle] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycparser_2.19.bb b/recipes-devtools/python/python-pycparser_2.19.bb
index 63c5a68..91b4b79 100644
--- a/recipes-devtools/python/python-pycparser_2.19.bb
+++ b/recipes-devtools/python/python-pycparser_2.19.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN}_class-target += "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pycparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycrypto_2.6.1.bb b/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 155027c..1f55325 100644
--- a/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -34,3 +34,5 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pycrypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycryptodomex_3.9.4.bb b/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
index 5201788..8867acc 100644
--- a/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
+++ b/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
@@ -27,3 +27,5 @@ FILES_${PN}-tests += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pycryptodomex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycurl_7.43.0.3.bb b/recipes-devtools/python/python-pycurl_7.43.0.3.bb
index 6d833cf..d55c5b6 100644
--- a/recipes-devtools/python/python-pycurl_7.43.0.3.bb
+++ b/recipes-devtools/python/python-pycurl_7.43.0.3.bb
@@ -25,3 +25,5 @@ DEPENDS = "\
     curl \
     ${PYTHON_PN}\
 "
+
+PNBLACKLIST[python-pycurl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pydbus_0.6.0.bb b/recipes-devtools/python/python-pydbus_0.6.0.bb
index bb848d7..6795aba 100644
--- a/recipes-devtools/python/python-pydbus_0.6.0.bb
+++ b/recipes-devtools/python/python-pydbus_0.6.0.bb
@@ -12,3 +12,5 @@ S = "${WORKDIR}/pydbus-${PV}"
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "${PYTHON_PN}-pygobject"
+
+PNBLACKLIST[python-pydbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyelftools_0.25.bb b/recipes-devtools/python/python-pyelftools_0.25.bb
index 2784637..0abbaa6 100644
--- a/recipes-devtools/python/python-pyelftools_0.25.bb
+++ b/recipes-devtools/python/python-pyelftools_0.25.bb
@@ -14,3 +14,5 @@ PYPI_PACKAGE = "pyelftools"
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-pyelftools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyexpect_1.0.19.bb b/recipes-devtools/python/python-pyexpect_1.0.19.bb
index d4547cf..9a914a7 100644
--- a/recipes-devtools/python/python-pyexpect_1.0.19.bb
+++ b/recipes-devtools/python/python-pyexpect_1.0.19.bb
@@ -9,3 +9,5 @@ inherit pypi setuptools
 
 SRC_URI[md5sum] = "dc744289858001925c75d21e26f1260f"
 SRC_URI[sha256sum] = "bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef"
+
+PNBLACKLIST[python-pyexpect] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyfirmata_1.1.0.bb b/recipes-devtools/python/python-pyfirmata_1.1.0.bb
index c43127a..b250376 100644
--- a/recipes-devtools/python/python-pyfirmata_1.1.0.bb
+++ b/recipes-devtools/python/python-pyfirmata_1.1.0.bb
@@ -12,3 +12,5 @@ SRC_URI[md5sum] = "159673cfb56c72ceafc30fe91eedd847"
 SRC_URI[sha256sum] = "cc180d1b30c85a2bbca62c15fef1b871db048cdcfa80959968356d97bd3ff08e"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-pyfirmata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyflakes_2.1.1.bb b/recipes-devtools/python/python-pyflakes_2.1.1.bb
index 1c03f39..22abd37 100644
--- a/recipes-devtools/python/python-pyflakes_2.1.1.bb
+++ b/recipes-devtools/python/python-pyflakes_2.1.1.bb
@@ -14,3 +14,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pyparsing"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyflakes] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyflame_1.6.7.bb b/recipes-devtools/python/python-pyflame_1.6.7.bb
index ad8003f..21f26c9 100644
--- a/recipes-devtools/python/python-pyflame_1.6.7.bb
+++ b/recipes-devtools/python/python-pyflame_1.6.7.bb
@@ -28,3 +28,5 @@ COMPATIBLE_HOST_aarch64_class-target = "null"
 COMPATIBLE_HOST_powerpc_class-target = "null"
 COMPATIBLE_HOST_riscv64_class-target = "null"
 COMPATIBLE_HOST_riscv32_class-target = "null"
+
+PNBLACKLIST[python-pyflame] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pygobject_3.34.0.bb b/recipes-devtools/python/python-pygobject_3.34.0.bb
index 2fd0b51..d825f05 100644
--- a/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -38,3 +38,5 @@ do_install_append() {
     # Remove files that clash with python3-pygobject; their content is same
     rm -r ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig
 }
+
+PNBLACKLIST[python-pygobject] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pygpgme_0.3.bb b/recipes-devtools/python/python-pygpgme_0.3.bb
index 14e967d..ac49f75 100644
--- a/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -24,3 +24,5 @@ do_install_ptest(){
     install ${S}/test_all.py ${D}${PTEST_PATH}
     cp -r ${S}/tests ${D}${PTEST_PATH}
 }
+
+PNBLACKLIST[python-pygpgme] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyhamcrest_1.9.0.bb b/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
index 8dbb79a..4d47222 100644
--- a/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
+++ b/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
 SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-pyhamcrest] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyiface_0.0.11.bb b/recipes-devtools/python/python-pyiface_0.0.11.bb
index a5486f2..e57ad13 100644
--- a/recipes-devtools/python/python-pyiface_0.0.11.bb
+++ b/recipes-devtools/python/python-pyiface_0.0.11.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "b066aa984656742738127c9c75436ab4"
 SRC_URI[sha256sum] = "e231e5735d329c5b2d4fc8854f069fdaa5436d3ef91ed64ee49e41e3f5e8a3f5"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-pyiface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyinotify_0.9.6.bb b/recipes-devtools/python/python-pyinotify_0.9.6.bb
index 4be1c4c..4a9fc0c 100644
--- a/recipes-devtools/python/python-pyinotify_0.9.6.bb
+++ b/recipes-devtools/python/python-pyinotify_0.9.6.bb
@@ -16,3 +16,5 @@ SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
 SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-pyinotify] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyjks_19.0.0.bb b/recipes-devtools/python/python-pyjks_19.0.0.bb
index c2dccd9..03f3452 100644
--- a/recipes-devtools/python/python-pyjks_19.0.0.bb
+++ b/recipes-devtools/python/python-pyjks_19.0.0.bb
@@ -21,3 +21,5 @@ RDEPENDS_${PN} = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyjks] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyjwt_1.7.1.bb b/recipes-devtools/python/python-pyjwt_1.7.1.bb
index 9d27cb7..d2830b5 100644
--- a/recipes-devtools/python/python-pyjwt_1.7.1.bb
+++ b/recipes-devtools/python/python-pyjwt_1.7.1.bb
@@ -15,3 +15,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} = "${PYTHON_PN}-cryptography"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyjwt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pylint_1.8.3.bb b/recipes-devtools/python/python-pylint_1.8.3.bb
index 223a5b0..a0a5011 100644
--- a/recipes-devtools/python/python-pylint_1.8.3.bb
+++ b/recipes-devtools/python/python-pylint_1.8.3.bb
@@ -37,3 +37,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-astroid \
                    ${PYTHON_PN}-difflib \
                    ${PYTHON_PN}-netserver \
                   "
+
+PNBLACKLIST[python-pylint] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pymisp_2.4.119.1.bb b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
index 627716b..995540d 100644
--- a/recipes-devtools/python/python-pymisp_2.4.119.1.bb
+++ b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
@@ -25,3 +25,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-requests \
     ${PYTHON_PN}-six \
 "
+
+PNBLACKLIST[python-pymisp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pymongo_3.10.1.bb b/recipes-devtools/python/python-pymongo_3.10.1.bb
index 3a17320..62d2216 100644
--- a/recipes-devtools/python/python-pymongo_3.10.1.bb
+++ b/recipes-devtools/python/python-pymongo_3.10.1.bb
@@ -29,3 +29,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-bson \
     ${PYTHON_PN}-pprint \
 "
+
+PNBLACKLIST[python-pymongo] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pymysql_0.9.3.bb b/recipes-devtools/python/python-pymysql_0.9.3.bb
index df87913..f4d8c50 100644
--- a/recipes-devtools/python/python-pymysql_0.9.3.bb
+++ b/recipes-devtools/python/python-pymysql_0.9.3.bb
@@ -17,3 +17,5 @@ inherit pypi setuptools
 PYPI_PACKAGE = "PyMySQL"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-cryptography"
+
+PNBLACKLIST[python-pymysql] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pynetlinux_1.1.bb b/recipes-devtools/python/python-pynetlinux_1.1.bb
index 313e2c7..291ada1 100644
--- a/recipes-devtools/python/python-pynetlinux_1.1.bb
+++ b/recipes-devtools/python/python-pynetlinux_1.1.bb
@@ -10,3 +10,5 @@ inherit pypi setuptools
 
 SRC_URI[md5sum] = "3336e5d4a478acca4e35bf3125b4f883"
 SRC_URI[sha256sum] = "4ad08298c9f5ba15a11cddc639ba8778cabdfc402b51066d9e0a325e5a5b391c"
+
+PNBLACKLIST[python-pynetlinux] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyopenssl_19.1.0.bb b/recipes-devtools/python/python-pyopenssl_19.1.0.bb
index 634c276..7fae532 100644
--- a/recipes-devtools/python/python-pyopenssl_19.1.0.bb
+++ b/recipes-devtools/python/python-pyopenssl_19.1.0.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN}_class-target = " \
 RDEPENDS_${PN}-tests = "${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyopenssl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyparsing_2.4.6.bb b/recipes-devtools/python/python-pyparsing_2.4.6.bb
index dcf224c..aa8695c 100644
--- a/recipes-devtools/python/python-pyparsing_2.4.6.bb
+++ b/recipes-devtools/python/python-pyparsing_2.4.6.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+PNBLACKLIST[python-pyparsing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyperclip_1.7.0.bb b/recipes-devtools/python/python-pyperclip_1.7.0.bb
index 0df824b..ae7a23b 100644
--- a/recipes-devtools/python/python-pyperclip_1.7.0.bb
+++ b/recipes-devtools/python/python-pyperclip_1.7.0.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+PNBLACKLIST[python-pyperclip] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyperf_1.7.0.bb b/recipes-devtools/python/python-pyperf_1.7.0.bb
index e722b08..1c1e451 100644
--- a/recipes-devtools/python/python-pyperf_1.7.0.bb
+++ b/recipes-devtools/python/python-pyperf_1.7.0.bb
@@ -32,3 +32,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-statistics \
 "
+
+PNBLACKLIST[python-pyperf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrex-native_0.9.9.bb b/recipes-devtools/python/python-pyrex-native_0.9.9.bb
index e8ef1aa..620753b 100644
--- a/recipes-devtools/python/python-pyrex-native_0.9.9.bb
+++ b/recipes-devtools/python/python-pyrex-native_0.9.9.bb
@@ -3,3 +3,5 @@ inherit native pythonnative
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
 PR = "r3"
+
+PNBLACKLIST[python-pyrex-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrex_0.9.9.bb b/recipes-devtools/python/python-pyrex_0.9.9.bb
index c4dd2e6..3df784f 100644
--- a/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -20,3 +20,5 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit distutils
 
 FILES_${PN} += "${datadir}${base_libdir}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
+
+PNBLACKLIST[python-pyrex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyroute2_0.5.7.bb b/recipes-devtools/python/python-pyroute2_0.5.7.bb
index 4ad9746..c17bf11 100644
--- a/recipes-devtools/python/python-pyroute2_0.5.7.bb
+++ b/recipes-devtools/python/python-pyroute2_0.5.7.bb
@@ -24,3 +24,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-unixadmin \
 "
+
+PNBLACKLIST[python-pyroute2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrsistent_0.15.7.bb b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
index 970e51b..618a767 100644
--- a/recipes-devtools/python/python-pyrsistent_0.15.7.bb
+++ b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN}_append_class-target = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyrsistent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrtm_0.4.2.bb b/recipes-devtools/python/python-pyrtm_0.4.2.bb
index 69580cb..bffd0b1 100644
--- a/recipes-devtools/python/python-pyrtm_0.4.2.bb
+++ b/recipes-devtools/python/python-pyrtm_0.4.2.bb
@@ -37,3 +37,5 @@ RDEPENDS_${PN}-tests += " \
 
 # meta-python recipe did not follow Debian naming
 PROVIDES += "pyrtm"
+
+PNBLACKLIST[python-pyrtm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyserial_3.4.bb b/recipes-devtools/python/python-pyserial_3.4.bb
index 998839d..fc0a131 100644
--- a/recipes-devtools/python/python-pyserial_3.4.bb
+++ b/recipes-devtools/python/python-pyserial_3.4.bb
@@ -43,3 +43,5 @@ RDEPENDS_${PN} = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyserial] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysmi_0.3.4.bb b/recipes-devtools/python/python-pysmi_0.3.4.bb
index 43aa4b8..d7c3de9 100644
--- a/recipes-devtools/python/python-pysmi_0.3.4.bb
+++ b/recipes-devtools/python/python-pysmi_0.3.4.bb
@@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "python-ply"
+
+PNBLACKLIST[python-pysmi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysnmp_4.4.9.bb b/recipes-devtools/python/python-pysnmp_4.4.9.bb
index 2d98991..edb37a8 100644
--- a/recipes-devtools/python/python-pysnmp_4.4.9.bb
+++ b/recipes-devtools/python/python-pysnmp_4.4.9.bb
@@ -24,3 +24,5 @@ RDEPENDS_${PN} += "python-pycryptodomex \
                    python-pyasn1 \
                    python-pysmi \
 "
+
+PNBLACKLIST[python-pysnmp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysocks_1.7.1.bb b/recipes-devtools/python/python-pysocks_1.7.1.bb
index 2ef2314..0bfc893 100644
--- a/recipes-devtools/python/python-pysocks_1.7.1.bb
+++ b/recipes-devtools/python/python-pysocks_1.7.1.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN}_class-target += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pysocks] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysqlite_2.8.3.bb b/recipes-devtools/python/python-pysqlite_2.8.3.bb
index ec8cec4..2f4d6fe 100644
--- a/recipes-devtools/python/python-pysqlite_2.8.3.bb
+++ b/recipes-devtools/python/python-pysqlite_2.8.3.bb
@@ -19,3 +19,5 @@ RDEPENDS_${PN}_class-target += "\
 "
 
 FILES_${PN}-doc += "${datadir}"
+
+PNBLACKLIST[python-pysqlite] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pystache_0.5.4.bb b/recipes-devtools/python/python-pystache_0.5.4.bb
index 4f9129a..95a953c 100644
--- a/recipes-devtools/python/python-pystache_0.5.4.bb
+++ b/recipes-devtools/python/python-pystache_0.5.4.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pystache] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb b/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
index 5d8ee05..fd357bb 100644
--- a/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
+++ b/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += " \
     python-pytest \
     "
+
+PNBLACKLIST[python-pytest-helpers-namespace] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest-runner_5.2.bb b/recipes-devtools/python/python-pytest-runner_5.2.bb
index 55fda2f..111ad61 100644
--- a/recipes-devtools/python/python-pytest-runner_5.2.bb
+++ b/recipes-devtools/python/python-pytest-runner_5.2.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger
 RDEPENDS_${PN} += "python-argparse python-compiler"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pytest-runner] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb b/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
index 4e8489d..8bc8fa6 100644
--- a/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
+++ b/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
@@ -15,3 +15,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += " \
     python-pytest \
     "
+
+PNBLACKLIST[python-pytest-tempdir] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest_4.6.9.bb b/recipes-devtools/python/python-pytest_4.6.9.bb
index c1cf0ac..b3ac32b 100644
--- a/recipes-devtools/python/python-pytest_4.6.9.bb
+++ b/recipes-devtools/python/python-pytest_4.6.9.bb
@@ -48,3 +48,5 @@ ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
 ALTERNATIVE_PRIORITY = "10"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pytest] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytoml_0.1.21.bb b/recipes-devtools/python/python-pytoml_0.1.21.bb
index 3dcd46c..10da348 100644
--- a/recipes-devtools/python/python-pytoml_0.1.21.bb
+++ b/recipes-devtools/python/python-pytoml_0.1.21.bb
@@ -13,3 +13,5 @@ inherit pypi
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pytoml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytz_2019.3.bb b/recipes-devtools/python/python-pytz_2019.3.bb
index 6847333..c8c4a10 100755
--- a/recipes-devtools/python/python-pytz_2019.3.bb
+++ b/recipes-devtools/python/python-pytz_2019.3.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN}_class-target += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pytz] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyudev_0.21.0.bb b/recipes-devtools/python/python-pyudev_0.21.0.bb
index 8db82de..62c83b0 100644
--- a/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} = "\
     libudev \
 "
 
+
+PNBLACKLIST[python-pyudev] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyusb_1.0.2.bb b/recipes-devtools/python/python-pyusb_1.0.2.bb
index 683dcef..374251c 100644
--- a/recipes-devtools/python/python-pyusb_1.0.2.bb
+++ b/recipes-devtools/python/python-pyusb_1.0.2.bb
@@ -11,3 +11,5 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+PNBLACKLIST[python-pyusb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyyaml_5.4.1.bb b/recipes-devtools/python/python-pyyaml_5.4.1.bb
index 2873d25..76799f8 100644
--- a/recipes-devtools/python/python-pyyaml_5.4.1.bb
+++ b/recipes-devtools/python/python-pyyaml_5.4.1.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-pyyaml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyzmq_17.1.0.bb b/recipes-devtools/python/python-pyzmq_17.1.0.bb
index d635f4e..a0288f2 100644
--- a/recipes-devtools/python/python-pyzmq_17.1.0.bb
+++ b/recipes-devtools/python/python-pyzmq_17.1.0.bb
@@ -25,3 +25,5 @@ do_compile_prepend() {
     echo libzmq_extension = False >> ${S}/setup.cfg
     echo no_libzmq_extension = True >> ${S}/setup.cfg
 }
+
+PNBLACKLIST[python-pyzmq] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rdflib_4.2.2.bb b/recipes-devtools/python/python-rdflib_4.2.2.bb
index 7814f0c..f1fa4fe 100644
--- a/recipes-devtools/python/python-rdflib_4.2.2.bb
+++ b/recipes-devtools/python/python-rdflib_4.2.2.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-rdflib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-redis_2.10.6.bb b/recipes-devtools/python/python-redis_2.10.6.bb
index 4b6ff93..943e0d3 100644
--- a/recipes-devtools/python/python-redis_2.10.6.bb
+++ b/recipes-devtools/python/python-redis_2.10.6.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
 "
+
+PNBLACKLIST[python-redis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb b/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
index 0d4b4b9..a1cf2f2 100644
--- a/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
+++ b/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
@@ -10,3 +10,5 @@ inherit pypi setuptools
 
 RDEPENDS_${PN} += "${PYTHON_PN}-requests"
 
+
+PNBLACKLIST[python-requests-oauthlib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-requests_2.23.0.bb b/recipes-devtools/python/python-requests_2.23.0.bb
index 52df65c..bdfe3d5 100644
--- a/recipes-devtools/python/python-requests_2.23.0.bb
+++ b/recipes-devtools/python/python-requests_2.23.0.bb
@@ -32,3 +32,5 @@ CVE_PRODUCT = "requests"
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+PNBLACKLIST[python-requests] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb b/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
index b94146c..ec4773f 100644
--- a/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
+++ b/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-rfc3339-validator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb b/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
index db28e4f..1b31961 100644
--- a/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
+++ b/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
@@ -21,3 +21,5 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-rfc3986-validator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rfc3987_1.3.8.bb b/recipes-devtools/python/python-rfc3987_1.3.8.bb
index 89cf300..9325079 100644
--- a/recipes-devtools/python/python-rfc3987_1.3.8.bb
+++ b/recipes-devtools/python/python-rfc3987_1.3.8.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-rfc3987] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb b/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
index 48ceb89..352d67a 100644
--- a/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
+++ b/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-robotframework-seriallibrary] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-robotframework_3.0.4.bb b/recipes-devtools/python/python-robotframework_3.0.4.bb
index d694279..b700640 100644
--- a/recipes-devtools/python/python-robotframework_3.0.4.bb
+++ b/recipes-devtools/python/python-robotframework_3.0.4.bb
@@ -26,3 +26,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-xml \
     ${PYTHON_PN}-zlib \
 "
+
+PNBLACKLIST[python-robotframework] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-scandir_1.10.0.bb b/recipes-devtools/python/python-scandir_1.10.0.bb
index 9de2724..df1a499 100644
--- a/recipes-devtools/python/python-scandir_1.10.0.bb
+++ b/recipes-devtools/python/python-scandir_1.10.0.bb
@@ -11,4 +11,5 @@ S = "${WORKDIR}/git"
 
 inherit setuptools
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
+PNBLACKLIST[python-scandir] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-scrypt_0.8.6.bb b/recipes-devtools/python/python-scrypt_0.8.6.bb
index 812ff08..5176653 100644
--- a/recipes-devtools/python/python-scrypt_0.8.6.bb
+++ b/recipes-devtools/python/python-scrypt_0.8.6.bb
@@ -15,3 +15,5 @@ inherit pypi setuptools python-dir
 RDEPENDS_${PN}_class-target += "\
 "
 
+
+PNBLACKLIST[python-scrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sdnotify_0.3.2.bb b/recipes-devtools/python/python-sdnotify_0.3.2.bb
index 64979a9..ac542e8 100644
--- a/recipes-devtools/python/python-sdnotify_0.3.2.bb
+++ b/recipes-devtools/python/python-sdnotify_0.3.2.bb
@@ -15,3 +15,5 @@ SRC_URI[md5sum] = "749ddca1c70be1697fecc443fb1fdb16"
 SRC_URI[sha256sum] = "73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1"
 
 inherit setuptools pypi
+
+PNBLACKLIST[python-sdnotify] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-selectors34_1.2.bb b/recipes-devtools/python/python-selectors34_1.2.bb
index 69545eb..579841f 100644
--- a/recipes-devtools/python/python-selectors34_1.2.bb
+++ b/recipes-devtools/python/python-selectors34_1.2.bb
@@ -10,3 +10,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-six \
     "    
+
+PNBLACKLIST[python-selectors34] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-semver_2.8.1.bb b/recipes-devtools/python/python-semver_2.8.1.bb
index 6fd1920..90ccbed 100644
--- a/recipes-devtools/python/python-semver_2.8.1.bb
+++ b/recipes-devtools/python/python-semver_2.8.1.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-semver] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-serpent_1.28.bb b/recipes-devtools/python/python-serpent_1.28.bb
index a225c9b..717df16 100644
--- a/recipes-devtools/python/python-serpent_1.28.bb
+++ b/recipes-devtools/python/python-serpent_1.28.bb
@@ -11,3 +11,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-numbers \
     "    
+
+PNBLACKLIST[python-serpent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-setuptools-scm_3.3.3.bb b/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
index 47782a2..9fd9ef4 100644
--- a/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
+++ b/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
@@ -16,3 +16,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
 
 BBCLASSEXTEND = "native"
 
+
+PNBLACKLIST[python-setuptools-scm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-setuptools_42.0.2.bb b/recipes-devtools/python/python-setuptools_42.0.2.bb
index cf94404..4cc316e 100644
--- a/recipes-devtools/python/python-setuptools_42.0.2.bb
+++ b/recipes-devtools/python/python-setuptools_42.0.2.bb
@@ -7,3 +7,5 @@ inherit setuptools
 RREPLACES_${PN} = "python-distribute"
 RPROVIDES_${PN} = "python-distribute"
 RCONFLICTS_${PN} = "python-distribute"
+
+PNBLACKLIST[python-setuptools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sh_1.12.14.bb b/recipes-devtools/python/python-sh_1.12.14.bb
index 2eba7b6..03640e4 100644
--- a/recipes-devtools/python/python-sh_1.12.14.bb
+++ b/recipes-devtools/python/python-sh_1.12.14.bb
@@ -35,3 +35,5 @@ RDEPENDS_${PN} += " \
 #    signal - part of core in python3. not sure how it is imported in python2.
 #             No complants in compiling.
 
+
+PNBLACKLIST[python-sh] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sijax_0.3.2.bb b/recipes-devtools/python/python-sijax_0.3.2.bb
index e1896d3..9c13a51 100644
--- a/recipes-devtools/python/python-sijax_0.3.2.bb
+++ b/recipes-devtools/python/python-sijax_0.3.2.bb
@@ -10,3 +10,5 @@ inherit pypi setuptools
 
 SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
 
+
+PNBLACKLIST[python-sijax] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-simplejson_3.17.0.bb b/recipes-devtools/python/python-simplejson_3.17.0.bb
index 050c434..89002a3 100644
--- a/recipes-devtools/python/python-simplejson_3.17.0.bb
+++ b/recipes-devtools/python/python-simplejson_3.17.0.bb
@@ -24,3 +24,5 @@ FILES_${PN}-tests+= " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-simplejson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
index 44c9505..43b7a1d 100644
--- a/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
+++ b/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
 SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-singledispatch] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-six_1.14.0.bb b/recipes-devtools/python/python-six_1.14.0.bb
index 779883a..c8a62a4 100644
--- a/recipes-devtools/python/python-six_1.14.0.bb
+++ b/recipes-devtools/python/python-six_1.14.0.bb
@@ -4,3 +4,5 @@ require recipes-devtools/python/python-six.inc
 SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
 SRC_URI[sha256sum] = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
 
+
+PNBLACKLIST[python-six] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-slip-dbus_0.6.5.bb b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
index 0c67fa3..6099ecf 100644
--- a/recipes-devtools/python/python-slip-dbus_0.6.5.bb
+++ b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
@@ -36,3 +36,5 @@ RDEPENDS_${PN} += "\
     "
 
 inherit setuptools
+
+PNBLACKLIST[python-slip-dbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-smbus_4.1.bb b/recipes-devtools/python/python-smbus_4.1.bb
index f881cf7..0dc44f8 100644
--- a/recipes-devtools/python/python-smbus_4.1.bb
+++ b/recipes-devtools/python/python-smbus_4.1.bb
@@ -12,3 +12,5 @@ DEPENDS += "i2c-tools"
 S = "${WORKDIR}/i2c-tools-${PV}/py-smbus"
 
 inherit distutils
+
+PNBLACKLIST[python-smbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-snakefood_1.4.bb b/recipes-devtools/python/python-snakefood_1.4.bb
index e4a6d76..f85b284 100644
--- a/recipes-devtools/python/python-snakefood_1.4.bb
+++ b/recipes-devtools/python/python-snakefood_1.4.bb
@@ -49,3 +49,5 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
+
+PNBLACKLIST[python-snakefood] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-snimpy_0.8.13.bb b/recipes-devtools/python/python-snimpy_0.8.13.bb
index c885a7f..173e66d 100644
--- a/recipes-devtools/python/python-snimpy_0.8.13.bb
+++ b/recipes-devtools/python/python-snimpy_0.8.13.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN} = "python-cffi \
                   python-pysnmp \
                   python-setuptools \
 "
+
+PNBLACKLIST[python-snimpy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-socketio_4.3.1.bb b/recipes-devtools/python/python-socketio_4.3.1.bb
index 44cde08..fa99f33 100644
--- a/recipes-devtools/python/python-socketio_4.3.1.bb
+++ b/recipes-devtools/python/python-socketio_4.3.1.bb
@@ -26,3 +26,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-attrs \
     "
+
+PNBLACKLIST[python-socketio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-soupsieve_1.9.4.bb b/recipes-devtools/python/python-soupsieve_1.9.4.bb
index d62fd35..8c73a53 100644
--- a/recipes-devtools/python/python-soupsieve_1.9.4.bb
+++ b/recipes-devtools/python/python-soupsieve_1.9.4.bb
@@ -12,3 +12,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-soupsieve] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sparts_0.7.3.bb b/recipes-devtools/python/python-sparts_0.7.3.bb
index a125311..945e076 100644
--- a/recipes-devtools/python/python-sparts_0.7.3.bb
+++ b/recipes-devtools/python/python-sparts_0.7.3.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} = "\
                python-daemonize \
                python-futures \
 "
+
+PNBLACKLIST[python-sparts] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-speaklater_1.3.bb b/recipes-devtools/python/python-speaklater_1.3.bb
index a6f6855..c4a625d 100644
--- a/recipes-devtools/python/python-speaklater_1.3.bb
+++ b/recipes-devtools/python/python-speaklater_1.3.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd
 PYPI_PACKAGE = "speaklater"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-speaklater] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sqlalchemy_1.3.12.bb b/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
index 15bee0d..fb76625 100644
--- a/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
+++ b/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
 "
 
+
+PNBLACKLIST[python-sqlalchemy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sqlparse_0.3.0.bb b/recipes-devtools/python/python-sqlparse_0.3.0.bb
index 329ccff..fbf20eb 100644
--- a/recipes-devtools/python/python-sqlparse_0.3.0.bb
+++ b/recipes-devtools/python/python-sqlparse_0.3.0.bb
@@ -15,3 +15,5 @@ export BUILD_SYS
 export HOST_SYS
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-sqlparse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-statistics_1.0.3.5.bb b/recipes-devtools/python/python-statistics_1.0.3.5.bb
index ee3b822..5e44d2b 100644
--- a/recipes-devtools/python/python-statistics_1.0.3.5.bb
+++ b/recipes-devtools/python/python-statistics_1.0.3.5.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "2dc379b80b07bf2ddd5488cad06b2b9531da4dd31edb04dc9ec0dc2264
 inherit pypi setuptools
 
 PYPI_PACKAGE = "statistics"
+
+PNBLACKLIST[python-statistics] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-stevedore_1.31.0.bb b/recipes-devtools/python/python-stevedore_1.31.0.bb
index 0c9579f..1f91e4b 100644
--- a/recipes-devtools/python/python-stevedore_1.31.0.bb
+++ b/recipes-devtools/python/python-stevedore_1.31.0.bb
@@ -14,3 +14,5 @@ DEPENDS += "${PYTHON_PN}-pbr-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-stevedore] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-strict-rfc3339_0.7.bb b/recipes-devtools/python/python-strict-rfc3339_0.7.bb
index 896e9c8..a10d2e2 100644
--- a/recipes-devtools/python/python-strict-rfc3339_0.7.bb
+++ b/recipes-devtools/python/python-strict-rfc3339_0.7.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-strict-rfc3339] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-subprocess32_3.2.7.bb b/recipes-devtools/python/python-subprocess32_3.2.7.bb
index f437069..cf29acc 100644
--- a/recipes-devtools/python/python-subprocess32_3.2.7.bb
+++ b/recipes-devtools/python/python-subprocess32_3.2.7.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "1e450a4a4c53bf197ad6402c564b9f7a53539385918ef8f12bdf430a61
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-subprocess32] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-systemd_234.bb b/recipes-devtools/python/python-systemd_234.bb
index c9827b1..680d81e 100644
--- a/recipes-devtools/python/python-systemd_234.bb
+++ b/recipes-devtools/python/python-systemd_234.bb
@@ -19,3 +19,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
 SRC_URI += "file://endian.patch"
 
 SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
+
+PNBLACKLIST[python-systemd] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-toml_0.10.0.bb b/recipes-devtools/python/python-toml_0.10.0.bb
index 02006fe..6e54315 100644
--- a/recipes-devtools/python/python-toml_0.10.0.bb
+++ b/recipes-devtools/python/python-toml_0.10.0.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
 "
+
+PNBLACKLIST[python-toml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tornado-redis_2.4.18.bb b/recipes-devtools/python/python-tornado-redis_2.4.18.bb
index 46a20a5..2413f99 100644
--- a/recipes-devtools/python/python-tornado-redis_2.4.18.bb
+++ b/recipes-devtools/python/python-tornado-redis_2.4.18.bb
@@ -16,3 +16,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "python-tornado"
 
 RDEPENDS_${PN}-test += "${PN} python-tornado"
+
+PNBLACKLIST[python-tornado-redis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tornado_6.0.3.bb b/recipes-devtools/python/python-tornado_6.0.3.bb
index abec93c..a7c1fdb 100644
--- a/recipes-devtools/python/python-tornado_6.0.3.bb
+++ b/recipes-devtools/python/python-tornado_6.0.3.bb
@@ -33,3 +33,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-singledispatch \
     ${PYTHON_PN}-subprocess \
 "
+
+PNBLACKLIST[python-tornado] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tqdm_4.41.1.bb b/recipes-devtools/python/python-tqdm_4.41.1.bb
index 22393bb..05d6a3f 100644
--- a/recipes-devtools/python/python-tqdm_4.41.1.bb
+++ b/recipes-devtools/python/python-tqdm_4.41.1.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN}_append_class-target = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-tqdm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-traceback2_1.4.0.bb b/recipes-devtools/python/python-traceback2_1.4.0.bb
index 696c875..7dea468 100644
--- a/recipes-devtools/python/python-traceback2_1.4.0.bb
+++ b/recipes-devtools/python/python-traceback2_1.4.0.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools
 CLEANBROKEN = "1"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-linecache2"
+
+PNBLACKLIST[python-traceback2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-twisted_19.10.0.bb b/recipes-devtools/python/python-twisted_19.10.0.bb
index aee6f5a..72a87c8 100644
--- a/recipes-devtools/python/python-twisted_19.10.0.bb
+++ b/recipes-devtools/python/python-twisted_19.10.0.bb
@@ -288,3 +288,5 @@ RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
 RDEPENDS_${PN} += " \
     ${PN}-news \
 "
+
+PNBLACKLIST[python-twisted] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-twitter_3.8.0.bb b/recipes-devtools/python/python-twitter_3.8.0.bb
index 72cbb09..1bd13cc 100644
--- a/recipes-devtools/python/python-twitter_3.8.0.bb
+++ b/recipes-devtools/python/python-twitter_3.8.0.bb
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += "\
         ${PYTHON_PN}-six \
         "
 
+
+PNBLACKLIST[python-twitter] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-twofish_0.3.0.bb b/recipes-devtools/python/python-twofish_0.3.0.bb
index c1baa7c..b44c458 100644
--- a/recipes-devtools/python/python-twofish_0.3.0.bb
+++ b/recipes-devtools/python/python-twofish_0.3.0.bb
@@ -11,3 +11,5 @@ SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41ac
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-twofish] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-typing_3.7.4.1.bb b/recipes-devtools/python/python-typing_3.7.4.1.bb
index 744c7b0..ebb23ff 100644
--- a/recipes-devtools/python/python-typing_3.7.4.1.bb
+++ b/recipes-devtools/python/python-typing_3.7.4.1.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "91dfe6f3f706ee8cc32d38edbbf304e9b7583fb37108fef38229617f8b
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-typing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tzlocal_2.0.0.bb b/recipes-devtools/python/python-tzlocal_2.0.0.bb
index 0243784..bfcb754 100644
--- a/recipes-devtools/python/python-tzlocal_2.0.0.bb
+++ b/recipes-devtools/python/python-tzlocal_2.0.0.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "b14262cecca16ec9220ca8dff2ca7c5d"
 SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-tzlocal] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ujson_1.35.bb b/recipes-devtools/python/python-ujson_1.35.bb
index bc982fc..017fa23 100644
--- a/recipes-devtools/python/python-ujson_1.35.bb
+++ b/recipes-devtools/python/python-ujson_1.35.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-ujson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-unidiff_0.5.5.bb b/recipes-devtools/python/python-unidiff_0.5.5.bb
index e658cf8..dbc32ae 100644
--- a/recipes-devtools/python/python-unidiff_0.5.5.bb
+++ b/recipes-devtools/python/python-unidiff_0.5.5.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-io \
 "
+
+PNBLACKLIST[python-unidiff] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-urllib3_1.25.7.bb b/recipes-devtools/python/python-urllib3_1.25.7.bb
index 6487d89..a185215 100644
--- a/recipes-devtools/python/python-urllib3_1.25.7.bb
+++ b/recipes-devtools/python/python-urllib3_1.25.7.bb
@@ -21,3 +21,5 @@ RDEPENDS_${PN} += "\
 CVE_PRODUCT = "urllib3"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-urllib3] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-vcversioner_2.16.0.0.bb b/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
index e6cc4ac..dbea395 100644
--- a/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
+++ b/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-vcversioner] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-versiontools_1.9.1.bb b/recipes-devtools/python/python-versiontools_1.9.1.bb
index a30dff3..aab7073 100644
--- a/recipes-devtools/python/python-versiontools_1.9.1.bb
+++ b/recipes-devtools/python/python-versiontools_1.9.1.bb
@@ -9,3 +9,5 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
 SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"
 
+
+PNBLACKLIST[python-versiontools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-vine_1.1.4.bb b/recipes-devtools/python/python-vine_1.1.4.bb
index 268675d..19b622f 100644
--- a/recipes-devtools/python/python-vine_1.1.4.bb
+++ b/recipes-devtools/python/python-vine_1.1.4.bb
@@ -11,3 +11,5 @@ inherit setuptools pypi
 
 RDEPENDS_${PN} += " \
         "
+
+PNBLACKLIST[python-vine] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-visitor_0.1.3.bb b/recipes-devtools/python/python-visitor_0.1.3.bb
index 1236506..c14bba2 100644
--- a/recipes-devtools/python/python-visitor_0.1.3.bb
+++ b/recipes-devtools/python/python-visitor_0.1.3.bb
@@ -6,3 +6,5 @@ SRC_URI[md5sum] = "94a024ed0ec1b02b4497c15267d319ca"
 SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a"
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-visitor] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-vobject_0.9.6.1.bb b/recipes-devtools/python/python-vobject_0.9.6.1.bb
index d31f2f5..dd5faea 100644
--- a/recipes-devtools/python/python-vobject_0.9.6.1.bb
+++ b/recipes-devtools/python/python-vobject_0.9.6.1.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-numbers \
     "
+
+PNBLACKLIST[python-vobject] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-waitress_1.4.2.bb b/recipes-devtools/python/python-waitress_1.4.2.bb
index 109f222..d982b4f 100644
--- a/recipes-devtools/python/python-waitress_1.4.2.bb
+++ b/recipes-devtools/python/python-waitress_1.4.2.bb
@@ -17,3 +17,5 @@ RDEPENDS_${PN}_append_class-target = "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-re \
     "
+
+PNBLACKLIST[python-waitress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-wcwidth_0.1.8.bb b/recipes-devtools/python/python-wcwidth_0.1.8.bb
index 70e457e..99f05a7 100644
--- a/recipes-devtools/python/python-wcwidth_0.1.8.bb
+++ b/recipes-devtools/python/python-wcwidth_0.1.8.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "f28b3e8a6483e5d49e7f8949ac1a78314e740333ae305b4ba5defd3e74
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-wcwidth] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-webcolors_1.8.1.bb b/recipes-devtools/python/python-webcolors_1.8.1.bb
index f59ee40..50b6d16 100644
--- a/recipes-devtools/python/python-webcolors_1.8.1.bb
+++ b/recipes-devtools/python/python-webcolors_1.8.1.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN}_class-target = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-webcolors] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-webdav_0.1.2.bb b/recipes-devtools/python/python-webdav_0.1.2.bb
index 7a6437d..a844509 100644
--- a/recipes-devtools/python/python-webdav_0.1.2.bb
+++ b/recipes-devtools/python/python-webdav_0.1.2.bb
@@ -17,3 +17,5 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
+
+PNBLACKLIST[python-webdav] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-webencodings_0.5.1.bb b/recipes-devtools/python/python-webencodings_0.5.1.bb
index 0851853..184d743 100644
--- a/recipes-devtools/python/python-webencodings_0.5.1.bb
+++ b/recipes-devtools/python/python-webencodings_0.5.1.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-webencodings] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-websocket-client_0.57.0.bb b/recipes-devtools/python/python-websocket-client_0.57.0.bb
index 0fc21b0..bc471a4 100644
--- a/recipes-devtools/python/python-websocket-client_0.57.0.bb
+++ b/recipes-devtools/python/python-websocket-client_0.57.0.bb
@@ -9,3 +9,5 @@ PYPI_PACKAGE = "websocket_client"
 
 SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
 SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
+
+PNBLACKLIST[python-websocket-client] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-werkzeug_0.16.0.bb b/recipes-devtools/python/python-werkzeug_0.16.0.bb
index 0fd9bd8..b6c2e94 100644
--- a/recipes-devtools/python/python-werkzeug_0.16.0.bb
+++ b/recipes-devtools/python/python-werkzeug_0.16.0.bb
@@ -49,3 +49,5 @@ RDEPENDS_${PN}-tests = " \
 "
 inherit pypi setuptools
 
+
+PNBLACKLIST[python-werkzeug] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-which_1.1.0.bb b/recipes-devtools/python/python-which_1.1.0.bb
index 901fdc7..b417d0f 100644
--- a/recipes-devtools/python/python-which_1.1.0.bb
+++ b/recipes-devtools/python/python-which_1.1.0.bb
@@ -17,3 +17,5 @@ do_install_append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-which] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-whoosh_2.7.4.bb b/recipes-devtools/python/python-whoosh_2.7.4.bb
index 70c6674..ef0c078 100644
--- a/recipes-devtools/python/python-whoosh_2.7.4.bb
+++ b/recipes-devtools/python/python-whoosh_2.7.4.bb
@@ -25,3 +25,5 @@ RDEPENDS_${PN} += " \
 "
 inherit pypi setuptools
 
+
+PNBLACKLIST[python-whoosh] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-wrapt_1.11.2.bb b/recipes-devtools/python/python-wrapt_1.11.2.bb
index 9a9e2f4..7a5cf4e 100644
--- a/recipes-devtools/python/python-wrapt_1.11.2.bb
+++ b/recipes-devtools/python/python-wrapt_1.11.2.bb
@@ -32,3 +32,5 @@ RDEPENDS_${PN}_append_class-target = "\
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-threading \
 "
+
+PNBLACKLIST[python-wrapt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-wtforms_2.2.1.bb b/recipes-devtools/python/python-wtforms_2.2.1.bb
index 5511ac3..1bae8ae 100644
--- a/recipes-devtools/python/python-wtforms_2.2.1.bb
+++ b/recipes-devtools/python/python-wtforms_2.2.1.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
     "
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-wtforms] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-xlrd_1.2.0.bb b/recipes-devtools/python/python-xlrd_1.2.0.bb
index c6e7f60..9c67e52 100644
--- a/recipes-devtools/python/python-xlrd_1.2.0.bb
+++ b/recipes-devtools/python/python-xlrd_1.2.0.bb
@@ -14,3 +14,5 @@ inherit pypi setuptools
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-xlrd] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb b/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
index 088bffc..ca1ef9d 100644
--- a/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
+++ b/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
@@ -17,3 +17,5 @@ DEPENDS += " \
         "
 
 inherit pypi setuptools
+
+PNBLACKLIST[python-xstatic-font-awesome] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-xstatic_1.0.2.bb b/recipes-devtools/python/python-xstatic_1.0.2.bb
index 5b58d2c..f988e12 100644
--- a/recipes-devtools/python/python-xstatic_1.0.2.bb
+++ b/recipes-devtools/python/python-xstatic_1.0.2.bb
@@ -14,3 +14,5 @@ DEPENDS += " \
         ${PYTHON_PN}-pip \
         "
 inherit pypi setuptools
+
+PNBLACKLIST[python-xstatic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-yappi_1.0.bb b/recipes-devtools/python/python-yappi_1.0.bb
index b217fb2..cb80af0 100644
--- a/recipes-devtools/python/python-yappi_1.0.bb
+++ b/recipes-devtools/python/python-yappi_1.0.bb
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-threading \
     "
+
+PNBLACKLIST[python-yappi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-zipp_0.6.0.bb b/recipes-devtools/python/python-zipp_0.6.0.bb
index df99532..0ef2caa 100644
--- a/recipes-devtools/python/python-zipp_0.6.0.bb
+++ b/recipes-devtools/python/python-zipp_0.6.0.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
 inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
+
+PNBLACKLIST[python-zipp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-zopeinterface_4.7.1.bb b/recipes-devtools/python/python-zopeinterface_4.7.1.bb
index d2ef64f..99c9213 100644
--- a/recipes-devtools/python/python-zopeinterface_4.7.1.bb
+++ b/recipes-devtools/python/python-zopeinterface_4.7.1.bb
@@ -23,3 +23,5 @@ FILES_${PN}-test += " \
 inherit pypi setuptools
 
 RDEPENDS_${PN}-test += "python-unittest python-doctest"
+
+PNBLACKLIST[python-zopeinterface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
index 658671f..7350562 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -264,3 +264,5 @@ SYSROOT_PREPROCESS_FUNCS += " py_sysroot_cleanup"
 py_sysroot_cleanup () {
        rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
+
+PNBLACKLIST[python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/python-cson/python-cson_git.bb b/recipes-extended/python-cson/python-cson_git.bb
index efb338c..7bc86c0 100644
--- a/recipes-extended/python-cson/python-cson_git.bb
+++ b/recipes-extended/python-cson/python-cson_git.bb
@@ -19,3 +19,5 @@ inherit setuptools
 
 BBCLASSEXTEND = "native"
 
+
+PNBLACKLIST[python-cson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
index 422f0db..535c6da 100644
--- a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
+++ b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
@@ -15,3 +15,7 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-math \
     "
+
+
+
+PNBLACKLIST[python-pyephem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/python-pyparted/python-pyparted_git.bb b/recipes-extended/python-pyparted/python-pyparted_git.bb
index 1f36924..485bf5c 100644
--- a/recipes-extended/python-pyparted/python-pyparted_git.bb
+++ b/recipes-extended/python-pyparted/python-pyparted_git.bb
@@ -33,3 +33,5 @@ RDEPENDS_${PN} += "python-stringold python-codecs python-math python-subprocess"
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-pyparted] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
index 2b1e930..eee8416 100644
--- a/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
@@ -66,3 +66,5 @@ ALTERNATIVE_TARGET[wbemcli] = "${bindir}/wbemcli"
 ALTERNATIVE_PRIORITY = "30"
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-pywbem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
index 1b767a3..05a4625 100644
--- a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
+++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -39,3 +39,5 @@ RDEPENDS_${PN} = "\
     python-dnspython \
     python-pyparsing \
 "
+
+PNBLACKLIST[dnssec-conf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-- 
2.30.2

