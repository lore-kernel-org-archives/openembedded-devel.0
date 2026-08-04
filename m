Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EC7C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:42 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25006.1785872498331736994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J3VTuINT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc73e322dbso2916765ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872498; x=1786477298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLKGK55rJcc407KFYlqN6KgAwpsErAcaJ1n/eJMD7EU=;
        b=J3VTuINTXNmQ6Cug1PwdL9IE1i7y93OCG1GV2mQrnpCLnu3b9Rfl/NHnGdYx6NpEYx
         WsTf+0u4iQtw+O2nv5ViTXRNaNy2H4To0SKegGdSBTJG2yiEZxX1a0DW8Rp9U7HA0/CY
         xJqiKYHm6PGjROrPVjPE5WZl5C/j8T+niDJ3TW4d2O8MUcgngZIlOATPQcbli199Dbhe
         p62LHNgNPXnQ6rVCzgFnP6oAF4zfEyQTfkRz9o1+tua8C2spDz6T5mu0JzjHXxoBTp2f
         DHllgazbiDJsNVA8LPBMPro2LKtBfZJPM5b7k3kYTLDXkAc79ejuNnqGlMCvpJRVg4Gw
         0cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872498; x=1786477298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLKGK55rJcc407KFYlqN6KgAwpsErAcaJ1n/eJMD7EU=;
        b=fPuJ99cYljODKdDGJgAMilKGeP8EeFmlXfNomqdsnC3p7qstdrUEAF6/dIgOB/IuWj
         /8cosBCfy2jd9GX8309dTHWEsl0HnqWjeAW+eM1R9is4Nn+A16yydcc7S+iO8zrQ2RZJ
         Sq60QFJ0BzH9BLaU+yAPGi4BlRAY62sb1c88dD0ATQ9izPdjB7TSAit7HiCsGc/Ytuhm
         498XzJo+TQ1vIBBJ9AI1DEwXf/f9igrM6QsP6bMln2m/lxvh0Qvx731KoLLyEdfbPvom
         7sWfRgn0HGEEHOFrrp3e61INwlCbkA5HyFAv4dyWgqFN1G2MtKH3k1oTR1vWwoH//aYM
         xR2A==
X-Gm-Message-State: AOJu0Yw4MDI1D4W6EHOaB16IwBbaZUU/vYd1LEwBBWyu69GGJrBA7C15
	UpXi0BPmMin3LSKglEwbBpMEx5LQJUo72HSzeshbZu/Qr2t40mAkov1HgJWQ7FBO
X-Gm-Gg: AR+sD13Fex8u47SNPWwskUPFClnn+Orv0Fvah15ZBbrMQkRiSd9R5Bk0/UZkNOuVPOp
	W4IVRaNBUGf2I9Wp1CCq8LiC54vwhO8DJSPI9qmYBMFg/iqtTwc4HXtHsmz3vnrqeeQ7SjSYkQR
	tH/uUjjB1dqsEx7H/7iMpn2hygQTwCOaXiKNM+oTL2TvYyy9EmFiZwsoer/H5nJ2cEBfLqNeHVp
	oYW8y5L2ME1uNr+u3oDtSw7YDwO/R9g8Og1ZC9pEI5rhxRW1CPmDdA5qx0U/gqId5JNUcNIcEJU
	n381kJMJNg8gTC8gCplo5fIAxF+9qsyJp7yfly2zOGcH0GPCZQe+TcTmCqAn2ybTq35JIMGV06R
	dF6QNfdSLI9luU5Hjd/QkwIsWD+M8CwBrlOXpbYDkaxeZP4+Dii1ARnS3xWtkNmMz5thivsgI7p
	FDNJYkIbrMSeQkQupiUamQ9Yw/EyVvrqf+tSdyrpa99Hn/ExBhBaaq04t+0TDm/d+4dtt1usexh
	w==
X-Received: by 2002:a17:903:46c7:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2d0ca75d2admr14332295ad.12.1785872497555;
        Tue, 04 Aug 2026 12:41:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 35/36] python3-rarfile: Upgrade 4.2 -> 4.3
Date: Wed,  5 Aug 2026 07:40:02 +1200
Message-ID: <20260804194003.3158916-35-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128782

From: Leon Anavi <leon.anavi@konsulko.com>

- Disallow extraction outside extraction path, in case of existing
  symlink.
- Disallow creating symlinks to outside of extraction path.
- Apply length limit to passwords, so too long password give same
  result as for unrar.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 250067e21742bfc5a9b5ae8d5019915cf413ee14)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-rarfile_4.2.bb => python3-rarfile_4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rarfile_4.2.bb => python3-rarfile_4.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
rename to meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
index 3f4423a71f..f051e63b62 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1916695551f7eec48dfd97db9467b831"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "8e1c8e72d0845ad2b32a47ab11a719bc2e41165ec101fd4d3fe9e92aa3f469ef"
+SRC_URI[sha256sum] = "0d8b5a7ffb9f8e9a7b002f2398905e4420c0cb373e799b48e48f418db9c8816a"
 
 inherit pypi
 

