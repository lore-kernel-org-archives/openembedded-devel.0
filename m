Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 353D97D485
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 20:24:46 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id q66so12477578ljq.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=PrFUbbdnrFSiypxPBI6BvgDg38+zAgyKYCu46jmAlGU=;
	b=uW983gJMvDPDoUzAWu1cK12WRb1L4wAqBA7ZHXKgIvZPLt8YhAHxRcLCniATdsDAXo
	cG+nkC3isBWO/H/B4ZiAl72ppO+4ywI+uk1i0C9Fcavsbk0u1AP2LcjWsphLNirSYGsh
	Ui1vF6lmw/mvVWTUPZqeohyme8K3+IenTxF0nyl5NYvjRrkjj/ogiMlLtiIB2b06WqG+
	W8RDgwgkuTTrxQpmIOsdFq17jt36DXYU2JnVHl1z19DAqgomf5lSsJa56sZWIPzdSj19
	V+PNUHj2LLEdttJaCzwCZkgsw1AcPZWiXhKNtiC8krEMpK4D4F8cJnDOtWX5IQWC3YF5
	oTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PrFUbbdnrFSiypxPBI6BvgDg38+zAgyKYCu46jmAlGU=;
	b=GhFJHIQGBm6aiA+7IOhuPdLKTYuvp/pkMyzWiFAsAuEs5QihgYmfK858Gf/J3APoTF
	N30Gq26ET4Zt7S9yPk+uvbzz6dxKp/Qt5W/VghixolV+29ps9qH3v4wItljP+QHH6g/3
	tJh0A1RgumyTX9yUT/I0ZEmi/OHW5ujFmvBGMMAthffwNI3GYDPlS2OQIpz0ylRZrP1t
	lGR9Y1Zu/zcV9mIW7Ep0ZAs+43gV+SnT/jYTaQS5Wzlp/Gh6so5w8ld4CUTzBu3NpfGC
	yf28NKFP24YhD9d/ckF7dx9FcBt+6xCbg6sqqbwf6OIBUEWyogTDj/n5sqYo/hG+QMwN
	HNuA==
X-Gm-Message-State: APjAAAUSjOcZ2l/+Azl083ctRoaQsneKDipw7M2JF0WyosztdiRgrHBg
	tw2K0+XiT7wZBofR97TJyyNZ4QmHUTQ=
X-Google-Smtp-Source: APXvYqw/26ndt6+9AoQfwpQjQyQ2NAUdkydw935o3VcfzzQclrN/bOPfvB08ChHu6BnKR7WwcDYJEw==
X-Received: by 2002:a2e:5bcc:: with SMTP id m73mr8810367lje.100.1554755086358; 
	Mon, 08 Apr 2019 13:24:46 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id k2sm6131659lfb.62.2019.04.08.13.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 13:24:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2019 22:24:41 +0200
Message-Id: <20190408202441.15739-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] wolfssl: update to 4.0.0
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
X-List-Received-Date: Mon, 08 Apr 2019 20:24:46 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wolfssl/{wolfssl_3.15.8.bb => wolfssl_4.0.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.8.bb => wolfssl_4.0.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.0.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.0.0.bb
index d4b969104..d8883a77f 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.0.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
-SRCREV = "e87433e2b6682aa7162fcb4aafefb08e2fbd932b"
+SRCREV = "21f2beca9f320199fcea4a96df3e19967804144b"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1


