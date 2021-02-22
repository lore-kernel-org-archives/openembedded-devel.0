Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.1356.1614020659922508881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 11:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hVqwisMN;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id gm18so192732pjb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=np60tE/6K7Vw2oOGvZK80iGM9jwNPC29YEwA5jo1Myc=;
        b=hVqwisMN+kvexvb/v6XA0F9vNxieT2q+tkrkasWuf0KNJ+V1YwJc94Fkk2wjmiFfHJ
         u7GwiWlXuS7D+RrrjUpkYGBfpSui7WZPmYjlBrDUxQOmyDBJ4MgBgm65EZ1USqA0MNqQ
         2mTySI4vOD53v17PKkPQMS8Tu2q1kN9h3A7uecmd714mpx0ECepokueCsga6J203y8+8
         q1acyBB6YVpPUwNUYYrxwiAY5GhaBrNeliu7OUKci4BoqZ213qiTDR8QdKeG3jGqX6lr
         yq+PhNJSM7NhpR26AHMx8UlDHzR0dulnVEfP1aTquLQ15Wlz01DU3cB457dd8Fjd1633
         Zm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=np60tE/6K7Vw2oOGvZK80iGM9jwNPC29YEwA5jo1Myc=;
        b=Ub7ZCJeOD5MDOodJY9P/GPTIKf91KujGYEOdBQy1VUqvQOV/qr/kFZvkktWRRV8UGp
         vwkEjJFYwOftCRKYLUSChM0YBvPU01MtVMjHYWABYH3VdkhYyEwbsobiLr22xSckPHz9
         o/Qr+NJFTO4eV7SrQLfOf/F++VHIWdZv0KzKoRCTtDDjLkzIh57PpZ9IrYeIhXASEcKS
         DYU4snI39chCQT1MNWBkNrXEL9w+kWLn/2O3JQUJXqrLZ9FP+DZAXAof7dgYvLs0N0fI
         083FLQ4AV+CyV88kaJbQ4JnC0rwcVHHe9cFsXUJKPtO2QA9RPKdcyD7Was+2kG1W2qOU
         C/zQ==
X-Gm-Message-State: AOAM530Qs9Og8VIDPZC8fCu0c2MpPYoBx1D/hpAkdoZC3nlRLF4t9y/Q
	ZFEM74mYaYr7sCiZxhJmSXkGkeQ254ZlKQ==
X-Google-Smtp-Source: ABdhPJxTFnoJ4Rp4Nn4vHMMReZg1+rK2nd5OijKyRAi+ajcCdO/ZOh7UENup9SNUPAxnXeMUUARDVQ==
X-Received: by 2002:a17:90a:654a:: with SMTP id f10mr24851106pjs.202.1614020659190;
        Mon, 22 Feb 2021 11:04:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id u127sm19941416pfb.180.2021.02.22.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 11:04:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] abseil-cpp: Remove libexecinfo band-aid for musl
Date: Mon, 22 Feb 2021 11:04:17 -0800
Message-Id: <20210222190417.3419444-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

abseil's cmake files can now detect execinfo's presence before depending
on it, therefore no need to link with libexecinfo on musl now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 7d935d523b..38c3dbc510 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -17,8 +17,6 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
 
 S = "${WORKDIR}/git"
 
-DEPENDS_append_libc-musl = " libexecinfo "
-
 ASNEEDED_class-native = ""
 ASNEEDED_class-nativesdk = ""
 
@@ -33,4 +31,3 @@ ALLOW_EMPTY_${PN} = "1"
 
 FILES_${PN} = "${libdir}/libabsl_*.so ${libdir}/cmake"
 FILES_${PN}-dev = "${includedir}"
-
-- 
2.30.1

