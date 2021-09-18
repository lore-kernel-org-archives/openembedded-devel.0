Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.892.1631984268627966587
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HZv4L8fy;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id l6so3507020plh.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RYzmvSrNtnZPjTM65pEcmVCbAKdCp4NeYf/InvrrqIU=;
        b=HZv4L8fyN362KasoAA8dRZFjem0rc2pY06Y7N3JVleRDB2BV4XXzzD4uPwju2SChCQ
         fG0dboBjFMeoUgFCOLeHuKmngljhTEZh5sWIAayDMxr3LMYPyVU9nf4TBHN6u486qQ77
         XOQo1Gl5pTmJZpHxTmzIrCAnxI64l0geyOp7T47VLxFJbpq/DrWhB+Sv6vFU1FK0uxJD
         n3XF5gfnVITACZEUyOESK9Z/Z5gXU8DTBMdh2VKkQckc63HTqyhLeYv80uONw1EGpm4j
         3JYd93oOlpG6sG/zpsHOqVpNsRMcWoL3QZVbQ4uTqbEqc0Sq6pdzxuWdlQKoH0qHr74v
         irOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RYzmvSrNtnZPjTM65pEcmVCbAKdCp4NeYf/InvrrqIU=;
        b=YIcEPTxVsStbdsQ7WMpyEluPh8pIDcMAwOUF5B6HOxDSoONWDWLWFCAl00VzTafT5z
         RpCqgHOSPe2e0pbP34QNoI6DOKwYEtxrZosy5tlsR7PvS8H86MpE05woRcZcOZu9laVw
         R+FleXbn3LUJu5pXd1rN/kS4gEr6Y7uD8qsxn6uwcokSgk5NKgytRqRzQAEBMZk6uFUP
         n9nv9DIO33/5bIoR4eD0mIBxaM8J0+2AcbyMwcY3txKIf8fJg6yLhvJ0X8Bm/7D25wUn
         HdIh5MLhly/DbIS210Hj7gNM5h6ZPKvMnBHzFVoSaaNDGbhncFHljezEseSD48ru1ngX
         Kf0w==
X-Gm-Message-State: AOAM531kfH2us+El/+dd1xnngEiPi4RUQppXlLilCvujn7Z7QMNUnfcb
	9JBUXqpU/XiUCBNDFjxjs9qlRDiCQ5w=
X-Google-Smtp-Source: ABdhPJzYAeR2+axkXaTJAQNzfChzCshyp+LAePt9TJ9vAB869ni6a7AHpkafKJYTRlvX8ebpxebLyg==
X-Received: by 2002:a17:902:ce83:b0:13b:67d5:2c4e with SMTP id f3-20020a170902ce8300b0013b67d52c4emr15081124plg.45.1631984268085;
        Sat, 18 Sep 2021 09:57:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:47 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/18] python3-pyperclip:set precise BSD license
Date: Sat, 18 Sep 2021 09:57:31 -0700
Message-Id: <20210918165738.2581429-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
index 5295bdaed3..2870ec9c01 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
 HOMEPAGE = "https://github.com/asweigart/pyperclip"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
 
 SRC_URI[sha256sum] = "105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107a9bf57"
-- 
2.25.1

