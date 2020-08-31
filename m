Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.57945.1598892701004744090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 09:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Va5mBD7w;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id d19so902775pgl.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZlb92cAtHTH1hJzpDOnZ57e5trjZl/xaNKMA+JSJdM=;
        b=Va5mBD7wzziOQO/8MWe17UPVGTLugO3qU+BbdWvYDo6z6YIn9WScjgeukIxvW5NIkR
         pSfdtVKpQ93X2gLRFjYJFlSCZ2+jCqZAXCkC0hx54/+FOrRMw9Tylow0JiwOuSIWFT6C
         nKwD8+4GM1ldslvBkFfJeSM75TghDCLf9OuYmgA/q6fnAwp3w4+E0uceBnoOSBh8Ep6K
         qY3tYYQc+ckD83f9hgKHSaijt2owenpECavqoS4wlNBO0ZooEOKbOS2l3DFpAIKtVvUm
         g8mGaOuIWHt0/cq90TVVOjAezcTnW9GPwzrlN/nOSVSaaDDWdlqy83UuWYLH/uR9+pAI
         tKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZlb92cAtHTH1hJzpDOnZ57e5trjZl/xaNKMA+JSJdM=;
        b=Ap9Gq75nwFHN0V+FHg1TbOmkBYmE0k6Yv5tyRcafc9JcB5wrhPb0lybqvWkyHyS5Ay
         HhHkHLT6Ak/ls269DkS1A2JbXYm7dH1JYsonA5D1hrJmhHDL/peEOQ18BxlIEp9SkVDe
         lK5G35f71FgEM6eCgoUZAoM/y9ITuUofHuESi527DzUHsyfspyi/gbJHydyWWZiuIPq2
         pGvj9qtV03FEv5cVJ07zF0L9zaPkZ9cCjD3YW5qd6TBZmy94kVpaHR09CsyUIkd7KSWp
         X0Q9iT//WupVUrYemjOLIWfoABdRQnAnWni+2yVcrgb2jxZprnQ3ZfIg8Y6icFxhCyIt
         UKFw==
X-Gm-Message-State: AOAM532fgg63CYRhcPLiVNjXQSqIbgd3d/gBFYecRvPHZO7t3ZHjIzuW
	ohTSGj9KX6ge+NT8L0QM6hgWobSFjocyMA==
X-Google-Smtp-Source: ABdhPJzPmVMyNHyuD/P/firlDQ+zaVZa9K6am6mEpL+q4cn/LPRgHa7rfjfsJDJui0hqADvtCzzyqg==
X-Received: by 2002:a63:d449:: with SMTP id i9mr1792091pgj.83.1598892700290;
        Mon, 31 Aug 2020 09:51:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id in12sm115323pjb.29.2020.08.31.09.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 09:51:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] uml-utilities: Use update alternatives for tunctl
Date: Mon, 31 Aug 2020 09:51:34 -0700
Message-Id: <20200831165136.2817032-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831165136.2817032-1-raj.khem@gmail.com>
References: <20200831165136.2817032-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This can then live along with toybox

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/uml-utilities/uml-utilities_20040406.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index ed19d1e41a..8e00cb3ea4 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -15,6 +15,8 @@ PR = "r1"
 
 S = "${WORKDIR}/tools"
 
+inherit update-alternatives
+
 do_compile() {
     oe_runmake
 }
@@ -25,3 +27,6 @@ do_install() {
 
 FILES_${PN} += "${exec_prefix}${nonarch_base_libdir}"
 FILES_${PN}-dbg += "${exec_prefix}${nonarch_base_libdir}/uml/.debug"
+
+ALTERNATIVE_${PN} = "tunctl"
+ALTERNATIVE_LINK_NAME[tunctl] = "${bindir}/tunctl"
-- 
2.28.0

