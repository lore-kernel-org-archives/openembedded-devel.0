Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D58171A72
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:12:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v123so305576wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V32wvx2UhgAD9iRXuLUQfXOu14q03uWExqeYUeT10P4=;
	b=euHbr2M6UaCIZDhFXuJpzExYcG7x2EzG+h2nfbBUIsKxPLgoXEuDVs62NEidk4peqe
	p/x/km0R6Ay/MxN8dnDnl2axoBc0DQzkFsbeX38t1QFtrnPzIH0R/gB05BxC6K1jt0bc
	dAYFqpL2cxZtP+QtBUDvxv0WDKY1HjCTBFqjLMH5CGhKnFMzqkLnn4vxx8UisMXuHDIY
	3qgrtHnCKvl13GrW0Xq2KYJjjeVH8OvWgFgoFLbnUcMbef7ZbQrOlu1jQT7seOtcwv6+
	hPJOE2ICUKpGUkyUX+akXCZDzHJPnSvdGkogem7dKZX4QNcdNeTBmeWKUvTmcMr0iMBl
	U9Jw==
X-Gm-Message-State: AKwxytc8W5GBUt5SShWRgRv7pjkG4v1B5gX+3CXvszYxY/8J3Bb+l1Kd
	NNXQ9dFwvuLg/FbNtdbr8fAEUklD
X-Google-Smtp-Source: ACJfBoveg48jK3Dvd5hqjrRASki/XofErGWRrP3Vvb6em9JTxho0HO0lGxsBpgK/xsXV/M94Wiu+IQ==
X-Received: by 10.80.240.205 with SMTP id a13mr23964574edm.77.1516007535949;
	Mon, 15 Jan 2018 01:12:15 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g3sm15526487edi.11.2018.01.15.01.12.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:12:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:12:13 +0000
Message-Id: <20180115091213.618-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] engine-pkcs11: replace startline=1 with beginline=1 in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:12:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
index 047f70110..bc79f356b 100644
--- a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
+++ b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
@@ -6,7 +6,7 @@ call by openssl to a PKCS cards and software for using smart cards in PKCS"
 HOMEPAGE = "https://github.com/OpenSC/engine_pkcs11"
 SECTION = "Development/Libraries"
 LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=973a19f8a6105de047f2adfbbfc04c33"
+LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;beginline=1;endline=26;md5=973a19f8a6105de047f2adfbbfc04c33"
 DEPENDS = "openssl libp11"
 
 SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git"
-- 
2.15.1


