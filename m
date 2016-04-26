Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3D23F607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:57:53 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id c189so9052603pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nRiR0/HyWTHG77iTvsih+32/wxgmvzBRV5JrF2hDiN8=;
	b=K3K26W9d/I3YVlQDY+2zuL+w1vVym4sWNyLfOZqJF7lVTTvaoQPs5PV5YJQp+KYK8g
	8kqtX3x8GjKLgMQKlSCONsDKh0MriBtwXjmoSlu+CMa/BWRwkAddL8tc7+xCZ97hfVPK
	AH8dMir2BEdfSHlijzrZdcVGV73Jqt4yY/7jwx21/ZAuBq/4CVCEc2q/NTnGoRzaLWuf
	3QQeebvH3S4YZEIbfDAeq3Hi830jMmM4Jr1vRJ69Pnl3aKLGOClE3bw+lGNoQHo+7QxF
	g3YsGlAB/2ut8qNCLLNW0ybxgRCXeczI0ePEvrNEDWaO2dDNa5jf4opM4MAnevjC6kje
	YQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nRiR0/HyWTHG77iTvsih+32/wxgmvzBRV5JrF2hDiN8=;
	b=V0UQjU3/CUR3iC9tIQ6y8c7q9IWi/4pexuqkNKgCc1/hEEopQxePPMkfY9bqy8dh+z
	I3xX9/RXH402ICoUYsaP/VIX2VUrUZNCN0VopTEWEr62V9tU3VJ9aT80+FOQZ5rdz8Tx
	l66rtRcRPwj7v2aA7lY5YlPKgjzjVTyJ3awuD+waGs7wKtW2JeEqLs9Po0gInbQPj4sj
	1HtoZYbGVSzedfY5kBtVQauPbLnZ+NLMBE5V3o3/ogbpqMItt5cJKMZWR4RJx35noQlL
	loa2Lc3ucID/xYDGpvf1ngpPPmoav8mBKoU1C2LLlSMb/3GHoMoplo3kHxbwoYI3QHg6
	Bblg==
X-Gm-Message-State: AOPr4FWdguiUNGS6vh2yQPbeM9yeG4jN1cwjXixcsdXgMfqdcv3gNhAUbgjj9nMM4qtf4w==
X-Received: by 10.98.102.74 with SMTP id a71mr5082287pfc.139.1461689874076;
	Tue, 26 Apr 2016 09:57:54 -0700 (PDT)
Received: from localhost.localdomain ([76.126.209.57])
	by smtp.gmail.com with ESMTPSA id
	yl5sm39628749pac.38.2016.04.26.09.57.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Apr 2016 09:57:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2016 09:57:47 -0700
Message-Id: <1461689867-22284-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] iksemel: Disable gnutls and whitelist it again
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
X-List-Received-Date: Tue, 26 Apr 2016 16:57:55 -0000

Change-Id: I67a5edc0e16d5b5f5cbf204f2b2713f1a0c17afb
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
index f1276f9..ae26d4b 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
@@ -4,16 +4,14 @@ HOMEPAGE = "http://iksemel.googlecode.com"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
-DEPENDS = "gnutls"
 
 PR = "r1"
 
-# http://errors.yoctoproject.org/Errors/Details/25825/
-PNBLACKLIST[iksemel] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
-
 SRC_URI = "http://iksemel.googlecode.com/files/${BP}.tar.gz;name=archive \
            file://r25.diff"
 SRC_URI[archive.md5sum] = "532e77181694f87ad5eb59435d11c1ca"
 SRC_URI[archive.sha256sum] = "458c1b8fb3349076a6cecf26c29db1d561315d84e16bfcfba419f327f502e244"
 
 inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-gnutls"
-- 
2.7.4


