Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.7353.1625583205754082425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F8mrfgUI;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id oj10-20020a17090b4d8ab0290172f77377ebso1191148pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FscAqYtJDVZ+PkGbAEoiSP7ANUC0WwGqt0hdGxbn2LY=;
        b=F8mrfgUImOjV2xj/B+pQie4h1t7xiiVwGaL3x2CMtZD1+7TB3kuUrIkfnrjaBqXvTd
         zf2+vdrP/g8Ld4ZqYVKptoSZkhJMw8r/Imd0RtOpiuYfaLLQuhBtJdgw3mQDdFsgkY2C
         8hdF0m9P6ns+NldTgXqtGhc/oDKVkTXBcHsp28yI00IN9RhwuAcn+dw+qMBjD96mXnDp
         LyZngG9IsDsxwdpJoYFcqyAxJpwOq5pBrqUViAsVeJLgat5NuxVBxNVYTu53VVYLVETn
         UzjEY07TTbl0bLrI7DUmeqTvfTPkwifQVD6a952dmKV4baAq87ycKGcblZpunhwilxV0
         fF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FscAqYtJDVZ+PkGbAEoiSP7ANUC0WwGqt0hdGxbn2LY=;
        b=aHCgnjO0dCUMyryLAkc9NqL6Ar3Ln9Lo+M+lm9WuAG7etDFledhvoBrn77wGjwGKME
         HLrw+2DtSLTx1z/PlMJrHXNfC05GCPe6QfBA/0/PpyBiochAN/rlo1Ym4FDfNwv4Vfll
         m645/en4S8H256FOw5JKj8nz03YoQrBsehuiVe9O8mlOwX+mLd+hBPFGBilUJ7j+DCwZ
         5/4ui2Y0FZ5v6C9lD6MADwfZDpw+MaUGc3SCNklMlb10oaREEASRU0p8xM5/giogDj6y
         ShOraMDOOmG1pjDC+gh0SIiNzW7jPlfdx4fGmnO4W3M73tnpuLJKNlfV8Z4+enrtjCnP
         neYA==
X-Gm-Message-State: AOAM530mVtwi53gIRVmGS67eTzcNOKsbfpW22pnNp+FDleA26liB01d+
	UoPtQj1TCfj8iRAOtbDxPCqaX8bc9pC2Tw==
X-Google-Smtp-Source: ABdhPJx9XA58K0tS+lswUKO/7HKn8yr89ZSc330FWcVbRFQTBHtgj7YBWOY9Gh3vnzpsaU094ah8Sw==
X-Received: by 2002:a17:902:c405:b029:129:3120:1537 with SMTP id k5-20020a170902c405b029012931201537mr17050885plk.49.1625583205224;
        Tue, 06 Jul 2021 07:53:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:24 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/11] python3-django: upgrade 2.2.23 -> 2.2.24
Date: Tue,  6 Jul 2021 07:53:13 -0700
Message-Id: <cca0a50ab0fa256718f03c1f096bc62bc394288b.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Version 2.2.24 contains a fix for CVE-2021-33571 and is the latest LTS
release.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fa2d3338fb87a38a66d11735b876ce2320045b0d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit c51e79dd854460c6f6949a187970d05362152e84)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.23.bb => python3-django_2.2.24.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.23.bb => python3-django_2.2.24.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.23.bb b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.23.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.24.bb
index ab4b68fc87..964ca6ba03 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "d72405637143e201b745714e300bb546"
-SRC_URI[sha256sum] = "12cfc045a4ccb2348719aaaa77b17e66a26bff9fc238b4c765a3e825ef92e414"
+SRC_URI[md5sum] = "ebf3bbb7716a7b11029e860475b9a122"
+SRC_URI[sha256sum] = "3339ff0e03dee13045aef6ae7b523edff75b6d726adf7a7a48f53d5a501f7db7"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1

