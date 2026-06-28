Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48BCC44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:33 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69108.1782634287233478716
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qjN0PSVG;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4928229eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634287; x=1783239087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idce55bgEOpdBEqGST6P51+VlIKnMmFARTzy4LzEzCA=;
        b=qjN0PSVGeB5rpkTIjgv54RxgzU8sSlNDPY1wtvqMp8MLsdIn8wJk3YLLNCxFqr5CMu
         s4wfkllL9kxD5QeC1y2LaOykHmWpYBbdWeWlvx9vTBhKo1x8frxildQA/v0sxIGhyLwI
         2MxfgFrTz2SrTCVay6WUomhzRF+vcH38FVnA03g774mGohAciE4GZ2/NW4Xfxvt4NhHN
         JNQutZZjW0s+5Q3KN4wFXMCkNGmfHWz4GkbcKDgM9+RIOnl4LLx9/WJ7OZ4j4s/5+PsW
         Oxta2a2jZgJtjXf6wZuqkgkRKmyFc1039qX1Mkzs5Uchu961q1OzxiF2OFwhRSMgF2S+
         mupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634287; x=1783239087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=idce55bgEOpdBEqGST6P51+VlIKnMmFARTzy4LzEzCA=;
        b=IgD4pw4MEDVb1eYoOcED22ar9YWvyeRhanA7UunNAoGrUz8WXnTIEkk3byXBlCvVA8
         7u937gc02GP+WSKe6sAZ9Gw4K7sMUTDTh6HHgY9DsZWThinubNaH4ymeI3pc6yj3MaXl
         swIKNV52R1/Niqk4d+uGz4SKBydseMJluwFJ+jq5f87YAC5vBJe51EdlW+cK6wJRppRQ
         79LSFBzHWp9CqdiwzH44R3onS6LKJMusUy6K4JFyk8sSkA5qONgkkCxNoXKgQh4bCR4f
         8HHyK36t7fw3m+2ROqe0zAMKGg5IDTDXhgU8zUmUp8fwpl+JPBPESJrQOy2e8iyH4gVX
         mYvA==
X-Gm-Message-State: AOJu0YzY3kmJfQr3Es90TtEsWp3qD7kxV71IcTHfLU0fnIGG2fGWtO5+
	xi6DsvvFq6Ayi1gH92kP49FwWz5FlvTZS+kB+EyIQObR0rlJEhMik7os5d7fQ5X5uOs33Q==
X-Gm-Gg: AfdE7ckTeuS4MpuQ9zSTjVZNT2Xcs9eh5/ZEeYqBRmQxd+4slrTW1Ia4HOZ/ntlrONP
	SLcL7cjNKVcqdZxlc72enepyaIqski/F7xxVbyuF3r7kS6SBnemQBO39ERCHLIH0K9fGoZAzMZg
	p2QyhqUuw5gCii9pQfUBYghnPB5dDMce6FxyiNkPfVLK1J4GGAy/3ZNEA1cqLkneq6xGCRz3GFW
	+OiFsvBKTtrzBA59YwVJhzMm1Y86DMnxOz0sz39mX6M5kM7DXkoUBwA1rJOnlAX7vHxd9Z/OHc0
	EChHFZ2SSJEBUPtJj8aGwrTCvPKGvoif0qPVA7HFuERGOmheBklimRHSbHi09Kq40xHHfMSmKrj
	CGrp0foM7I9FUwAT0cKzbfVck3l1PeRtolraPOd9FL2b+7LKYzNQoJBnDkvvaQa6oWLLpKjq3Hq
	FgHdYgLqIzzU9qvKZAbI4uY6XA0uYmltk1NQXbszw/BkQE8cylI6wbhS0SmgX33IqQkx+syIJRj
	t2rnlfqeAMufL6avyqwW79/zj2dKw8MRQKqxEHuTJnEofeC3uh4qGl9s82R0LOlRBXSBEnQ6fj8
	pwiFrwALB10MJreRKS634owlwGpw7w==
X-Received: by 2002:a05:7300:2203:b0:305:56a:c38f with SMTP id 5a478bee46e88-30cab3855f1mr6960082eec.26.1782634286538;
        Sun, 28 Jun 2026 01:11:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 002/128] pcsc-lite: upgrade 2.0.3 -> 2.5.0
Date: Sun, 28 Jun 2026 01:09:13 -0700
Message-ID: <20260628081122.178348-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127812

License-Update: dropped the doc/example pcsc_demo.c entry from the GPLv3 LIC_FILES_CHKSUM list

Switch to the meson build system.

do_package otherwise failed with installed-but-not-shipped files:

  /usr/sysusers.d/pcscd-sysusers.conf
  /usr/lib/systemd/user/pcscd.service
  /usr/lib/systemd/user/pcscd.socket

pcsc-lite installs sysusers.d to systemd's sysusersdir (${libdir}) when
the pkg-config var is found and to ${exec_prefix}/sysusers.d otherwise,
so remove both. Ship the systemd user units by adding
${nonarch_libdir}/systemd/user to FILES:${PN}.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{pcsc-lite_2.0.3.bb => pcsc-lite_2.5.0.bb} | 35 +++++++++++++------
 1 file changed, 24 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_2.0.3.bb => pcsc-lite_2.5.0.bb} (57%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
similarity index 57%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
index 9e3c98bb97..83edca23e0 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
@@ -8,17 +8,17 @@ LICENSE:${PN}-dev = "BSD-3-Clause"
 LICENSE:${PN}-dbg = "BSD-3-Clause & GPL-3.0-or-later"
 LICENSE:${PN}-spy = "GPL-3.0-or-later"
 LICENSE:${PN}-spy-dev = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9637dc508442c2f458df6444fca97e09"
 DEPENDS = "autoconf-archive-native flex-native"
 
-SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "f42ee9efa489e9ff5d328baefa26f9c515be65021856e78d99ad1f0ead9ec85d"
+SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.xz"
+SRC_URI[sha256sum] = "59b3c4b5be4ab228698edeb5b3ef46ad54ea217e7dd0891372770bb92b55db92"
 
-inherit autotools systemd pkgconfig perlnative
+inherit meson systemd pkgconfig perlnative
 
-EXTRA_OECONF = " \
-    --disable-libusb \
-    --enable-usbdropdir=${libdir}/pcsc/drivers \
+EXTRA_OEMESON = " \
+    -Dlibusb=false \
+    -Dusbdropdir=${libdir}/pcsc/drivers \
 "
 
 S = "${UNPACKDIR}/pcsc-lite-${PV}"
@@ -26,9 +26,9 @@ S = "${UNPACKDIR}/pcsc-lite-${PV}"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)} udev"
 PACKAGECONFIG:class-native ??= ""
 
-PACKAGECONFIG[systemd]  = ",--disable-libsystemd,systemd,"
-PACKAGECONFIG[udev] = "--enable-libudev,--disable-libudev,udev"
-PACKAGECONFIG[polkit] = ",--disable-polkit,polkit"
+PACKAGECONFIG[systemd]  = ",-Dlibsystemd=false,systemd,"
+PACKAGECONFIG[udev] = "-Dlibudev=true,-Dlibudev=false,udev"
+PACKAGECONFIG[polkit] = ",-Dpolkit=false,polkit"
 
 PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-dev"
 
@@ -37,11 +37,14 @@ RRECOMMENDS:${PN}:class-native = ""
 RPROVIDES:${PN}:append:class-native = " pcsc-lite-lib-native"
 
 FILES:${PN} = "${sbindir}/pcscd \
-               ${datadir}/polkit-1"
+               ${datadir}/polkit-1 \
+               ${nonarch_libdir}/systemd/user \
+               ${sysconfdir}/default/pcscd"
 FILES:${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
 FILES:${PN}-dev = "${includedir} \
                    ${libdir}/pkgconfig \
                    ${libdir}/libpcsclite.la \
+                   ${libdir}/libpcsclite_real.so \
                    ${libdir}/libpcsclite.so"
 
 FILES:${PN}-spy = "${bindir}/pcsc-spy \
@@ -49,6 +52,16 @@ FILES:${PN}-spy = "${bindir}/pcsc-spy \
 FILES:${PN}-spy-dev = "${libdir}/libpcscspy.la \
                        ${libdir}/libpcscspy.so "
 
+do_install:append() {
+    rm -rf ${D}${datadir}/metainfo
+    # pcsc-lite installs pcscd-sysusers.conf into systemd's sysusersdir when
+    # the systemd pkg-config variable is available (${libdir}/sysusers.d),
+    # and falls back to ${exec_prefix}/sysusers.d otherwise. Drop both so the
+    # file is not left unpackaged (installed-vs-shipped QA).
+    rm -rf ${D}${libdir}/sysusers.d
+    rm -rf ${D}${exec_prefix}/sysusers.d
+}
+
 RPROVIDES:${PN} += "${PN}-systemd"
 RREPLACES:${PN} += "${PN}-systemd"
 RCONFLICTS:${PN} += "${PN}-systemd"

