Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC6B46069D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 13:35:10 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id d16so19999937lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 05:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/colFihh/QgdUWaFuepAaWI8f0obxLq6fShQWX+4y3Q=;
	b=aipy6oiL2oTsh7ELMrHee6uiM4fBilsUa0B2Q4zSpUPlDjoY8GaWk2T/jJOQWRvvdb
	wIuAcmicWo53xSkWlzTWkqTk8f+iJHxT9YZ82aVNxWRKFPk1zucOlyFVvHpbx9KAT976
	LmayLqHcV1mY7I2Nqkc2TlbPsiKjYj+7+zqbiFrX9fExvBCI2+PmryfQhhzrtlaGt0sU
	2UJM5Y54lqWwoar8O/hM9IfFfCOVUDJGrYum1wwVuFykmysNZx4lU8lDhRPzHYgtz4mK
	cWRG53ue+vTrj0pKABh6xekDewyCMWSpWfcjO9XGBXXBqfBAPXbgLpU7SaV+BqRHtBT9
	N8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/colFihh/QgdUWaFuepAaWI8f0obxLq6fShQWX+4y3Q=;
	b=B0DJd30uhA6sQzolSKJV2dYLF4XyEqOyw5KEPlhUcEAc6NeGe/wVI0bHfvKUActGe8
	RDzq8o3hPFxK4+54seAMljlsNvH132qXinXLj8Rj+Oi59Gugi0loKExTvMFSlVpLcSCH
	9fTVPNT6wrOZijRwIEDjRYkucQLF3JPyo33lmUiu2io2SBlOrJwI6Du2eO4MT+UbNmPa
	fRMPGQ9s9Xy73v7GJ6oCtk1UfgepesHk6ZPMv2csnFEcpmbo6BJZvY4vWW+Bhdmu2N7J
	xOmhx0nrDWspd7J8Ha9ZYn5YQAFm17G+kNGkb/xt3mlQTndfmOr2HrslHp5T1NoKZ3NS
	Bylw==
X-Gm-Message-State: AIkVDXLJSzHp+O4KpV1tc+84ZUwpwmnSdXa+/zf+eMn3X0CBijMGh1xpEYjT7xWZmjNfcw==
X-Received: by 10.46.0.4 with SMTP id 4mr10512469lja.34.1483018511620;
	Thu, 29 Dec 2016 05:35:11 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	x10sm12988446lja.15.2016.12.29.05.35.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Dec 2016 05:35:10 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com,
	raj.khem@gmail.com
Date: Thu, 29 Dec 2016 14:35:07 +0100
Message-Id: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] protobuf: Update to latest version 3.1.0
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
X-List-Received-Date: Thu, 29 Dec 2016 13:35:12 -0000

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../protobuf/{protobuf_2.6.1.bb => protobuf_3.1.0.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_2.6.1.bb => protobuf_3.1.0.bb} (83%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
similarity index 83%
rename from meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
index 7b8f62986a41..18210b1e5c8f 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
@@ -12,11 +12,11 @@ DEPENDS = "zlib"
 RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
-SRCREV = "bba83652e1be610bdb7ee1566ad18346d98b843c"
+SRCREV = "a428e42072765993ff674fda72863c9f1aa2d268"
 
-PV = "2.6.1+git${SRCPV}"
+PV = "3.1.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/google/protobuf.git"
 
-- 
2.11.0


