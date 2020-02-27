Return-Path: <ricardo@foundries.io>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8501F611CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:41:21 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q18so769715qki.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 12:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2BYx3ehCpM8CB27HNebiphQ6cIzv20wd7RkrSTt75Yo=;
	b=1LNp3ERKT4cET3e5PoL5qcTlU1NF5BpVHtQa0Rw711jDh8lh3bhAGTftAJS+UMn7MO
	DUscnTSRwS/DA8V506xNNjw8CsZT3YuwibkcYRX1PVzDWgcof2Hm5TaishofQOhInQBn
	XWkk/VEoqbd/wS93JsOZGWiB2RrQmO+tgWuV3NwF6dHfa7jeivaKfvqmkwsxxLLSgUq9
	ddwTkccMr3G/qdn8JJMEp4eZj2iV4FNxj2CTyAiRZWnHmOEy7crqFMn/VL616SSGwxPs
	myXsbDYRwXKcrSTT4KeUZ+xvMmD4aid3xlhcgM/z1uUiSEFq/9JHPqLN7vpLtv5zDnhh
	sdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2BYx3ehCpM8CB27HNebiphQ6cIzv20wd7RkrSTt75Yo=;
	b=YKQebe8TXZ0TTyfdZ/jamM2cECFLuvSWVzGlvcVDPs7kPrfsRE6zsN9gdwxkjLNcc/
	O5Zjz8w9M+Z6jyGO/eJ3J1lJHX4w/nZNNhwtNvMCi/CMUjrCk8iuaZXGt9CGx2Ur6C8D
	smeQr+3c02a54DHupi1FKgWHXPNQ3Pv4ZWCYweQu1qgJTpubGmPY63+9FOp0oPvaavrW
	Z+97HgxPkdEO2W0YBSQOHODN0nd4yFuwph0KCVF4VeYRKmNAhLOayfHNu3Ef/CC/dB6O
	3JNR1kBfL1lA96Dtbdbzpw6eZtiQrH+bU1DNQZVyBK3cwfFfeefQfrsKCrGJA0VtS6S0
	vy0Q==
X-Gm-Message-State: APjAAAVC6HnStX+0jpCHWxr1rStDiiPndshmPy3N1/mxl3NoGHLNfcqH
	wBdDDWsKFJmPgk8flDwldwkOXnbbaQ==
X-Google-Smtp-Source: APXvYqzDd1ldkJ+M6aokWj5vj4UExnLpwBL3cGvbnKLmy5RFrIrlp/OMh4gCKapizsFxMI0na72u4g==
X-Received: by 2002:a37:ad18:: with SMTP id f24mr1299454qkm.41.1582836082083; 
	Thu, 27 Feb 2020 12:41:22 -0800 (PST)
Received: from localhost.localdomain ([2804:7f5:f380:3410:387a:c13d:722c:5ec9])
	by smtp.gmail.com with ESMTPSA id d1sm3714985qkj.29.2020.02.27.12.41.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 12:41:21 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 17:41:05 -0300
Message-Id: <20200227204105.25220-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] libp11: revert version back to the 0.4.10 release
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
X-List-Received-Date: Thu, 27 Feb 2020 20:41:22 -0000
Content-Transfer-Encoding: 8bit

The latest upstream release is still 0.4.10 (2019-04-03), as
available at https://github.com/OpenSC/libp11/releases.

This reverts commit 4990f80ddbc984f2bed4e07005d22f937988827e as it was
incorrect, since there is no 11 release, and SRCREV used was actually
from the 0.4.9 release.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../recipes-support/libp11/{libp11_11.bb => libp11_0.4.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_11.bb => libp11_0.4.10.bb} (93%)

diff --git a/meta-oe/recipes-support/libp11/libp11_11.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
similarity index 93%
rename from meta-oe/recipes-support/libp11/libp11_11.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.10.bb
index 5a0951df2..655db4907 100644
--- a/meta-oe/recipes-support/libp11/libp11_11.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "e1210903291b1de9eabcad26e740a4b2fbcca692"
+SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


