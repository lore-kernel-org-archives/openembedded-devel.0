Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAFD78672
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:17:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 64so3362983wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BA4FKqOSyrcJ7NVEWCZ2IkwD7KJ/PJoc+ZjKAiKV3B4=;
	b=UWtHW/xHKB45BLAugn/g0G8xreK+3VsJR+aaPIJ5FLtVGhBrmH32fnpqGhFj0p34ex
	GJ+BKNYy4vf908c9ZyrhrRDELr8n8bLoOltgCDcFf+iz3NWnEWL9OFfm4bsGjka4JTd7
	aQXbfBpOvfwjSIpx1BeZtX7wIXPuJONbWDJKm51HS2/blVMW0gPwIQm9KrLRHX3pad0R
	3dWAcxCMp9HT/Af+ERpiQyilOD/a9W6oFMP+NC/VYJrpWUIgQlBsZb8dcBsJDCVLL/QB
	W+Z1RaIMPeBfed3eN2FHupV5E9fnCmP+noHCHNzuiLyshoK57Cw7fenfFz9jXIQ52nYq
	WWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BA4FKqOSyrcJ7NVEWCZ2IkwD7KJ/PJoc+ZjKAiKV3B4=;
	b=RiakOpMg/gcW9i7ptIVqhpilvGB68Pe5o7Nqq+WpLqKtFZyOGMVkwhljpQA6BymmzE
	97zT63Vz4xL0CADW9V6z3hu0MF29T8r7UE8HMzcotD7/JJ1KjxZ5g7z8e3fbB5Jo4B3y
	TB1KH7HHY+f1Zq/LT2Gbaf1aKCBkpeR7+xtt88Z7RViwZXj43WNsW4XuVvjOsp18Reea
	Qtin98t/HViWy/0S++C88U1fnVO3Q9mDj9OlkaPOJRRKXktVOmZfy6BowfX2I5RaeVuX
	m/3pLFAuYIHOrlDWKom0Z+/rVRPLLetKqtt8C2qgnI50FAgt47ov3UgiiJaGChR8uQq0
	ClFw==
X-Gm-Message-State: AKGB3mIGsXSYjzgIYZidu1eXRaspmC9yWmPXNpIR/5jn9KMAo4L3ymEw
	EihHureC0AVyEefwgDnSYzV8Sw==
X-Google-Smtp-Source: ACJfBots9c7dhal8+wvsvCwF1VfLqm4Qlm2VvqG18LRzGKR7dO77UVxKnVpGyu1IqCieEAA/+DZYqA==
X-Received: by 10.80.163.138 with SMTP id s10mr7311626edb.302.1515071866057;
	Thu, 04 Jan 2018 05:17:46 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	a52sm2206826eda.92.2018.01.04.05.17.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:17:45 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:17:37 +0100
Message-Id: <1515071857-14908-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-qt5] [PATCH] nativesdk-qtbase: drop fakeroot task do_generate_qt_environment_file
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
X-List-Received-Date: Thu, 04 Jan 2018 13:17:46 -0000

From: Ming Liu <liu.ming50@gmail.com>

Move the implementation to do_install, this fixes a following issue:
| Error: Transaction check error:
| file ..environment-setup.d conflicts between attempted installs of
| nativesdk-cmake-3.7.2-r0.x86_64_nativesdk and
| nativesdk-qtbase-tools-5.8.0+git0+49dc9aa409-r0.x86_64_nativesdk

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 33be99e..98e35cc 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -169,9 +169,7 @@ do_install() {
     # Fix up absolute paths in scripts
     grep -lr /usr/bin/python ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
         xargs -r sed -i -e '1s,#!.*python,#! ${USRBINPATH}/env python,'
-}
 
-fakeroot do_generate_qt_environment_file() {
     mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
     script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
 
@@ -200,6 +198,4 @@ fakeroot do_generate_qt_environment_file() {
     sed -i -e 's:${SDKPATHNATIVE}:$OECORE_NATIVE_SYSROOT:g' $script
 }
 
-addtask generate_qt_environment_file after do_install before do_package
-
 SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
-- 
2.7.4


