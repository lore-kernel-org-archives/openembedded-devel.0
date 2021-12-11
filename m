Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A503CC433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 19:33:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.25764.1639251206377892772
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 11:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=WjRag1Ye;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id bn20so18265872ljb.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 11:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hCmvoV0+tXLlUFStIyiPc9S5QrQyc46crDGkG8VdC2I=;
        b=WjRag1YeN53QM4Sch5m24cB64OXZvp/0k52tzVBeKKymU0PdZPs0P7JRtq5a6hLven
         b3Os7kU7s7FeKzulRrhIiK6p46CvexMNzHfNmfRVPFm1FC64j5DW9L3yXaGOx7xj0Uge
         hj/OiKh2W3p46d8ORyQjjp91bsbicUXFCdjyjviDZhp3VyMkhRC/VIJDTOmwN+4Je9dh
         xR11brbTlsSNY2AZl83MVJdwZhZrJWhb7KiEyedsJ7jiT0XQlBDRbqPKGTg6qrSHhwyb
         qo1ynX88a8lzvJmWsLpzT2svqYSMgkk89PXoDH3wTEjmHuPgIu8ZL0CIxy1tptsqvlzG
         5a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hCmvoV0+tXLlUFStIyiPc9S5QrQyc46crDGkG8VdC2I=;
        b=DsOGtbyF2JGHFwJvKFuOycDVeCT1Cw6azH8fCMCce+lXjstp2G8NwjNs5ZZJi8afHp
         3W/68Si/hHJSZ+cB1hcB0gCV/+BF0UnZLaxjLEU+6LgWnfnpovfEGGb0iIBRO15HJaz2
         nBdQhtAS8x8E7hPRjD+nLnMszrXEM7E0JnLhcoO6mIQOMyejHlxQuniZY/L8nUH/wkKZ
         1ic2UU3a31hTVdvCoOn9lwAzHVUlh/o4JuQD0s0AUGOvxtTt56iOnUaC2dAB/UA/B9rY
         +Eovkd3+PLHqkiO8eUiCZJKM/e8WF80NuLePEWagg+Jhj/MaxAfexjWfxfYr+TpeEKIl
         s9sQ==
X-Gm-Message-State: AOAM531SZM8h0iUql/zN++LwScVW5i6W3hdVzTLrAlY90JDqEQWvXBkd
	q4ZU3CDaRsfJDGcFeg41WIkYQDt925il61Pl
X-Google-Smtp-Source: 
 ABdhPJyWsACY7Nks72zSroHBr0nQq5nlyI0yWiC5AR3622LdLBAorK9YgDgMm1uJdSN06A4bSa2t3w==
X-Received: by 2002:a2e:8719:: with SMTP id
 m25mr19602449lji.145.1639251204182;
        Sat, 11 Dec 2021 11:33:24 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 q14sm738004lfo.143.2021.12.11.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:33:23 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-matplotlib: update to 3.5.1
Date: Sat, 11 Dec 2021 20:33:20 +0100
Message-Id: <20211211193320.2576886-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 19:33:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94297

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...b_3.4.1.bb => python3-matplotlib_3.5.1.bb} | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.4.1.bb => python3-matplotlib_3.5.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
index 9e933f5c4..f9eb79ff1 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
@@ -7,19 +7,21 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=282;endline=282;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
+    file://setup.py;beginline=296;endline=296;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
+
 DEPENDS = "\
     freetype \
     libpng \
-    python3-numpy-native \
-    python3-dateutil-native \
-    python3-pytz-native \
-    python3-certifi-native \
+    ${PYTHON_PN}-numpy-native \
+    ${PYTHON_PN}-pip-native \
+    ${PYTHON_PN}-dateutil-native \
+    ${PYTHON_PN}-pytz-native \
+    ${PYTHON_PN}-certifi-native \
 "
 
-SRC_URI[sha256sum] = "84d4c4f650f356678a5d658a43ca21a41fca13f9b8b00169c0b76e6a6a948908"
+SRC_URI[sha256sum] = "b2e9810e09c3a47b73ce9cab5a72243a1258f61e7900969097a817232246ce1c"
 
 inherit pypi setuptools3 pkgconfig
 
@@ -30,12 +32,12 @@ LDFLAGS:remove:toolchain-clang:mips = "-fuse-ld=lld"
 RDEPENDS:${PN} = "\
     freetype \
     libpng \
-    python3-numpy \
-    python3-pyparsing \
-    python3-cycler \
-    python3-dateutil \
-    python3-kiwisolver \
-    python3-pytz \
+    ${PYTHON_PN}-numpy \
+    ${PYTHON_PN}-pyparsing \
+    ${PYTHON_PN}-cycler \
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-kiwisolver \
+    ${PYTHON_PN}-pytz \
 "
 
 ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/setup.cfg"
-- 
2.25.1


