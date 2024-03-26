Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44C3C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:51:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.9185.1711417856659176114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOK5ushw;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0f3052145so154235ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417856; x=1712022656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s94p1Iqx70JcjexFRzMMs2krdNy6WXtqaNOwyCjSOs=;
        b=dOK5ushw9qWq8HFk6jUFl97tGXcwarAd3UuU483FmbratxIC2dit6d0DwHRVKWhUfI
         j0hisg5BZVWk2IG0hvXqpO/bRn0vx6adza5fh48SHNO18IsVNZwjdk/8b5oSK6so/6Cn
         bp3nelmNj+qQYInjAQDTHeWrGLpBv1UbB+hHTtS5vmdRgdwtGuwyJJ2xUSkASMMQBmwB
         RTWG35ux7IKd6prFbmFWfmnDlcR4nxY0xfxoAnOd70kKxCiUyHq7XmAnFF4rYxxLhbwR
         QcSbRVlgltJUuB9LF1CYJ+RQ0loXkC5XMJ38f0IPK6vx+FXEKnJnY0P3iixPXIfb0rDR
         xbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417856; x=1712022656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1s94p1Iqx70JcjexFRzMMs2krdNy6WXtqaNOwyCjSOs=;
        b=UjMnPZZu7f5IUnatwsbvHu5natmyJgFs17suQ7I+E9rg9GWNmJNyYV/McUhxcWgK97
         JXAXLRxINXAbuYvpb/5LiFB5v1nIVsiYbl2QKZcCsdJMcNZCc4l6mULFgw7URT9y6qNE
         vYN3B3O5JAdSTT1+0Lw4Foj5LvwMrQ4VYVAES0LNDchdUkMP5Bndiq5OmWOAekKhyEXT
         hqHHLmeQz+rPkQ37jiUt+TKlLXcBJVloFVOMMlm6cO59rjm8Kl4j8pWLgdVHf629a9K4
         g4YkMuxhOf2Q/Aq7Fahb8ZYbKidnXR9taM4DejWm8kdpySirsV07hau8poilyWHZU1Jx
         WhkQ==
X-Gm-Message-State: AOJu0YxAyOwWtAkazz/qdgQOlJ+B1Z40dfiOe0L45QQTyFGEfHku+2m2
	bgEKMD2otWy/jh+ieXLRoVOIU6xD6gUvENLLJ+KURn3NeEH+naf63ZkPoBmN
X-Google-Smtp-Source: AGHT+IGXdcu0EhI1j3yIUB9LYitq9QgL0ESSxmQ05sWFVyu2thtqWEWuV9XbVLKS21x2Ljyk/Lpj3Q==
X-Received: by 2002:a17:903:41c1:b0:1e0:b699:8da6 with SMTP id u1-20020a17090341c100b001e0b6998da6mr8192840ple.9.1711417855763;
        Mon, 25 Mar 2024 18:50:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/10] fio: Upgrade to 3.36+git
Date: Mon, 25 Mar 2024 18:50:42 -0700
Message-ID: <20240326015047.543274-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109616

Brings needed fixes to build with latest musl as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.32.bb => fio_3.36.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.32.bb => fio_3.36.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.32.bb b/meta-oe/recipes-benchmark/fio/fio_3.36.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.32.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.36.bb
index 90e28340c6..a871ed8fe5 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.32.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.36.bb
@@ -22,7 +22,8 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "db7fc8d864dc4fb607a0379333a0db60431bd649"
+PV .= "+git"
+SRCREV = "b2403d413ee734e8835539319d8bc3429a0777ac"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.44.0


