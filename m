Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 99A337E833
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 22:14:24 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id p17so7298108ljg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yr1nwEMwCYyn5NaO/g68hYn1Yc5LFGbycUwhEitO9FA=;
	b=QpCyHkRUEbrJiLipRJ/yHC21/j9L5QvQXN1mNYkDMbPIIusb0zNkP/Hzco2Z2cY2rK
	Fi7DWiHpS1p5LsWMIezBDZi1GBHpitcSxxHhoO0OfWGeP/9QIh7nt5zQdZvEZ8hgdnye
	pjdz4/e79HmhKx0g89ZgqqRGO2yE0+oip9ApnUkSivDxg+bC4bRVONfE7bP2K6LOOtkc
	atdT32yqBcVhaeQIG6bIb1gST3cNDzws3WFrJsxnaqKgBi4hdGfut2Tb7GWeLrKgDWJH
	Jjz+Yf1kC1IaU9Z9nuQ0PXJVtBvMP+H6MHAVO72oHoXwW+rBH5OKmReriPi2btPVPAA6
	N9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yr1nwEMwCYyn5NaO/g68hYn1Yc5LFGbycUwhEitO9FA=;
	b=pFkBGSSw7g/F+125WzdXro6dB/pmrTzTL6gAKTw6XPuwg35axurhXRKdlezAuMBQy2
	WXuuj6qqiAHloOECtxI3hb9YVux2VAfOOboiolDFPt0zAisB7xfmwPGoEork9djqcGk3
	dJ3mdF7x6vysKtoRXCoVxhNjsSNdCvUM7MFviknvwrLxxhWeQMWYbYN0xMRKBmhmJX5+
	0ru5OEml+dPWMFraojHyfTGUtgXBSWUUghqtLuJgXECWRCCVOrTmMhoY27fiDZ6zfQyV
	J/f2QR+94apKU20RbaykHuTcOwGk/xi/AvJXD/C89ehKtj/hHXTWFdTp4hbGdJULeXVt
	dREg==
X-Gm-Message-State: APjAAAX3Yh/gG9vUZQYZX6rv8lWLpeuyIW5HN5zW80ztGkfsF1/P8G4L
	ldXdt5iGY9picX93hwU/Q+fQeU7HtM4=
X-Google-Smtp-Source: APXvYqweWO4lNscjLfPg/wgAa97P6oEuhdUed60sbQ0fJyzH8Az1B/SqC2OHe7t5Pa2w16iIUvK00A==
X-Received: by 2002:a2e:29c4:: with SMTP id p65mr46063495ljp.141.1561155264789;
	Fri, 21 Jun 2019 15:14:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 25sm554664ljv.40.2019.06.21.15.14.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 15:14:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2019 00:14:21 +0200
Message-Id: <20190621221422.13592-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking 1/2] drbd-utils: update to 9.10.0
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
X-List-Received-Date: Fri, 21 Jun 2019 22:14:24 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../drbd/{drbd-utils_9.8.0.bb => drbd-utils_9.10.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.8.0.bb => drbd-utils_9.10.0.bb} (94%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
similarity index 94%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
index 70e04b943..d1189f108 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
           "
-# v9.8.0
-SRCREV_drbd-utils = "c30216b49330216bf8a567b7727da6e24f099f08"
-SRCREV_drbd-headers = "2357a11fb49bcbadf6b490e6d4cfe982a3d24813"
+# v9.10.0
+SRCREV_drbd-utils = "147860216bf307433e2d0d7cfd6fad3642027b8d"
+SRCREV_drbd-headers = "0955b3423f08f8e11ff05092bc1b766609fd804b"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


