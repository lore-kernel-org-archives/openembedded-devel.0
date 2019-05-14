Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2393F7DE68
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 18:34:27 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m20so191428lji.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=v8dTI+zE07cpWihWqdiMGqzhes4k10qbNscHbGutGqs=;
	b=YukqkoZaQtp32m3Y3M7HquiDHm4oCzRpeUzPFsgL9qezEjxIyOz7LFKGi6724eMX1H
	I44pec8U4OOYv7ZUj351cdxfk+ExSe8zOS07Wx6LUL42mzN/and7S/DuL6o3aZdMpl/2
	CbNmDQp4YoDbEdQpjWFMgbtjxN7ZPBCHZ3Ccf4D0juxyQBkLUqNz5Wdy5S4Rn/wn7a0a
	AeRsIn5Jy0NIwlM05RXA1ltgAvrCtykB8Tg+8MXV/qJPb4ViPSYO1B5XwG2o/f8ud3Ve
	C4KPfdS7JGLaXwiTM7wp3cygYBKziQ8oPn2P1F8toybZ9fu8eSrTx/pAt1i2UKKHLzZi
	YFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v8dTI+zE07cpWihWqdiMGqzhes4k10qbNscHbGutGqs=;
	b=lxdJGFWgHhKOlKXshYkn+xitfLnrAFXPY3+WABB/fYRau01inW4ht9Uza3Du3pH14k
	zv5dy80Xpi2EZpfJjGSGQqrIK1CtyzdPcLaFsonp3fumdsXPkdZNCMxX5fjwMCahcWPW
	3LOjFrKtD6ggtZRsNwFD3kziZSglkzgx4fTShuxt4KyyIT2NwO0AHBLtK2SiSzV65LdN
	i7W6WIh/CnALpywRmrjZc/UVt+Ro8e25YFjZypGLCQQt6VZ+6lUF3zLqLXzQSxcBDt1q
	rIfwN3QR+hFNKtftQRXM66V18J5KSrBkQyo0p3DuaSggChUuZTCSbFq0lyokA1zKHvjZ
	9rEg==
X-Gm-Message-State: APjAAAUeSL8+tDdAxHVyrvYVPHOV67DOv2fxdfFxSnZnxoZLz37SF/ET
	9H9T8U+HhthQYS5RHAwOPrENAVdbFEQ=
X-Google-Smtp-Source: APXvYqygO2+H4fJE/jH6TE/7Y/F2xLUjQ0yL2TAvO/FU4+SkF1OpgwAS18ZzuAs9BNK5x1YnGLFiHg==
X-Received: by 2002:a2e:7f13:: with SMTP id a19mr17802338ljd.35.1557858868245; 
	Tue, 14 May 2019 11:34:28 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id m5sm3909635lfb.47.2019.05.14.11.34.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 11:34:27 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 May 2019 20:34:26 +0200
Message-Id: <20190514183426.10282-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] xl2tpd: update to 1.3.14
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
X-List-Received-Date: Tue, 14 May 2019 18:34:28 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc          | 4 +---
 .../xl2tpd/{xl2tpd_git.bb => xl2tpd_1.3.14.bb}               | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_git.bb => xl2tpd_1.3.14.bb} (53%)

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
index d037c7cfc..43942bcae 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -8,8 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/xelerance/xl2tpd.git \
-"
+SRC_URI = "git://github.com/xelerance/xl2tpd.git"
 
 S = "${WORKDIR}/git"
 
@@ -38,4 +37,3 @@ CONFFILES_${PN} += "${sysconfdir}/xl2tpd.conf ${sysconfdir}/default/xl2tpd"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME_${PN} = "xl2tpd"
-
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
similarity index 53%
rename from meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
rename to meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
index 88ae5d6f8..f03b537d9 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
@@ -2,7 +2,4 @@ require xl2tpd.inc
 
 # This is v1.3.6 plus some commits.  There is no tag for this commit.
 #
-PV = "1.3.9+git${SRCPV}"
-
-SRCREV = "f114c10ac532051badeca0132b144a2f1596f047"
-
+SRCREV = "ba619c79c4790c78c033df0abde4a9a5de744a08"
-- 
2.17.1


