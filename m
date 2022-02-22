Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A05C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:54:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.14312.1645545242818614360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mzvtu3Es;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x5so37887407edd.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0T/WQXT4RSKMQEuiiwKQR7lk8zzEnXlaRH1zR3vZYN8=;
        b=mzvtu3EsEEuWJQ6dQkYzz2Qc0ibu6+cY8xXk1lt2tdKAPSPT5uNCDFUi19+7N2IvB7
         5WDt/57BK9ILv4TK5qNNfuHp3QVHWQCw6lYG1LjX+tQDIA8DRGL/wL5De7jNh12XsDiK
         1ufYZjgy6OZIRNNGXPjvOlz/84tyPDwpC7QZ05+/YN08I77IpSa/0X1ZMf4Z+mZEy4Ex
         xIHNwHgKp4WCQZcaaIS6AxPBsjdO1KhxB4P5l79f7P35egkdM+4lbtVra4MxgREKXkhC
         6HbDJC7L5xIjh6KnIgoA9a5m87xUsc36jrvsbFvbKMXVjvRowDs15EUD7bRsqkuUa/z5
         1zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0T/WQXT4RSKMQEuiiwKQR7lk8zzEnXlaRH1zR3vZYN8=;
        b=Wqitz2IlVac/dwTj8tPp76NJAQ7oXrm6QK2XI8COYevl1/gdP9Jgidc8n7qPADL4BT
         4zIpe7iFkwTucolOiVaorWynuGh+PKZxY8DvHXuW6M+F94qUYzk1jEhI0SNH0OxxDOLe
         eWX9qjliDBRHl6WSzoxbeyyNtaIizNXx5kA0y7w3rJgaUARtKQandTXevmtvVJ6TP1ew
         p7Bseh7BSeeQ3mj+azzvMliFF7fD5obASq+47A35As9fzSXWlbBDoJpRgMMUVjVLpIYF
         n3efPvq1dJUSN5gz3HKzt5TjuF/wl+uzsc7hfqvJcu/Rj4VMy/ox5etgxbAjzzjZplGE
         jmJA==
X-Gm-Message-State: AOAM5327R3Kw+FZzn2QuMbaELnWl1OrTo7fkNIQZc8OOvimST42xVaSn
	DXmoMjbUAJ7FbgnvrE1DMWb0APDX89vwiQ==
X-Google-Smtp-Source: 
 ABdhPJwg7pVAkhrQv/CAhMio+OR/8nw2zNNl2PcVrCu54jc59asp0QlOCixlOGU9bHUQnf8uec8vjw==
X-Received: by 2002:a50:f699:0:b0:40f:c125:8c04 with SMTP id
 d25-20020a50f699000000b0040fc1258c04mr27075935edn.254.1645545240131;
        Tue, 22 Feb 2022 07:54:00 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 j11sm8764086eda.106.2022.02.22.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:53:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 1/3] meta: update variable names
Date: Tue, 22 Feb 2022 16:53:47 +0100
Message-Id: <20220222155349.2206837-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 15:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95445

* openembedded-core/scripts/contrib/convert-variable-renames.py meta-*
  ...
  All files processed with version 0.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc  | 6 +++---
 conf/layer.conf                                           | 2 +-
 recipes-connectivity/gateone/gateone_git.bb               | 2 +-
 .../python-gsocketpool/python-gsocketpool_0.1.6.bb        | 2 +-
 recipes-connectivity/python-h2/python-h2_3.1.1.bb         | 2 +-
 recipes-connectivity/python-hpack/python-hpack_3.0.0.bb   | 2 +-
 .../python-hyperframe/python-hyperframe_5.2.0.bb          | 2 +-
 recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb  | 2 +-
 .../python-networkmanager/python-networkmanager_2.1.bb    | 2 +-
 .../python-priority/python-priority_1.3.0.bb              | 2 +-
 .../python-pyconnman/python-pyconnman_0.2.0.bb            | 2 +-
 recipes-connectivity/python-pyro4/python-pyro4_4.77.bb    | 2 +-
 recipes-connectivity/python-pytun/python-pytun_2.3.0.bb   | 2 +-
 .../python-thrift/python-thrift_0.13.0.bb                 | 2 +-
 recipes-connectivity/python-txws/python-txws_0.9.1.bb     | 2 +-
 .../telepathy/telepathy-python_0.15.19.bb                 | 2 +-
 recipes-core/images/meta-python2-image-base.bb            | 2 +-
 recipes-core/images/meta-python2-image.bb                 | 2 +-
 recipes-core/images/meta-python2-ptest-image.bb           | 2 +-
 recipes-core/packagegroups/packagegroup-meta-python2.bb   | 2 +-
 recipes-devtools/gyp/gyp-py2_git.bb                       | 2 +-
 recipes-devtools/python/python-alembic_1.3.2.bb           | 2 +-
 recipes-devtools/python/python-amqp_2.5.2.bb              | 2 +-
 recipes-devtools/python/python-anyjson_0.3.3.bb           | 2 +-
 recipes-devtools/python/python-appdirs_1.4.3.bb           | 2 +-
 recipes-devtools/python/python-asn1crypto_1.3.0.bb        | 2 +-
 recipes-devtools/python/python-astroid_2.3.3.bb           | 2 +-
 recipes-devtools/python/python-atomicwrites_1.3.0.bb      | 2 +-
 recipes-devtools/python/python-attr_0.3.1.bb              | 2 +-
 recipes-devtools/python/python-attrs_19.3.0.bb            | 2 +-
 recipes-devtools/python/python-automat_0.8.0.bb           | 2 +-
 .../python/python-aws-iot-device-sdk-python_1.4.7.bb      | 2 +-
 recipes-devtools/python/python-babel_2.7.0.bb             | 2 +-
 recipes-devtools/python/python-backports-abc_0.5.bb       | 2 +-
 .../python/python-backports-functools-lru-cache_1.6.1.bb  | 2 +-
 recipes-devtools/python/python-backports-init_1.0.bb      | 2 +-
 recipes-devtools/python/python-backports-ssl_3.7.0.1.bb   | 2 +-
 recipes-devtools/python/python-bcrypt_3.1.7.bb            | 2 +-
 recipes-devtools/python/python-beautifulsoup4_4.8.2.bb    | 2 +-
 recipes-devtools/python/python-behave_1.2.6.bb            | 2 +-
 recipes-devtools/python/python-bitarray_1.2.1.bb          | 2 +-
 recipes-devtools/python/python-blinker_1.4.bb             | 2 +-
 recipes-devtools/python/python-booleanpy_3.7.bb           | 2 +-
 recipes-devtools/python/python-cachetools_3.1.1.bb        | 2 +-
 recipes-devtools/python/python-can_3.3.2.bb               | 2 +-
 recipes-devtools/python/python-certifi_2019.11.28.bb      | 2 +-
 recipes-devtools/python/python-cffi_1.13.2.bb             | 2 +-
 recipes-devtools/python/python-chardet_3.0.4.bb           | 2 +-
 recipes-devtools/python/python-cheetah_2.4.4.bb           | 2 +-
 recipes-devtools/python/python-click_7.0.bb               | 2 +-
 recipes-devtools/python/python-cmd2_0.8.9.bb              | 2 +-
 recipes-devtools/python/python-coloredlogs_10.0.bb        | 2 +-
 recipes-devtools/python/python-configargparse_0.15.1.bb   | 2 +-
 recipes-devtools/python/python-configparser_3.8.1.bb      | 2 +-
 recipes-devtools/python/python-constantly_15.1.0.bb       | 2 +-
 recipes-devtools/python/python-contextlib2_0.6.0.bb       | 2 +-
 recipes-devtools/python/python-cpuset_1.6.bb              | 2 +-
 recipes-devtools/python/python-crcmod_1.7.bb              | 2 +-
 .../python/python-cryptography-vectors_2.8.bb             | 2 +-
 recipes-devtools/python/python-cryptography_2.8.bb        | 2 +-
 recipes-devtools/python/python-cython_0.29.14.bb          | 2 +-
 recipes-devtools/python/python-daemon_2.1.2.bb            | 2 +-
 recipes-devtools/python/python-daemonize_2.5.0.bb         | 2 +-
 recipes-devtools/python/python-dateutil_2.8.1.bb          | 2 +-
 recipes-devtools/python/python-dbus_1.2.14.bb             | 2 +-
 recipes-devtools/python/python-dbusmock_0.16.7.bb         | 2 +-
 recipes-devtools/python/python-decorator_4.4.1.bb         | 2 +-
 recipes-devtools/python/python-deprecated_1.2.7.bb        | 2 +-
 recipes-devtools/python/python-distutils-extra_2.39.bb    | 2 +-
 recipes-devtools/python/python-django-south_1.0.2.bb      | 2 +-
 recipes-devtools/python/python-django_1.11.26.bb          | 2 +-
 .../python/python-djangorestframework_3.9.0.bb            | 2 +-
 recipes-devtools/python/python-dnspython_1.16.0.bb        | 2 +-
 recipes-devtools/python/python-docker-pycreds_0.4.0.bb    | 2 +-
 recipes-devtools/python/python-docker_4.2.0.bb            | 2 +-
 recipes-devtools/python/python-docutils_0.15.2.bb         | 2 +-
 recipes-devtools/python/python-dominate_2.4.0.bb          | 2 +-
 recipes-devtools/python/python-editor_1.0.4.bb            | 2 +-
 recipes-devtools/python/python-engineio_3.11.2.bb         | 2 +-
 recipes-devtools/python/python-enum34_1.1.6.bb            | 2 +-
 recipes-devtools/python/python-epydoc_3.0.1.bb            | 2 +-
 recipes-devtools/python/python-evdev_1.2.0.bb             | 2 +-
 recipes-devtools/python/python-feedformatter_0.4.bb       | 2 +-
 recipes-devtools/python/python-feedparser_5.2.1.bb        | 2 +-
 recipes-devtools/python/python-flask-babel_0.12.2.bb      | 2 +-
 recipes-devtools/python/python-flask-bcrypt_0.7.1.bb      | 2 +-
 recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb | 2 +-
 recipes-devtools/python/python-flask-login_0.4.1.bb       | 2 +-
 recipes-devtools/python/python-flask-mail_0.9.1.bb        | 2 +-
 recipes-devtools/python/python-flask-migrate_2.5.2.bb     | 2 +-
 recipes-devtools/python/python-flask-nav_0.6.bb           | 2 +-
 recipes-devtools/python/python-flask-navigation_0.2.0.bb  | 2 +-
 recipes-devtools/python/python-flask-pymongo_2.3.0.bb     | 2 +-
 recipes-devtools/python/python-flask-restful_0.3.7.bb     | 2 +-
 recipes-devtools/python/python-flask-script_2.0.6.bb      | 2 +-
 recipes-devtools/python/python-flask-sijax_0.4.1.bb       | 2 +-
 recipes-devtools/python/python-flask-socketio_4.2.1.bb    | 2 +-
 recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb  | 2 +-
 recipes-devtools/python/python-flask-uploads_0.2.1.bb     | 2 +-
 recipes-devtools/python/python-flask-user_0.6.19.bb       | 2 +-
 recipes-devtools/python/python-flask-wtf_0.14.2.bb        | 2 +-
 recipes-devtools/python/python-flask-xstatic_0.0.1.bb     | 2 +-
 recipes-devtools/python/python-flask_1.1.1.bb             | 2 +-
 recipes-devtools/python/python-funcsigs_1.0.2.bb          | 2 +-
 recipes-devtools/python/python-functools32_3.2.3-2.bb     | 2 +-
 recipes-devtools/python/python-future_0.18.2.bb           | 2 +-
 recipes-devtools/python/python-futures_3.3.0.bb           | 2 +-
 recipes-devtools/python/python-gdata_2.0.18.bb            | 2 +-
 recipes-devtools/python/python-gevent_1.4.0.bb            | 2 +-
 recipes-devtools/python/python-greenlet_0.4.15.bb         | 2 +-
 recipes-devtools/python/python-grpcio-tools_1.14.1.bb     | 2 +-
 recipes-devtools/python/python-grpcio_1.27.1.bb           | 2 +-
 recipes-devtools/python/python-html5lib_1.0.1.bb          | 2 +-
 recipes-devtools/python/python-humanfriendly_4.18.bb      | 2 +-
 recipes-devtools/python/python-humanize_0.5.1.bb          | 2 +-
 recipes-devtools/python/python-hyperlink_19.0.0.bb        | 2 +-
 recipes-devtools/python/python-hypothesis_4.50.2.bb       | 2 +-
 recipes-devtools/python/python-idna_2.8.bb                | 2 +-
 recipes-devtools/python/python-imaging_1.1.7.bb           | 2 +-
 recipes-devtools/python/python-importlib-metadata_0.23.bb | 2 +-
 recipes-devtools/python/python-incremental_17.5.0.bb      | 2 +-
 recipes-devtools/python/python-inflection_0.3.1.bb        | 2 +-
 recipes-devtools/python/python-intervals_1.10.0.bb        | 2 +-
 recipes-devtools/python/python-ipaddress_1.0.23.bb        | 2 +-
 recipes-devtools/python/python-ipy_1.00.bb                | 2 +-
 recipes-devtools/python/python-iso8601_0.1.12.bb          | 2 +-
 recipes-devtools/python/python-isodate_0.6.0.bb           | 2 +-
 recipes-devtools/python/python-isort_4.3.21.bb            | 2 +-
 recipes-devtools/python/python-itsdangerous_1.1.0.bb      | 2 +-
 recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb     | 2 +-
 recipes-devtools/python/python-jinja2_2.10.3.bb           | 2 +-
 recipes-devtools/python/python-jsmin_2.2.2.bb             | 2 +-
 recipes-devtools/python/python-jsonpatch_1.24.bb          | 2 +-
 recipes-devtools/python/python-jsonpointer_2.0.bb         | 2 +-
 recipes-devtools/python/python-jsonref_0.2.bb             | 2 +-
 recipes-devtools/python/python-jsonschema_3.2.0.bb        | 2 +-
 recipes-devtools/python/python-kombu_4.6.6.bb             | 2 +-
 recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb | 2 +-
 recipes-devtools/python/python-ldap_3.2.0.bb              | 2 +-
 recipes-devtools/python/python-license-expression_1.2.bb  | 2 +-
 recipes-devtools/python/python-linecache2_1.0.0.bb        | 2 +-
 recipes-devtools/python/python-lockfile_0.12.2.bb         | 2 +-
 recipes-devtools/python/python-lrparsing_1.0.16.bb        | 2 +-
 recipes-devtools/python/python-lxml_4.4.2.bb              | 2 +-
 recipes-devtools/python/python-m2crypto_0.30.1.bb         | 4 ++--
 recipes-devtools/python/python-mako_1.1.0.bb              | 2 +-
 recipes-devtools/python/python-markupsafe_1.1.1.bb        | 2 +-
 recipes-devtools/python/python-mccabe_0.4.0.bb            | 2 +-
 recipes-devtools/python/python-mock_3.0.5.bb              | 2 +-
 recipes-devtools/python/python-monotonic_1.5.bb           | 2 +-
 recipes-devtools/python/python-more-itertools_5.0.0.bb    | 2 +-
 recipes-devtools/python/python-msgpack_0.6.2.bb           | 2 +-
 recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb   | 2 +-
 recipes-devtools/python/python-netaddr_0.7.19.bb          | 2 +-
 recipes-devtools/python/python-netifaces_0.10.9.bb        | 2 +-
 recipes-devtools/python/python-networkx_2.2.bb            | 2 +-
 recipes-devtools/python/python-numeric_24.2.bb            | 2 +-
 recipes-devtools/python/python-packaging_20.0.bb          | 2 +-
 recipes-devtools/python/python-paho-mqtt_1.5.0.bb         | 2 +-
 recipes-devtools/python/python-pam_1.8.2.bb               | 2 +-
 recipes-devtools/python/python-pamela_0.3.0.bb            | 2 +-
 recipes-devtools/python/python-parse-type_0.4.2.bb        | 2 +-
 recipes-devtools/python/python-parse_1.14.0.bb            | 2 +-
 recipes-devtools/python/python-passlib_1.7.2.bb           | 2 +-
 recipes-devtools/python/python-paste_3.2.3.bb             | 2 +-
 recipes-devtools/python/python-pathlib2_2.3.5.bb          | 2 +-
 recipes-devtools/python/python-pbr_5.4.4.bb               | 2 +-
 recipes-devtools/python/python-pep8_1.7.1.bb              | 2 +-
 recipes-devtools/python/python-periphery_2.0.0.bb         | 2 +-
 recipes-devtools/python/python-pexpect_4.7.0.bb           | 2 +-
 recipes-devtools/python/python-pika_1.1.0.bb              | 2 +-
 recipes-devtools/python/python-pint_0.9.bb                | 2 +-
 recipes-devtools/python/python-pip_19.3.1.bb              | 2 +-
 recipes-devtools/python/python-pluggy_0.13.1.bb           | 2 +-
 recipes-devtools/python/python-ply_3.11.bb                | 2 +-
 recipes-devtools/python/python-pretend_1.0.9.bb           | 2 +-
 recipes-devtools/python/python-prettytable_0.7.2.bb       | 2 +-
 recipes-devtools/python/python-progress_1.5.bb            | 2 +-
 recipes-devtools/python/python-prompt-toolkit_2.0.10.bb   | 2 +-
 recipes-devtools/python/python-protobuf_3.9.2.bb          | 2 +-
 recipes-devtools/python/python-psutil_5.6.7.bb            | 2 +-
 recipes-devtools/python/python-ptyprocess_0.6.0.bb        | 2 +-
 recipes-devtools/python/python-py_1.8.1.bb                | 2 +-
 recipes-devtools/python/python-pyalsaaudio_0.8.4.bb       | 2 +-
 recipes-devtools/python/python-pyasn1-modules_0.2.7.bb    | 2 +-
 recipes-devtools/python/python-pyasn1_0.4.8.bb            | 2 +-
 recipes-devtools/python/python-pybind11_2.4.3.bb          | 2 +-
 recipes-devtools/python/python-pybluez_0.22.bb            | 2 +-
 recipes-devtools/python/python-pycodestyle_2.5.0.bb       | 2 +-
 recipes-devtools/python/python-pycparser_2.19.bb          | 2 +-
 recipes-devtools/python/python-pycrypto_2.6.1.bb          | 2 +-
 recipes-devtools/python/python-pycryptodomex_3.9.4.bb     | 2 +-
 recipes-devtools/python/python-pycurl_7.43.0.3.bb         | 2 +-
 recipes-devtools/python/python-pydbus_0.6.0.bb            | 2 +-
 recipes-devtools/python/python-pyelftools_0.25.bb         | 2 +-
 recipes-devtools/python/python-pyexpect_1.0.19.bb         | 2 +-
 recipes-devtools/python/python-pyfirmata_1.1.0.bb         | 2 +-
 recipes-devtools/python/python-pyflakes_2.1.1.bb          | 2 +-
 recipes-devtools/python/python-pyflame_1.6.7.bb           | 2 +-
 recipes-devtools/python/python-pygobject_3.34.0.bb        | 2 +-
 recipes-devtools/python/python-pygpgme_0.3.bb             | 2 +-
 recipes-devtools/python/python-pyhamcrest_1.9.0.bb        | 2 +-
 recipes-devtools/python/python-pyiface_0.0.11.bb          | 2 +-
 recipes-devtools/python/python-pyinotify_0.9.6.bb         | 2 +-
 recipes-devtools/python/python-pyjks_19.0.0.bb            | 2 +-
 recipes-devtools/python/python-pyjwt_1.7.1.bb             | 2 +-
 recipes-devtools/python/python-pylint_1.8.3.bb            | 2 +-
 recipes-devtools/python/python-pymisp_2.4.119.1.bb        | 2 +-
 recipes-devtools/python/python-pymongo_3.10.1.bb          | 2 +-
 recipes-devtools/python/python-pymysql_0.9.3.bb           | 2 +-
 recipes-devtools/python/python-pynetlinux_1.1.bb          | 2 +-
 recipes-devtools/python/python-pyopenssl_19.1.0.bb        | 2 +-
 recipes-devtools/python/python-pyparsing_2.4.6.bb         | 2 +-
 recipes-devtools/python/python-pyperclip_1.7.0.bb         | 2 +-
 recipes-devtools/python/python-pyperf_1.7.0.bb            | 2 +-
 recipes-devtools/python/python-pyrex-native_0.9.9.bb      | 2 +-
 recipes-devtools/python/python-pyrex_0.9.9.bb             | 2 +-
 recipes-devtools/python/python-pyroute2_0.5.7.bb          | 2 +-
 recipes-devtools/python/python-pyrsistent_0.15.7.bb       | 2 +-
 recipes-devtools/python/python-pyrtm_0.4.2.bb             | 2 +-
 recipes-devtools/python/python-pyserial_3.4.bb            | 2 +-
 recipes-devtools/python/python-pysmi_0.3.4.bb             | 2 +-
 recipes-devtools/python/python-pysnmp_4.4.9.bb            | 2 +-
 recipes-devtools/python/python-pysocks_1.7.1.bb           | 2 +-
 recipes-devtools/python/python-pysqlite_2.8.3.bb          | 2 +-
 recipes-devtools/python/python-pystache_0.5.4.bb          | 2 +-
 .../python/python-pytest-helpers-namespace_2019.1.8.bb    | 2 +-
 recipes-devtools/python/python-pytest-runner_5.2.bb       | 2 +-
 .../python/python-pytest-tempdir_2019.10.12.bb            | 2 +-
 recipes-devtools/python/python-pytest_4.6.9.bb            | 2 +-
 recipes-devtools/python/python-pytoml_0.1.21.bb           | 2 +-
 recipes-devtools/python/python-pytz_2019.3.bb             | 2 +-
 recipes-devtools/python/python-pyudev_0.21.0.bb           | 2 +-
 recipes-devtools/python/python-pyusb_1.0.2.bb             | 2 +-
 recipes-devtools/python/python-pyyaml_5.4.1.bb            | 2 +-
 recipes-devtools/python/python-pyzmq_17.1.0.bb            | 2 +-
 recipes-devtools/python/python-rdflib_4.2.2.bb            | 2 +-
 recipes-devtools/python/python-redis_2.10.6.bb            | 2 +-
 recipes-devtools/python/python-requests-oauthlib_1.3.0.bb | 2 +-
 recipes-devtools/python/python-requests_2.23.0.bb         | 2 +-
 recipes-devtools/python/python-rfc3339-validator_0.1.1.bb | 2 +-
 recipes-devtools/python/python-rfc3986-validator_0.1.1.bb | 2 +-
 recipes-devtools/python/python-rfc3987_1.3.8.bb           | 2 +-
 .../python/python-robotframework-seriallibrary_0.3.1.bb   | 2 +-
 recipes-devtools/python/python-robotframework_3.0.4.bb    | 2 +-
 recipes-devtools/python/python-scandir_1.10.0.bb          | 2 +-
 recipes-devtools/python/python-scrypt_0.8.6.bb            | 2 +-
 recipes-devtools/python/python-sdnotify_0.3.2.bb          | 2 +-
 recipes-devtools/python/python-selectors34_1.2.bb         | 2 +-
 recipes-devtools/python/python-semver_2.8.1.bb            | 2 +-
 recipes-devtools/python/python-serpent_1.28.bb            | 2 +-
 recipes-devtools/python/python-setuptools-scm_3.3.3.bb    | 2 +-
 recipes-devtools/python/python-setuptools_42.0.2.bb       | 2 +-
 recipes-devtools/python/python-sh_1.12.14.bb              | 2 +-
 recipes-devtools/python/python-sijax_0.3.2.bb             | 2 +-
 recipes-devtools/python/python-simplejson_3.17.0.bb       | 2 +-
 recipes-devtools/python/python-singledispatch_3.4.0.3.bb  | 2 +-
 recipes-devtools/python/python-six_1.14.0.bb              | 2 +-
 recipes-devtools/python/python-slip-dbus_0.6.5.bb         | 2 +-
 recipes-devtools/python/python-smbus_4.1.bb               | 2 +-
 recipes-devtools/python/python-snakefood_1.4.bb           | 2 +-
 recipes-devtools/python/python-snimpy_0.8.13.bb           | 2 +-
 recipes-devtools/python/python-socketio_4.3.1.bb          | 2 +-
 recipes-devtools/python/python-soupsieve_1.9.4.bb         | 2 +-
 recipes-devtools/python/python-sparts_0.7.3.bb            | 2 +-
 recipes-devtools/python/python-speaklater_1.3.bb          | 2 +-
 recipes-devtools/python/python-sqlalchemy_1.3.12.bb       | 2 +-
 recipes-devtools/python/python-sqlparse_0.3.0.bb          | 2 +-
 recipes-devtools/python/python-statistics_1.0.3.5.bb      | 2 +-
 recipes-devtools/python/python-stevedore_1.31.0.bb        | 2 +-
 recipes-devtools/python/python-strict-rfc3339_0.7.bb      | 2 +-
 recipes-devtools/python/python-subprocess32_3.2.7.bb      | 2 +-
 recipes-devtools/python/python-systemd_234.bb             | 2 +-
 recipes-devtools/python/python-toml_0.10.0.bb             | 2 +-
 recipes-devtools/python/python-tornado-redis_2.4.18.bb    | 2 +-
 recipes-devtools/python/python-tornado_6.0.3.bb           | 2 +-
 recipes-devtools/python/python-tqdm_4.41.1.bb             | 2 +-
 recipes-devtools/python/python-traceback2_1.4.0.bb        | 2 +-
 recipes-devtools/python/python-twisted_19.10.0.bb         | 2 +-
 recipes-devtools/python/python-twitter_3.8.0.bb           | 2 +-
 recipes-devtools/python/python-twofish_0.3.0.bb           | 2 +-
 recipes-devtools/python/python-typing_3.7.4.1.bb          | 2 +-
 recipes-devtools/python/python-tzlocal_2.0.0.bb           | 2 +-
 recipes-devtools/python/python-ujson_1.35.bb              | 2 +-
 recipes-devtools/python/python-unidiff_0.5.5.bb           | 2 +-
 recipes-devtools/python/python-urllib3_1.25.7.bb          | 2 +-
 recipes-devtools/python/python-vcversioner_2.16.0.0.bb    | 2 +-
 recipes-devtools/python/python-versiontools_1.9.1.bb      | 2 +-
 recipes-devtools/python/python-vine_1.1.4.bb              | 2 +-
 recipes-devtools/python/python-visitor_0.1.3.bb           | 2 +-
 recipes-devtools/python/python-vobject_0.9.6.1.bb         | 2 +-
 recipes-devtools/python/python-waitress_1.4.2.bb          | 2 +-
 recipes-devtools/python/python-wcwidth_0.1.8.bb           | 2 +-
 recipes-devtools/python/python-webcolors_1.8.1.bb         | 2 +-
 recipes-devtools/python/python-webdav_0.1.2.bb            | 2 +-
 recipes-devtools/python/python-webencodings_0.5.1.bb      | 2 +-
 recipes-devtools/python/python-websocket-client_0.57.0.bb | 2 +-
 recipes-devtools/python/python-werkzeug_0.16.0.bb         | 2 +-
 recipes-devtools/python/python-which_1.1.0.bb             | 2 +-
 recipes-devtools/python/python-whoosh_2.7.4.bb            | 2 +-
 recipes-devtools/python/python-wrapt_1.11.2.bb            | 2 +-
 recipes-devtools/python/python-wtforms_2.2.1.bb           | 2 +-
 recipes-devtools/python/python-xlrd_1.2.0.bb              | 2 +-
 .../python/python-xstatic-font-awesome_4.7.0.0.bb         | 2 +-
 recipes-devtools/python/python-xstatic_1.0.2.bb           | 2 +-
 recipes-devtools/python/python-yappi_1.0.bb               | 2 +-
 recipes-devtools/python/python-zipp_0.6.0.bb              | 2 +-
 recipes-devtools/python/python-zopeinterface_4.7.1.bb     | 2 +-
 recipes-devtools/python/python.inc                        | 8 ++++----
 recipes-devtools/python/python_2.7.18.bb                  | 2 +-
 recipes-extended/python-cson/python-cson_git.bb           | 2 +-
 recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb | 2 +-
 recipes-extended/python-pyparted/python-pyparted_git.bb   | 2 +-
 recipes-extended/pywbem/python-pywbem_0.15.0.bb           | 4 ++--
 recipes-support/dnssec-conf/dnssec-conf_2.02.bb           | 2 +-
 315 files changed, 322 insertions(+), 322 deletions(-)

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index 9b9a0eb..9ec4d40 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -1,9 +1,9 @@
-# recipes from this layer already have PNBLACKLIST inside the recipes
+# recipes from this layer already have SKIP_RECIPE inside the recipes
 
 # from other layers:
 # meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
-PNBLACKLIST[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this , then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this , then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 RDEPENDS:packagegroup-meta-oe-dbs-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'mysql-python', d)}"
 # meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
-PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 RDEPENDS:packagegroup-meta-oe-support-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'lio-utils', d)}"
diff --git a/conf/layer.conf b/conf/layer.conf
index 4b3a106..c91335d 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -19,5 +19,5 @@ LAYERSERIES_COMPAT_meta-python2 = "honister"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 # meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
-PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 RDEPENDS:packagegroup-meta-oe-extended-python2:remove = "openlmi-tools"
diff --git a/recipes-connectivity/gateone/gateone_git.bb b/recipes-connectivity/gateone/gateone_git.bb
index e21e2ff..031a9c2 100644
--- a/recipes-connectivity/gateone/gateone_git.bb
+++ b/recipes-connectivity/gateone/gateone_git.bb
@@ -84,4 +84,4 @@ RDEPENDS:${PN} = "mime-support \
 SYSTEMD_SERVICE:${PN} = "gateone.service"
 INITSCRIPT_NAME = "gateone"
 
-PNBLACKLIST[gateone] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[gateone] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb b/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
index 7fb9643..a9d2770 100644
--- a/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
+++ b/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-gsocketpool] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-gsocketpool] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-h2/python-h2_3.1.1.bb b/recipes-connectivity/python-h2/python-h2_3.1.1.bb
index efe7ae3..e2b73ba 100644
--- a/recipes-connectivity/python-h2/python-h2_3.1.1.bb
+++ b/recipes-connectivity/python-h2/python-h2_3.1.1.bb
@@ -10,4 +10,4 @@ SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-h2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-h2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb b/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
index ffeb285..056b831 100644
--- a/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
+++ b/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad988
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-hpack] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-hpack] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb b/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
index 4d7a055..87a7239 100644
--- a/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
+++ b/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b34009
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-hyperframe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-hyperframe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb b/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
index ad1dca6..040f9cd 100644
--- a/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
+++ b/recipes-connectivity/python-mprpc/python-mprpc_0.1.17.bb
@@ -13,4 +13,4 @@ SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1c
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-mprpc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-mprpc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
index e3b05c9..72909d5 100644
--- a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
+++ b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
@@ -17,4 +17,4 @@ python() {
         raise bb.parse.SkipRecipe('Requires networking-layer to be present to provide networkmanager.')
 }
 
-PNBLACKLIST[python-networkmanager] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-networkmanager] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-priority/python-priority_1.3.0.bb b/recipes-connectivity/python-priority/python-priority_1.3.0.bb
index 6aa876d..c0e2f21 100644
--- a/recipes-connectivity/python-priority/python-priority_1.3.0.bb
+++ b/recipes-connectivity/python-priority/python-priority_1.3.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-priority] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-priority] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
index d72579b..29a0a7b 100644
--- a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
+++ b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += "\
     python-pprint \
 "
 
-PNBLACKLIST[python-pyconnman] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyconnman] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb b/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
index a082132..3594517 100644
--- a/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
+++ b/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-zlib \
     "
 
-PNBLACKLIST[python-pyro4] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyro4] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb b/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
index b7e1e26..cda3477 100644
--- a/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
+++ b/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
@@ -10,4 +10,4 @@ PYPI_PACKAGE = "python-pytun"
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-pytun] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pytun] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb b/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
index 09cd98d..8fbb093 100644
--- a/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
+++ b/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-threading \
 "
 
-PNBLACKLIST[python-thrift] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-thrift] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/python-txws/python-txws_0.9.1.bb b/recipes-connectivity/python-txws/python-txws_0.9.1.bb
index 9c97424..93d4677 100644
--- a/recipes-connectivity/python-txws/python-txws_0.9.1.bb
+++ b/recipes-connectivity/python-txws/python-txws_0.9.1.bb
@@ -14,4 +14,4 @@ S = "${WORKDIR}/git"
 inherit setuptools
 
 
-PNBLACKLIST[python-txws] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-txws] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 362a823..c14acff 100644
--- a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -31,4 +31,4 @@ do_install:append () {
     rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
 }
 
-PNBLACKLIST[telepathy-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[telepathy-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/images/meta-python2-image-base.bb b/recipes-core/images/meta-python2-image-base.bb
index 834e928..8a8bef3 100644
--- a/recipes-core/images/meta-python2-image-base.bb
+++ b/recipes-core/images/meta-python2-image-base.bb
@@ -6,4 +6,4 @@ LICENSE = "MIT"
 
 inherit core-image
 
-PNBLACKLIST[meta-python2-image-base.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[meta-python2-image-base.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/images/meta-python2-image.bb b/recipes-core/images/meta-python2-image.bb
index ff3113e..a17ab53 100644
--- a/recipes-core/images/meta-python2-image.bb
+++ b/recipes-core/images/meta-python2-image.bb
@@ -4,4 +4,4 @@ SUMMARY = "meta-python2 build test image"
 
 IMAGE_INSTALL += "packagegroup-meta-python2"
 
-PNBLACKLIST[meta-python2-image.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[meta-python2-image.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/images/meta-python2-ptest-image.bb b/recipes-core/images/meta-python2-ptest-image.bb
index 8f9db14..6825904 100644
--- a/recipes-core/images/meta-python2-ptest-image.bb
+++ b/recipes-core/images/meta-python2-ptest-image.bb
@@ -4,4 +4,4 @@ SUMMARY = "meta-python2 ptest test image"
 
 IMAGE_INSTALL += "packagegroup-meta-python2-ptest"
 
-PNBLACKLIST[meta-python2-ptest-image.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[meta-python2-ptest-image.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 6183203..63cb873 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -90,4 +90,4 @@ RDEPENDS:packagegroup-meta-python2-ptest = "\
 
 EXCLUDE_FROM_WORLD = "1"
 
-PNBLACKLIST[packagegroup-meta-python2.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[packagegroup-meta-python2.bb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/gyp/gyp-py2_git.bb b/recipes-devtools/gyp/gyp-py2_git.bb
index 0a7cf06..6ea7d46 100644
--- a/recipes-devtools/gyp/gyp-py2_git.bb
+++ b/recipes-devtools/gyp/gyp-py2_git.bb
@@ -13,4 +13,4 @@ PV = "0.1+git${SRCPV}"
 BBCLASSEXTEND = "native nativesdk"
 inherit setuptools
 
-PNBLACKLIST[gyp-py2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[gyp-py2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-alembic_1.3.2.bb b/recipes-devtools/python/python-alembic_1.3.2.bb
index 7f85c88..28138cc 100644
--- a/recipes-devtools/python/python-alembic_1.3.2.bb
+++ b/recipes-devtools/python/python-alembic_1.3.2.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} += "\
 "
 inherit pypi setuptools
 
-PNBLACKLIST[python-alembic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-alembic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-amqp_2.5.2.bb b/recipes-devtools/python/python-amqp_2.5.2.bb
index 0f314db..5ca884e 100644
--- a/recipes-devtools/python/python-amqp_2.5.2.bb
+++ b/recipes-devtools/python/python-amqp_2.5.2.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += " \
 	python-vine \
 	"
 
-PNBLACKLIST[python-amqp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-amqp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-anyjson_0.3.3.bb b/recipes-devtools/python/python-anyjson_0.3.3.bb
index 6843972..5e73e9a 100644
--- a/recipes-devtools/python/python-anyjson_0.3.3.bb
+++ b/recipes-devtools/python/python-anyjson_0.3.3.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d15
 
 RDEPENDS:${PN} += "${PYTHON_PN}-simplejson"
 
-PNBLACKLIST[python-anyjson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-anyjson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-appdirs_1.4.3.bb b/recipes-devtools/python/python-appdirs_1.4.3.bb
index eb8f687..a469c57 100644
--- a/recipes-devtools/python/python-appdirs_1.4.3.bb
+++ b/recipes-devtools/python/python-appdirs_1.4.3.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-appdirs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-appdirs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-asn1crypto_1.3.0.bb b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
index 49e52dc..9897ecb 100644
--- a/recipes-devtools/python/python-asn1crypto_1.3.0.bb
+++ b/recipes-devtools/python/python-asn1crypto_1.3.0.bb
@@ -29,4 +29,4 @@ RDEPENDS:${PN}:class-target += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-asn1crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-asn1crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-astroid_2.3.3.bb b/recipes-devtools/python/python-astroid_2.3.3.bb
index 11c4f45..d97c18a 100644
--- a/recipes-devtools/python/python-astroid_2.3.3.bb
+++ b/recipes-devtools/python/python-astroid_2.3.3.bb
@@ -49,4 +49,4 @@ RDEPENDS:${PN}-tests:class-target += "\
     ${PYTHON_PN}-xml \
 "
 
-PNBLACKLIST[python-astroid] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-astroid] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-atomicwrites_1.3.0.bb b/recipes-devtools/python/python-atomicwrites_1.3.0.bb
index 7cdfe99..6cca909 100644
--- a/recipes-devtools/python/python-atomicwrites_1.3.0.bb
+++ b/recipes-devtools/python/python-atomicwrites_1.3.0.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed798
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-atomicwrites] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-atomicwrites] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-attr_0.3.1.bb b/recipes-devtools/python/python-attr_0.3.1.bb
index 1c5903f..13ca1c0 100644
--- a/recipes-devtools/python/python-attr_0.3.1.bb
+++ b/recipes-devtools/python/python-attr_0.3.1.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "9091548058d17f132596e61fa7518e504f76b9a4c61ca7d86e1f96dbf7
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-attr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-attr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-attrs_19.3.0.bb b/recipes-devtools/python/python-attrs_19.3.0.bb
index 869df01..e9b235e 100644
--- a/recipes-devtools/python/python-attrs_19.3.0.bb
+++ b/recipes-devtools/python/python-attrs_19.3.0.bb
@@ -25,4 +25,4 @@ RDEPENDS:${PN}:class-target += " \
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-attrs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-attrs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-automat_0.8.0.bb b/recipes-devtools/python/python-automat_0.8.0.bb
index f48d95b..ae5ed06 100644
--- a/recipes-devtools/python/python-automat_0.8.0.bb
+++ b/recipes-devtools/python/python-automat_0.8.0.bb
@@ -27,4 +27,4 @@ RDEPENDS:${PN} += "\
    ${PYTHON_PN}-six \
 "
 
-PNBLACKLIST[python-automat] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-automat] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb b/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
index b3fd1a5..fdb7710 100644
--- a/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
+++ b/recipes-devtools/python/python-aws-iot-device-sdk-python_1.4.7.bb
@@ -45,4 +45,4 @@ FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 BBCLASSEXTEND = "native nativesdk"
 
 
-PNBLACKLIST[python-aws-iot-device-sdk-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-aws-iot-device-sdk-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-babel_2.7.0.bb b/recipes-devtools/python/python-babel_2.7.0.bb
index 49805ba..b01ba02 100644
--- a/recipes-devtools/python/python-babel_2.7.0.bb
+++ b/recipes-devtools/python/python-babel_2.7.0.bb
@@ -30,4 +30,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-babel] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-babel] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-abc_0.5.bb b/recipes-devtools/python/python-backports-abc_0.5.bb
index d96678b..72ac95b 100644
--- a/recipes-devtools/python/python-backports-abc_0.5.bb
+++ b/recipes-devtools/python/python-backports-abc_0.5.bb
@@ -10,4 +10,4 @@ SRC_URI[sha256sum] = "033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-backports-abc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-backports-abc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
index 7277292..c7b7a7c 100644
--- a/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
+++ b/recipes-devtools/python/python-backports-functools-lru-cache_1.6.1.bb
@@ -28,4 +28,4 @@ FILES:${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/functools_lru_cache.py"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-backports-functools-lru-cache] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-backports-functools-lru-cache] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-init_1.0.bb b/recipes-devtools/python/python-backports-init_1.0.bb
index 0666d9e..0ab69a5 100644
--- a/recipes-devtools/python/python-backports-init_1.0.bb
+++ b/recipes-devtools/python/python-backports-init_1.0.bb
@@ -26,4 +26,4 @@ FILES:${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-backports-init] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-backports-init] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
index 3d0bd2e..f174676 100644
--- a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
+++ b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
@@ -18,4 +18,4 @@ inherit pypi setuptools python-backports-init
 
 RDEPENDS:${PN} += "${PYTHON_PN}-pkgutil"
 
-PNBLACKLIST[python-backports-ssl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-backports-ssl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-bcrypt_3.1.7.bb b/recipes-devtools/python/python-bcrypt_3.1.7.bb
index db2ef3b..c4d18e2 100644
--- a/recipes-devtools/python/python-bcrypt_3.1.7.bb
+++ b/recipes-devtools/python/python-bcrypt_3.1.7.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-subprocess \
 "
 
-PNBLACKLIST[python-bcrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-bcrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
index 15595cd..6d01e93 100644
--- a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
+++ b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
@@ -26,4 +26,4 @@ RDEPENDS:${PN}:append:class-target = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-beautifulsoup4] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-beautifulsoup4] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-behave_1.2.6.bb b/recipes-devtools/python/python-behave_1.2.6.bb
index da4632b..31a4dee 100644
--- a/recipes-devtools/python/python-behave_1.2.6.bb
+++ b/recipes-devtools/python/python-behave_1.2.6.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-traceback2 \
     "
 
-PNBLACKLIST[python-behave] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-behave] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-bitarray_1.2.1.bb b/recipes-devtools/python/python-bitarray_1.2.1.bb
index 6e02e4d..10c272b 100644
--- a/recipes-devtools/python/python-bitarray_1.2.1.bb
+++ b/recipes-devtools/python/python-bitarray_1.2.1.bb
@@ -21,4 +21,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-bitarray] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-bitarray] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-blinker_1.4.bb b/recipes-devtools/python/python-blinker_1.4.bb
index 33047ed..2b1c52e 100644
--- a/recipes-devtools/python/python-blinker_1.4.bb
+++ b/recipes-devtools/python/python-blinker_1.4.bb
@@ -15,4 +15,4 @@ SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d6
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-blinker] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-blinker] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-booleanpy_3.7.bb b/recipes-devtools/python/python-booleanpy_3.7.bb
index d2f0dcc..b49839e 100644
--- a/recipes-devtools/python/python-booleanpy_3.7.bb
+++ b/recipes-devtools/python/python-booleanpy_3.7.bb
@@ -30,4 +30,4 @@ FILES:${PN}-test = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-booleanpy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-booleanpy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cachetools_3.1.1.bb b/recipes-devtools/python/python-cachetools_3.1.1.bb
index 5220e89..5e95c66 100644
--- a/recipes-devtools/python/python-cachetools_3.1.1.bb
+++ b/recipes-devtools/python/python-cachetools_3.1.1.bb
@@ -15,4 +15,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-cachetools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cachetools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-can_3.3.2.bb b/recipes-devtools/python/python-can_3.3.2.bb
index 1c8ffa1..dcde6d3 100644
--- a/recipes-devtools/python/python-can_3.3.2.bb
+++ b/recipes-devtools/python/python-can_3.3.2.bb
@@ -28,4 +28,4 @@ RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-zlib \
 "
 
-PNBLACKLIST[python-can] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-can] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-certifi_2019.11.28.bb b/recipes-devtools/python/python-certifi_2019.11.28.bb
index a545965..2556546 100644
--- a/recipes-devtools/python/python-certifi_2019.11.28.bb
+++ b/recipes-devtools/python/python-certifi_2019.11.28.bb
@@ -14,4 +14,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-certifi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-certifi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cffi_1.13.2.bb b/recipes-devtools/python/python-cffi_1.13.2.bb
index d8f91fe..f9e357a 100644
--- a/recipes-devtools/python/python-cffi_1.13.2.bb
+++ b/recipes-devtools/python/python-cffi_1.13.2.bb
@@ -25,4 +25,4 @@ RDEPENDS:${PN}:class-target = " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-cffi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cffi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-chardet_3.0.4.bb b/recipes-devtools/python/python-chardet_3.0.4.bb
index 50cf3dc..1c6db0c 100644
--- a/recipes-devtools/python/python-chardet_3.0.4.bb
+++ b/recipes-devtools/python/python-chardet_3.0.4.bb
@@ -34,4 +34,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-argparse"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-chardet] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-chardet] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cheetah_2.4.4.bb b/recipes-devtools/python/python-cheetah_2.4.4.bb
index 453befd..8f8e28e 100644
--- a/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -15,4 +15,4 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI[md5sum] = "853917116e731afbc8c8a43c37e6ddba"
 SRC_URI[sha256sum] = "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
 
-PNBLACKLIST[python-cheetah] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cheetah] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-click_7.0.bb b/recipes-devtools/python/python-click_7.0.bb
index 404877e..f0952ec 100644
--- a/recipes-devtools/python/python-click_7.0.bb
+++ b/recipes-devtools/python/python-click_7.0.bb
@@ -29,4 +29,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-click] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-click] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cmd2_0.8.9.bb b/recipes-devtools/python/python-cmd2_0.8.9.bb
index 07a46a7..da2b879 100644
--- a/recipes-devtools/python/python-cmd2_0.8.9.bb
+++ b/recipes-devtools/python/python-cmd2_0.8.9.bb
@@ -32,4 +32,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-cmd2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cmd2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-coloredlogs_10.0.bb b/recipes-devtools/python/python-coloredlogs_10.0.bb
index c403910..c6790ff 100644
--- a/recipes-devtools/python/python-coloredlogs_10.0.bb
+++ b/recipes-devtools/python/python-coloredlogs_10.0.bb
@@ -31,4 +31,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-coloredlogs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-coloredlogs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-configargparse_0.15.1.bb b/recipes-devtools/python/python-configargparse_0.15.1.bb
index f140e66..42f9716 100644
--- a/recipes-devtools/python/python-configargparse_0.15.1.bb
+++ b/recipes-devtools/python/python-configargparse_0.15.1.bb
@@ -25,4 +25,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-configargparse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-configargparse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-configparser_3.8.1.bb b/recipes-devtools/python/python-configparser_3.8.1.bb
index b8daf0d..6565d56 100644
--- a/recipes-devtools/python/python-configparser_3.8.1.bb
+++ b/recipes-devtools/python/python-configparser_3.8.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += "python-pkgutil"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-configparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-configparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-constantly_15.1.0.bb b/recipes-devtools/python/python-constantly_15.1.0.bb
index 3fe4048..21d73f3 100644
--- a/recipes-devtools/python/python-constantly_15.1.0.bb
+++ b/recipes-devtools/python/python-constantly_15.1.0.bb
@@ -14,4 +14,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} += "${PYTHON_PN}-json"
 
-PNBLACKLIST[python-constantly] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-constantly] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-contextlib2_0.6.0.bb b/recipes-devtools/python/python-contextlib2_0.6.0.bb
index 0915b1c..81e0796 100644
--- a/recipes-devtools/python/python-contextlib2_0.6.0.bb
+++ b/recipes-devtools/python/python-contextlib2_0.6.0.bb
@@ -14,4 +14,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-contextlib2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-contextlib2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cpuset_1.6.bb b/recipes-devtools/python/python-cpuset_1.6.bb
index 0d783b7..e3a0a31 100644
--- a/recipes-devtools/python/python-cpuset_1.6.bb
+++ b/recipes-devtools/python/python-cpuset_1.6.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} = "\
     python-unixadmin \
     "
 
-PNBLACKLIST[python-cpuset] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cpuset] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-crcmod_1.7.bb b/recipes-devtools/python/python-crcmod_1.7.bb
index 9b9117f..0442457 100644
--- a/recipes-devtools/python/python-crcmod_1.7.bb
+++ b/recipes-devtools/python/python-crcmod_1.7.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-unittest"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-crcmod] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-crcmod] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cryptography-vectors_2.8.bb b/recipes-devtools/python/python-cryptography-vectors_2.8.bb
index fc9baa4..b661b38 100644
--- a/recipes-devtools/python/python-cryptography-vectors_2.8.bb
+++ b/recipes-devtools/python/python-cryptography-vectors_2.8.bb
@@ -24,4 +24,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-cryptography-vectors] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cryptography-vectors] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cryptography_2.8.bb b/recipes-devtools/python/python-cryptography_2.8.bb
index 40d5e69..b3f097c 100644
--- a/recipes-devtools/python/python-cryptography_2.8.bb
+++ b/recipes-devtools/python/python-cryptography_2.8.bb
@@ -89,4 +89,4 @@ RDEPENDS:${PN}:class-target += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-cryptography] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cryptography] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-cython_0.29.14.bb b/recipes-devtools/python/python-cython_0.29.14.bb
index 22c5bd0..a788b44 100644
--- a/recipes-devtools/python/python-cython_0.29.14.bb
+++ b/recipes-devtools/python/python-cython_0.29.14.bb
@@ -49,4 +49,4 @@ do_install:append() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-cython] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cython] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-daemon_2.1.2.bb b/recipes-devtools/python/python-daemon_2.1.2.bb
index 9bd0808..a7048db 100644
--- a/recipes-devtools/python/python-daemon_2.1.2.bb
+++ b/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -26,4 +26,4 @@ SRC_URI:append = " \
 
 PYPI_PACKAGE = "python-daemon"
 
-PNBLACKLIST[python-daemon] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-daemon] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-daemonize_2.5.0.bb b/recipes-devtools/python/python-daemonize_2.5.0.bb
index 17d13b6..1acebbc 100644
--- a/recipes-devtools/python/python-daemonize_2.5.0.bb
+++ b/recipes-devtools/python/python-daemonize_2.5.0.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} = "\
 SRC_URI[md5sum] = "3d64e7a0219ad22e3fca62460f893b6a"
 SRC_URI[sha256sum] = "dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3"
 
-PNBLACKLIST[python-daemonize] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-daemonize] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dateutil_2.8.1.bb b/recipes-devtools/python/python-dateutil_2.8.1.bb
index 8ed0cbd..3b2612f 100644
--- a/recipes-devtools/python/python-dateutil_2.8.1.bb
+++ b/recipes-devtools/python/python-dateutil_2.8.1.bb
@@ -28,4 +28,4 @@ RDEPENDS:${PN}:class-target = "\
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-dateutil] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-dateutil] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dbus_1.2.14.bb b/recipes-devtools/python/python-dbus_1.2.14.bb
index 50d9959..7949199 100644
--- a/recipes-devtools/python/python-dbus_1.2.14.bb
+++ b/recipes-devtools/python/python-dbus_1.2.14.bb
@@ -31,4 +31,4 @@ do_install:append() {
     rm ${D}${includedir}/dbus-1.0/dbus/dbus-python.h ${D}${libdir}/pkgconfig/dbus-python.pc
 }
 
-PNBLACKLIST[python-dbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-dbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dbusmock_0.16.7.bb b/recipes-devtools/python/python-dbusmock_0.16.7.bb
index bd88045..c98b237 100644
--- a/recipes-devtools/python/python-dbusmock_0.16.7.bb
+++ b/recipes-devtools/python/python-dbusmock_0.16.7.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-xml \
     "
 
-PNBLACKLIST[python-dbusmock] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-dbusmock] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-decorator_4.4.1.bb b/recipes-devtools/python/python-decorator_4.4.1.bb
index 4ad2d87..5e1a438 100644
--- a/recipes-devtools/python/python-decorator_4.4.1.bb
+++ b/recipes-devtools/python/python-decorator_4.4.1.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-stringold \
     "
 
-PNBLACKLIST[python-decorator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-decorator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-deprecated_1.2.7.bb b/recipes-devtools/python/python-deprecated_1.2.7.bb
index f1fd1c4..d0ec237 100644
--- a/recipes-devtools/python/python-deprecated_1.2.7.bb
+++ b/recipes-devtools/python/python-deprecated_1.2.7.bb
@@ -15,4 +15,4 @@ S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 RDEPENDS:${PN} += "python-wrapt"
 
-PNBLACKLIST[python-deprecated] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-deprecated] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-distutils-extra_2.39.bb b/recipes-devtools/python/python-distutils-extra_2.39.bb
index 6afe59d..7444464 100644
--- a/recipes-devtools/python/python-distutils-extra_2.39.bb
+++ b/recipes-devtools/python/python-distutils-extra_2.39.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-distutils-extra] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-distutils-extra] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-django-south_1.0.2.bb b/recipes-devtools/python/python-django-south_1.0.2.bb
index 249bd9b..cb28050 100644
--- a/recipes-devtools/python/python-django-south_1.0.2.bb
+++ b/recipes-devtools/python/python-django-south_1.0.2.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-django-south] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-django-south] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-django_1.11.26.bb b/recipes-devtools/python/python-django_1.11.26.bb
index 89d3100..a02e227 100644
--- a/recipes-devtools/python/python-django_1.11.26.bb
+++ b/recipes-devtools/python/python-django_1.11.26.bb
@@ -41,4 +41,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-django] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-django] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/recipes-devtools/python/python-djangorestframework_3.9.0.bb
index e726ea0..1ff0378 100644
--- a/recipes-devtools/python/python-djangorestframework_3.9.0.bb
+++ b/recipes-devtools/python/python-djangorestframework_3.9.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-django \
 "
 
-PNBLACKLIST[python-djangorestframework] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-djangorestframework] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dnspython_1.16.0.bb b/recipes-devtools/python/python-dnspython_1.16.0.bb
index 690bbf3..1212d65 100644
--- a/recipes-devtools/python/python-dnspython_1.16.0.bb
+++ b/recipes-devtools/python/python-dnspython_1.16.0.bb
@@ -28,4 +28,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-threading \
 "
 
-PNBLACKLIST[python-dnspython] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-dnspython] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-docker-pycreds_0.4.0.bb b/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
index 7d0cbb7..03862f1 100644
--- a/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
+++ b/recipes-devtools/python/python-docker-pycreds_0.4.0.bb
@@ -8,4 +8,4 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "322f570cea6b4661c6ac335683988e18"
 SRC_URI[sha256sum] = "6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4"
 
-PNBLACKLIST[python-docker-pycreds] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-docker-pycreds] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-docker_4.2.0.bb b/recipes-devtools/python/python-docker_4.2.0.bb
index f3bfc4a..9629525 100644
--- a/recipes-devtools/python/python-docker_4.2.0.bb
+++ b/recipes-devtools/python/python-docker_4.2.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python-backports-ssl \
 "
 
-PNBLACKLIST[python-docker] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-docker] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-docutils_0.15.2.bb b/recipes-devtools/python/python-docutils_0.15.2.bb
index 25ae66e..6a2858b 100644
--- a/recipes-devtools/python/python-docutils_0.15.2.bb
+++ b/recipes-devtools/python/python-docutils_0.15.2.bb
@@ -14,4 +14,4 @@ SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce
 BBCLASSEXTEND = "native"
 
 
-PNBLACKLIST[python-docutils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-docutils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-dominate_2.4.0.bb b/recipes-devtools/python/python-dominate_2.4.0.bb
index 74a1d37..7661425 100644
--- a/recipes-devtools/python/python-dominate_2.4.0.bb
+++ b/recipes-devtools/python/python-dominate_2.4.0.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-threading \
     "
 
-PNBLACKLIST[python-dominate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-dominate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-editor_1.0.4.bb b/recipes-devtools/python/python-editor_1.0.4.bb
index d9c3ad1..e3676f0 100644
--- a/recipes-devtools/python/python-editor_1.0.4.bb
+++ b/recipes-devtools/python/python-editor_1.0.4.bb
@@ -13,4 +13,4 @@ PYPI_PACKAGE = "python-editor"
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-editor] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-editor] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-engineio_3.11.2.bb b/recipes-devtools/python/python-engineio_3.11.2.bb
index 89c52ff..5e9dde1 100644
--- a/recipes-devtools/python/python-engineio_3.11.2.bb
+++ b/recipes-devtools/python/python-engineio_3.11.2.bb
@@ -23,4 +23,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-six \
 "
 
-PNBLACKLIST[python-engineio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-engineio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-enum34_1.1.6.bb b/recipes-devtools/python/python-enum34_1.1.6.bb
index 8e7bd8e..1d519c9 100644
--- a/recipes-devtools/python/python-enum34_1.1.6.bb
+++ b/recipes-devtools/python/python-enum34_1.1.6.bb
@@ -10,4 +10,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-enum34] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-enum34] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-epydoc_3.0.1.bb b/recipes-devtools/python/python-epydoc_3.0.1.bb
index 2c53695..78316f3 100644
--- a/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ b/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-epydoc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-epydoc] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-evdev_1.2.0.bb b/recipes-devtools/python/python-evdev_1.2.0.bb
index b030f61..109a632 100644
--- a/recipes-devtools/python/python-evdev_1.2.0.bb
+++ b/recipes-devtools/python/python-evdev_1.2.0.bb
@@ -26,4 +26,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-stringold \
     "
 
-PNBLACKLIST[python-evdev] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-evdev] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-feedformatter_0.4.bb b/recipes-devtools/python/python-feedformatter_0.4.bb
index efb0ea8..42b15e6 100644
--- a/recipes-devtools/python/python-feedformatter_0.4.bb
+++ b/recipes-devtools/python/python-feedformatter_0.4.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-xml \
     "
 
-PNBLACKLIST[python-feedformatter] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-feedformatter] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-feedparser_5.2.1.bb b/recipes-devtools/python/python-feedparser_5.2.1.bb
index 307b56c..b928b0e 100644
--- a/recipes-devtools/python/python-feedparser_5.2.1.bb
+++ b/recipes-devtools/python/python-feedparser_5.2.1.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
     "
 
 
-PNBLACKLIST[python-feedparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-feedparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-babel_0.12.2.bb b/recipes-devtools/python/python-flask-babel_0.12.2.bb
index 201b24a..3d1e81d 100644
--- a/recipes-devtools/python/python-flask-babel_0.12.2.bb
+++ b/recipes-devtools/python/python-flask-babel_0.12.2.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-speaklater \
     "
 
-PNBLACKLIST[python-flask-babel] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-babel] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb b/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
index fb78a34..744fc9d 100644
--- a/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
+++ b/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
@@ -11,4 +11,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} += "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
 
-PNBLACKLIST[python-flask-bcrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-bcrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb b/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
index 39c5079..2a9e51b 100644
--- a/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
+++ b/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-visitor \
     "
 
-PNBLACKLIST[python-flask-bootstrap] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-bootstrap] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-login_0.4.1.bb b/recipes-devtools/python/python-flask-login_0.4.1.bb
index 410f087..e24b65e 100644
--- a/recipes-devtools/python/python-flask-login_0.4.1.bb
+++ b/recipes-devtools/python/python-flask-login_0.4.1.bb
@@ -15,4 +15,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN}:class-target = "${PYTHON_PN}-flask"
 
-PNBLACKLIST[python-flask-login] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-login] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-mail_0.9.1.bb b/recipes-devtools/python/python-flask-mail_0.9.1.bb
index 31f2de7..ea87c4e 100644
--- a/recipes-devtools/python/python-flask-mail_0.9.1.bb
+++ b/recipes-devtools/python/python-flask-mail_0.9.1.bb
@@ -17,4 +17,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} = "${PYTHON_PN}-flask"
 
-PNBLACKLIST[python-flask-mail] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-mail] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-migrate_2.5.2.bb b/recipes-devtools/python/python-flask-migrate_2.5.2.bb
index f3ce2a8..044cc19 100644
--- a/recipes-devtools/python/python-flask-migrate_2.5.2.bb
+++ b/recipes-devtools/python/python-flask-migrate_2.5.2.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     "
 
-PNBLACKLIST[python-flask-migrate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-migrate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-nav_0.6.bb b/recipes-devtools/python/python-flask-nav_0.6.bb
index a7be712..1d4e309 100644
--- a/recipes-devtools/python/python-flask-nav_0.6.bb
+++ b/recipes-devtools/python/python-flask-nav_0.6.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     "
 
-PNBLACKLIST[python-flask-nav] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-nav] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-navigation_0.2.0.bb b/recipes-devtools/python/python-flask-navigation_0.2.0.bb
index 28c8059..1ef1bb1 100644
--- a/recipes-devtools/python/python-flask-navigation_0.2.0.bb
+++ b/recipes-devtools/python/python-flask-navigation_0.2.0.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     "
 
-PNBLACKLIST[python-flask-navigation] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-navigation] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-pymongo_2.3.0.bb b/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
index b78e298..636ac7c 100644
--- a/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
+++ b/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
@@ -16,4 +16,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
 
-PNBLACKLIST[python-flask-pymongo] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-pymongo] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-restful_0.3.7.bb b/recipes-devtools/python/python-flask-restful_0.3.7.bb
index 7421004..b58ea03 100644
--- a/recipes-devtools/python/python-flask-restful_0.3.7.bb
+++ b/recipes-devtools/python/python-flask-restful_0.3.7.bb
@@ -15,4 +15,4 @@ PYPI_PACKAGE = "Flask-RESTful"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-flask"
 
-PNBLACKLIST[python-flask-restful] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-restful] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-script_2.0.6.bb b/recipes-devtools/python/python-flask-script_2.0.6.bb
index b6e8417..1d01cf2 100644
--- a/recipes-devtools/python/python-flask-script_2.0.6.bb
+++ b/recipes-devtools/python/python-flask-script_2.0.6.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     "
 
-PNBLACKLIST[python-flask-script] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-script] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-sijax_0.4.1.bb b/recipes-devtools/python/python-flask-sijax_0.4.1.bb
index fd480f8..39fbf28 100644
--- a/recipes-devtools/python/python-flask-sijax_0.4.1.bb
+++ b/recipes-devtools/python/python-flask-sijax_0.4.1.bb
@@ -17,4 +17,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} = "${PYTHON_PN}-sijax"
 
-PNBLACKLIST[python-flask-sijax] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-sijax] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-socketio_4.2.1.bb b/recipes-devtools/python/python-flask-socketio_4.2.1.bb
index 9c233fa..14ce669 100644
--- a/recipes-devtools/python/python-flask-socketio_4.2.1.bb
+++ b/recipes-devtools/python/python-flask-socketio_4.2.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-socketio \
     "
 
-PNBLACKLIST[python-flask-socketio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-socketio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb b/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
index 09b5546..10cbd39 100644
--- a/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
+++ b/recipes-devtools/python/python-flask-sqlalchemy_2.4.1.bb
@@ -17,4 +17,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
 
-PNBLACKLIST[python-flask-sqlalchemy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-sqlalchemy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-uploads_0.2.1.bb b/recipes-devtools/python/python-flask-uploads_0.2.1.bb
index dcd4392..ad59d61 100644
--- a/recipes-devtools/python/python-flask-uploads_0.2.1.bb
+++ b/recipes-devtools/python/python-flask-uploads_0.2.1.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
     "
 
-PNBLACKLIST[python-flask-uploads] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-uploads] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-user_0.6.19.bb b/recipes-devtools/python/python-flask-user_0.6.19.bb
index 270ef53..8b86e40 100644
--- a/recipes-devtools/python/python-flask-user_0.6.19.bb
+++ b/recipes-devtools/python/python-flask-user_0.6.19.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} = "${PYTHON_PN}-flask \
     ${PYTHON_PN}-flask-mail \
     ${PYTHON_PN}-babel"
 
-PNBLACKLIST[python-flask-user] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-user] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-wtf_0.14.2.bb b/recipes-devtools/python/python-flask-wtf_0.14.2.bb
index 6cab518..60b56e9 100644
--- a/recipes-devtools/python/python-flask-wtf_0.14.2.bb
+++ b/recipes-devtools/python/python-flask-wtf_0.14.2.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-wtforms \
 "
 
-PNBLACKLIST[python-flask-wtf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-wtf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask-xstatic_0.0.1.bb b/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
index 63a0344..91a2e72 100644
--- a/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
+++ b/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-xstatic \
     "
 
-PNBLACKLIST[python-flask-xstatic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask-xstatic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-flask_1.1.1.bb b/recipes-devtools/python/python-flask_1.1.1.bb
index dfe62b3..8cd6965 100644
--- a/recipes-devtools/python/python-flask_1.1.1.bb
+++ b/recipes-devtools/python/python-flask_1.1.1.bb
@@ -22,4 +22,4 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-werkzeug \
     "
 
-PNBLACKLIST[python-flask] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-flask] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-funcsigs_1.0.2.bb b/recipes-devtools/python/python-funcsigs_1.0.2.bb
index 8df1d9e..ca92dda 100644
--- a/recipes-devtools/python/python-funcsigs_1.0.2.bb
+++ b/recipes-devtools/python/python-funcsigs_1.0.2.bb
@@ -17,4 +17,4 @@ SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b8702
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-funcsigs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-funcsigs] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-functools32_3.2.3-2.bb b/recipes-devtools/python/python-functools32_3.2.3-2.bb
index 5451357..f0be384 100644
--- a/recipes-devtools/python/python-functools32_3.2.3-2.bb
+++ b/recipes-devtools/python/python-functools32_3.2.3-2.bb
@@ -9,4 +9,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-functools32] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-functools32] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-future_0.18.2.bb b/recipes-devtools/python/python-future_0.18.2.bb
index 1b01807..192ed7e 100644
--- a/recipes-devtools/python/python-future_0.18.2.bb
+++ b/recipes-devtools/python/python-future_0.18.2.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN}:append:class-target = " python-misc"
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-future] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-future] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-futures_3.3.0.bb b/recipes-devtools/python/python-futures_3.3.0.bb
index 65f2975..e3a30eb 100644
--- a/recipes-devtools/python/python-futures_3.3.0.bb
+++ b/recipes-devtools/python/python-futures_3.3.0.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-futures] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-futures] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-gdata_2.0.18.bb b/recipes-devtools/python/python-gdata_2.0.18.bb
index 505c9a9..780075f 100644
--- a/recipes-devtools/python/python-gdata_2.0.18.bb
+++ b/recipes-devtools/python/python-gdata_2.0.18.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} = " \
     ${PYTHON_PN}-xml \
 "
 
-PNBLACKLIST[python-gdata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-gdata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-gevent_1.4.0.bb b/recipes-devtools/python/python-gevent_1.4.0.bb
index 28fc516..cc07840 100644
--- a/recipes-devtools/python/python-gevent_1.4.0.bb
+++ b/recipes-devtools/python/python-gevent_1.4.0.bb
@@ -39,4 +39,4 @@ do_configure:append() {
 }
 
 
-PNBLACKLIST[python-gevent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-gevent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-greenlet_0.4.15.bb b/recipes-devtools/python/python-greenlet_0.4.15.bb
index 1e6fdd1..78c4681 100644
--- a/recipes-devtools/python/python-greenlet_0.4.15.bb
+++ b/recipes-devtools/python/python-greenlet_0.4.15.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc238
 
 inherit pypi distutils
 
-PNBLACKLIST[python-greenlet] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-greenlet] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-grpcio-tools_1.14.1.bb b/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
index 5d076d0..e45bcc8 100644
--- a/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
+++ b/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-grpcio-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-grpcio-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-grpcio_1.27.1.bb b/recipes-devtools/python/python-grpcio_1.27.1.bb
index 82c3748..e6fb6c8 100644
--- a/recipes-devtools/python/python-grpcio_1.27.1.bb
+++ b/recipes-devtools/python/python-grpcio_1.27.1.bb
@@ -30,4 +30,4 @@ CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-grpcio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-grpcio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-html5lib_1.0.1.bb b/recipes-devtools/python/python-html5lib_1.0.1.bb
index aafa65d..96bd92f 100644
--- a/recipes-devtools/python/python-html5lib_1.0.1.bb
+++ b/recipes-devtools/python/python-html5lib_1.0.1.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-html5lib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-html5lib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-humanfriendly_4.18.bb b/recipes-devtools/python/python-humanfriendly_4.18.bb
index d26f80e..05f625d 100644
--- a/recipes-devtools/python/python-humanfriendly_4.18.bb
+++ b/recipes-devtools/python/python-humanfriendly_4.18.bb
@@ -28,4 +28,4 @@ RDEPENDS:${PN}:class-target += " \
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-humanfriendly] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-humanfriendly] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-humanize_0.5.1.bb b/recipes-devtools/python/python-humanize_0.5.1.bb
index 6a6df3b..fb06cc1 100644
--- a/recipes-devtools/python/python-humanize_0.5.1.bb
+++ b/recipes-devtools/python/python-humanize_0.5.1.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-humanize] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-humanize] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-hyperlink_19.0.0.bb b/recipes-devtools/python/python-hyperlink_19.0.0.bb
index 61ff3f6..027f988 100644
--- a/recipes-devtools/python/python-hyperlink_19.0.0.bb
+++ b/recipes-devtools/python/python-hyperlink_19.0.0.bb
@@ -21,4 +21,4 @@ FILES:${PN}-test += " \
         ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
 "
 
-PNBLACKLIST[python-hyperlink] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-hyperlink] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-hypothesis_4.50.2.bb b/recipes-devtools/python/python-hypothesis_4.50.2.bb
index 0f639b8..3a07eb2 100644
--- a/recipes-devtools/python/python-hypothesis_4.50.2.bb
+++ b/recipes-devtools/python/python-hypothesis_4.50.2.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-enum34 \
     "
 
-PNBLACKLIST[python-hypothesis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-hypothesis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-idna_2.8.bb b/recipes-devtools/python/python-idna_2.8.bb
index 398d593..ff30159 100644
--- a/recipes-devtools/python/python-idna_2.8.bb
+++ b/recipes-devtools/python/python-idna_2.8.bb
@@ -19,4 +19,4 @@ do_compile:prepend() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-idna] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-idna] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-imaging_1.1.7.bb b/recipes-devtools/python/python-imaging_1.1.7.bb
index cd4a3d1..f2d163f 100644
--- a/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -47,4 +47,4 @@ do_install() {
 
 RDEPENDS:${PN} += "python-lang python-stringold"
 
-PNBLACKLIST[python-imaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-imaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-importlib-metadata_0.23.bb b/recipes-devtools/python/python-importlib-metadata_0.23.bb
index e63f375..6803b8e 100644
--- a/recipes-devtools/python/python-importlib-metadata_0.23.bb
+++ b/recipes-devtools/python/python-importlib-metadata_0.23.bb
@@ -26,4 +26,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-importlib-metadata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-importlib-metadata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-incremental_17.5.0.bb b/recipes-devtools/python/python-incremental_17.5.0.bb
index 2e44794..2f11e95 100644
--- a/recipes-devtools/python/python-incremental_17.5.0.bb
+++ b/recipes-devtools/python/python-incremental_17.5.0.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += " \
 RDEPENDS:${PYTHON_PN}-incremental-native:remove = "${PYTHON_PN}-twisted-native"
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-incremental] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-incremental] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-inflection_0.3.1.bb b/recipes-devtools/python/python-inflection_0.3.1.bb
index add8ec4..aaa7be5 100644
--- a/recipes-devtools/python/python-inflection_0.3.1.bb
+++ b/recipes-devtools/python/python-inflection_0.3.1.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-inflection] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-inflection] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-intervals_1.10.0.bb b/recipes-devtools/python/python-intervals_1.10.0.bb
index 595fb65..6a8c8d5 100644
--- a/recipes-devtools/python/python-intervals_1.10.0.bb
+++ b/recipes-devtools/python/python-intervals_1.10.0.bb
@@ -16,4 +16,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-intervals] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-intervals] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ipaddress_1.0.23.bb b/recipes-devtools/python/python-ipaddress_1.0.23.bb
index bb08da4..570a8df 100644
--- a/recipes-devtools/python/python-ipaddress_1.0.23.bb
+++ b/recipes-devtools/python/python-ipaddress_1.0.23.bb
@@ -10,4 +10,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-ipaddress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-ipaddress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ipy_1.00.bb b/recipes-devtools/python/python-ipy_1.00.bb
index 109e4eb..323d42c 100644
--- a/recipes-devtools/python/python-ipy_1.00.bb
+++ b/recipes-devtools/python/python-ipy_1.00.bb
@@ -18,4 +18,4 @@ PYPI_PACKAGE = "IPy"
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-ipy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-ipy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-iso8601_0.1.12.bb b/recipes-devtools/python/python-iso8601_0.1.12.bb
index db8ddc5..af0bc07 100644
--- a/recipes-devtools/python/python-iso8601_0.1.12.bb
+++ b/recipes-devtools/python/python-iso8601_0.1.12.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-iso8601] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-iso8601] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-isodate_0.6.0.bb b/recipes-devtools/python/python-isodate_0.6.0.bb
index b1eaca9..82d9bf8 100644
--- a/recipes-devtools/python/python-isodate_0.6.0.bb
+++ b/recipes-devtools/python/python-isodate_0.6.0.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-isodate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-isodate] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-isort_4.3.21.bb b/recipes-devtools/python/python-isort_4.3.21.bb
index a3905c4..7917c81 100644
--- a/recipes-devtools/python/python-isort_4.3.21.bb
+++ b/recipes-devtools/python/python-isort_4.3.21.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-isort] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-isort] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-itsdangerous_1.1.0.bb b/recipes-devtools/python/python-itsdangerous_1.1.0.bb
index 5e2cbab..43832f5 100644
--- a/recipes-devtools/python/python-itsdangerous_1.1.0.bb
+++ b/recipes-devtools/python/python-itsdangerous_1.1.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-zlib \
 "
 
-PNBLACKLIST[python-itsdangerous] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-itsdangerous] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
index 597cb28..14ce657 100644
--- a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
+++ b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN}:append:class-target = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-javaobj-py3] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-javaobj-py3] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jinja2_2.10.3.bb b/recipes-devtools/python/python-jinja2_2.10.3.bb
index 0320144..6eb5ac1 100644
--- a/recipes-devtools/python/python-jinja2_2.10.3.bb
+++ b/recipes-devtools/python/python-jinja2_2.10.3.bb
@@ -32,4 +32,4 @@ CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-jinja2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-jinja2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsmin_2.2.2.bb b/recipes-devtools/python/python-jsmin_2.2.2.bb
index 53884b9..4b845cd 100644
--- a/recipes-devtools/python/python-jsmin_2.2.2.bb
+++ b/recipes-devtools/python/python-jsmin_2.2.2.bb
@@ -10,4 +10,4 @@ SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-jsmin] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-jsmin] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonpatch_1.24.bb b/recipes-devtools/python/python-jsonpatch_1.24.bb
index 0850982..c37a8d5 100644
--- a/recipes-devtools/python/python-jsonpatch_1.24.bb
+++ b/recipes-devtools/python/python-jsonpatch_1.24.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-stringold \
 "
 
-PNBLACKLIST[python-jsonpatch] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-jsonpatch] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonpointer_2.0.bb b/recipes-devtools/python/python-jsonpointer_2.0.bb
index 1cf4982..4acda74 100644
--- a/recipes-devtools/python/python-jsonpointer_2.0.bb
+++ b/recipes-devtools/python/python-jsonpointer_2.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-jsonpointer] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-jsonpointer] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonref_0.2.bb b/recipes-devtools/python/python-jsonref_0.2.bb
index 01a770e..4a3a83d 100644
--- a/recipes-devtools/python/python-jsonref_0.2.bb
+++ b/recipes-devtools/python/python-jsonref_0.2.bb
@@ -17,4 +17,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-jsonref] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-jsonref] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-jsonschema_3.2.0.bb b/recipes-devtools/python/python-jsonschema_3.2.0.bb
index 2be8ead..0798e78 100644
--- a/recipes-devtools/python/python-jsonschema_3.2.0.bb
+++ b/recipes-devtools/python/python-jsonschema_3.2.0.bb
@@ -58,4 +58,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-jsonschema] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-jsonschema] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-kombu_4.6.6.bb b/recipes-devtools/python/python-kombu_4.6.6.bb
index b01215d..ff793f7 100644
--- a/recipes-devtools/python/python-kombu_4.6.6.bb
+++ b/recipes-devtools/python/python-kombu_4.6.6.bb
@@ -22,4 +22,4 @@ RDEPENDS:${PN} = " \
         python-amqp \
         "
 
-PNBLACKLIST[python-kombu] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-kombu] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb b/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
index eb94a7a..6ca1d49 100644
--- a/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
+++ b/recipes-devtools/python/python-lazy-object-proxy_1.4.3.bb
@@ -11,4 +11,4 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-lazy-object-proxy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-lazy-object-proxy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ldap_3.2.0.bb b/recipes-devtools/python/python-ldap_3.2.0.bb
index 326d02e..677ed24 100644
--- a/recipes-devtools/python/python-ldap_3.2.0.bb
+++ b/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -36,4 +36,4 @@ python() {
         raise bb.parse.SkipRecipe('Requires networking-layer to be present to provide cyrus-sasl.')
 }
 
-PNBLACKLIST[python-ldap] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-ldap] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-license-expression_1.2.bb b/recipes-devtools/python/python-license-expression_1.2.bb
index 9572526..edf050f 100644
--- a/recipes-devtools/python/python-license-expression_1.2.bb
+++ b/recipes-devtools/python/python-license-expression_1.2.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN}:append:class-target = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-license-expression] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-license-expression] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-linecache2_1.0.0.bb b/recipes-devtools/python/python-linecache2_1.0.0.bb
index cdb7ed5..a8fa950 100644
--- a/recipes-devtools/python/python-linecache2_1.0.0.bb
+++ b/recipes-devtools/python/python-linecache2_1.0.0.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools
 
 CLEAN_BROKEN = "1"
 
-PNBLACKLIST[python-linecache2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-linecache2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lockfile_0.12.2.bb b/recipes-devtools/python/python-lockfile_0.12.2.bb
index 1097ce8..543b381 100644
--- a/recipes-devtools/python/python-lockfile_0.12.2.bb
+++ b/recipes-devtools/python/python-lockfile_0.12.2.bb
@@ -18,4 +18,4 @@ DEPENDS += " \
         "
 
 
-PNBLACKLIST[python-lockfile] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-lockfile] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lrparsing_1.0.16.bb b/recipes-devtools/python/python-lrparsing_1.0.16.bb
index 4cbc92c..7c3f78d 100644
--- a/recipes-devtools/python/python-lrparsing_1.0.16.bb
+++ b/recipes-devtools/python/python-lrparsing_1.0.16.bb
@@ -18,4 +18,4 @@ inherit setuptools
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-lrparsing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-lrparsing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-lxml_4.4.2.bb b/recipes-devtools/python/python-lxml_4.4.2.bb
index 88b5544..2e21639 100644
--- a/recipes-devtools/python/python-lxml_4.4.2.bb
+++ b/recipes-devtools/python/python-lxml_4.4.2.bb
@@ -51,4 +51,4 @@ RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-lxml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-lxml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-m2crypto_0.30.1.bb b/recipes-devtools/python/python-m2crypto_0.30.1.bb
index 5c595f8..548a40d 100644
--- a/recipes-devtools/python/python-m2crypto_0.30.1.bb
+++ b/recipes-devtools/python/python-m2crypto_0.30.1.bb
@@ -63,5 +63,5 @@ do_configure:prepend() {
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-m2crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-PNBLACKLIST[python-m2crypto-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-m2crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-m2crypto-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-mako_1.1.0.bb b/recipes-devtools/python/python-mako_1.1.0.bb
index ee6051c..9509b64 100644
--- a/recipes-devtools/python/python-mako_1.1.0.bb
+++ b/recipes-devtools/python/python-mako_1.1.0.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} = " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-mako] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-mako] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-markupsafe_1.1.1.bb b/recipes-devtools/python/python-markupsafe_1.1.1.bb
index ef4eadb..63192c0 100644
--- a/recipes-devtools/python/python-markupsafe_1.1.1.bb
+++ b/recipes-devtools/python/python-markupsafe_1.1.1.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-markupsafe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-markupsafe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-mccabe_0.4.0.bb b/recipes-devtools/python/python-mccabe_0.4.0.bb
index 62503af..2c32bf9 100644
--- a/recipes-devtools/python/python-mccabe_0.4.0.bb
+++ b/recipes-devtools/python/python-mccabe_0.4.0.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-mccabe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-mccabe] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-mock_3.0.5.bb b/recipes-devtools/python/python-mock_3.0.5.bb
index b91d233..884bcf4 100644
--- a/recipes-devtools/python/python-mock_3.0.5.bb
+++ b/recipes-devtools/python/python-mock_3.0.5.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} += " \
     python-funcsigs \
 "
 
-PNBLACKLIST[python-mock] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-mock] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-monotonic_1.5.bb b/recipes-devtools/python/python-monotonic_1.5.bb
index a33c09a..d5aec1f 100644
--- a/recipes-devtools/python/python-monotonic_1.5.bb
+++ b/recipes-devtools/python/python-monotonic_1.5.bb
@@ -9,4 +9,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-io ${PYTHON_PN}-re ${PYTHON_PN}-threading"
 
-PNBLACKLIST[python-monotonic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-monotonic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-more-itertools_5.0.0.bb b/recipes-devtools/python/python-more-itertools_5.0.0.bb
index 40f0cfb..6aa3a1f 100644
--- a/recipes-devtools/python/python-more-itertools_5.0.0.bb
+++ b/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -16,4 +16,4 @@ PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-more-itertools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-more-itertools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-msgpack_0.6.2.bb b/recipes-devtools/python/python-msgpack_0.6.2.bb
index 43c4eb1..d58bcfb 100644
--- a/recipes-devtools/python/python-msgpack_0.6.2.bb
+++ b/recipes-devtools/python/python-msgpack_0.6.2.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-io \
 "
 
-PNBLACKLIST[python-msgpack] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-msgpack] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb b/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
index be10bac..623882a 100644
--- a/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
+++ b/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
@@ -39,4 +39,4 @@ ALTERNATIVE_PRIORITY = "20"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-ndg-httpsclient] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-ndg-httpsclient] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-netaddr_0.7.19.bb b/recipes-devtools/python/python-netaddr_0.7.19.bb
index ac73410..dc58c00 100644
--- a/recipes-devtools/python/python-netaddr_0.7.19.bb
+++ b/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-xml \
 "
 
-PNBLACKLIST[python-netaddr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-netaddr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-netifaces_0.10.9.bb b/recipes-devtools/python/python-netifaces_0.10.9.bb
index 5be7329..ec2ce73 100644
--- a/recipes-devtools/python/python-netifaces_0.10.9.bb
+++ b/recipes-devtools/python/python-netifaces_0.10.9.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490e
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-netifaces] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-netifaces] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-networkx_2.2.bb b/recipes-devtools/python/python-networkx_2.2.bb
index 5a96abb..68f39d9 100644
--- a/recipes-devtools/python/python-networkx_2.2.bb
+++ b/recipes-devtools/python/python-networkx_2.2.bb
@@ -13,4 +13,4 @@ PYPI_PACKAGE_EXT = "zip"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-decorator"
 
-PNBLACKLIST[python-networkx] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-networkx] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-numeric_24.2.bb b/recipes-devtools/python/python-numeric_24.2.bb
index 6c65ed5..a0679fa 100644
--- a/recipes-devtools/python/python-numeric_24.2.bb
+++ b/recipes-devtools/python/python-numeric_24.2.bb
@@ -15,4 +15,4 @@ inherit distutils
 SRC_URI[md5sum] = "2ae672656e06716a149acb048cca3093"
 SRC_URI[sha256sum] = "5f72e729eb6ff57442f2a38bfc9931738b59e5077928e2e70d22b4610ff15258"
 
-PNBLACKLIST[python-numeric] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-numeric] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-packaging_20.0.bb b/recipes-devtools/python/python-packaging_20.0.bb
index 0c81246..5c3dd08 100644
--- a/recipes-devtools/python/python-packaging_20.0.bb
+++ b/recipes-devtools/python/python-packaging_20.0.bb
@@ -14,4 +14,4 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
 
-PNBLACKLIST[python-packaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-packaging] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-paho-mqtt_1.5.0.bb b/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
index eb55beb..6ed40f7 100644
--- a/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
+++ b/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-threading \
 "
 
-PNBLACKLIST[python-paho-mqtt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-paho-mqtt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pam_1.8.2.bb b/recipes-devtools/python/python-pam_1.8.2.bb
index 72b90ff..6710f55 100644
--- a/recipes-devtools/python/python-pam_1.8.2.bb
+++ b/recipes-devtools/python/python-pam_1.8.2.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} = "libpam"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-PNBLACKLIST[python-pam] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pam] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pamela_0.3.0.bb b/recipes-devtools/python/python-pamela_0.3.0.bb
index 3721947..f7faa14 100644
--- a/recipes-devtools/python/python-pamela_0.3.0.bb
+++ b/recipes-devtools/python/python-pamela_0.3.0.bb
@@ -17,4 +17,4 @@ REQUIRED_DISTRO_FEATURES = "pam"
 # meta-python recipe did not follow Debian naming
 PROVIDES += "pamela"
 
-PNBLACKLIST[python-pamela] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pamela] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-parse-type_0.4.2.bb b/recipes-devtools/python/python-parse-type_0.4.2.bb
index bf7bce7..42a6683 100644
--- a/recipes-devtools/python/python-parse-type_0.4.2.bb
+++ b/recipes-devtools/python/python-parse-type_0.4.2.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} += "${PYTHON_PN}-parse"
 
-PNBLACKLIST[python-parse-type] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-parse-type] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-parse_1.14.0.bb b/recipes-devtools/python/python-parse_1.14.0.bb
index d692bfb..7ec4701 100644
--- a/recipes-devtools/python/python-parse_1.14.0.bb
+++ b/recipes-devtools/python/python-parse_1.14.0.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-numbers \
     "
 
-PNBLACKLIST[python-parse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-parse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-passlib_1.7.2.bb b/recipes-devtools/python/python-passlib_1.7.2.bb
index 44b0e31..73b6b6d 100644
--- a/recipes-devtools/python/python-passlib_1.7.2.bb
+++ b/recipes-devtools/python/python-passlib_1.7.2.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netclient \
 "
 
-PNBLACKLIST[python-passlib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-passlib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-paste_3.2.3.bb b/recipes-devtools/python/python-paste_3.2.3.bb
index d7d7225..7175bcb 100644
--- a/recipes-devtools/python/python-paste_3.2.3.bb
+++ b/recipes-devtools/python/python-paste_3.2.3.bb
@@ -16,4 +16,4 @@ FILES:${PN} += "/usr/lib/*"
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
 
-PNBLACKLIST[python-paste] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-paste] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pathlib2_2.3.5.bb b/recipes-devtools/python/python-pathlib2_2.3.5.bb
index fee2853..f4f46c9 100644
--- a/recipes-devtools/python/python-pathlib2_2.3.5.bb
+++ b/recipes-devtools/python/python-pathlib2_2.3.5.bb
@@ -23,4 +23,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pathlib2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pathlib2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pbr_5.4.4.bb b/recipes-devtools/python/python-pbr_5.4.4.bb
index ad7bbd0..efd14f9 100644
--- a/recipes-devtools/python/python-pbr_5.4.4.bb
+++ b/recipes-devtools/python/python-pbr_5.4.4.bb
@@ -20,4 +20,4 @@ do_install:append() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pbr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pbr] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pep8_1.7.1.bb b/recipes-devtools/python/python-pep8_1.7.1.bb
index e4aeee9..b3ec76e 100644
--- a/recipes-devtools/python/python-pep8_1.7.1.bb
+++ b/recipes-devtools/python/python-pep8_1.7.1.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pep8] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pep8] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-periphery_2.0.0.bb b/recipes-devtools/python/python-periphery_2.0.0.bb
index 3be604d..c61f020 100644
--- a/recipes-devtools/python/python-periphery_2.0.0.bb
+++ b/recipes-devtools/python/python-periphery_2.0.0.bb
@@ -11,4 +11,4 @@ inherit pypi setuptools
 
 SRC_URI[sha256sum] = "2df05528a7668db4fb3faaff516b34ed99e9009ed9610a4efe3ea6c0ea8a3aab"
 
-PNBLACKLIST[python-periphery] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-periphery] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pexpect_4.7.0.bb b/recipes-devtools/python/python-pexpect_4.7.0.bb
index 188c71f..6930a52 100644
--- a/recipes-devtools/python/python-pexpect_4.7.0.bb
+++ b/recipes-devtools/python/python-pexpect_4.7.0.bb
@@ -22,4 +22,4 @@ RDEPENDS:${PN} = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pexpect] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pexpect] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pika_1.1.0.bb b/recipes-devtools/python/python-pika_1.1.0.bb
index a297c11..49764e6 100644
--- a/recipes-devtools/python/python-pika_1.1.0.bb
+++ b/recipes-devtools/python/python-pika_1.1.0.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-twisted \
 "
 
-PNBLACKLIST[python-pika] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pika] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pint_0.9.bb b/recipes-devtools/python/python-pint_0.9.bb
index 93e081f..ef80d89 100644
--- a/recipes-devtools/python/python-pint_0.9.bb
+++ b/recipes-devtools/python/python-pint_0.9.bb
@@ -23,4 +23,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-pint] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pint] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pip_19.3.1.bb b/recipes-devtools/python/python-pip_19.3.1.bb
index c1592ab..64f5d61 100644
--- a/recipes-devtools/python/python-pip_19.3.1.bb
+++ b/recipes-devtools/python/python-pip_19.3.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN}:class-target = "python-modules python-distribute python-misc"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pip] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pip] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pluggy_0.13.1.bb b/recipes-devtools/python/python-pluggy_0.13.1.bb
index 885cf25..20db7ce 100644
--- a/recipes-devtools/python/python-pluggy_0.13.1.bb
+++ b/recipes-devtools/python/python-pluggy_0.13.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-pluggy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pluggy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ply_3.11.bb b/recipes-devtools/python/python-ply_3.11.bb
index 2513723..92c8cd7 100644
--- a/recipes-devtools/python/python-ply_3.11.bb
+++ b/recipes-devtools/python/python-ply_3.11.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN}:class-target += "\
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-ply] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-ply] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pretend_1.0.9.bb b/recipes-devtools/python/python-pretend_1.0.9.bb
index 5ff1d17..09706c2 100644
--- a/recipes-devtools/python/python-pretend_1.0.9.bb
+++ b/recipes-devtools/python/python-pretend_1.0.9.bb
@@ -10,4 +10,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pretend] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pretend] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-prettytable_0.7.2.bb b/recipes-devtools/python/python-prettytable_0.7.2.bb
index 1362ea6..0a6181a 100644
--- a/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -28,4 +28,4 @@ UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
 BBCLASSEXTEND = "native nativesdk"
 
 
-PNBLACKLIST[python-prettytable] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-prettytable] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-progress_1.5.bb b/recipes-devtools/python/python-progress_1.5.bb
index dcf4582..97aaf0a 100644
--- a/recipes-devtools/python/python-progress_1.5.bb
+++ b/recipes-devtools/python/python-progress_1.5.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN}:class-target += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-progress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-progress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb b/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
index 4886d64..5a8d82d 100644
--- a/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
+++ b/recipes-devtools/python/python-prompt-toolkit_2.0.10.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-prompt-toolkit] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-prompt-toolkit] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-protobuf_3.9.2.bb b/recipes-devtools/python/python-protobuf_3.9.2.bb
index 8079e48..07c906b 100644
--- a/recipes-devtools/python/python-protobuf_3.9.2.bb
+++ b/recipes-devtools/python/python-protobuf_3.9.2.bb
@@ -32,4 +32,4 @@ RDEPENDS:${PN} += " \
 BBCLASSEXTEND = "native nativesdk"
 
 
-PNBLACKLIST[python-protobuf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-protobuf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-psutil_5.6.7.bb b/recipes-devtools/python/python-psutil_5.6.7.bb
index f765b24..1f60010 100644
--- a/recipes-devtools/python/python-psutil_5.6.7.bb
+++ b/recipes-devtools/python/python-psutil_5.6.7.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-psutil] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-psutil] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ptyprocess_0.6.0.bb b/recipes-devtools/python/python-ptyprocess_0.6.0.bb
index 9f6b60f..a49dc4e 100644
--- a/recipes-devtools/python/python-ptyprocess_0.6.0.bb
+++ b/recipes-devtools/python/python-ptyprocess_0.6.0.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-ptyprocess] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-ptyprocess] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-py_1.8.1.bb b/recipes-devtools/python/python-py_1.8.1.bb
index 1ecf200..f8af28d 100644
--- a/recipes-devtools/python/python-py_1.8.1.bb
+++ b/recipes-devtools/python/python-py_1.8.1.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-py] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-py] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
index 174610f..831a27f 100644
--- a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
+++ b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
@@ -13,4 +13,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} += "libasound"
 
-PNBLACKLIST[python-pyalsaaudio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyalsaaudio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb b/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
index dd1c686..b3e13a4 100644
--- a/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
+++ b/recipes-devtools/python/python-pyasn1-modules_0.2.7.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} = "${PYTHON_PN}-pyasn1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyasn1-modules] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyasn1-modules] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyasn1_0.4.8.bb b/recipes-devtools/python/python-pyasn1_0.4.8.bb
index d4ed208..d55d142 100644
--- a/recipes-devtools/python/python-pyasn1_0.4.8.bb
+++ b/recipes-devtools/python/python-pyasn1_0.4.8.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN}:class-target += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyasn1] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyasn1] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pybind11_2.4.3.bb b/recipes-devtools/python/python-pybind11_2.4.3.bb
index ebdbf14..288e8a1 100644
--- a/recipes-devtools/python/python-pybind11_2.4.3.bb
+++ b/recipes-devtools/python/python-pybind11_2.4.3.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-pybind11] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pybind11] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pybluez_0.22.bb b/recipes-devtools/python/python-pybluez_0.22.bb
index 62ccec5..e4f7ff8 100644
--- a/recipes-devtools/python/python-pybluez_0.22.bb
+++ b/recipes-devtools/python/python-pybluez_0.22.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-fcntl \
 "
 
-PNBLACKLIST[python-pybluez] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pybluez] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycodestyle_2.5.0.bb b/recipes-devtools/python/python-pycodestyle_2.5.0.bb
index de5e7e3..01c5a64 100644
--- a/recipes-devtools/python/python-pycodestyle_2.5.0.bb
+++ b/recipes-devtools/python/python-pycodestyle_2.5.0.bb
@@ -20,4 +20,4 @@ do_install:append () {
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pycodestyle] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pycodestyle] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycparser_2.19.bb b/recipes-devtools/python/python-pycparser_2.19.bb
index 17bcc41..9dba782 100644
--- a/recipes-devtools/python/python-pycparser_2.19.bb
+++ b/recipes-devtools/python/python-pycparser_2.19.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN}:class-target += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pycparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pycparser] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycrypto_2.6.1.bb b/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 8d2e633..53971f5 100644
--- a/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -35,4 +35,4 @@ do_install() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pycrypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pycrypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycryptodomex_3.9.4.bb b/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
index f863b56..04abb5b 100644
--- a/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
+++ b/recipes-devtools/python/python-pycryptodomex_3.9.4.bb
@@ -28,4 +28,4 @@ FILES:${PN}-tests += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pycryptodomex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pycryptodomex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pycurl_7.43.0.3.bb b/recipes-devtools/python/python-pycurl_7.43.0.3.bb
index d55c5b6..440ea19 100644
--- a/recipes-devtools/python/python-pycurl_7.43.0.3.bb
+++ b/recipes-devtools/python/python-pycurl_7.43.0.3.bb
@@ -26,4 +26,4 @@ DEPENDS = "\
     ${PYTHON_PN}\
 "
 
-PNBLACKLIST[python-pycurl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pycurl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pydbus_0.6.0.bb b/recipes-devtools/python/python-pydbus_0.6.0.bb
index 853edef..2eb1453 100644
--- a/recipes-devtools/python/python-pydbus_0.6.0.bb
+++ b/recipes-devtools/python/python-pydbus_0.6.0.bb
@@ -13,4 +13,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} = "${PYTHON_PN}-pygobject"
 
-PNBLACKLIST[python-pydbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pydbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyelftools_0.25.bb b/recipes-devtools/python/python-pyelftools_0.25.bb
index 0abbaa6..6e98c6d 100644
--- a/recipes-devtools/python/python-pyelftools_0.25.bb
+++ b/recipes-devtools/python/python-pyelftools_0.25.bb
@@ -15,4 +15,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-pyelftools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyelftools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyexpect_1.0.19.bb b/recipes-devtools/python/python-pyexpect_1.0.19.bb
index 9a914a7..bf9ad0d 100644
--- a/recipes-devtools/python/python-pyexpect_1.0.19.bb
+++ b/recipes-devtools/python/python-pyexpect_1.0.19.bb
@@ -10,4 +10,4 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "dc744289858001925c75d21e26f1260f"
 SRC_URI[sha256sum] = "bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef"
 
-PNBLACKLIST[python-pyexpect] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyexpect] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyfirmata_1.1.0.bb b/recipes-devtools/python/python-pyfirmata_1.1.0.bb
index c805bcf..2d17fdd 100644
--- a/recipes-devtools/python/python-pyfirmata_1.1.0.bb
+++ b/recipes-devtools/python/python-pyfirmata_1.1.0.bb
@@ -13,4 +13,4 @@ SRC_URI[sha256sum] = "cc180d1b30c85a2bbca62c15fef1b871db048cdcfa80959968356d97bd
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-pyfirmata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyfirmata] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyflakes_2.1.1.bb b/recipes-devtools/python/python-pyflakes_2.1.1.bb
index 96ba9a4..641ada9 100644
--- a/recipes-devtools/python/python-pyflakes_2.1.1.bb
+++ b/recipes-devtools/python/python-pyflakes_2.1.1.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyflakes] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyflakes] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyflame_1.6.7.bb b/recipes-devtools/python/python-pyflame_1.6.7.bb
index ab0d32d..c2e0b05 100644
--- a/recipes-devtools/python/python-pyflame_1.6.7.bb
+++ b/recipes-devtools/python/python-pyflame_1.6.7.bb
@@ -29,4 +29,4 @@ COMPATIBLE_HOST:powerpc:class-target = "null"
 COMPATIBLE_HOST:riscv64:class-target = "null"
 COMPATIBLE_HOST:riscv32:class-target = "null"
 
-PNBLACKLIST[python-pyflame] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyflame] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pygobject_3.34.0.bb b/recipes-devtools/python/python-pygobject_3.34.0.bb
index ac0caf2..eb572a2 100644
--- a/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -39,4 +39,4 @@ do_install:append() {
     rm -r ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig
 }
 
-PNBLACKLIST[python-pygobject] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pygobject] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pygpgme_0.3.bb b/recipes-devtools/python/python-pygpgme_0.3.bb
index 82b5d39..a55d808 100644
--- a/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -25,4 +25,4 @@ do_install_ptest(){
     cp -r ${S}/tests ${D}${PTEST_PATH}
 }
 
-PNBLACKLIST[python-pygpgme] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pygpgme] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyhamcrest_1.9.0.bb b/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
index 4d47222..73a546c 100644
--- a/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
+++ b/recipes-devtools/python/python-pyhamcrest_1.9.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-pyhamcrest] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyhamcrest] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyiface_0.0.11.bb b/recipes-devtools/python/python-pyiface_0.0.11.bb
index e57ad13..57d856f 100644
--- a/recipes-devtools/python/python-pyiface_0.0.11.bb
+++ b/recipes-devtools/python/python-pyiface_0.0.11.bb
@@ -10,4 +10,4 @@ SRC_URI[sha256sum] = "e231e5735d329c5b2d4fc8854f069fdaa5436d3ef91ed64ee49e41e3f5
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-pyiface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyiface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyinotify_0.9.6.bb b/recipes-devtools/python/python-pyinotify_0.9.6.bb
index e0fcb4f..dc4026f 100644
--- a/recipes-devtools/python/python-pyinotify_0.9.6.bb
+++ b/recipes-devtools/python/python-pyinotify_0.9.6.bb
@@ -17,4 +17,4 @@ SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-pyinotify] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyinotify] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyjks_19.0.0.bb b/recipes-devtools/python/python-pyjks_19.0.0.bb
index 3f28015..635e306 100644
--- a/recipes-devtools/python/python-pyjks_19.0.0.bb
+++ b/recipes-devtools/python/python-pyjks_19.0.0.bb
@@ -22,4 +22,4 @@ RDEPENDS:${PN} = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyjks] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyjks] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyjwt_1.7.1.bb b/recipes-devtools/python/python-pyjwt_1.7.1.bb
index 8fc4df1..c0977eb 100644
--- a/recipes-devtools/python/python-pyjwt_1.7.1.bb
+++ b/recipes-devtools/python/python-pyjwt_1.7.1.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} = "${PYTHON_PN}-cryptography"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyjwt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyjwt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pylint_1.8.3.bb b/recipes-devtools/python/python-pylint_1.8.3.bb
index 641dec1..293cee3 100644
--- a/recipes-devtools/python/python-pylint_1.8.3.bb
+++ b/recipes-devtools/python/python-pylint_1.8.3.bb
@@ -38,4 +38,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-astroid \
                    ${PYTHON_PN}-netserver \
                   "
 
-PNBLACKLIST[python-pylint] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pylint] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pymisp_2.4.119.1.bb b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
index 70e8406..d59ea84 100644
--- a/recipes-devtools/python/python-pymisp_2.4.119.1.bb
+++ b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
@@ -26,4 +26,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-six \
 "
 
-PNBLACKLIST[python-pymisp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pymisp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pymongo_3.10.1.bb b/recipes-devtools/python/python-pymongo_3.10.1.bb
index f7755b0..998bdf5 100644
--- a/recipes-devtools/python/python-pymongo_3.10.1.bb
+++ b/recipes-devtools/python/python-pymongo_3.10.1.bb
@@ -30,4 +30,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pprint \
 "
 
-PNBLACKLIST[python-pymongo] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pymongo] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pymysql_0.9.3.bb b/recipes-devtools/python/python-pymysql_0.9.3.bb
index 51384ba..40ab673 100644
--- a/recipes-devtools/python/python-pymysql_0.9.3.bb
+++ b/recipes-devtools/python/python-pymysql_0.9.3.bb
@@ -18,4 +18,4 @@ PYPI_PACKAGE = "PyMySQL"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-cryptography"
 
-PNBLACKLIST[python-pymysql] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pymysql] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pynetlinux_1.1.bb b/recipes-devtools/python/python-pynetlinux_1.1.bb
index 291ada1..631f1f7 100644
--- a/recipes-devtools/python/python-pynetlinux_1.1.bb
+++ b/recipes-devtools/python/python-pynetlinux_1.1.bb
@@ -11,4 +11,4 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "3336e5d4a478acca4e35bf3125b4f883"
 SRC_URI[sha256sum] = "4ad08298c9f5ba15a11cddc639ba8778cabdfc402b51066d9e0a325e5a5b391c"
 
-PNBLACKLIST[python-pynetlinux] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pynetlinux] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyopenssl_19.1.0.bb b/recipes-devtools/python/python-pyopenssl_19.1.0.bb
index c334d31..aa076b3 100644
--- a/recipes-devtools/python/python-pyopenssl_19.1.0.bb
+++ b/recipes-devtools/python/python-pyopenssl_19.1.0.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN}-tests = "${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyopenssl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyopenssl] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyparsing_2.4.6.bb b/recipes-devtools/python/python-pyparsing_2.4.6.bb
index 2092a10..4bdd7ca 100644
--- a/recipes-devtools/python/python-pyparsing_2.4.6.bb
+++ b/recipes-devtools/python/python-pyparsing_2.4.6.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} += " \
 BBCLASSEXTEND = "native nativesdk"
 
 
-PNBLACKLIST[python-pyparsing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyparsing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyperclip_1.7.0.bb b/recipes-devtools/python/python-pyperclip_1.7.0.bb
index be569ad..7bff4f8 100644
--- a/recipes-devtools/python/python-pyperclip_1.7.0.bb
+++ b/recipes-devtools/python/python-pyperclip_1.7.0.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += " \
 BBCLASSEXTEND = "native nativesdk"
 
 
-PNBLACKLIST[python-pyperclip] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyperclip] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyperf_1.7.0.bb b/recipes-devtools/python/python-pyperf_1.7.0.bb
index c93c106..908ac29 100644
--- a/recipes-devtools/python/python-pyperf_1.7.0.bb
+++ b/recipes-devtools/python/python-pyperf_1.7.0.bb
@@ -33,4 +33,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-statistics \
 "
 
-PNBLACKLIST[python-pyperf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyperf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrex-native_0.9.9.bb b/recipes-devtools/python/python-pyrex-native_0.9.9.bb
index 3c64c2f..32741f6 100644
--- a/recipes-devtools/python/python-pyrex-native_0.9.9.bb
+++ b/recipes-devtools/python/python-pyrex-native_0.9.9.bb
@@ -4,4 +4,4 @@ DEPENDS = "python-native"
 RDEPENDS:${PN} = ""
 PR = "r3"
 
-PNBLACKLIST[python-pyrex-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyrex-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrex_0.9.9.bb b/recipes-devtools/python/python-pyrex_0.9.9.bb
index 1169e8f..7950f27 100644
--- a/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -21,4 +21,4 @@ inherit distutils
 
 FILES:${PN} += "${datadir}/${baselib}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
 
-PNBLACKLIST[python-pyrex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyrex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyroute2_0.5.7.bb b/recipes-devtools/python/python-pyroute2_0.5.7.bb
index 1b5719d..1855b04 100644
--- a/recipes-devtools/python/python-pyroute2_0.5.7.bb
+++ b/recipes-devtools/python/python-pyroute2_0.5.7.bb
@@ -25,4 +25,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-unixadmin \
 "
 
-PNBLACKLIST[python-pyroute2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyroute2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrsistent_0.15.7.bb b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
index 40dd572..c92497c 100644
--- a/recipes-devtools/python/python-pyrsistent_0.15.7.bb
+++ b/recipes-devtools/python/python-pyrsistent_0.15.7.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN}:append:class-target = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyrsistent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyrsistent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyrtm_0.4.2.bb b/recipes-devtools/python/python-pyrtm_0.4.2.bb
index 22f852a..8cbe8a6 100644
--- a/recipes-devtools/python/python-pyrtm_0.4.2.bb
+++ b/recipes-devtools/python/python-pyrtm_0.4.2.bb
@@ -38,4 +38,4 @@ RDEPENDS:${PN}-tests += " \
 # meta-python recipe did not follow Debian naming
 PROVIDES += "pyrtm"
 
-PNBLACKLIST[python-pyrtm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyrtm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyserial_3.4.bb b/recipes-devtools/python/python-pyserial_3.4.bb
index b2765b7..0f5ee73 100644
--- a/recipes-devtools/python/python-pyserial_3.4.bb
+++ b/recipes-devtools/python/python-pyserial_3.4.bb
@@ -44,4 +44,4 @@ RDEPENDS:${PN} = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyserial] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyserial] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysmi_0.3.4.bb b/recipes-devtools/python/python-pysmi_0.3.4.bb
index c642181..b1b1a45 100644
--- a/recipes-devtools/python/python-pysmi_0.3.4.bb
+++ b/recipes-devtools/python/python-pysmi_0.3.4.bb
@@ -15,4 +15,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN} = "python-ply"
 
-PNBLACKLIST[python-pysmi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pysmi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysnmp_4.4.9.bb b/recipes-devtools/python/python-pysnmp_4.4.9.bb
index eecdf51..f1e020b 100644
--- a/recipes-devtools/python/python-pysnmp_4.4.9.bb
+++ b/recipes-devtools/python/python-pysnmp_4.4.9.bb
@@ -25,4 +25,4 @@ RDEPENDS:${PN} += "python-pycryptodomex \
                    python-pysmi \
 "
 
-PNBLACKLIST[python-pysnmp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pysnmp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysocks_1.7.1.bb b/recipes-devtools/python/python-pysocks_1.7.1.bb
index c4050b3..c1aa41d 100644
--- a/recipes-devtools/python/python-pysocks_1.7.1.bb
+++ b/recipes-devtools/python/python-pysocks_1.7.1.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN}:class-target += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pysocks] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pysocks] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pysqlite_2.8.3.bb b/recipes-devtools/python/python-pysqlite_2.8.3.bb
index 59216cc..db64f47 100644
--- a/recipes-devtools/python/python-pysqlite_2.8.3.bb
+++ b/recipes-devtools/python/python-pysqlite_2.8.3.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN}:class-target += "\
 
 FILES:${PN}-doc += "${datadir}"
 
-PNBLACKLIST[python-pysqlite] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pysqlite] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pystache_0.5.4.bb b/recipes-devtools/python/python-pystache_0.5.4.bb
index 58cbaf1..f7f0e9c 100644
--- a/recipes-devtools/python/python-pystache_0.5.4.bb
+++ b/recipes-devtools/python/python-pystache_0.5.4.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pystache] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pystache] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb b/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
index 09c1849..5937fe7 100644
--- a/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
+++ b/recipes-devtools/python/python-pytest-helpers-namespace_2019.1.8.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += " \
     python-pytest \
     "
 
-PNBLACKLIST[python-pytest-helpers-namespace] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pytest-helpers-namespace] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest-runner_5.2.bb b/recipes-devtools/python/python-pytest-runner_5.2.bb
index 0851cf6..115036f 100644
--- a/recipes-devtools/python/python-pytest-runner_5.2.bb
+++ b/recipes-devtools/python/python-pytest-runner_5.2.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += "python-argparse python-compiler"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pytest-runner] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pytest-runner] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb b/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
index c07f9da..168db19 100644
--- a/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
+++ b/recipes-devtools/python/python-pytest-tempdir_2019.10.12.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += " \
     python-pytest \
     "
 
-PNBLACKLIST[python-pytest-tempdir] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pytest-tempdir] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytest_4.6.9.bb b/recipes-devtools/python/python-pytest_4.6.9.bb
index c32da21..ae9cfa2 100644
--- a/recipes-devtools/python/python-pytest_4.6.9.bb
+++ b/recipes-devtools/python/python-pytest_4.6.9.bb
@@ -49,4 +49,4 @@ ALTERNATIVE_PRIORITY = "10"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pytest] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pytest] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytoml_0.1.21.bb b/recipes-devtools/python/python-pytoml_0.1.21.bb
index 10da348..437fa7c 100644
--- a/recipes-devtools/python/python-pytoml_0.1.21.bb
+++ b/recipes-devtools/python/python-pytoml_0.1.21.bb
@@ -14,4 +14,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pytoml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pytoml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pytz_2019.3.bb b/recipes-devtools/python/python-pytz_2019.3.bb
index 6e51c3a..d7bfc37 100755
--- a/recipes-devtools/python/python-pytz_2019.3.bb
+++ b/recipes-devtools/python/python-pytz_2019.3.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN}:class-target += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pytz] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pytz] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyudev_0.21.0.bb b/recipes-devtools/python/python-pyudev_0.21.0.bb
index e6ed7e4..1489a1c 100644
--- a/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} = "\
 "
 
 
-PNBLACKLIST[python-pyudev] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyudev] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyusb_1.0.2.bb b/recipes-devtools/python/python-pyusb_1.0.2.bb
index 374251c..b8f322e 100644
--- a/recipes-devtools/python/python-pyusb_1.0.2.bb
+++ b/recipes-devtools/python/python-pyusb_1.0.2.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools
 BBCLASSEXTEND = "native nativesdk"
 
 
-PNBLACKLIST[python-pyusb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyusb] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyyaml_5.4.1.bb b/recipes-devtools/python/python-pyyaml_5.4.1.bb
index 2ea1eac..4b7129d 100644
--- a/recipes-devtools/python/python-pyyaml_5.4.1.bb
+++ b/recipes-devtools/python/python-pyyaml_5.4.1.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-pyyaml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyyaml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-pyzmq_17.1.0.bb b/recipes-devtools/python/python-pyzmq_17.1.0.bb
index c6654d3..888f302 100644
--- a/recipes-devtools/python/python-pyzmq_17.1.0.bb
+++ b/recipes-devtools/python/python-pyzmq_17.1.0.bb
@@ -26,4 +26,4 @@ do_compile:prepend() {
     echo no_libzmq_extension = True >> ${S}/setup.cfg
 }
 
-PNBLACKLIST[python-pyzmq] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyzmq] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rdflib_4.2.2.bb b/recipes-devtools/python/python-rdflib_4.2.2.bb
index 8036330..46c887d 100644
--- a/recipes-devtools/python/python-rdflib_4.2.2.bb
+++ b/recipes-devtools/python/python-rdflib_4.2.2.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-rdflib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-rdflib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-redis_2.10.6.bb b/recipes-devtools/python/python-redis_2.10.6.bb
index 534fdf9..c4da48e 100644
--- a/recipes-devtools/python/python-redis_2.10.6.bb
+++ b/recipes-devtools/python/python-redis_2.10.6.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
 "
 
-PNBLACKLIST[python-redis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-redis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb b/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
index 976a197..5910052 100644
--- a/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
+++ b/recipes-devtools/python/python-requests-oauthlib_1.3.0.bb
@@ -11,4 +11,4 @@ inherit pypi setuptools
 RDEPENDS:${PN} += "${PYTHON_PN}-requests"
 
 
-PNBLACKLIST[python-requests-oauthlib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-requests-oauthlib] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-requests_2.23.0.bb b/recipes-devtools/python/python-requests_2.23.0.bb
index 88119f3..842e926 100644
--- a/recipes-devtools/python/python-requests_2.23.0.bb
+++ b/recipes-devtools/python/python-requests_2.23.0.bb
@@ -33,4 +33,4 @@ CVE_PRODUCT = "requests"
 BBCLASSEXTEND = "native nativesdk"
 
 
-PNBLACKLIST[python-requests] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-requests] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb b/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
index 469b174..e0321b2 100644
--- a/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
+++ b/recipes-devtools/python/python-rfc3339-validator_0.1.1.bb
@@ -24,4 +24,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-rfc3339-validator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-rfc3339-validator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb b/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
index 30db433..d474e78 100644
--- a/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
+++ b/recipes-devtools/python/python-rfc3986-validator_0.1.1.bb
@@ -22,4 +22,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-rfc3986-validator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-rfc3986-validator] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-rfc3987_1.3.8.bb b/recipes-devtools/python/python-rfc3987_1.3.8.bb
index 9325079..021c32a 100644
--- a/recipes-devtools/python/python-rfc3987_1.3.8.bb
+++ b/recipes-devtools/python/python-rfc3987_1.3.8.bb
@@ -9,4 +9,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-rfc3987] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-rfc3987] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb b/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
index 575e292..7e766ab 100644
--- a/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
+++ b/recipes-devtools/python/python-robotframework-seriallibrary_0.3.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-robotframework-seriallibrary] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-robotframework-seriallibrary] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-robotframework_3.0.4.bb b/recipes-devtools/python/python-robotframework_3.0.4.bb
index 97364af..9ee9a41 100644
--- a/recipes-devtools/python/python-robotframework_3.0.4.bb
+++ b/recipes-devtools/python/python-robotframework_3.0.4.bb
@@ -27,4 +27,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-zlib \
 "
 
-PNBLACKLIST[python-robotframework] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-robotframework] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-scandir_1.10.0.bb b/recipes-devtools/python/python-scandir_1.10.0.bb
index ecff247..fe5eb55 100644
--- a/recipes-devtools/python/python-scandir_1.10.0.bb
+++ b/recipes-devtools/python/python-scandir_1.10.0.bb
@@ -12,4 +12,4 @@ S = "${WORKDIR}/git"
 inherit setuptools
 
 BBCLASSEXTEND = "native nativesdk"
-PNBLACKLIST[python-scandir] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-scandir] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-scrypt_0.8.6.bb b/recipes-devtools/python/python-scrypt_0.8.6.bb
index 46cdad4..8ae09fc 100644
--- a/recipes-devtools/python/python-scrypt_0.8.6.bb
+++ b/recipes-devtools/python/python-scrypt_0.8.6.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN}:class-target += "\
 "
 
 
-PNBLACKLIST[python-scrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-scrypt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sdnotify_0.3.2.bb b/recipes-devtools/python/python-sdnotify_0.3.2.bb
index ac542e8..314f70c 100644
--- a/recipes-devtools/python/python-sdnotify_0.3.2.bb
+++ b/recipes-devtools/python/python-sdnotify_0.3.2.bb
@@ -16,4 +16,4 @@ SRC_URI[sha256sum] = "73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c5
 
 inherit setuptools pypi
 
-PNBLACKLIST[python-sdnotify] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-sdnotify] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-selectors34_1.2.bb b/recipes-devtools/python/python-selectors34_1.2.bb
index e8bf2ec..771e74a 100644
--- a/recipes-devtools/python/python-selectors34_1.2.bb
+++ b/recipes-devtools/python/python-selectors34_1.2.bb
@@ -11,4 +11,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-six \
     "    
 
-PNBLACKLIST[python-selectors34] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-selectors34] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-semver_2.8.1.bb b/recipes-devtools/python/python-semver_2.8.1.bb
index 90ccbed..d56b016 100644
--- a/recipes-devtools/python/python-semver_2.8.1.bb
+++ b/recipes-devtools/python/python-semver_2.8.1.bb
@@ -11,4 +11,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-semver] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-semver] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-serpent_1.28.bb b/recipes-devtools/python/python-serpent_1.28.bb
index 942cef1..3ccc7dd 100644
--- a/recipes-devtools/python/python-serpent_1.28.bb
+++ b/recipes-devtools/python/python-serpent_1.28.bb
@@ -12,4 +12,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-numbers \
     "    
 
-PNBLACKLIST[python-serpent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-serpent] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-setuptools-scm_3.3.3.bb b/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
index c6f2516..418bcc3 100644
--- a/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
+++ b/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-argparse"
 BBCLASSEXTEND = "native"
 
 
-PNBLACKLIST[python-setuptools-scm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-setuptools-scm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-setuptools_42.0.2.bb b/recipes-devtools/python/python-setuptools_42.0.2.bb
index c1df12b..fc355a8 100644
--- a/recipes-devtools/python/python-setuptools_42.0.2.bb
+++ b/recipes-devtools/python/python-setuptools_42.0.2.bb
@@ -8,4 +8,4 @@ RREPLACES:${PN} = "python-distribute"
 RPROVIDES:${PN} = "python-distribute"
 RCONFLICTS:${PN} = "python-distribute"
 
-PNBLACKLIST[python-setuptools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-setuptools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sh_1.12.14.bb b/recipes-devtools/python/python-sh_1.12.14.bb
index 8dd214a..89c2ab5 100644
--- a/recipes-devtools/python/python-sh_1.12.14.bb
+++ b/recipes-devtools/python/python-sh_1.12.14.bb
@@ -36,4 +36,4 @@ RDEPENDS:${PN} += " \
 #             No complants in compiling.
 
 
-PNBLACKLIST[python-sh] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-sh] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sijax_0.3.2.bb b/recipes-devtools/python/python-sijax_0.3.2.bb
index 9c13a51..6eedf98 100644
--- a/recipes-devtools/python/python-sijax_0.3.2.bb
+++ b/recipes-devtools/python/python-sijax_0.3.2.bb
@@ -11,4 +11,4 @@ inherit pypi setuptools
 SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
 
 
-PNBLACKLIST[python-sijax] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-sijax] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-simplejson_3.17.0.bb b/recipes-devtools/python/python-simplejson_3.17.0.bb
index 91e5800..24286a0 100644
--- a/recipes-devtools/python/python-simplejson_3.17.0.bb
+++ b/recipes-devtools/python/python-simplejson_3.17.0.bb
@@ -25,4 +25,4 @@ FILES:${PN}-tests+= " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-simplejson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-simplejson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
index 43b7a1d..9af0d50 100644
--- a/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
+++ b/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-singledispatch] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-singledispatch] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-six_1.14.0.bb b/recipes-devtools/python/python-six_1.14.0.bb
index c8a62a4..089837b 100644
--- a/recipes-devtools/python/python-six_1.14.0.bb
+++ b/recipes-devtools/python/python-six_1.14.0.bb
@@ -5,4 +5,4 @@ SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
 SRC_URI[sha256sum] = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
 
 
-PNBLACKLIST[python-six] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-six] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-slip-dbus_0.6.5.bb b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
index f91c370..c9bf7da 100644
--- a/recipes-devtools/python/python-slip-dbus_0.6.5.bb
+++ b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
@@ -37,4 +37,4 @@ RDEPENDS:${PN} += "\
 
 inherit setuptools
 
-PNBLACKLIST[python-slip-dbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-slip-dbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-smbus_4.1.bb b/recipes-devtools/python/python-smbus_4.1.bb
index 0dc44f8..ddef63e 100644
--- a/recipes-devtools/python/python-smbus_4.1.bb
+++ b/recipes-devtools/python/python-smbus_4.1.bb
@@ -13,4 +13,4 @@ S = "${WORKDIR}/i2c-tools-${PV}/py-smbus"
 
 inherit distutils
 
-PNBLACKLIST[python-smbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-smbus] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-snakefood_1.4.bb b/recipes-devtools/python/python-snakefood_1.4.bb
index 766ce43..c73aea7 100644
--- a/recipes-devtools/python/python-snakefood_1.4.bb
+++ b/recipes-devtools/python/python-snakefood_1.4.bb
@@ -50,4 +50,4 @@ RDEPENDS:${PN}:class-native = ""
 BBCLASSEXTEND = "native"
 
 
-PNBLACKLIST[python-snakefood] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-snakefood] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-snimpy_0.8.13.bb b/recipes-devtools/python/python-snimpy_0.8.13.bb
index 8ed665d..ef09497 100644
--- a/recipes-devtools/python/python-snimpy_0.8.13.bb
+++ b/recipes-devtools/python/python-snimpy_0.8.13.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} = "python-cffi \
                   python-setuptools \
 "
 
-PNBLACKLIST[python-snimpy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-snimpy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-socketio_4.3.1.bb b/recipes-devtools/python/python-socketio_4.3.1.bb
index e7ab2c8..8dd8e67 100644
--- a/recipes-devtools/python/python-socketio_4.3.1.bb
+++ b/recipes-devtools/python/python-socketio_4.3.1.bb
@@ -27,4 +27,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-attrs \
     "
 
-PNBLACKLIST[python-socketio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-socketio] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-soupsieve_1.9.4.bb b/recipes-devtools/python/python-soupsieve_1.9.4.bb
index 2767c1a..85cd260 100644
--- a/recipes-devtools/python/python-soupsieve_1.9.4.bb
+++ b/recipes-devtools/python/python-soupsieve_1.9.4.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-soupsieve] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-soupsieve] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sparts_0.7.3.bb b/recipes-devtools/python/python-sparts_0.7.3.bb
index e306d17..1407673 100644
--- a/recipes-devtools/python/python-sparts_0.7.3.bb
+++ b/recipes-devtools/python/python-sparts_0.7.3.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} = "\
                python-futures \
 "
 
-PNBLACKLIST[python-sparts] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-sparts] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-speaklater_1.3.bb b/recipes-devtools/python/python-speaklater_1.3.bb
index c4a625d..073bdee 100644
--- a/recipes-devtools/python/python-speaklater_1.3.bb
+++ b/recipes-devtools/python/python-speaklater_1.3.bb
@@ -9,4 +9,4 @@ PYPI_PACKAGE = "speaklater"
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-speaklater] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-speaklater] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sqlalchemy_1.3.12.bb b/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
index ce6125f..04b50c8 100644
--- a/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
+++ b/recipes-devtools/python/python-sqlalchemy_1.3.12.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} += " \
 "
 
 
-PNBLACKLIST[python-sqlalchemy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-sqlalchemy] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-sqlparse_0.3.0.bb b/recipes-devtools/python/python-sqlparse_0.3.0.bb
index fbf20eb..1d99ff4 100644
--- a/recipes-devtools/python/python-sqlparse_0.3.0.bb
+++ b/recipes-devtools/python/python-sqlparse_0.3.0.bb
@@ -16,4 +16,4 @@ export HOST_SYS
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-sqlparse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-sqlparse] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-statistics_1.0.3.5.bb b/recipes-devtools/python/python-statistics_1.0.3.5.bb
index 5e44d2b..b20a209 100644
--- a/recipes-devtools/python/python-statistics_1.0.3.5.bb
+++ b/recipes-devtools/python/python-statistics_1.0.3.5.bb
@@ -14,4 +14,4 @@ inherit pypi setuptools
 
 PYPI_PACKAGE = "statistics"
 
-PNBLACKLIST[python-statistics] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-statistics] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-stevedore_1.31.0.bb b/recipes-devtools/python/python-stevedore_1.31.0.bb
index fc96485..1eaed66 100644
--- a/recipes-devtools/python/python-stevedore_1.31.0.bb
+++ b/recipes-devtools/python/python-stevedore_1.31.0.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-stevedore] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-stevedore] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-strict-rfc3339_0.7.bb b/recipes-devtools/python/python-strict-rfc3339_0.7.bb
index a10d2e2..897f2b0 100644
--- a/recipes-devtools/python/python-strict-rfc3339_0.7.bb
+++ b/recipes-devtools/python/python-strict-rfc3339_0.7.bb
@@ -9,4 +9,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-strict-rfc3339] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-strict-rfc3339] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-subprocess32_3.2.7.bb b/recipes-devtools/python/python-subprocess32_3.2.7.bb
index cf29acc..395d7f7 100644
--- a/recipes-devtools/python/python-subprocess32_3.2.7.bb
+++ b/recipes-devtools/python/python-subprocess32_3.2.7.bb
@@ -14,4 +14,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-subprocess32] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-subprocess32] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-systemd_234.bb b/recipes-devtools/python/python-systemd_234.bb
index fd657ed..d19e9b0 100644
--- a/recipes-devtools/python/python-systemd_234.bb
+++ b/recipes-devtools/python/python-systemd_234.bb
@@ -20,4 +20,4 @@ SRC_URI += "file://endian.patch"
 
 SRC_URI:append:libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
 
-PNBLACKLIST[python-systemd] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-systemd] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-toml_0.10.0.bb b/recipes-devtools/python/python-toml_0.10.0.bb
index 5189776..2ccf7b4 100644
--- a/recipes-devtools/python/python-toml_0.10.0.bb
+++ b/recipes-devtools/python/python-toml_0.10.0.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-datetime \
 "
 
-PNBLACKLIST[python-toml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-toml] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tornado-redis_2.4.18.bb b/recipes-devtools/python/python-tornado-redis_2.4.18.bb
index 998a28c..86951ce 100644
--- a/recipes-devtools/python/python-tornado-redis_2.4.18.bb
+++ b/recipes-devtools/python/python-tornado-redis_2.4.18.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += "python-tornado"
 
 RDEPENDS:${PN}-test += "${PN} python-tornado"
 
-PNBLACKLIST[python-tornado-redis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-tornado-redis] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tornado_6.0.3.bb b/recipes-devtools/python/python-tornado_6.0.3.bb
index 3bf29c2..895a681 100644
--- a/recipes-devtools/python/python-tornado_6.0.3.bb
+++ b/recipes-devtools/python/python-tornado_6.0.3.bb
@@ -34,4 +34,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-subprocess \
 "
 
-PNBLACKLIST[python-tornado] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-tornado] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tqdm_4.41.1.bb b/recipes-devtools/python/python-tqdm_4.41.1.bb
index b181ed2..8f08630 100644
--- a/recipes-devtools/python/python-tqdm_4.41.1.bb
+++ b/recipes-devtools/python/python-tqdm_4.41.1.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN}:append:class-target = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-tqdm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-tqdm] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-traceback2_1.4.0.bb b/recipes-devtools/python/python-traceback2_1.4.0.bb
index b7145f9..21606fb 100644
--- a/recipes-devtools/python/python-traceback2_1.4.0.bb
+++ b/recipes-devtools/python/python-traceback2_1.4.0.bb
@@ -14,4 +14,4 @@ CLEANBROKEN = "1"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-linecache2"
 
-PNBLACKLIST[python-traceback2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-traceback2] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-twisted_19.10.0.bb b/recipes-devtools/python/python-twisted_19.10.0.bb
index e5f511d..c8f5b3e 100644
--- a/recipes-devtools/python/python-twisted_19.10.0.bb
+++ b/recipes-devtools/python/python-twisted_19.10.0.bb
@@ -289,4 +289,4 @@ RDEPENDS:${PN} += " \
     ${PN}-news \
 "
 
-PNBLACKLIST[python-twisted] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-twisted] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-twitter_3.8.0.bb b/recipes-devtools/python/python-twitter_3.8.0.bb
index a90bd95..ef3f6f3 100644
--- a/recipes-devtools/python/python-twitter_3.8.0.bb
+++ b/recipes-devtools/python/python-twitter_3.8.0.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += "\
         "
 
 
-PNBLACKLIST[python-twitter] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-twitter] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-twofish_0.3.0.bb b/recipes-devtools/python/python-twofish_0.3.0.bb
index b44c458..61c7155 100644
--- a/recipes-devtools/python/python-twofish_0.3.0.bb
+++ b/recipes-devtools/python/python-twofish_0.3.0.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-twofish] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-twofish] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-typing_3.7.4.1.bb b/recipes-devtools/python/python-typing_3.7.4.1.bb
index ebb23ff..30ce0db 100644
--- a/recipes-devtools/python/python-typing_3.7.4.1.bb
+++ b/recipes-devtools/python/python-typing_3.7.4.1.bb
@@ -10,4 +10,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-typing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-typing] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-tzlocal_2.0.0.bb b/recipes-devtools/python/python-tzlocal_2.0.0.bb
index bfcb754..a128a06 100644
--- a/recipes-devtools/python/python-tzlocal_2.0.0.bb
+++ b/recipes-devtools/python/python-tzlocal_2.0.0.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e30
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-tzlocal] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-tzlocal] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-ujson_1.35.bb b/recipes-devtools/python/python-ujson_1.35.bb
index cc81ba5..bb8e698 100644
--- a/recipes-devtools/python/python-ujson_1.35.bb
+++ b/recipes-devtools/python/python-ujson_1.35.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-ujson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-ujson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-unidiff_0.5.5.bb b/recipes-devtools/python/python-unidiff_0.5.5.bb
index 98030cb..60d99c7 100644
--- a/recipes-devtools/python/python-unidiff_0.5.5.bb
+++ b/recipes-devtools/python/python-unidiff_0.5.5.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-io \
 "
 
-PNBLACKLIST[python-unidiff] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-unidiff] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-urllib3_1.25.7.bb b/recipes-devtools/python/python-urllib3_1.25.7.bb
index f6375ef..c0b95ce 100644
--- a/recipes-devtools/python/python-urllib3_1.25.7.bb
+++ b/recipes-devtools/python/python-urllib3_1.25.7.bb
@@ -22,4 +22,4 @@ CVE_PRODUCT = "urllib3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-urllib3] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-urllib3] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-vcversioner_2.16.0.0.bb b/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
index c5a2f5e..ce264c4 100644
--- a/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
+++ b/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-vcversioner] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-vcversioner] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-versiontools_1.9.1.bb b/recipes-devtools/python/python-versiontools_1.9.1.bb
index aab7073..995622c 100644
--- a/recipes-devtools/python/python-versiontools_1.9.1.bb
+++ b/recipes-devtools/python/python-versiontools_1.9.1.bb
@@ -10,4 +10,4 @@ SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
 SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"
 
 
-PNBLACKLIST[python-versiontools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-versiontools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-vine_1.1.4.bb b/recipes-devtools/python/python-vine_1.1.4.bb
index 66ae96b..6aed594 100644
--- a/recipes-devtools/python/python-vine_1.1.4.bb
+++ b/recipes-devtools/python/python-vine_1.1.4.bb
@@ -12,4 +12,4 @@ inherit setuptools pypi
 RDEPENDS:${PN} += " \
         "
 
-PNBLACKLIST[python-vine] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-vine] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-visitor_0.1.3.bb b/recipes-devtools/python/python-visitor_0.1.3.bb
index c14bba2..20605d5 100644
--- a/recipes-devtools/python/python-visitor_0.1.3.bb
+++ b/recipes-devtools/python/python-visitor_0.1.3.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d2
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-visitor] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-visitor] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-vobject_0.9.6.1.bb b/recipes-devtools/python/python-vobject_0.9.6.1.bb
index d7718dc..605c3a4 100644
--- a/recipes-devtools/python/python-vobject_0.9.6.1.bb
+++ b/recipes-devtools/python/python-vobject_0.9.6.1.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-numbers \
     "
 
-PNBLACKLIST[python-vobject] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-vobject] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-waitress_1.4.2.bb b/recipes-devtools/python/python-waitress_1.4.2.bb
index 9ab73f1..557ece3 100644
--- a/recipes-devtools/python/python-waitress_1.4.2.bb
+++ b/recipes-devtools/python/python-waitress_1.4.2.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-re \
     "
 
-PNBLACKLIST[python-waitress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-waitress] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-wcwidth_0.1.8.bb b/recipes-devtools/python/python-wcwidth_0.1.8.bb
index 99f05a7..959f62f 100644
--- a/recipes-devtools/python/python-wcwidth_0.1.8.bb
+++ b/recipes-devtools/python/python-wcwidth_0.1.8.bb
@@ -9,4 +9,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-wcwidth] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-wcwidth] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-webcolors_1.8.1.bb b/recipes-devtools/python/python-webcolors_1.8.1.bb
index 113b8ef..fa94014 100644
--- a/recipes-devtools/python/python-webcolors_1.8.1.bb
+++ b/recipes-devtools/python/python-webcolors_1.8.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN}:class-target = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-webcolors] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-webcolors] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-webdav_0.1.2.bb b/recipes-devtools/python/python-webdav_0.1.2.bb
index a844509..6f4718a 100644
--- a/recipes-devtools/python/python-webdav_0.1.2.bb
+++ b/recipes-devtools/python/python-webdav_0.1.2.bb
@@ -18,4 +18,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit distutils
 
 
-PNBLACKLIST[python-webdav] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-webdav] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-webencodings_0.5.1.bb b/recipes-devtools/python/python-webencodings_0.5.1.bb
index 3f74c9b..437141c 100644
--- a/recipes-devtools/python/python-webencodings_0.5.1.bb
+++ b/recipes-devtools/python/python-webencodings_0.5.1.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += " \
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-webencodings] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-webencodings] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-websocket-client_0.57.0.bb b/recipes-devtools/python/python-websocket-client_0.57.0.bb
index bc471a4..f465e32 100644
--- a/recipes-devtools/python/python-websocket-client_0.57.0.bb
+++ b/recipes-devtools/python/python-websocket-client_0.57.0.bb
@@ -10,4 +10,4 @@ PYPI_PACKAGE = "websocket_client"
 SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
 SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
 
-PNBLACKLIST[python-websocket-client] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-websocket-client] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-werkzeug_0.16.0.bb b/recipes-devtools/python/python-werkzeug_0.16.0.bb
index 625723a..0e01aac 100644
--- a/recipes-devtools/python/python-werkzeug_0.16.0.bb
+++ b/recipes-devtools/python/python-werkzeug_0.16.0.bb
@@ -50,4 +50,4 @@ RDEPENDS:${PN}-tests = " \
 inherit pypi setuptools
 
 
-PNBLACKLIST[python-werkzeug] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-werkzeug] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-which_1.1.0.bb b/recipes-devtools/python/python-which_1.1.0.bb
index 3077011..f717bf1 100644
--- a/recipes-devtools/python/python-which_1.1.0.bb
+++ b/recipes-devtools/python/python-which_1.1.0.bb
@@ -18,4 +18,4 @@ do_install:append() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-which] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-which] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-whoosh_2.7.4.bb b/recipes-devtools/python/python-whoosh_2.7.4.bb
index 151fa9e..cc7b89e 100644
--- a/recipes-devtools/python/python-whoosh_2.7.4.bb
+++ b/recipes-devtools/python/python-whoosh_2.7.4.bb
@@ -26,4 +26,4 @@ RDEPENDS:${PN} += " \
 inherit pypi setuptools
 
 
-PNBLACKLIST[python-whoosh] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-whoosh] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-wrapt_1.11.2.bb b/recipes-devtools/python/python-wrapt_1.11.2.bb
index 96e30da..c8f9c97 100644
--- a/recipes-devtools/python/python-wrapt_1.11.2.bb
+++ b/recipes-devtools/python/python-wrapt_1.11.2.bb
@@ -33,4 +33,4 @@ RDEPENDS:${PN}:append:class-target = "\
     ${PYTHON_PN}-threading \
 "
 
-PNBLACKLIST[python-wrapt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-wrapt] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-wtforms_2.2.1.bb b/recipes-devtools/python/python-wtforms_2.2.1.bb
index 2af5eb6..08973bc 100644
--- a/recipes-devtools/python/python-wtforms_2.2.1.bb
+++ b/recipes-devtools/python/python-wtforms_2.2.1.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-wtforms] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-wtforms] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-xlrd_1.2.0.bb b/recipes-devtools/python/python-xlrd_1.2.0.bb
index b3ea14d..bdfa9cf 100644
--- a/recipes-devtools/python/python-xlrd_1.2.0.bb
+++ b/recipes-devtools/python/python-xlrd_1.2.0.bb
@@ -15,4 +15,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-xlrd] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-xlrd] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb b/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
index ca1ef9d..cc073b8 100644
--- a/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
+++ b/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
@@ -18,4 +18,4 @@ DEPENDS += " \
 
 inherit pypi setuptools
 
-PNBLACKLIST[python-xstatic-font-awesome] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-xstatic-font-awesome] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-xstatic_1.0.2.bb b/recipes-devtools/python/python-xstatic_1.0.2.bb
index f988e12..3d2f837 100644
--- a/recipes-devtools/python/python-xstatic_1.0.2.bb
+++ b/recipes-devtools/python/python-xstatic_1.0.2.bb
@@ -15,4 +15,4 @@ DEPENDS += " \
         "
 inherit pypi setuptools
 
-PNBLACKLIST[python-xstatic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-xstatic] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-yappi_1.0.bb b/recipes-devtools/python/python-yappi_1.0.bb
index 11c1c20..cab764b 100644
--- a/recipes-devtools/python/python-yappi_1.0.bb
+++ b/recipes-devtools/python/python-yappi_1.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-threading \
     "
 
-PNBLACKLIST[python-yappi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-yappi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-zipp_0.6.0.bb b/recipes-devtools/python/python-zipp_0.6.0.bb
index 8009ee4..5ad6ee4 100644
--- a/recipes-devtools/python/python-zipp_0.6.0.bb
+++ b/recipes-devtools/python/python-zipp_0.6.0.bb
@@ -13,4 +13,4 @@ inherit pypi setuptools
 
 BBCLASSEXTEND = "native nativesdk"
 
-PNBLACKLIST[python-zipp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-zipp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python-zopeinterface_4.7.1.bb b/recipes-devtools/python/python-zopeinterface_4.7.1.bb
index 4eefbd6..82e3824 100644
--- a/recipes-devtools/python/python-zopeinterface_4.7.1.bb
+++ b/recipes-devtools/python/python-zopeinterface_4.7.1.bb
@@ -24,4 +24,4 @@ inherit pypi setuptools
 
 RDEPENDS:${PN}-test += "python-unittest python-doctest"
 
-PNBLACKLIST[python-zopeinterface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-zopeinterface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/python.inc
index 7325f8c..62ec754 100644
--- a/recipes-devtools/python/python.inc
+++ b/recipes-devtools/python/python.inc
@@ -22,16 +22,16 @@ CVE_PRODUCT = "python"
 
 # Upstream agreement is that these are not security issues:
 # https://bugs.python.org/issue32367
-CVE_CHECK_WHITELIST += "CVE-2017-17522"
+CVE_CHECK_IGNORE += "CVE-2017-17522"
 # https://bugs.python.org/issue32056
-CVE_CHECK_WHITELIST += "CVE-2017-18207"
+CVE_CHECK_IGNORE += "CVE-2017-18207"
 
 # Windows-only, "It was determined that this is a longtime behavior
 # of Python that cannot really be altered at this point."
-CVE_CHECK_WHITELIST += "CVE-2015-5652"
+CVE_CHECK_IGNORE += "CVE-2015-5652"
 
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
-CVE_CHECK_WHITELIST += "CVE-2019-18348"
+CVE_CHECK_IGNORE += "CVE-2019-18348"
 
 PYTHON_MAJMIN = "2.7"
 
diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
index 898e7b9..a4f86b3 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -265,4 +265,4 @@ py_sysroot_cleanup () {
        rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
 
-PNBLACKLIST[python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/python-cson/python-cson_git.bb b/recipes-extended/python-cson/python-cson_git.bb
index 2a07afe..fdc6efd 100644
--- a/recipes-extended/python-cson/python-cson_git.bb
+++ b/recipes-extended/python-cson/python-cson_git.bb
@@ -20,4 +20,4 @@ inherit setuptools
 BBCLASSEXTEND = "native"
 
 
-PNBLACKLIST[python-cson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-cson] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
index 7e0945c..eef0b3e 100644
--- a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
+++ b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
@@ -18,4 +18,4 @@ RDEPENDS:${PN} += "\
 
 
 
-PNBLACKLIST[python-pyephem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyephem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/python-pyparted/python-pyparted_git.bb b/recipes-extended/python-pyparted/python-pyparted_git.bb
index 5a491d9..841b8be 100644
--- a/recipes-extended/python-pyparted/python-pyparted_git.bb
+++ b/recipes-extended/python-pyparted/python-pyparted_git.bb
@@ -34,4 +34,4 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-pyparted] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pyparted] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
index 40a0545..040d46b 100644
--- a/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
@@ -67,5 +67,5 @@ ALTERNATIVE_PRIORITY = "30"
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-pywbem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-PNBLACKLIST[python-pywbem-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pywbem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[python-pywbem-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
index bf10576..38eb132 100644
--- a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
+++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -40,4 +40,4 @@ RDEPENDS:${PN} = "\
     python-pyparsing \
 "
 
-PNBLACKLIST[dnssec-conf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[dnssec-conf] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-- 
2.35.1


