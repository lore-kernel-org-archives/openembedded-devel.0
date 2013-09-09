Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 34D066BCEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2013 07:05:31 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id x55so3809189wes.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Sep 2013 00:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=coK1lQCy13umKZF7SZbuCDHJ4fKzwh0NRehEb2hKHW8=;
	b=jd04DwUbb/t+Bb2z8SS4zmwQWVjbhN5kyr1dB4hm0tma17m4pUApUwqQnJiwfFQLPQ
	b0CW3nvESkbfyNJIdvLVAx7CeVVzJfHN59yefShjQnX/pZmFMBvMYbEArahJWxdv0skw
	a0G5Yi3G4sdsWvCwTOh0BD0lp+aAqaxjU6fiQorz/upamxNQfNElxtIzLvoZjAzWsif8
	YaroAJ7y39NLkcLRCtZFLpynNNLKk4ySkNVfIAec7GPSLUtqUYu7k8MVYmKqil0gwPl7
	ku8Ea+wNlnWD+XmCOcSFkmeXcxh3XMV947stDldsyf2Lv0WcrBW1kFb1RMx+TwiC/y54
	RbCg==
X-Gm-Message-State: ALoCoQlPRuqMFZaHlgYZx+UKq671jCm7NwdWQRcWsK3ZvE4u8kwsg+NM8Obt+Z9JMZlHIq+DsxwX
X-Received: by 10.180.98.163 with SMTP id ej3mr7165702wib.47.1378710332214;
	Mon, 09 Sep 2013 00:05:32 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by mx.google.com with ESMTPSA id
	iz19sm12302537wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 00:05:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Sep 2013 09:05:18 +0200
Message-Id: <1378710318-18248-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1378710318-18248-1-git-send-email-koen@dominion.thruhere.net>
References: <1378710318-18248-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/2] wxpython: add 2.9.5.0
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
X-List-Received-Date: Mon, 09 Sep 2013 07:05:31 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Same deal as with the wxwidgets recipe: don't apply this, just posting this.

 .../recipes-graphics/wxwidgets/wxpython_2.9.5.0.bb | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/wxwidgets/wxpython_2.9.5.0.bb

diff --git a/meta-oe/recipes-graphics/wxwidgets/wxpython_2.9.5.0.bb b/meta-oe/recipes-graphics/wxwidgets/wxpython_2.9.5.0.bb
new file mode 100644
index 0000000..dea79f4
--- /dev/null
+++ b/meta-oe/recipes-graphics/wxwidgets/wxpython_2.9.5.0.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "wxWidgets is a cross platform application framework utilizing native python."
+HOMEPAGE = "http://www.wxpython.org"
+
+LICENSE = "wxWindows"
+LIC_FILES_CHKSUM = "file://licence/licence.txt;md5=18346072db6eb834b6edbd2cdc4f109b"
+
+DEPENDS = "wxwidgets"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/wxpython/wxPython-src-${PV}.tar.bz2"
+SRC_URI[md5sum] = "a2a28fe8223391c93bf8788316767c9e"
+SRC_URI[sha256sum] = "1a5b7e771eff467538d0834136188e8a7506a4fe6e85d0a46c40158cdbd4c48c"
+
+S = "${WORKDIR}/wxPython-src-${PV}/wxPython"
+
+inherit pkgconfig pythonnative python-dir setuptools
+
+CFLAGS += "-I${STAGING_INCDIR}/wx-2.9/ -I${STAGING_LIBDIR}/wx/include/${TARGET_PREFIX}gtk2-unicode-2.9/"
+
+# Enable output on stdout for buildpaths
+export WXDEBUG = "findprogress"
+
+# remove -L/usr/X11R6/lib hardcodes
+do_configure_prepend() {
+	sed -i -e s:/usr/X11R6/lib::g ${S}/config.py
+}
+
+# e.g. ${D}/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone/usr/include/wx-2.9/wx/wxPython/pytree.h
+
+do_install_append() {
+    cp -a ${D}${STAGING_DIR_HOST}/* ${D}
+    rm -rf ${D}${STAGING_DIR}	
+}
-- 
1.8.2.1


