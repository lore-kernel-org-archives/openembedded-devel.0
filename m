Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978E6C77B7A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 18:13:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.188.1750356774271416168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 11:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UPhWVUzt;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so1725478a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 11:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750356772; x=1750961572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7HFlA9PWd+Bolg4QiaXMcovMO6QnyTfQZWMIrccFJg=;
        b=UPhWVUzt4nkApu/D8yF5CMmdVgP4BU9eLyp0iik9xA2Os0lnBsq6NQ1Ef71NHPZw15
         KJVIHgwdcsjPKWlWVUawLRxXvVoa17LoVqut2wYQo7wWjXg2ySBAPo/O68zO6Ctd/JJ3
         DLJGOtwi9cRh3R9WuIRibcD5MiY9/9OLOvqog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356772; x=1750961572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7HFlA9PWd+Bolg4QiaXMcovMO6QnyTfQZWMIrccFJg=;
        b=n51p6jJX8RyYdgQyw9Az3xc22683J6ngymCtzuqNSPGA3gu+RfuPRS2HZHFILTt1e7
         tAg1EYCGc7ELRD3e8AJwAcQzGjl1zRuT9nXCMcvOv7UOQa7ARCuOdOBfvVMH/AbL7LGM
         5cAZqrON7Bjzbbf7D4eESv9qkVPwiJnf/D5D1kr8OteB6inMCUU9JXx3wexGnxx7+0YC
         on5W0kvwtLc7M8MYsAAWFObSBnqrfs9MPTqyZBGF28UQQk80vNyv2SGTrGWE71SZgRBh
         LQi9cUU8kfIe3Z4UuWy/1i4MVl2AQiu30rVh/mRxlJSPsI/IqPldWDeKUwpLAzgg/aTi
         M7UA==
X-Gm-Message-State: AOJu0Yy3bBxq4lm7ISFzgrjPQZUSn4vExcjqfXosWkfANou85CiFQVaw
	rgJC+Tle3yQkfM709r+IZQzv7oA/6hjfiCCo0sLSF+/vaI6VYFk/uc76z71RdtqMLeyVTLoZJVY
	Nu0yo
X-Gm-Gg: ASbGncvItCLvUuEEsEwBSCbC6vDGvGKNbK4T5s1NOEyanr8UdwzjWi6heKHY1zI+LEH
	M8DL1Udt0shzF9XsbsYIxOiqnjyLXboqAPzx7lNxCSu+8bG90GuMPxX5cNKb533RRgtyGCQOjS/
	wqaK4cmUwFkjyejhcf1I+IWMEswRHkA80/upTZ61w+wpfw6b4HYyFHRxMbdX7JQy2mEU4w4OoDp
	0nAWJlETxmbeeKnuw4DLULbL6RIYpHDWsJ+4JaMb47ttZkwqJRGt5p8NITnRHeRiX1KzjapugVx
	H1d8ZSQCL4/nU16UY2GjSsK5JibZEhr9ABlO1EJIrew/fPLps5n4fnlGRx1qPlhwqD1NZidvivS
	S
X-Google-Smtp-Source: AGHT+IHXx7qYwWFWXFSqnxf247v/3rLOjOtwZCS4mqiNQlQvpr+b1ZRPG4O56ffdfvrWzI3yRhEr0g==
X-Received: by 2002:a17:907:970f:b0:ad8:9c97:c2fc with SMTP id a640c23a62f3a-adfad432199mr2135489066b.13.1750356772229;
        Thu, 19 Jun 2025 11:12:52 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e80862sm26048466b.35.2025.06.19.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:12:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-qface: Upgrade 2.0.12 -> 2.0.13
Date: Thu, 19 Jun 2025 21:12:48 +0300
Message-Id: <20250619181249.4090191-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 18:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117954

Upgrade to release 2.0.13:

- QTBUG-129592: Throw error in case of invalid yaml format in
  annotations
- CI: Improve coverage and enable the flow again
- CI: Inherit secrets from toplevel

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-qface_2.0.12.bb => python3-qface_2.0.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qface_2.0.12.bb => python3-qface_2.0.13.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.12.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.13.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-qface_2.0.12.bb
rename to meta-python/recipes-devtools/python/python3-qface_2.0.13.bb
index 04e1847d5b..679c9af629 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.13.bb
@@ -2,7 +2,7 @@ SUMMARY = "A generator framework based on a common modern IDL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
-SRC_URI[sha256sum] = "49136491806352e0c503f3ccaca5d77102a5f45f63de74c608576627ebfc81e0"
+SRC_URI[sha256sum] = "e47be09989e3bf1c3201740501a07d9cd631fb29fb442445e343c94af7b480cb"
 
 inherit pypi setuptools3
 
-- 
2.39.5


