Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5C30173556
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:55:50 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so31836102wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Tdk0MzdLjRvrDJ/zgC1vyWodmoq3q9h4xsweeYlYmb0=;
	b=YHwwKeoZhD39zT6W+uPu1DfA2IUTJZjNi4Wuiv7NS10x2kdMmge8vOhuJUFaJCDJhY
	eKzoUvhxP6KB5ljSIEeL14KhvDV4eocKRbQ333tL9MpfeIhl/A1agyTCUsRZ9Z0C3Sl2
	S1I2yxWarO1dYVQCHPsEn6znj7iTMBakc0vzAHoTlFGZ0hk/Bt3Z5SGg/V0kPacVGLAr
	WNrinxDgeFX+NdKhMIu5y/JXm2mN47s4iE8iH74v5YHF6q7ZxYQJDkfayuvLoQT6GokY
	K1Zs177ObGi63KCTGWJEf85Urs6iHyl4BdWkL/P1TkPR/fxmB8/GBBMFDoPbxskpeh/9
	QgCw==
X-Received: by 10.180.73.171 with SMTP id m11mr40138505wiv.21.1424123751051;
	Mon, 16 Feb 2015 13:55:51 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id p1sm365956wib.23.2015.02.16.13.55.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:55:50 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 22:55:30 +0100
Message-Id: <1424123733-16696-4-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][PATCH 3/7] rxtx: use autotools-brokensep
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 21:55:50 -0000

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-extended/rxtx/rxtx_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 28603e3..85f55c0 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/rxtx-2.2pre2"
 
 INSANE_SKIP_${PN} += "dev-so"
 
-inherit autotools java-library
+inherit autotools-brokensep java-library
 
 JARFILENAME = "RXTXcomm.jar"
 EXTRA_OEMAKE += "RXTX_PATH=${D}${libdir_jni} \
-- 
1.9.3


