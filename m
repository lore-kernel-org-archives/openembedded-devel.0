Return-Path: <matt.hoosier@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id EB1B3784B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 12:27:39 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 76so30093837ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hA38zDIKQJX2D7nBqylSGkVNEloif8atBWQyLJg4+bI=;
	b=lLkHCYUXRmoLBnKLZR+Y71TVm6BiMRjbmZ7vVcHFby50CMdI/z2/lxogNvCoDIZJ5z
	x/uVQ/DQZ39HZZ24ra0nH5gNTDtj73Hv6CPGZ/BsYuXFcuk6T3vtiZN38AYeVDqXbkJU
	LyDyB0wFg/a5nrkNDZjZCDw9ASF/tEWpyiqa98T5NO9wPD1uJ7aZq7lGr42mUxCaOCvh
	NWgrfIAiEQbLjEQ2fQ/BnerTY1ZGh6zORC2NvVQCw7s2EjbgIOFsaDINVKK3m0BaEkbR
	IMkf02uIHDXH9q0VWCGhq1dqMiZZMbixzUHFu8joC8AopkGT3NdUMrsEpkX2yY9MX+07
	p78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hA38zDIKQJX2D7nBqylSGkVNEloif8atBWQyLJg4+bI=;
	b=kL+W0LUUOHr5kjFA+wF/PeyyYB2uy33xyyLmLI4G+jxJh/EjOAuPHcjRNliv3zclcN
	/UReaPlI6cbICDBH3mCkZIyOuVQNu7qzj8JcL4Ubsa+TC0xjUJjatrqoYWgWDnPidNJN
	9IbdDA3buOQZBqemDPhQOaeeZcZNok4By6u1xHW4tYLHC/7o2H/0OXDOXTDR/tiEdaGi
	T8vNO3tM9YUIgPp3ilq8ylWSf52OaIOs9TG5MJRefHgUE/TXbU/+eHY8QZPnhdfYfZOG
	LIpMK0klb30LimvxsChGfp7/O/sYOr6tdnVYLiTym6JvTqgdHjo8Et0hqfO4LGT1KrIn
	87Rw==
X-Gm-Message-State: AHYfb5hmTxObeU6DrCO9/KtBOHdPghuqd6RpdyhUhqpEaIZqwtl5Rnl8
	HALT1pmEZErNjJm16sg=
X-Received: by 10.36.104.142 with SMTP id v136mr1551757itb.11.1502972860766;
	Thu, 17 Aug 2017 05:27:40 -0700 (PDT)
Received: from MattHoosiersMBP.home ([136.63.212.18])
	by smtp.gmail.com with ESMTPSA id g5sm1416956ioe.14.2017.08.17.05.27.40
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Thu, 17 Aug 2017 05:27:40 -0700 (PDT)
From: Matt Hoosier <matt.hoosier@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Aug 2017 07:27:33 -0500
Message-Id: <20170817122733.5027-1-matt.hoosier@gmail.com>
X-Mailer: git-send-email 2.12.0
MIME-Version: 1.0
Cc: Matt Hoosier <matt.hoosier@garmin.com>
Subject: [meta-qt5][PATCH] qtbase: fix Krogoth build regression from efa8aaf
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
X-List-Received-Date: Thu, 17 Aug 2017 12:27:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Matt Hoosier <matt.hoosier@garmin.com>

With

    commit efa8aaf82e580a7d32eaaab48eb92d436f2e222a
    Author: Andreas Müller <schnitzeltony@googlemail.com>
    Date:   Thu Feb  9 00:26:09 2017

    qmake5_base.bbclass: set qt.conf by environment variable again

we stopped pointing ${OE_QMAKE_QTCONF_PATH} at a valid file and
instead directed it to a path which was intended not to exist.

The motivation was to permit qtbase/qtbase-native/nativesdk-qtbase
to build again after Qt 5.8 started paying attention to the
contents of this file.

The change as done in efa8aaf works well enough for Morty and
subsequent releases' copies of Bitbake, but fails on earlier
releases because they lack the following change:

    commit 2afcbfef2cd1ca568e5225884a8021df38ee3db0
    Author: Ross Burton <ross.burton@intel.com>
    Date: 2016-07-14 13:56:22

    bitbake: build: don't use $B as the default cwd for functions

The result is that when we build with Krogoth or prior, the body
of do_generate_qt_config_file() runs with a cwd of ${B}, which was
_not_ the intent of efa8aaf. Because the working directory is ${B},
${OE_QMAKE_QTCONF_PATH} is written in there too. do_configure() --
whose cwd is by design also ${B} -- then finds the file 'foodummy',
and the build breaks for the reasons outlined in efa8aaf.

This change simply shifts the implementation tactics to suppress
the creation of ${OE_QMAKE_QTCONF_PATH} during qtbase rather than rely
on unspecified behavior about the cwd of do_generate_qt_config_file().

(cherry picked from commit a17ff281aa8d99f770b0a049cb798235005fb93e
at https://codereview.qt-project.org/yocto/meta-qt5.)
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
 recipes-qt/qt5/qtbase_git.bb           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index f2ff5f7..ffbb917 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -94,7 +94,7 @@ OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
 
 # for qtbase configuration we need default settings
 # since we cannot set empty set filename to a not existent file
-export OE_QMAKE_QTCONF_PATH = "foodummy"
+deltask generate_qt_config_file
 
 do_configure() {
     ${S}/configure -v \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 98cbecc..0884a19 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -79,7 +79,7 @@ PACKAGECONFIG_CONFARGS = " \
 
 # for qtbase configuration we need default settings
 # since we cannot set empty set filename to a not existent file
-export OE_QMAKE_QTCONF_PATH = "foodummy"
+deltask generate_qt_config_file
 
 do_configure_prepend() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5cfbcfa..a2e8917 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -137,7 +137,7 @@ QT_CONFIG_FLAGS += " \
 
 # for qtbase configuration we need default settings
 # since we cannot set empty set filename to a not existent file
-export OE_QMAKE_QTCONF_PATH = "foodummy"
+deltask generate_qt_config_file
 
 do_configure() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
-- 
2.12.0


