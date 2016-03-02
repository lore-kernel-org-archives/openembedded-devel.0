Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A860B76DAC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:18:17 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so70726921wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 02:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CO37gaIDIZ1RZ9Zvo6PzNQscZUt2573ZGUK8hmtLG7M=;
	b=WJ8FmCTBvuL21d+PLejKrVxZO/NdACE9hGEJ6DhZSiPOX7wOp2mTjSirhDLqoiNkwe
	WecMAuTGQBsPLLVv7mZgiUzARmrUHZNH840a/rnuunyleUaBXgCbjCR4dlaYw6gOR7Rb
	F4H6etB8Ap/pfPfLPLGGvranX88KZbYdYdRF7my5icSB8QLZZxwAn2DjgWjHBRBDoIsX
	g9SSjUtCuCHiRNzXcMFKsXOQKDhhQ2848yfcrwHJ3gEub9Cg+ABASciGn3MBKJv4ry8z
	T3tBGa8o4ftxWaVsVkxj4ZHnaGmduEqKtFkJ8MGQVBwDRSxf8dsy2BCNWq8EWonP3ACt
	cy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CO37gaIDIZ1RZ9Zvo6PzNQscZUt2573ZGUK8hmtLG7M=;
	b=NXNSP80UXiqC7UsNSp3N1mvSoZTuAXZsboPn+/0EijTwt9ln22GtEjiOXozUv3RIgw
	kHlIRTUgtKXMYbxK+G7D+luguSR9I/u80drf0dvUXo4kIuVeKOD2HNy3aRp9CbXNc7NP
	L0JoBTJv4vWRJPuJH6Qqw9mUPvx9c9zI3ThUPghd/GOoRNkz4QCd6Gk8XI0ma5zoqj4q
	Zs1y5X/GImcmRQuGFgwbthitKA+AxHPSB9wgF5mRejKqIjKnELyT5vSY710C+AkAv6qC
	cWIOHPj2XHHoS6SQcC1hjn0wlitHXpAVXz46vUdTtcvAaJhz/Kg+WIfm6pIw+ImzQzk2
	WJ0A==
X-Gm-Message-State: AD7BkJJS1rcnKRVWNFLCwhpUYk6upvRGr3yIZG0S6fZvpcCO4feI5tsszhmf42trmaOyjw==
X-Received: by 10.28.135.1 with SMTP id j1mr3590876wmd.20.1456913897765;
	Wed, 02 Mar 2016 02:18:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 202sm3459189wmo.7.2016.03.02.02.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 02:18:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 11:20:09 +0100
Message-Id: <1456914009-19771-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1456914009-19771-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456914009-19771-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2][meta-qt5 2/2] qmake5_base: use remove-libtool bbclass
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
X-List-Received-Date: Wed, 02 Mar 2016 10:18:18 -0000

* this requires latest oe-core (Yocto 2.1), if you want to use latest
  meta-qt5 with older oe-core, you need to backport this bbclass
  and more importantly don't forget to provide
  EXTRA_CONF_PACKAGECONFIG

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_base.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 5b2633b..c2a8498 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -47,7 +47,7 @@ OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/wayland-scanner"
 # this one needs to be exported, because qmake reads it from shell env
 export QT_CONF_PATH = "${WORKDIR}/qt.conf"
 
-inherit qmake5_paths
+inherit qmake5_paths remove-libtool
 
 do_generate_qt_config_file() {
     cat > ${QT_CONF_PATH} <<EOF
@@ -168,7 +168,6 @@ qmake5_base_nativesdk_do_install() {
     find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
-    find "${D}" -ignore_readdir_race -name "*.la" -delete
 }
 
 qmake5_base_do_install() {
@@ -176,7 +175,6 @@ qmake5_base_do_install() {
     find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
-    find "${D}" -ignore_readdir_race -name "*.la" -delete
 
     # everything except HostData and HostBinaries is prefixed with sysroot value,
     # but we cannot remove sysroot override, because that's useful for pkg-config etc
-- 
2.7.2


