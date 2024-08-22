Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF368C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 17:46:04 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.19610.1724348762726332121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 10:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOfvgFB/;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5befd2f35bfso1500138a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 10:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348761; x=1724953561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fE4K+xkNKyyYiMOVBPlvCNiRTSwxPzdFwfIj0kCwnXY=;
        b=VOfvgFB/FKJsCpl9pByehP4gdmFgYQn5N5HsLI/aQLMft/EMNEeFilZeazfyRSlUI7
         7U3rtERm3c7HImBsJ80fhIUwPVW94xqZYp2lHCRyv25VngeCVwp3gc2755mjg3bVznz1
         OoiEfu+UWHw9v+x+wzfZEjiKx+zHHz78mwIQ/CqSo6gSrzg2+2G6rZr3DfVq/1J0cOJp
         1WUJxiuzzFzlTX+37liOUEzMk3hmZeqNUw3Bkt1oLDFJmEPY1GfC+lNgT9NlJecsLYcM
         6nLNcAlA1d3/+cSiDUueA6z3yPdtE6IhoxOFjsGefqwmkUFTlNMzlgc4hooveo2r/mt+
         0GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348761; x=1724953561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fE4K+xkNKyyYiMOVBPlvCNiRTSwxPzdFwfIj0kCwnXY=;
        b=STP8bHHl6RR9BI2QZB6CIQM9d7xXrwRNe42ab1c5LV7KDZHEq+Y/Q0avpLs0vZOH0x
         I57Uxg0AZhA5TwhTM7Y7/vkWGUdk+smga/qKa5P4RaujnWSlue70Ve2fFn+8PHaWkutz
         snOUuSEIMCpskv14/w1UB0ZYnalk4YtZYGJt8hN9riYSYqp2JW57RhEhJp8GANo/Ky5A
         s1n0qQaG3j+Essa/+TfsoVQDoFsgUSioTDEp9SFNNxH8oP2edbr5s8ja2a48tdvdJmHw
         8cIt2VSXloQTkNM9KR0Tb7EC9fgA/WTBba7qL8FClDz7rGO5J2C6THBznWOU/d+KfC0j
         Hpyg==
X-Gm-Message-State: AOJu0YzEEBTgv2jfgfBDEO2dD+ivbF8A0NQv4tNDAniy/5Fvl3sXVPat
	vraPaDAkfcLpS4lvSRh5Z73Gse+4cZCm24Fb2Fzi9cnwX36PE7U1fZ3D9g==
X-Google-Smtp-Source: AGHT+IFbqQhSvbX2oXSsKc8E9aWgmatkbAYiCmyydl34mBbOx8b+XqWz+YiLCjDinuvSAGrk5eR5wg==
X-Received: by 2002:a05:6402:448d:b0:5be:e9f8:9bbf with SMTP id 4fb4d7f45d1cf-5bf1f103ed3mr3973595a12.9.1724348760106;
        Thu, 22 Aug 2024 10:46:00 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3e89ebsm1139940a12.43.2024.08.22.10.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:45:59 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-twisted: add python3-attrs to RDEPENDS
Date: Thu, 22 Aug 2024 17:45:40 +0000
Message-Id: <20240822174540.21475-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 17:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111906

This fixes the following issue:

python3[677]: Traceback (most recent call last):
python3[677]:   File "/usr/lib/python3.12/site-packages/myownscript.py", line 9, in <module>
python3[677]:     from twisted.internet import defer
python3[677]:   File "/usr/lib/python3.12/site-packages/twisted/internet/defer.py", line 44, in <module>
python3[677]:     import attr
python3[677]: ModuleNotFoundError: No module named 'attr'

Currently python3-attrs is provided indirectly by python3-automat. But when
python3-automat is updated to >= 24.8.1, python3-attrs is no longer indirectly
provided. The twisted recipe must declare the dependency on python3-attrs.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
index af95996d5..e0472d1d8 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
@@ -49,6 +49,7 @@ RDEPENDS:${PN} = "\
 
 RDEPENDS:${PN}-core = "python3-appdirs \
                        python3-asyncio \
+                       python3-attrs \
                        python3-automat \
                        python3-constantly \
                        python3-core \
-- 
2.34.1


