Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 418F97EC47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:51 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id v24so4388434ljj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9VfHnCJmRdnsddmXA1Ae1lpsi0G8sux3/zRoCbGBogg=;
	b=Vg62jEKJYuQKr2gk3XhTZbw7CtKEg7MitYTe3LmbwbGEEUdbSYH0en4BSQn+HbLNh1
	AEUNuTlmAParM+UTOdDHvbhM1diNYEiIc7s3EH266v3DXZNR9ZzZf9oJbwgBKJKoB2BN
	9VQ4I1F3xQM7d0mVVtDPb5ccxNu/PXN3wLZObSMhwgnNaVWONSNbve6puD1AryzHWQ2K
	031wZLrCDaxxpnO3MHYPkC87SzPUMRb6Ngj4x8XZ9jN/g+KVQmTLqJrdYF4Pr5nsMHqi
	QJNmsNkbIyE8m1+zfTdqwhPx2eOnAoRAuR39z7cAoFkPupdNmB9qh4ZHxs+4QxWsLigs
	uUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9VfHnCJmRdnsddmXA1Ae1lpsi0G8sux3/zRoCbGBogg=;
	b=jSWKdki+k1NJU/wRC5MxR15+GBuQLYcu/508fcPN95B/FwrQl4OVEvyF/UBQ4hFzcF
	EY4NgNebrEungVJZg8cvtq8lsEG6vznEAW6eU3GjxsAnF8ALEGTQlrnW+2cB2bJmXnpD
	oioTDPpn8M5suLEi89BbHCh8tw4roddCvySVcHa28aGI2YD3p5Ng5sIwQxvLn15saxXN
	MXuU2hX/hICEhziN3m47YBKVXlmSMwRQTibbfjDeQu2bNYeqmYRcajjwRJmks4/VhD1t
	ZXLJiZ2YwzwKmk5zAS42ReHpxI66lnZXMK83UpU8VblZZKlKhyZJQbsx7IDOAE3b6JlU
	M+3Q==
X-Gm-Message-State: APjAAAUsMk395fzIEx6he7aE/8QEPjvLbU+QRg36M9ymtxR3xjSHY+Xx
	NA0B5mfVcw4xbHCL3iGCmTPyh/nVuTs=
X-Google-Smtp-Source: APXvYqy5a+1Yc5AANsfcm2Ja8Zn/ij2/OWyxIHu3YqrbNC6mwlURgrlzBpYY3ZSsmXerjeijhBjAmQ==
X-Received: by 2002:a2e:6d12:: with SMTP id i18mr35543687ljc.223.1568590911503;
	Sun, 15 Sep 2019 16:41:51 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	f26sm7866196ljc.10.2019.09.15.16.41.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:49 +0200
Message-Id: <20190915234149.12595-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libwebsockets: update to 3.2.0
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:51 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libwebsockets_3.1.0.bb => libwebsockets_3.2.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_3.1.0.bb => libwebsockets_3.2.0.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.0.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.0.bb
index fcabeb902..9c5503357 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ce87f3facb6f911c142c8bef9bfb380"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "89eedcaa94e1c8a97ea3af10642fd224bcea068f"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;"
+SRCREV = "94931cad003faf9d316e698b557bbb6d245f1f91"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v3.2-stable"
 
 inherit cmake pkgconfig
 
-- 
2.17.1


