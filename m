Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id BCDE478694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:51 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id u13-v6so643539plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Wga99t+7LgVSUTeewSRRMKh4Xv/yJaUnGnUDkJ+I2Js=;
	b=nIwSjSR9WodmiDZ4mHWtJdh5PeQ+isfYJqrgkRNJmIw1sObuONvCLWX3gy2qa7a2KQ
	urPcaNjAwUGMIKEWzR5pMLUiHMgc8JoF5D3LzJZfZj2u/NvMicTI9fjk4zXBgim6tRGX
	8khjXickrklwABGVgGjvOfXBQgi18xxfqfQMB6GV8JcD60UtUHNx/yHTZtxUiv9JJHwm
	wZjQKFfK2cG4g1Ip4HnXEjnyviEX5VQMlNrfbzl4OW5NDS9oxfTPLYD8Bk04//D4pffP
	iZ8RRbMiXGHIHwk+ZWqibQ+L+jEKR76AnBqo3G/44X03WqObYeZsU+F5+wBCf60LHFM6
	mroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Wga99t+7LgVSUTeewSRRMKh4Xv/yJaUnGnUDkJ+I2Js=;
	b=bfSA8Tc/yoY8uhTd8++prcSSTV2SoqKONqQ3JG9RvD7xJMHKgTp7pSjZJzzBXGyQ90
	/gatZpjKTAaVXtClxpbSJplDCrDidWC8eJHxQiG4PX7kGlMvZfR43o6Fx9rsNY/wozjd
	Tvrd0nDty5iF/rCTs2cJYjVpsa1/CnZ+Eyy9X0IGNcKypFRH4EUpajAZQqAYlgOLq6fm
	7Ftu5DjVB6ZcrYbFmAumhz8kUGkqzYNePwTjeR7ZNc4YDbFQjtrhwgz9g0PQ+RsdJ3gj
	49khOi6qQPV7RBa9kzR3tZ0iDulLqRp54miflZv1A1niIwsvn8ujRbeh2MxvIa0v0BmQ
	L38Q==
X-Gm-Message-State: APf1xPAMSl0HNiPUe05R9K1KoCpJciY2r6P0s8l3NxDCbATiJ/OzlFyW
	eGYWylUBhYkJsZViwrSK3U0=
X-Google-Smtp-Source: AG47ELsS4lhDhSlhN59hVsFzT4/erFx3b6zavEg8Ov95IzS73VoyDEdTEnY1NpXmKf46VJ4yjpww5Q==
X-Received: by 2002:a17:902:bc02:: with SMTP id
	n2-v6mr19051746pls.52.1520395433196; 
	Tue, 06 Mar 2018 20:03:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:28 -0800
Message-Id: <1520395408-19266-25-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 25/25] xrdp: remove fuse from depend and move to PACKAGECONFIG
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:51 -0000

fuse is in meta-filesystems

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
index 671a251..3ef7c98 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
 
 inherit distro_features_check autotools pkgconfig useradd systemd
 
-DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native fuse"
+DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
 
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
@@ -24,6 +24,9 @@ PV = "0.9.4+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[fuse] = " --enable-fuse, --disable-fuse, fuse"
+
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system xrdp"
 USERADD_PARAM_${PN}  = "--system --home /var/run/xrdp -g xrdp \
@@ -37,7 +40,7 @@ FILES_${PN}-dev += "${libdir}/xrdp/libcommon.so \
                     ${libdir}/xrdp/libscp.so \
                     ${libdir}/xrdp/libxrdpapi.so "
 
-EXTRA_OECONF = "--enable-pam-config=suse --enable-fuse"
+EXTRA_OECONF = "--enable-pam-config=suse"
 
 do_configure_prepend() {
     cd ${S}
-- 
2.7.4


