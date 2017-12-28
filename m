Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1139271ABD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 18:29:45 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u184so50588340qkd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 10:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a4FMp+fNGslQO8B+PM9ZYmsWyYxXSwEZ/zUutesxs+Q=;
	b=TXPIvSLBEGAtYIf+x/91G64lg5TUpfdcxhFlhBF7nrJd5C1HMrLcSru7UkQz3aJGx8
	Q3NcNYdXW3q5FZU9Fjucr6wGiyryDHON9Chj7WViZWG2by2Ao+hrZZm0WLLJ4mKio/yn
	DTgq6ksA5brwH444cBCjcZ2A4hvxeu5bYT3l/Dwngyo/lWF9cogvaoi5mOCdh1ZfKGkw
	agDtYjg/wNGMsKLJYCd5uyrxkMmd4CJp7HJdU7kFrSUUKf9Wdg3F5DMzMe+wEIxfsj5+
	4yyYx+RmpstJTMeVhex9q6Gq9+3/zxqH7Wsh6xJTE18UAPuofOY9pDa9RHQAOi2jPUz8
	kLJA==
X-Gm-Message-State: AKGB3mL+g5/2ME0z0w3rDuO8MkPT+yPTd921NdcY7gr9N0s8AMGPe0w9
	wX03EJcg9043A68I2aZvXa7ZFMO2
X-Google-Smtp-Source: ACJfBotzTav5oNCtd/nNXqPnFf8KMLx1CTsP4yVC1B7nXLJ/np6w+ydoHtQERdm0/zQwFfJob1whzw==
X-Received: by 10.55.10.2 with SMTP id 2mr42022136qkk.108.1514485784547;
	Thu, 28 Dec 2017 10:29:44 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	r9sm22788518qtf.82.2017.12.28.10.29.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Dec 2017 10:29:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 13:29:37 -0500
Message-Id: <1514485777-10265-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pycparser: add pprint to the RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Dec 2017 18:29:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pycparser.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
index af82583..f445a20 100644
--- a/meta-python/recipes-devtools/python/python-pycparser.inc
+++ b/meta-python/recipes-devtools/python/python-pycparser.inc
@@ -10,6 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-subprocess \
     cpp \
     cpp-symlinks \
-- 
2.7.4


