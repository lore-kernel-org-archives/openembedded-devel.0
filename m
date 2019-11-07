Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 048717F79E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:44:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x4so2127003wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N+4TYLTlwVQXCtqM/B3Zuvmo8xcXmOckW2+GnR6SlQQ=;
	b=IZKMfYN9kXqTak3exgokw0ygLAVzah2BoYETnjViQs+oue/ZmLamDGc7dVFfGXVWXh
	EP4yCrfCipRoTRKKoQZGnQpmBjVqTjJ48WGFydfCrAbbIw/lZ0F1Bbfb0h5NeFdlD2h1
	97ZPDxg5bc8wkBE9uwMhMgTPlXoByfHxtYam9nVR45K+iCL6ag9mU2thuENoIOrLSxTA
	LOMLtj3Uhd0jtIw6Pk7wFLbv0j8LbS7DQJiYZqcUDdVdsechKcfO8K3XQKgTHmGyoiTT
	GXyS53nZSik4j2XYjF2IdzNdaPjP8/taI2n/RtlPWfqZjW+xF30qCKQyXe2gTY9xvj/d
	KeRw==
X-Gm-Message-State: APjAAAU+D/6Pcw2jLwCpVArAKezQl7zJfYRSw4VRQ1kU4UmE8kAqwqt7
	fdg8rQSGWTPzoAQdh8umGO2CDUvp
X-Google-Smtp-Source: APXvYqzaNVdXavohDVxgjGBjO80PKWXGCyN6rKAAdRRGx29rHpFLLq2T1Xz0F557ZQQqXsTq6tbE8w==
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr2618501wmi.64.1573127044120; 
	Thu, 07 Nov 2019 03:44:04 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 76sm2283613wma.0.2019.11.07.03.44.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:44:03 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:43:59 +0000
Message-Id: <20191107114402.933-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/4] nghttp2: fix UPSTREAM_CHECK_URI
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
X-List-Received-Date: Thu, 07 Nov 2019 11:44:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was added incorrectly in the previous recipe update
and doesn't actually work.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
index 6077daf76..913065a04 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-+UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
+UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
 
 SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz"
 SRC_URI[md5sum] = "02b015cb178c46f27dd87228e33db35f"
-- 
2.23.0.rc1


