Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE2170442
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 23:33:10 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id id10so225072vcb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LZJzL+BVJuJBpPWWY0uASD7H0Z2yMrBbJTG2j0tEoJA=;
	b=lKsDVdU5aOvgbZ4+wu2HeNSiZKmPQsIR8/vF1J2XnO7Le3SdJc22Nk4wcv36yRQT8/
	BPyWU8JMeTR0EF0ElKx1Y5yLwTuUZgArhv95SSvfaml0LC403YNjGQOEtg7l/MZ3vUY/
	Gz7yvzxuap3Cri/fXlBR3bgfay47ik0HXiUBXG9TbWl1BxH3dk3YJTuRl1WvtZvwsi6e
	xzEvGX4yi2a9m4y1PRhSu85TruO/f74KOdByR7iOT/eGyjhTAZ5N5OPDoqPEabTioXC1
	Sda0rQ/Qnoa2DX5hkL8wb5/4vQyFFAx+gRJM4VeQMyzxkr5efHt4/SPS9bI4mCBtkW/w
	tT7g==
X-Received: by 10.52.135.226 with SMTP id pv2mr9564852vdb.33.1405467191653;
	Tue, 15 Jul 2014 16:33:11 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id
	xb3sm27742505vdb.14.2014.07.15.16.33.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 16:33:10 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 16:32:34 -0700
Message-Id: <a6acceb1dc1d391e20c3722e685aa7c9cca313b3.1405465524.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1405465524.git.TicoTimo@gmail.com>
References: <cover.1405465524.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1405465524.git.TicoTimo@gmail.com>
References: <cover.1405465524.git.TicoTimo@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 2/2] meta-python: move recipes from meta-oe
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
X-List-Received-Date: Tue, 15 Jul 2014 23:33:11 -0000

     * Move recipes from meta-openembedded/meta-oe that are not
       depended upon by recipes already in meta-oe (e.g. gateone,
       anki)

     * Recipes NOT moved:
     	 python-futures
	 python-pyopenssl
	 python-simplejson
	 python-tornado
	 python-pyqt
	 python-sip

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-devtools/python => meta-python/recipes-python}/pyrtm_0.2.bb   | 0
 .../python => meta-python/recipes-python}/python-autobahn_0.8.6.bb        | 0
 .../python => meta-python/recipes-python}/python-cheetah_2.4.4.bb         | 0
 .../python => meta-python/recipes-python}/python-cloudeebus_0.6.0.bb      | 0
 .../python => meta-python/recipes-python}/python-cython_0.20.2.bb         | 0
 .../python => meta-python/recipes-python}/python-dateutil_1.5.bb          | 0
 .../python => meta-python/recipes-python}/python-epydoc_3.0.1.bb          | 0
 .../python => meta-python/recipes-python}/python-feedparser_5.1.3.bb      | 0
 .../python => meta-python/recipes-python}/python-gdata_1.2.4.bb           | 0
 .../python => meta-python/recipes-python}/python-gevent_0.13.8.bb         | 0
 .../python => meta-python/recipes-python}/python-greenlet_0.4.1.bb        | 0
 .../python => meta-python/recipes-python}/python-ldap/setup.cfg.patch     | 0
 .../python => meta-python/recipes-python}/python-ldap_2.3.9.bb            | 0
 .../python => meta-python/recipes-python}/python-lxml_3.0.2.bb            | 0
 .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch           | 0
 .../python => meta-python/recipes-python}/python-m2crypto_0.21.1.bb       | 0
 .../recipes-python}/python-matplotlib/fix_setup.patch                     | 0
 .../recipes-python}/python-matplotlib/fix_setupext.patch                  | 0
 .../python => meta-python/recipes-python}/python-matplotlib_1.1.0.bb      | 0
 .../python => meta-python/recipes-python}/python-numeric/no-lapack.patch  | 0
 .../python => meta-python/recipes-python}/python-numeric_24.2.bb          | 0
 .../python => meta-python/recipes-python}/python-pexpect_2.3.bb           | 0
 .../python => meta-python/recipes-python}/python-pip_1.3.1.bb             | 0
 .../python => meta-python/recipes-python}/python-psutil_0.6.1.bb          | 0
 .../python => meta-python/recipes-python}/python-pyalsaaudio_0.4.bb       | 0
 .../python => meta-python/recipes-python}/python-pyserial_2.4.bb          | 0
 .../python => meta-python/recipes-python}/python-pyudev_0.16.1.bb         | 0
 .../python => meta-python/recipes-python}/python-pyusb_1.0.0a2.bb         | 0
 .../python => meta-python/recipes-python}/python-pyyaml/setup.py          | 0
 .../python => meta-python/recipes-python}/python-pyyaml_3.10.bb           | 0
 .../python => meta-python/recipes-python}/python-smbus_3.0.3.bb           | 0
 .../python => meta-python/recipes-python}/python-sqlalchemy_0.7.9.bb      | 0
 .../python => meta-python/recipes-python}/python-twisted_13.2.0.bb        | 0
 .../python => meta-python/recipes-python}/python-vobject_0.8.1c.bb        | 0
 .../python => meta-python/recipes-python}/python-webdav_0.1.2.bb          | 0
 .../python => meta-python/recipes-python}/python-zopeinterface_4.1.1.bb   | 0
 36 files changed, 0 insertions(+), 0 deletions(-)
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

diff --git a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb b/meta-python/recipes-python/pyrtm_0.2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/pyrtm_0.2.bb
rename to meta-python/recipes-python/pyrtm_0.2.bb
diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb b/meta-python/recipes-python/python-autobahn_0.8.6.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
rename to meta-python/recipes-python/python-autobahn_0.8.6.bb
diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-python/recipes-python/python-cheetah_2.4.4.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
rename to meta-python/recipes-python/python-cheetah_2.4.4.bb
diff --git a/meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb b/meta-python/recipes-python/python-cloudeebus_0.6.0.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb
rename to meta-python/recipes-python/python-cloudeebus_0.6.0.bb
diff --git a/meta-oe/recipes-devtools/python/python-cython_0.20.2.bb b/meta-python/recipes-python/python-cython_0.20.2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-cython_0.20.2.bb
rename to meta-python/recipes-python/python-cython_0.20.2.bb
diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb b/meta-python/recipes-python/python-dateutil_1.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
rename to meta-python/recipes-python/python-dateutil_1.5.bb
diff --git a/meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb b/meta-python/recipes-python/python-epydoc_3.0.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
rename to meta-python/recipes-python/python-epydoc_3.0.1.bb
diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb b/meta-python/recipes-python/python-feedparser_5.1.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
rename to meta-python/recipes-python/python-feedparser_5.1.3.bb
diff --git a/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb b/meta-python/recipes-python/python-gdata_1.2.4.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
rename to meta-python/recipes-python/python-gdata_1.2.4.bb
diff --git a/meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb b/meta-python/recipes-python/python-gevent_0.13.8.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-gevent_0.13.8.bb
rename to meta-python/recipes-python/python-gevent_0.13.8.bb
diff --git a/meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb b/meta-python/recipes-python/python-greenlet_0.4.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb
rename to meta-python/recipes-python/python-greenlet_0.4.1.bb
diff --git a/meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch b/meta-python/recipes-python/python-ldap/setup.cfg.patch
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
rename to meta-python/recipes-python/python-ldap/setup.cfg.patch
diff --git a/meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-python/recipes-python/python-ldap_2.3.9.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
rename to meta-python/recipes-python/python-ldap_2.3.9.bb
diff --git a/meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb b/meta-python/recipes-python/python-lxml_3.0.2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
rename to meta-python/recipes-python/python-lxml_3.0.2.bb
diff --git a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
rename to meta-python/recipes-python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-python/python-m2crypto_0.21.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
rename to meta-python/recipes-python/python-m2crypto_0.21.1.bb
diff --git a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch b/meta-python/recipes-python/python-matplotlib/fix_setup.patch
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch
rename to meta-python/recipes-python/python-matplotlib/fix_setup.patch
diff --git a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-python/python-matplotlib/fix_setupext.patch
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch
rename to meta-python/recipes-python/python-matplotlib/fix_setupext.patch
diff --git a/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb b/meta-python/recipes-python/python-matplotlib_1.1.0.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb
rename to meta-python/recipes-python/python-matplotlib_1.1.0.bb
diff --git a/meta-oe/recipes-devtools/python/python-numeric/no-lapack.patch b/meta-python/recipes-python/python-numeric/no-lapack.patch
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-numeric/no-lapack.patch
rename to meta-python/recipes-python/python-numeric/no-lapack.patch
diff --git a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb b/meta-python/recipes-python/python-numeric_24.2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-numeric_24.2.bb
rename to meta-python/recipes-python/python-numeric_24.2.bb
diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb b/meta-python/recipes-python/python-pexpect_2.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
rename to meta-python/recipes-python/python-pexpect_2.3.bb
diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-python/recipes-python/python-pip_1.3.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
rename to meta-python/recipes-python/python-pip_1.3.1.bb
diff --git a/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb b/meta-python/recipes-python/python-psutil_0.6.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
rename to meta-python/recipes-python/python-psutil_0.6.1.bb
diff --git a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb b/meta-python/recipes-python/python-pyalsaaudio_0.4.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
rename to meta-python/recipes-python/python-pyalsaaudio_0.4.bb
diff --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb b/meta-python/recipes-python/python-pyserial_2.4.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
rename to meta-python/recipes-python/python-pyserial_2.4.bb
diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-python/recipes-python/python-pyudev_0.16.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
rename to meta-python/recipes-python/python-pyudev_0.16.1.bb
diff --git a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb b/meta-python/recipes-python/python-pyusb_1.0.0a2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
rename to meta-python/recipes-python/python-pyusb_1.0.0a2.bb
diff --git a/meta-oe/recipes-devtools/python/python-pyyaml/setup.py b/meta-python/recipes-python/python-pyyaml/setup.py
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyyaml/setup.py
rename to meta-python/recipes-python/python-pyyaml/setup.py
diff --git a/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb b/meta-python/recipes-python/python-pyyaml_3.10.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
rename to meta-python/recipes-python/python-pyyaml_3.10.bb
diff --git a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb b/meta-python/recipes-python/python-smbus_3.0.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
rename to meta-python/recipes-python/python-smbus_3.0.3.bb
diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb b/meta-python/recipes-python/python-sqlalchemy_0.7.9.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
rename to meta-python/recipes-python/python-sqlalchemy_0.7.9.bb
diff --git a/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb b/meta-python/recipes-python/python-twisted_13.2.0.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
rename to meta-python/recipes-python/python-twisted_13.2.0.bb
diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb b/meta-python/recipes-python/python-vobject_0.8.1c.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
rename to meta-python/recipes-python/python-vobject_0.8.1c.bb
diff --git a/meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb b/meta-python/recipes-python/python-webdav_0.1.2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb
rename to meta-python/recipes-python/python-webdav_0.1.2.bb
diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb b/meta-python/recipes-python/python-zopeinterface_4.1.1.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
rename to meta-python/recipes-python/python-zopeinterface_4.1.1.bb
-- 
1.9.3


