Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 693447F336
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:03:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w13so20511325wru.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wW4BvjiC//BZQ29EAaLxuRciGYV7gBtE2LKG3ycyemY=;
	b=Ojb0zxLPH9oeZjQPeWFJYFTbNsohgllrD3jBRJCFw/Tx4t4Z+V7m9ZB2jxb33HyMUC
	xQcwYTGdw5n7UTVjdwQjjs58Ory0tsTuta28HZFl6mh4zmVcm5sSyLqikkuUQSy4eeny
	0b4iMfNT+a2RqGtM5crl3tFNAAnvDlMF+/gqHNSodnnkyBIP3BIav3YIGgfkLMmyWPDe
	sFxVUs4+aSf/s2bGuVZlhbn/SMyfk0e6P9FAKlR1Wi6TDlBqve3yL3ZSNV+ADuiUS2RX
	plQXov0oYri/DOeGIxrWPaS4hFMpn1PoApnV+7DrJvyGsvF3RG+R4A1oRY/pvsnyiT3D
	16QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wW4BvjiC//BZQ29EAaLxuRciGYV7gBtE2LKG3ycyemY=;
	b=UGl9eJR77BQ8zcjVFtl/kWlsTP8Z8F6PRZTPOW7QwsxvuPGsx7T0xgrz8tp2nPRIAW
	a9sZUn0yJMmVYDFPeU/xj8LBijJlXysotKj8nAoZoSE5A3uKYx4ecSV2o4SO06mxCjIt
	GPYXxLfHFViqjOLxF7nKWXC8dBPqKMJkEUFAfM4vcbcZcgjgDq5zyb9D49On8oLOZcVR
	CAMc6lyrAKi8oitwlxCfvWagDKjuj4NQp2GW321kznWFNbuZS5ppIKoDaNTRQo58ZTWF
	/97hxo33kmVwefrYfxsiOx+UQgdMtA3M13iVlRb5irvYuaqQ6h2IlAfeXrnkEk8MqGX5
	d0Fw==
X-Gm-Message-State: APjAAAV0KYCIf+vUDXJaiutk9MYHjChHa26iHJguc+fW39K2ubjwSuw3
	Z5bs8ZTv/VwtPx4Ev23ATKAPpM3l29s=
X-Google-Smtp-Source: APXvYqzBpjq1d7ZWaRNfHNZdliHV7mrZqKGzJw8EeDsu9elU8s+zlmvXBOBo30TpIhwxLd6TViJrpA==
X-Received: by 2002:adf:fe0f:: with SMTP id n15mr6148308wrr.343.1568124195665; 
	Tue, 10 Sep 2019 07:03:15 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	z11sm16707971wrg.17.2019.09.10.07.03.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Sep 2019 07:03:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 14:03:16 +0000
Message-Id: <20190910140316.2334783-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCHv2] remmina: add distro_features_check for GTK3DISTROFEATURES
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
X-List-Received-Date: Tue, 10 Sep 2019 14:03:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index 126680c574..82b803a4d2 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -18,7 +18,10 @@ SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea5
 
 S = "${WORKDIR}/Remmina-v${PV}"
 
-inherit cmake
+inherit cmake distro_features_check
+
+# depends on avahi-ui with this restriction
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF -DWITH_SPICE=OFF"
 
-- 
2.17.1


