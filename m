Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C746731F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 21:05:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so350859wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=krxzeRGrl9hUeMWZB9UL3aBS26Cg/fgl4CU8BHNaLSw=;
	b=DqHCcWj0TCAYUYMuYB1un+AQnfryU7vYoDFpvJz5FjnGZVEpKjOcoSkFik8kxtpzB9
	K1rTr00EBHOGMSb5BNTg/jFeTxLMYGxHwFyO1/UNu8OrOco5QAlCmKLaMSH9b1Hmb8/K
	bRbSfOaJtcGLHjGi2KDEVjYl/3lFNS/mmtVyJcs0lxVjdRIBRyIgRSQlKH6eFw/hACAn
	F1hBLR/I/8+mpxLc8ueR7yybDjdvXHjoAWW8gSj9gJzz8GxqAMR5FwUEwlRViiJldo+s
	kMITaMSEE/u1knDsTOu7fW9QGBAkM75lkAPlzQVx7uA/Gf/+mZflZ4VrQhrqwr9VyPWh
	7Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=krxzeRGrl9hUeMWZB9UL3aBS26Cg/fgl4CU8BHNaLSw=;
	b=qIoecSuENNwArfrRh5DgjJDTSoufRnRfi8vIF7UBR0Mx9xJzf0jsFAxc0zRUKF5SNa
	ykK9GZ7MaQtTviNLxVX4TvSJEAkY56u3+26qjWUmoGC06eb8KxJiBtmdw/Eso236oRbf
	sItHAq9fSf3J8YFee4RM2Fu5uvHzm92XIHDZ1PFCTEcwlA0E4E9umHdSH1kmaQYvK/yh
	Ple+ZDtZdN7kukfPa3t7kjMz8C0kUzsFTh5uuWA11PvN74coR9mgg3/MR1Ugbp8k2HgX
	7LoIhiz0mRtKr6OBbNTLpqiDhXjWrzuzcgY6n6wGujmpCyEGKBoke4YXcc2gLbyBtS1+
	rM+A==
X-Gm-Message-State: AMke39mg1ulqMaklL8CntsH4wwlqsn+qDAcz5eehS6T+d5IJrDf8MPgFj1fkZt3EI9cHhQ==
X-Received: by 10.28.229.73 with SMTP id c70mr238697wmh.82.1487019910375;
	Mon, 13 Feb 2017 13:05:10 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	g11sm12212764wrb.63.2017.02.13.13.05.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 13:05:09 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 22:02:06 +0100
Message-Id: <1487019728-19329-2-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH][master-next 2/4] crda: add rdepends of python-m2crypto-native
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
X-List-Received-Date: Mon, 13 Feb 2017 21:05:10 -0000

This fixed the build, remove blacklist also.
While at it, cleanup DEPENDS of python stuff already added by inherit.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 2aa9a09..45ecdd7 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "copyleft-next-0.3.0"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
 
-DEPENDS = "python-m2crypto-native python-native libgcrypt libnl openssl"
+DEPENDS = "libgcrypt libnl openssl"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
@@ -18,7 +18,8 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
 
-inherit python-dir pythonnative
+inherit python-m2crypto-native
+
 # Recursive make problem
 EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg'"
 EXTRA_OEMAKE_append = " USE_OPENSSL=1"
@@ -34,5 +35,3 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "udev wireless-regdb"
-
-PNBLACKLIST[crda] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130675/"
-- 
2.6.6


