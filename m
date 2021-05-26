Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.6313.1622029975142236930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a4BfVLgX;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id r1so729941pgk.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uiRDljdJCtlcdgi87uhTK9GcJ+2brrZgBu4R6kz1XW4=;
        b=a4BfVLgXKuCEHjcBv0IWVxIXrvHzxzZhJg94FZlCS0AXtsLEnQOl/5y03XLmUxZVwo
         T3o3T4+jvVR+rtJeDO2WY+3KUPjmcvVb016ag1XwzJI9Qmq05T0NPbrrpb8ZHksAunNR
         C1IbGufWMLzodueRQEb1ANwwfFsIOvxxghjOXVpAKP6Gj8wnso0uh2GQyzq+55roX0hA
         VdIiyBOr5PhZVZeQdVYO4cYL+mkvXqfFoWPUx4JEY8fDN5E1dERNZ90r8oRPUgz8Idfc
         IY+zhpFgIITrRKUFkly7lEgdRw2duU3J2t35VWbO9qeRoDgWa9IdsMqUxXJhciXt8D5s
         2tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uiRDljdJCtlcdgi87uhTK9GcJ+2brrZgBu4R6kz1XW4=;
        b=pvv2BNNdwOmLXeLjMSSKHot+Yx/EzVaQJa/rrfHP1vj6J97fT/i9FxFLLo+1Np0gmo
         lfA5MQBBPLcJioBNOrbTJYzqASeRQcrQh8vzKszPSvOoDTY7ceZMJdmEGocBAJFH4VmI
         YX6Q/U/DqhtVLcIXftDXsDgd26+KA/3dIy1ngOLTd5FMkew8NYKqrK5Is9WIHW+W+Pa1
         Tb7YpuVcq2YpzR6r8w7WbUZvdlZ+9bH33ADFPFgrOCfrDUN/XUqMIgUCnXI0S+1zDRrV
         P07qXcloFLi9+PaNGUykLzMovgYW8aNonxZr+1F4cM7BZgPHwWkn7+Sf86vnYdUBraYm
         jkQg==
X-Gm-Message-State: AOAM532M9buiLG3Pwh/bNWMRv2Xi71cfwBzR0pskTrEh02HKDV701hC2
	XYrkArjttsQ+91KJknxlVukRILOtSw07kg==
X-Google-Smtp-Source: ABdhPJxRHQDLqGc1vf/LpDqOIMPj/GqcAaYLYY8pyIwX5uFsfDvJ4y4WZDYq9tjZc/fL2c/USRp+Bw==
X-Received: by 2002:a63:982:: with SMTP id 124mr24725715pgj.37.1622029974628;
        Wed, 26 May 2021 04:52:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 06/23] python3-pymongo: Upgrade 3.11.3 -> 3.11.4
Date: Wed, 26 May 2021 04:52:21 -0700
Message-Id: <9e5c4181ecef45e58ecef449e17c3a96bba4b1cc.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.11.4:

- Bug fix where a MongoClient would mistakenly attempt to create
  minPoolSize connections to arbiter nodes
- Bug fix that prevented PyMongo from retrying writes after a
  writeConcernError on MongoDB 4.4+

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit dcb9ecc1e5720c9614b1cd27575e1e4886dff5c1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pymongo_3.11.3.bb => python3-pymongo_3.11.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.3.bb => python3-pymongo_3.11.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
index 3549adce7c..0c07344cb4 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "db5098587f58fbf8582d9bda2462762b367207246d3e19623782fb449c3c5fcc"
+SRC_URI[sha256sum] = "539d4cb1b16b57026999c53e5aab857fe706e70ae5310cc8c232479923f932e6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

