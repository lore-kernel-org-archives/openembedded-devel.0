Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.8573.1596037293499738061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 08:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=KK45V+BK;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id s9so13300909lfs.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kBm8FHIs4ajidNYfeXKKhcH3CSLWREPNcJxQEd4YWJY=;
        b=KK45V+BKRmEYQeptLU5PAx0L7sorLVd/n9YHls22wk29r0Xk/lNxGnC8BO27fgi8rZ
         1vhHSkWtQ6xX2iDwsocqldOgxRcvwa3CzRDcYBF7IGDNe+T19vibVTXKE/QETOY432ne
         5ERwjlTSa8J3UgPztveNuTR1KNP3MGtGv+MfnJplN2GEpkDhFdHo7mZUWaq4O58kke/J
         uAk0umQwWA4h7D5AG8DzKPy0zY9PvNIXEIoLMcaJ5efCyPyDMheS1CAjNyEZCNcB1esF
         vek9Xi1x/0Yx8/tWYQHr+rDADw6w55dj1JeLeYfT9kaATpymvcnuacuawPgMiJLlxdhI
         8v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kBm8FHIs4ajidNYfeXKKhcH3CSLWREPNcJxQEd4YWJY=;
        b=qXvSaAxqKPpP3n+XwcXBzrOp7ztiumggwstxID3LlOuvCTbtRVAzJ11RnNx2MOJ/nm
         yP4uyRfHRBd2/JJKtehFLzjPRNTrcxKWyoTQ1vNJmaWJh25c9vU4Uefx493HCEYSYA2a
         TpDUUsqX0PxRsjCyAmX+fnA93HwECwc/VAd5hLC4jxqunwrwJ4TOVqizdDXK8DJjudkE
         HhC5vYryw9So/v2ZseJ+67bGsH6pQl4V1kQimCPCPXtTNH07sibLMT3nF14oQdHmu6zP
         KIFFmmgUUkJSYUwuZYIBn0BDi19sJqdjgSFl5yCh3HC3NiOjZqVDQSU3FWsWzLZyNmHg
         ESwg==
X-Gm-Message-State: AOAM533Gv6HLZ31DpqtPXX/551rsVY1QgwrOj2s8bsRbznprRrCWpZSU
	WbNI58YoOpWDhyjqiRsxEvxjSPDqg48=
X-Google-Smtp-Source: ABdhPJza4EPvdftmYZZH32yIe5zX3HvdgV3K+t5cu2bVRiSdFI0Qyjh0I7TDggsdVDPBU2GNwNhDuA==
X-Received: by 2002:ac2:5f81:: with SMTP id r1mr17212948lfe.168.1596037291027;
        Wed, 29 Jul 2020 08:41:31 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id i21sm529356lfe.50.2020.07.29.08.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 08:41:30 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] fmt: update to 7.0.1
Date: Wed, 29 Jul 2020 17:41:26 +0200
Message-Id: <20200729154126.21163-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/fmt/{fmt_6.2.0.bb => fmt_7.0.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fmt/{fmt_6.2.0.bb => fmt_7.0.1.bb} (69%)

diff --git a/meta-oe/recipes-support/fmt/fmt_6.2.0.bb b/meta-oe/recipes-support/fmt/fmt_7.0.1.bb
similarity index 69%
rename from meta-oe/recipes-support/fmt/fmt_6.2.0.bb
rename to meta-oe/recipes-support/fmt/fmt_7.0.1.bb
index 05dc94a99..0467544b4 100644
--- a/meta-oe/recipes-support/fmt/fmt_6.2.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.0.1.bb
@@ -1,11 +1,13 @@
 SUMMARY = "open-source formatting library for C++"
-DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
+DESCRIPTION = "{fmt} is an open-source formatting library for C++. \
+               It can be used as a safe and fast alternative to \
+               (s)printf and iostreams."
 HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "9bdd1596cef1b57b9556f8bef32dc4a32322ef3e"
+SRCREV = "f19b1a521ee8b606dedcadfda69fd10ddf882753"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

