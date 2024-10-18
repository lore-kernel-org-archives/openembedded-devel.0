Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A55D3E1A5
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.30071.1729278794681911205
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kxa9PbBm;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e29327636f3so2384728276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278793; x=1729883593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPJ/NBc3Q4Ks/Kl+gQ3NHK7BDz5yiF/nxgsTYfAOerY=;
        b=Kxa9PbBm7Zy1j7id7mvoaL5Lcow4SS5t+W7zQ18KANi0lhhb1BNMYI9+hotNpAHc8v
         qaFcMq4nnjQWQQNfkjU9aGLOlt2ng5g8qy8/g1TlCvPwupr2DL2uJmQQZ/aPtB8pSMgy
         1kXUqHBHmDjtKi/38J8tKXz5Xv9K0gfK0+ol97Tr0AycAAd7unVIbbw/I/aAGOqeKVDh
         eFCWvrQVoACZoDJHaFP76YPYvC7+SPltY5O+awcyXs10l/WDZUblZKk7dSE/2w20Q35M
         5nMvWR1AMYele3b9esMMZHpVqBNtuYdpLKlAn39YADCdnQ6xj23d9C8CRfJTBY2kYqIE
         WimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278793; x=1729883593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPJ/NBc3Q4Ks/Kl+gQ3NHK7BDz5yiF/nxgsTYfAOerY=;
        b=tYF5D0d8/0Vth2ty3/RAOwS+X6p2NIJVIOZM4wuF4wpf6TEJkx97gXyILwyvDoNPh8
         gRdMfd9YytJX3BI0Jw/LQWoPp0YBB97lo+XDDXTPZRIUwvewlXoXTogrMASVYHpSQx/f
         j303vl8gGClLzYM1PHggf3FMb5xXYdXi6twIIDYAdeddwfSC8uF9PuTCxm7DvSbwfNuf
         Dd7HPLXOuIQXeVGrrlJbWxntU5K0H5knPv8ns5W7mWPzSiM+ecw5tjj85l0YNcHKeRlg
         ooHjC6ymYKn1ZuXWmehC0P/zuT4iQJxpa39S8VrmmwPj89I2mI4z0a0Noqn6SiW2OzVH
         LoSg==
X-Gm-Message-State: AOJu0YwEdNtM5o8t5zesRYecZaUi5id/1A0k0nbkxgmIX+khss0r1BqB
	wMtf2qK7nAiDMlNu7JrEigaZVIujuhXQBMNPOkEdLqlamc0pmCsQOsmzjw==
X-Google-Smtp-Source: AGHT+IH7u3YPEaYh8kIqrF09YS8CJfS8lx9TioVJJK0mZcR0joHGLZJY7BerhuUZVFb/dp1bg2whXQ==
X-Received: by 2002:a05:690c:6688:b0:6e3:182f:f974 with SMTP id 00721157ae682-6e5bff1b341mr33537047b3.45.1729278793145;
        Fri, 18 Oct 2024 12:13:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:13 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 04/68] telepathy-python3: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:51 -0400
Message-ID: <20241018191101.25184-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112991

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index 23c216504..b2b4695d2 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -16,7 +16,6 @@ S = "${WORKDIR}/telepathy-python-${PV}"
 
 inherit autotools python3native
 
-SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
 SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
 
 FILES:${PN} += "\
-- 
2.43.0


