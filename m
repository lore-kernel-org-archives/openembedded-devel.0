Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.1005.1620325638517347146
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gjd2chDx;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: romain.naour@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id l14so6636862wrx.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Im2elw5mD2eRCLrQhNWNFFMqaI+UxvuRkIdeMjlwmcM=;
        b=Gjd2chDxtja+INMDZpHRGlFZJZOI4y9D3yVmoJyNWgsc7l98hkTlE7kbrY6S+FEsn7
         TqIgR6VQOkwqS5IAEuwWR2e3N4Fex/VP+iN9BOWb2GrAitBCAXSdqz9pMigF/TOdszLV
         u0Vn05KJpinFOEjMQCKGC4fhuxLNMXqpDhfe+a77iG8cU65U3zX+FSdGaq/kbHlTTGE+
         uPHuaYZv6q5HxeBwow2re6RU9fwE9nuUvXljz5Nk5Dtu9ViFU8P6hDEuSjkVrsT/RZGr
         u0ojmvqPsnZPC1piA46NHuUNuVSCmN3g83Bpc0xJgFicS4WebQa4GoiE+RWVyAWBwKjv
         TsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Im2elw5mD2eRCLrQhNWNFFMqaI+UxvuRkIdeMjlwmcM=;
        b=dk/zduJJcrzuVDy95j5Ti+Tgst3HrqCxXmpshxNVNxzR7laT8olXJ4Mq0xTcvpQV68
         Xrwxt6v9P7Y474jFQR4O2KZgOo+uc0I38vCrFHSpgR7UOd9f3a2C6fqMDByWGIiS809D
         4oxN5HWnTFS+sJjnZwj80i+44VKPqH2z/nNtWAlGOZrojAehA/a11RhSBUtUiRzB0JCn
         isUpDKrxYnTYz3IJzSzUeAhFGEoSA7cDIhXv6BpR15+O1qMPUcu7ReI94MciPijW3QIW
         5LBq3MAbJzjl97Jh1CkBWFI5L8GFzksbTVLVJKHKKWOp1WR8CkYb1UkoZANNZsabjJcD
         ISlA==
X-Gm-Message-State: AOAM53120NmzGOQ071UyAQ+5Iv65N7giK2lDqpHS9xIBx02MemZscsFG
	bLRmXTE0jnCCf3KpPkQDx03qztOrIso=
X-Google-Smtp-Source: ABdhPJx5SnJrosfYjQUBD91+h5MNoWUhxnA/UT+FJZZrbYN3FEfkHV+2n05bEBn30HKvLBjiJQllWQ==
X-Received: by 2002:adf:d1e8:: with SMTP id g8mr7053627wrd.80.1620325636908;
        Thu, 06 May 2021 11:27:16 -0700 (PDT)
Return-Path: <romain.naour@gmail.com>
Received: from localhost.localdomain (pop.92-184-97-96.mobile.abo.orange.fr. [92.184.97.96])
        by smtp.gmail.com with ESMTPSA id 3sm4117051wms.30.2021.05.06.11.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 11:27:16 -0700 (PDT)
From: "Romain Naour" <romain.naour@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Romain Naour <romain.naour@gmail.com>
Subject: [PATCH] packagegroup-meta-oe: Add poke to packagegroup-meta-oe-devtools
Date: Thu,  6 May 2021 20:27:12 +0200
Message-Id: <20210506182712.2632787-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index eb095a237..e9493fe27 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -300,6 +300,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     xmlrpc-c \
     yasm \
     json-schema-validator \
+    poke \
 "
 RDEPENDS_packagegroup-meta-oe-devtools_append_x86 = " cpuid msr-tools pmtools"
 RDEPENDS_packagegroup-meta-oe-devtools_append_x86-64 = " cpuid msr-tools pcimem pmtools"
-- 
2.30.2

