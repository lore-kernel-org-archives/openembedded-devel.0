Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.16042.1599073956286065435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 12:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t8vxxd6m;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id ds1so271595pjb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 12:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=znnrL6PQ+KCtm9p+XmKecTppxFBTb7pJA5WdJ08y5T8=;
        b=t8vxxd6mRSkw9XIZOYralE2IKC53zmExj36tBmjEbO+52HlExWJN4m0PC/BeaCSyIY
         tvl0UAAm/9ZyDBVESa+0RyICt74ZOtZrgLvdMNltIUOWsjZsb8R2y2qUbeLTk/b6UZxS
         D81MFdWV17lC3ClHl5KWjPkAXvP5YPa22yzBwraqpY4wL8CjU2G3vkVMoqlVG/8NMLHk
         Mh+W5sKKtf36XFJvuUNlhZOyQsH+zbEKDI1Oh2lY0ikVswUmJvYKzW2a78iBCAtms1Dz
         wZTiS7BkumAXNYLWk4v7l/ZAOcnLhiVT8+J9kBg5/V7QGMDkBFjodvDvXHhIWpiUKbjY
         sO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=znnrL6PQ+KCtm9p+XmKecTppxFBTb7pJA5WdJ08y5T8=;
        b=f2MzihEkYT1lbwzJ48Q+C+YJhBvD5dxQztv3EOBO4ekAHX7VYhc71BZpXxknPYklzr
         Z49FAD85eEubHkVvko/VlaBD/DXguFjZsA9eDG6rstd5LdQRNQU4lZV9zVl8Q+we62vO
         m6ChQOOFbV+UuTytCPwCIYCgKOxoLoGfl2voY6gPK//AwPujBQT3R+fNn75eXiHQCCQi
         VVNBZ0dR6QT1PA9HfnUqOYNeZXao2h3PfYCkeUbkv53OXuMKm6VTVp3jRQOqlJ7jcB14
         n5oWjan5Y6Gh5SGanWALr3EcsETBoLc3HUNfte4aFzkwV0swk8LzMnK24lEY90cVrS6j
         WTBA==
X-Gm-Message-State: AOAM533WENYDrYy4aJRwqSTgd49lEbd/sfvt6E22DoaWEXyvoL+mb1F8
	JOQ/4ECHxDVnb31MryAMUT7tNk3mAjcr9Q==
X-Google-Smtp-Source: ABdhPJzIo7Rlxi0msYprDD2SfT0wWjrWwFAxFf61lhc2dBwCuvEORcP3AyVRD0P+HCWmzYVQacsX4g==
X-Received: by 2002:a17:902:6f01:: with SMTP id w1mr3320753plk.49.1599073954906;
        Wed, 02 Sep 2020 12:12:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id o63sm254700pfb.190.2020.09.02.12.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 12:12:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] packagegroup-meta-python: Add new packages
Date: Wed,  2 Sep 2020 12:12:30 -0700
Message-Id: <20200902191231.1224543-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganise entries per line

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb | 470 ++++++++++++++++--
 1 file changed, 428 insertions(+), 42 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c03f610da8..0aea30e330 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -1,10 +1,11 @@
-SUMMARY = "Meta-oe ptest packagegroups"
+SUMMARY = "Meta-python ptest packagegroups"
 
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-python3 \
+    packagegroup-meta-python3-ptest \
 '
 
 RDEPENDS_packagegroup-meta-python3 = "\
@@ -13,58 +14,443 @@ RDEPENDS_packagegroup-meta-python3 = "\
 "
 
 RDEPENDS_packagegroup-meta-python3 = "\
-    python3-pyserial python3-gevent python3-alembic python3-robotframework-seriallibrary \
-    python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
-    python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
-    python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
-    python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
-    python3-behave python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
-    python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
-    python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
-    python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
-    python3-flask-script python3-cassandra-driver python3-ujson python3-aws-iot-device-sdk-python \
-    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
-    python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
-    python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
-    python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
-    python3-flask-bootstrap python3-pyudev python3-decorator python3-pybind11 python3-pluggy python3-redis \
-    python3-pycryptodome python3-passlib python3-dominate python3-ply python3-ntplib python3-serpent python3-wrapt \
-    python3-attrs python3-appdirs python3-isort python3-evdev python3-incremental python3-click python3-flask-nav \
-    python3-webcolors python3-dateutil python3-blinker python3-hyperlink python3-lxml python3-pylint \
-    python3-flask-migrate python3-pytest-tempdir python3-flask-restful python3-feedformatter \
-    python3-pyasn1-modules python3-scapy python3-html5lib python3-dnspython python3-automat \
-    python3-itsdangerous python3-pandas python3-pyfirmata python3-protobuf  \
-    python3-flask-babel python3-anyjson python3-flask-xstatic python3-multidict python3-prompt-toolkit \
-    python3-periphery python3-greenlet python3-pytz python3-pyexpect python3-zopeinterface \
-    python3-bcrypt python3-xstatic-font-awesome python3-m2crypto python3-parse python3-attr \
-    python3-beautifulsoup4 python3-pycodestyle python3-oauthlib python3-grpcio python3-scrypt \
-    python3-pyjwt python3-astroid python3-flask-pymongo python3-wcwidth python3-lazy-object-proxy \
-    python3-websockets python3-pyzmq python3-pytest python3-chardet python3-vcversioner python3-whoosh \
-    python3-pymisp python3-certifi python3-psutil python3-flask-sqlalchemy python3-humanize \
-    python3-grpcio-tools python3-configparser python3-strict-rfc3339 python3-paho-mqtt \
-    python3-pytest-helpers-namespace python3-flask python3-flask-wtf python3-visitor python3-pynetlinux \
-    python3-requests python3-cryptography-vectors python3-spidev python3-pid python3-pymongo \
-    python3-future python3-django python3-unidiff python3-webencodings python3-can python3-pyalsaaudio \
-    python3-flask-sijax python3-cryptography python3-twisted python3-netaddr python3-pycparser \
-    python3-flask-uploads python3-pysocks python3-cffi python3-editor python3-ptyprocess \
-    python3-pyopenssl python3-ordered-set python3-simplejson python3-py \
+    pamela \
+    pyrtm \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
+    python3-bcrypt \
+    python3-flask-mail \
+    python3-editor \
+    python3-flask-pymongo \
+    python3-cffi \
+    python3-pillow \
+    python3-markupsafe \
+    python3-flask-nav \
+    python3-asciitree \
+    python3-flask-sqlalchemy \
+    python3-gevent \
+    python3-attrs \
+    python3-aenum \
+    python3-gast \
+    python3-blinker \
+    python3-prettytable \
+    python3-cmd2 \
+    python3-aiofiles \
+    python3-anyjson \
+    python3-isodate \
+    python3-incremental \
+    python3-aiohttp-jinja2 \
+    python3-aiohttp \
+    python3-alembic \
+    python3-ansi2html \
+    python3-ansicolors \
+    python3-argexec \
+    python3-appdirs \
+    python3-apply-defaults \
+    python3-argh \
+    python3-ply \
+    python3-astroid \
+    python3-ndg-httpsclient \
+    python3-arpeggio \
+    python3-astor \
+    python3-pika \
+    python3-asn1crypto \
+    python3-async-timeout \
+    python3-absl \
+    python3-atomicwrites \
+    python3-attr \
+    python3-flask \
+    python3-autobahn \
+    python3-babel \
+    python3-pretend \
+    python3-automat \
+    python3-ptyprocess \
+    python3-aws-iot-device-sdk-python \
+    python3-bandit \
+    python3-backcall \
+    python3-backports-functools-lru-cache \
+    python3-beautifulsoup4 \
+    python3-betamax \
+    python3-behave \
+    python3-jsonpointer \
+    python3-bitarray \
+    python3-bitstring \
+    python3-bitstruct \
+    python3-cachecontrol \
+    python3-booleanpy \
+    python3-cachetools \
+    python3-can \
+    python3-cantools \
+    python3-cassandra-driver \
+    python3-cbor2 \
+    python3-chardet \
+    python3-certifi \
+    python3-isort \
+    python3-colorama \
+    python3-cheetah \
+    python3-click \
+    python3-huey \
+    python3-coloredlogs \
+    python3-colorlog \
+    python3-wheel \
+    python3-configshell-fb \
+    python3-constantly \
+    python3-contextlib2 \
+    python3-configargparse \
+    python3-crcmod \
+    python3-configobj \
+    python3-configparser \
+    python3-cppy \
+    python3-dbussy \
+    python3-dateutil \
+    python3-distro \
+    python3-click-repl \
+    python3-redis \
+    python3-dominate \
+    python3-et-xmlfile \
+    python3-feedformatter \
+    python3-flask-jsonpify \
+    python3-flask-jwt \
+    python3-flask-migrate \
+    python3-pyinotify \
+    python3-flask-restful \
+    python3-flask-socketio \
+    python3-gmqtt \
+    python3-dateparser \
+    python3-defusedxml \
+    python3-rsa \
+    python3-django-south \
+    python3-grpcio \
+    python3-pybind11-json \
+    python3-google-api-python-client \
+    python3-h5py \
+    python3-dt-schema \
+    python3-haversine \
+    python3-fasteners \
+    python3-flask-bootstrap \
+    python3-dbus-next \
+    python3-dnspython \
+    python3-traitlets \
+    python3-pybind11 \
+    python3-flask-script \
+    python3-flask-sijax \
+    python3-html2text \
+    python3-html5lib \
+    python3-intervals \
+    python3-ipy \
+    python3-ipaddress \
+    python3-iso8601 \
+    python3-humanfriendly \
+    python3-lrparsing \
+    python3-itsdangerous \
+    python3-hyperlink \
+    python3-idna-ssl \
+    python3-jdcal \
+    python3-greenstalk \
+    python3-icu \
+    python3-jsonschema \
+    python3-keras-applications \
+    python3-idna \
+    python3-sympy \
+    python3-importlib-metadata \
+    python3-langtable \
+    python3-lockfile \
+    python3-nmap \
+    python3-jdatetime \
+    python3-monotonic \
+    python3-mpmath \
+    python3-jedi \
+    python3-jsonpatch \
+    python3-jsonrpcserver \
+    python3-libconf \
+    python3-netifaces \
+    python3-msm \
+    python3-nocaselist \
+    python3-keras-preprocessing \
+    python3-flask-babel \
+    python3-lorem \
+    python3-javaobj-py3 \
+    python3-passlib \
+    python3-pathlib2 \
+    python3-pexpect \
+    python3-luma-oled \
+    python3-pluggy \
+    python3-lxml \
+    python3-precise-runner \
+    python3-padaos \
+    python3-progress \
+    python3-sqlalchemy \
+    python3-sh \
+    python3-petact \
+    python3-mock \
+    python3-msgpack \
+    python3-pyasn1 \
+    python3-msk \
+    python3-openpyxl \
+    python3-prctl \
+    python3-pyatspi \
+    python3-multidict \
+    python3-netaddr \
+    python3-parse \
+    python3-oauthlib \
+    python3-pyfirmata \
+    python3-pandas \
+    python3-padatious \
+    python3-prompt-toolkit \
+    python3-parse-type \
+    python3-cycler \
+    python3-decorator \
+    python3-django \
+    python3-croniter \
+    python3-flask-user \
+    python3-twitter \
+    python3-evdev \
+    python3-dynamic-dispatch \
+    python3-click-spinner \
+    python3-future \
+    python3-geojson \
+    python3-gunicorn \
+    python3-engineio \
+    python3-gmpy2 \
+    python3-coverage \
+    python3-fastnumbers \
+    python3-fann2 \
+    python3-gnupg \
+    python3-flask-login \
+    python3-pyzmq \
+    python3-cryptography-vectors \
+    python3-flask-uploads \
+    python3-ecdsa \
+    python3-networkx \
+    python3-flask-xstatic \
+    python3-pint \
+    python3-iso3166 \
+    python3-imageio \
+    python3-mccabe \
+    python3-kconfiglib \
+    python3-grpcio-tools \
+    python3-jinja2 \
+    python3-jsmin \
+    python3-greenlet \
+    python3-idna \
+    python3-flask-versioned \
+    python3-httplib2 \
+    python3-ipython-genutils \
+    python3-kiwisolver \
+    python3-lz4 \
+    python3-obd \
+    python3-markdown \
+    python3-m2crypto \
+    python3-paho-mqtt \
+    python3-graphviz \
+    python3-pyaudio \
+    python3-pako \
+    python3-meld3 \
+    python3-parallax \
+    python3-lazy-object-proxy \
+    python3-license-expression \
+    python3-luma-core \
+    python3-natsort \
+    python3-polyline \
+    python3-ordered-set \
+    python3-packaging \
+    python3-parso \
+    python3-pycparser \
+    python3-pycrypto \
+    python3-pydbus \
+    python3-pathtools3 \
+    python3-periphery \
+    python3-pyiface \
+    python3-pyjwt \
+    python3-pykwalify \
+    python3-pylint \
+    python3-pynetlinux \
+    python3-pickleshare \
+    python3-pyopenssl \
+    python3-protobuf \
+    python3-py \
+    python3-pyasn1-modules \
+    python3-pyscaffold \
+    python3-pyserial \
+    python3-pysocks \
+    python3-pytoml \
+    python3-pytest-helpers-namespace \
+    python3-more-itertools \
+    python3-pytest-tempdir \
+    python3-pyflakes \
+    python3-pyrad \
+    python3-pyusb \
+    python3-pyhamcrest \
+    python3-custom-inherit \
+    python3-pymysql \
+    python3-pyperclip \
+    python3-rfc3339-validator \
+    python3-pytz \
+    python3-scrypt \
+    python3-rdflib \
+    python3-sijax \
+    python3-regex \
+    python3-slip-dbus \
+    python3-smbus2 \
+    python3-pytest-metadata \
+    python3-term \
+    python3-pystache \
+    python3-pep8 \
+    python3-pytest-runner \
+    python3-pybluez \
+    python3-rfc3986-validator \
+    python3-pocketsphinx \
+    python3-sdnotify \
+    python3-pycodestyle \
+    python3-pytest \
+    python3-speaklater \
+    python3-wtforms \
+    python3-speedtest-cli \
+    python3-pyudev \
+    python3-sqlparse \
+    python3-pyexpect \
+    python3-pytest-html \
+    python3-uritemplate \
+    python3-cryptography \
+    python3-requests \
+    python3-test-generator \
+    python3-whoosh \
+    python3-xstatic-font-awesome \
+    python3-tqdm \
+    python3-vcversioner \
+    python3-semver \
+    python3-serpent \
+    python3-spidev \
+    python3-sqlsoup \
+    python3-tornado \
+    python3-trafaret \
+    python3-urllib3 \
+    python3-yappi \
+    python3-zipp \
+    python3-texttable \
+    python3-humanize \
+    python3-strict-rfc3339 \
+    python3-supervisor \
+    python3-toml \
+    python3-diskcache \
+    python3-requests-futures \
+    python3-matplotlib \
+    python3-sentry-sdk \
+    python3-xlrd \
+    python3-xstatic \
+    python3-tzlocal \
+    python3-wcwidth \
+    python3-ntplib \
+    python3-u-msgpack-python \
+    python3-python-vlc \
+    python3-xlsxwriter \
+    python3-inflection \
+    python3-tabulate \
+    python3-typing-extensions \
+    python3-pystemd \
+    python3-pid \
+    python3-pkgconfig \
+    python3-pylyrics \
+    python3-pyyaml \
+    python3-raven \
+    python3-stevedore \
+    python3-requests-oauthlib \
+    python3-rfc3987 \
+    python3-psutil \
+    python3-robotframework-seriallibrary \
+    python3-pulsectl \
+    python3-py-ubjson \
+    python3-pyalsaaudio \
+    python3-simpleeval \
+    python3-smbus \
+    python3-pychromecast \
+    python3-pyjks \
+    python3-pymongo \
+    python3-spidev \
+    python3-pynacl \
+    python3-termcolor \
+    python3-pyperf \
+    python3-qrcode \
+    python3-visitor \
+    python3-pyroute2 \
+    python3-webencodings \
+    python3-pyrsistent \
+    python3-werkzeug \
+    python3-pydicti \
+    python3-xmlrunner \
+    python3-smpplib \
+    python3-pymisp \
+    python3-requests-file \
+    python3-requests-toolbelt \
+    python3-ruamel-yaml \
+    python3-setuptools-scm \
+    python3-socketio \
+    python3-soupsieve \
+    python3-textparser \
+    python3-tinyrecord \
+    python3-twine \
+    python3-unidiff \
+    python3-watchdog \
+    python3-webcolors \
+    python3-robotframework \
+    python3-xxhash \
+    python3-yarl \
+    python3-zopeinterface \
+    python3-requests-ftp \
+    python3-scapy \
+    python3-paramiko \
+    python3-twofish \
+    python3-simplejson \
+    python3-snappy \
+    python3-versiontools \
+    python3-flask-wtf \
+    python3-websockets \
+    python3-werkzeug \
+    python3-wrapt \
+    python3-xmltodict \
+    python3-trafaret-config \
+    python3-twisted \
+    python3-txaio \
+    python3-typeguard \
+    python3-pytest-timeout \
+    python3-ujson \
+    python3-waitress \
+    python3-websocket-client \
+    python3-xmodem \
+    python3-djangorestframework \
+    python3-pytest-asyncio \
+    python3-nocasedict \
+    python3-yamlloader \
+    python3-ipython \
+    python3-pycurl \
+    gyp \
+    python3-jsonref \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
-    python3-pykickstart \
-    python3-meh \
     python3-blivet \
-    python3-pywbem \
-    python3-pyparted \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
+    python3-cson \
+    python3-meh \
+    python3-pyephem \
+    python3-pykickstart \
+    python3-pyparted \
+    python3-pywbem \
+    python3-pywbemtools \
 "
 
 RDEPENDS_packagegroup-meta-python3-connectivity = "\
-    python3-pytun \
+    python3-gsocketpool \
+    python3-h2 \
+    python3-hpack \
+    python3-hyperframe \
     python3-mprpc \
+    python3-priority \
     python3-pyconnman \
-    python3-gsocketpool \
+    python3-pyro4 \
+    python3-thrift \
+    python3-txws \
+    python3-pytun \
+    telepathy-python3 \
 "
 
 RDEPENDS_packagegroup-meta-python3-ptest = "\
-- 
2.28.0

