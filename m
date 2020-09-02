Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.1284.1599086336165047953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 15:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AWSWJCTf;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id v196so575227pfc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9mKaKZQF9N8iPERmnuTo3odrtmXjo61WnOPUX0N7kk=;
        b=AWSWJCTfCjHyIf76hc+c3IrSOdxLzqEeSqJ7WSSffZoCsv/jwByoCSEzFHtzuYcjwy
         xh8LD6oZEtgN20CuNy37+PKpkvTpIaFgK1pOplmFklhpQTJV9v3RDjAcBbtSONNd+PDO
         yvo9rdsV/gy2Cm4CBMCxbiyv8frJTyBx4m3TO5dXNJmVwkKxDeW8ADTPoBY79sK5mjjC
         smj/mxmncXmzZ2/7j9tEKY+0Oasq7SLnRjHnmtBYwIsYYLuimmQ+X39hxAOuOmBWulqy
         +yCjlZjxpx/vkw72cl+nx5La/M6dQLgdFIMiezA72vxhD/vJfWbBxOzSoyRF8FVGEFcv
         necA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9mKaKZQF9N8iPERmnuTo3odrtmXjo61WnOPUX0N7kk=;
        b=iVP80AE3rFmWJY9NwEm9em2y8+dJyg1OdlrxTVV28TYEr8K5EZ/I/xfPFcCBIIaO+j
         yf1H+mJgXgbC7No7ZaGml+KmVq74Z2t0SYj1XhCxATs+6q4eUblaNz7Ql91csgdZt0OY
         Gb9JVHIpRw8FPV5cOkTZQzF8gEm40iFD5g/DUFhku09bf054BlHIRX6aOAIyE2NRobDY
         Bd0ZbyLIYQv8ld18EDUchJWFoSeRC1OMWcqqE/NVFSuhB8/wKLhDFj0iZyoKyezS+l7A
         DO2D2SnM3jtpCMxH07D6yJwzPuJ4o6+fB4E5Cq6zfZY4EHA0jzBMB9pOTTz3Y0cf6YR2
         aEhg==
X-Gm-Message-State: AOAM533a4w9JD2UeoPwtAF66/QW4ILRrgQpJrS+fmk7lfFO9ZdG2kKsZ
	95Ul1RIrm28btxeiMWlAP7/0/u1Cx+0oFg==
X-Google-Smtp-Source: ABdhPJz171QI6uNHItud0yKyAHKW0+GUUAdlhfT2yHdd8SWw5qEGr4qN568xgm2l6zFe7NT38Ts/Uw==
X-Received: by 2002:a63:dc4a:: with SMTP id f10mr119990pgj.394.1599086335397;
        Wed, 02 Sep 2020 15:38:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id r123sm552256pfc.187.2020.09.02.15.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:38:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 2/5] po4a: Switch to github for SRC_URI as alioth one seems to be gone
Date: Wed,  2 Sep 2020 15:38:49 -0700
Message-Id: <20200902223852.3467735-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902223852.3467735-1-raj.khem@gmail.com>
References: <20200902223852.3467735-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/po4a/po4a_0.49.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
index 5db5b8f8bc..1b3aca5618 100644
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://po4a.alioth.debian.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a96fc9b4cc36d80659e694ea109f0325"
 
-SRC_URI = "git://alioth.debian.org/anonscm/git/po4a/po4a.git;protocol=https"
+SRC_URI = "git://github.com/mquinson/po4a.git;protocol=https"
 
 # v0.49
 SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
-- 
2.28.0

