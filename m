Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.26352.1608483247438173568
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WmTjrbub;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z12so4833319pjn.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=46RI4DLGKtM0l0nw2NbAjo67iW7YWq1jtUqJxbTlBPo=;
        b=WmTjrbubr2bsRd46ttNWiIwwLfrVLVjsz1RoVqSt2KG91RbZXM92UfukzsCAFoiuqM
         BnKxgFhoU+m8BUvur4IXA9rVm/FVuwWdx4LP7agSCFhzLQ529gq1bSWdJAqtMUQP4VRm
         srb7zOJFjiIN8Eo+YTUk8RikltcKHGkVLY56h/iU5B4ZBP12gN2+D8HLK4V7rLMGA27O
         tOqVjt02VkMZ+GMhUJ6PZyjrIsx/cSiHcg3cQjm/WIHgfrCGMvdkKh1OMfzMCSFjpqjw
         KNg3/OUIKhwN0jfBOp5DccWLJRAeVimol67WqYevFK96KB9BXq4WELeGTwuDV+Ddb0Bw
         bTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=46RI4DLGKtM0l0nw2NbAjo67iW7YWq1jtUqJxbTlBPo=;
        b=OVmkDEUgz13iap2YcRF4RORjHdL20DthzYz9Rqq5sHWzWLNeaF7alKGdisJ/rUEh8c
         /rfjEBbaoSNAmXAC2wh2hkqI0cTGhh1V7afKyimIZjXG10C3rha1ssvJiRm1jV1SmRv9
         vNhYgsFJEZwi4gH9xjEbwfski5I2F9shSFyC1WxDXsiow7bKSm9ykpxbrZkqVrnIgOWG
         mwpeB7fJVHpCb4ZyyY832rSpAKaLOuiv4W/JZkcGj2LpcIRVfnmPK7l0gvXfTj1nTHwg
         /2kc26yFjty2WG6Yi4DtH6P/Z1ftV1+ni5Zbpr++YNx9SLVryPJUYaJB0oqQx3/VXXWL
         ha0A==
X-Gm-Message-State: AOAM530q0gkwAGjibzyQ6xH4G7KsE96BUg1QC+dLQ19jrlqO41CmBAl4
	RoGtN9kMPUtEQ+2OgvEjLn3VDNa6vlRvjw==
X-Google-Smtp-Source: ABdhPJxqfGFLGo024L0E7V9PM50LFCq7RsSmuWlNHAhTBQTztryFMqCNc0KGymSXA5QnrUZuPBCBxw==
X-Received: by 2002:a17:90a:12c4:: with SMTP id b4mr13575224pjg.234.1608483246657;
        Sun, 20 Dec 2020 08:54:06 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:81b4:28ec:120:f083])
        by smtp.gmail.com with ESMTPSA id j15sm14192234pfn.180.2020.12.20.08.54.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:54:06 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 2/6] minifi-cpp: depend on nettle and lz4
Date: Sun, 20 Dec 2020 08:53:56 -0800
Message-Id: <f7984364181f9bb4e20d15af9431bad54ebe861d.1608483161.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608483161.git.akuster808@gmail.com>
References: <cover.1608483161.git.akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

Add nettle and lz4 to DEPENDS to make the minifi extension archive
support crypto and lz4.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 3815220cb30..2b884e3a1b0 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9534eb5f4ab800b573a37bffc62f3a7"
 
-DEPENDS = "virtual/crypt expat flex python3 bison-native libxml2"
+DEPENDS = "virtual/crypt expat flex python3 bison-native libxml2 nettle lz4"
 RDEPENDS_${PN} = "python3-core"
 
 SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
-- 
2.17.1

