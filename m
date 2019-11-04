Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id ACDC77F8D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 16:00:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id m9so18193190ljh.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 08:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0KfFPUi4SzrONL96eZ5MWYnaFHfYoSzKihBVbzFJ+ns=;
	b=riRPtXSDG6L0UL9k2HRfk1sq5qov+ERN+hZnYYH7Log+RndffxOqglCy/sFYk3JMeS
	PKhSaJJJXbQHsY6VuDiyKFjCRl5PJ0rg/q5qTwqeS8XRStY9pt+SLk7nhQLdFOarB9gm
	Ic/YFTk9K67FwSl9XvuQ0vFcUddYdEaPaT7V1TZlRXEOkoinufAG/oxfk7L3AgV/S2We
	HOgx3/uiwYHwCOfwmbbI074jOlQd/wDxJhbygZWJJAgXtQRQ8hX57tG5lgiby9H6xaQ4
	pS3n8gZecRiXvbKy3hl2MMc8t98drZmKdywrMOk3VuoKt+j5Rt48dRrnzZULjqscfk+F
	5zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0KfFPUi4SzrONL96eZ5MWYnaFHfYoSzKihBVbzFJ+ns=;
	b=oDgZ0MCdgrJ4ny8XPZ2QcIVPwu0m2wRbik8gcbwobAe86sSqmoXhb3Yxwqj+y36Pm5
	MINfmGX4otq1HsxFSXZ9AkEcndie3Kisr6nEoCu9HTuG9u+GxHEDHolD+JEGH5Uao0VC
	KTD7g5OoLvsONzxh6goHAQBS7cj2zSOWw+K8gNRprkhgsGEYTfkWxA3UWY/sGSdEuhJT
	PGH2ImK/h8O6BMb7po9MGxWbUhbNcB2r0Q8FtHhTohVUKvrDjRekWLow19PeVReDrMVH
	CjGdn6mxQWipNRMbFw/WZAFc8cKTqFFCFnRWkMBc4x/c2264h/tBoAgpzbTTLYI0fWpS
	Pw9Q==
X-Gm-Message-State: APjAAAUikVCVSGkEYD7kVtQfUHz/ACDEVpLCADBc4/xSZy4gc+uItm1t
	rCQIvk8IyvagD99aQJFyjIhuy1qSpFg=
X-Google-Smtp-Source: APXvYqzW1hOn1Rn2L4wKECwLblQL2q2c/xwXoFDuwXFtlJikTekon/CtHawgZz8kSNhimQKOFB3g3A==
X-Received: by 2002:a05:651c:1202:: with SMTP id
	i2mr19385596lja.218.1572883256081; 
	Mon, 04 Nov 2019 08:00:56 -0800 (PST)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id 30sm7863635lju.52.2019.11.04.08.00.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 08:00:55 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 17:00:52 +0100
Message-Id: <20191104160052.6615-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] iwd: update to 1.0
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
X-List-Received-Date: Mon, 04 Nov 2019 16:00:56 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_0.23.bb => iwd_1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_0.23.bb => iwd_1.0.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
index 20c6d04f7..94d86d1dc 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
@@ -7,7 +7,7 @@ inherit autotools pkgconfig systemd python3native
 DEPENDS = "ell readline dbus python3-docutils-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "77f16ae26fc013477f6362a0c33f0e52e82863e0"
+SRCREV = "971e1d2038a203ad43bd2278a811a9e5ec8d52db"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.17.1


