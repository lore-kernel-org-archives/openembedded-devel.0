Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E21571DEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so15739302wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SZ1uVZlUcSXKlsAkZfCwgOBcTvm3jnqhwaCCzV2K1xw=;
	b=LBaWEqeG9g0Esplmo3WBLE8Glho5pYC5A3ilUn0L1vVT500Q7aJlDORHNoyMGCO9KF
	AbbSpr9hf02KLMrr54srJxDNYGgyFUB+r9ACCL+Xwc0ALjVu3Ngu8K1cj21VBPAZRql/
	kU2sAAIbY70JIMJ4DwhZERdYosmD5EiH8jeP3lyLq/78WwywmGUBYMUGT3yDclslyLbJ
	jGJqGFFdOOPcMVXMU6VDsPKpY/Hu8IxpmbiVACaLFL7nhnam7KgKFaHisWO0V0tB9Inh
	jfmqNwl6aJlMNrvJdHAcXQWAr4zvfWHSxyx5MEOboESB75VxseH8ok3q+y7WpNjw8VKM
	toUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SZ1uVZlUcSXKlsAkZfCwgOBcTvm3jnqhwaCCzV2K1xw=;
	b=WfnqKy8YvuRX+R9pPTNF8Htz1CuIgcp9C7LqIL+M5XrISILdehyW/uFdCvLtyGGac9
	lbiKsHi7iKMSseY2vFmv70bg4gwF87SPgMxQrC75//3khM4gDrXZGerEwzcKl2bvHp+W
	JcvMxfJ2BlN4dvAPtcuM8o5Z92ubWVcbEdHCIdHW9EAdGkxIZc6OuZzkhfRrI5m0teRD
	1nuaxShRTw1CRwbvhQrk9l711ZOVf2Sl+B+5E2G/1Pqet3nVubJ+x0TSniPzzyitqEWG
	zCCma3/KiXYrsDfb2Srxjr74jxbJoDIgXZgoH3iFDbDblHNah+Suw+kjstUbKBwuFptf
	GRGA==
X-Gm-Message-State: AMke39mzPRT92dsToiYaonMnSTlAUXdL8X5loXNixlcxqHaFa3JYBgncXd/pRoC/pkfGkg==
X-Received: by 10.28.109.200 with SMTP id b69mr20812234wmi.94.1487614051273;
	Mon, 20 Feb 2017 10:07:31 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:31 +0100
Message-Id: <20170220180700.29836-16-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 15/44] imsettings: fix build and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* libgxim is back
* inheriting gobject-introspection fixes:

| <...>/imsettings/1.7.1-r0/recipe-sysroot/usr/bin/g-ir-scanner-wrapper: line 5: g-ir-scanner: command not found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
index 590d9b9..e35e8b3 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
@@ -7,7 +7,7 @@ This package contains the core DBus services and some utilities."
 HOMEPAGE = "http://code.google.com/p/imsettings/"
 SECTION = "Applications/System"
 
-inherit autotools gtk-doc
+inherit autotools gtk-doc gobject-introspection
 
 SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
            file://gtk-is-required-by-notify.patch \
@@ -28,5 +28,3 @@ DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim xfconf intltool-native"
 RDEPENDS_${PN} += "bash"
 
 FILES_${PN} += "${datadir}/dbus-1/* ${datadir}/gir-1.0/* ${libdir}/girepository-1.0/*"
-
-PNBLACKLIST[imsettings] ?= "Depends on blacklisted libgxim"
-- 
2.9.3


