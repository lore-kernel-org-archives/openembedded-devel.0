Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BBFC369DC
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 17:57:58 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.46956.1745344673556845601
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 10:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KVZSwtsN;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3523038f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344672; x=1745949472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE/0MC/RMznhA0WUbIReppo7WMHpOEobxfOtP0pSwQ0=;
        b=KVZSwtsNBxUzKYkXY4i1/0B/2MNpolKti1/nKpBQ4g8n91n+Fi6YorE9KrEwpjtiYD
         6rdvH9fUZD8HecNQ83BuySi1o9zbehlQXtbOqm2YL0VRECKDzc6cYIrP+C+p2ygRsyGx
         riL3tnpyOCubZy5BB0/0ofxD5dQ3z/jJUijgTqFdS0LEZ07T3o9feBqxo1uMGThR5aio
         zCaafQtuk33mDFhR2ogkKgqLuAf+HqVWEdprDVGlNG9FeoXqrBgWXx0DdL9kpxrph5bG
         lsiSTDdu299Y9nKsDONxWM80t2BQp9E+2yERAcsuDux37LENkUna2ONufJXG3RZJZNLv
         slcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344672; x=1745949472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE/0MC/RMznhA0WUbIReppo7WMHpOEobxfOtP0pSwQ0=;
        b=IooejKw2lXNGCI5k3R4cvdTpnKqII2hkbNM4ZyOzLBkxfASwOSG70eEHe+4L+/+dTi
         HlNKXtb+ngu1vi257p4ByP5QCr22XnzjeCHXlxn3ougAOGWV9TWCVz4jp27mrjFVsl0N
         BoI1oiy+2nzdJQfShVWw5vRRlHOmb4+4aEFdV2holFXZRj+1IGz3C0hFVq5UwaVzDf9V
         rnLyonVXNkLpgLnu6ZUZ1Y1aM8/J9ZJQQYSwEpWQ70RtFDCL2Qp64MzVQRQ3g0+/7Boj
         XTAKrN9xpdNBQUmYUYRGCuEkAGpcCdtYc7nT0P5//KbyH7tgJUkRnfKxR1GAKgG4V6d5
         T5zQ==
X-Gm-Message-State: AOJu0Yz0hinatFdG1HiZNIHLO8+Y3hFC7MAtDz0WMspjZxyrslCGyjC+
	mA6kbaabyZq1k8Hw/nRzYZjzXr+Fbpf3AFbkNNLqqBz9c5FStoLpIybILDJd
X-Gm-Gg: ASbGncseEABXugu5mCESaS8gfaQ0olQ7ClY4cwWivDoN26pKqPy3DuZyJbgAxabx8uh
	HzxOAwzU4RkazgnT3A6+JpnIjqQ0xNGLDhQOT8cZFDCllrpT4TaVAY3drrgfySEOjLT8YPtdgDY
	PfjX30A+s0iYW5S7MpNFmA+QIZw8HILCogkKe0ZtJ4ZEpdlkdsh+hFj41r5i+nwvFjVsOXe8KfM
	L+ufmg6tXoRi7wURHZuW60mmRG0eHhTVSvZbazNVZgO/N0XBirzDQENuUOgq2sg0hC8QsCZr8Wz
	hvxegqgc/hT0k+EAigKFSMNYuzVAzY77VAHTnr/Sp6XVoHjxZKB9Hx7rSFH/61mV4pQRR20q8A=
	=
X-Google-Smtp-Source: AGHT+IE4+klFwbxDtSATI5AKGsvJOkRBtQ+B83lVuvZtlR+Mx26eR55nTVBYGxs8HDjWUbLBYaHTRQ==
X-Received: by 2002:a05:6000:2510:b0:391:2306:5131 with SMTP id ffacd0b85a97d-39efbace660mr12887603f8f.45.1745344671751;
        Tue, 22 Apr 2025 10:57:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43be53sm15740293f8f.41.2025.04.22.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:57:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] cups-filters: use 4 spaces for indentation
Date: Tue, 22 Apr 2025 19:57:41 +0200
Message-ID: <20250422175742.786560-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422175742.786560-1-martin.jansa@gmail.com>
References: <20250422175742.786560-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117065

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-printing/cups/cups-filters_2.0.0.bb    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
index 0886e7061b..2f1a772dde 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6d5b952b53dbe7752199903d082e5f07"
 DEPENDS = "libcupsfilters libppd glib-2.0 poppler"
 
 SRC_URI = " \
-	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-	file://fix-make-race.patch \
-        file://0001-Fix-build-failure-with-GCC-15-and-std-c23.patch \
+    https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+    file://fix-make-race.patch \
+    file://0001-Fix-build-failure-with-GCC-15-and-std-c23.patch \
 "
 SRC_URI[sha256sum] = "b5152e3dd148ed73835827ac2f219df7cf5808dbf9dbaec2aa0127b44de800d8"
 
@@ -17,10 +17,10 @@ UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups-filters/releases"
 inherit autotools gettext pkgconfig github-releases
 
 EXTRA_OECONF += " \
-	--enable-imagefilters \
-	--enable-ghostscript --with-gs-path=${bindir}/gs \
-	--with-fontdir=${datadir}/fonts \
-	--localstatedir=${localstatedir} \
+    --enable-imagefilters \
+    --enable-ghostscript --with-gs-path=${bindir}/gs \
+    --with-fontdir=${datadir}/fonts \
+    --localstatedir=${localstatedir} \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"

