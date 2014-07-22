Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id CC90870735
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:28:36 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id la4so97486vcb.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=msGYgavpnn+uo5949cwl3lwqu51rTf0NVoKipZNm8OM=;
	b=FlIAFFiIfe6skeesUPVdeNMDcZ4q8NQP4jRj9chVNqDYGVcXY4qZGyqHZ6Pjm++QUe
	lOEisGssDQrnAPe1Is3fCp8xh305hOcrjva7kff1GnMwkp4Yd+iE9dp6r4Dz4jbutPsL
	m+tCxcXTpTXoejKYOi3z+h6X6vLRma5vovaUQxUziJ4r1m0sOx7hIh/x8fyDMx5ba2IR
	JB10jAV/PVgDOEE0jorO6DtqK9rInIZ1TCW4P0PAnyusuJ0DnMTukfw1VqMijjEbL6S3
	tH0Mg/BrngKFTERyaA76mAJNVWUBCSs6wI2CvgFXxK1a6HqFXHmxvvmiTDVPCLcNxwiI
	dESQ==
X-Received: by 10.221.66.67 with SMTP id xp3mr26120225vcb.44.1406053717440;
	Tue, 22 Jul 2014 11:28:37 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id td8sm1419504vdc.5.2014.07.22.11.28.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:28:36 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 11:28:28 -0700
Message-Id: <1406053708-24207-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-python][PATCH] meta-python: fix conf/layer.conf, follow typical structure
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
X-List-Received-Date: Tue, 22 Jul 2014 18:28:43 -0000

Intended structure was meta-python/recipes-python/*.bb, but
this is not typical. Rather, let's follow the typical structure
and have meta-python/recipes-python/<package>/python-<package>.bb

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/conf/layer.conf                                           | 4 ++--
 .../recipes-python/{python => autobahn}/python-autobahn_0.8.6.bb      | 0
 .../recipes-python/{python => cheetah}/python-cheetah_2.4.4.bb        | 0
 .../recipes-python/{python => cloudeebus}/python-cloudeebus_0.6.0.bb  | 0
 meta-python/recipes-python/{python => cython}/python-cython_0.20.2.bb | 0
 .../recipes-python/{python => dateutil}/python-dateutil_1.5.bb        | 0
 meta-python/recipes-python/{python => epydoc}/python-epydoc_3.0.1.bb  | 0
 .../recipes-python/{python => feedparser}/python-feedparser_5.1.3.bb  | 0
 meta-python/recipes-python/{python => gdata}/python-gdata_1.2.4.bb    | 0
 meta-python/recipes-python/{python => gevent}/python-gevent_0.13.8.bb | 0
 .../recipes-python/{python => greenlet}/python-greenlet_0.4.1.bb      | 0
 .../recipes-python/{python => ldap}/python-ldap/setup.cfg.patch       | 0
 meta-python/recipes-python/{python => ldap}/python-ldap_2.3.9.bb      | 0
 meta-python/recipes-python/{python => lxml}/python-lxml_3.0.2.bb      | 0
 .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch       | 0
 .../recipes-python/{python => m2crypto}/python-m2crypto_0.21.1.bb     | 0
 .../{python => matplotlib}/python-matplotlib/fix_setup.patch          | 0
 .../{python => matplotlib}/python-matplotlib/fix_setupext.patch       | 0
 .../recipes-python/{python => matplotlib}/python-matplotlib_1.1.0.bb  | 0
 .../recipes-python/{python => numeric}/python-numeric/no-lapack.patch | 0
 meta-python/recipes-python/{python => numeric}/python-numeric_24.2.bb | 0
 meta-python/recipes-python/{python => pexpect}/python-pexpect_2.3.bb  | 0
 meta-python/recipes-python/{python => pip}/python-pip_1.3.1.bb        | 0
 meta-python/recipes-python/{python => psutil}/python-psutil_0.6.1.bb  | 0
 .../recipes-python/{python => pyalsaaudio}/python-pyalsaaudio_0.4.bb  | 0
 meta-python/recipes-python/{python => pyrtm}/pyrtm_0.2.bb             | 0
 .../recipes-python/{python => pyserial}/python-pyserial_2.4.bb        | 0
 meta-python/recipes-python/{python => pyudev}/python-pyudev_0.16.1.bb | 0
 meta-python/recipes-python/{python => pyusb}/python-pyusb_1.0.0a2.bb  | 0
 meta-python/recipes-python/{python => pyyaml}/python-pyyaml/setup.py  | 0
 meta-python/recipes-python/{python => pyyaml}/python-pyyaml_3.10.bb   | 0
 meta-python/recipes-python/{python => smbus}/python-smbus_3.0.3.bb    | 0
 .../recipes-python/{python => sqlalchemy}/python-sqlalchemy_0.7.9.bb  | 0
 .../recipes-python/{python => twisted}/python-twisted_13.2.0.bb       | 0
 .../recipes-python/{python => vobject}/python-vobject_0.8.1c.bb       | 0
 meta-python/recipes-python/{python => webdav}/python-webdav_0.1.2.bb  | 0
 .../{python => zopeinterface}/python-zopeinterface_4.1.1.bb           | 0
 37 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-python/{python => autobahn}/python-autobahn_0.8.6.bb (100%)
 rename meta-python/recipes-python/{python => cheetah}/python-cheetah_2.4.4.bb (100%)
 rename meta-python/recipes-python/{python => cloudeebus}/python-cloudeebus_0.6.0.bb (100%)
 rename meta-python/recipes-python/{python => cython}/python-cython_0.20.2.bb (100%)
 rename meta-python/recipes-python/{python => dateutil}/python-dateutil_1.5.bb (100%)
 rename meta-python/recipes-python/{python => epydoc}/python-epydoc_3.0.1.bb (100%)
 rename meta-python/recipes-python/{python => feedparser}/python-feedparser_5.1.3.bb (100%)
 rename meta-python/recipes-python/{python => gdata}/python-gdata_1.2.4.bb (100%)
 rename meta-python/recipes-python/{python => gevent}/python-gevent_0.13.8.bb (100%)
 rename meta-python/recipes-python/{python => greenlet}/python-greenlet_0.4.1.bb (100%)
 rename meta-python/recipes-python/{python => ldap}/python-ldap/setup.cfg.patch (100%)
 rename meta-python/recipes-python/{python => ldap}/python-ldap_2.3.9.bb (100%)
 rename meta-python/recipes-python/{python => lxml}/python-lxml_3.0.2.bb (100%)
 rename meta-python/recipes-python/{python => m2crypto}/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch (100%)
 rename meta-python/recipes-python/{python => m2crypto}/python-m2crypto_0.21.1.bb (100%)
 rename meta-python/recipes-python/{python => matplotlib}/python-matplotlib/fix_setup.patch (100%)
 rename meta-python/recipes-python/{python => matplotlib}/python-matplotlib/fix_setupext.patch (100%)
 rename meta-python/recipes-python/{python => matplotlib}/python-matplotlib_1.1.0.bb (100%)
 rename meta-python/recipes-python/{python => numeric}/python-numeric/no-lapack.patch (100%)
 rename meta-python/recipes-python/{python => numeric}/python-numeric_24.2.bb (100%)
 rename meta-python/recipes-python/{python => pexpect}/python-pexpect_2.3.bb (100%)
 rename meta-python/recipes-python/{python => pip}/python-pip_1.3.1.bb (100%)
 rename meta-python/recipes-python/{python => psutil}/python-psutil_0.6.1.bb (100%)
 rename meta-python/recipes-python/{python => pyalsaaudio}/python-pyalsaaudio_0.4.bb (100%)
 rename meta-python/recipes-python/{python => pyrtm}/pyrtm_0.2.bb (100%)
 rename meta-python/recipes-python/{python => pyserial}/python-pyserial_2.4.bb (100%)
 rename meta-python/recipes-python/{python => pyudev}/python-pyudev_0.16.1.bb (100%)
 rename meta-python/recipes-python/{python => pyusb}/python-pyusb_1.0.0a2.bb (100%)
 rename meta-python/recipes-python/{python => pyyaml}/python-pyyaml/setup.py (100%)
 rename meta-python/recipes-python/{python => pyyaml}/python-pyyaml_3.10.bb (100%)
 rename meta-python/recipes-python/{python => smbus}/python-smbus_3.0.3.bb (100%)
 rename meta-python/recipes-python/{python => sqlalchemy}/python-sqlalchemy_0.7.9.bb (100%)
 rename meta-python/recipes-python/{python => twisted}/python-twisted_13.2.0.bb (100%)
 rename meta-python/recipes-python/{python => vobject}/python-vobject_0.8.1c.bb (100%)
 rename meta-python/recipes-python/{python => webdav}/python-webdav_0.1.2.bb (100%)
 rename meta-python/recipes-python/{python => zopeinterface}/python-zopeinterface_4.1.1.bb (100%)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 4e8eca3..db9ec2b 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -1,8 +1,8 @@
 # We might have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
-# We have recipes directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "meta-python"
 BBFILE_PATTERN_meta-python := "^${LAYERDIR}/"
diff --git a/meta-python/recipes-python/python/python-autobahn_0.8.6.bb b/meta-python/recipes-python/autobahn/python-autobahn_0.8.6.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-autobahn_0.8.6.bb
rename to meta-python/recipes-python/autobahn/python-autobahn_0.8.6.bb
diff --git a/meta-python/recipes-python/python/python-cheetah_2.4.4.bb b/meta-python/recipes-python/cheetah/python-cheetah_2.4.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-cheetah_2.4.4.bb
rename to meta-python/recipes-python/cheetah/python-cheetah_2.4.4.bb
diff --git a/meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb b/meta-python/recipes-python/cloudeebus/python-cloudeebus_0.6.0.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-cloudeebus_0.6.0.bb
rename to meta-python/recipes-python/cloudeebus/python-cloudeebus_0.6.0.bb
diff --git a/meta-python/recipes-python/python/python-cython_0.20.2.bb b/meta-python/recipes-python/cython/python-cython_0.20.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-cython_0.20.2.bb
rename to meta-python/recipes-python/cython/python-cython_0.20.2.bb
diff --git a/meta-python/recipes-python/python/python-dateutil_1.5.bb b/meta-python/recipes-python/dateutil/python-dateutil_1.5.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-dateutil_1.5.bb
rename to meta-python/recipes-python/dateutil/python-dateutil_1.5.bb
diff --git a/meta-python/recipes-python/python/python-epydoc_3.0.1.bb b/meta-python/recipes-python/epydoc/python-epydoc_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-epydoc_3.0.1.bb
rename to meta-python/recipes-python/epydoc/python-epydoc_3.0.1.bb
diff --git a/meta-python/recipes-python/python/python-feedparser_5.1.3.bb b/meta-python/recipes-python/feedparser/python-feedparser_5.1.3.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-feedparser_5.1.3.bb
rename to meta-python/recipes-python/feedparser/python-feedparser_5.1.3.bb
diff --git a/meta-python/recipes-python/python/python-gdata_1.2.4.bb b/meta-python/recipes-python/gdata/python-gdata_1.2.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-gdata_1.2.4.bb
rename to meta-python/recipes-python/gdata/python-gdata_1.2.4.bb
diff --git a/meta-python/recipes-python/python/python-gevent_0.13.8.bb b/meta-python/recipes-python/gevent/python-gevent_0.13.8.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-gevent_0.13.8.bb
rename to meta-python/recipes-python/gevent/python-gevent_0.13.8.bb
diff --git a/meta-python/recipes-python/python/python-greenlet_0.4.1.bb b/meta-python/recipes-python/greenlet/python-greenlet_0.4.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-greenlet_0.4.1.bb
rename to meta-python/recipes-python/greenlet/python-greenlet_0.4.1.bb
diff --git a/meta-python/recipes-python/python/python-ldap/setup.cfg.patch b/meta-python/recipes-python/ldap/python-ldap/setup.cfg.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-ldap/setup.cfg.patch
rename to meta-python/recipes-python/ldap/python-ldap/setup.cfg.patch
diff --git a/meta-python/recipes-python/python/python-ldap_2.3.9.bb b/meta-python/recipes-python/ldap/python-ldap_2.3.9.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-ldap_2.3.9.bb
rename to meta-python/recipes-python/ldap/python-ldap_2.3.9.bb
diff --git a/meta-python/recipes-python/python/python-lxml_3.0.2.bb b/meta-python/recipes-python/lxml/python-lxml_3.0.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-lxml_3.0.2.bb
rename to meta-python/recipes-python/lxml/python-lxml_3.0.2.bb
diff --git a/meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-python/m2crypto/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
rename to meta-python/recipes-python/m2crypto/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
diff --git a/meta-python/recipes-python/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-python/m2crypto/python-m2crypto_0.21.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-m2crypto_0.21.1.bb
rename to meta-python/recipes-python/m2crypto/python-m2crypto_0.21.1.bb
diff --git a/meta-python/recipes-python/python/python-matplotlib/fix_setup.patch b/meta-python/recipes-python/matplotlib/python-matplotlib/fix_setup.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-matplotlib/fix_setup.patch
rename to meta-python/recipes-python/matplotlib/python-matplotlib/fix_setup.patch
diff --git a/meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-python/matplotlib/python-matplotlib/fix_setupext.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-matplotlib/fix_setupext.patch
rename to meta-python/recipes-python/matplotlib/python-matplotlib/fix_setupext.patch
diff --git a/meta-python/recipes-python/python/python-matplotlib_1.1.0.bb b/meta-python/recipes-python/matplotlib/python-matplotlib_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-matplotlib_1.1.0.bb
rename to meta-python/recipes-python/matplotlib/python-matplotlib_1.1.0.bb
diff --git a/meta-python/recipes-python/python/python-numeric/no-lapack.patch b/meta-python/recipes-python/numeric/python-numeric/no-lapack.patch
similarity index 100%
rename from meta-python/recipes-python/python/python-numeric/no-lapack.patch
rename to meta-python/recipes-python/numeric/python-numeric/no-lapack.patch
diff --git a/meta-python/recipes-python/python/python-numeric_24.2.bb b/meta-python/recipes-python/numeric/python-numeric_24.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-numeric_24.2.bb
rename to meta-python/recipes-python/numeric/python-numeric_24.2.bb
diff --git a/meta-python/recipes-python/python/python-pexpect_2.3.bb b/meta-python/recipes-python/pexpect/python-pexpect_2.3.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pexpect_2.3.bb
rename to meta-python/recipes-python/pexpect/python-pexpect_2.3.bb
diff --git a/meta-python/recipes-python/python/python-pip_1.3.1.bb b/meta-python/recipes-python/pip/python-pip_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pip_1.3.1.bb
rename to meta-python/recipes-python/pip/python-pip_1.3.1.bb
diff --git a/meta-python/recipes-python/python/python-psutil_0.6.1.bb b/meta-python/recipes-python/psutil/python-psutil_0.6.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-psutil_0.6.1.bb
rename to meta-python/recipes-python/psutil/python-psutil_0.6.1.bb
diff --git a/meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb b/meta-python/recipes-python/pyalsaaudio/python-pyalsaaudio_0.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyalsaaudio_0.4.bb
rename to meta-python/recipes-python/pyalsaaudio/python-pyalsaaudio_0.4.bb
diff --git a/meta-python/recipes-python/python/pyrtm_0.2.bb b/meta-python/recipes-python/pyrtm/pyrtm_0.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/pyrtm_0.2.bb
rename to meta-python/recipes-python/pyrtm/pyrtm_0.2.bb
diff --git a/meta-python/recipes-python/python/python-pyserial_2.4.bb b/meta-python/recipes-python/pyserial/python-pyserial_2.4.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyserial_2.4.bb
rename to meta-python/recipes-python/pyserial/python-pyserial_2.4.bb
diff --git a/meta-python/recipes-python/python/python-pyudev_0.16.1.bb b/meta-python/recipes-python/pyudev/python-pyudev_0.16.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyudev_0.16.1.bb
rename to meta-python/recipes-python/pyudev/python-pyudev_0.16.1.bb
diff --git a/meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb b/meta-python/recipes-python/pyusb/python-pyusb_1.0.0a2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyusb_1.0.0a2.bb
rename to meta-python/recipes-python/pyusb/python-pyusb_1.0.0a2.bb
diff --git a/meta-python/recipes-python/python/python-pyyaml/setup.py b/meta-python/recipes-python/pyyaml/python-pyyaml/setup.py
similarity index 100%
rename from meta-python/recipes-python/python/python-pyyaml/setup.py
rename to meta-python/recipes-python/pyyaml/python-pyyaml/setup.py
diff --git a/meta-python/recipes-python/python/python-pyyaml_3.10.bb b/meta-python/recipes-python/pyyaml/python-pyyaml_3.10.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-pyyaml_3.10.bb
rename to meta-python/recipes-python/pyyaml/python-pyyaml_3.10.bb
diff --git a/meta-python/recipes-python/python/python-smbus_3.0.3.bb b/meta-python/recipes-python/smbus/python-smbus_3.0.3.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-smbus_3.0.3.bb
rename to meta-python/recipes-python/smbus/python-smbus_3.0.3.bb
diff --git a/meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb b/meta-python/recipes-python/sqlalchemy/python-sqlalchemy_0.7.9.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-sqlalchemy_0.7.9.bb
rename to meta-python/recipes-python/sqlalchemy/python-sqlalchemy_0.7.9.bb
diff --git a/meta-python/recipes-python/python/python-twisted_13.2.0.bb b/meta-python/recipes-python/twisted/python-twisted_13.2.0.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-twisted_13.2.0.bb
rename to meta-python/recipes-python/twisted/python-twisted_13.2.0.bb
diff --git a/meta-python/recipes-python/python/python-vobject_0.8.1c.bb b/meta-python/recipes-python/vobject/python-vobject_0.8.1c.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-vobject_0.8.1c.bb
rename to meta-python/recipes-python/vobject/python-vobject_0.8.1c.bb
diff --git a/meta-python/recipes-python/python/python-webdav_0.1.2.bb b/meta-python/recipes-python/webdav/python-webdav_0.1.2.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-webdav_0.1.2.bb
rename to meta-python/recipes-python/webdav/python-webdav_0.1.2.bb
diff --git a/meta-python/recipes-python/python/python-zopeinterface_4.1.1.bb b/meta-python/recipes-python/zopeinterface/python-zopeinterface_4.1.1.bb
similarity index 100%
rename from meta-python/recipes-python/python/python-zopeinterface_4.1.1.bb
rename to meta-python/recipes-python/zopeinterface/python-zopeinterface_4.1.1.bb
-- 
1.9.3


