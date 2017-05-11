Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B2B2671C9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 13:02:31 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f135so2826901wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m1rIGW819b/lYNXZw63jAY6lURfiyUoQyab453vn6Hc=;
	b=TSPMFTPAgu5vPeMMtoOyqib7tRhXlF9wza+ORQzxDDrLhSXS1sZmkZmq0aZdtJhxgS
	hTFzHsdsu0CgG633NfwucfLRV0q0nkY98ofBEOeXqxml3zF9mtfFJIz5PpI3HQDjFCN/
	1ARrJdCFVx9ml5KAm0r/ch63g+tdXLIqN/vPNutJGoljqgruBm92EczqSbEWoP1i7X3V
	Lh1FAsAk2bQO2bvdIjB4b6CM9a5a4M+DaMAqMkXbD4BKGX5Pau0/UKRasmA/57QMvB9G
	i7DNM0E+GtAwXWmnFEHl5f8F9XkzE2KKNeiAdG+Zjd9iE18PlZ1I9XOHWZGXawYXtXo/
	rs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m1rIGW819b/lYNXZw63jAY6lURfiyUoQyab453vn6Hc=;
	b=AM8lCtej/MdLJ9MiM7SRiwJjzwbfnXJLNGxGM+ajOKYUDSCGo5Tkzjok0FpqiuXjnb
	6qJG+i2ZPYpAG7+MOeEIJ+mN3G/ZHFaFfqCVQXbnUp9VArgNXAzUS6vYbd2/ycLu9/+r
	4n97epMWEen5lKpuhQkTX8KVRopDwUIAaLF0wnobHWfOGpr2PWdv9QzdHLTBAU1TUJju
	f9VgUgYNmx9Ce/UpK3HQB1VUkNc+KRyW2iefriEEonNzo8cZMZ8ETy0L+GvPI6WUwwEX
	ejnIUl24CLVxC1jGsIsmVQ+J2eYNYQt5BST1Xchz96BwKVyApTVFc0bU/TPLvApXEvBf
	xL7w==
X-Gm-Message-State: AODbwcA93IKl6qkX6AC3nFG9xCKdrg8vMIoGQUs7+EAvUC3OiNhgPa4r
	Zmzgf85e+HWkcA==
X-Received: by 10.28.188.4 with SMTP id m4mr4626073wmf.22.1494507752340;
	Thu, 11 May 2017 06:02:32 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id
	y63sm9550222wme.31.2017.05.11.06.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 06:02:31 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 15:02:26 +0200
Message-Id: <1494507747-1804-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [PATCH 1/2] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Thu, 11 May 2017 13:02:32 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index e06ff7f..2cc345a 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -3,10 +3,11 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
+SRC_URI = "git://github.com/jpirko/libndp \
            file://0001-include-sys-select.h-for-fd_-definitions.patch \
            "
-SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
-SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
+# tag for v1.6
+SRCREV = "2f721c4ff519f38f46695a60d9f9d88f35bf3c1d"
+S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4


