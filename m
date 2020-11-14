Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13166.1605395292865958850
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 15:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qJMgqQ1i;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id b3so6257682pls.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 15:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yqXMFsQWO7vQDsZyS3E+65D/oQiXaAAmV5XQ/XlwCMc=;
        b=qJMgqQ1i9suN8Twy9NjwslGEaycjQL9Pr0hZ9uAZcGPpKM3GP+1tVMZlTT6voi5G1/
         Ch8J2gdwT/VMgK4Dtzr2AmBg7BNIufRNAhiKUHI+ReByGI36OJcp618NPKKXihWUddwe
         pkWrE8+qOgRZB4eImeiaEJtDGAjoCjXOEadYxvf63whdPXJ9wuxmbUajtTEVG5S+6PyY
         a846mgA3qKJCKYdVnJaQR9c2oB/Hr3cm03E/tUA3CO0gZO50VXoDBCtMGCueBsJciWGK
         ih5IbLc0ci+TENGOwWpTXIMwsy/KVLSaeW9tMGEw33Gfy5yTjKQfhdsk0pD2lh+z0dl+
         DEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yqXMFsQWO7vQDsZyS3E+65D/oQiXaAAmV5XQ/XlwCMc=;
        b=sYESQyhyDW92xFhZNuO7fRWUrohC6Bz8NrTd2G7TUiKQRHacEr809bOtmyQbAVC0CV
         dYm+OONiVZvGj5Ypun7YBELNWl849SCaQgcV1HnkV7kSqw2oTDGt6J3TLW8F2Ep3Doe+
         NCjrNOQRh2Of2P6B44HDG59Rrv9Nf4M9IGi2ZlHNpoaUpstozSP4y4z7pxG328lqsfww
         cIJCvUeguiCKIvvIBXBN6ekC/WZsv8tkW0XovK2+7FBL70KCVYKMtnsRl7pfomBnIPvK
         98OL5nV0O2SdQC2LfmW1NmMEYjDxlWaogWQ9AVb175xCqr86byhW3sEiZejuO+KdYTet
         uhhg==
X-Gm-Message-State: AOAM532P+nakM0Vy+MeIuwP2FrVL1Fp2EVYWhA/PQvSTHLQQwbdGdgMO
	3DLKJFURMDVH5vjWmqWKOCdBE31Donf4FXdI
X-Google-Smtp-Source: ABdhPJzioz00a/CthbygZDYElrg8TETMmEf/Nlsy3cjW2uFWPiPJEjS4qTpaUrYIPC7n0lQdLhf+FQ==
X-Received: by 2002:a17:902:a584:b029:d6:4a70:3241 with SMTP id az4-20020a170902a584b02900d64a703241mr7486023plb.81.1605395292205;
        Sat, 14 Nov 2020 15:08:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id v191sm13520318pfc.19.2020.11.14.15.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 15:08:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] botan: Mark incompatible with riscv32
Date: Sat, 14 Nov 2020 15:08:04 -0800
Message-Id: <20201114230806.370074-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114230806.370074-1-raj.khem@gmail.com>
References: <20201114230806.370074-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPU is not supported _yet_

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/botan/botan_2.14.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.14.0.bb b/meta-oe/recipes-crypto/botan/botan_2.14.0.bb
index 42e89f639c..13b2c6649b 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.14.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.14.0.bb
@@ -49,3 +49,5 @@ PACKAGES += "${PN}-python3"
 FILES_${PN}-python3 = "${libdir}/python3"
 
 RDEPENDS_${PN}-python3 += "python3"
+
+COMPATIBLE_HOST_riscv32 = "null"
-- 
2.29.2

