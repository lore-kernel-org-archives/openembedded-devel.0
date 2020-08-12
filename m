Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.9427.1597214239834498846
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FAVB+/U0;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id p8so509415pgn.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D//hGCJnQncHmyyc9GxKTScPlsOks96TIfRW8xL6R1w=;
        b=FAVB+/U0FnONPd2NupN4+/MfuEkHxmO6yk/aehjZGCYeuxGwTZDUSZsmu0tuRhrFIe
         Uw1vu6eRGgzv2aVyv/XXEZmcssIK2d79QQyUAzP4GiiTQbksaETcokZNXd6JbsSVvA/x
         da6ioh9AkB3+xS7h6Tiz7jZqsUxKEhzx+jUG0rq/eJ75IHHuue9OE5hk0Z5t8UuxETx+
         XPqPXML1PriUK7+Liyp6As9n/crQs12IAnhgYDKsBvq3/7WcFULUwYBKS18fuBAJ/Sj2
         IwwW8kkiEloQ075WFRUhq2ifeQ9Vaevb1+1KbC6n20+UIXBb6p0VLNxuPlEnqZ0ZD99f
         V1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D//hGCJnQncHmyyc9GxKTScPlsOks96TIfRW8xL6R1w=;
        b=U/NidPinMpoG0nvK0MG9itCyI9FH2w4VYwFBOI0k6LXLM32dSrMUgKDYMlLEQxAmdm
         7TODG1iDmniWnUoMNFd3khR3hN187MDt4eQpHM42QtQHKCLpuY0ytrIyhpntoc1z1yNi
         EodFLSm1dQtLn9A793Xv7F+OUG9BgEkZpAjJKpaa+KYQRVid5S0ecK4ZmCcm4615Mzgv
         ZvrWUbLx3ZsDRNrhw9qTmtDIFIwsrViVHv9aWiHgr+jRSKOtI//gt2pMy4l1l3SPbzw1
         XpMEAIoMzszD5Rtw1HOvzoVA5wsfTUwQ+bBlXY8obJuzETMZ/hJXr2DOXfp9pJAbAgCG
         XM6Q==
X-Gm-Message-State: AOAM532olgtk/w7NEeIoG1ac6ogi0Wg2phmJVX2duTg6lm2uGsggf3lC
	ASEegwU9B7O0UdFBrdQ9hE9zR8y8HXQ=
X-Google-Smtp-Source: ABdhPJwEdQo+1ELoQyAaFkk1hNnU/lNHYCIxwA6btA/VMFzCcrYSVobAadFkl8+/SvjmxvQCgpcwww==
X-Received: by 2002:a63:7d08:: with SMTP id y8mr3820958pgc.224.1597214238960;
        Tue, 11 Aug 2020 23:37:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 5/9] ocl-icd: Upgrade to latest
Date: Tue, 11 Aug 2020 23:37:07 -0700
Message-Id: <20200812063711.2758315-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Install CL/cl_icd.h as its needed by opencl-icd-loader

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/opencl/ocl-icd_git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_git.bb b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
index d14ec53e3d..d91fb4ee5c 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_git.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=232257bbf7320320725ca9529d3782ab"
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
 
 PV = "2.2.12+git${SRCPV}"
-SRCREV = "af79aebe4649f30dbd711c1bf6fc661eac6e5f01"
+SRCREV = "a9e57b199ff1e8d03fa3e5c53c5544de3dc72fe6"
 
 S = "${WORKDIR}/git"
 
@@ -16,4 +16,9 @@ inherit autotools
 
 DEPENDS = "ruby-native"
 
+
+do_install_append() {
+    install -Dm 0644 ${S}/khronos-headers/CL/cl_icd.h ${D}${includedir}/CL/cl_icd.h
+}
+
 BBCLASSEXTEND = "native"
-- 
2.28.0

