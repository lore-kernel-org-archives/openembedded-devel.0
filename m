Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5559C6BEF4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 12:38:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z5so17506651wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 04:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lFUNnXaxizVAaLoCEnfMJOiVYr7i6WT/OYE5S8C05UA=;
	b=ciMsjPXPrPY80JtGgSLfTBiXbjWHiKsWLF+mLsq89vL5Xkaq9ADE0Dnn+Ov2KhOECK
	PNNWP4UVesvXiAhskD/oEL9rIJ3kf3BnnmblUIhFsaDXX38nb6ZXbHXs4i0PCFTRoLXb
	yE0PUnwYMozq8m3czDYp/7iUpwOwbzVimFv2G09e7gttfHXmBHmJiEs7CouRE4pbSRUr
	mXFB4X6UNPJpJsbYx2FWABkSo/Pwdb5K++6cznQQ62yEr2wUaUE6tTw3nBbPOYTH6Yub
	PuHb6A3YQvNE2kk5gL7IPIV0LVIgKjwT+O3PAzF0VGk0MjPw/s7Gz9Um8BhqvItcaoUz
	ii/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lFUNnXaxizVAaLoCEnfMJOiVYr7i6WT/OYE5S8C05UA=;
	b=QR2ynPgKoetOnKJ5nvVwOlNHbPiqRiyNPnogm9VExApPcQpVO3oOs6LfaOFAo2tC8o
	0N3M+PBh3EmtGaR3YNbu610nSz7otcHd3ZhebLg95Uhq5JGou3KuScIvUrOrusEIKTMN
	F7laBA6T5kA3MRrlZEObZZ+CFovgPx711973FfhsSBSIXSz2h2UugVDVqPi6GSdEX55N
	CLHEBkWCfMJsSwyMTIBeoiDKiskFHRe020xH7P60/UzLWkb2od7G7amWZe5C0rLX9RrR
	A+sg5g2TekQqNCbNaZiX72urJP3q4xxn9J3KrPV132X55Pi+rUNhk3zUCCHBEy3dz3BA
	FLjg==
X-Gm-Message-State: AA+aEWbEjjSzv1ifC2H7MUm0ARhuncM/3X0lm4EW7OKAR3a4a2DJ9JYS
	WcR/cdE8RGnOa7/i+wCSGK4jClNz
X-Google-Smtp-Source: AFSGD/VJXERnRb6RzfetZu5SqStTnWcBkFneULPw9Py+s1ASGPiZ5TVhs3OQ8j2rq8lDMvp3D/R1xw==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr16720186wrm.143.1544618280514;
	Wed, 12 Dec 2018 04:38:00 -0800 (PST)
Received: from Unimatrix04-Bionic.ivecoeurope.ivecogroup.iveco.com
	([5.170.17.183])
	by smtp.gmail.com with ESMTPSA id a6sm2109138wmh.10.2018.12.12.04.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 04:37:59 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Dec 2018 13:37:56 +0100
Message-Id: <20181212123756.6539-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: inherit pkg-config to find brotli library
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
X-List-Received-Date: Wed, 12 Dec 2018 12:38:00 -0000

---
 meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
index c94038f8f..49da6d35c 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
@@ -3,7 +3,7 @@ SECTION = "libs/network"
 HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
-DEPENDS = "openssl websocketpp zlib boost brotli"
+DEPENDS = "openssl websocketpp zlib boost brotli pkgconfig"
 
 EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
 
-- 
2.17.1


