Return-Path: <ed@tanous.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36019C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 20:09:23 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.1519.1638994161874537700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 12:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tanous-net.20210112.gappssmtp.com header.s=20210112
 header.b=cNPpbDe5;
 spf=none, err=permanent DNS error (domain: tanous.net, ip: 209.85.215.169,
 mailfrom: ed@tanous.net)
Received: by mail-pg1-f169.google.com with SMTP id f125so3057364pgc.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jm8ImUXrHRIlkc8wF1n4fap2zbjh6I+TZKnmYF6+D5w=;
        b=cNPpbDe5LHUNYrJKmn1+wrELEWQVOC0MHSnH4r45eDzJgYKn4lbTXU7RDBwYReU0nW
         tk/f6/bRYEHHLjQgNApimkIEdD6F4XJ/RYOdEPz+QTMILoZxpL5FOSatTLOn3QeoSCjJ
         +/zlCQ6zG3WvO8u810LF/zh2J2xQhCr8JKzIIgC0cOhUWcVNC1yXbwBLfm3hm58z6jmk
         9GiSa/DPuQ656ii5jTcZhHAQIFE9bjtjzLQ1gqYjknsoOqRvaHxvopptJqemql28QqUV
         xshhFR6mrloIcxiKXnJ424S2CyjdZ0E5t5PzJzc5Pu0yOsczlnuf/x9u9lIv9hNptkoG
         PqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jm8ImUXrHRIlkc8wF1n4fap2zbjh6I+TZKnmYF6+D5w=;
        b=MttNp4OJbQl3E+nFbpyMihyGC20K+kSCiPTUOWy1SOYjgY4ERpbfkUoDO0oIKG57SJ
         HZLvwzOg6WvPtrKUe795xm6lMHvToocNA5AZEdRZ9NpcrxkNUcBYn/ZvkWfgPgEGEHbm
         gaW18mRVZopVgRNGtfYuDFBI1lvs6JXa2sSLG/HdzALWu72y3ObwiFJOPlnnOhYz1hDv
         Le5Zh1wNpwyabw6MINKEvBEFBDDYT2jG+zTW+khous/FVCudmpEp9JBCOVRvAO+jVhpT
         pWOoGcm01yKt54uMqs2Clu9cmeMZMjywn8iMZdakE+glKNdNJZNP1U7ftBwBGW0ypROY
         Rwqg==
X-Gm-Message-State: AOAM531nZOSusqdjxrSh+iKhtJ4nSzJuoBaKd8Sm1XQ6jJ6CxGv8U290
	FjT/7t0tQV5loLr9WIwH/J9WlMoEnIF2LA==
X-Google-Smtp-Source: 
 ABdhPJyMYbCclwWO52VaRn/PRXS6LFx+eFxopR7iDTdF4hyZRDWDYaWs1jKMJLvWzqLAfxSBHhfspA==
X-Received: by 2002:a63:da17:: with SMTP id c23mr30472714pgh.44.1638994160581;
        Wed, 08 Dec 2021 12:09:20 -0800 (PST)
Received: from edtanous.svl.corp.google.com
 ([2620:15c:2c5:13:bf70:66eb:c72a:7d14])
        by smtp.gmail.com with ESMTPSA id
 z93sm3617909pjj.7.2021.12.08.12.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 12:09:20 -0800 (PST)
From: ed@tanous.net
To: openembedded-devel@lists.openembedded.org
Cc: Ed Tanous <ed@tanous.net>
Subject: [meta-oe][PATCH] Update to new version of boost-uri
Date: Wed,  8 Dec 2021 12:08:42 -0800
Message-Id: <20211208200842.1621643-1-ed@tanous.net>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 20:09:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94256

From: Ed Tanous <ed@tanous.net>

The newest version of boost-uri has several new features, and has
compatibility with boost 1.78.

Signed-off-by: Ed Tanous <ed@tanous.net>
---
 meta-oe/recipes-devtools/boost-url/boost-url_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
index 0e6461589..14da3ca3f 100644
--- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
+++ b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/CPPAlliance/url.git;branch=develop;protocol=https"
 
-SRCREV = "4f712ed69a04a344957d22efa5dc111b415b3aff"
+SRCREV = "d740a92d38e3a8f4d5b2153f53b82f1c98e312ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1.400.ga245620fadb-goog


