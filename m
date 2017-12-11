Return-Path: <zuloch@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id D114478740
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 12:47:33 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id k61so17426190wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 04:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zmeEZT8yVRkJJlDIU6ne8+Hlf4JrnI+qzAj5r0X1lV0=;
	b=suWzPFVWw0dAymxCksJqII0qqQL9O7qsVVtOYY9+UUAcJaQpdwQXL3WycgIdTGBpWu
	omOOBxK20TgRULG1PD3R1cEq5rwwG+qmCgMnTRjvrV8DlMuVgXqLne5sOaH7lI1uqZLX
	CaL3CBtuatpUOSx4fsXAbcK89JcgkPs6ratx9yaUiLu3ZBtw5hb8ExhGDILkjVp+0hgd
	c2tGCLtGvp1W3AfvvqsI9lKbiVCL5FslRfcLLAOHREgS4yynbBkwskccFKmdgWWbcqHD
	auvoVrNmCUwZCVLg1C1zJyB7MCd9SlLyIDavCke/iI5WZA8B9Whs8YvC1B3qQesPyEJ0
	oqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zmeEZT8yVRkJJlDIU6ne8+Hlf4JrnI+qzAj5r0X1lV0=;
	b=kkfXiRgDFdllK3p5Y5jLC6Cv7e3hBHhx4Fe+HnrDv3FJc56frwNQdYOKXswSlc4yeM
	nlQMeumArmpN3HbFzsHvnc3P+QAAueNQuz9UF+k24tKCZTnAKX2g9W/bCK0S4Dgbk8qO
	boy1sLMaKwqIfdJw+J9qw1ZnV0JRa+uly+BY5pZdGjG59uU2bHDOHz4n02+7vUYFHJXP
	Ou8FnCrhIZrHCGIvpN4ve4XcTLBZsDVA/jmgq+8CdrD3EKQvY4olWRoV2pMuatJgJ4yC
	qP64FgAI2Zj/+BbgJS2Xf8PSThymIxq/3tUOMGlCgOnVjfOD5bYJA2aT7xqZjfCV0R6U
	HwAQ==
X-Gm-Message-State: AKGB3mKZKGdJVgeCefhHR+oHy5i/uzT6xxDsPiYEBjpXr6cJxBumoKHL
	qKzDxMjS8ZtkZYD9GBbX/5J86UHe
X-Google-Smtp-Source: ACJfBou3xxGBj1msUObK5VL+w5HLvypINx9Vcp3dO+FikF6R71izMl+OPzNkCq3T/npMt8FA8AHtJg==
X-Received: by 10.223.181.150 with SMTP id c22mr347451wre.0.1512996454295;
	Mon, 11 Dec 2017 04:47:34 -0800 (PST)
Received: from euler.artgroup.local
	(host186-31-static.47-85-b.business.telecomitalia.it. [85.47.31.186])
	by smtp.gmail.com with ESMTPSA id 19sm9718141wmn.15.2017.12.11.04.47.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Dec 2017 04:47:33 -0800 (PST)
From: Lorenzo Chianura <zuloch@gmail.com>
X-Google-Original-From: Lorenzo Chianura <lorenzo.chianura@abinsula.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Dec 2017 13:46:58 +0100
Message-Id: <20171211124658.6989-1-lorenzo.chianura@abinsula.com>
X-Mailer: git-send-email 2.15.1
Cc: Lorenzo Chianura <lorenzo.chianura@abinsula.com>
Subject: [meta-qt5][PATCH] qt5: add export of STRIP variable, to fix build in release mode
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
X-List-Received-Date: Mon, 11 Dec 2017 12:47:34 -0000

Using Qt based SDK for stripping ARM binaries results in errors.
Generated Makefile contains:

  STRIP         =

but due to the missing export of OE_QMAKE_STRIP variable STRIP will be unset and
no strip will be perfomed:

  install -m 755 -p lib/libSigUdev.so.1.0.0 /opt/poky/2.2.1/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/lib/libSigUdev.so.1.0.0
  strip-unneeded /opt/poky/2.2.1/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/lib/libSigUdev.so.1.0.0
  make: strip-unneeded: Command not found
  Makefile:576: recipe for target 'install_target' failed
  make: [install_target] Error 127 (ignored)

adding OE_QMAKE_STRIP= to generated qt5.sh solve the issue.
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 87bd501..ef8b729 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -179,6 +179,7 @@ fakeroot do_generate_qt_environment_file() {
     echo 'export OE_QMAKE_CXX=$CXX' >> $script
     echo 'export OE_QMAKE_LINK=$CXX' >> $script
     echo 'export OE_QMAKE_AR=$AR' >> $script
+    echo 'export OE_QMAKE_STRIP=$STRIP' >> $script
     echo 'export QT_CONF_PATH=${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
     echo 'export OE_QMAKE_LIBDIR_QT=`qmake -query QT_INSTALL_LIBS`' >> $script
     echo 'export OE_QMAKE_INCDIR_QT=`qmake -query QT_INSTALL_HEADERS`' >> $script
-- 
2.15.1


