Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.1850.1620069133934246419
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e4EdKQB2;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id c36-20020a05683034a4b02902a5b84b1d12so5694400otu.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Ulibi+GWXPIbb8qNPXPTmCw2queryTDR4kaALIdxxxw=;
        b=e4EdKQB2xBDLKBSetaCvWL0IVFrpXiwUsFWQ8RcJjkpF41zY9ksghq8kUGUQCuIWH+
         onAR/hv0QIxDc5ih1NvAv83u0IiaIk8Tprz2AhnReoGYJCtC6wKYelsC6XYSsTSv0m13
         eJKtRL3KF5tDlQghw2Yi33uW4mXbk3bXEhCOramBQjIU3qRcABgo9JM/TwLdMxWdW/F6
         sSbfodP9gLTgpX2lkyuEwgGyTJrEqbPHZ6oxedL+dOXuS5192idoqCSia92IKTtXvH6E
         +J3whhvE2iOTwyumKnx9/7CCI4yrboFa6CCjqaKbdUsuswEg8DImMSAW3oig7R/z7Xiw
         mDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Ulibi+GWXPIbb8qNPXPTmCw2queryTDR4kaALIdxxxw=;
        b=LIXyiTgEl4tyBmIXvxWDwL38dcp0XUuQIf7+1ZHdmtbskyWAvrLZZ32UsIpa4D+e3K
         J1qYBQauviJhnwqA1v5Q/jSxfuYeUWgLDmFa1G7YeIu86DH0Wx50HgEA/ggjPYdaTtEs
         0fTFEceLL5dezDIRv84VDHezW3NEXAsmD3O/A459Rq9OiJ9umXSwToHuMjzKC+xPZp9f
         6lD39Sw7e54P1jqCbQuctVFOcbpT0sFzxc9WxQ7nINpwDPOupOnMeX6L6DNFNiZx72BW
         Rr/v8mVX3EarN4k6maQVJ/K/AdTndyLicDrKd3U/MY8q8FdZb4m7wuPhTdXbbXbFKDBl
         Ld8Q==
X-Gm-Message-State: AOAM531ocZsdC7dUBrDHal8y4NcRJoN2wLpPVopeQPoxU7JeOvC9VNvG
	2+qDeM2+tQWLv9S6nlYDqq3/nIUqaxs0AA==
X-Google-Smtp-Source: ABdhPJyjScRbPW7VcrNFRXd+pYfjLc8PEGe1PxkhtdcDVz32ltZhsB2dtSsUD1xw8lEIAYwY9GyMEQ==
X-Received: by 2002:a9d:6d96:: with SMTP id x22mr14791627otp.230.1620069133006;
        Mon, 03 May 2021 12:12:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:12 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/14] python3-pysonos: Upgrade 0.0.42 -> 0.0.43
Date: Mon,  3 May 2021 12:11:56 -0700
Message-Id: <2eb29a380566cfb7c566961ecb116c051639cf47.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.0.43:

- Downgrade asyncio log severity

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 2d9aca131f4885d78a3d5470f2ef9a8b3fb68a19)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pysonos_0.0.42.bb => python3-pysonos_0.0.43.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.42.bb => python3-pysonos_0.0.43.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.43.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.43.bb
index 25defabc51..dbb6a8d8f6 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.43.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "20b45fa1779a01325e67822d243e1a3f7657d8b515308d84c1eb3c805cc3bdb5"
+SRC_URI[sha256sum] = "47be2b37defc856f15d7e7a419cfb939e9822750efe968db192156ebeba31684"
 
 inherit pypi setuptools3
 
-- 
2.17.1

