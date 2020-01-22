Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 040E87FD5A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:11:37 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id t14so172937plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 11:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m3QMKvHTZzL1WHqK2XEpEdqZKEphbGvoxrxlemTSDl4=;
	b=k6COqVqp6DsHALMG2+Tgc9ikOJxLqIXUBAuRr4KPSb2uhMarcf9SkjBuBvtZRSKjEg
	pcAxoq9puxBZcPjoK8uxOvVjOHz06G/QVc3PSXuU3IW1hOZjLP/kGSamMfPP7D0y/ZMy
	0VuZ8a+Xk1ct/2Afu2gg64Rnmo3WCAM1ajDpinlOJ1qZQpaMXPMyco5eRExjtHLcwDLX
	T1KZaDIv6NRnFP4bCcnWC9+NcAGEzO2HBj9w6zqdMqd27n6iruVKup4gHgLxUX1YSPGg
	9ukZLj1OgKjTiaEDASIkzBgjZqbk7xGt+yf1WQ6BM2TNneLLTqFSl3PTxe/QjamNW/6x
	nz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m3QMKvHTZzL1WHqK2XEpEdqZKEphbGvoxrxlemTSDl4=;
	b=A/09p8MGNIimqJmHjnbSuRvnU/noWX/a3JXC3YQaIxg4tYgx3IHA5Blz03VgVsjIOv
	lg520u2oPN1+rrSia2oOMrTWroxsneORPevTgDcqqEbDijI2S0qf8+Ow4WoaCsKtC/8A
	upPT/3MMzMKbBaFjMAbEfz/p9qCrTi51sf7hb4N2TBFCo9oiVkwGE2ePnzU+fzlAXaQD
	wIyc/aTTk1jqZjmT04j69reZXteMeq0i+THfgI9dItI9arM8UzzgQ9rcQ2BqphM8qiC4
	E7gAFT7BvtAppkDwbltbU2rDLJiXuoMzhRPkxoGNkH2LrM11f0SI4rMhzYokyWTdUcwl
	kj3A==
X-Gm-Message-State: APjAAAUc6YvwAijnpYwF0dSxJhYh8mDJ9FakVqYFpBqMGFuuYelp4LuS
	nwC9x1yXy6U1l+b4e5I5AtrT8z8yG+U=
X-Google-Smtp-Source: APXvYqzoRrLd71mwT5OkRpHgoQJlZcFgJ23l4rvXkvKR+zbdBQhcVNADHP/TYCTq/SIYKzmONFVSng==
X-Received: by 2002:a17:902:59cd:: with SMTP id
	d13mr12487061plj.146.1579720298488; 
	Wed, 22 Jan 2020 11:11:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	c19sm50595184pfc.144.2020.01.22.11.11.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 11:11:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 11:11:33 -0800
Message-Id: <20200122191134.3307089-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122191134.3307089-1-raj.khem@gmail.com>
References: <20200122191134.3307089-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/4] packagegroup-meta-python: Remove py2 rdeps
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
X-List-Received-Date: Wed, 22 Jan 2020 19:11:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb | 76 -------------------
 1 file changed, 76 deletions(-)

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
-- 
2.25.0


