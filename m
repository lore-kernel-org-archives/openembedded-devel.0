Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.27328.1595763558828485170
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 04:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=PrVyHdeN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id 140so7490801lfi.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3vUeJW+WZXkQSLT7wkWStqbpjg5LunRVGjmsZBqrBtM=;
        b=PrVyHdeNaZkO9UbXoKl6S8ct7NhcTujIv1d173VEO3VXPC26H0Q/wYbMoqOTHcroeZ
         OAfcbUIHjC7cMseybCjeQigDmDTN3k4CYsMeHBm2q2hleSuY8tT6+qO0zDWui7fUFAvd
         3t4Cl05G8hliMpg9csPCNsOqIj0g3n56Sf3YeAoejlpSZ8iBCLKM3ZjBl4hmLmPl6BR6
         5nEE9sH3pBeFXcBPchu4Nk+qRdJ3UelMo4CJ8CDV8Zdgkjdz4+s50GH7mbe4RyDjGzIz
         N7azeg6Ajb/COxK2gJvzrtRXK6kdVQ9hxrf+0yZkqCmG2GtPniKe4MhpFbNMyebm1gAC
         a+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3vUeJW+WZXkQSLT7wkWStqbpjg5LunRVGjmsZBqrBtM=;
        b=OK54Wu38iC2A92ablJzsxMKpk15Vtz+MVS7eHfNTWSVV0xFOL2uwLqw5beQim2pkCP
         F9wVrYABk9MXZoICm0kO/7hpN4NBAmDh7gy9Wk8nAulFcLoESqyfej31kf2HuKAbP3y1
         5Yw4H0K/zY6nbSrUuu/RGhV+dWWdVliK8X45F8X3SnNf3BYYjbAByJF4qoQfAFtJu4yO
         eC8nDX+BelrQXdFhPPCiOmIeRp5kyaj60ffw4WFUqdDrReaTqaho9lJR8Oyly/qfQMDD
         MfQKwe+o77chOfLRwDPTO8qTn4JrBXKB8qPXdhLqltO6Bboi1eAir5S6RzG7XN/SBQKw
         7FKA==
X-Gm-Message-State: AOAM533SNn50j+6QVjgojyRwQ/8k4XFoHQzoqqtCq+7bHPuxRcOc5rg+
	imLSkEklljkDOF8RaQfTfA7/K5h86bw=
X-Google-Smtp-Source: ABdhPJz6/L81mPz4YUnpAgPanVnaY4l+7eY/VdUY+vgLq+dED2ONxXBpA9F8qM/pWX30gJCRe67oWA==
X-Received: by 2002:a19:d14:: with SMTP id 20mr9404842lfn.27.1595763556402;
        Sun, 26 Jul 2020 04:39:16 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id p11sm2273493lfo.71.2020.07.26.04.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:39:15 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] crossguid: update to 0.2.2
Date: Sun, 26 Jul 2020 13:39:14 +0200
Message-Id: <20200726113914.4024524-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../crossguid/{crossguid.bb => crossguid_0.2.2.bb}  | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta-multimedia/recipes-support/crossguid/{crossguid.bb => crossguid_0.2.2.bb} (58%)

diff --git a/meta-multimedia/recipes-support/crossguid/crossguid.bb b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
similarity index 58%
rename from meta-multimedia/recipes-support/crossguid/crossguid.bb
rename to meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index 228b8b6540..7441716635 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -7,19 +7,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1373274bc8d8001edc54933919f36f68"
 DEPENDS += "util-linux"
 
-PV = "0.0+git${SRCPV}"
-
-SRCREV = "b56957ac453575e91ca1b63a80c0077c2b0d011a"
+SRCREV = "5b45cdd9a56ca9da35ee0f8845cb4e2603d245dc"
 SRC_URI = "git://github.com/graeme-hill/crossguid;protocol=https"
 
 S = "${WORKDIR}/git"
 
-do_compile() {
-	${CXX} -c guid.cpp -o guid.o ${CXXFLAGS} -std=c++11 -DGUID_LIBUUID
-	${AR} rvs libcrossguid.a guid.o
-}
+inherit cmake
 
 do_install() {
-	install -D -m 0644 ${B}/libcrossguid.a ${D}${libdir}/libcrossguid.a
-	install -D -m 0644 ${S}/guid.h ${D}${includedir}/guid.h
+	install -D -m 0644 ${B}/libxg.a ${D}${libdir}/libxg.a
+	install -D -m 0644 ${S}/Guid.hpp ${D}${includedir}/Guid.hpp
 }
-- 
2.25.1

