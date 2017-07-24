Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1F6782E6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:39:43 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id p3so1798914qtg.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QeFnL3uubqj2unQ9Fs9Br/7V+dFjbRErjUFEisUiA+E=;
	b=GtCzE90GZXW/NTb449Xt3xuT/ETucW1n65w3RASq8AoZ7xZRBJDq+aTkkD9GIi1vNn
	IIzikkzM0MH+kldjHLtMGygKQuGYV2PzUU5Ky+NshCOlEB628MAHarfrvN5C1MGvZAEs
	PG74SgnmPj+vMjUgqXKdweIlZN6nGsb1gIGxbED0U2t9SYt3es1Y+tYEud7kaiwp/nAy
	klLQSRHqlS+8n8cHIQdVYDpUBkXbBXtxV9tom6uLbSAqDlmeAqjpsgcIUUaVSKc4p/4I
	4ZvQBqpPfm6PWCO0wonUzrprZWCtSuUsDNon6SfSeI5mnI4PA0MAV3qG7p8uf+OxlCcz
	ekfw==
X-Gm-Message-State: AIVw110JzviZXn8nvpu4GlTeSiFJtmqnG8vBRH7GdFp4/L1cfXmCnK9n
	64bRTcZ6z+eFPP6FUKU=
X-Received: by 10.200.49.85 with SMTP id h21mr20136307qtb.152.1500907184284;
	Mon, 24 Jul 2017 07:39:44 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id n8sm8704260qtc.5.2017.07.24.07.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 07:39:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 10:39:18 -0400
Message-Id: <1500907158-16626-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyserial: update to version 3.4
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
X-List-Received-Date: Mon, 24 Jul 2017 14:39:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyserial.inc               | 4 ++--
 .../python/{python-pyserial_3.3.bb => python-pyserial_3.4.bb}         | 0
 .../python/{python3-pyserial_3.3.bb => python3-pyserial_3.4.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_3.3.bb => python-pyserial_3.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_3.3.bb => python3-pyserial_3.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 2508e76..99c6fc4 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -13,8 +13,8 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-threading \
 "
 
-RSRC_URI[md5sum] = "6afe4c2e47bcec6eb7051b8c1ce19d52"
-SRC_URI[sha256sum] = "2949cddffc2b05683065a3cd2345114b1a49b08df8cb843d69ba99dc3e19edc2"
+SRC_URI[md5sum] = "ed6183b15519a0ae96675e9c3330c69b"
+SRC_URI[sha256sum] = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.3.bb b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyserial_3.3.bb
rename to meta-python/recipes-devtools/python/python-pyserial_3.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.3.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyserial_3.3.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
-- 
2.7.4


