Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.3676.1617934867643584348
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mo52/Zm4;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso2403607otb.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cNoDik/wjYLDrZTnPW4LBijJvKI8YVWYRLZH+Li7jH8=;
        b=mo52/Zm46iYG9Dys1axzVSFe7oI9xT77SOjX4EYxa/ifY/43tMEPehztHb97OeUKJ9
         mWVuoxwzy4EeuqUQKDWrr7vxICCN5WLNqQ2bk6iMoI8YDZmOIIEhGGoWZxN8RZHOysrp
         1SKq5+oXsXoLXX/nl/KKbtz0A/LTBAwQmbOlW/9m+uyktLnvQHn5AtkCBiodtGEuWUFA
         nHJuVAb2+MjfueFo+0xjoLscK5ZOEeJiueIY8mDM4tJeKrQXbqMqxO+Dr/UlT+NfuUxr
         pK8op2kJdNU+nVpdNZBRLLw5IfrcD2kTtHJIMP7mcWpMXZSxX2lw0IQ+WUZZyJA8/Sjg
         RQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cNoDik/wjYLDrZTnPW4LBijJvKI8YVWYRLZH+Li7jH8=;
        b=sBmOFrZaRm0PaqH2B5K8fnXP3rxG1THxWYJrB98hge0DBs2hciXd3KqzpSmQ0rmJ38
         2ygEZyFV7V6I/iOTwwxAvwIamofh0S7SOIq42susaKMwWLhA1Lv+kWqJgllCofXDUw9O
         cnRfLkYrv0YkYRejCcrPlBSRZ7XEU1GoMuYyMkbIf2NniVnvNDDhxlTGngQVEd5rdLpY
         neqPkK2GFetRTsR0kJhs1GMUdS+DJbumdZQsQY09TwMUJQTS2E5+x5NLBkUuhOraZsYP
         WJbkDDRQr2xNBJhQtkifU/ikZSAlMHRvOaGHaxNbwuq9Dng6ly+PQu68aDfYrXfZ+fiq
         17oQ==
X-Gm-Message-State: AOAM531yIjFgYmZB/MYtxDhvMzMJBwzNmPOkkN3WsDmQS4XUX+uzQiic
	+rHxYBOktRl723jx4CNxLTU9IcXdOTI=
X-Google-Smtp-Source: ABdhPJyKEnijPufj3ju4y9jC74fym8M3BlDTeoORnfSpN1q3+I3JVNGfUycRYaV7pVMF3YGVMgqAFA==
X-Received: by 2002:a9d:2049:: with SMTP id n67mr10565206ota.116.1617934866888;
        Thu, 08 Apr 2021 19:21:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:06 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 16/36] python3-pysonos: Upgrade 0.0.41 -> 0.0.42
Date: Thu,  8 Apr 2021 19:20:29 -0700
Message-Id: <d54c87312656f6b224019d4afc1dcafd20980933.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.0.42:

- Handle parse_event_xml doing I/O in the asyncio event loop

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 478e0e5833e8815f0e6ba77860ad54c342f34fb5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pysonos_0.0.41.bb => python3-pysonos_0.0.42.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.41.bb => python3-pysonos_0.0.42.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb
index 564d60ee47b..25defabc51b 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "08d17fee04cc8209b915e61407673ea843b55792a9301fbe86adb9cc69a67a54"
+SRC_URI[sha256sum] = "20b45fa1779a01325e67822d243e1a3f7657d8b515308d84c1eb3c805cc3bdb5"
 
 inherit pypi setuptools3
 
-- 
2.17.1

