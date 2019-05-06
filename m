Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 306927D543
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 11:27:20 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y8so10505586ljd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Cwm86sfr8FMKw9eST+7TPX5i8X5mDYf22wBjOF9NXH4=;
	b=iu71ZvNJ6w0tyL84fBFHoPoW2OvpsYCI2uyejHupjSWSHx88SErdjGPBActoJnkH7m
	nblxMrApCvLaYtbVh5zL3M3d1Tvp0MPnfUSEuMYuPkSi8zHoT3G7yH612WTeIb5xk551
	Sz7tuVziPeL+3CpjK3Yl2riYOzhMztozNjFGXQVlU+rwwkkBdW9I9HMEjCezD2XMRI3e
	HENMLlJGGaX7SIyJlFhWZT2CzWfiXW5L28GKVv0gz8MEmeh9uiTV58rD4TXDeXqRxeZA
	2ZVGiDGOcSiIQdA6QewT5frFiyN8iUu69CZXtn8AdJxQjWmdskFyL37tdVhLEnnK57hu
	pu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cwm86sfr8FMKw9eST+7TPX5i8X5mDYf22wBjOF9NXH4=;
	b=ViSVZxlvXmBbqXXkrzBm+rbL4spBk2R6RqXOwgZBY58kA+TJfNP/nPGQ/w+XMR3hlY
	7Dy5iqb0uuztfKcmT4TKThMYva1UaJ2+cf/hfT9ARMV6u5/GDUeJ2VnWis2E/z2j/vsp
	IUf9AYHvLB2tDtCYPrt9HNePtwIo99H7P7lZg71A4/SQlRwmKlZ4F4xXFpkliQdQoMfs
	FRFxNN0uFOEew/TSW4VsxTfwwNEumjPA2tqW1nRqO7Pz103pgreOB7gnJk+Ygvo2NnFq
	gpTKarBisghAOm1HESIgNb4PL86eVEmkPjJQQzeyrCiYXxo5AnWRMskXCzFBGIW/E2vB
	FkPw==
X-Gm-Message-State: APjAAAV4PzqgLDPQQ6md18eGoFvFaGAsq3WEEwB9Z9hlc5dtEZjgzVf1
	+bK3Jf07+zKUXRyzVh3V/k06xpsKWOY=
X-Google-Smtp-Source: APXvYqyULTPGSZ6kExlGmNUwIFPZrkNT3usobl8MRaaXMlyMcugq7bhW8K5Sksb5ReYMDdFVtqZwPA==
X-Received: by 2002:a2e:9a8f:: with SMTP id p15mr13283404lji.191.1557142041508;
	Mon, 06 May 2019 04:27:21 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id i73sm493127lfe.22.2019.05.06.04.27.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 04:27:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 13:27:18 +0200
Message-Id: <20190506112718.24206-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] ypbind-mt: update to 2.6
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
X-List-Received-Date: Mon, 06 May 2019 11:27:21 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nis/{ypbind-mt_2.4.bb => ypbind-mt_2.6.bb}            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/nis/{ypbind-mt_2.4.bb => ypbind-mt_2.6.bb} (85%)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.4.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
similarity index 85%
rename from meta-networking/recipes-support/nis/ypbind-mt_2.4.bb
rename to meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
index 9822f455e..1a64e6c2e 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.4.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
@@ -16,7 +16,7 @@ the server which answered as first. \
 \
 This is the final IPv4-only version of ypbind-mt. \
 "
-HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
+HOMEPAGE = "https://github.com/thkukuk/ypbind-mt/"
 DEPENDS = " \
            yp-tools \
            ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
@@ -28,13 +28,13 @@ RDEPENDS_${PN} += "yp-tools"
 # and is used in place of it.
 PROVIDES += "ypbind"
 
-SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
+SRC_URI = "https://github.com/thkukuk/ypbind-mt/releases/download/v${PV}/${BPN}-${PV}.tar.xz \
            file://ypbind.init \
            file://ypbind.service \
            file://0001-dns_hosts-Fix-build-with-musl.patch \
            "
-SRC_URI[md5sum] = "1aeccd0d11c064d5d59c56941bca682b"
-SRC_URI[sha256sum] = "a2e1fa8fc992a12b289c229e00e38c20d59070c3bcf08babf40c692515c340e0"
+SRC_URI[md5sum] = "7cf89641fdc128d0919207e4b7caaf1d"
+SRC_URI[sha256sum] = "0696c0263c4fd48a4ff2ce6c109f05f37aab0f71646d81cb22c7c28591bf80eb"
 
 inherit systemd update-rc.d
 
-- 
2.17.1


