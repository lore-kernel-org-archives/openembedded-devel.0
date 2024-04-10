Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A7CCD1284
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 22:30:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3879.1712788251462360836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 15:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HYxWU/Sg;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-417c5cc6be0so4851695e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 15:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712788250; x=1713393050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUSP7C4k0Tk+NCfKEaP5UfkmqslCeBrcow4Od8DNj8k=;
        b=HYxWU/SgPP500Uy7dPv1+cOJad/1sz5dBGdUXLutuDNtV2OXhI7PmO+no1iqWhnwms
         8E4uuIILg9CTJNUruAVaKpr+06wnRj7682zdxLGQ2Zs/nlCnRX5f1fZPp/+2rnaSp706
         gAYpkrTo81+6b7gFR1DxSwe63i1v9FBuWhFJVir2UhKxWh2yzDArpF67OohBRuccwLWE
         Ly2AgZU+TDGX3fD9qCOGmcTdyYmcRCQC73VofZQw/cwX1rFuqFlTIJXcLY2v9Ccot3PI
         wcKIJOmP9YG5goDaZiLMx4ggLyL0COWWexk8sT25IuCto/xD65+eCDGbkQVFD9YQpACu
         GFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788250; x=1713393050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUSP7C4k0Tk+NCfKEaP5UfkmqslCeBrcow4Od8DNj8k=;
        b=loxQvHA1j51KsFMWY74Yb0S1183OPdwoa0QJdXGtLlQfC2/VLAm0Egf8UMLlaLZMot
         f8+L8t/FHYXR7IhumB1OLLjYeaXfXIyA5z9Vl7ujhId0aeGF3ReSSSMyGpAVqIyA9vy9
         nbIzEzzkNo7EEHWzZg3DnQaDqOCHIBGshhftVjKVbL1a/RqIMnek9tDQ3iKm5TQkb/10
         sUowlu0+uJ6f0y4nUUwzwNcKSEoJXWl8Bd0+qp7IE7nKDelf3XMjQGrZ6F1GkZdo8Ia8
         TJIvB5wSz1qGbmEv2q4GYbRewj7ilJ2NIWYA/k7tuPugPnZDJj42MP+zQNTrS7G0Nxej
         Lh4g==
X-Gm-Message-State: AOJu0YzWec2muBQ96FWbjOjOHGLz31y+MkKAltoC6jewznOXTwwlLQCX
	BqbR5TUAsJa1d5eV+2krBaqdeOdUS7t5JK7yyfItCvFiSru5GFkm/LuRBw==
X-Google-Smtp-Source: AGHT+IEMfH/+1l4K1orjxLXM26GA6GfFvkf8PuVmfRUuWO3mUxbBBElbfR8rNk51RFv9epXe3Ypidg==
X-Received: by 2002:a05:600c:1994:b0:417:451f:4f4e with SMTP id t20-20020a05600c199400b00417451f4f4emr2033261wmq.0.1712788249666;
        Wed, 10 Apr 2024 15:30:49 -0700 (PDT)
Received: from swi-bsandu-l1.corp.ad.wrs.com ([2a01:4b00:8855:a800:372b:2c54:3f1e:3d02])
        by smtp.gmail.com with ESMTPSA id j3-20020a05600c1c0300b0041690a1c9desm376145wms.30.2024.04.10.15.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:30:49 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] libtorrent-rasterbar: add initial recipe for 2.0.10
Date: Wed, 10 Apr 2024 23:30:25 +0100
Message-Id: <20240410223025.318718-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 22:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109911

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../libtorrent-rasterbar_2.0.10.bb            | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb

diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
new file mode 100644
index 000000000..084e3c408
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "libtorrent is a feature complete C++ bittorrent implementation \
+	focusing on efficiency and scalability."
+HOMEPAGE = "https://libtorrent.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8b6cb42d66e6b3c47a909c3ce678a7b"
+
+DEPENDS = "boost openssl"
+
+SRC_URI = "git://github.com/arvidn/libtorrent.git;branch=master;protocol=https \
+	git://github.com/arvidn/try_signal.git;branch=master;protocol=https;destsuffix=git/deps/try_signal;name=try_signal"
+
+SRCREV = "74bc93a37a5e31c78f0aa02037a68fb9ac5deb41"
+SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
+SRCREV_FORMAT .= "_try_signal"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig python3targetconfig
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
+
+PACKAGECONFIG ??= "python3"
+PACKAGECONFIG[python3] = "-Dpython-bindings=ON,-Dpython-bindings=OFF,python3-distutils-extra-native"
+
+# Strip host paths from autogenerated files
+do_install:append() {
+	sed -i 's+${STAGING_LIBDIR}+${libdir}+g' ${D}${libdir}/pkgconfig/${BPN}.pc
+}
+
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '', d)}"
+FILES:python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/*"
-- 
2.34.1


