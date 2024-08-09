Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D68AC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:54 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.79759.1723193564711092298
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 01:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BaxZsZ+a;
 spf=pass (domain: konsulko.com, ip: 209.85.167.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so3887357e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 01:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723193562; x=1723798362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJz8cqBnLP8/NgC9ho5yK1eSlM5x8QawgUf3QGocrNI=;
        b=BaxZsZ+aywEzrddp0butZJQazvkAzl7RCWjrPODIKDJS++7WNk41YLRScWoya+yN6m
         KhPHjMBLy2ueMvYok0rI8TxOVcaY4Ph3WaPFJ8EEPvS9IoHOvR1HkCwt85WT5Wfcf8lL
         wL3ansYYw8kwnq/eSA38jeU0DVhw0eF4zvlos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193562; x=1723798362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJz8cqBnLP8/NgC9ho5yK1eSlM5x8QawgUf3QGocrNI=;
        b=Qhuq/ilh6/5gxSOUnA3i+C/kGbT3edenPb84ItTyiJjHaekjeaPC/Kmi9CxsEIUSEn
         /lpq4v3NfM9ByWozG+HoM5mWD4FXdYYx1CQYt7zk78qb/MPjkNYqLmV6Fh8hhrQhmE17
         u1qrdIXJQO/tC6hk93l3B8EuNTqBx2WZX6aaqiDQ20qnEdNibegMhYhT1xjwXRXYDBWg
         JDlYW1mOEknOcsreacLcS50r5iMuQ5K1mYn40paii6KjN8EdFVz484uWDgfRgTW4yNCL
         WqMcURz4uC/L9X26CHbk5jJ590IjhJ59eNn14EYbFwm0PBZn+3xxgquiw6+fjcX8PBPY
         ibCw==
X-Gm-Message-State: AOJu0YxCEa6XjmjP3kai3whVvjtdwxRjasCI/c6Gg0G/xm1nMRaxGIev
	uPiz8wnzTpyE76VOXOsu7tD3xjDCEaF1JrD47zFIuviBFJSMajK/YLVODcU/ard4f3s+k98Yb60
	4
X-Google-Smtp-Source: AGHT+IFxg27wj3XZABSWT/V6LUKor7HkrtRkBl6mFeRCWws5d3R2rkf/fC60wlADohIra/pT3vOg+Q==
X-Received: by 2002:a05:6512:2309:b0:52c:deb9:904b with SMTP id 2adb3069b0e04-530ee9ec018mr870870e87.38.1723193562077;
        Fri, 09 Aug 2024 01:52:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c4fsm823286366b.33.2024.08.09.01.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:52:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-qface: Upgrade 2.0.10 -> 2.0.11
Date: Fri,  9 Aug 2024 11:52:34 +0300
Message-Id: <20240809085236.1828180-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809085236.1828180-1-leon.anavi@konsulko.com>
References: <20240809085236.1828180-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111689

Upgrade to release 2.0.11:

- More pathlib related fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-qface_2.0.10.bb => python3-qface_2.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qface_2.0.10.bb => python3-qface_2.0.11.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.10.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.11.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-qface_2.0.10.bb
rename to meta-python/recipes-devtools/python/python3-qface_2.0.11.bb
index 9190c9a63..9ecaf5698 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "A generator framework based on a common modern IDL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
-SRC_URI[sha256sum] = "8606fbade67c3c0afe8ed5bbe860e7ffcd523ce0568c3f9dbe9f04503542f3cf"
+SRC_URI[sha256sum] = "b55c239f3ae7e23c5c8434f38901c5bcacb6afd17e88e37934b46e44558df295"
 
 inherit pypi setuptools3
 
-- 
2.39.2


