Return-Path: <pbasista@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 673176C613
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 01:52:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v6so10826044wrr.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 17:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IymzDgyAnE81kunQQmQH9o1/c+Jn+23/aZCbMEgyQeM=;
	b=tqr2PCBHiWSi6m0PegmQ1QU1KL/lE+Q10qPKAgRPpZ3FNSV8+M5Y7bb50f8CpX2L9b
	a3/N6WxGEH6pwQWU9ViRXFNdI99PmwXrvPkiwDAvDQPu2JHTnq123QAgb9z7g9lApnqi
	/kj3gj4+SL10ptGEzimB/KKiQ04WKdCrgcCptWFRseAHgU02A8LdRc1kXIujExTANgW3
	+s5lIbdgVuJ4qe3dExbQTZi73ldr9CHaZwGzbALkjGq85f8vPa7G5ZKCKwVBCV+zDwv2
	nA4ZDsLyKjrr/sfwzJnIcShLPk4S0Y1MPEIDQL7Q4D4y2kPMxYJwC4no3yBJxMRrteRD
	V89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IymzDgyAnE81kunQQmQH9o1/c+Jn+23/aZCbMEgyQeM=;
	b=W1j85cBqvvdjkcifFmW2eZoZuiqCk7G7HoG0FEsBmYCRF2FYV5P8c2j1BRx7u/VelR
	i330496Uy7x+Q10JNolMLgx8YTXsEfGrzFuirJO9yEWJwOTHHpN314JwEIXwUUEkvTCX
	PPPc9g0eTw1kLuX+CHHnij8PI27ZqJRDSldujsi65xzq48sLMhKjIg8YvC5arnYimZLX
	1PkeBu870AX8Z6EDzweUMZ1R77o1dKwGkb5LaLmi5D51wi6PmDz/NBs/OypmyS4jct7x
	pXSLJaLa4rDVzFYhwX5gSnFkpomwdQjL0XaExYoxHmpbrAg6xxpdZhVpLXUKcrTwDSrN
	oUCg==
X-Gm-Message-State: AA+aEWZaeTgrB9HJkqJKTgVvXNzrPjXUGgjdMY+UZZuScYxn76Y/wwKf
	edZJSmDW9s8hGvzJWeNE0MWmeBXd9bI=
X-Google-Smtp-Source: AFSGD/VPWTZ8GqqNSNbMtr89712q1BYlXFmmIWCpBws+dGxg8i/vr3cIyQTp7amCo1KW9wGwrB1Syw==
X-Received: by 2002:adf:9d85:: with SMTP id p5mr11311488wre.41.1542937978022; 
	Thu, 22 Nov 2018 17:52:58 -0800 (PST)
Received: from localhost.localdomain (nat-88-212-40-130.antik.sk.
	[88.212.40.130]) by smtp.gmail.com with ESMTPSA id
	11-v6sm6732979wms.24.2018.11.22.17.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 17:52:57 -0800 (PST)
From: =?UTF-8?q?Peter=20Ba=C5=A1ista?= <pbasista@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2018 02:52:48 +0100
Message-Id: <20181123015248.32729-1-pbasista@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Peter=20Ba=C5=A1ista?= <pbasista@gmail.com>
Subject: [meta-multimedia][PATCH v3] Add a working Tvheadend recipe
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
X-List-Received-Date: Fri, 23 Nov 2018 01:52:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The original one was previously removed
by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
as part of a clean-up of blacklisted recipes.

Signed-off-by: Peter Bašista <pbasista@gmail.com>
---
 .../recipes-dvb/tvheadend/tvheadend_git.bb    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
new file mode 100644
index 000000000..11f496432
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Tvheadend: TV streaming server and recorder"
+HOMEPAGE = "https://tvheadend.org/"
+
+inherit gettext gitpkgv pkgconfig
+
+DEPENDS = "avahi cmake-native libdvbcsa libpcre2 openssl uriparser zlib"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
+
+SRC_URI = "git://github.com/tvheadend/tvheadend.git"
+
+SRCREV = "ccd64e698a38adb7f712a841bc3dc4480bb97dfb"
+PV = "4.3+git${SRCPV}"
+PKGV = "4.3+git${GITPKGV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "${PACKAGECONFIG_CONFARGS} \
+                 --prefix=${prefix} \
+                 --libdir=${libdir} \
+                 --bindir=${bindir} \
+                 --datadir=${datadir} \
+                 --arch=${TARGET_ARCH} \
+                 --disable-hdhomerun_static \
+                 --disable-ffmpeg_static \
+                 --disable-libav \
+                 "
+
+do_configure() {
+    ${S}/configure ${EXTRA_OECONF}
+}
-- 
2.19.1


