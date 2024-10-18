Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48127D3E18D
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.29954.1729278800876148236
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=alDSjcJl;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e39bf12830so17424117b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278800; x=1729883600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkN/ZRr3yj5cUX1o+ylRIxcs+bP+kGnufLmOp/hCvd0=;
        b=alDSjcJlN/L4IBacrNfb2hQEHpCGpjpFoaAqonCNjQymxbkxL8vfHq1JuMSbLQ0qb5
         OikcrTpenBGbwZEiZ3SKgG0+U8Dr/USbDxtpIgLKDGjBwLeMLQImkJljcD1/u05rQFLm
         Q1NqE2wHdRnxtGiiVifsgHGj8UgTIs41buq2ycBgSUWiDvfJH5vCaJRFPHkM7WmpBOms
         a0pH6jqGyfZ80vzdz4f3gZdClifSlvgZrjc4AWXD2d6lpocQ75R4bzG3L8EMDGjATa2z
         xtgcD+ZSD1irUn7q3Rbm+FswRSkNPOroGJ1XpY+JYLy14rn5u1z7oV7My/yHaJpVSfdd
         s6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278800; x=1729883600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkN/ZRr3yj5cUX1o+ylRIxcs+bP+kGnufLmOp/hCvd0=;
        b=NQHhAifrCRG3bWmue2+uYCxYY76SEVeQMyE1V04nRUPJnHgRpapW3T7O1mfpYfEwhk
         oZMZM3HN3FEvMNLCS1zZnx/5k3kqxsstVhboNeR0mUUJ3DGbr7NTHrH0dMRXsTu4n55E
         L28imqb2NKS8qAuNQoT0xwQ6ms/2ds29ialZKyXKOor1WsGGZQN+XIFoe5J4WCKxF7JA
         qiijfn2uMr3yg0FZytqFY2m0qlxktyp3BjTVLgovYzOnX5xoGiSXUkakWSFYzaC5gjXV
         2tgdBp1FnAiKRPp0rC4P82GgIHPBmXYC9w0OMwjAUb6exhph+VS9ZY3KXYMG2zGR/DxP
         6qxA==
X-Gm-Message-State: AOJu0YyRNeBc/5DKo23SA9Zwnq+0MNNwQbBmUGL5m+HYnECl7XlsxDdI
	h5K1nMH/UnCTaFaFv4yZERrEUHeKLy/QPNkchqF/Nz1vuVQdW/8sWQhyRw==
X-Google-Smtp-Source: AGHT+IGe5PtmurSjsxJz4OtXU6Q9jIYZLKUgKl0bWzh2nVndoinePVrXO4q9n7z6+k+QWjj/xjb4nw==
X-Received: by 2002:a05:690c:9985:b0:6e3:c92c:1d57 with SMTP id 00721157ae682-6e5a3d2d8c6mr69926857b3.2.1729278799310;
        Fri, 18 Oct 2024 12:13:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 13/68] python3-asyncio-glib: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:00 -0400
Message-ID: <20241018191101.25184-14-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113000

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
index 01dfe5154..d73e83de5 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
@@ -6,7 +6,6 @@ inherit setuptools3 pypi features_check
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-SRC_URI[md5sum] = "60153055e76ceaacdfbaeafb03d61dd9"
 SRC_URI[sha256sum] = "fe3ceb2ba5f541330c07ca1bd7ae792468d625bad1acf5354a3a7a0b9fd87521"
 
 RDEPENDS:${PN} += "python3-asyncio python3-pygobject"
-- 
2.43.0


