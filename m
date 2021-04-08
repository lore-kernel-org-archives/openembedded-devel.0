Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.229.1617899789814834677
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DKHdCV33;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id z15so2775490oic.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tMkKBAwLID4X/etyD1E2msqr4ajtTce9SDBKwq9ISyg=;
        b=DKHdCV334HnAFnouz09rCS1A99tsLTp5WuxmI72iRfaqJkK82Wkp9Hbkeq8sCiZZl4
         yqsOtX186u/xLq4aIszImnCG4jKBe4LqX+x9+aGl+ahBuhDKgl0O7TtSxwPiXDbk/Dgb
         2chvHxgwuUiFov9A8KrHd6vtAppqJeQtm4+PirR0+JW3uVOwvniDYLxknZwfXnkZlW/C
         qkzcNtvjNLmTdQvqHfYzUsEte7H5LaD+X1ooVWYxE2Gw20MaLbaEVly3UFR4Jfdwk+Rh
         xmtX+AQfmafaSmnh7D4CtVChN2+3SujR85qmvh4tkQkaKwoCrpzMGalHHMH/QM8kTlnq
         yeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tMkKBAwLID4X/etyD1E2msqr4ajtTce9SDBKwq9ISyg=;
        b=aSiTe71F4kQbRb0Wm0ulRbe5XRc/DPFiwI4o2AauTo8yb6tunPQJOamfxtUOmlfFNB
         vTLMKfgZH+xRo32kNNC4RJ63WEf+K59LCd1+5TtbeaMUJP3+6fHgHJCh+i6QdHukPJeu
         aGD5Z0X1sNA7/bgnHP9ddkbF7PAcnfsQ3N5zkqG9GqwgeuWMbwkqVYaDyhUNxHfRUqm9
         CNqR7JX6PENFHsYzamvaAo0xzcTAGVDN9icLi2ILUWs+L9WmvFJiM3WJ37Con4sIS2DB
         si/e8ANWMqE6CLZvpmuZ/3qMCCRHHsOKKAbreZ8lf8+ulGyi4s+n+TfqwPHOEv6dhI8/
         3nrw==
X-Gm-Message-State: AOAM530yMf5kHMQAUTXqhGzJ9p/XNlpfJ4N8lPfW1Jap44qTNWRXykjL
	1sD4KLTNI5XfLxKTzFz3lx/XgD8q+L8=
X-Google-Smtp-Source: ABdhPJyb4xCpHJF4bjoEqwdnwWNK1b6eZ08H77Hhwy5SOKeqw+tC7nP1wXiQT4iZtdJBSXJCud1XAw==
X-Received: by 2002:aca:bd8b:: with SMTP id n133mr6777652oif.95.1617899789024;
        Thu, 08 Apr 2021 09:36:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 17/64] python3-parso: Upgrade 0.8.1 -> 0.8.2
Date: Thu,  8 Apr 2021 09:35:24 -0700
Message-Id: <88f21c46f48e0cb8e4b7c28c6abd3e4a11bd04d6.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.8.2:

- Various small bugfixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 3e1cedb62a16498fec02afdd917b380adf0339f6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-parso_0.8.1.bb => python3-parso_0.8.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.1.bb => python3-parso_0.8.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
index 9e4ede52905..afcfabb95a8 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[sha256sum] = "8519430ad07087d4c997fda3a7918f7cfa27cb58972a8c89c2a0295a1c940e9e"
+SRC_URI[sha256sum] = "12b83492c6239ce32ff5eed6d3639d6a536170723c6f3f1506869f1ace413398"
 
 inherit setuptools3 pypi
-- 
2.17.1

