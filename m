Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578B9C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 15:23:31 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.21345.1708097004839682907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 07:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59d489e8d68so309510eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 07:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708097003; x=1708701803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WysB4CPIx2pjdcYAN5DRcxp69Zrzud9milxFg6fjO9k=;
        b=J/CuN04Gf5rEb/fw+shwUtDbjbDAn4Tsb5VwQxLMUsAdiK6ytKRWWaOMO0wge8qur8
         6uN4SB6RxTAKpop2RHeQRaYWVQ2q+OdvOtvi/P5InfqZ/urGpLLfJyYCAx8hGXNsjoet
         /gO3S8s6skr0M6ZOol1F3xqR+0d0661ai8YiDOp/zvl8s6MzAs3XYQaEZvcuaihlqSNX
         05K3okRc4rjJyiAOzEJ11BDfL4BkMVYhKMFNBndY2UcWVP8qfANm7hTrlBvdJgUKYJFd
         pfBG9luW7+qhQNYDi8vE/6TjQ7AhEWtb7E+84E/c+Kq5XEHdDgyWH6Idk9J3BM5BYhFY
         gvSA==
X-Gm-Message-State: AOJu0Yy9Re5GaCacn5I9lwHa9LWKLmvBDRE1PdJb/AzvtdAZuKr2HRUR
	Q4DXStbpsxGRLuHMLqIaQeeRwyWJAA0d/tnA3Js134dL40+QIpL2nwQsAq6fopU=
X-Google-Smtp-Source: AGHT+IEeyjxi6qriH0uBjn05YB3R2f+pFoxXkYH9kBeHKOvMKhQewZ+aJYJ/s0nbzAwZYNwdH/zt5Q==
X-Received: by 2002:a4a:bb07:0:b0:59f:91de:26ce with SMTP id f7-20020a4abb07000000b0059f91de26cemr3360896oop.8.1708097003440;
        Fri, 16 Feb 2024 07:23:23 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k1-20020a4a9101000000b0059a14309a29sm13648oog.16.2024.02.16.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 07:23:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/3] python3-appdirs: add ptest into PTESTS_FAST_META_PYTHON items
Date: Fri, 16 Feb 2024 15:22:58 +0000
Message-Id: <20240216152300.2587130-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 15:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108767

Verified successful test run using bitbake meta-python-image-ptest-python3-appdirs on qemu86-64

root@qemux86-64:/usr/lib/python3-appdirs/ptest# ./run-ptest
============================= test session starts ==============================
platform linux -- Python 3.12.1, pytest-7.4.4, pluggy-1.3.0
rootdir: /usr/lib/python3-appdirs/ptest
collected 3 items

PASS: test/test_api.py::Test_AppDir::test_dirs
PASS: test/test_api.py::Test_AppDir::test_helpers
PASS: test/test_api.py::Test_AppDir::test_metadata

============================== 3 passed in 0.19s ===============================

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 44704208e..a96009ab9 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -7,6 +7,7 @@
 #
 # ptests which take less than ~30s each
 PTESTS_FAST_META_PYTHON = "\
+    python3-appdirs \
     python3-ansicolors \
     python3-asgiref \
     python3-aspectlib \
@@ -62,7 +63,6 @@ PTESTS_SLOW_META_PYTHON = "\
 "
 
 PTESTS_PROBLEMS_META_PYTHON ="\
-    python3-appdirs \
     python3-betamax \
     python3-dnspython \
     python3-fastjsonschema \
-- 
2.34.1


