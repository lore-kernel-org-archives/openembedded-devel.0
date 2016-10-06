Return-Path: <igor.socec@pelagicore.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id BCF2760111
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 16:45:55 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id l131so21902877lfl.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xDEGykT1xtnZa0Js+6TfcCYQ7tlUme30crlOuRHuN4w=;
	b=mm293eSpY+haHITe0QXZBGO4BaU8ba7NzJusF5Yg3cA4oplj28vQBs1UF/f56Urngy
	ZZhrDkxNaRu+EFjDIwl7tk8Pq4YcUp/79qc2qs9gwFPLaKOc5p8nAOrtJ47ElLLLJ/6e
	LnpIDaPLB1eefI8RfAfPYXS7jiOMEBw+pdxnt4V3GAjx1DvESHwX9fo57fKfShv8a2pz
	CcMnnR8p78rnETW9nuRUtrC4VHhJDLA/cfQ800D4CxY3p/3zvwlBI4oOJvtKKOJVEieX
	8HeJxTBrU3LM8tLZWT/G9csonANKqGlAcHFWWkZmnvqjrZDDxCXeFJUohv0iPzIet/3d
	zy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xDEGykT1xtnZa0Js+6TfcCYQ7tlUme30crlOuRHuN4w=;
	b=ZjE7ynt88NylCh9uiPDR71hlqcvUmWiIrWHQfyxQn8QuBUNBk2oCE/W1fVfaxuVcqv
	Woe8EFTvwnS78wep59fNmwPpmEIUWTr4/iVmZRlGL+3z9j5Bmmmci0aVsQqsQHup6e9d
	IHDfDR17o/Q1Kqg2GNmjogx7/2oNyiNoloq2CbHGB8X45hLAmYMT3Bzk+KR+JnHiBMSK
	Mad5bVLTLdanWgv7eSugO66X9Ukx1ITKNZOhZNiKTDyd2G+Kck4RvbiopRrziz0j5t+k
	pXPBYxQ9s/fvuoEePpnXM5CItZeVhKwWdta8+9luIAnYTCw+TX+H3lepo5gitjoWLm1o
	gcjA==
X-Gm-Message-State: AA6/9RkhyRQUd7+aD667bqSP4RSZjrAwMwSdoe/V2F6sBlHQl68cZcUL93ME7b4EUBrFq3OS
X-Received: by 10.46.0.133 with SMTP id e5mr325450lji.50.1475772355829;
	Thu, 06 Oct 2016 09:45:55 -0700 (PDT)
Received: from mydeb.mecel.net (static-212-247-53-108.cust.tele2.se.
	[212.247.53.108])
	by smtp.gmail.com with ESMTPSA id 5sm2808209ljb.22.2016.10.06.09.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Oct 2016 09:45:55 -0700 (PDT)
From: Igor Socec <igor.socec@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 18:45:43 +0200
Message-Id: <20161006164543.10141-2-igor.socec@pelagicore.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH] jansson: update to 2.9
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
X-List-Received-Date: Thu, 06 Oct 2016 16:45:56 -0000

Signed-off-by: Igor Socec <igor.socec@pelagicore.com>
---
 meta-oe/recipes-extended/jansson/{jansson_2.4.bb => jansson_2.9.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/jansson/{jansson_2.4.bb => jansson_2.9.bb} (53%)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.4.bb b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
similarity index 53%
rename from meta-oe/recipes-extended/jansson/jansson_2.4.bb
rename to meta-oe/recipes-extended/jansson/jansson_2.9.bb
index c235729..455b374 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.4.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
 HOMEPAGE = "http://www.digip.org/jansson/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8b70213ec164c7bd876ec2120ba52f61"
 
 SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c4629b89bf0432f3158c461e88fe0113"
-SRC_URI[sha256sum] = "1fcbd1ac3d8b610644acf86a5731d760bb228c9acbace20a2ad0f23baec79b41"
+SRC_URI[md5sum] = "84abaefee9502b2f2ff394d758f160c7"
+SRC_URI[sha256sum] = "0ad0d074ca049a36637e7abef755d40849ad73e926b93914ce294927b97bd2a5"
 
 inherit autotools pkgconfig
 
-- 
2.9.3


