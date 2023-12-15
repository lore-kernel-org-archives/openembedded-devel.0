Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100C6C46CC5
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.58180.1702626768486140707
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cuusxiao;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso4447375e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626767; x=1703231567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBZt3nP58UYnVCElJSYVWbd6e2WDwBHGpwM6hdLUYmU=;
        b=cuusxiaoBeAqc+AEFTB1XdXIWa41S3yHTkSPOJlvapNOuJZgwJe6ncwqSb9nHJgg06
         2/pTYqoh08Ais90EFdnnkAlCxxtGkcX0oR5EyweBTLRDh4rrt7PeGe9dwaIHMhoP37jn
         oFB5PAcIFFu7XaQ3uKVqB1DF0XReJHZqCNT14CNSLjVO5QmvXLCqF9rvNSfyvnSB4Buc
         p+vgbMqqNU8++LYbnUpX7ieMTRwSU/0rR8qKZNdUHVxlh8X6oGeu5RKP4SMfOTaBLJ04
         l+HpNz9NJYv1yGyyJSTFhDIfuFmUnpHZC1bMuc9QAI0qPWSVNrNy3b+uibBsLHEIyLU9
         NTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626767; x=1703231567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBZt3nP58UYnVCElJSYVWbd6e2WDwBHGpwM6hdLUYmU=;
        b=basgolHckfQIJ2Ks0ZqO5TdnYsdIEOYeabAA1L4/JwVByZ2IWzkEcU1VYZFNLWPgo0
         W4bLkasz9N7zLhoI+DqkSNnazMWrTx99YgEXpdtd120I7mNqSVea7lHDTUgogaHYkQDd
         inLiS4LHBjxOFLUn1a4y6ddVCI4/pmA+cAmb0KY6pTGDyo/AgYNhYY0sn3ytK6maqVdp
         mmV560+ZcQ9S1Lw5tr5a4s93mL3ofrBfPeCG3Np8lB23tioad7i+rN5U5eghexxM/bdQ
         XR0OUTiKhe+29hANEvbKMWL6pXYuy/PNwzCMwIg13nBJ6as962CSXEBRPuZQyEfSjL+z
         b7TQ==
X-Gm-Message-State: AOJu0YwrrB4qwy2ykm4tjMiFrmSUI7SwaYpl9TK3Kpp61uHe3iIx8uMs
	fFcaGWUJygY8cxnvTbWno3QUw+jnqok=
X-Google-Smtp-Source: AGHT+IGYhCOFXMGc5nyywksUFqVSJt8ZdoVubntxudStO2Yk9PWwqcfvaMFr6GZYP65sZ3yLTstegA==
X-Received: by 2002:a05:600c:294b:b0:40c:6161:6804 with SMTP id n11-20020a05600c294b00b0040c61616804mr1221158wmd.44.1702626766900;
        Thu, 14 Dec 2023 23:52:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/20] python3-meld3: do not rely on smtpd module
Date: Fri, 15 Dec 2023 08:52:22 +0100
Message-Id: <20231215075239.3049865-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107496

It's not mentioned anywhere in source code, and python 3.12
has removed it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
index 1be3fa5ad..7ebf9f141 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
@@ -15,6 +15,5 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     python3-cgitb \
-    python3-smtpd \
     python3-xml \
 "
-- 
2.39.2


