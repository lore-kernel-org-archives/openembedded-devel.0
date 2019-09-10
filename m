Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAE47F37D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 13:29:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id w13so20259296wru.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 06:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=S1Nb0hbbVwIJSDMx2mb0c8EaWyKqrUImcaGhy1aH6dk=;
	b=vMNjJcGWObVeP3pnVTjNaSBKqCz8ilc9bs+sigqsGsV2btiqegHYzEKw2SUtNsgt28
	k82EZLt+zToap8Svt0LMWRnt3VgXWCJV/JFiCQrbk4PRK58mGOddo2j+qulLYKIHJyKh
	LsW+t/Ykkv13vNvPJ8QkRMGNigpFvr8mEVShCJO0x+xRYWU2+B9Y2xv2bze+2tJj1Q20
	z0gpalVQM9BCGVFwVzCOAl9FyPNu8WYIln64AhpYoNbxkf6sYyLLsVK1SMYSxP37cPwQ
	GBPirmZOp6KZ9R1TL9sYMnXc6+geeiZWXsfrcQ0Npepx1KtJCZWZVC6SF6zeuJvr5NZ5
	PM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S1Nb0hbbVwIJSDMx2mb0c8EaWyKqrUImcaGhy1aH6dk=;
	b=N3PV5+XaUwRdi3tSjBPX6mRhwc0vaQseGFXctg1lwCPreqL7LrGJ1uTX5wOqjmQzkg
	oNNp8KuZSBxtxHnrHSASBPDhNhmyUe9QJvHCsbdpGcGeSCkvT2osFaRYIEwE0YAUZHZV
	zzXDRUp651dJwxrTv4sreXIXMla1NYidZKkkgyx+3fBh+YRW6qH3d8a1szuabuLEZWMb
	SVSzxv1LLj5S81HU3N44suehmO1W6tKQ8pNmxlI+HsCFUEB1FhFwmFcyasBiysVXvDMG
	96Pb9cmP1AN8XFBImKF8B2isLUOEJ2fc94W1f+BfP4EBppOkINq2H5N5382VJgT1MYty
	zyYw==
X-Gm-Message-State: APjAAAX/mN6VkM18eowbMjJcaAZehlgwM4aat7fWBX7JDTD0aINmPAeE
	IpaFpodP46PhKUXWYL8I5nTn8cymnYk=
X-Google-Smtp-Source: APXvYqzFZk738ED6Mq25J6jkSTwxMizwjvzC6DvSVZb4ftz8XeZXBSMH6cc12b5MB77q9asXNuCVaw==
X-Received: by 2002:a5d:6504:: with SMTP id x4mr26550900wru.227.1568122146970; 
	Tue, 10 Sep 2019 06:29:06 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	a190sm4320585wme.8.2019.09.10.06.29.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Sep 2019 06:29:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 13:29:07 +0000
Message-Id: <20190910132907.2257494-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] remmina: add distro_features_check for GTK3DISTROFEATURES
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
X-List-Received-Date: Tue, 10 Sep 2019 13:29:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index b95c400b28..0895a9d35b 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -15,7 +15,10 @@ SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea5
 
 S = "${WORKDIR}/Remmina-v${PV}"
 
-inherit cmake
+inherit cmake distro_features_check
+
+# depends on avahi-ui with this restriction
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
 
-- 
2.17.1


