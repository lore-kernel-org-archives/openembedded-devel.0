Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EC5C5479D
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 01:37:30 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.11577.1673055449463378215
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 17:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F0BT7kL+;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so7001880pjk.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 17:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ss7roi24uwGRcTjc/vT/2kuj9pH4s3ERT6O54algho=;
        b=F0BT7kL+JqZwVAZhHymkMKE1RwcK+fDMaE+5SrfZJLz6WpgaL2qDOztVkpDaEpK6pq
         kSbexNrP7SJ0uFSQOzFBDhY1vY4+J0aUajtk1NX8vonfsGT9VKirNntpYD63Nf4OpPRS
         6uDt8w18Rpad9liVuvCPbg0WzHTX46ST00pQUuJjdXRtSC+OrPO2/C2TCQMJnQBTseJX
         zxvmup3um/uLyRuXa35VA9xHAqQSBwaECTdQaIMsiVZMdNdcYrNz7h4pz+0T/hz0Kn79
         ouiuJLVj1Kk8NaCEGKDC5sBMjPyOpBk4GQf43q+eoYxLVcz/6ffeDEnEbJqOOYbJseda
         f96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ss7roi24uwGRcTjc/vT/2kuj9pH4s3ERT6O54algho=;
        b=ksyWwKRS5SWAHdpCXEyEOnI5AMcHVHQuh8oCv+pOKWKkl01Q7YN5jwVOoF5Ga7cm1e
         /0xh2fORLFiQsrMm6wgw/ZDaCpZz8C6J/6I8rSsvXg6C6ovxENh9fIAl5WKpxFRdaYLk
         lEeHG9pVltdzCHpzlHmi3ZtS+91cNezPOPyr6hfpcnoXHj0zNUCZvbrBdkKG5RYqx2No
         rYZkxGB55MjmzW13uydih5OWtDEEpAQkc8qJGoyzEMwNBG8cP4bviS+Cgf5mmQjntJeo
         8ngyMZV8X88cJ3jpv6Y0fG9G3nYPwuWE3q1kbuUAcNT45dDpgr1UkMLUn7SZSJPBVBIu
         svkA==
X-Gm-Message-State: AFqh2koYtf4F1zU/iCINuwUqy2btnXkYYpQspDVhP/nqxQXi+AxEjjL/
	QntZPrv2d/hrXg38snPCUPPdwyzio8NPPg==
X-Google-Smtp-Source: AMrXdXt93FdRFhsfiASvDVTrLCnHyiL1PAPJ/fBch/IuihM2dWj/jZnJ6rNbwPdizjj7LAhtTzFSmQ==
X-Received: by 2002:a17:903:4c1:b0:192:f5a8:3090 with SMTP id jm1-20020a17090304c100b00192f5a83090mr9972215plb.16.1673055448532;
        Fri, 06 Jan 2023 17:37:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090311ce00b00189c536c72asm1545816plh.148.2023.01.06.17.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 17:37:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libtraceevent: Move plugins into package of its own
Date: Fri,  6 Jan 2023 17:37:25 -0800
Message-Id: <20230107013726.1315822-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 01:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100427

From Peter Bergin <peter@berginkonsult.se>
see https://github.com/openembedded/meta-openembedded/pull/632/commits/cf672ba52f8c4d983ad9a74b67f226ac753a50f8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
index bae84c7242..cff86722e4 100644
--- a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
+++ b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
@@ -20,4 +20,6 @@ do_install() {
     oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
 }
 
-FILES:${PN} += "${libdir}/traceevent"
+PACKAGES += "${PN}-plugins"
+
+FILES:${PN}-plugins += "${libdir}/traceevent/plugins"
-- 
2.39.0


