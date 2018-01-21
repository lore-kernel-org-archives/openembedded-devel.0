Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBF87842F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:21 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id d54so15157339qtd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ygs6JhGtw+0hOH1UfTM11wS/hYjohq6cAqkhIMY/rwg=;
	b=Ftzp80LUclZPhE3PfHcwV7HycvL6agSM0JdAICIROuukaYoeD5g0JrcaFQpktZUZ6a
	nvYMD1+4L4pa/Nb2FjTbsYnjaWv5sawPtfK8vwQEfoOOogYN+UefvPXVVpgONoT+F93A
	cYIytmxRZ5KVlc5OEUNvw94JcBguEWxwh7EiXNU2fE0ckdM5DFppEUSdmxJlGDr71W9y
	nPCTZfsEwq/YmUZfFgLyYHVcaet1mYgDkvL7EjIX7rek1F/ZEwH+wlKk6m9vFr7drb71
	BG3PHorou+cnzh9+NpY6gWnkD+BtJOitwSl1G8a6NShImDXe+6Wz4VtowXkLeQu1C95l
	Q8rA==
X-Gm-Message-State: AKwxytcASgZUQu7GDuvblYsQtQi2+Zh4kShNLuhNrALhoSSAXbXuZ1ep
	9ImUmBChPsdPFBWjwSvHgbWY+GOy
X-Google-Smtp-Source: AH8x227nnZgqq5NGwsP/0wZX4q8flhtYWy4kBrLt1jLGvcdhlPTCHWLzwp9M6unfvx3KIK/Xa0qtkA==
X-Received: by 10.55.185.198 with SMTP id j189mr5900722qkf.243.1516551682195; 
	Sun, 21 Jan 2018 08:21:22 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:27 -0500
Message-Id: <1516551637-32255-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 00/10] Update python RDEPENDS to remove deprecated packages
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:22 -0000

The oe-core python packaging was updated to use a json manifest.  As part of these changes,
several packages were totally removed (importlib, enum, re, etc).  These packages were part of 
runtime depends for a large number of recipes.  This changeset removes the deprecated packages.

Derek Straka (10):
  Remove deprecated python3-signal from the RDEPENDS
  Remove deprecated python3-re from the RDEPENDS
  Remove deprecated python3-enum from the RDEPENDS
  Remove deprecated python3-argparse from the RDEPENDS
  Remove deprecated ${PYTHON_PN}-importlib from the RDEPENDS
  Remove deprecated python3-selectors from the RDEPENDS
  Remove deprecated python3-lang from the RDEPENDS
  Remove deprecated python-readline from the RDEPENDS
  Remove deprecated python3-textutils from the RDEPENDS
  Remove deprecated python3-subprocess from the RDEPENDS

 meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb       | 2 +-
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb      | 3 ---
 meta-python/recipes-connectivity/gateone/gateone_git.bb          | 1 -
 meta-python/recipes-devtools/python/python-asn1crypto.inc        | 2 --
 meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb  | 5 +++++
 meta-python/recipes-devtools/python/python-astroid.inc           | 2 --
 meta-python/recipes-devtools/python/python-astroid_1.6.0.bb      | 3 ++-
 meta-python/recipes-devtools/python/python-attrs.inc             | 1 -
 meta-python/recipes-devtools/python/python-attrs_17.4.0.bb       | 4 ++++
 meta-python/recipes-devtools/python/python-babel.inc             | 1 -
 meta-python/recipes-devtools/python/python-babel_2.5.3.bb        | 4 ++++
 meta-python/recipes-devtools/python/python-bcrypt.inc            | 1 -
 meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb       | 4 ++++
 meta-python/recipes-devtools/python/python-behave_1.2.5.bb       | 2 +-
 meta-python/recipes-devtools/python/python-can.inc               | 3 ---
 meta-python/recipes-devtools/python/python-can_2.0.0.bb          | 2 ++
 meta-python/recipes-devtools/python/python-cffi.inc              | 1 -
 meta-python/recipes-devtools/python/python-cffi_1.11.4.bb        | 4 ++++
 meta-python/recipes-devtools/python/python-chardet.inc           | 1 -
 meta-python/recipes-devtools/python/python-chardet_3.0.4.bb      | 2 ++
 meta-python/recipes-devtools/python/python-cryptography.inc      | 1 -
 meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb | 1 +
 meta-python/recipes-devtools/python/python-cython.inc            | 1 -
 meta-python/recipes-devtools/python/python-cython_0.27.3.bb      | 3 ++-
 meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb    | 1 -
 meta-python/recipes-devtools/python/python-django.inc            | 3 ---
 meta-python/recipes-devtools/python/python-django_1.11.9.bb      | 6 +++++-
 meta-python/recipes-devtools/python/python-gevent.inc            | 1 -
 meta-python/recipes-devtools/python/python-gevent_1.2.2.bb       | 1 +
 meta-python/recipes-devtools/python/python-jinja2.inc            | 4 ++--
 meta-python/recipes-devtools/python/python-jinja2_2.10.bb        | 6 ++++++
 meta-python/recipes-devtools/python/python-jsonpatch.inc         | 2 +-
 meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb     | 2 ++
 meta-python/recipes-devtools/python/python-jsonpointer.inc       | 1 -
 meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb   | 2 ++
 meta-python/recipes-devtools/python/python-jsonschema.inc        | 4 ----
 meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb   | 4 ++++
 meta-python/recipes-devtools/python/python-markupsafe.inc        | 2 +-
 meta-python/recipes-devtools/python/python-markupsafe_1.0.bb     | 2 ++
 meta-python/recipes-devtools/python/python-netaddr.inc           | 1 -
 meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb     | 4 ++++
 meta-python/recipes-devtools/python/python-paho-mqtt.inc         | 9 ++++-----
 meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb    | 3 +++
 meta-python/recipes-devtools/python/python-pandas_0.22.0.bb      | 1 -
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc    | 1 -
 .../recipes-devtools/python/python-prompt-toolkit_1.0.15.bb      | 4 ++++
 meta-python/recipes-devtools/python/python-psutil.inc            | 1 -
 meta-python/recipes-devtools/python/python-psutil_5.4.3.bb       | 4 ++++
 meta-python/recipes-devtools/python/python-pyasn1.inc            | 1 -
 meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb       | 4 ++++
 meta-python/recipes-devtools/python/python-pycparser.inc         | 1 -
 meta-python/recipes-devtools/python/python-pycparser_2.18.bb     | 4 ++++
 meta-python/recipes-devtools/python/python-pyinotify.inc         | 1 -
 meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb    | 4 ++++
 meta-python/recipes-devtools/python/python-pyperclip.inc         | 1 -
 meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb    | 5 ++++-
 meta-python/recipes-devtools/python/python-pyroute2.inc          | 2 --
 meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb    | 4 ++++
 meta-python/recipes-devtools/python/python-pyserial.inc          | 1 -
 meta-python/recipes-devtools/python/python-pyserial_3.4.bb       | 2 +-
 meta-python/recipes-devtools/python/python-pytest-runner.inc     | 2 +-
 meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb  | 2 +-
 meta-python/recipes-devtools/python/python-pytest.inc            | 1 -
 meta-python/recipes-devtools/python/python-pytest_3.3.2.bb       | 1 +
 meta-python/recipes-devtools/python/python-pyudev.inc            | 1 -
 meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb      | 1 +
 meta-python/recipes-devtools/python/python-setuptools-scm.inc    | 2 +-
 .../recipes-devtools/python/python-setuptools-scm_1.15.7.bb      | 2 ++
 meta-python/recipes-devtools/python/python-simplejson.inc        | 1 -
 meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb  | 2 ++
 meta-python/recipes-devtools/python/python-tornado.inc           | 2 +-
 meta-python/recipes-devtools/python/python-tornado_4.5.3.bb      | 7 ++++++-
 meta-python/recipes-devtools/python/python-werkzeug.inc          | 1 -
 meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb    | 5 ++++-
 meta-python/recipes-devtools/python/python-whoosh.inc            | 1 -
 meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb       | 4 ++++
 meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb | 2 --
 meta-python/recipes-devtools/python/python3-automat_0.6.0.bb     | 2 --
 meta-python/recipes-devtools/python/python3-click_6.7.bb         | 2 --
 .../recipes-devtools/python/python3-cryptography_2.1.4.bb        | 4 ----
 meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb   | 4 ----
 meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb  | 2 --
 meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb  | 2 --
 meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb    | 4 ----
 meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb  | 3 ---
 meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb    | 5 -----
 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-ply_3.10.bb          | 4 ----
 .../recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb     | 2 --
 meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb     | 3 ---
 meta-python/recipes-devtools/python/python3-pyserial_3.4.bb      | 2 --
 meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb     | 2 --
 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb     | 6 ------
 meta-python/recipes-devtools/python/python3-serpent_1.23.bb      | 1 -
 meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb | 2 +-
 meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb    | 2 --
 .../recipes-devtools/python/python3-vcversioner_2.16.0.0.bb      | 4 ----
 meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb      | 2 --
 meta-python/recipes-extended/python-pyparted/python-pyparted.inc | 1 -
 .../recipes-extended/python-pyparted/python-pyparted_3.11.1.bb   | 2 +-
 100 files changed, 125 insertions(+), 128 deletions(-)

-- 
2.7.4


