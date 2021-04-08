Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.248.1617899816459143175
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TRFhDvOe;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2902470otq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=U/r218q6mQej/CnMd4B76NK/6nZsohbQjaaDPf7vhuk=;
        b=TRFhDvOed+Q5VEDNrtqC4GMB94LKolCcXS6JQZwi6viYcJbreyBP04xVASqmNbKuud
         ualmOFQ89VNMmuyCg9sYLCTP1i3qZnUUgvkMMf2ODY1lVMNRF3gGvT5236w+fdB/tw59
         MtR06KuCtWkRCmYcgbLbrzlHXqgFtRrx2Y5f/3x724Qf45FWCB59ZIixDoQOOZ1kkjJi
         m3Llcea8BU2kKT7+k8cap49IqkguwMeR/ltXYMNIbL9a0vSs7Ztgj1WTXw2vqLdvzi5c
         j7HE91WWljDacbdskORkjixvMar5ejQQdmaRLMWDgxVIGhaLRIKUB3qkks4wm08DC7wI
         EdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=U/r218q6mQej/CnMd4B76NK/6nZsohbQjaaDPf7vhuk=;
        b=N2q1CqjW0a2GKcD70gYRwV4MJPgCximn0+gzrjmStd3Hp2UyMQsEbVyUtwZk8Uul58
         wQ4UVBp/vbzM19xGx1zKah7uKtLZDtp6YMJUcuzbHDu2cjR5sN3TiNzwpvILinW5JUVU
         KOyefLdJ6Y6HT+9m/qg+PUWF4CcI9KYrQWDXb3oyW/7S8pD+46kTLJ6C13NCpI8GYsMo
         6b/CoS3XqqiC8bl6eMMIDYiieXkAjMWt+4Cm+0GAeWLCVhY6qX31TbslgTynFSeia7Vi
         KR03pCEykTFdtrZkO4yNys88Qk1dJABwvw4t7lV2+Xsu7sknf45NvwlEq4VEBXG/XKQG
         tlwA==
X-Gm-Message-State: AOAM531LuAZ9prZMNYB5UjnH0Zzg/n26QYRDx//LjQieqfpG/BHxbKUI
	bOb8xhuXbxibQwTjUd66a6AeGB2m7GY=
X-Google-Smtp-Source: ABdhPJy6utdO8dLbvXGU6H1rE3IV7fFTLi9U5LWCWnJHVXxnL4KSwFUf0mhvD5SyHZUt3ZgJwH8ICA==
X-Received: by 2002:a9d:600a:: with SMTP id h10mr8523972otj.90.1617899815709;
        Thu, 08 Apr 2021 09:36:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:55 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 46/64] python3-pysonos: Upgrade 0.0.40 -> 0.0.41
Date: Thu,  8 Apr 2021 09:35:53 -0700
Message-Id: <a21f622ab3d68c284544d93b84d93f6df2971471.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.0.41:

- Add events_asyncio events module

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 2a73a50db27c7c15a77519c92d66141d26fc6c7a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pysonos_0.0.40.bb => python3-pysonos_0.0.41.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.40.bb => python3-pysonos_0.0.41.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
index dbfa0dff5c1..564d60ee47b 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "3fed94dffbca5807d39d000d1415fe8d7dfc1032ba92a33d0b577eb2e98a81f3"
+SRC_URI[sha256sum] = "08d17fee04cc8209b915e61407673ea843b55792a9301fbe86adb9cc69a67a54"
 
 inherit pypi setuptools3
 
-- 
2.17.1

