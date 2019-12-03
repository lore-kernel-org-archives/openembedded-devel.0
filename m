Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED4E75E2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 04:53:16 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id x13so1173651plr.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 20:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qm5q7U31TfVX/ppxF0sFsTHb4raAo15yr0sbPRmHm2I=;
	b=KvwxWtF43aAeAUbMe58qrLYyF130PbSFXwOEI52fCD+0fqvhBMiPxsOgb4bfaJ/+P1
	MlQUKnHsjZa51aTYFsO1JQiouaywP/Asmd4dq8KqhUyxkZUpcsA8qq4wtWQeIRAPo2zi
	emljNVtQqGGCltXu4GdeCZlc4uDjEgTlLxx1CM28g6BQjg7DTFVltywX1g/HGeHY5SZ4
	nd4pTPtstsU693HeGqzVl1ery+CO7ZKYcQTicLR7KdqLN+qTBC9BpPAXCwAn5g4F8kQI
	IMWmg0Pg8whShFtLOKX1YB89EJu3dlWOAN8kC92pgNLfHsfzfk7SqdIAKdRpeLKh3n7E
	SXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qm5q7U31TfVX/ppxF0sFsTHb4raAo15yr0sbPRmHm2I=;
	b=RcqwQyDQXAaUX8jawVCWeqcH79DispY8+3khpyTNHQx6l8DNmwJ91s1aZf+/ond4Gt
	zcAVLmcgbKSZDS+Fj7T4SsicR1L5qP1F9eBWp7j0bYIEBEPDhUAJGz3cLwmwggvlzyvq
	crSTDZIvQ5kEI/YYaOQ9R6e3L7ro4XAv9ezITIWBMsA1G8ezBJK835/nD9E495A8ejUV
	HDegD/tjXnU/jjiScKi5bFaqc2mOUW1yrgpaXQ7mgGBEbHzzg82VmmICNGpii6jN3Pew
	Y6tSiS2m5d4wovDlFKEcsLp3KYvsnKISwk4G9JE6LAheFPl1c7L6NTo5ZhI89k5kly9N
	HZjA==
X-Gm-Message-State: APjAAAX3/Ai/yh44IdPqnPAn1E30pVp4ukoZOfQBABCq9eXFvER3QVms
	6MryTTZmIM1nrDAJ3PwSKG6sz/qjX5k=
X-Google-Smtp-Source: APXvYqy0abaJBFKJIycar37Bxr8T4PU6+R+y7kbVorkD1lheO78hE/6capkZcSTg2F4v6ETUVyaK2g==
X-Received: by 2002:a17:902:d905:: with SMTP id
	c5mr3208581plz.60.1575348797855; 
	Mon, 02 Dec 2019 20:53:17 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:a470:42fc:1110:b615])
	by smtp.gmail.com with ESMTPSA id h7sm1397499pfq.36.2019.12.02.20.53.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 20:53:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 20:52:18 -0800
Message-Id: <20191203045219.29647-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python2][zeus][PATCH 1/2] images/packagegroups: python2 only
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
X-List-Received-Date: Tue, 03 Dec 2019 04:53:17 -0000
Content-Transfer-Encoding: 8bit

Rename images and packagegroups so that they will
not interfere with the similar recipes in meta-python.

Drop all python3 references, this layer is python2 only.

Fix ptest packagegroup, RDEPENDS on *-ptest.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-core/images/meta-python-image.bb      |  6 --
 ...age-base.bb => meta-python2-image-base.bb} |  0
 recipes-core/images/meta-python2-image.bb     |  5 ++
 ...t-image.bb => meta-python2-ptest-image.bb} |  0
 ...python.bb => packagegroup-meta-python2.bb} | 68 +------------------
 5 files changed, 7 insertions(+), 72 deletions(-)
 delete mode 100644 recipes-core/images/meta-python-image.bb
 rename recipes-core/images/{meta-python-image-base.bb => meta-python2-image-base.bb} (100%)
 create mode 100644 recipes-core/images/meta-python2-image.bb
 rename recipes-core/images/{meta-python-ptest-image.bb => meta-python2-ptest-image.bb} (100%)
 rename recipes-core/packagegroups/{packagegroup-meta-python.bb => packagegroup-meta-python2.bb} (53%)

diff --git a/recipes-core/images/meta-python-image.bb b/recipes-core/images/meta-python-image.bb
deleted file mode 100644
index b0824233..00000000
--- a/recipes-core/images/meta-python-image.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require  meta-python2-image-base.bb
-
-SUMMARY = "meta-python2 build test image"
-
-IMAGE_INSTALL += "packagegroup-meta-python2 \
-                  packagegroup-meta-python3"
diff --git a/recipes-core/images/meta-python-image-base.bb b/recipes-core/images/meta-python2-image-base.bb
similarity index 100%
rename from recipes-core/images/meta-python-image-base.bb
rename to recipes-core/images/meta-python2-image-base.bb
diff --git a/recipes-core/images/meta-python2-image.bb b/recipes-core/images/meta-python2-image.bb
new file mode 100644
index 00000000..9fe75ea0
--- /dev/null
+++ b/recipes-core/images/meta-python2-image.bb
@@ -0,0 +1,5 @@
+require  meta-python2-image-base.bb
+
+SUMMARY = "meta-python2 build test image"
+
+IMAGE_INSTALL += "packagegroup-meta-python2"
diff --git a/recipes-core/images/meta-python-ptest-image.bb b/recipes-core/images/meta-python2-ptest-image.bb
similarity index 100%
rename from recipes-core/images/meta-python-ptest-image.bb
rename to recipes-core/images/meta-python2-ptest-image.bb
diff --git a/recipes-core/packagegroups/packagegroup-meta-python.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
similarity index 53%
rename from recipes-core/packagegroups/packagegroup-meta-python.bb
rename to recipes-core/packagegroups/packagegroup-meta-python2.bb
index d24f10b1..e0d8c901 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -13,11 +13,6 @@ RDEPENDS_packagegroup-meta-python2 = "\
     packagegroup-meta-python2-connectivity \
 "
 
-RDEPENDS_packagegroup-meta-python3 = "\
-    packagegroup-meta-python3-extended \
-    packagegroup-meta-python3-connectivity \
-"
-
 RDEPENDS_packagegroup-meta-python2 = "\
     python-psutil python-certifi python-flask python-pyroute2 python-pyopenssl python-pylint \
     python-semver python-wrapt python-networkx python-behave python-dominate python-flask-user \
@@ -66,45 +61,6 @@ RDEPENDS_packagegroup-meta-python2 = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
 
-RDEPENDS_packagegroup-meta-python3 = "\
-    python3-pyserial python3-gevent python3-alembic python3-robotframework-seriallibrary \
-    python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
-    python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
-    python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
-    python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
-    python3-behave python3-pyparsing python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
-    python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
-    python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
-    python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
-    python3-flask-script python3-cassandra-driver python3-cython python3-ujson python3-aws-iot-device-sdk-python \
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
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
-"
-
 RDEPENDS_packagegroup-meta-python2-extended = "\
     python-pyephem \
     python-cson \
@@ -112,15 +68,6 @@ RDEPENDS_packagegroup-meta-python2-extended = "\
     python-pyparted \
 "
 
-RDEPENDS_packagegroup-meta-python3-extended = "\
-    python3-pykickstart \
-    python3-meh \
-    python3-blivet \
-    python3-pywbem \
-    python3-pyparted \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
-"
-
 RDEPENDS_packagegroup-meta-python2-connectivity = "\
     python-pyro4 \
     python-pytun \
@@ -131,20 +78,9 @@ RDEPENDS_packagegroup-meta-python2-connectivity = "\
     python-gsocketpool \
 "
 
-RDEPENDS_packagegroup-meta-python3-connectivity = "\
-    python3-pytun \
-    python3-mprpc \
-    python3-pyconnman \
-    python3-gsocketpool \
-"
-
 RDEPENDS_packagegroup-meta-python2-ptest = "\
-    python-pygpgme \
-    python-cryptography \
-    "
-
-RDEPENDS_packagegroup-meta-python3-ptest = "\
-    python3-cryptography \
+    python-pygpgme-ptest \
+    python-cryptography-ptest \
     "
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.24.0


