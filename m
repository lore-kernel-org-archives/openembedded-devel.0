Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 651DB7723C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 02:09:50 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id x23so4260920pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 18:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6bl3xSBFQxeLtNgZeEHxiAjji16LJUSENYC2rGMBJD0=;
	b=vaedVF67vt9I7G+8kRe5+TxxNJ3ACJLbL1+6tJLT1sDZG8oJ/jFD0ne3Z3pmUQRdUt
	vBOEi9XLRTIHJ0qzRqPeLO2VNVN5QimStha6hpwQhy2BODOHoqFIAA0E3IQmTcDSEMvO
	8wRsow/amm8YaiqlA4ItTM1OpTsYDz9BDj+QvpH91p1NTkd2/yIn3o1+JMV0fRTpb257
	OtBV2149QPc/ivrWN2ikKSCGXMq7kgQ/Sy9M7DaQVkCvbM1iQPmUwd5WcUE3XWTqBZop
	Ujpy0HS0cv/AZwV1EVvlgJvWP81OoQZ65CdHRvS8GTQutSWe28ID1hGGri3y7i+SHwFk
	4mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6bl3xSBFQxeLtNgZeEHxiAjji16LJUSENYC2rGMBJD0=;
	b=ChDWiW4kTDtADyd8DMO3DDf5E2gQr0Gl543L4kfhz/lg5yewF7wwunaFK/skQJL23Z
	QUiwQofIFbYJ2Ati+/abs6piHOEcbnFZMdVfgPAmAXHlsiGHhO19OFTf7a0P4QkC8rJh
	ADod9V7PTH81ifNo8kA7TnlLzdLDqdBAquvZqh5KetZJiMaxT2yET0G7byqCvUwB7p9O
	Ps2v0uSotCpBMUX87yOcUnW5ncXKNw34dU6foD2634uzULvlqMymVO3V4Vspn4EAxbBc
	PcRCRk/jqhp8LVVmcRtfff6bJhgPcfJEiRrA1uVdOPuE14Mi1wRRpOdg4BLefLlDctvF
	k1Uw==
X-Gm-Message-State: AKaTC01WAu++jZigH0efCir6WS50kWhysENfolBQpVjCi/ShwFT075jZdFUfgn3EC1lhPg==
X-Received: by 10.98.141.74 with SMTP id z71mr109241482pfd.53.1481767791810;
	Wed, 14 Dec 2016 18:09:51 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c142sm90098329pfb.23.2016.12.14.18.09.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 18:09:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 18:09:38 -0800
Message-Id: <20161215020940.10105-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161215020940.10105-1-raj.khem@gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 4/6] avro: Add recipe
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
X-List-Received-Date: Thu, 15 Dec 2016 02:09:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/avro/avro-c_1.8.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/avro/avro-c_1.8.1.bb

diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
new file mode 100644
index 0000000..8deee4b
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Apache Avro data serialization system."
+HOMEPAGE = "http://apr.apache.org/"
+SECTION = "libs"
+
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
+
+DEPENDS = "jansson zlib xz"
+
+SRC_URI = "${APACHE_MIRROR}/avro/avro-${PV}/c/avro-c-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b268348536714541e10411823a1b59b0"
+SRC_URI[sha256sum] = "e5042088fa47e1aa2860c5cfed0bd061d81f9e96628f8b4d87a24d9b8c5e4ecc"
+
+LDFLAGS_append_libc-uclibc = " -lm"
+
+inherit cmake
-- 
2.10.2


