Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id E403B77CF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:09:12 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id j90so29261242lfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RphhQd0FWe1F61hvdKNt7ghBA26qRMOxllAyMB59uwg=;
	b=nTD1T9+S7T0in/+zMVoK0jRXqr+kryXoM3AGh7Xn+RyVVpItMxdSEe/azjGYQRkHxy
	c+AZ1F5LhSlKbZAzXMpeKjs/HhM2UNJOcj8gaFW3/BXiE5R+ILEVc3jSHXpB6T8zqhRb
	tkwWnuU2yRGU1LPeg4DMwqv8gUevi35pA4C0n0rKOZ9reRi+7a1jxzCPTTRZoxsphJmL
	Wjsg/rEeefjpNTj8lPqWi9xbzrgvrjSWuIiOVYQ350nDbE2VU3ZxBY3Z5iCsxk4C+FhP
	RofJ6rMa47mdmf6wUPRbJ61fHoYT8niQhZtzHgzSqDpx9zAS56FLT2R76hlRuolvZd+/
	YcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RphhQd0FWe1F61hvdKNt7ghBA26qRMOxllAyMB59uwg=;
	b=iMWeqvaHxWoYvGmyR23RUqaNsVyqpx6QGnzylB/fnjpWJjy/gxP7KphN4D8pFr7CFA
	25M7Wdza05V8/RUtQ5GdsSOAJ5YFby8ry+bb7OVJ+F6kbHHgqxwXJGoO3SBRBsJ3nGkP
	w43NmMkstxoeryh8zbVzBs8A1LwVXj2FGlQAeWcYFDqIQNpp9YXJRh4Wdo1P6j7aMQrs
	zYQ5IqYHFzlVCFeQJPYoKu04PQnEIFuhrINrHZdANg59/1N7NA1f/oDnJZ5BoFxmxV6g
	F0uwsyu6dvLBhgZGi5NJ7NBPI/b5XAOEf+auCEGg5lpBR+308eqzC2qkT4TsqO4j0U82
	c7yA==
X-Gm-Message-State: AFeK/H3nA1SZ3fhipxfE/V3tlHL3ReBhxvDC3+tJUbGrIGGry3KasYLuea/O8ORz7ZjhfutK
X-Received: by 10.25.23.97 with SMTP id n94mr70966lfi.48.1490886553492;
	Thu, 30 Mar 2017 08:09:13 -0700 (PDT)
Received: from gordanmarkus-XPS13.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id 6sm426761ljw.11.2017.03.30.08.09.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 08:09:12 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Mar 2017 17:09:03 +0200
Message-Id: <20170330150903.26858-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH v2] qtbase-native: create empty oe-device-extra.pri
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
X-List-Received-Date: Thu, 30 Mar 2017 15:09:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Suppress multiple occurrences of the same warning while configuring
and compiling qtbase-native and nativesdk-qtbase.

WARNING: Unable to find file git/mkspecs/linux-oe-g++/../oe-device-extra.pri
Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 recipes-qt/qt5/qtbase-native_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index c013029..da69812 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -83,6 +83,9 @@ PACKAGECONFIG_CONFARGS = " \
 export OE_QMAKE_QTCONF_PATH = "foodummy"
 
 do_configure_prepend() {
+    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
+    touch ${S}/mkspecs/oe-device-extra.pri
+
     MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
 
-- 
2.9.3


