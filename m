Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.43859.1589813437467752390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pfQjupCS;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id k19so4317866pll.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5d+pS33d8ITbvM21rrNopLVRlgTzbaztYqs7BsEjmhY=;
        b=pfQjupCSMaY7TIw2kSTxdx+Mztyy8A1mqXQxMv8k2wRZddCiSEDHyM6ItdLS4rEbI/
         QpMmgkPCE66Bkt/p21iKR4OeyNwENcqUjlmMQLDyk4HlYgC3i92lBxEb1gonaQ9XOmDP
         gGI0rRncrWoyYPYyeOeuGUN8pedIZnQ27wexrotEhAb3d6XIlKYvaSMNXJd6sj4IJs3z
         E+dJvWYoGjOvhRG9XMgoptExqW5udm8ZbkXJqlNTitp89DqnHgiCIjT/PBXAuiyLId96
         N6VmDsAu7bcLJrFSXyXXu96WJo0H3Rl825e0gyc/CpB8hb7VStpF7g477beKP7JixdeZ
         EptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5d+pS33d8ITbvM21rrNopLVRlgTzbaztYqs7BsEjmhY=;
        b=bHejhrzKS0qEg0RvrjI6IbJKEjEtz/F+D5FWiHETtl+q0gQkXMBeKJW+PbcMk/NFev
         Dow9xLIQXQrAICSUYx+uxpILelHwL0N50Do2nPPKY3jz4t6aI+aZoSXwYikTur0nVVkf
         WLaZms9w9kg6YC3vi6Z1tJ2SgQONffOWMrTqiT343BgWzdkfmG42iODYwjXiMK23MnfR
         PTzWLY25ZK+n0483vL2ENBA2OEsPMIhzH/I7ZuYyaT5wF4Hb7QyhmmVIcibklp5quY4I
         YhOT/J77Neh9WE5A69o6ZscuOzqOcsQAAo7cmPxmZoLRxtHhtvmBP48ig5SCvNQqHN/h
         xJ8w==
X-Gm-Message-State: AOAM5331PYVeJoBfFDrZOOc+wPGzwZnTsmYnYoRqKf1Coeu98CrOwkLv
	xVqOAeSTI9ss9OYTMZEap8N41Yz7
X-Google-Smtp-Source: ABdhPJyVOtSSGM5gTpHMuCZMgM2WRbJDPBYI0CbGaxobIxH8+M/u2kY89TapY07B9z70vE9L3c84RQ==
X-Received: by 2002:a17:90a:8c83:: with SMTP id b3mr19881353pjo.141.1589813436759;
        Mon, 18 May 2020 07:50:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:35 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 28/57] qpdf: link libatomic explicitly on mips
Date: Mon, 18 May 2020 07:49:33 -0700
Message-Id: <514dfbfc3e233c7c02c04ef2f2ee15fedd1d5c19.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7a1f41a6a0823e6ac7d5e44dba76ef9e7db3c47f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index f04e437d34..3883a8dcf0 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -20,6 +20,8 @@ EXTRA_OECONF = "--without-random \
 
 EXTRA_OEMAKE_class-target = "LIBTOOL=${HOST_SYS}-libtool"
 
+LDFLAGS_append_mipsarch = " -latomic"
+
 S="${WORKDIR}/${BPN}-${PV}"
 
 # avoid Makefile returning error on 'make clean' before configure was run
-- 
2.17.1

