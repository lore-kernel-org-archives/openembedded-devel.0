Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A484AC4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:22:54 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.13644.1699370565039231229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VfNqINSU;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso9997831a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699370563; x=1699975363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rShIYh6PYOUNMrobb9EJ3g6kVMp2JjgKREVzNTy0Smw=;
        b=VfNqINSULW6/gzGn9X6ovsCwjup73eT8EUd7rCk4VwCMZ92HeFdz3BXwBiHS11vFAa
         CR19+xFKrsqVVAmHvgKyj7ORylwQIelcwYa33Mfzr2U2gpCaj/Kj+E7nh8NhgAupNYsv
         6V4NlYNnVcher6e+hgl4Z9DFDctfwlGDPWQ24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370563; x=1699975363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rShIYh6PYOUNMrobb9EJ3g6kVMp2JjgKREVzNTy0Smw=;
        b=F2++0cudBMmff37eQMR2FsgbEFV+9xHA8s7gz0Vgi/n8RGujqyK/a5Qivd2htarOMp
         WwCfi8J3EFI/oLRqrZkGOz1j4lcxjrNrx5/QXZdHwGA2BBc6GyiDpoP6H2+mPlRisjj+
         Apsyjk63sg9Wa7rTuaL7jAO9jm2dEWIGvneA2hCjIiudQB5a72kucUPnr6V/OGkOAGUe
         jvQhe+OxzNMuSQ/KAlrWdKClnwCrKKNi3Uwo1TJ2LTXgb/kF7C1RA9D0bMjMtR2DAcoj
         qin0aBYX99M0JaoJiskm8QC22jGzpKMBqardczS0T4c5h1DMFHrPOvT6tC45YEkMWM9Z
         nG9Q==
X-Gm-Message-State: AOJu0YxW6gfaXaYyZViyt2rCRu2Imf26oWNGpEbp0cU7w9aQDcxhIdoY
	3K5jYPH2GpQ1AoQZnU63sBx3KKnt5hgC8asmiHs=
X-Google-Smtp-Source: AGHT+IHhzDgQqQddZP7WqaQOadO/wqK3T08M8GTvL+GY0yBXTvL3oOcF9YjuHX6DboiY8cFPYq2YBg==
X-Received: by 2002:a17:907:3f17:b0:9be:84c1:447e with SMTP id hq23-20020a1709073f1700b009be84c1447emr17695710ejc.41.1699370562788;
        Tue, 07 Nov 2023 07:22:42 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906168c00b0099cd1c0cb21sm1136897ejd.129.2023.11.07.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:22:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/3] qpdf: Update 10.6.3 -> 11.6.3
Date: Tue,  7 Nov 2023 17:22:38 +0200
Message-Id: <20231107152239.2219002-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107152239.2219002-1-leon.anavi@konsulko.com>
References: <20231107152239.2219002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 15:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106455

Update to version 11.6.3:

- Fix a bug in which qpdf could potentially discard a character
  in a binary string if that character was preceded by an octal
  escaped string with fewer than three digits. This bug was
  introduced in the 11.0.0 release. The bug would not apply to
  content streams with default settings.
- The linearization specification precludes linearized files that
  require offets past the 4 GB mark. A bug in qpdf was preventing
  it from working when offsets had to pass the 2 GB mark. This has
  been corrected.

Switch to cmake. Use /dev/random to perform encryption securely.
Change the fully defined path on the target to about buildpaths
QA issues with libqpdfTargets.cmake.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../qpdf/{qpdf_10.6.3.bb => qpdf_11.6.3.bb}         | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.6.3.bb => qpdf_11.6.3.bb} (67%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
similarity index 67%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
index fa33daf52..17a65acc6 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "PDF transformation/inspection software"
 HOMEPAGE = "http://qpdf.sourceforge.net"
 LICENSE = "Artistic-2.0"
 SECTION = "libs"
-DEPENDS = "libpcre zlib libjpeg-turbo"
+DEPENDS = "libpcre zlib libjpeg-turbo openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e8fc23b2a584ea68c963a897515d3eb3129186741dd19d13c86d31fa33493811"
+SRC_URI[sha256sum] = "c394b1b0cff4cd9d13b0f5e16bdf3cf54da424dc434f9d40264b7fe67acd90bc"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
 
-inherit autotools-brokensep gettext
+inherit cmake gettext
 
 # disable random file detection for cross-compile
 EXTRA_OECONF = "--without-random \
@@ -17,11 +17,18 @@ EXTRA_OECONF = "--without-random \
                 --disable-check-autofiles \
                 "
 
+EXTRA_OECMAKE = '-DRANDOM_DEVICE="/dev/random"'
+
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
 S="${WORKDIR}/${BPN}-${PV}"
 
+do_install:append() {
+    # Change the fully defined path on the target
+    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BPN}/libqpdfTargets.cmake
+}
+
 # avoid Makefile returning error on 'make clean' before configure was run
 CLEANBROKEN = "1"
 
-- 
2.39.2


