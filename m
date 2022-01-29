Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD5CC433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 00:59:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.660.1643417962582839603
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 16:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UyqJbamR;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id k17so7766532plk.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 16:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJB6iv8zk6YQJUH8NGgmkGs6UUD5tdIITy1j5V4QKiw=;
        b=UyqJbamREfaSkln0d6W4E2c6s4RirC8kA0IhRogPHrlvVoxvUJmVF4VjaUyn//AMSi
         ipR8clvQrIpzG0UpypLCPDN8yioFlYnvoLWwzkTY8NtwUdwdEFJnOj16CSf+tu94vnmr
         kqkRwSK7MhshAMGEpAX5Je6GLhpvHpauV30EDNe2pvs9K6L3dzMu41bWAPBh2mdePrPN
         YlnmNRrIezzFbSbZLHbzBzzAuRAUW7AqsMMPpabTVk8GSt16QhzQFQpaR4ojthslHqsB
         7WRIE3rbzEYJu86pB334lN4WXYfyd7/+oV+a/wDTnngx6+CjfQ44flYgjvLjoUBq1z8d
         6/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJB6iv8zk6YQJUH8NGgmkGs6UUD5tdIITy1j5V4QKiw=;
        b=4WkqfqULTcMC5bzarFhXP7EQDEaVeQ2w/8uUpWXM+Ipy8IPm7gsTJh1Ynf5OK8eEDu
         WmpMATt+snQ7l68WwZaOFuGF5MNvhe/9Th4Gey2jXNgxb2TRkck+42eDq5TyOGEABxMf
         poXZimfp+qchC2PbVYsXOPNVRgNBun3eCZLMbQ0ONBD8zO7rYOEI+3cI86wJgMUcQfqt
         NTkbc16L0waCKXJW8T/UvXoUjbC8eDH7dG88abRLujCoQS9nYSUd1Sw2HJpXmuzC6I41
         ePwtHOyyhtz5FegOWA10xJMoat4G6hKmqSUvJ+8YwEJaaSZ8b0OjzHFeAxkwcat4djPA
         wp5g==
X-Gm-Message-State: AOAM531xbH6bfTcnmBuC+H7N+53zpO7fPUQMuAH4emxLa5OioMwiXw/I
	PbHYgbiHzyeX/atfSekpNzOMIkqqherz0g==
X-Google-Smtp-Source: 
 ABdhPJyo7/1wj5lVAmE9i3KsyHjw22FXTIVru4XvCZqxX/+z8+D9sMoaSusVzVJKOki7sPS2eG8iwA==
X-Received: by 2002:a17:90a:7e10:: with SMTP id
 i16mr22502215pjl.188.1643417961919;
        Fri, 28 Jan 2022 16:59:21 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d32b:593f:f15f:8524])
        by smtp.gmail.com with ESMTPSA id
 p21sm10806190pfh.89.2022.01.28.16.59.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 16:59:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH] dbus-cxx: fix fetch error.
Date: Fri, 28 Jan 2022 16:59:20 -0800
Message-Id: <20220129005920.3821924-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 00:59:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95165

Upstream created a branch for the sources for this version.
update accordingly

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
index 79fb2f5100..099564eb34 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf0188f02184e1e84b9586ac53c3f83"
 
 FILEEXTRAPATHS_prepend = "${THISDIR}/files"
-SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=dbus-cxx-0.y;protocol=https"
 SRC_URI += "file://fix_build_musl.patch"
 SRCREV = "ea7f8e361d11dc7d41d9ae2c4128aed2cdadd84e"
 
-- 
2.25.1


