Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.9178.1621347304955126560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ji8n0Mco;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id n3so5156022plf.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BUl8vcjVOX1dQjF3IyzO87sukx9UwLz+RWUg5SgHsio=;
        b=ji8n0McoFoWdgaey1YSnucv564mtVcBU87Lhg1QGE3Ik0tpthHpRWXQc5vcsttk0mY
         hizlqpe6fpJPbpV3OnZ36V3cb9e/gGOsqcCHP1hf4v2vZFva8C/pU+M7oXfPdzkr4TNu
         2eXiyBRdubx5Gt4/LLOm4plaEiTU3waHHf/KqGBf+KUiVzSsaTELtvEpnKRPrbBwZUU1
         Y6A7EBXORi7Oj9nxJxLXyx3/JIruCkNo4Wr1cGASRmzbfkVSeQR/p08+3KOjpAlkFBqY
         GZNOpGeR6if6vY8L+WENwE+kjYvj0isuPDPPIFSnfrd4uGyCUY0Fqgs/Dt4EudQ9vTCY
         RWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BUl8vcjVOX1dQjF3IyzO87sukx9UwLz+RWUg5SgHsio=;
        b=LMmwChsfxVyyVJxUlWgAh0hvkT6E6E1XKmoZ0Jkxp4MZgtSmXJZsIXzbvaqt6c1xro
         UOpmKVMJHoXQxdvKz6c9gAROtcpfkHB3/JBBsY3I1LqnnDTsTWDBCkd5A0v80zzjP3Kf
         cXCs7OD+XsJvsOvlWgvVjV+HCV59/k7mHu8W2J76hf/3qsdHKMZ658am6qtYzAuShVj5
         l9aJb08jEb/OfMGncgNQ2/0nhmp3ttsiTm8sNnAOHtkAfxqQm5AER0QfeP4ERnrMHMNI
         7k5HRen+Z9ALREImgKKTzULc7yaf9K8TSD4aEafrVXEeSbmFlvYVtQRHuRy7fSN9SFND
         GC5A==
X-Gm-Message-State: AOAM532FsRgLHQWwStR09xxeMLXkWTFlI2MdC2QPWdJVMFM/MgL0F1GI
	5dY5G7AX3CIcD0gff25x4fPZh++Lnxo=
X-Google-Smtp-Source: ABdhPJxxjBkhS49acRJaKCDOkqAA7d/EeXiqRHBGUswvH9tmQPDyeKumMAo0vcaUimHxERSwEnHBQw==
X-Received: by 2002:a17:90a:2:: with SMTP id 2mr5388337pja.107.1621347304395;
        Tue, 18 May 2021 07:15:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7050:e80a:30c5:274])
        by smtp.gmail.com with ESMTPSA id f5sm2103563pjp.37.2021.05.18.07.15.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:15:04 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 5/6] fuse: Whitelisted CVE-2019-14860
Date: Tue, 18 May 2021 07:14:56 -0700
Message-Id: <f81318a4f87dbb9c9f9e0e24e68163fb797930bb.1621347202.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621347202.git.akuster808@gmail.com>
References: <cover.1621347202.git.akuster808@gmail.com>

From: Saloni Jain <Saloni.Jain@kpit.com>

CVE-2019-14860 is a REDHAT specific issue and
was addressed for REDHAT Fuse products on
Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
REDHAT has also released the fix and updated their
security advisories after significant releases.
Hence, whitelisted the CVE-2019-14860.

Link: https://access.redhat.com/security/cve/cve-2019-14860
Link: https://access.redhat.com/errata/RHSA-2019:3244
Link: https://access.redhat.com/errata/RHSA-2019:3892
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 95e870691c..49682b3cd4 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -19,6 +19,11 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
 SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
 SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
 
+# CVE-2019-14860 is a REDHAT specific issue and was addressed for REDHAT Fuse products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
+# REDHAT has also released the fix and updated their security advisories after significant releases.
+CVE_PRODUCT = "fuse"
+CVE_CHECK_WHITELIST += "CVE-2019-14860"
+
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
 
-- 
2.17.1

