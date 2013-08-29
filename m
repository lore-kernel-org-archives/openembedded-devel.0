Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 321516BD75
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:04 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so338300eak.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bXP/wtgJ1o0/Ea4i0XPi2ZUCLXZ2sJKaYaL871kazPc=;
	b=XFuCNIJAwGkLH8fvdOz2VpB9S0QKVcKoyl8fCQiDtH+MmafRs/q/dUoJw9f49QLU9V
	Kn44IumXOjAe9hfZyXlulwhAxbKY2PbcI1jcUUweG2DG44A4/Eb89PMR5dYrAemyREcp
	qNS1ZP/LVzKgW2jcrS/hPcwj4OmQ2EXpQfJ3DEnCFFc6MdtBAWjK+FFWBe3sfQ9Jhisd
	LFQLnw8Hye6IBze6tx+tOGVDzYEhoMi4A6UsF90Fmd5MSgGu9E/nL5JaOPHNu2TWKI70
	87/c2kRp4hf2wyxU6SxAt+ji0PrEbCoFurFy4kciZNdXddQmVyMPOuoB95LHCulyCkPq
	u5Kw==
X-Received: by 10.14.105.69 with SMTP id j45mr5350733eeg.60.1377791464590;
	Thu, 29 Aug 2013 08:51:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm47161662eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:05 +0200
Message-Id: <6fdec6aa451fc778ac14a4d87737acebe86c384e.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 12/66] uhd: Add PACKAGECONFIG for orc
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/uhd/uhd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
index 476b763..da1fbd8 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
@@ -27,6 +27,9 @@ FILES_${PN}-examples = "${datadir}/uhd/examples/*"
 OECMAKE_BUILDPATH = "${S}/build"
 OECMAKE_SOURCEPATH = "${S}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[orc] = "-DENABLE_ORC=ON,-DENABLE_ORC=OFF,orc"
+
 EXTRA_OECMAKE = "-DENABLE_E100=TRUE"
 
 EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
-- 
1.8.3.2


