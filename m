Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A57D671C0F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jan 2018 01:34:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f71so421691wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 17:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BA4FKqOSyrcJ7NVEWCZ2IkwD7KJ/PJoc+ZjKAiKV3B4=;
	b=BZVKCe0lWYKPjnF8OG8pOC3XG4U8ym8h+Uq6KOcX+JbeigmHfbBDDL0kGkah43CUt9
	j8d6uag4Q8q4SR7SQzy6j2riVpQe3qYH14xCWaPnRpy/Ds8n1kR1Q33vyTouRcwDPxdH
	oD/xFNv75u73zDnjUyV2EQjbj7X1syYTqSlCnHqhe7abBRSNYaeJ4EOue/Kz0N1HIm8n
	qk50YTSwxk0xydpbgbkIaRNP0ATQNntjSnTMhN9ireXsCdI0wENvDPrexLsps76NRtyz
	QbTWbvNPbHZ052NkQxP6BjpAUeMwh2tMvvDQw/jLj2chDZeo9l7EZJBX7zc5R6E9FVPa
	Z2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BA4FKqOSyrcJ7NVEWCZ2IkwD7KJ/PJoc+ZjKAiKV3B4=;
	b=bCAZ4NvXa55CKyhCzU9lqDtX5OgLanTx3PtPeB9PcwUe/cRIZWAO/hsKb4Z3lEiPBx
	+4Trwg/BbIKzfX7KsljzZUgS5MkqJHuQxzqE12xIw+oavQ3xV7MI/seGZLExsl3mQ4mE
	SmyjRrrdGNvEFdrAfqlhxohOZ3NVWXI4UF+b+1TNfOWwLU1+epfXFlGtfBiZiTsIrCOj
	NvVVpQpyCCIaRJXJxjQ0SgW/IoC2RJ1sviiYcIqFMm/MyFkWfR/WdLRQkhXgRaHJghTP
	QTIALslOUmvJafNLR7ujiONvp/dfZ1OZoRQW6rOD29c0KcVo4sGxapyS3XPlrbunHRUv
	WdQg==
X-Gm-Message-State: AKGB3mIOPJRSKOz2BikNxALxGDt9ML+5Yk/q7NO3s0qmWXkVzT6kPGG/
	hhBUrg0NMOmulLrClxxSO/Yr5Q==
X-Google-Smtp-Source: ACJfBotzqRPXq6MZ4HY5uFsRZxU0OOR5Tslxmzo794kw176fkGy3TzSx95dk/Ojg9ounOauIT8GqNQ==
X-Received: by 10.80.183.184 with SMTP id h53mr38266939ede.249.1515807277341; 
	Fri, 12 Jan 2018 17:34:37 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	a10sm11248732edi.40.2018.01.12.17.34.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Jan 2018 17:34:36 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jan 2018 02:33:56 +0100
Message-Id: <1515807236-28679-1-git-send-email-liu.ming50@gmail.com>
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
X-List-Received-Date: Sat, 13 Jan 2018 01:34:36 -0000

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


