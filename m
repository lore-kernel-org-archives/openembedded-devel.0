Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 13F7A77230
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:49:33 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id c4so3613102wrd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 13:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C3wHIE5jH9WxuerS993ONSdqJCUacAGDwsK7VCwPjvw=;
	b=mt6zNeGBOv5I76GmtNv/+BX4WJR9uSrndXsjaabp+ZDEtcPYy2moTlL10FPtAe96iX
	wONjqcC0mckPQG6ycQFRv1skmYSE+amla9fIL1geD6P23+d6DXAZLhgGD0vECHi5+HcD
	BbYOpyeTPL5PzxGWSdMHS2hPad/V4PEWqrTV2iOO7eR6AjbQPL2KFXH37hjRBwXm/xZ5
	WzhqiB3uJ5t1N2ltTs08IFAe8infbRcgf78plGf/wPiov4x5Rz9m1UzyXOMHwEesbDug
	GNvbXveIYKj3ETjTeTBTA29q9G+nIBwZNhw3VdIf0YQ3ju0goaIpp+eMw2DoL6k5snPz
	WSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C3wHIE5jH9WxuerS993ONSdqJCUacAGDwsK7VCwPjvw=;
	b=pNuyR/TxtRQhygnsDwWuOQC2AtYb1VbxyfNgNwP0ls7a87YW/Tiv313koufkaNsDjk
	uIuK+wGpqw7YbtbZn3P6zEzcJQI3xR8Sm/82qu+j3luVXgduUWm0gkAck7NSqWhg0UFT
	Sm4a6I5WYPKhjOeXQSl1fZtYWbWYJuLOxI0Fz7HUOJtcXh9DOmUf6w2F/Vm8Bc67qp8R
	ZBFFQKcnN2zsketHJxWImVBayBeNulL67lmC0o5DRtU75dD8M3xyFBfOGNrCFGwBcs0v
	w17ckhDHrg/4IRL6jf4oHu9gIEoRinsXh6nzpIC/Z1XsYGY/qdUHQCedPRC3ZWGrwjbG
	qhNg==
X-Gm-Message-State: AMke39nICxPgUEpIGD4CaAo47e3gWFnTx723yY2dMMYctR/SfoPNCrRh20NHsin67VLLPw==
X-Received: by 10.223.166.137 with SMTP id t9mr26251161wrc.15.1487108972511;
	Tue, 14 Feb 2017 13:49:32 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	u47sm2355480wrb.15.2017.02.14.13.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 13:49:32 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 22:48:59 +0100
Message-Id: <1487108941-20285-3-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
References: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH v2][master-next 2/4] crda: add depends on python-typing-native
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
X-List-Received-Date: Tue, 14 Feb 2017 21:49:34 -0000

python-m2crypto-native requires python-typing-native.
This fixed the build, remove blacklist.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 2aa9a09..82a297b 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "copyleft-next-0.3.0"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
 
-DEPENDS = "python-m2crypto-native python-native libgcrypt libnl openssl"
+DEPENDS = "python-m2crypto-native python-typing-native python-native libgcrypt libnl openssl"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
@@ -34,5 +34,3 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "udev wireless-regdb"
-
-PNBLACKLIST[crda] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130675/"
-- 
2.6.6


