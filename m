Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.39.1619208272905197886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lOixInZQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1865221pjv.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ulttXcfBBnOqxji6urrNlw51yLzDA+ACe/mqeJtxuHE=;
        b=lOixInZQ8XEdzfSHgJK9OceL7vA0zyzGXTAO96znUSJ09zV2/kYxN6fUXnYCeH/rUf
         bZ5sPK4vsbYQOsrMll7tgl4FV0BpvJNukH8otp1OdjzhGwEGU8iWBhquE9e0T9idLtMY
         F8GucpcD7VsQpvCIuYfIdsadM8M28OBDpeBCNzulaILzYNkXhD2Wn0uQ4GF9sOWB9FNa
         ORlSoXD1HXS3Z6Q9DpAgEhk60QE9zyxjxX+yQgO1UBKyXJA5PKv6Znalib6/4iGRPYLd
         /zlQDI7w4mDDIPN6eeQkw6/57uOJ1DkAUmbVig5WFIuBG21tdfvJDvEwghhn7+nQNdK3
         mTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ulttXcfBBnOqxji6urrNlw51yLzDA+ACe/mqeJtxuHE=;
        b=JmssP8ONOxjE9/k3AI7HkJNW3S6IFdW7qFPMSbp2vBIMCkmCs1B3QdP7408CGvLf46
         j8TPH0lPXXDi1688Vx0cjeOYjDGNhvCIAiVN7J/Qb3r7B+hM+N7qNtSoC3eIomTdTM5J
         T/qJxU/tzTwTjoHUBzOC4Gjo8/HGG0HmQo1BiQzDmsfCTcbgmjXSoyGb8eu9NqYWzk6W
         w5h8Ddy6Lbve5xD7R01ySNdCC2Mwwzmvu0NxSvyPbH6FYThatzhyOMfg/vJqaZHfjPt6
         SScbqk7GRxWo3gUvJwhEC76jaySszpPzsNbvxlrH3vSC3328s5lZT9K1MAIkpZ+kZP9A
         sl6A==
X-Gm-Message-State: AOAM530wK4IqFY86isGiyAlVX8Gt2wywJRx/Cr1lRglBnJYiTxlD7TxJ
	PDIH6HQswa5YgczXxlB5i2dtwKvk2XE79A==
X-Google-Smtp-Source: ABdhPJyij2g8FbsnnX/q1QuVi2+ISEVn5V5sQ6YdCto6MXJ7pE70SRO5ETzGj/fzBcPNAwrzlI5DNA==
X-Received: by 2002:a17:903:30c3:b029:ea:afe2:56f5 with SMTP id s3-20020a17090330c3b02900eaafe256f5mr5451652plc.64.1619208272242;
        Fri, 23 Apr 2021 13:04:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id s22sm5653008pjs.42.2021.04.23.13.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 2/4] python3-pyyaml: Do not check for meta-python
Date: Fri, 23 Apr 2021 13:04:27 -0700
Message-Id: <20210423200429.1109991-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423200429.1109991-1-raj.khem@gmail.com>
References: <20210423200429.1109991-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its in OE-core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2021.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.2.bb b/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
index 3a9574da11..62467b01d2 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.2.bb
@@ -176,7 +176,7 @@ RDEPENDS_${PN}-ptest += " \
     util-linux \
     xz \
     ${PN}-trivial-httpd \
-    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
+    python3-pyyaml \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
-- 
2.31.1

