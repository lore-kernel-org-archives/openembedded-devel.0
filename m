Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.3581.1618693578948486285
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sz2cnW0Z;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id b17so21555829pgh.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/MnfAX0UrWCdYeN3WuiMnlPRNhsPzvaiB04KhP5inYM=;
        b=Sz2cnW0ZNFnm4+tWR0HxBZ/67VY+yn/cFqngKXGLP/ZCcguvY1Vboupq3B9mRSuK9j
         hO4dTj5zA43ybLIxv29DX3bIlUOBsllhb4TCb+WWTCD6KYcwdIrmGPSeO1vxMlV87rzm
         vl74JMWFLQcRqp8awKphQwmXycYjV0ih0drUz2qZ04kOJBq8iROtYgrucFqcY6JYRfvv
         zhUgtIiYfvdS39M40TRS4g/+wlHtdhlmfSI8JboVCgsYXRpMzJyAUbrgmHqf/jmUW0bw
         tK8FC/WCvy+BS0ycX22hul3hK/EPwvhM4QYB2um3CZ2Qj8E50CpfUdKT1lm2IpVpWDxH
         kK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/MnfAX0UrWCdYeN3WuiMnlPRNhsPzvaiB04KhP5inYM=;
        b=CtU5GFKvahM225IHiGPdj3pnPtWX3w6HaGDb8h/1PzDIxC/yPR5aB5XVhexH9vOV+U
         /sZxVJOb0T7cNi8j843sCaxpkjMRCJPSumEZiQ7T5MOE6F0qKHLSxtt1ixQ9F9D8QPsX
         ZBnmObZxzsWheE+A4wcDT0qIbsWbfNMBvpbM+BdYvWehOhk281YL1pTXpkFADg76IIIH
         1kJQ9SDvmqFL9rqCt2ob42rzY3V70QvbiZ++KKCbDJi24tbzQEUoMod2ssLJDVSOh3aQ
         vpot20WLLWmgDb4+DGFxZ6aAzHzz01l80E8/VByzGoiyGL96PVKdZQSW+YD1JjQxm5TP
         s5yg==
X-Gm-Message-State: AOAM532Gq26m2Fl/gULJXNe6XgH3a9fmcM6y+wENAQpT7rMHDPlUAzNs
	pPY44AA8hozZyhp/8rgsSnIyT5ULNq6euQ==
X-Google-Smtp-Source: ABdhPJxnUxPMFeH3qs/Z3Jn1DjAoca3a4Cda9sYe0e0cWMIA6xYabo6yX3wCztLGYTa0pTmkhqRsEA==
X-Received: by 2002:a65:4c0c:: with SMTP id u12mr4771098pgq.122.1618693578455;
        Sat, 17 Apr 2021 14:06:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 12/50] python3-absl: upgrade 0.10.0 -> 0.12.0
Date: Sat, 17 Apr 2021 14:05:21 -0700
Message-Id: <5d7968421ab8a8ea4cf52ec83ed70ead08a3cbad.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 44277ef50aba4858ec77b6ce329d2230ad2d503a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-absl_0.10.0.bb => python3-absl_0.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.10.0.bb => python3-absl_0.12.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
index 5be00ccb476..2ecf10caa14 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "9cb38ddf7a2f000e2c92e5d9dfa36ffa"
-SRC_URI[sha256sum] = "b20f504a7871a580be5268a18fbad48af4203df5d33dbc9272426cb806245a45"
+SRC_URI[md5sum] = "cfc383e2c647698666a7c5d8ef83a675"
+SRC_URI[sha256sum] = "b44f68984a5ceb2607d135a615999b93924c771238a63920d17d3387b0d229d5"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.17.1

