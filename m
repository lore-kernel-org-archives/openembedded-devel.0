Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id CDC5B65DB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 23:32:55 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id im17so248803vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RwOC9gQbOon94k/QpnaQlQGVcduTX0OKz3MZnCoIAbg=;
	b=y3ZSoGv+KOiPlVWp/wZso7Tu/mcLLNEpmfuK8HFf0EvCyKX3o+P3Wk8PSpsv3vadqX
	EjjG1pWukyIFn3oOf7N49btX/1eGFP75I436Qh8e2lhJvAAlHbrtbUCkwWmU3+BShWPj
	v0JcIIrGHjWWJUy6D0JjglgXsVa7KSPRQ06NrQm+bRbAKAfC7u/+pWxHe0A/Z+litBF8
	fua2EGN4zWGOFJ38ZJAY+6eyi07QpNgNzHwMGl21S4D2OZMgPQEHyPr1xDovXXeqv/G4
	zBdURCkxBeJBKjtJO3hAJfiZfxcyZb2rOFiJGXbegCYop/icTOae0CXqj3EU4mI+EqU3
	sUOA==
X-Received: by 10.53.9.133 with SMTP id ds5mr3233500vdd.66.1405467175816;
	Tue, 15 Jul 2014 16:32:55 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id
	xb3sm27742505vdb.14.2014.07.15.16.32.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 16:32:54 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 16:32:32 -0700
Message-Id: <cover.1405465524.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 0/2] meta-python creation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 23:33:03 -0000

********
This layer is intended to be the home of python modules for OpenEmbedded.
Modules in this layer need to be independent of openembedded-core and
meta-openembedded/meta-oe. Because of this, modules required by 'gateone'
and 'anki' are not included and remain in:
        meta-openembedded/meta-oe/recipes-devtools/python.

Maintainers:
        Tim "moto-timo" Orling <TicoTimo@gmail.com>
        Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
********

The following changes since commit 239debcd8a0359aad64406476b801948f9b8ff14:

  usleep: add 1.0 recipe (2014-07-15 15:03:43 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib timo/meta-python
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=timo/meta-python

Tim Orling (2):
  meta-python: create layer
  meta-python: move recipes from meta-oe

 meta-python/COPYING.MIT                            | 17 +++++++
 meta-python/README                                 | 53 ++++++++++++++++++++++
 meta-python/conf/layer.conf                        |  9 ++++
 .../recipes-python}/pyrtm_0.2.bb                   |  0
 .../recipes-python}/python-autobahn_0.8.6.bb       |  0
 .../recipes-python}/python-cheetah_2.4.4.bb        |  0
 .../recipes-python}/python-cloudeebus_0.6.0.bb     |  0
 .../recipes-python}/python-cython_0.20.2.bb        |  0
 .../recipes-python}/python-dateutil_1.5.bb         |  0
 .../recipes-python}/python-epydoc_3.0.1.bb         |  0
 .../recipes-python}/python-feedparser_5.1.3.bb     |  0
 .../recipes-python}/python-gdata_1.2.4.bb          |  0
 .../recipes-python}/python-gevent_0.13.8.bb        |  0
 .../recipes-python}/python-greenlet_0.4.1.bb       |  0
 .../recipes-python}/python-ldap/setup.cfg.patch    |  0
 .../recipes-python}/python-ldap_2.3.9.bb           |  0
 .../recipes-python}/python-lxml_3.0.2.bb           |  0
 ...y-link-in-sysroot-not-in-host-directories.patch |  0
 .../recipes-python}/python-m2crypto_0.21.1.bb      |  0
 .../python-matplotlib/fix_setup.patch              |  0
 .../python-matplotlib/fix_setupext.patch           |  0
 .../recipes-python}/python-matplotlib_1.1.0.bb     |  0
 .../recipes-python}/python-numeric/no-lapack.patch |  0
 .../recipes-python}/python-numeric_24.2.bb         |  0
 .../recipes-python}/python-pexpect_2.3.bb          |  0
 .../recipes-python}/python-pip_1.3.1.bb            |  0
 .../recipes-python}/python-psutil_0.6.1.bb         |  0
 .../recipes-python}/python-pyalsaaudio_0.4.bb      |  0
 .../recipes-python}/python-pyserial_2.4.bb         |  0
 .../recipes-python}/python-pyudev_0.16.1.bb        |  0
 .../recipes-python}/python-pyusb_1.0.0a2.bb        |  0
 .../recipes-python}/python-pyyaml/setup.py         |  0
 .../recipes-python}/python-pyyaml_3.10.bb          |  0
 .../recipes-python}/python-smbus_3.0.3.bb          |  0
 .../recipes-python}/python-sqlalchemy_0.7.9.bb     |  0
 .../recipes-python}/python-twisted_13.2.0.bb       |  0
 .../recipes-python}/python-vobject_0.8.1c.bb       |  0
 .../recipes-python}/python-webdav_0.1.2.bb         |  0
 .../recipes-python}/python-zopeinterface_4.1.1.bb  |  0
 39 files changed, 79 insertions(+)
 create mode 100644 meta-python/COPYING.MIT
 create mode 100644 meta-python/README
 create mode 100644 meta-python/conf/layer.conf
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/pyrtm_0.2.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-autobahn_0.8.6.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-cheetah_2.4.4.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-cloudeebus_0.6.0.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-cython_0.20.2.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-dateutil_1.5.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-epydoc_3.0.1.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-feedparser_5.1.3.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-gdata_1.2.4.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-gevent_0.13.8.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-greenlet_0.4.1.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-ldap/setup.cfg.patch (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-ldap_2.3.9.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-lxml_3.0.2.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-m2crypto_0.21.1.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-matplotlib/fix_setup.patch (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-matplotlib/fix_setupext.patch (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-matplotlib_1.1.0.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-numeric/no-lapack.patch (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-numeric_24.2.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pexpect_2.3.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pip_1.3.1.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-psutil_0.6.1.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pyalsaaudio_0.4.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pyserial_2.4.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pyudev_0.16.1.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pyusb_1.0.0a2.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pyyaml/setup.py (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-pyyaml_3.10.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-smbus_3.0.3.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-sqlalchemy_0.7.9.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-twisted_13.2.0.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-vobject_0.8.1c.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-webdav_0.1.2.bb (100%)
 rename {meta-oe/recipes-devtools/python => meta-python/recipes-python}/python-zopeinterface_4.1.1.bb (100%)

-- 
1.9.3


