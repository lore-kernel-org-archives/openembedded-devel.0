Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 96E026E630
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:08 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id c67so8514752qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HPAjPgq0uleYeiHsnzXaT1Bl5kGUFAwSfw+uiR+KbQY=;
	b=YNVNuc+aM6ClwSnBrvGAPmDZcY0q7hOONZXznMXMptuL4iKbDElIoTE8TvmhTN5DkQ
	W+wvJGFKsR2TEbwykmaZJRWySnT7CcJSDAisw4i5AUd41/EprNu0KeUhS1VBEMLGwmk5
	kvMFdv+PBx8KRYMGIsVoJ085niEWhgn3drGwfzWhyfcxNKkkMkCdL7TWe+hDzaPFAYdU
	8SouMbRL4ybAEPra7CPx4mzztgGofkD6J2X8FnD1dw2JiysOiWLq1ow1+3T4cr62144i
	ucwWRFi5uIVbYc2xhggv2xblVVtJp1PNNhux8rKkhK6UoUl8NasZALJmnIwcRntBVYCh
	oubQ==
X-Gm-Message-State: AD7BkJJrzjWnGGpTwYgQcs8fxxyOkI4dR4mJbCMgz9dmcB310Yy1LS+voIFDob3PaXKCmg==
X-Received: by 10.140.100.246 with SMTP id s109mr23515877qge.35.1458997509161; 
	Sat, 26 Mar 2016 06:05:09 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:20 -0400
Message-Id: <cover.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 00/30] Updates current python packages to theeir respective latest versions
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:11 -0000

The set of patches brings most of the packages in meta-python up to the current released version.

The following changes since commit bf8f27af3954ab68e39712516ab515de90b4db27:

  gstreamer: fix argument parsing when using Bison 3 (2016-03-25 11:36:42 +0100)

are available in the git repository at:

  git://github.com/derekstraka/meta-openembedded more-python-update
  https://github.com/derekstraka/meta-openembedded/tree/more-python-update

Derek Straka (30):
  python-dateutil: update to 2.5.1
  python-lxml: update to 3.6.0
  python-cython: update to 0.23.4
  python-certifi: update to 2016.2.28
  python-pymongo: update to 3.2.2
  python-werkzeug: update to 0.11.5
  python-whoosh: update to 2.7.3
  python-cffi: update to 1.5.2
  python-cmd2: update to 0.6.8
  python-daemonize: update to 2.4.6
  python-evdev: update to 0.6.0
  python-html5lib: update to 0.9999999
  python-iso8601: update to 0.1.11
  python-jsonpatch: update to 1.13
  python-monotonic: update to 1.0
  python-paste: update to 2.0.3
  python-pep8: update to 1.7.0
  python-pip: update to 8.1.1
  python-psutil: update to 4.1.0
  python-py: update to 1.4.31
  python-pycparser: update to 2.14
  python-pyflakes: update to 1.1.0
  python-pymisp: update to 2.3
  python-pyparsing: update to 2.1.1
  python-pytest: update to 2.9.1
  python-pytz: update to 2016.3
  python-pyudev: update to 0.19.0
  python-pyyaml: update to 3.11
  python-sparts: update to version 0.7.3
  python-urllib3: update to 1.14

 meta-python/recipes-devtools/python/python-certifi.inc         |  4 ++--
 ...hon-certifi_2015.11.20.1.bb => python-certifi_2016.2.28.bb} |  0
 .../python/{python-cffi_1.3.1.bb => python-cffi_1.5.2.bb}      |  4 ++--
 .../python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb}      |  4 ++--
 meta-python/recipes-devtools/python/python-cython.inc          |  4 ++--
 .../{python-cython_0.23.1.bb => python-cython_0.23.4.bb}       |  0
 .../{python-daemonize_2.4.2.bb => python-daemonize_2.4.6.bb}   |  4 ++--
 meta-python/recipes-devtools/python/python-dateutil.inc        |  4 ++--
 .../{python-dateutil_2.4.2.bb => python-dateutil_2.5.1.bb}     |  0
 .../python/{python-evdev_0.5.0.bb => python-evdev_0.6.0.bb}    |  7 ++++---
 .../{python-html5lib_0.999.bb => python-html5lib_0.9999999.bb} |  4 ++--
 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb   |  8 --------
 meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb   |  8 ++++++++
 .../{python-jsonpatch_1.12.bb => python-jsonpatch_1.13.bb}     |  4 ++--
 meta-python/recipes-devtools/python/python-lxml.inc            |  4 ++--
 .../python/{python-lxml_3.5.0.bb => python-lxml_3.6.0.bb}      |  0
 .../{python-monotonic_0.6.bb => python-monotonic_1.0.bb}       |  4 ++--
 .../python/{python-paste_2.0.2.bb => python-paste_2.0.3.bb}    |  4 ++--
 .../python/{python-pep8_1.4.6.bb => python-pep8_1.7.0.bb}      |  6 +++---
 .../python/{python-pip_7.1.2.bb => python-pip_8.1.1.bb}        |  6 +++---
 .../python/{python-psutil_2.2.1.bb => python-psutil_4.1.0.bb}  |  4 ++--
 .../python/{python-py_1.4.26.bb => python-py_1.4.31.bb}        |  4 ++--
 meta-python/recipes-devtools/python/python-pycparser_2.10.bb   | 10 ----------
 meta-python/recipes-devtools/python/python-pycparser_2.14.bb   | 10 ++++++++++
 .../{python-pyflakes_1.0.0.bb => python-pyflakes_1.1.0.bb}     |  6 +++---
 meta-python/recipes-devtools/python/python-pymisp.inc          | 10 +++-------
 .../python/{python3-pymisp_2.2.bb => python-pymisp_2.3.bb}     |  2 +-
 meta-python/recipes-devtools/python/python-pymongo.inc         |  4 ++--
 .../python/{python-pymongo_3.2.bb => python-pymongo_3.2.2.bb}  |  0
 .../{python-pyparsing_2.0.3.bb => python-pyparsing_2.1.1.bb}   |  4 ++--
 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb     | 10 ----------
 meta-python/recipes-devtools/python/python-pytest_2.9.1.bb     | 10 ++++++++++
 .../python/{python-pytz_2015.4.bb => python-pytz_2016.3.bb}    |  4 ++--
 .../{python-pyudev_0.16.1.bb => python-pyudev_0.19.0.bb}       |  4 ++--
 .../python/{python-pyyaml_3.10.bb => python-pyyaml_3.11.bb}    |  4 ++--
 .../python/{python-sparts_0.7.2.bb => python-sparts_0.7.3.bb}  |  9 +++------
 .../{python-urllib3_1.10.1.bb => python-urllib3_1.14.bb}       | 10 +++-------
 meta-python/recipes-devtools/python/python-werkzeug.inc        |  4 ++--
 .../{python-werkzeug_0.11.3.bb => python-werkzeug_0.11.5.bb}   |  0
 meta-python/recipes-devtools/python/python-whoosh.inc          |  5 +++--
 .../python/{python-whoosh_2.7.0.bb => python-whoosh_2.7.3.bb}  |  0
 ...n3-certifi_2015.11.20.1.bb => python3-certifi_2016.2.28.bb} |  0
 .../{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb}     |  0
 .../{python3-dateutil_2.4.2.bb => python3-dateutil_2.5.1.bb}   |  0
 .../python/{python3-lxml_3.5.0.bb => python3-lxml_3.6.0.bb}    |  0
 .../python/{python-pymisp_2.2.bb => python3-pymisp_2.3.bb}     |  2 +-
 .../{python3-pymongo_3.2.bb => python3-pymongo_3.2.2.bb}       |  0
 .../{python3-werkzeug_0.11.3.bb => python3-werkzeug_0.11.5.bb} |  0
 .../{python3-whoosh_2.7.0.bb => python3-whoosh_2.7.3.bb}       |  0
 49 files changed, 93 insertions(+), 102 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2015.11.20.1.bb => python-certifi_2016.2.28.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-cffi_1.3.1.bb => python-cffi_1.5.2.bb} (63%)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb} (66%)
 rename meta-python/recipes-devtools/python/{python-cython_0.23.1.bb => python-cython_0.23.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.2.bb => python-daemonize_2.4.6.bb} (72%)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.4.2.bb => python-dateutil_2.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-evdev_0.5.0.bb => python-evdev_0.6.0.bb} (50%)
 rename meta-python/recipes-devtools/python/{python-html5lib_0.999.bb => python-html5lib_0.9999999.bb} (55%)
 delete mode 100644 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.12.bb => python-jsonpatch_1.13.bb} (67%)
 rename meta-python/recipes-devtools/python/{python-lxml_3.5.0.bb => python-lxml_3.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-monotonic_0.6.bb => python-monotonic_1.0.bb} (64%)
 rename meta-python/recipes-devtools/python/{python-paste_2.0.2.bb => python-paste_2.0.3.bb} (68%)
 rename meta-python/recipes-devtools/python/{python-pep8_1.4.6.bb => python-pep8_1.7.0.bb} (50%)
 rename meta-python/recipes-devtools/python/{python-pip_7.1.2.bb => python-pip_8.1.1.bb} (55%)
 rename meta-python/recipes-devtools/python/{python-psutil_2.2.1.bb => python-psutil_4.1.0.bb} (63%)
 rename meta-python/recipes-devtools/python/{python-py_1.4.26.bb => python-py_1.4.31.bb} (58%)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycparser_2.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pycparser_2.14.bb
 rename meta-python/recipes-devtools/python/{python-pyflakes_1.0.0.bb => python-pyflakes_1.1.0.bb} (51%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.2.bb => python-pymisp_2.3.bb} (52%)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.2.bb => python-pymongo_3.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-pyparsing_2.0.3.bb => python-pyparsing_2.1.1.bb} (60%)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
 rename meta-python/recipes-devtools/python/{python-pytz_2015.4.bb => python-pytz_2016.3.bb} (67%)
 rename meta-python/recipes-devtools/python/{python-pyudev_0.16.1.bb => python-pyudev_0.19.0.bb} (73%)
 rename meta-python/recipes-devtools/python/{python-pyyaml_3.10.bb => python-pyyaml_3.11.bb} (78%)
 rename meta-python/recipes-devtools/python/{python-sparts_0.7.2.bb => python-sparts_0.7.3.bb} (76%)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.10.1.bb => python-urllib3_1.14.bb} (51%)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.11.3.bb => python-werkzeug_0.11.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-whoosh_2.7.0.bb => python-whoosh_2.7.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2015.11.20.1.bb => python3-certifi_2016.2.28.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.4.2.bb => python3-dateutil_2.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.5.0.bb => python3-lxml_3.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.2.bb => python3-pymisp_2.3.bb} (50%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.2.bb => python3-pymongo_3.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.11.3.bb => python3-werkzeug_0.11.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-whoosh_2.7.0.bb => python3-whoosh_2.7.3.bb} (100%)

-- 
1.9.1


