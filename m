Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD5E70588
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:34:45 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so8975437wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GJtzV7SQcHI7U4g4JLmOf5hN1W7Qlj/Ut6bYck0zf6Y=;
	b=dZBd7pLDbuyGe2ocS4Sj0G0ugmdSU5xy3Jpy76ASskpuhYKQJd0pmJ3Zk/TIQdWpnj
	dvPRNgyqqkIKg7HRz4/iHMMQF6knlN29/IZQLkCPdoTH+Hhfqkn1lMdlYjDuP2qHZROl
	ARioPiSsbppDWEsyPvFQdsL/pA5ui4X76k+G/Nt+ffSa9zB8Fc3GRGAjK+REBye4b1JU
	MsjW+wgJt8hZYbwgdOi48QsGuNdb7l3RiJqX70Ptpgt8erzIRAbKmKIPg9izBe76Altx
	MNimsNm4+Z7RuKl3WQRM0JsE8JSscjjzlFMNgAQAyG+UQgIOPs2YEu2RHxUw0FMpI7HF
	SKeg==
X-Received: by 10.194.2.132 with SMTP id 4mr33155399wju.49.1406028885920;
	Tue, 22 Jul 2014 04:34:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm1750064wic.17.2014.07.22.04.34.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 04:34:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 13:34:55 +0200
Message-Id: <1406028895-834-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1406028895-834-1-git-send-email-Martin.Jansa@gmail.com>
References: <1406028895-834-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] meta-python: rename recipes-python to recipes-devtools
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
X-List-Received-Date: Tue, 22 Jul 2014 11:34:53 -0000

* match old structure from meta-oe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/{recipes-python => recipes-devtools}/python/pyrtm_0.2.bb      | 0
 .../{recipes-python => recipes-devtools}/python/python-autobahn_0.8.6.bb  | 0
 .../{recipes-python => recipes-devtools}/python/python-cheetah_2.4.4.bb   | 0
 .../python/python-cloudeebus_0.6.0.bb                                     | 0
 .../{recipes-python => recipes-devtools}/python/python-cython_0.20.2.bb   | 0
 .../{recipes-python => recipes-devtools}/python/python-dateutil_1.5.bb    | 0
 .../{recipes-python => recipes-devtools}/python/python-epydoc_3.0.1.bb    | 0
 .../python/python-feedparser_5.1.3.bb                                     | 0
 .../{recipes-python => recipes-devtools}/python/python-gdata_1.2.4.bb     | 0
 .../{recipes-python => recipes-devtools}/python/python-gevent_0.13.8.bb   | 0
 .../{recipes-python => recipes-devtools}/python/python-greenlet_0.4.1.bb  | 0
 .../python/python-ldap/setup.cfg.patch                                    | 0
 .../{recipes-python => recipes-devtools}/python/python-ldap_2.3.9.bb      | 0
 .../{recipes-python => recipes-devtools}/python/python-lxml_3.0.2.bb      | 0
 .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch           | 0
 .../{recipes-python => recipes-devtools}/python/python-m2crypto_0.21.1.bb | 0
 .../python/python-matplotlib/fix_setup.patch                              | 0
 .../python/python-matplotlib/fix_setupext.patch                           | 0
 .../python/python-matplotlib_1.1.0.bb                                     | 0
 .../python/python-numeric/no-lapack.patch                                 | 0
 .../{recipes-python => recipes-devtools}/python/python-numeric_24.2.bb    | 0
 .../{recipes-python => recipes-devtools}/python/python-pexpect_2.3.bb     | 0
 .../{recipes-python => recipes-devtools}/python/python-pip_1.3.1.bb       | 0
 .../{recipes-python => recipes-devtools}/python/python-psutil_0.6.1.bb    | 0
 .../{recipes-python => recipes-devtools}/python/python-pyalsaaudio_0.4.bb | 0
 .../{recipes-python => recipes-devtools}/python/python-pyserial_2.4.bb    | 0
 .../{recipes-python => recipes-devtools}/python/python-pyudev_0.16.1.bb   | 0
 .../{recipes-python => recipes-devtools}/python/python-pyusb_1.0.0a2.bb   | 0
 .../{recipes-python => recipes-devtools}/python/python-pyyaml/setup.py    | 0
 .../{recipes-python => recipes-devtools}/python/python-pyyaml_3.10.bb     | 0
 .../{recipes-python => recipes-devtools}/python/python-smbus_3.0.3.bb     | 0
 .../python/python-sqlalchemy_0.7.9.bb                                     | 0
 .../{recipes-python => recipes-devtools}/python/python-twisted_13.2.0.bb  | 0
 .../{recipes-python => recipes-devtools}/python/python-vobject_0.8.1c.bb  | 0
 .../{recipes-python => recipes-devtools}/python/python-webdav_0.1.2.bb    | 0
 .../python/python-zopeinterface_4.1.1.bb                                  | 0
 36 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/{recipes-python => recipes-devtools}/python/pyrtm_0.2.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-autobahn_0.8.6.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-cheetah_2.4.4.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-cloudeebus_0.6.0.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-cython_0.20.2.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-dateutil_1.5.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-epydoc_3.0.1.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-feedparser_5.1.3.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-gdata_1.2.4.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-gevent_0.13.8.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-greenlet_0.4.1.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-ldap/setup.cfg.patch (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-ldap_2.3.9.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-lxml_3.0.2.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-m2crypto_0.21.1.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-matplotlib/fix_setup.patch (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-matplotlib/fix_setupext.patch (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-matplotlib_1.1.0.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-numeric/no-lapack.patch (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-numeric_24.2.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pexpect_2.3.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pip_1.3.1.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-psutil_0.6.1.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pyalsaaudio_0.4.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pyserial_2.4.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pyudev_0.16.1.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pyusb_1.0.0a2.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pyyaml/setup.py (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-pyyaml_3.10.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-smbus_3.0.3.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-sqlalchemy_0.7.9.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-twisted_13.2.0.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-vobject_0.8.1c.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-webdav_0.1.2.bb (100%)
 rename meta-python/{recipes-python => recipes-devtools}/python/python-zopeinterface_4.1.1.bb (100%)

diff --git a/meta-python/recipes-python/python/pyrtm_0.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/pyrtm_0.2.bb
rename to meta-python/recipes-devtools/python/pyrtm_0.2.bb
diff --git a/meta-python/recipes-python/python/python-autobahn_0.8.6.bb b/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-autobahn_0.8.6.bb
rename to meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
diff --git a/meta-python/recipes-python/python/python-cheetah_2.4.4.bb b/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-cheetah_2.4.4.bb
rename to meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
diff --git a/meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb
rename to meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
diff --git a/meta-python/recipes-python/python/python-cython_0.20.2.bb b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-cython_0.20.2.bb
rename to meta-python/recipes-devtools/python/python-cython_0.20.2.bb
diff --git a/meta-python/recipes-python/python/python-dateutil_1.5.bb b/meta-python/recipes-devtools/python/python-dateutil_1.5.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-dateutil_1.5.bb
rename to meta-python/recipes-devtools/python/python-dateutil_1.5.bb
diff --git a/meta-python/recipes-python/python/python-epydoc_3.0.1.bb b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-epydoc_3.0.1.bb
rename to meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
diff --git a/meta-python/recipes-python/python/python-feedparser_5.1.3.bb b/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-feedparser_5.1.3.bb
rename to meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
diff --git a/meta-python/recipes-python/python/python-gdata_1.2.4.bb b/meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-gdata_1.2.4.bb
rename to meta-python/recipes-devtools/python/python-gdata_1.2.4.bb
diff --git a/meta-python/recipes-python/python/python-gevent_0.13.8.bb b/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-gevent_0.13.8.bb
rename to meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
diff --git a/meta-python/recipes-python/python/python-greenlet_0.4.1.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-greenlet_0.4.1.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.1.bb
diff --git a/meta-python/recipes-python/python/python-ldap/setup.cfg.patch b/meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-ldap/setup.cfg.patch
rename to meta-python/recipes-devtools/python/python-ldap/setup.cfg.patch
diff --git a/meta-python/recipes-python/python/python-ldap_2.3.9.bb b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-ldap_2.3.9.bb
rename to meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
diff --git a/meta-python/recipes-python/python/python-lxml_3.0.2.bb b/meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-lxml_3.0.2.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
diff --git a/meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
rename to meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
diff --git a/meta-python/recipes-python/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
rename to meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
diff --git a/meta-python/recipes-python/python/python-matplotlib/fix_setup.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
rename to meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
diff --git a/meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
rename to meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
diff --git a/meta-python/recipes-python/python/python-matplotlib_1.1.0.bb b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-matplotlib_1.1.0.bb
rename to meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
diff --git a/meta-python/recipes-python/python/python-numeric/no-lapack.patch b/meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-numeric/no-lapack.patch
rename to meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
diff --git a/meta-python/recipes-python/python/python-numeric_24.2.bb b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-numeric_24.2.bb
rename to meta-python/recipes-devtools/python/python-numeric_24.2.bb
diff --git a/meta-python/recipes-python/python/python-pexpect_2.3.bb b/meta-python/recipes-devtools/python/python-pexpect_2.3.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pexpect_2.3.bb
rename to meta-python/recipes-devtools/python/python-pexpect_2.3.bb
diff --git a/meta-python/recipes-python/python/python-pip_1.3.1.bb b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pip_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-pip_1.3.1.bb
diff --git a/meta-python/recipes-python/python/python-psutil_0.6.1.bb b/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-psutil_0.6.1.bb
rename to meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
diff --git a/meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
rename to meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
diff --git a/meta-python/recipes-python/python/python-pyserial_2.4.bb b/meta-python/recipes-devtools/python/python-pyserial_2.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyserial_2.4.bb
rename to meta-python/recipes-devtools/python/python-pyserial_2.4.bb
diff --git a/meta-python/recipes-python/python/python-pyudev_0.16.1.bb b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyudev_0.16.1.bb
rename to meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
diff --git a/meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb b/meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
rename to meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
diff --git a/meta-python/recipes-python/python/python-pyyaml/setup.py b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
similarity index 100%
rename from meta-python/recipes-python/python/python-pyyaml/setup.py
rename to meta-python/recipes-devtools/python/python-pyyaml/setup.py
diff --git a/meta-python/recipes-python/python/python-pyyaml_3.10.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyyaml_3.10.bb
rename to meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
diff --git a/meta-python/recipes-python/python/python-smbus_3.0.3.bb b/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-smbus_3.0.3.bb
rename to meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
diff --git a/meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
diff --git a/meta-python/recipes-python/python/python-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-twisted_13.2.0.bb
rename to meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
diff --git a/meta-python/recipes-python/python/python-vobject_0.8.1c.bb b/meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-vobject_0.8.1c.bb
rename to meta-python/recipes-devtools/python/python-vobject_0.8.1c.bb
diff --git a/meta-python/recipes-python/python/python-webdav_0.1.2.bb b/meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-webdav_0.1.2.bb
rename to meta-python/recipes-devtools/python/python-webdav_0.1.2.bb
diff --git a/meta-python/recipes-python/python/python-zopeinterface_4.1.1.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-zopeinterface_4.1.1.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb
-- 
2.0.2


