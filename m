Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5972CC433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:28:10 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.7649.1642256889622296623
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l5bNnI0q;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so25103481pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ckfqGzFehkf/RVhCSZaVYl2DPkFK5MTIoXLjWR7DOcY=;
        b=l5bNnI0qI5ZIWsz3H2/YbirEqn4SsyZUHLZy6JRDHk2v0T/y+lrZu80sC3oL0UB3mf
         iD2rr0DLcHdSsn406KWOqCafJ5HvVu5hLsnEPDponI6KE1JpjjVBvUdkDucIsxTcnsXo
         2Dzo1kUB1XcfxQTKffLeJNp53VzBOTFUdSc6+WU5NpXWYGpFmO/jESivkHWg/+rtv/Vk
         jZex/YbdadNRNIfAy1NTHsSgnbvspCDheRFQgqN7YdzRn/VTKUvQ0PJjJYuyG35cvPeT
         1skMJEBksm2TAdh2m3i4GgBptr56RzVV500lVO+zrwYBXqsFb0oOV5OXhedcnoCN+G/0
         FTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckfqGzFehkf/RVhCSZaVYl2DPkFK5MTIoXLjWR7DOcY=;
        b=qWZqNN+lp32U43j0YW1Ufn7HKc80uALaw4lz66nJqL9cv14zaYft0mRCi1QGcmzXll
         RHQMrU0GSqdNhUn0+k+xjCiw/ARRb2EvQEcdbyLKv5fmS4E1Vkm9xATsdqjamr9wCJbw
         S8KnLLRJUzPeh1hWSGRZ+OWYDTv49SPjlA7JXlLLhG+iSnSsAVG4fjhIYxaVwenkSSwB
         TkyNJn2lSnJA4NFTBu2Bxv/mUvQ1YIO7rxIBni5xoDx4Wp/QqXJKEfgEuJHEYhFeCj8H
         tGTmJydjxqbmQCt6Ck3U5yd45q1s9gU8ASn9H6pV8qsLlnBtV+ptvmMurywgYWVRt2dF
         gmlw==
X-Gm-Message-State: AOAM533vrvFQKOkAo9PJbOEf3Ct3EkzTY0DmzWHAsVpcIJrTM6oy3nOv
	ng9sYTpXcvwIbytHdL8KX7cHd47ru9m7gA==
X-Google-Smtp-Source: 
 ABdhPJzFGMnRAQcReSqDtp59dB10U5Y/Z73pIJTCLi8rNj5viZLvzBSWPz+R9Ln4VDdiafGSQKC78A==
X-Received: by 2002:a17:90b:4a8c:: with SMTP id
 lp12mr802194pjb.65.1642256888908;
        Sat, 15 Jan 2022 06:28:08 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.28.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:28:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/11] udisks2: upgrade from 2.9.2 to 2.9.4
Date: Sat, 15 Jan 2022 06:27:54 -0800
Message-Id: 
 <f48ecaa7057e61f6825005b783db2e04dd6400f1.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:28:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94870

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade udisks2 from 2.9.2 to 2.9.4. This upgrade will solves
CVE-2021-3802.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb} (89%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
similarity index 89%
rename from meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
index 4c64f91a9e..a25860fd92 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
@@ -17,8 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 RDEPENDS_${PN} = "acl"
 
-SRC_URI = "git://github.com/storaged-project/udisks.git;branch=master;protocol=https"
-SRCREV = "da6d9480fefeb0ffdf8a84626b5096827d8d7030"
+SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch;protocol=https"
+SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.25.1


