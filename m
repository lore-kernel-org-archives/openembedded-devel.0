Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD0487F8C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 16:00:17 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id j5so12632341lfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 08:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KXH7z9zNZWmofRJghNuS1xZWypAPe1SUNqtxFp2FTVI=;
	b=h/BNSijxWE8tyTKexHWeby6SpDiMgR6XGixfc66MvS+BW6dVe28IRv60MqXMZIBSaL
	dPm+7WmwohBh6wxMFBNODemsRqKRKsFQOhwzPh2NpbVFr1d8SMaytENp+XQ9E9qpBaA5
	/8MGYJXgNdgsKj/e+vpEb90q8pUlP2kkuLu8MoOy57zhs+e9fiVrZ/ot3YLsYnxh9A8V
	M+sggC60dyNsyYhDBy04rQwWmdXyC9Vio4ICni8X46vJMEj6W6hUkHtAUiX6mIGFnAqF
	R24dgdEfj3yLe/tqZC0EIhnmCKGfKWQxjlGi38ThZNqyHngLwNrUw5bCHk8mXFMfwMv1
	md9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KXH7z9zNZWmofRJghNuS1xZWypAPe1SUNqtxFp2FTVI=;
	b=ZeJCS7Gldb22PL6Ef6k7uj4kRdaLzghnPHi0xl55/P6X3w3WRNmjRYTlv18SUFF4vD
	Bs3G82IQJPt8NTW6pFRBc1PlZwTxXLcaBd/5KFlF/JZO4kQZ+sVmVR79NKF42eTyX3bV
	2HjpqZZtEBGq7dyY3uGf6vJV3MuLKARjDgkosPz1vJKi+QpoxJDxH2z9oYwZcMXva7Lm
	K7wChRhc9VfISVDo5D5kIGWuR1mpZpqUVZA5XwtkNP94Z87WsTCQ9GO9FhmMRl2x0d2W
	QcxkwL4PnQPd8MJr3CKnphoscQxvQNIG5hXvuawaRG7aeo782XCNyIFtvUKmO3tmjrpr
	8E7g==
X-Gm-Message-State: APjAAAWpH8hTruJ1cKaz2UDK3ZvplcGDKlqL/GdoMiqtnDoDlR0at4Lw
	L3sLqp4n7BqObUnnqtP5cPp+UWTeJl4=
X-Google-Smtp-Source: APXvYqyb0P2bAmcLzexQqw4j0tOX0m+uDOcdcKN4hREfTSx8t+Tg5PGHFrft6NmMF9LuS2dL3nEmaw==
X-Received: by 2002:a19:e018:: with SMTP id x24mr16946078lfg.191.1572883218175;
	Mon, 04 Nov 2019 08:00:18 -0800 (PST)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id g3sm7108292ljj.59.2019.11.04.08.00.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 08:00:17 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 16:59:47 +0100
Message-Id: <20191104155948.3080-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-oe 1/2] iwd: Use python3 variant of docutils during build
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
X-List-Received-Date: Mon, 04 Nov 2019 16:00:18 -0000

From: Khem Raj <raj.khem@gmail.com>

python2 is on its way out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_0.23.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
index d48fb8450..20c6d04f7 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Wireless daemon for Linux"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
-inherit autotools pkgconfig systemd pythonnative
+inherit autotools pkgconfig systemd python3native
 
-DEPENDS = "ell readline dbus python-docutils-native"
+DEPENDS = "ell readline dbus python3-docutils-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
 SRCREV = "77f16ae26fc013477f6362a0c33f0e52e82863e0"
-- 
2.17.1


