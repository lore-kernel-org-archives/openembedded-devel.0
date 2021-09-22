Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.945.1632338539441997836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BENS50bo;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id s16so3650355pfk.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4DnQ4X0d4yY1GEXT4oNTbEwyL4bmOgDulidM/ewpBFU=;
        b=BENS50bovzvt0nVXEV/QKTZ5QeNat2U0l/CSzZd4oQFr/dIciYwH2RAWfruJ1tX6MB
         baEhMF3iV0FsXayEOPhqDAhaTL70t8Wz5RMBn3TIXqnV6qpGX+rYMLjoSrJgKhMmNxXf
         H+F8WX8tYTn7Cqn9B3oS51dWyAopOqwUyjU/wzTBQczzHyVjlb87NOHcA2qb9YGcYDDJ
         OTbyS8+GwiCQNC4fVVbQxA1/6SR4FEyC8MMJHDpvWva2eonEo8ZtfOswokRRkDXY3/0R
         6L4Bd5cSirXB+q1XYyFEIFp4gzaTNeUSI54ZsHujiJ2G9xxCf5bl0PV0PjilufBW/Nn4
         vZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4DnQ4X0d4yY1GEXT4oNTbEwyL4bmOgDulidM/ewpBFU=;
        b=fahtTN5p39TIMOVtfps2Fin8ZNqDrdsWveqWR2LtmyHXguoH6JvcFRzMUx3686f8sr
         mYksrcfhwDgvKT/V4mwk8+UOs18jqo2ingzbB/f8yHFjew0YZMyT9QkVg50/ErJNsY3L
         mSuYGglmvHfLk+cXa2oqWFhk5lL61VoetgBtiz2rEH83mdGyhKaKd9rkSbmpWyXo92HI
         z6LuwYETRvBATzY2k0q0f8K34qpYHpOEKymtE5GdHyQ2Jsctno8Dw3yH6pLddCCTa3K4
         6GSL/NhRFWw4VgQzS6dZfpYkiP6fPKTqrLwjiUsE6Wb75//RNzQJeW7FlHrqFSkSiiQS
         7xWg==
X-Gm-Message-State: AOAM531JV/BIyqfPi2IEmSsYJXpJ1YvNCCmYg3GRJD1NAOCsk9tuNaPb
	CUoltRTfUmkESY2iR6KsEScTit0qWGNYMg==
X-Google-Smtp-Source: ABdhPJxFuf33MwpjzmMiQCP531myOzSYPSVzWbSSIygYSOWFnWpGW4nEeRjHYtuEMM31agUEn0uSTA==
X-Received: by 2002:a62:1702:0:b0:444:d085:6a61 with SMTP id 2-20020a621702000000b00444d0856a61mr702008pfx.14.1632338538795;
        Wed, 22 Sep 2021 12:22:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 04/39] sshfs-fuse: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:38 -0700
Message-Id: <20210922192213.3062719-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
index 251f03b07c..60b664ff53 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libfuse/sshfs"
 SRCREV = "9700b353700589dcc462205c638bcb40219a49c2"
 S = "${WORKDIR}/git"
 
-inherit meson ptest
+inherit meson pkgconfig ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.33.0

