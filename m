Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web12.241.1617899807935509692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ar5Kdm1h;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id n8so2765394oie.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rjpdMbQsfCZysFpxSoyOVhcBuADjnShHWYBQ7haQkL0=;
        b=ar5Kdm1hK6ChKLpnnzbLJ2oFywYTVdpkLURcqB1Cs9vAjZU+phhpV+1uzCGPRT4DL8
         MaHoqnVjN9c1kf+X3t/JCTb1XWpwfC0UkZDkhZNsieT7D2Y8WJCqqwvrVYjgSnISbqNp
         KMW9kteHB2Eru7quCvbYN1TlH6/J1b2sdhKaBeiSf/CuZEosjKGD/wadjOPfQYZlr+PT
         H/DJcxCufxEQwhLfdZMp8zt0lZcA5abV4O1kkaJrRaDdM0sNpA28wGiPWeQqMwV3nYCV
         C4heGqfktYjKfWwlhJGACRJCsF2UCtFj6xj5gkSi+TG+ePOqhHwJfNwqRBhatIyUJ+cW
         bT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rjpdMbQsfCZysFpxSoyOVhcBuADjnShHWYBQ7haQkL0=;
        b=DgehPysxz3wFgczYisMEWEGfkrLWVOlzWvJ37MvfjfcqIQCUy197sOBmcRfV6zzMm8
         L+j1iVSSyCKqv3051Fd74v2B8xflMnqfAKIQz0+QmdNJdZrO6G3XZ696y3KiPAWPFoxa
         +gXmjduAiRSlg1fPfi5M6eY/2iTohObiunEyxIqoQ4nX1Myz/g4KG9KHbxZZuVPuikmM
         t80sa4YOKCqpk+aa9huziWBBwlqq958g2amwfW0Q7bsktsxNUhGrVHJt3PjOksW9WyKN
         e7oBon/bvr5rnsvOXqEYwiAmUDztEOagln2xLYazFV8XSAnDVDRjZMhhIKpanXj9rLE7
         z3/w==
X-Gm-Message-State: AOAM530NNdo707/eslqRDzw4ieiB8BJMC6N8fZHovbobKrhXO3r3XbAU
	ED1HQfUSvXnpjFnXHQFnJCMZLrEQpU4=
X-Google-Smtp-Source: ABdhPJxpvyOVDRmWGnXWwGpO/xQKKMHVy8giNKqooGz1QaizY2DQDjdwxQ9e2sy2be1iplqepSnt0Q==
X-Received: by 2002:a05:6808:1444:: with SMTP id x4mr6863303oiv.142.1617899806941;
        Thu, 08 Apr 2021 09:36:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:46 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 37/64] python3-xlsxwriter: Upgrade 1.3.7 -> 1.3.8
Date: Thu,  8 Apr 2021 09:35:44 -0700
Message-Id: <fb2393b406bb3b23fe5c43b41fea6118e703a063.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.3.8:

- Added ability to add accessibility options "description" and
  "decorative" to images via :func:`insert_image`.
- Added fix for datetime.timedelta values that exceed the Excel
  1900 leap day (timedeltas greater than 59 days, in hours).
  This is a backward incompatible change.
- Added the worksheet :func:`read_only_recommended` method to set
  the Excel "Read-only Recommended" option that is available when
  saving a file.
- Fixed issue where temp files used in `constant_memory` mode
  weren't closed/deleted if the workbook object was garbage
  collected.
- Fixed issue where pattern formats without colors were given a
  default black fill color.
- Added option to set a chart crossing to 'min' as well as the
  existing 'max' option. The 'min' option isn't available in the
  Excel interface but can be enabled via VBA.

License-Update: Updated copyright year.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 4161ee91c1607d32651b4852f0c3b27f763880ec)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...thon3-xlsxwriter_1.3.7.bb => python3-xlsxwriter_1.3.8.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.7.bb => python3-xlsxwriter_1.3.8.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
index a8f013c580a..e89221e5c38 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
@@ -2,13 +2,12 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://xlsxwriter.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4e95e368cd6cb090815046688e92d11e"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "8c0595292fae76297eac03ae76507b7b"
-SRC_URI[sha256sum] = "9b1ade2d1ba5d9b40a6d1de1d55ded4394ab8002718092ae80a08532c2add2e6"
+SRC_URI[sha256sum] = "2b7e22b1268c2ed85d73e5629097c9a63357f2429667ada9863cd05ff8ee33aa"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

