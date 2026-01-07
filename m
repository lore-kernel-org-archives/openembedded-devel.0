Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05472CD585D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 11:33:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3836.1767785627494182000
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 03:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0MY0V12;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso21259985e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 03:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767785626; x=1768390426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Epd/d6/ShqVbUW34B+gwsc7dhU06YjQ+Ftp256vRpGo=;
        b=Z0MY0V12bDsyI5XQYgLKUeW5iP3NbEflMhU2rAxZ9aKECjQ12h7qP2vPCB8EWE2pH2
         adTOVB7silLPh4rMaSaetPmFIEIy1U8mqLePL9CkXg+8ZVha9z2HmW9vYN1ee88G/hT1
         kebBql+HMNEjI4K+sc5RwEc2owB719lRbfzZdZxIMnatK9fIbch6RKlOLqglimqAx/Vw
         32HdyWWOpCqEWJGJlLGJ7BnS8By5jZfAUTTgR2O8AdhkVccy/6Prf6MpAXVmHyKgB9Og
         Ir0oCiy/Oi1ostakzxPguzgZRiQh9vE9/QROtvqL1SehmwfOJ7MEtqEUYyGqc0q72or8
         cDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785626; x=1768390426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Epd/d6/ShqVbUW34B+gwsc7dhU06YjQ+Ftp256vRpGo=;
        b=pScTqtneWCyJAoYXjVRFmPoZ3iXESrpDz6D2r4L2Rgo//VHNVvq+oYo3YIm/AGrMOv
         koU0rKrC6bUaKXrZsj2tXqoBk7Nyu+au0HyyXKnGOKIvZ4nkgSY7DJaowgWBcXADkpzU
         ppeKIZGXudfdX/XYhHceN+L2wDctI5Ei2L1++4ev/o7uyW59ol9s4U0kvNfjSPfqhnz8
         faQLCiSNene7/JQRWMACteRvwF8toAju+yY1QfW2WcKqrNnwnRyw0LHDLTVqrIoQxHjY
         jYgyTxRPv+mZj+Fk5geiEd+2FaALV6Nl1ieox18D32puW0gqDFFx8fPDkS3wXshCCcEs
         taoQ==
X-Gm-Message-State: AOJu0YztxyjXpvVhHVI/D6T6TCOxSBenLknT5rnr4f22piJQIQISZjVD
	frG12/Z29S3FOl5Fa93G6wNiLHcs+wnYGl+PiEkz7XfxdOjLyLszlKiawO2CTQ==
X-Gm-Gg: AY/fxX6TiyViFt7braux/1FrdzIIi3yLkFWFWfke5PM/2rz3Zy+vjrLXN2gd6YkoGvh
	NYrdsy9nwCmM+zVUwp2kc6vRlBWhJbG09QrKbs9sw3B7xf/cW7JXATd2EaaCN0BG9FNULzO6sYa
	9GED3Khb1hMPQLZ7zWOuyeVvNvr+maWeCzbDB8f82CMaR7pUj+pEJBHr5eI45wAPKWoz5qqoZDt
	24jQGGYJAcnH6t6khjMmfexF4xph9tGkyKxd1Dgv2r8FPtkAdMQOkQMa3VoZId4XT9BFnUsnflP
	0b7CKyuyZ+qDWMmJ+kXH/nPfYwQkApa9hur5XrUvqaoou8Oryo1nUxhiPUjcpvzOB7i336WSmxx
	k9mPa/VXqADekygLLDIAKDjbHDHj8vijtX3l3pIzyCyRq66hwvGmJiFwgtPmrjmiz58WuHR8tKB
	Pwm23XCJ3t
X-Google-Smtp-Source: AGHT+IHZpiCAcbuHVrwxeGwfWxXy07zX0vnZS9XpDI3SeRieejvigEjC4PUVN9yfXoj7x2c2NCpOKg==
X-Received: by 2002:a05:600c:8506:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-47d849bd201mr20733795e9.0.1767785625564;
        Wed, 07 Jan 2026 03:33:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe67csm9560266f8f.40.2026.01.07.03.33.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:33:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-m2crypto: mark CVE-2020-25657 as patched
Date: Wed,  7 Jan 2026 12:33:43 +0100
Message-ID: <20260107113343.2238185-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107113343.2238185-1-skandigraun@gmail.com>
References: <20260107113343.2238185-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 11:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123224

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-25657

The commit[1] that fixes the vulnerability has been part of the
package since version 0.39.0

[1]: https://git.sr.ht/~mcepl/m2crypto/commit/84c53958def0f510e92119fca14d74f94215827a

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index efb6c79fa7..e534d32028 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -13,6 +13,7 @@ SRC_URI += " \
 "
 
 CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
+CVE_STATUS[CVE-2020-25657] = "fixed-version: the used version (0.46.2) contains the fix already"
 
 inherit pypi siteinfo python_setuptools_build_meta
 

