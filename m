Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D131CD6E6D
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 16:12:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15488.1780589518674047907
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 09:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lBtLeFKB;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso2493505e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780589517; x=1781194317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3YlvkGdDpjPH/en5cMBED/DEm2/hdNe0NSvnTWTO70=;
        b=lBtLeFKBTRYmF0YOrvfza+5VjBFXMUeytmrCE6YLJCjO5lTAb0jE+P/mbC4CHOFvVm
         3k6oSyYqLdofDzcYwcNcSCo3tIZaNQKP5PSw5WFAdRB9QPRu2s2G9/Beve2+0E60Iy/H
         8RGcpcChl/Zc8NkVl2ElJiZwP7MJ4MocLavMX9hUeN3QqpT6oa+inVdGDpnefv3qbPGb
         0+Kb61ikiNflu0hCm36WrjSz8oBl1raHaWFZVzwfoHcARGSCFdbWGCqsC2G9l86tqDTR
         oDvwWseSqzj4x0j3pWcNdDYNMiTkNGhWZzQFsRRlt75U+dWQFDbpWMAExUqSIFOKYT6y
         2UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589517; x=1781194317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3YlvkGdDpjPH/en5cMBED/DEm2/hdNe0NSvnTWTO70=;
        b=D/SwhJYP9S5bcpSjGGJ4A/TVANZIJLjRfthFOtXBsQWwf6V1fuqdqr7Y288uSJG/Lt
         sZP3oyI1w/AhgvwdCdT9brU4XOLqoSWpQoxg+s4ykc03mXU2bVKABglNE/m76Eof2Vh1
         iDYhqZJQzJUQd+VUmS8KLnG2C7qWbg/nXUAN/MmwsBTW5Ug6sWonC31brX3Ze6QrIfX+
         iu6BRRsyVGKhgcv2qgkaWcD2lob++J0T70U/pWce1qk+LtRGUfscxgwF8sJ1hjVaakgZ
         cJradCsLnOJ5j8E8SxpkDWQfoLxESvy4UrNdLenUeJ7/Y/jvCEse59CTnIzEso/tS+dj
         WCbQ==
X-Gm-Message-State: AOJu0Yws9D46uqKe3XOiejBA+l8LEsSbtjrzUxpw5hL10MfB5RP+MTv+
	li8fgP07GE8P29WU8KS3RJQMm7WSreJCT89zaUzJ2yqj/gkoVtOr18YTMWzbjw==
X-Gm-Gg: Acq92OGlnWz0PNc5CjW9wHStd0zrQk200rEqubDKoqAjGVpyGNJpWEwPrQZ0FNYktfe
	inSxAHOivRyM6h1KPMzU/ddqeBbg5ZG0inQmUsFC0CKpIgS6vQjN7zK8F0FZ0Jyo87j0fefp9jt
	+LSgEenxNSgpOz5vmRegN9QiZgqPRIjI958fSiqvM22n2z1iRUtmWcBQ2brQJqhuA5nnsPpvKmb
	2FNUCnP22mv4eQO7wSUgmblgE5RqfUnf9MuskJXxb74uT06JuCWCnxGsTtH1fO3VrrdSiJiTSf0
	ZlIs8C1AlhN5u+jYaDbbTC71olOioQgd9+R1jkdpiXVGBBY+9guRzflydv2DoMsLFlZh+vBcUUb
	Ozgbk5ylRBSDrE6ezPBd+ODjbMRp04VCZCrLrMSN3jnzak4P6lL7IftNqTSqP532Q3NXoc397QN
	4x0I//9F7DwBvSn6xc0c8gIZ3ExuI77scBT5oQOV7YgJ7QRNVo2XTeUJ9L8r66rGX5yvD3iB+vN
	HXTpb1rnPyu6MrTLfKwagQDf5KVLCQ=
X-Received: by 2002:a05:600c:3ba0:b0:490:bb45:79da with SMTP id 5b1f17b1804b1-490bb457aadmr108675155e9.13.1780589516791;
        Thu, 04 Jun 2026 09:11:56 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd663sm91771505e9.10.2026.06.04.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:11:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] cunit: set CLEANBROKEN
Date: Thu,  4 Jun 2026 18:11:45 +0200
Message-ID: <20260604161145.2420902-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 16:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127402

From: Martin Jansa <martin.jansa@gmail.com>

otherwise it tries to run:
/bin/sh /Users/aks/code/os/cunit/cunit/missing autoconf
and fails

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index 75ba477757..fd51e024bb 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -34,3 +34,8 @@ FILES:${PN}-dev += "${datadir}/CUnit"
 FILES:${PN}-doc += "${docdir}"
 
 BBCLASSEXTEND = "native"
+
+# NOTE: make clean
+# CDPATH="${ZSH_VERSION+.}:" && cd . && /bin/sh /Users/aks/code/os/cunit/cunit/missing autoconf
+# /bin/sh: 0: cannot open /Users/aks/code/os/cunit/cunit/missing: No such file
+CLEANBROKEN = "1"

