Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3008F7C056
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:34 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r136so8554158pfc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jJnBDkjQyt8lu3rjfrn2nC2Ui7JEJbQ/7IiEdwItZA0=;
	b=N1RWivnqQECIm/qzd0RyewA7iX7N7O97a1VbombumliUMPv5/+fZM87YIky7oQqltT
	Uw4QZkthKJOfsyftIU7If9IsV/9csEAnbVOEOc3xjfuNIeAbHR9eusZpbFsWRmTvZyuu
	hGV9smmKbQDhvvl+Vva1pRcskFuxVJ5+GUqwj1c+zE91p0lgcR6Jxgot6LVcHySTQulg
	ZAij8TF6t+f3MKWh07gevg1Wb3yPX7Trobw1nDWWYu4ovVY1W2IItLj9HySuov1JuZuE
	W/oS0k2bWbG55VSKO2VvHX0NT0Llu6qXS1K/+l0C1eORJ3NpISm7kpOngA3EVK2Z+rix
	4tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jJnBDkjQyt8lu3rjfrn2nC2Ui7JEJbQ/7IiEdwItZA0=;
	b=XtmaQ+NIEYAXbQzHk219J7MbGJFQXjnF+Ooa79Y+KENl0qheDF7CJcGYb51u76rUTa
	F9PzO47XfIHruj6o8Ixb1vv9zFEC9yQwEBW3g95uOmEk0mXwcDsTkIr6J+vbAN98+DAX
	D11DbQWfnIgkJdXCl8EekrgGkvCPipZFk/AuxO96MVkD/JEbqOozTVw1j0KC7SxAiq+E
	gpB3UDuBhrTxUzAmrWJLiA/KrE3n0kTR8Jc6ofXFE4aswy0+cFonOOkhC/CZ6xlUY+9c
	QU+KBh0t3LQU4xatuzbz9Zk2Mmvdk9zvUIVsC4BiDpKO1t/H+03u/VoBP/dDIoeszpgJ
	+OTw==
X-Gm-Message-State: AJcUukfkgOB4+RmxsmT/vvgFLv62UQ8XvepYsd6wDWKAfF47+Gu0fqRs
	4U8fVpy+319Q7OPh5TyERXI=
X-Google-Smtp-Source: ALg8bN4/SHeHShx1rZUHqMluox0lsbFVNKsWAU2XmIAdbVyKYjggEO/4Zu6xD3NA1MGZLPncK3OTPQ==
X-Received: by 2002:a63:5ec6:: with SMTP id
	s189mr17295191pgb.357.1547328696064; 
	Sat, 12 Jan 2019 13:31:36 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:26 -0800
Message-Id: <20190112213132.2501-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 3/9] meta-python: add pkg groups and image for testing
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../images/meta-python-image-base.bb          |   7 +
 .../recipes-core/images/meta-python-image.bb  |   6 +
 .../images/meta-python-ptest-image.bb         |   5 +
 .../packagegroups/packagegroup-meta-python.bb | 150 ++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 meta-python/recipes-core/images/meta-python-image-base.bb
 create mode 100644 meta-python/recipes-core/images/meta-python-image.bb
 create mode 100644 meta-python/recipes-core/images/meta-python-ptest-image.bb
 create mode 100644 meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb

diff --git a/meta-python/recipes-core/images/meta-python-image-base.bb b/meta-python/recipes-core/images/meta-python-image-base.bb
new file mode 100644
index 0000000000..81081e61b2
--- /dev/null
+++ b/meta-python/recipes-core/images/meta-python-image-base.bb
@@ -0,0 +1,7 @@
+SUMMARY = "meta-python build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image.bb
new file mode 100644
index 0000000000..cc75fe6e4b
--- /dev/null
+++ b/meta-python/recipes-core/images/meta-python-image.bb
@@ -0,0 +1,6 @@
+require  meta-python-image-base.bb
+
+SUMMARY = "meta-python build test image"
+
+IMAGE_INSTALL += "packagegroup-meta-python \
+                  packagegroup-meta-python3"
diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-ptest-image.bb
new file mode 100644
index 0000000000..7ee15354a2
--- /dev/null
+++ b/meta-python/recipes-core/images/meta-python-ptest-image.bb
@@ -0,0 +1,5 @@
+require  meta-python-image-base.bb
+
+SUMMARY = "meta-python ptest test image"
+
+IMAGE_INSTALL += "packagegroup-meta-python-ptest"
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
new file mode 100644
index 0000000000..82cda5862d
--- /dev/null
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -0,0 +1,150 @@
+SUMMARY = "Meta-oe ptest packagegroups"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-python \
+    packagegroup-meta-python3 \
+'
+
+RDEPENDS_packagegroup-meta-python = "\
+    packagegroup-meta-python-extended \
+    packagegroup-meta-python-connectivity \
+"
+
+RDEPENDS_packagegroup-meta-python3 = "\
+    packagegroup-meta-python3-extended \
+    packagegroup-meta-python3-connectivity \
+"
+
+RDEPENDS_packagegroup-meta-python = "\
+    python-psutil python-certifi python-flask python-pyroute2 python-pyopenssl python-pylint \
+    python-semver python-wrapt python-networkx python-behave python-dominate python-flask-user \
+    python-attrs python-humanize python-six python-flask-login python-zopeinterface python-sijax \
+    python-pyinotify python-stevedore python-pyjwt python-webdav python-twisted python-flask-sijax \
+    python-functools32 python-javaobj-py3 python-pygpgme python-future python-attr \
+    python-flask-xstatic python-m2crypto python-hyperlink python-imaging python-idna python-jinja2 \
+    python-can python-flask-bcrypt python-requests python-paste python-flask-script python-serpent \
+    python-cryptography python-pysmi python-xlrd python-appdirs python-jsonpatch python-bcrypt \
+    python-ndg-httpsclient python-pytest python-linecache2 python-visitor python-backports-abc \
+    python-setuptools-scm python-evdev python-pyjks python-jsonpointer python-cheetah python-gevent \
+    python-smbus python-sqlalchemy python-scrypt python-werkzeug python-anyjson python-pexpect \
+    python-robotframework-seriallibrary python-pyalsaaudio python-pytest-helpers-namespace \
+    python-alembic python-flask-pymongo python-slip-dbus python-pydbus python-automat python-rfc3987 \
+    python-tzlocal python-backports-ssl python-subprocess32 python-asn1crypto python-pybind11 \
+    python-ptyprocess python-babel python-passlib python-oauthlib python-sdnotify \
+    python-lazy-object-proxy python-cryptography-vectors python-crcmod python-pyusb python-vobject \
+    python-webcolors python-pyparsing python-beautifulsoup4 python-cffi python-tornado-redis \
+    python-itsdangerous python-pyasn1-modules python-netaddr python-vcversioner \
+    python-sh python-greenlet python-paho-mqtt python-traceback2 python-gdata python-dbusmock \
+    python-whoosh python-lockfile python-isort python-wtforms python-feedparser python-flask-restful \
+    python-pysnmp python-flask-babel python-pytest-tempdir python-flask-nav python-pyzmq python-pyyaml \
+    python-protobuf python-pluggy python-jsonschema python-msgpack python-pandas \
+    python-periphery python-pint python-pycryptodome python-yappi python-pycrypto python-pretend \
+    python-pyserial python-pyiface python-docutils python-grpcio-tools python-django-south \
+    python-backports-functools-lru-cache python-py python-click python-flask-migrate \
+    python-pyudev python-pystache python-blinker python-prompt-toolkit python-lxml \
+    python-unidiff python-inflection python-twofish python-prettytable python-webencodings \
+    python-mock python-pyexpect python-dnspython python-pysocks python-pynetlinux \
+    python-daemon python-djangorestframework python-typing python-monotonic python-sparts \
+    python-enum34 python-pyperclip python-flask-uploads python-pbr python-parse python-pyflakes \
+    python-pyhamcrest python-mako python-incremental python-tornado python-xstatic-font-awesome \
+    python-cmd2 python-strict-rfc3339 python-pycodestyle python-xstatic python-snakefood \
+    python-pybluez python-flask-navigation python-pyfirmata python-pymongo python-pysqlite \
+    python-progress python-flask-sqlalchemy python-pymisp python-pip python-ujson python-ply \
+    python-pep8 python-dateutil python-pycparser python-daemonize python-astroid python-pyrex \
+    python-markupsafe python-pytest-runner python-grpcio python-mccabe python-pytz python-selectors34 \
+    python-cython python-chardet python-editor python-flask-bootstrap python-html5lib \
+    python-singledispatch python-redis python-flask-mail python-funcsigs python-snimpy python-pyasn1 \
+    python-decorator python-urllib3 python-feedformatter python-matplotlib python-iso8601 \
+    python-numeric python-robotframework python-django python-simplejson python-wcwidth \
+    python-configparser python-epydoc python-intervals python-speaklater \
+    python-aws-iot-device-sdk-python python-constantly python-bitarray python-flask-wtf \
+    python-parse-type python-ipaddress python-dbus \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
+"
+
+RDEPENDS_packagegroup-meta-python3 = "\
+    python3-pyserial python3-gevent python3-alembic python3-robotframework-seriallibrary \
+    python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
+    python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
+    python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
+    python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
+    python3-behave python3-pyparsing python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
+    python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
+    python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
+    python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
+    python3-flask-script python3-cassandra-driver python3-cython python3-ujson python3-aws-iot-device-sdk-python \
+    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
+    python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
+    python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
+    python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
+    python3-flask-bootstrap python3-pyudev python3-decorator python3-pybind11 python3-pluggy python3-redis \
+    python3-pycryptodome python3-passlib python3-dominate python3-ply python3-ntplib python3-serpent python3-wrapt \
+    python3-attrs python3-appdirs python3-isort python3-evdev python3-incremental python3-click python3-flask-nav \
+    python3-webcolors python3-dateutil python3-blinker python3-hyperlink python3-lxml python3-pylint \
+    python3-flask-migrate python3-pytest-tempdir python3-flask-restful python3-feedformatter \
+    python3-pyasn1-modules python3-scapy python3-html5lib python3-dnspython python3-automat \
+    python3-itsdangerous python3-pandas python3-pyfirmata python3-protobuf  \
+    python3-flask-babel python3-anyjson python3-flask-xstatic python3-multidict python3-prompt-toolkit \
+    python3-periphery python3-greenlet python3-pytz python3-pyexpect python3-zopeinterface \
+    python3-bcrypt python3-xstatic-font-awesome python3-m2crypto python3-parse python3-attr \
+    python3-beautifulsoup4 python3-pycodestyle python3-oauthlib python3-grpcio python3-scrypt \
+    python3-pyjwt python3-astroid python3-flask-pymongo python3-wcwidth python3-lazy-object-proxy \
+    python3-websockets python3-pyzmq python3-pytest python3-chardet python3-vcversioner python3-whoosh \
+    python3-pymisp python3-certifi python3-psutil python3-flask-sqlalchemy python3-humanize \
+    python3-grpcio-tools python3-configparser python3-strict-rfc3339 python3-paho-mqtt \
+    python3-pytest-helpers-namespace python3-flask python3-flask-wtf python3-visitor python3-pynetlinux \
+    python3-requests python3-cryptography-vectors python3-spidev python3-pid python3-pymongo \
+    python3-future python3-django python3-unidiff python3-webencodings python3-can python3-pyalsaaudio \
+    python3-flask-sijax python3-cryptography python3-twisted python3-netaddr python3-pycparser \
+    python3-flask-uploads python3-pysocks python3-cffi python3-editor python3-ptyprocess \
+    python3-pyopenssl python3-ordered-set python3-simplejson python3-py \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
+"
+
+RDEPENDS_packagegroup-meta-python-extended = "\
+    python-pyephem \
+    python-cson \
+    python-pywbem \
+    python-pyparted \
+"
+
+RDEPENDS_packagegroup-meta-python3-extended = "\
+    python3-pykickstart \
+    python3-meh \
+    python3-blivet \
+    python3-pywbem \
+    python3-pyparted \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
+"
+
+RDEPENDS_packagegroup-meta-python-connectivity = "\
+    python-pyro4 \
+    python-pytun \
+    python-mprpc \
+    python-thrift \
+    python-txws \
+    python-pyconnman \
+    python-gsocketpool \
+"
+
+RDEPENDS_packagegroup-meta-python3-connectivity = "\
+    python3-pytun \
+    python3-mprpc \
+    python3-pyconnman \
+    python3-gsocketpool \
+"
+
+RDEPENDS_packagegroup-meta-python-ptest = "\
+    python-pygpgme \
+    python-cryptography \
+    "
+
+RDEPENDS_packagegroup-meta-python3-ptest = "\
+    python3-cryptography \
+    "
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1


