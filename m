Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D3CC4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.23270.1668873491973601070
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RyT4MHDX;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id d18so1821902qvs.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNdrJS4H3mv6Eozq7xuJOZNIcXjOBh+uZNoSaNMTiaI=;
        b=RyT4MHDXSw0YSInbGK+EqDHIjbGxvQWyxSGUF775t9WzKRDpNfG0uNKzxd90glIuJ7
         eUpJc0fj+nYgZrkRxACmyTuZ741rglQVstKMhO9bIdxIC23d7tLcPK8NPEohEDlTVZpg
         OZq45Hkv1+kBFGHWCT498j4hZzRUIYKs8F4y269lC5NzCpQwtLotlOAhx+CyhGw7lFlE
         PELkCi7cQYmSsy3/BhVmL3SNnU4ub++yup+n7O0VysYOr8kj0i16l9Gq0EH9DUOyJmqD
         xLYTZ8+pCDxrGC+eZJ1HMzp8ZcTP90QqZJvKvEO2GGQ1Kz5YgHBs3p15PQsC+3PX5u01
         SYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNdrJS4H3mv6Eozq7xuJOZNIcXjOBh+uZNoSaNMTiaI=;
        b=vIMz4PmIgOG6B0bJUy9PuvD01sYjmu5z35DZ8j9iy0uk4N42ga4Pr2EftRu4K7h4Tn
         0FhXvBTqjvGGqYYoBn9+Gxk1ny93QXyE0ziPTi1GrjyeklcoukXpffUIAzmyIpPGpVGj
         E2g8X6qlvvMSws5SUJx5neGjeowa5RZUEf+IPtXrIiuqrQ6zDq5pJAB/e6sjABfAcSyy
         xmNtek5jzm/3hTk9zJ0PfDmaJILESsMFRKpkp+gh+zyILXO9yfbpb13/z1iHUIJGVdzw
         oPKm8Eb0eYoDnkTuCc6Vt12FRSf//4CoB4LTl/VHDCNOdAJ59uVKC4/96usFuBHhOTwi
         /TkA==
X-Gm-Message-State: ANoB5pn1sOlnYRjGe7MaG0R9W7QkI+up5wA2mzcGVPc9gXxGz6w4/h+x
	StvHJRblNhZXrfl+ElN8bqPjrfsV4mEt0w==
X-Google-Smtp-Source: AA0mqf4dt2MX8ZAI0mJU6azgarW4UQ1h4OUaIRLKFhUPoMEIIC3IfQddTFFXWEtdpqC6CSTsrA8AwA==
X-Received: by 2002:a05:6214:3688:b0:4bb:9180:638f with SMTP id nl8-20020a056214368800b004bb9180638fmr837565qvb.98.1668873490616;
        Sat, 19 Nov 2022 07:58:10 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 06/35] ctags: upgrade 5.9.20221009.0 -> 5.9.20221016.0
Date: Sat, 19 Nov 2022 10:57:30 -0500
Message-Id: <c4aad13f8a77726f57ffc88cd85834bfca23f93f.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99645

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 443259d5db7959609be2358c2359345039739651)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ctags/{ctags_5.9.20221009.0.bb => ctags_5.9.20221016.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221009.0.bb => ctags_5.9.20221016.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
index 5564a9b853..809f578803 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "5d506a1a3b6850f05de5e785c5d14cfd6f9b1620"
+SRCREV = "a2995833175678358767e1c9a36ad3946667edf1"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


