Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 346977D48D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 13:12:27 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l7so8867910ljg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=g7ZgolAN0X+gt5CmjL5m4sRyAPw037/LO+TOiTFgenk=;
	b=nM5qA//puCUtMTr+lV036coAq/iQmGDgsfPM03yRXfRSscEQMuzk+e3B25NLlcSpqg
	h+Hmd8Seg9Zonjsn1RlAIwJ5pH5hme4Oat4ks0eyRfQkDpG8g4wZaukurR0NyDyzMGZ5
	l4QHUrE1D46Mnw7cHP0msOmLMHSp3pQJyLx4Dh70gUC15RC/ARs3LmMOxkYoWJCVWlxp
	4LtPIiH/YJD7MOmF5cQRlanQU1pDY13s3Z3EzI8SChobhyWD0Ol5euoVYUF1KHHQfZ4y
	igPRzsCBCkYNs8gSTgycfZ+y9C8G7kPSV74CASHddU5GHz7nFbc5DIiN4AZoAtnX/yV7
	+Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g7ZgolAN0X+gt5CmjL5m4sRyAPw037/LO+TOiTFgenk=;
	b=QrgwtDmSKA9wngwdqMn666icTzjbVUxbO0w0X12TDc/pBf603AWBdULpz+i0VMawsP
	m98K0+vfqdSqkxA3Dmtshe7SPQgxNkpZQOVpNOosNPlccPj0JG5TPfU5WRZKQasQQ2VJ
	0swum9NyBhVpayyWFJtanfEYnIYdWG4iUAE3AaspJ/IUWstagVIq1CgCNkchzzds43rn
	kb4JYh4ukuRxNAhPC866hNXLUp3ihSvuLVrxU20kk9F++g1+qTEFoSFgPk69w/mzLdot
	5gofxpAM85kapdZ/9ICSFiJhKFUbxouo5ltA7gChHn9KdN93yutsrgEOjNjgThEjcPZ3
	RYKw==
X-Gm-Message-State: APjAAAUFGNx98ptJ/OSYSUUcqiejCZKGgFgE13Z4pVlNaiPJ5VslHI+t
	YZGU14uiuZELt9Cgrodto6ojItj/9ok=
X-Google-Smtp-Source: APXvYqzWYwPHzHfwcHlrBe+4BvrayYO7CSuoGkMa+vcg4EOvd4LGmBohs6VbkPV6P38Zp0xdw7bHwg==
X-Received: by 2002:a05:651c:10f:: with SMTP id
	a15mr7439911ljb.30.1554642747416; 
	Sun, 07 Apr 2019 06:12:27 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j27sm5485618lfk.97.2019.04.07.06.12.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 06:12:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 15:12:24 +0200
Message-Id: <20190407131224.24155-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] fwknop: update to 2.6.10
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
X-List-Received-Date: Sun, 07 Apr 2019 13:12:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../fwknop/{fwknop_2.6.9.bb => fwknop_2.6.10.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/fwknop/{fwknop_2.6.9.bb => fwknop_2.6.10.bb} (86%)

diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
similarity index 86%
rename from meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb
rename to meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
index 0fd5f6fed..3eca3ab62 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
@@ -7,9 +7,8 @@ inherit autotools-brokensep
 
 SRC_URI = "http://www.cipherdyne.org/${BPN}/download/${BPN}-${PV}.tar.bz2 \
           "
-
-SRC_URI[md5sum] = "e2c49e9674888a028bd443a55c3aaa22"
-SRC_URI[sha256sum] = "5bf47fe1fd30e862d29464f762c0b8bf89b5e298665c37624d6707826da956d4"
+SRC_URI[md5sum] = "47a9c7c214c40dceb5dc2aa8832e4f32"
+SRC_URI[sha256sum] = "f6c09bec97ed8e474a98ae14f9f53e1bcdda33393f20667b6af3fb6bb894ca77"
 
 DEPENDS = "libpcap gpgme"
 
-- 
2.17.1


