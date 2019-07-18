Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4C47E7EF3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 03:06:43 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id z28so25782585ljn.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 20:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=w8aW0P6r0klVW1SNHnTrp4DRl9m4nQ4f6WCanR4c+yM=;
	b=ds0a7E7Vig8psvYhkwO+gq+pS8wZTY43V07bHn7eojaT2NpsKMjDY9qxaNyjMVSM1y
	BqPHKcYorbJzUTIsrB+Zvyj7h0fMOKNSjtLPeSoo+N/2idE6aqX4EEaZx/vSUx3x1ti2
	KA6K37uGB3MA1JPUt48dUT8JAz8v3rAxKqtBwXjsX9MKVhd4pupaS2bkSl0kbrov8wTx
	MAl1T8GcpQT9xisXE4nbN30bF/J+ylORbnBKztwrRg4eANRxnzptAzJb5TXtaQG6eRXu
	KQbsS7WGm+bzFkHeUoajeohdYUcuwr/f5di0hX7ECteoLVEFHvEbn/NivDVmItL9WKci
	JhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w8aW0P6r0klVW1SNHnTrp4DRl9m4nQ4f6WCanR4c+yM=;
	b=WRjGZ6n70qurvt81BBiyXqEwZxBTozN6bkJgtg3Gk5kjpOXF/2vZXtQnMcTFOrsJip
	3I7flj070fT4+pIqfhPadErVPUMqz80iQJnG2VT3cRozd3soX7WfWzSNYtD2X3xkMtH5
	oMHBdtq9DJbfcRx55QVmS6PiFp7g9+7ukV+Fmt5yviuG8jlqAbBB8Q9bfi1qIEcPS6ms
	YGd7Gzz3xK8nqWFVU7pHNzhjKN4FccImxVXAc0kvmXW5CGIXrKO0/FgjXvdE9OvfTAS2
	v5nZE7cTqj9ExTNEpEOhd/fstsQz4GZw3N2usmb2wxnbIA6qtWXW+tc94fFg6ZQVpBfs
	a/Sw==
X-Gm-Message-State: APjAAAWamtJuGKQbHcNGp+u89T7Ft0L/uz26Lu8rKarqDy3yIjzjGN1G
	HwSe9AJEVJKX/OiDms76vjrRclA1
X-Google-Smtp-Source: APXvYqwDiQ0KxVXOdsVeqdoKzQKUGF96h4HmvGKm8XIQPCr5EpLj8JFVlY966et1RKNaSwaBkWlFnQ==
X-Received: by 2002:a2e:9dd7:: with SMTP id x23mr23521776ljj.160.1563419203589;
	Wed, 17 Jul 2019 20:06:43 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m25sm3773780lfp.97.2019.07.17.20.06.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 20:06:43 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jul 2019 05:06:38 +0200
Message-Id: <20190718030638.20816-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] dhcpcd: update to 7.2.3
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
X-List-Received-Date: Thu, 18 Jul 2019 03:06:43 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dhcpcd/{dhcpcd_7.2.2.bb => dhcpcd_7.2.3.bb}             | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.2.2.bb => dhcpcd_7.2.3.bb} (80%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.3.bb
similarity index 80%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.3.bb
index 3cd13884d..161810a2c 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.3.bb
@@ -7,10 +7,12 @@ HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
 
+UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
+
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
-SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
-SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
+SRC_URI[md5sum] = "b7aade2cc47afa6d645f798103365402"
+SRC_URI[sha256sum] = "74ab38177548abe968c2abacefffdd97b573acaedd4f77b6c0a54ae38f68566e"
 
 inherit pkgconfig autotools-brokensep
 
-- 
2.17.1


