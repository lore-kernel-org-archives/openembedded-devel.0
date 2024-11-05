Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33269D40D04
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.31231.1730840605660202109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZPHwCJk;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e30cef4ac5dso5374279276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840605; x=1731445405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAXMk7buhpQizAMVLVk5x8qXom5SnhnoJ4qX0J5usBA=;
        b=eZPHwCJk40l3Pf0QOZP+LvG8rDUdh4Y9xEzFuEhYN32ssR742br2jvDzHisACSMcf7
         PZaW3ZKz4NXCOW3jY/zR1HrgrxgX0h4/vb19xGT9fpBY3l9ixKv7rfRXKZ6TIfcJdkNz
         tK+NTTlSj91yNXCQsEPOxp+oaKuMiYndSw9txaKDq2EXB35MCp6xucbU49q+/J5CMawM
         7fVB0nHYfl9Le4//+XlUdC5me6BLUoVbDrOA47vGVGF5GzGgKK17kKjP6DnqtnjKUmxt
         Vcs15kRCdrSzApStIy5u+mApy3fENqfiAmfYPzAV0/hcNpP//nXykaiTecjZm7LKurmZ
         MPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840605; x=1731445405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAXMk7buhpQizAMVLVk5x8qXom5SnhnoJ4qX0J5usBA=;
        b=NM0YRCofV4L2Tu++ESK15CUKDOg7kD28C2ooHbSdho/HrUYCZ0rl1zKGsqKJT0DTzo
         DkdyuA0t687GVZjtPxNZG9u05jeHz1tjlWVymcY5WnAwdzHHJx+m4pI48JICogDrS5ye
         CcIHSoIfVbR17dxYNbSttF39AWz/pBu4kFUe1qFJKJX7Z6Zt0IgUCaYAel68Hp8RYlUu
         qgzbhPufucGN72bfEPgry6yB/Bsi7wozJLp+/4mxuOViyn5yNJHg4yL5EZCT/QCHhsIl
         UisikUzLQFSUXHCQvxXqarBkSRRmOFF4r3Hnx9LTP2oH9XrxUkZbQk1STY/j/Jryu0xn
         BSag==
X-Gm-Message-State: AOJu0YyEqUfw9LjwG8XB9EqWyLMcL8UjR8n5ajzpxmKxs02wvV7Thsza
	kMWgXKKYEh01M7AsRMdYcOjsz3ZFGVDIObGC2BhIKJ43NeW7SaiUXvIZ/SSO
X-Google-Smtp-Source: AGHT+IEmoqeITHWuR1HjEgFgH5IDcGzuEskZsoWe58Iu3EiF1cMJY0yUhVSddB5B5Oo7qPq7DNJ8Gw==
X-Received: by 2002:a05:690c:3513:b0:6af:6762:eba1 with SMTP id 00721157ae682-6ea3b8ad20emr253115537b3.20.1730840604327;
        Tue, 05 Nov 2024 13:03:24 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:03:24 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 160/161] cunit: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:06 -0500
Message-ID: <20241105204707.4155-160-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113676

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index 252ef60de..b68f0edb3 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -10,7 +10,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
            file://fixup-install-docdir.patch \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
 SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cunit/files/releases"
-- 
2.43.0


