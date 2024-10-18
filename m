Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5E3D2F7E7
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 16:25:20 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.26411.1729268715780079036
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 09:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IK97Vdwg;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so1603484b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729268715; x=1729873515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64QWkqoTLuKEGgtdau+mv4IP8nHhp8HDV4+RxamGJ1g=;
        b=IK97VdwgRKDeuGlN/MqZ+oNOLAJ7EQIdy4fCc1NnW4pyHv8Ez/n4TkURpdTLEPg+qU
         D2V4M1AOwmfco/OX+1GFa5nZ0us7JlP8Nu0FhL4q0h1ZecGUWYKiw3Cj35qwGdZ+KwOZ
         t0OXYoMyQPArPdoCU5QtZAl9bTmMm/nn+2AFyiM4c9Sc5AQiNueCyV7ObIHSSeZ5y2Mh
         Mu9dmlnWswU0Ttlq314DYGCI9Dtiwnarnsnu58sqWcMqyXmJCNNaua4Hi6R2tWkj8Unc
         B7SqcQoUVql8pdktrsJdgPQc9Z0HHbB1DXR9vE4da2j8Dd8ArUBWmasjoySM8PBoK1Y6
         GR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729268715; x=1729873515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64QWkqoTLuKEGgtdau+mv4IP8nHhp8HDV4+RxamGJ1g=;
        b=t3Ijs5tfsHz4un+YieCstOcgn6kqcUrO7EYOU9wBg9zoZrH3XTlbQ/JFnn4PugSJKY
         LbAO4dGZSsQKcjKbFA1no/+DkTc3aekOOxOMxAmtjC7sI7+ZlDbxYcf2vv8vwDpCRMD0
         4BgRwCSwPa5qZ/gFBvxWy8awnMAgJzyn0Gu0LMyKkjdLpMCtXaz+I1w2irFYtsTtD+Ca
         u4YbZJykcBq0+DwLISIIL5eng+BztOLxfwnGOFfNcqLO0Vk8Gm5T68C4hlgK9t4MVGOF
         7akMLe531Y2OHmQ+KcBnnhsjjUs7PWlv2XCU0+RfJXyf3KUh97wIOHhwugVel0/4sxJr
         L5sA==
X-Gm-Message-State: AOJu0Yw+SrwKM6ROXV0rea2x6mJ/sydj8VYFfNmfrjeSaYfUBHQJAD7B
	v6vcSXiXS6bzMZxKLxNQYA3LGM4CtMrHaJbx2OK8tZXgDFYTLgowaL53wQg2
X-Google-Smtp-Source: AGHT+IEo6o/Q2hHWXl7WXHXwJrENxxnu1D8OrfOqW8tP/b+xfycO3dyNV5uilkInx7ZbZrmnDOCrtA==
X-Received: by 2002:a05:6a00:2353:b0:71e:573f:5673 with SMTP id d2e1a72fcca58-71ea32d395amr4495153b3a.15.1729268714917;
        Fri, 18 Oct 2024 09:25:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6310])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea345acfesm1639286b3a.152.2024.10.18.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:25:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jiaying Song <jiaying.song.cn@windriver.com>
Subject: [meta-oe][PATCH] xmlsec1: Switch SRC_URI to use github release
Date: Fri, 18 Oct 2024 09:25:12 -0700
Message-ID: <20241018162512.3304078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 16:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112985

This ensures that we do not have to do the toggling from
releases to old-release in LTS release branches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
index 994adef3af..50c387d250 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 
 SECTION = "libs"
 
-SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
+SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PR}/${BP}.tar.gz \
            file://fix-ltmain.sh.patch \
            file://change-finding-path-of-nss.patch \
            file://makefile-ptest.patch \

