Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D13D3E18E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.30105.1729278834370021961
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RlIza9DY;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e3cdbc25a0so28331457b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278833; x=1729883633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8o3Vsug2zn0pgv4jVZJqkKhehBeCc2PpQi/JnR06d4=;
        b=RlIza9DYPjLFh1Jv9ZlTehqPka0f2QFiXNTqaqv0tvMiAFhHKJev2W8JAbkFuLFzbd
         Nb/J577qSIxGv3zPyMhkm84js/lcRM5Md6vh/g88JGeDQMuGLOADAL4RluWxb3wpiUt6
         RUrZg00Y3JbjnZjatn7k6dBYSIW3D6wyn4VK0FKKSOM9X/QpluEbq+RaPKkRc2xH5Fi+
         HyzyplqWCD9XR406GDtPlKwqMQD1i6RfNrm+Bm/WCU8rmvwKsmhz+sAjcwRTrmE8Q5ro
         WsPw74uGSuxvM0tlnUsSLhvUM8zoxB1y9arLsO+lyzrOOUGcP0HJURV6qLHSrD2Jb71U
         t4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278833; x=1729883633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8o3Vsug2zn0pgv4jVZJqkKhehBeCc2PpQi/JnR06d4=;
        b=MwO6HMECmsVksYh3ZqPEV+yjE5OMjgaze9RPB3Wzc3vYdb3BhNGXU2ymBBfRxuU3s9
         BiM5yi+a6pkVtVBCoEBNuTw2udeTfjp047MnigsPNGNrVeYkALima9D5QtleRTY6DFoW
         7yuPjHA0N+9Tdd1amDq8wJ5IVbM5OtvXL6nsq5NzPgotuBblMtQqtDMnx9p9BqN8q7oy
         nymIODy247po38oYuD3pZuG90J7d6rucTG3cKo+VQu8p8U3RIHlZnsi8FywiRzS5I8NF
         Dyq9RQyxVYfqBy12CmkqenfoDXs/232ZfjFObRJYtmCWxBxRDT6Cb28Fb+Dkpno0/xIX
         k8TA==
X-Gm-Message-State: AOJu0Yxpk3YplF9dUNF4K5l/5Xa0mxL6emI4h16c649rCViJHW36cpEe
	VGnsshU6fi9rpNAhZza9ffJ0cxXD5EKOV6sQkIJbJlf529B6p1hipAUo0g==
X-Google-Smtp-Source: AGHT+IGJaW3EJFKvjFUQFgiLi9MeHoZRQeZWIqHEXhFr+fHvkKJBVilxghLD/ljIYEe/D1BhbZg9hA==
X-Received: by 2002:a05:690c:250b:b0:6e3:d31:cdca with SMTP id 00721157ae682-6e5bfcaff1bmr28721937b3.19.1729278832992;
        Fri, 18 Oct 2024 12:13:52 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:52 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 65/68] python3-visitor: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:52 -0400
Message-ID: <20241018191101.25184-66-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113052

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb b/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
index ac3a90efb..92a19a2d1 100644
--- a/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
@@ -2,7 +2,6 @@ SUMMARY = "A tiny pythonic visitor implementation."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "94a024ed0ec1b02b4497c15267d319ca"
 SRC_URI[sha256sum] = "2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a"
 
 inherit pypi setuptools3
-- 
2.43.0


