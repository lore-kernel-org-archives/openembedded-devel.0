Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04881C48297
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 00:59:48 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
 by mx.groups.io with SMTP id smtpd.web11.4584.1707526782842336958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 16:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=LTNnU19l;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.202, mailfrom: 3fsrgzqmkagmxblhpphmf.dpn@flex--wak.bounces.google.com)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5eba564eb3fso34272527b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707526782; x=1708131582; darn=lists.openembedded.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=thKwcQLuqqxpX6bp5Xf0dqz93GPrRz8ZlWrLcp+XEB0=;
        b=LTNnU19lWbXChmuty6okY9q7vYuPp5wiH/8Nbmqs6wNMHOD+XnZR9Ln33KxbG8W1UX
         xfvTgotCUvu/69kBPkb1AqMOEyc/qMrji8Tu/ajI80/3Pv3VV5mJasgKaIKitd1udOzS
         q0HfwZLZmEkjYKLqDYsziqCxwp6Fnkry5cXm1pyU/C6uptmIJXIpsEdJao6swUAv/aSw
         sOC7RDZA2uYfTQ1OkvxLjS+w6kOnl+zLfpK/3tb1fpSoYFFDVvSF7Q4+ljv6wOSpShZc
         74HF7A7oL/q1OEOwo8TMYoydTA0oN+j0o7UkQoa5BO2wUSAfQe+JyYRrc8mORvMytSZb
         XfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707526782; x=1708131582;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thKwcQLuqqxpX6bp5Xf0dqz93GPrRz8ZlWrLcp+XEB0=;
        b=R879481eglnOGqLad77qQu7iGAPVOnR4hGukQdQx3HUIvM2Ftwtw5sWj60RQ5XOsK8
         uisFfO+IaCnwprbk6hYbKNIj0rEhln5uGzTDypOfpg8LUcHsxoKPytJ712/sFQSlhfb9
         X5Sr7h41IdnG8gF2T3xj1vdO/M1wNldxUjte3jYMdcqrr6UO4mQTbJVw85/25nvY5WHq
         jY419cUJb39Ly/U1zapfp1Iop+FgEJ4VfmXa78ARmW+HOSzkJfjxHHR5lx07FbA3HOrg
         A87EQVxqczJCK2x9QTqrfIPJSKdi1spJemjzntrm9Y8jo1icMwsEV0Dz6zCV/Co8yAuW
         WnkQ==
X-Gm-Message-State: AOJu0Yw2mAOXiH0L+3KkzvgcaOZZLkm86ZzxvdyjPQu0hUhCC2W92Re9
	sgLmA5X1snVyWGclVX4Lu5y6GDbpYrQX3UMC6z+zurdgr8liAeCyhFaYl14RCULZP16FxavKCbC
	OM6ZkMI63c8COydSGhE9O2hfyXUMXM88BjA2+Z/UwcsXjio8VlCSHNyav0cX4tjGEXcn6DENOwD
	VeUWqmooT8BGFh2bb40d/qFiEurFWp8Hq7rYld3yO9BQ==
X-Google-Smtp-Source: AGHT+IFUYCMxPaR/QXRFG9eOF1vyz6NF9vdrvuGMfCfGVM9Ox6CUGAgO7lvy3r5cM1+uvSINvArO41k=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:cf74:ea8a:4909:577e])
 (user=wak job=sendgmr) by 2002:a05:690c:fce:b0:603:ea10:c37c with SMTP id
 dg14-20020a05690c0fce00b00603ea10c37cmr215646ywb.7.1707526782087; Fri, 09 Feb
 2024 16:59:42 -0800 (PST)
Date: Fri,  9 Feb 2024 16:59:20 -0800
In-Reply-To: <20240210005921.1909326-1-wak@google.com>
Message-Id: <20240210005921.1909326-4-wak@google.com>
Mime-Version: 1.0
References: <20240210005921.1909326-1-wak@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [meta-oe][PATCH 3/3] nanopb-runtime: Enable shared library
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Feb 2024 00:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108699

Some users would like to be able to share library code between multiple
applications without embedding a static copy.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
index e36abf808..e43931a4e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
@@ -2,6 +2,7 @@ require nanopb.inc
 
 EXTRA_OECMAKE += " \
   -Dnanopb_PROTOC_PATH=/bin/false \
+  -DBUILD_SHARED_LIBS=ON \
   -Dnanopb_BUILD_RUNTIME=ON \
   -Dnanopb_BUILD_GENERATOR=OFF \
   "
-- 
2.43.0.687.g38aa6559b0-goog


