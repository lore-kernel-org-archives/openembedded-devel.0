Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4295.1793738739048327138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Octgz0GB;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1931ff67a29so171794c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738738; x=1794343538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HLN8dgQEq7wnKeNhSBp/XEaxPG4LZowiBwTJEzuEIY=;
        b=Octgz0GBjWxqYGbWhYeCO6bni0Uaq4hKGqN33N+gonwwD4ef2o01KAu0jMADymEweC
         IsgDcmLzslUqAQpaQPQ20mj7VRCyqAgqww20bTBumbOL2PWmlVyugei/I8uYtsPX8iYD
         gPkWPpKvhK4r7z8IW1vREKHEn3EtMb4gZAhBPlQMM4aMrtIqETE71gB73oJMPlpCYneY
         GyPoTWSQhH1BVlrOszQHnUeWmyGxQDWS8wa7UR+uhqVWnusOKg28Vzv00I3W88heNccb
         T8DUa993v8YoQ0nInbrJpcahkN+7c51uJyT5XEyrqIbbTuEezhb4CM8sXfKEmP4FGnwn
         2Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738738; x=1794343538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HLN8dgQEq7wnKeNhSBp/XEaxPG4LZowiBwTJEzuEIY=;
        b=dM9vLFZYfWxwutg7Q49KqrgFQ+joAZR4UYANfq3AiVh1ZJu96fBt3SyInVTWHc8cKR
         TFb6JVn25EHCs48bF6TBje4L4QSmt6oVW20QsLpqABOBRexuDVCULRyQh1QdmndrQDLl
         KO1hobpGAi4p+yb/Atgl3ycrNPBIx95Kt2hc+mtOLrMNwQlSj9lU3+w9nuBoJYheqbQz
         bFoLYm1Bap+xCej61hGEaXju6caT40Ji0IpscgzUtEAEUjSwQwt8ZtnvxAWBo2vratAz
         dMgtlXDX/a9x7JTaC9E32Lmz9UgmjnCRbTYOUE30Vfw5rNFTXiPKgaPPPQYb/jHssNK4
         GYGw==
X-Gm-Message-State: APuU4Z/e0UXRhnLEeUE4zmMaEeWLXlAA7KSLRpOCyQDqc/EVmDcGUs8a
	Nmnhc4AxlW/Ai7bqZJOyxEo4fgthwawulRdA+d4yp7q6f8kwDFQXcH8riALLqw==
X-Gm-Gg: AYBFou3el3E/jxByDUuzw2BVYILhe6eqfRAqppfgdtk07HnqS15sgidFJrFZkVTuypD
	vJiR41oXaiQwMSekwc1siv+BQH+f+bCHPWYc72HlYYF3UNctxNxv+GK2s0aTDrDdES1KZJeNogf
	eAb+wupzzLcTDtBTOgZxeV1Wk/xmRsv/tSAdgxUmSURthODhJZtv/ZRxHevNDehEfk1UKf4gnPr
	taLZjL1zdt5ZNAvQ+tW787B6GW3DzGa/LctnDxBoOAEKP42C+Ru6vTX9K/nwDNvU6JDwA6kRGXt
	/Yj0pTENyTh2SSXJmL3FLyEV7uXox6RW9myzdQRqWjT8dhHznYyLdt1AsIvLg1QvuCZ80CVFhlZ
	16m1gHFL2ClAejcaVou9zyvXUM/47mjUCgz62xSLLRR/AJB3BAdJtuyhJoUTSiZwX4N81JmZMic
	YOPO9DYxehNlI5NDw+5wd3AbRUHR7F+bxogInrfMUpUROLH9pEE9n/LGAwDav1ZipqFDG8tHwGg
	3OUEeFSqkjAzjhdXgk9ztBUQ69ue/VqdNSkl20M7hkN/LQ/H7vcu6wyBf0X5KZ7LQNq0vKZH03L
	+78NL4fT1DlBHR5+GpY2WijpBcGDoW25WaDJzRgBfSR3NsO3dvSc2EuSBKoWNWngjbKOEbPRQ5Q
	IblyjlCc=
X-Received: by 2002:a05:7022:b045:20b0:168:3243:c911 with SMTP id a92af1059eb24-1ac5c92da0fmr22970297c88.37.1793738736906;
        Tue, 03 Nov 2026 12:45:36 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c47076sm1104555c88.16.2026.11.03.12.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:45:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/5] uriparser: upgrade 1.0.2 -> 1.0.3
Date: Wed,  4 Nov 2026 09:45:24 +1300
Message-ID: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131825
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
index 161073103d..1ef8b15553 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "963554c32d40fb6cba5644f1ba63e6dd7a182b2948bd71ee448c532f53b07f1e"
+SRC_URI[sha256sum] = "b5014a630e61e085787f760c83675a35ef8e719972b05e8f61ff2f48692b15dc"
 
 inherit cmake github-releases ptest
 
