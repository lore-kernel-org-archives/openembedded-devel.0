Return-Path: <zuloch@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 90BCD780B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 18:19:43 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id v105so7530078wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 10:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zSvTRpjzBGKpDgP2Yy5CJ5Ed40zNb1+qxRmtnYZeJow=;
	b=jX9NSVFE4ZrlCxGC5j3ZmeXrKZXk3dpLiZVK1ZRBawx5pjpwmXJYHpwHWoYG+funuo
	ZCYaSpoIal1tDTo7YABFv9gm8VTqaJFax9wB/j/oIL7b+/QWCkq+3JC4aKwwbKR0KAUC
	4TLTHBW20JrKpn+0wSjA/U+4K5HtZuDnFHsreaGonIcQBJ5k9e/aLKoIKw4RHjHh3pfx
	Wzara5UaSjnmiB7GdbKg4k/jeoHqCRfNTlvaiB38UPUbOo42NaaMEdYkyTEGZFipkvOe
	BcgjingnBAQt69sEJbkzZ5oXVbvTpfxWhmaND+m7CmjF5forWIcRp5BP8ZkkBAAoJYdV
	Cx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zSvTRpjzBGKpDgP2Yy5CJ5Ed40zNb1+qxRmtnYZeJow=;
	b=rS3wzWwbcyIaEZTOH/2rVQsStgpDfZ11d6UMKHmECEiksKi2UW4jaG9mIhLqZtLD3t
	uINvPX3HiJJeCcVaP7/DwczqftynbR+ghKLarEZN6XiXvO/Kk1GtbvFBL90N04f/E18I
	P4tOSe8Z7WZAkXUB8XQnc+ARkUTOS8NqKR9tw2kwdtKnbTZkTkzDXxou2q1tGgMJIMTg
	lKfridA5wkihJ+PIyZ1rtHt0sDhrzF5Ptj5a6xmK++m3CKg9fepz7dpsvWQlUyIOP9rO
	moD7sKWdhyJY6FvIg9C/haQZmNy6OCPkch3tSZ7yBTNIGXBKT+Y0um6QLxWBpwOI/AIe
	kRVQ==
X-Gm-Message-State: AJaThX7HrCoFef29HVz8ZP2a/gl8umnVSz0KF7bG+n7OKEvffgiaRplc
	mGAjVliz3i5DFUipWTaUjoMMY9D8
X-Google-Smtp-Source: AGs4zMYGZSVIQ06UJlAIASjSnotwK2pnQ+niZitaTg7rRE4E1ZQ/TCazqkkfdQ6xmiHaUlCh7LYnyQ==
X-Received: by 10.223.160.184 with SMTP id m53mr2928414wrm.126.1512065984174; 
	Thu, 30 Nov 2017 10:19:44 -0800 (PST)
Received: from euler.localdomain ([5.170.72.227])
	by smtp.gmail.com with ESMTPSA id
	r71sm5094526wmd.20.2017.11.30.10.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 10:19:43 -0800 (PST)
From: Lorenzo Chianura <zuloch@gmail.com>
X-Google-Original-From: Lorenzo Chianura <lorenzo.chianura@abinsula.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Nov 2017 19:19:49 +0100
Message-Id: <20171130181949.22184-1-lorenzo.chianura@abinsula.com>
X-Mailer: git-send-email 2.15.0
Cc: Lorenzo Chianura <lorenzo.chianura@abinsula.com>
Subject: [meta-qt5][PATCH] Fix missing OE_QMAKE_STRIP env variable
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
X-List-Received-Date: Thu, 30 Nov 2017 18:19:44 -0000

Using Qt based SDK for stripping ARM binaries results in errors.
Generated Makefile contains:

  STRIP         = \$(OE_QMAKE_STRIP)

but due to the missing export of OE_QMAKE_STRIP variable STRIP will be unset and
no strip will be perfomed:

  install -m 755 -p lib/libSigUdev.so.1.0.0 /opt/poky/2.2.1/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/lib/libSigUdev.so.1.0.0
  strip-unneeded /opt/poky/2.2.1/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/lib/libSigUdev.so.1.0.0
  make: strip-unneeded: Command not found
  Makefile:576: recipe for target 'install_target' failed
  make: [install_target] Error 127 (ignored)

adding OE_QMAKE_STRIP=$STRIP to generated qt5.sh solve the issue.
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
2.15.0


