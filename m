Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.25665.1605712087141325056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LRbavFKP;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id 5so1120613plj.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HSI2fLGTzN2+mfbB+j+C6Fc9KDn4MT+sHXPjGA7rp1c=;
        b=LRbavFKPPY7B1nXyaJzQl/lCySuyBy6aCfXcKr+3gVUVxHawaDxgATEIm9ED89HVMj
         yEFhY9hNCCXG4WKabNxi+atqHyHT4b9ORvU4aT+A4lmZIMEpqN4kFTU64BT+whovdNaY
         fLN9C1200uI5NgvMndC/wwFIPLc/uvznBf8XlyHssS5KWew0nWAu5r0jp6l3E/R53WH5
         BopXbobSaErWr7QddBC4xLzG2F7ljyM+3QcsOU7xT8A5EkgglAG+s9VV5l4Z8M6gOfgG
         C83yVFH3usu0/SR9zUbzdR0my2m4/kNMW8o9OERzKztVW4jC0iCFr06YNXYutMrjaK0D
         qqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HSI2fLGTzN2+mfbB+j+C6Fc9KDn4MT+sHXPjGA7rp1c=;
        b=BBa0+aQV+DU8gp6/xH8cEmcJoeFfMYCNLRu+uf+q//UfjLwIcrMw4Ry+Zdzu+jW/Kw
         +c/XDfaC0QSyFFQKdLbLRlyqhxLuj3LgnmQuh7EAOQjM027G71x5yq59u2ELwPNYutyN
         7qqpGRS5wbsArotoX8XJjelkwzhqTOVBt7hu1tVPr3IIeUSA6kMOeftMnRabC9shoUph
         Epz1BVmx2k0vR//nqiTT7q7wxfpV88lLEDFXBoSy9oyxsZF/Q64kvyKZPhqSpPTk2EuF
         /lPaEe1CtqPheV8QPcQPtptiRRSAelo39vziAGSKKza8cEdH+0jH7r9X4wmTZMsGrqMP
         LIbQ==
X-Gm-Message-State: AOAM531UeRzaA8gVDbE3fgI3BHBoWj3g9WBggkxPOhY+4VDbR7nXIbMp
	7Av1QRlD2PUbLghCQ2PMdd58WGzCWvI=
X-Google-Smtp-Source: ABdhPJxgrQwEBy+M47N+yJvBiTAokVTauaR5B704ojMwhTJr+8j4sKxCFA2kNxBO5mWNNtCIF0a5Gw==
X-Received: by 2002:a17:90a:cb05:: with SMTP id z5mr383418pjt.216.1605712086506;
        Wed, 18 Nov 2020 07:08:06 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:06 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/17] README: fix incorrect links
Date: Wed, 18 Nov 2020 07:07:43 -0800
Message-Id: <788aa3057f7f67ced51eb2408317aa7ed3361814.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Diego Rondini <diego.rondini@kynetics.com>

Fix incorrect links and replace the defunct "gitorious" with now popular
"GitLab".

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d80b5a52fd9d91b27b7f1967a0f2d6ccb6e22991)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/README | 2 +-
 meta-oe/README         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/README b/meta-multimedia/README
index 1c08f9d9fff..96910a94de4 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -14,6 +14,6 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-mult
 When sending single patches, please use something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][dunfell][PATCH
 
-You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
+You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 dunfell maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-oe/README b/meta-oe/README
index 10583aef271..f5a4bda0658 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -19,10 +19,10 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][
 When sending single patches, please use something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][dunfell][PATCH'
 
-You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
+You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
 
-Other services like gitorious, repo.or.cz or self-hosted setups are of course accepted as well,
+Other services like GitLab, repo.or.cz or self-hosted setups are of course accepted as well,
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-- 
2.17.1

