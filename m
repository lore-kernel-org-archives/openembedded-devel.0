Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3856.1794729113692483174
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PHDN5Ct1;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37071c0f42aso3571718eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729113; x=1795333913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXsMAAD+uAB81slAMaTHbPVyWLKMkIREBcyTvFjh0hM=;
        b=PHDN5Ct1OAAWnEZ9ZU21Cryx63pIh8TZbvcU0w+qwcA2JGlqiEf+izXA68MgTRBUuR
         bjiXV3mmTCn3Y7k4f3RUdDa5LEF0B02Ku8GYLiZFW5BUnCRbG81tPZriBSmOq8ychHer
         efQ7rYKsMB/Xu0H9Q2PQkHBvwndUr21r7K8TGFhR3MUWt6sPLJRtBfeRFRYnD82eexoP
         4eBlYoqX/4hPcZQNLVvExSO4N1TCS4vkC/Es8p/PT32vAPc00tpWmVkp2I+oOaCydiYG
         h3OC2KTKwzshTlYzSq9uAP4TwUuYspq7eG37bqCXUXq1eQjBI/08bVdbRRP0c6aJyTNN
         g8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729113; x=1795333913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXsMAAD+uAB81slAMaTHbPVyWLKMkIREBcyTvFjh0hM=;
        b=ylRhlhr3970lqoStKcsMwu/oqQzwtNlJjRyyugFm/aJglpvWr2ZBPp1yXuxhp1yDQB
         Nbhr5cFLeXpOhRVYGHdg6rGmMcSPrc4ROEO7/L9rTQupz/B7GnAKcitxXRZlgXMYRKXF
         oAkT0eeooBs1qk3ZHNTeOwcDE+ERjzbXGQGqGnHzaZDrHo9QJPD0sLwtfr2CicIsRGyS
         TlqXq6UxKs9kQuN/u7TopIX7cYlizusswAVY9X76yvmDgBeiHpSoB/5TJSxW/Dne/+zv
         /Ei50TO+WbGjy7iopXnA/y7htHfCrvVMSiiZEqnS81Rr9AGrbnM0zmhb8XIszUw75m7C
         PlRA==
X-Gm-Message-State: APuU4Z9Rv/DbyALejrXSAtR6eaX80viQa2Lp8Bla2FYQ2EYIlXz/AX9H
	2lASbpDDRLBpPDSp1rBe0HPXXKhI84aY/VEL6J381h6OLFrEhMY5W3GnwjvLy6RS
X-Gm-Gg: AYBFou0RrmUMrWOEl3KttDd1uqnKm+Nih6JbTHC0WCubvwF1SjA1erK0Uqc7OKtmimc
	tA9QluFyFXBR7FumjroXjuok1JEe7DTA9PPx+2aTAA11WMdhkimdRE5S5XUuNknjrBDr7WNZAsB
	UMq/0xEipVgBRsWA22lZq05hdC2EDI7AwypxP2PdpuRDAUNpwGuFMCMJmZ/PyzLNUFskELKV+B8
	YdBDiFqQGHK7H4uYsJbiTyPZbAAyTNwHt+VCxwZB5T5OxBp/hTqXZEwVR0k1vKVACfiXABu4cxG
	2mHvnJ1H7IfVJqwySfLQ0C4UevGGLHbnXfGqpG4oHQF9LJYy+YhEDXJRIA5LyEjBicSwwMbEWCi
	c8AkFC1dV2glI1kQGn89skRE7qcYEhfvLXxfuFguiP4yA8nXnoW3XzXpR+I6k9KsBwiJqT26Ay+
	53WUao3FAWfcHuVtZRIcm0V8ySfOMXHb6+mE3kOPA/pCAUGGBpZelg+Q1zJDxdaXA+Mvbq9GFq6
	1XRheKnkksOt+lCLrJ3jd6MDU+GFI5LWNLpp5sU9F8B1Q1tfAUIKCtpNgyuSBtnV+Tc6FEGv2hv
	NzKw41ziO6tv0Ae8VXCu7jqBB+tLZQaAypVA794gDuK7kdR9D+OHTp3qnh/q8TyNjYSg+2AgiFV
	ieXMH0yyAbi32mLIgG7sy1SMFdCDLO7MGdEWoG1jM+JwzOCRa+N6olpmbBykk5PUAM2o4poPj9A
	vAfuOtYUjfbPHTvr8w6FiYdlnXKj8F57BBJ8fv+zvsLerUln3hlNWG2/111XUH8K/Qeb9buP6xB
	KKrbsDxy61LXP9Y08opnX4OcphcLERVZ5kmao6WItwDVMaYRjDljcak/YQ04ft3kqi+OUp1H0B5
	tS9r
X-Received: by 2002:a05:7301:f2b:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-37968d8b5c6mr7404834eec.40.1794729112988;
        Sat, 14 Nov 2026 23:51:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 93/96] libcupsfilters: Fix build dependencies for 2.2.1
Date: Sat, 14 Nov 2026 23:49:11 -0800
Message-ID: <20261115074918.2932593-93-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132363
Content-Type: text/plain; charset="utf-8"

2.2 replaced qpdf with pdfio and added JPEG-XL support, which is
enabled by default and makes configure fail without libjxl. Depend on
pdfio instead of qpdf and poppler (only pdftoppm is used, at runtime),
and add a jpegxl PACKAGECONFIG.

Also strip the recipe sysroot from libcupsfilters.pc; it embeds the
cups pkg-config cflags (dbus include paths) since 2.2.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
index 3e773715d5..5fa268295f 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/OpenPrinting"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aab2024bd2a475438a154cd1640c9684"

-DEPENDS = "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg tiff"
+DEPENDS = "cups fontconfig libexif dbus lcms pdfio libpng jpeg tiff"

 SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            "
@@ -11,6 +11,9 @@ SRC_URI[sha256sum] = "0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8fd73710ed82

 inherit autotools gettext pkgconfig github-releases

+PACKAGECONFIG ??= "jpegxl"
+PACKAGECONFIG[jpegxl] = "--with-jpegxl,--without-jpegxl,libjxl"
+
 # github-releases defaults GITHUB_BASE_URI to github.com/<BPN>/<BPN>, which 404s
 # for this project; releases live under the OpenPrinting org.
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/${BPN}/releases/"
@@ -18,3 +21,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

 FILES:${PN} += "${datadir}"
 RDEPENDS:${PN} += "ghostscript"
+
+do_install:append() {
+    sed -i -e 's:${RECIPE_SYSROOT}::g' ${D}${libdir}/pkgconfig/libcupsfilters.pc
+}
