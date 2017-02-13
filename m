Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB2C71DEF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 21:05:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so358832wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EqbGUr9WalG7/tx2WTbZQsll9HWdphhAsVX51xRT6nM=;
	b=KDBeFNFMW5IAeKRe86ktPXS9MdLcC7e+ljb7tSjL82kM67SIBLymb6kU8e9ci0AX61
	QwdJeDk9GaZlBQsPmAeHC8E+kV29HzDjIoyQUwpAKxRVuxSUShz5u/5LLQ6a9iRwy5BO
	WSqDKWnlw7ms42CQQ3NgLgD1chJDT3RkigPdRg9bwwo8XcCVIptGHaw7k7E5+m6VFWCd
	tOBhmUg2OMyb6nsCTWmXbttvTgjdSMLvqydVeLL/4VM1V2PKg42w7ayeZyoMyJI7yWuj
	wsz8IyTQIkU1uyLcm1sgprEeNUP13slNemsKwgG0TYl/Qkpd8qSksR4shKE7YHDP1rWd
	zXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EqbGUr9WalG7/tx2WTbZQsll9HWdphhAsVX51xRT6nM=;
	b=LXxViK5IWPXDiGYyTOHE+1+VfV7lfv1I7aoomJuun2hSFSlBYHoNhyiUvA0h0Wr2om
	ZNS5qjB+VZ8qiEVMcEdGZJwa6/UPI7Bb2y/DixIDfngYf+KPld2KJJMGHeLSps7+aXOt
	8l3aRly3d2oAiMl2ZxdJWkJ9Ltdfij9apFZlq8+eoqcZDcpwFwcdB9olSL6jHutpm7pK
	F1aegw0Zw0yAOMx6Eofude1Gqq14jFQb3LmfcQmnrC5buQ8apqsrPSB1aeXn0xmRMFd/
	ywa6We39SNR6cGEUWLCo4rlQNqFwle3T8ugY1I01jZ4KqqoNB919O8kRm114pDCZtN6z
	aV0A==
X-Gm-Message-State: AMke39mWcN7PMuLkIfZzjrsIILyx17P+9y6mTy7tZlI3ngnQXUcGQiecq2IV6BVxbEVnUA==
X-Received: by 10.28.236.79 with SMTP id k76mr224121wmh.79.1487019912560;
	Mon, 13 Feb 2017 13:05:12 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	g11sm12212764wrb.63.2017.02.13.13.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 13:05:12 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 22:02:07 +0100
Message-Id: <1487019728-19329-3-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH][master-next 3/4] pywbem: depend on python-m2crypto-native and its rdepends
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
X-List-Received-Date: Mon, 13 Feb 2017 21:05:12 -0000

This fixed the build, remove blacklist also.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
index 8b5394e..14d4e69 100644
--- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
+++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
@@ -16,14 +16,13 @@ HOMEPAGE = "http://pywbem.sf.net/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 SECTION = "Development/Libraries"
-DEPENDS = "python-m2crypto-native"
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}/${BP}-dev.r704.zip"
 SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
 SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e633ad07b7c11d89db2472b9f923f3fd3ed8"
 
 S = "${WORKDIR}/${BP}-dev"
 
-inherit setuptools python-dir
+inherit setuptools python-m2crypto-native
 
 do_install_append() {
     mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
@@ -34,6 +33,3 @@ do_install_append() {
 }
 
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[pywbem] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130596/"
-PNBLACKLIST[pywbem] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130681/"
-- 
2.6.6


