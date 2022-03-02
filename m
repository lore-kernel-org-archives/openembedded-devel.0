Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C6BC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:00:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.2329.1646251208774897775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pvTs62s3;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id u1so4477534wrg.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mvvnLn3pT2pL4MJT4T88dFkeGG2YpOvu4qkbb7CVhrw=;
        b=pvTs62s3LOp/GN5Zl0ll8k0wqmFGb3/yaPYj9pZDw14ckSGN/4Z+YB5VIsjrqy3y+k
         U9p8kwWCwFAjmAjp1mF9P5mnOlYqBxJp1z6olNK0TAn38MBZ0IpsdMrkvLOMzY10ZkSc
         QeMA9HuhACGVLK/LbXvIZk8G/+i6sbJ017g+4cZMZECHx7rnxQ2QQ7Nz0WM2VLSAJTx8
         DIM8o9g+xv2+nDtHMPDtsBlFjaEZtF1GdeBJboTQFCpOK5e9o8qsrmiAFaCGYLdmeIBU
         LWgQHO+MiGzbep7K94muRivNLdfCXF2663segcAyDpEgIZ0MGQA0KJgrIh1jHUbGckux
         cO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mvvnLn3pT2pL4MJT4T88dFkeGG2YpOvu4qkbb7CVhrw=;
        b=MpfdT+TmppvTVE1pJ5YOxKx2Ack4KaNuVtAACpye6t95VhMmTskGbE79/P3Yp7lYYC
         Yu9YZU9rJb7mAAcNjn9xY9u4NFovXCX9euKB23y2zsYxg21vHngTiJ4WpRsblVwA7rE7
         jeRNtYwr4ZU7s0W4z6LO09uWDbEwlUuWRVP6SkvvtNlEk2gtcHxDS2+F6sK+rJc0VH7L
         27i8m3d+dIz/1urWk9tDKsLp1d26j/BFxqwv5Z8RitTql/Y65GTJjoGYjfFxTKb0+Zu/
         6T7543fAnv5t5HpJk8WFQhmrZNg+akhf437jQuMqT4JTRIsGY6KQUkmGvowB2dffb3wo
         3DRA==
X-Gm-Message-State: AOAM533SfboDvw44iAbb3tldrsEN907AeTVt/wcmCuVFAtxo4iufwjl0
	1nFR4M3N37W0Pw/DePucU1f4e3NJ5pc=
X-Google-Smtp-Source: 
 ABdhPJxN3QFuo3yyAny31kA6GFqVI82AyKKjdMEiE65uCA8JFem3kg7+KYuixQtGiQXtNHjeRKZCTQ==
X-Received: by 2002:adf:f5c5:0:b0:1ed:bc44:63e4 with SMTP id
 k5-20020adff5c5000000b001edbc4463e4mr24450789wrp.236.1646251207063;
        Wed, 02 Mar 2022 12:00:07 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 q124-20020a1ca782000000b00382b3260778sm4415373wme.3.2022.03.02.12.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:00:06 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH V3 1/2] feat(meta-openembedded): refer to
 nm-1.36 branch
Date: Wed,  2 Mar 2022 20:59:44 +0100
Message-Id: <20220302195945.3818037-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302195945.3818037-1-adrian.freihofer@siemens.com>
References: <20220302195945.3818037-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 20:00:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95706

---
 meta-openembedded | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openembedded b/meta-openembedded
index cf0ed42..36019b4 160000
--- a/meta-openembedded
+++ b/meta-openembedded
@@ -1 +1 @@
-Subproject commit cf0ed4239196a76800f8c2facb5a285409b8147a
+Subproject commit 36019b487d7854d09cdb4d39d5ba7a42725f2372
-- 
2.34.1


