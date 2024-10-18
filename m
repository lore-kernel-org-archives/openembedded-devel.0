Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12846D3F293
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.29978.1729278821960873257
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TemsJYta;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e2772f7df9so22628657b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278821; x=1729883621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QDIjQJuTtCIV5WW2KClgatXn8lZjmxWeDGvNHQ6XHQ=;
        b=TemsJYtaDLdfcyKyZYvAhQlvZgQI5V/jD40Ob+pfPqIE6I3mAWLnEah5loYz0/5R8e
         FFBeZACnRzd5dXhqDWkf7lWp16xvadGJNDQdgp9YREq62zA+ZIMSQ1p3B5iJHUVfDh1B
         vztjuciWBUR7RwS/WviMbQV7P/j6n0WjjBje8f2nho5k67Cn8xiNTf39wTrT6SOkNH6r
         bxLSe4nZ2y3BChbxvUPWA7SI4+Huk8L6Mp7pDQ43l3NHCR4wiacAq5qT7EzbA4ycgzB9
         DVNfnYTnPVc1FGzRqZXuEdoSva1z74xM/DCdEjbjfpgfHRvM966I8zfd0BUKIH65tDpn
         6cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278821; x=1729883621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QDIjQJuTtCIV5WW2KClgatXn8lZjmxWeDGvNHQ6XHQ=;
        b=O2p/hbB0vYlO19wJ0CfYITORAzamkeYga18Dxjh1aS6ZZyInDF44RSBKjzzdTqxfy4
         7wBgYy7Tdl6PoWYAkLE/b2EJSo0xBJRm/xQh2oHImEalwnIxYF1O6dRq+kpcM8VTeRHq
         4wYuC7Gd27Q+lhOODlq87RpibsJLRg+M9ZaLEs5lWUumHoJHFeBMyzvFDzBZ7LuHYSZl
         znw9UPaemObv+/0tU78HyW7DMSYQCR+Iu3nDduFV19mJrMV+JSP4nP7Rvfr6ScvXmXLZ
         PKU3/6VWgmpgghMxxVROXBris8cQ5s9vuQngLgBnnziFzZaXAuWUszQkat3aabIWp8pR
         Kj3A==
X-Gm-Message-State: AOJu0Ywl5Va3/YlquMd37JoVELdhx8HskLu87R/iE4FOcHKcwaWZY2ph
	lUw71NHLQKgfcV72tjB1Jw4P5BiQ69PLgfVEKx7QXSNcb9v9LUNmsVMHyw==
X-Google-Smtp-Source: AGHT+IFtNzKljo0oL5KhR9I2IPNk9xfQSsvV8gOYtvkORXokN49Qgl7DHE847d5huyjdbZRlcVJyoQ==
X-Received: by 2002:a05:690c:1e:b0:6e3:8760:29b6 with SMTP id 00721157ae682-6e5bfd5c711mr41266257b3.34.1729278820493;
        Fri, 18 Oct 2024 12:13:40 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:40 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 46/68] python3-petact: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:33 -0400
Message-ID: <20241018191101.25184-47-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113033

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-petact_0.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb b/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
index b7fa69ffa..ffd5b1c92 100644
--- a/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-petact_0.1.2.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/matthewscholefield/petact"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.md;md5=c8533d4ba77519398cdae0173db799a1"
 
-SRC_URI[md5sum] = "47e9a6abc91b4022953e4007ddae9e68"
 SRC_URI[sha256sum] = "5dcb0d44f86a601e41a2def9770993cd0ea45c76d37eb3f35e3dd61aa50350e6"
 
 inherit pypi setuptools3
-- 
2.43.0


