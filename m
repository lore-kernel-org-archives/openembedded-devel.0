Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9E3C54788
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:27 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.1127.1708379299431968709
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bbd6ea06f5so2414930b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379298; x=1708984098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1VavxrAyaipWql3KIUyTubMVi4+o61bFph8jYWN/9k=;
        b=qeQY0fAjq0cEiu7V/ZcYWUjhWSkZusqxs3Mwm645o+yoL309fPbY3xa0uLGHclwope
         8G33mQi/EvjNUaMSWELTBpjIWOhdfpsF+/1SQiDjEFtORsmbOQkgqL7oiHTRJd5Fl9BZ
         jQt/SiyNQmJZmVMppGXIFkcoWFMHJJrMuGwV80zEiy/IsyaeCMUbTf7LZuLUNxWOPRpH
         ohMy/7GRYlRgGfqXTv/0tA3ck9BWTa6FpkeBJZgx+ceYeHH0n8QFXMyhDHAwhuZnIHjs
         jR25e+dYXi/ASVKvgcvza/Hots/pSkbv/Xpl3yC/f0biVq/8bfW+BccuRJ9VsNprCbqx
         Ulng==
X-Gm-Message-State: AOJu0Yzs+t0x6jdy0AoFrrk4s8mOAB903PYNwIYCfmfP+wf5ai/Kk6Nz
	kaNnknvRu55uaqsKVFNpN3Hw1QQsK1Y3VB2WZ+4eSnA/ovvfTn2L5Sa8qworo1g=
X-Google-Smtp-Source: AGHT+IEd1OdUH6QjPojWwxEnJh5mUqAAgZEGuDDmAB2QhXeOPH6EPvzMjQ3ZBY+lIVqaU+Pnn4Rfnw==
X-Received: by 2002:a05:6808:10ca:b0:3c1:348b:d762 with SMTP id s10-20020a05680810ca00b003c1348bd762mr6254810ois.16.1708379298355;
        Mon, 19 Feb 2024 13:48:18 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 5/8] python3-jdcal: re-add functional ptests
Date: Mon, 19 Feb 2024 21:47:58 +0000
Message-Id: <20240219214801.1514843-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219214801.1514843-1-derek@asterius.io>
References: <20240219214801.1514843-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108890

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ea6284264..7fa96a495 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-intervals \
     python3-ipy \
     python3-iso3166 \
+    python3-jdcal \
     python3-jsmin \
     python3-msgpack \
     python3-multidict \
@@ -75,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-gpiod \
     python3-gunicorn \
     python3-inotify \
-    python3-jdcal \
     python3-license-expression \
     python3-ordered-set \
     python3-pillow \
-- 
2.34.1


