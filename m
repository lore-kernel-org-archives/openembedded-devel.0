Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.40495.1585528303942299565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 17:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FweYqqPn;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id b72so7739507pfb.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 17:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvEgHIHfl0Lw4/dsx8sqHJ+lUFMrU+MQ6Dy0n/oBhqY=;
        b=FweYqqPnjKpsDQXRFoq5lLaT4DtbbZGXohjAPzzUEwlVLScNZksX0GQcfb9U3pPCcv
         Be/LeSN0hITVVvOu4c6YAy1Zr4Ba2huEAQHKYBOyEguhNg3OdHdmKniEvHIMNRSzZWYJ
         fi5XZWxWhvKoyVy32t8Af5AMBLz+3rx3LNAKfYUibM+CLjcEgyuKxLyyIwU+VmNM37KJ
         TGs3wICmNXczhwoW1OfHpXqEWt5goKiOhjg7q6bUCxSIKDIeBb4Ykc56t0xR4MOLnUCE
         9IS+hj+3ShnsTRZGoAbPXn66aXS65oNns7Tx5NEAIyzEwXz6Q5YLsV5+zZeZIwuEC6ah
         eX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvEgHIHfl0Lw4/dsx8sqHJ+lUFMrU+MQ6Dy0n/oBhqY=;
        b=Yu2LD5t44gvtCSCEmYokbo9n2Uk7jgZerhdv7sn+iPw732xcAxUI/EgiWBhVdipADd
         3mi+qFmKcct9JLj1DTnzjiPofBI2qMH43iT8UGcuPiw35mukBwj1muh9Ji2DkzjhNXPo
         FUKlnf9W0CFcVWKKWLR1HXY2/s3SMXCy6kI4e8i0OgTwKgUR57HaZFgmQT5kwx3xxjYR
         f756a/k9sCk/8PeLw3Qgz6ol/D5/DWyJzfrAU40UCMryfXDHsRr3zl+SFL1IGexP8bMl
         QAhULmtHgRfnd0g5X54IkMT+Gk+Tx+MlifcMpLnWIn7X/kSeE7BlrRGr/I3ENUZx01b6
         f4WQ==
X-Gm-Message-State: ANhLgQ08B/OlPQLim4oKdvd+2nVhuT5RPtGcJF9PnN9WiHG1T/k1UU7V
	m38LmHeoqKxaAmKxpT4gYbCn+4LXi14=
X-Google-Smtp-Source: ADFU+vtAYpFR2QuLbyHdRnPJiiDs2It3Ns+e4tbi0fCgk8KgmTjJFg86r7633ZtDu0+K+7zxtFUlXA==
X-Received: by 2002:a63:790e:: with SMTP id u14mr9960466pgc.361.1585528302885;
        Sun, 29 Mar 2020 17:31:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id i13sm4662317pfa.113.2020.03.29.17.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 17:31:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/6] cfengine: Add missing dep on bison-native
Date: Sun, 29 Mar 2020 17:31:50 -0700
Message-Id: <20200330003155.1670457-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../ylwrap: line 176: yacc: command not found
make[2]: *** [Makefile:1016: cf3parse.c] Error 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
index fa08be3e65..2d146bf88c 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
@@ -13,7 +13,7 @@ HOMEPAGE = "http://cfengine.com"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
 
-DEPENDS = "attr tokyocabinet"
+DEPENDS = "attr tokyocabinet bison-native"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            file://set-path-of-default-config-file.patch \
-- 
2.26.0

