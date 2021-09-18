Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.866.1631984265393916617
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NnYrDhUU;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id m26so12216024pff.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L/v59S/gMDRDHN0rKiG59YnASg9bVflh1+C9mirOkfk=;
        b=NnYrDhUUNz6I1034WCBiXAA3m5ODZ9s9eBL+5YdqjeJWEAhEkCAak+mC1DnyjrSYn3
         fGvELkhObGKAK4y3itkhZ5jGrdk3tXQ7J+KulWu7yc9ZyDT/bNJ3qeeAnT0sDN+7ky1n
         a7N0ypMNsINrK4eGWFCCWJlugbO4w7OPx++AvGV+ZeoQ4++4hmJ1FLk2Md3lFyMGOB3V
         btrbOPyZUfm2HlsGbeQrq0TQ7Vb7c8lCVFsRzsJ3jJOgzpDs3abxOtkPqXZnG20mgS/n
         1BW/uEwnfFds4OLRz9l//4E1a3VfmBG0ocoT0ySTwVBEG0JPoavZ/K6oHhni+KrdNK2u
         z/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/v59S/gMDRDHN0rKiG59YnASg9bVflh1+C9mirOkfk=;
        b=e4IrHE6/GRkpN6yEZ4Ce+WbRoqHkD1bbTAQ4jGqfFFu6DHMxsdrw2arZScl12SZNzg
         q8qdt+YI1F75610FGf1XgFTR7+hqNT7HFkNtAk3UtC32YcRM5AfiLfsu+LeswNsWZGP8
         k6VKM3Zid8QmD192nO2ax7nBSapWP2INkOeB7ZiLhG6kCk1JgXAFndtd0pZ83KapPezi
         ImBpGMxsj+2Yd9VDmiyiiSKKVS5xlU0/EL1/lLVVUghqxuz+v+mebZi7u5e1JW3Laemp
         L26Zgzx4T6MGhdNJLYXBj/MtposHffMcWk7KTSUOAUNWrN1adWQn6K92HFlFQvyKT/8i
         j/oA==
X-Gm-Message-State: AOAM5328kV9pamBH48+lkOhioPtbMwYeD+Aq55fRD0zt8/yggfkIhc4x
	yHQAEk9BZLYq6KlaiJQ799eDdm5EZ4s=
X-Google-Smtp-Source: ABdhPJxUBu8n09pLM39VRPtLAvIdjZ0QLbFqe+1iibcZiZd2l15HPH7AFA4XOVjOR5DmFw+7rA0NoQ==
X-Received: by 2002:a62:8643:0:b0:440:3b35:6667 with SMTP id x64-20020a628643000000b004403b356667mr16798005pfd.54.1631984264806;
        Sat, 18 Sep 2021 09:57:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:44 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/18] python3-mpmath: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:27 -0700
Message-Id: <20210918165738.2581429-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
index e1c52e7bad..3337df4903 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
@@ -3,7 +3,7 @@
 
 SUMMARY = "Python library for arbitrary-precision floating-point arithmetic"
 HOMEPAGE = "https://pypi.org/project/mpmath/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71970bd3749eebe1bfef9f1efff5b37a"
 
 SRC_URI[sha256sum] = "79ffb45cf9f4b101a807595bcb3e72e0396202e0b1d25d689134b48c4216a81a"
-- 
2.25.1

