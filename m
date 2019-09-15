Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id B1B707EC66
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q64so21488969ljb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5IKYqtgTpDXjbWrQf/fQwkCLq8xB7A1cW0of85US61k=;
	b=keO0zgqVNjykVr562V2iVmtcsolfxDYV9yG4fmaMIi+WsDN4mcmxzyyVu8F6zjlXFw
	FjuuZ8GUtrSM9Wr1N5Fg3lZ/rcIQ+YWfsqrf+9GOwxlH7P9lk8CdieLi5DP/7C5h3lKW
	qTsW9OMuH16brAtuAxwroqM387aEU1DjLMDeTJ66ToF3FDGAIzAUEgSIojdTCCOEkd4E
	IULzGT0RPB5+Y2Oxc3RfR5hTUu0XV+jkX0z/Z6+1fmCFFxz5kQ8wlGlBY1QhYY/+eA/l
	5ecKz/oFiyF6AzAepj+G61aRqPZ8lK2F1Z3xiP7zMdRII9ZVo16YOkrZKYTL/HMSr4LJ
	kT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5IKYqtgTpDXjbWrQf/fQwkCLq8xB7A1cW0of85US61k=;
	b=UW33Z2hz9HEQqP0DMELzjQIaymIEtAm+irYViRfvtm1DE8xgGl0bkYB104reeVjGHR
	I3y66ti4448jT/dX7ohdVcGIFm02iHB8zN1bhxCu0AGXcbEdyhK//VA4zYrSZ17GElDm
	SSBUbNIGZu+mSxpRVOxLKLQrDSJFHVKuxmLPw1iVHn31EgxtPErUcBQKFff9AkYSzk+8
	i0Gc1EZ4vVgkWKDmskYj7X+yy8YRje9xFNjR17QMasH8fLH9X+1YCvQtQZIbG/R/tkmG
	mPBFI56OZ/8eFo4ZE89GUplEXhZWrOw/SMV5RgjxFnv0IIRgWkt4myK9losYtoSfzQBv
	Q7mg==
X-Gm-Message-State: APjAAAUWP7cwYAqpGXLwXpAgOR4D77j8AQbwrKRrxlnYHV6kexMCSG8k
	jYTbQs3X3/fZYLb2/8wyrpxtP7GVna8=
X-Google-Smtp-Source: APXvYqwt/DUtA+jyIA1mMHJ/GBgRG1CQM5wJk8/12o4ZAi+w/NTLM/wypbqmWi1SGDyIBSVFyR4+DA==
X-Received: by 2002:a2e:874a:: with SMTP id q10mr34454203ljj.187.1568590930293;
	Sun, 15 Sep 2019 16:42:10 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	v10sm8519823lfi.26.2019.09.15.16.42.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:07 +0200
Message-Id: <20190915234207.13073-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libmicrohttpd: update to 0.9.66
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:10 -0000

License checksum changed because the section that was not part of the
license was removed (see @d0e81c8e0fb9676602db14a4120235f1524b1306).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libmicrohttpd_0.9.59.bb => libmicrohttpd_0.9.66.bb}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.59.bb => libmicrohttpd_0.9.66.bb} (80%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
similarity index 80%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
index 7e50edf7b..7d349b94e 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
@@ -1,13 +1,14 @@
 DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
 HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
 LICENSE = "LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
 SECTION = "net"
+
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "8ab5123535549195aff19e91b4e49f48"
-SRC_URI[sha256sum] = "9b9ccd7d0b11b0e179f1f58dc2caa3e0c62c8609e1e1dc7dcaadf941b67d923c"
+SRC_URI[md5sum] = "ce4050e75cc40d68506e2b403e1a76f9"
+SRC_URI[sha256sum] = "4e66d4db1574f4912fbd2690d10d227cc9cc56df6a10aa8f4fc2da75cea7ab1b"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.17.1


