Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.43854.1589813421841296664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pdn8439b;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id x13so5054438pfn.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=khWVdGDZ3mLuCI1f4frhuiTrtAcrk+6SpnZTEq6IFoA=;
        b=pdn8439bkD6ONMQF9TB8wWhspyEsMgJh0D6ozhbseroohM39y0rwXTW2620CGrNheZ
         MiFoPXHUccyBiF6D0QHrPgSbXp6NvRHNltV1E3U8TSMqwfIMYCS5X6Ymex6ZwsjYgW53
         8fcj7PKpn9pzMwvRnzVNKhopa1JwPE1kVLx8ojf3hgusBKMQfOfM2Vp7gesDaeDhkQ59
         3LhPheB/5VDmgDO4Mt433OYqluwgI1y/VPtESfZ1uwOUIABwX4R1/HyZi3tj1zfrzOfK
         Xuu5zuoNm5TgXiIoheciyyHyTqTDevXhqn/E24kEeXIO9zCQmkrPzMKDXEDHrDwCcDb9
         Pwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=khWVdGDZ3mLuCI1f4frhuiTrtAcrk+6SpnZTEq6IFoA=;
        b=OIOs3QdQmHEEOplrmYyXUoFL37JG5goHAHzFYFip+HUrNJRBY9bvzXXNfFR8tUL3bA
         qn0vHoD7/FQ51OsSwYJovBPfthPHoLfN+CUZfbEdzUbkbWCQgIzlPkLe20Vh1tyFD5ta
         FQWCbUQGQQtB8oCscVm2k1ZI72b26vduPhApZSsZUIyQWnQBIbFL97i5CLhyTa8EhT2H
         txTlYq7aPkcC5AYXxPCEYaTiw+vQVj1JOSW5TvpGYcCqzvZsFmH1Wz+uTua8BGIGdmO+
         /xTUYwtEMSbzpbAIo63g1ewAA7bBYNDrfkQWpTRT1DgypOsjvei8HXlizaLF6KbqJ24s
         zOyw==
X-Gm-Message-State: AOAM532Rkql13kw7VrxYm0eRZUOXv1h6snQ/Uu1RWeMi0r06/De6i8Wu
	Uy82mWOCu8oCjCm8hwVndN9oqdPJ
X-Google-Smtp-Source: ABdhPJyXRkBx/pCTYMcvYRQcyH0cIUdyHMAkySsNf0Rc5xrE106/Jh7ISnppImSOnC0XxDO83DZhPw==
X-Received: by 2002:a62:1dd3:: with SMTP id d202mr5454550pfd.99.1589813421160;
        Mon, 18 May 2020 07:50:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 14/57] python3-pydbus: add the missing rdepends
Date: Mon, 18 May 2020 07:49:19 -0700
Message-Id: <5d53a615098ec46c1180ea458b5ba99598db71a7.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pydbus
 [snip]
 ModuleNotFoundError: No module named 'socket'
 ModuleNotFoundError: No module named 'logging'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55190da2eba946319453531021089186bd2dd551)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 931bc6f7cb..807e7b2de5 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -14,4 +14,6 @@ inherit pypi setuptools3
 
 S = "${WORKDIR}/pydbus-${PV}"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pygobject"
+RDEPENDS_${PN} = "${PYTHON_PN}-pygobject \
+                  ${PYTHON_PN}-io \
+                  ${PYTHON_PN}-logging"
-- 
2.17.1

