Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F205BC47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:49 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.155468.1703876561337187869
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVS3q/78;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-203fe0e3fefso3825442fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876560; x=1704481360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3XvGijVHkB6FL5eVDpy7w2osaVl3slGLrtPOqzBpUE=;
        b=kVS3q/78bOP/Q3atyaaEgTXevkQ/5oZuGysYMtfUbCVW9jTCwMFi35Yc3SDpAKq9QA
         Fhwhx0lSFMtpjSuFf8oqb5km8swG0OIp/QEpoc4y+8EuM4GmoLbnsop5mYFKIWwN63Gw
         Aa+dMJTaTK98py2r9OktA9V0j1C5V2wfL2Aq5K3JUTCBLmYrQioFxLzbUp9JeZcYexHd
         EkID4PFGKXK7kLQNqvWqCZ7C7ajCTNMrkhvPZS/mAr8mCgkRGv0Z1iAKNzx+iFkth0e2
         rrcMixESts9H190DrFAyg3LrlP13zkGVAb4MXPjWHZcRGFPV1STgSU6qS6zk/u90mMZk
         83UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876560; x=1704481360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3XvGijVHkB6FL5eVDpy7w2osaVl3slGLrtPOqzBpUE=;
        b=G38anKH53lSBXP5hQmw1qNg2Yxoa/fdiHgOQx0YEp5OFBNTJwW7b7PM2G0T5iqK8Fz
         Y3VxM17ucK/Yi5/XNotHpedbYyhUMoSSfGjGbHU6Rf1RzJUnAupmvA4emhIhUuL8d+OY
         AjCjxhSh8Ehco4xxlE2YhSe4AwPzfgyNSYxw/pt3kfiISSlmm4a30B3K0x4rWZqnlpA1
         TqlINEB5CbjuGlJeRUDQT1pJHG/pX0WCOnDlIQ6Z+Wv0BwPz46522cjjmWdBi6qIGwbj
         Ixq9FEBBM8q9HFrvsNp5treoePqS873VbRqPuY42H+1uKoDMeGCDqTOymVFk9Yr+l2jD
         mEmA==
X-Gm-Message-State: AOJu0YwS9VjtOs3cTdvpsEtF7kyM+T1PpENFMnSH/js6qIBSU+F3oCEp
	mNHMX4bed83tEE8EkIX6Y8tHzOs/cyJijA==
X-Google-Smtp-Source: AGHT+IFxL8BB37dwosmvsiamyMytbDPB911NlDz1FZYtHSdIcoqoY9nmgh7+96rodLL5HFvt1hDyZg==
X-Received: by 2002:a05:6871:147:b0:1fb:1480:b2a0 with SMTP id z7-20020a056871014700b001fb1480b2a0mr10221002oab.8.1703876560079;
        Fri, 29 Dec 2023 11:02:40 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 08/17] python3-ninja-syntax: Set BBCLASSEXTEND = "native nativesdk"
Date: Fri, 29 Dec 2023 14:02:21 -0500
Message-Id: <20231229190230.135480-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107890

From: Zoltán Böszörményi <zboszor@gmail.com>

python3-ninja is used as a build dependency by other modules.
For that, python3-ninja and all its dependencies must be built
in native mode.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0010c0c0553acb8a360b9743cec655950009d6b6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
index ec7747307d..2f94f7a6a5 100644
--- a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
@@ -9,4 +9,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "ninja_syntax"
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ninja_syntax/"
-UPSTREAM_CHECK_REGEX = "/ninja_syntax/(?P<pver>(\d+[\.\-_]*)+)"
\ No newline at end of file
+UPSTREAM_CHECK_REGEX = "/ninja_syntax/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


