Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web08.733.1612994061048580151
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 13:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=DBGj9ezA;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id m22so5205174lfg.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 13:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6OBEjOyvoSu4tOgAXVuTczJSwmWAHlQl7jQsOIQOQRE=;
        b=DBGj9ezAGCT6HS7fV2VVeYf512J0dw+XvHIW6TUrnkzbSHrJ8MeQsuD0Eayr/wfjRl
         /LtEQhwZhSCVxlRqUY5pQPvLNiB3VhG7mcKcCy8TOjLssZ1OhhGrDJx356wrUbcK0XY+
         7RlTGe163mntkowV3m13ePYVbfhtrwXKRGSTnV64WvqgqNqdAjF+wyyxR787p7xJvZ3U
         iejVo74l7EDHt5qPep67cjeRU7A5kBJD7hMftXPumsOkVYyRdA48rwIM3fbQjmulIyQx
         kNwjzSDbxQnHgIo3pTDMcPwK08QHKP4kKBBbMOTl0jUxxLt8PDw25FAWyrzx5CfjVmXJ
         qIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6OBEjOyvoSu4tOgAXVuTczJSwmWAHlQl7jQsOIQOQRE=;
        b=QMDv884vaobVK8xinEUUyH6uQFY1XSDgiAjc8eDeEaNUmTgkmbksaDsGjBJfkLM6Su
         8z3XI3/pgVUAtm1EJdHzjEzLA/eNy25eTuszyLrsJEDv7aqxhc3u5H6c00ajem96FdlP
         77OcsqmCNce9d5Y4IxZf06l62DlXeBuUjfyBaZrNDZcEhgf6YAXMYtctvdvZnD9Jkam8
         1LaHJEEs6DdUazrsLEHGRile4vEFA3IiNsCwrOE7a6Thb4qCOroqnPERQadg6az0LIrF
         T2ZSiUjW+0eZwA5mTt4RJkvMDxIOUOQWrtS/H1bRlROlqxjwTv6XU6anngb3V+nav+rx
         nnoA==
X-Gm-Message-State: AOAM530PuVOiWgnu5N1C/ICz4O/Yb0khH5uGfPMuMR42/chgGe999WZp
	IPsjf2hEA7D1eMDBCaOaGMHVSKrWAvMwqpHm
X-Google-Smtp-Source: ABdhPJyT4Tc5KueqzE+Jk49K5UCNbTuSPbJkr7GwzQbJ+8zdoW2DCtxqDFVAAsMKIztRdgs/jTI6DA==
X-Received: by 2002:ac2:5ed0:: with SMTP id d16mr2692813lfq.644.1612994058551;
        Wed, 10 Feb 2021 13:54:18 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id p24sm464207lfc.12.2021.02.10.13.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 13:54:17 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libconfig add UPSTREAM_CHECK_URI
Date: Wed, 10 Feb 2021 22:54:15 +0100
Message-Id: <20210210215415.1656286-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
index 70ea82eb9..a4a258145 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
 SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz"
 
+UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
+UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
+
 inherit autotools-brokensep pkgconfig
 
 SRC_URI[md5sum] = "6bd98ee3a6e6b9126c82c916d7a9e690"
@@ -16,4 +19,3 @@ SRC_URI[sha256sum] = "7c3c7a9c73ff3302084386e96f903eb62ce06953bb1666235fac74363a
 
 PACKAGE_BEFORE_PN = "${PN}++"
 FILES_${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
-
-- 
2.25.1

