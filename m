Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE5F8700F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 07:47:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so5802663wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 23:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b64YfKPRCg5mSucn+rWqQEYs42ND3fwslh/Atk3XorI=;
	b=YqdsjnpJfXWN+ByfK0iB9O4U/aPvz2NBQ6lmBaGAf9siEiYF3MDx4lTG+n+EOZEYG8
	oIoXML7FhZFWf+fW2djOAI46jCq/P3pUke8j43ChksLNNBzFl0sdQHcj5KcSdHkyKzVk
	tuZzybQttWCqLthMDJlkHhJGtylcE+n9MXDPZuoxcqNa/O1TMyOu7SUCMeKK+ESNgdNh
	u7l4xhU5TEnndI51VPb4lZhv4YUJZ1KG+Qg1UyKX62EHLvHlzA9re028A9YGztdWy02D
	7dKTQyf9DHaROfLtfPci9LjjfLNnNyjUA4WqureCmnZjhL3dORw0/JF1kOIP7Q+i3X6Z
	suQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b64YfKPRCg5mSucn+rWqQEYs42ND3fwslh/Atk3XorI=;
	b=HR0NpraBI4X4dxJ9o0EUOqwmdPi1mDQqUkKO8LE1kQPnYEWFY0sOCd70vabIx329ak
	w4Mkf4zX7yRk/QIAfrWl+nQF1dP8abwDrTiXSOEhirXh6iGmcnX37FF1tgH5+bGFJtls
	sCFAh0vhyYvZgc2FdjYdvZ26ISeChc63nvK4H61FG+CCXs8Pp5CVaIQQQRTAeVgJhRVQ
	D16HE7jWJcZOKpXXcHgyPMkk1fWnfrant+7T3Yhpwi22QJ6ikwDLiFfwm9h2f40Jnw9v
	G+9tIWtK3w9H0vqPqdzo18ZsmXZ+NroJRSJSsPgIhnavUGkgzIkxJTxLXUKhEHq2Rxsm
	gfFQ==
X-Gm-Message-State: AMke39mUz8nfxXQrVdDjwYOEmaNILWQvq7uUikLUEmjooEhSr9+V0h7tQH1VAwYF1bSZdw==
X-Received: by 10.28.52.19 with SMTP id b19mr2062083wma.134.1488354452224;
	Tue, 28 Feb 2017 23:47:32 -0800 (PST)
Received: from localhost.localdomain
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	k10sm5769373wmg.10.2017.02.28.23.47.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 23:47:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 08:46:53 +0100
Message-Id: <20170301074653.6802-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase: PACKAGECONFIG[gtk] change gtk+ -> gtk+3 in dependencies
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
X-List-Received-Date: Wed, 01 Mar 2017 07:47:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| WARNING: QA Issue: qtbase-plugins rdepends on gtk+3, but it isn't a build dependency, missing gtk+3 in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4e1ab72..7a6d4df 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -112,7 +112,7 @@ PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
 PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
 # depends on glib
 PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
-PACKAGECONFIG[gtk] = "-gtk,-no-gtk,gtk+"
+PACKAGECONFIG[gtk] = "-gtk,-no-gtk,gtk+3"
 PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
 PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
 PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
-- 
2.9.3


