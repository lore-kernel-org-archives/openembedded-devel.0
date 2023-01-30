Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2071C636D0
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:15 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.34383.1675055355467799359
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SM/hDKer;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so3381076pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/wU8jF1WCWEmIEFmCPbsXpvLnkBzTuVL7rpfqM8M7s=;
        b=SM/hDKerlw5gW/dM/55ITzQwwyk0HpYN0DyJpN0ZJeglGLnGGeKBSbE2vwl4jq680k
         X8fRPn9wK1L8plLP1KvZjFl9Bj3hEKe3bi0EuWv0ZkNF5KRjDtX/6t1YvJUNBT0cab+q
         0nDiOVgzPcjYjht1jtCt23bYTc9p1lVrTXuvLlh+wZOb4XcyUeZfPDt6aLau79VAy19M
         CSDZc6rOEA9yTs0dL+y1pLKccL0szxe5HgN5Fg63n/3AIkG8AFmsJLl1Fnbfcxbi1XdM
         efcZmaADUtDqgQ1wLymUm1rzTqUS+cEg7jnmm5Z+hagwFhQ4ULrQCexDL6wMT5Xpbwf5
         thkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/wU8jF1WCWEmIEFmCPbsXpvLnkBzTuVL7rpfqM8M7s=;
        b=Zo8BfUaIPQfw1gKvMpsavsDILmN7komV1MZQU6hgI98hdNu4gFkgVawmjw6xnwjnvi
         NGI/By/rWYAUrL8xg7JGsnSaXZ5wEB834QVNe4FSxcTmYctwIDaT6onqGZtDgcWaRb/F
         YQkHWrjouekvq0JSEgt+76eREQ5+QGInQ0ei3DC4UiSnsQtywtXGImII9OwdMGeIIMBJ
         C46q8xTVIG8kStb7bGUA8OgxmqQ4ZD5TpG0/is8cTkO0tvbwNXmX+zCCTP1bN3TNwXzG
         dDLG0vsXcPm+g67JG1wE3wJwtFLs1gfOJyiv0V1/7N6mvVUay2mzluw7HXSQwxQKMU9e
         lrPg==
X-Gm-Message-State: AO0yUKVusNtQpVkCxo50708Skd+jLwafgL4U5WDYA+U3Rt2sxJ57Rjkn
	sLkM9TyFaE8yIgHpWk3ju/bbHQ9Ui6GQZg==
X-Google-Smtp-Source: AK7set+bKmRsfe7OMZqFtAQOU/Vh42fQCpih4X+HxVIjlhUrCXGDPpRt0E964eGG9LkFzHLa4e13Kg==
X-Received: by 2002:a17:903:1384:b0:196:790a:8bae with SMTP id jx4-20020a170903138400b00196790a8baemr3845372plb.43.1675055354677;
        Sun, 29 Jan 2023 21:09:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/12] hplip: Inherit python3targetconfig
Date: Sun, 29 Jan 2023 21:09:01 -0800
Message-Id: <20230130050909.133727-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100848

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
index 3abecc3054..a415ebc1e8 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "python3 python3-native"
 RDEPENDS:${PN} = "python3 python3-modules"
 
-inherit python3native
+inherit python3native python3targetconfig
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
 SRC_URI[sha256sum] = "86f98645e4565a9256991dcde22b77b8e7d22ca6fbb60c1f4cdbd8469a38cc1f"
-- 
2.39.1


