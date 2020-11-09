Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.15254.1604943503915721554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i0pwpdF9;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id x13so8803813pfa.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvCwAhVPdIm9wU+j15iK+hc/mTbLjwhseHqTPYphM9Q=;
        b=i0pwpdF98mSfS245NQi/U30Ntjem/wTKZFDLu9PdYGZBxXsGJNK72aKaf9OK5dqeNs
         pcRpxlPvENMRHbLHgi3QuDBNZ0WzhWC83jZC1QHuDaoSKv+DwER+TtJB/8CQTX/LBmAu
         L4BM1Ia23G8vENWCidgR/r0pUxK+M6ncC0KmQQDa/se506Tzl1RUhJdzGf1nu3hU3qQ8
         0/zyF3YZXCWz9z+TNwj5av1YkoG3ANDfFebDmti+239MreQNAbybdGJ1QLfbaBGkYPhw
         IQKAePppjNmQ488oB15EFrs/RohJD3ZIElhDp/BPuZK9tXsVGuuEndEdTEpc65OQKI+Y
         lcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvCwAhVPdIm9wU+j15iK+hc/mTbLjwhseHqTPYphM9Q=;
        b=NyBtvvCWNtqvgB32fmkeyfGk75b06yt/Uu8AZBObHQmiq6TYUuQ3SNOH5DpdXqMyme
         ZY6W8t9t3mZvQiN75NVDyGlYBBE7WB95rAGdSkBF9ZPx2nGm4DkAoKLzuiX4bEQQOnfl
         +NjhNuD4t3WE+U8biL2oyLp7PYZxmAFw6GUxmJUHMMptiriiCy8LMYzPEkA3qApNeEiK
         McBvZ+A0E34r2M6ZTsUtFONLcUDKs1cMA8E/lmCE59KXKG+wS/2MU0v8+obp8ZmGzvx0
         QLEGs9N/Yb0IfeVMkAM1HSfUR2E1wUdiuFXszZc73fh2teYtlFOVsxX6RmiARaYJQ3yN
         oWeA==
X-Gm-Message-State: AOAM532amQhX8D7kWrOIFOybin8VHRtWY31cqKoBDHpikun3RY2NjtjP
	zbp4PGHsW4630+cGIr+6Ab9lwP/7hd4oRA==
X-Google-Smtp-Source: ABdhPJwC+7r4bjESNwxyq9qHwz3cSsQ/ixCBhrtOL1BXjp/SVUaUniye5FybXVyGwe+foHhL35S26w==
X-Received: by 2002:a62:8709:0:b029:18b:23db:7712 with SMTP id i9-20020a6287090000b029018b23db7712mr14682030pfe.66.1604943502945;
        Mon, 09 Nov 2020 09:38:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id d7sm11198467pgh.17.2020.11.09.09.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:38:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/8] fuse3: Upgrade to 3.10.0
Date: Mon,  9 Nov 2020 09:38:13 -0800
Message-Id: <20201109173820.3545516-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/fuse/{fuse3_3.9.3.bb => fuse3_3.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.9.3.bb => fuse3_3.10.0.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.0.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.10.0.bb
index 8ef9ee12c3..c8680d9508 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "cd45270a064d2ae14f17cfc914f1555106d6c5091025b0b2698b860399d4ede6"
+SRC_URI[sha256sum] = "26517954567f237a7dbcb532755ba0d2c77575c5d90db7566b6e40ec05b0a039"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.29.2

