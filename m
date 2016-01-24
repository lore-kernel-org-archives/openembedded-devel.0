Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 798A1769F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:17:58 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id u128so4302922qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WaeoM90xE5He1UAfGAmB3szprvwDTnHHdmyByXEyX+c=;
	b=TEF2WuHQKTucR7CL462W0NUs3nvvvWX3qUve+L26I2pVh9/0zqcp+cHbm0U/WiBZ85
	HcgDL04UBx/P94eh73XeObb0dce8bk2oCiUB4Ala6lcV5DH1jFJtrB+icr7Nsj6t7ahZ
	DjPKibiFZAJWuSlkTQODrxjbEsd/NmQkeexI24XY3QV237zUjqxaRCIyML8qHEfBB4d/
	kUYSCESLHU9qmpOWmDPkaivVfJ0AmcCOm0Sa2jtRCCgkRpL44IYAce/W4F4/r2ebhCC1
	u6PsvImjjEOoPIlCwV06czs700lC8b1jkIiu333yr5eA7rJyZhA39MA0JeFY/qJCJup0
	xFXg==
X-Gm-Message-State: AG10YOSVF3kOfFrhAz08wx6+WT0srcN9lvI1xRt5l8UmIz8WiVnkucNW9v1aA3Yh923+1Q==
X-Received: by 10.55.77.148 with SMTP id a142mr15112968qkb.44.1453641478906;
	Sun, 24 Jan 2016 05:17:58 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.17.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:17:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:33 -0500
Message-Id: <cover.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 00/13] Python pypi standardization and recipe updates
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
X-List-Received-Date: Sun, 24 Jan 2016 13:17:58 -0000

Updates to the python recipes to standardize on pypi class for all packages having sources hosted on pypi

Bring several recipes up to latest releases of their respective packages

The following changes since commit b866e0ac90075f9b12f2c9486bd7baed5f1376d9:

  dhcpcd: add recipe for dhcpcd (2016-01-20 19:13:43 +0100)

are available in the git repository at:

  git://github.com/derekstraka/meta-openembedded update-python-recipes
  https://github.com/derekstraka/meta-openembedded/tree/update-python-recipes

Derek Straka (13):
  meta-python: update pypi class to avoid setuptool inherit to be more
    flexible
  Update python recipes to use the common pypi package
  pyrtm: update to 0.4.2
  python-cython: update to 0.23.4
  python-decorator: update to 4.0.6
  python-lxml: update to 3.5.0
  python-pyserial: update to 3.0.1
  python-backports-ssl: update to 3.5.0.1
  python-certifi: update to 2015.11.20.1
  python-cmd2: update to 0.6.8
  python-daemonize: update to 2.4.2
  python-feedparser: update to 5.2.1
  python-flufl-enum: update to 4.1

 meta-python/classes/pypi.bbclass                       |  8 ++++----
 .../python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb}            | 11 +++++------
 .../recipes-devtools/python/python-autobahn_0.8.6.bb   |  8 ++------
 ...-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} | 18 ++++++------------
 .../recipes-devtools/python/python-bitarray_0.8.1.bb   |  9 +--------
 ...tifi_14.05.14.bb => python-certifi_2015.11.20.1.bb} | 15 ++++-----------
 .../recipes-devtools/python/python-cffi_1.3.1.bb       |  3 +--
 .../recipes-devtools/python/python-chardet_2.3.0.bb    |  2 +-
 .../recipes-devtools/python/python-cheetah_2.4.4.bb    | 12 ++++--------
 .../{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb}     | 15 +++------------
 .../recipes-devtools/python/python-cryptography_1.1.bb | 10 +++-------
 meta-python/recipes-devtools/python/python-cython.inc  | 14 +++++++-------
 ...python-cython_0.23.1.bb => python-cython_0.23.4.bb} |  0
 ...on-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb} |  7 +++----
 .../recipes-devtools/python/python-decorator.inc       | 11 ++++-------
 ...on-decorator_4.0.2.bb => python-decorator_4.0.6.bb} |  0
 .../python/python-django-south_1.0.2.bb                |  9 ++-------
 .../recipes-devtools/python/python-django_1.6.10.bb    |  9 ++-------
 .../recipes-devtools/python/python-enum34_1.0.4.bb     |  2 +-
 .../recipes-devtools/python/python-feedparser_5.1.3.bb | 14 --------------
 .../recipes-devtools/python/python-feedparser_5.2.1.bb |  9 +++++++++
 ...on-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} | 18 +++++-------------
 .../recipes-devtools/python/python-gevent_0.13.8.bb    |  7 +------
 .../recipes-devtools/python/python-greenlet_0.4.7.bb   | 11 ++++-------
 .../recipes-devtools/python/python-html5lib_0.999.bb   |  8 +-------
 .../recipes-devtools/python/python-iso8601_0.1.10.bb   |  2 +-
 .../recipes-devtools/python/python-jinja2_2.7.3.bb     | 10 ++--------
 .../recipes-devtools/python/python-jsonpatch_1.12.bb   | 14 ++------------
 .../recipes-devtools/python/python-jsonpointer_1.10.bb | 13 ++-----------
 .../recipes-devtools/python/python-ldap_2.3.9.bb       |  6 ++----
 .../recipes-devtools/python/python-ldap_2.4.10.bb      |  2 --
 meta-python/recipes-devtools/python/python-lxml.inc    | 11 +++++------
 .../{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb}     |  0
 .../recipes-devtools/python/python-m2crypto_0.21.1.bb  |  8 ++++----
 .../recipes-devtools/python/python-markupsafe_0.23.bb  |  9 ++-------
 .../recipes-devtools/python/python-mccabe_0.2.1.bb     | 11 +----------
 .../recipes-devtools/python/python-mock_1.0.1.bb       | 12 +-----------
 .../recipes-devtools/python/python-monotonic_0.4.bb    |  2 +-
 .../recipes-devtools/python/python-msgpack_0.4.5.bb    | 10 ++--------
 .../recipes-devtools/python/python-paho-mqtt_1.1.bb    |  2 +-
 .../recipes-devtools/python/python-paste_2.0.2.bb      | 13 ++++---------
 .../recipes-devtools/python/python-pep8_1.4.6.bb       | 11 +----------
 .../recipes-devtools/python/python-pip_7.1.2.bb        |  6 +-----
 .../recipes-devtools/python/python-pretend_1.0.8.bb    |  2 +-
 .../python/python-prettytable_0.7.2.bb                 | 11 ++---------
 .../recipes-devtools/python/python-psutil_2.2.1.bb     |  2 +-
 .../recipes-devtools/python/python-py_1.4.26.bb        |  2 +-
 .../recipes-devtools/python/python-pyasn1_0.1.9.bb     |  7 +------
 .../recipes-devtools/python/python-pycparser_2.10.bb   |  2 +-
 .../recipes-devtools/python/python-pyflakes_0.7.3.bb   | 11 +----------
 .../recipes-devtools/python/python-pygpgme_0.3.bb      |  7 ++-----
 .../recipes-devtools/python/python-pyinotify.inc       |  8 +++-----
 .../recipes-devtools/python/python-pyopenssl_0.15.1.bb |  9 ++-------
 .../recipes-devtools/python/python-pyparsing_2.0.3.bb  | 11 ++---------
 .../recipes-devtools/python/python-pyroute2_0.3.14.bb  |  2 +-
 .../recipes-devtools/python/python-pyserial.inc        | 15 +++++++--------
 ...python-pyserial_2.7.bb => python-pyserial_3.0.1.bb} |  0
 .../recipes-devtools/python/python-pytest_2.7.0.bb     |  2 +-
 .../recipes-devtools/python/python-pytz_2015.4.bb      |  6 +-----
 .../recipes-devtools/python/python-pyudev_0.16.1.bb    |  8 +-------
 .../recipes-devtools/python/python-pyzmq_14.7.0.bb     | 10 +++-------
 .../recipes-devtools/python/python-requests_2.7.0.bb   |  9 +--------
 .../recipes-devtools/python/python-six_1.9.0.bb        |  2 +-
 .../recipes-devtools/python/python-snakefood_1.4.bb    |  7 +------
 .../recipes-devtools/python/python-tornado_4.3.bb      |  9 +--------
 .../recipes-devtools/python/python-twisted_13.2.0.bb   |  8 ++++----
 .../recipes-devtools/python/python-ujson_1.33.bb       | 12 +++---------
 .../python/python-vcversioner_2.14.0.0.bb              |  5 +----
 .../python/python-zopeinterface_4.1.1.bb               |  8 +++-----
 ...thon3-cython_0.23.1.bb => python3-cython_0.23.4.bb} |  0
 ...3-decorator_4.0.2.bb => python3-decorator_4.0.6.bb} |  0
 .../{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb}   |  0
 ...thon3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} |  0
 73 files changed, 151 insertions(+), 396 deletions(-)
 rename meta-python/recipes-devtools/python/{pyrtm_0.2.bb => pyrtm_0.4.2.bb} (40%)
 rename meta-python/recipes-devtools/python/{python-backports-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} (57%)
 rename meta-python/recipes-devtools/python/{python-certifi_14.05.14.bb => python-certifi_2015.11.20.1.bb} (54%)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb} (40%)
 rename meta-python/recipes-devtools/python/{python-cython_0.23.1.bb => python-cython_0.23.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb} (67%)
 rename meta-python/recipes-devtools/python/{python-decorator_4.0.2.bb => python-decorator_4.0.6.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
 rename meta-python/recipes-devtools/python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} (57%)
 rename meta-python/recipes-devtools/python/{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-pyserial_2.7.bb => python-pyserial_3.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.0.2.bb => python3-decorator_4.0.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_2.7.bb => python3-pyserial_3.0.1.bb} (100%)

-- 
1.9.1


