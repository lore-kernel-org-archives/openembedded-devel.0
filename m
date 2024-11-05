Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95920D3E79A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.29858.1730837382161105352
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EgSMw3x1;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e34339d41bso50785457b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837381; x=1731442181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJNm+lF6eBf1vgeU1AdcREy3sBnKdk+Cxs9wszJkkPI=;
        b=EgSMw3x1ZlYmDIZfqknduDN9Db0050N5hOqz5bJSoD89bkoUzo2JejbejtY6Wvglef
         jGp+FIPSTn2UVsijaEQ5/K42AKvzmkdxnUrCxHV72sT3UvakPZ/nwcmBaaJnHlHYW3nO
         jVWZhmTEEFxMgkOHeQT24Cd7ZzGIZdbfwU2SqNedWxkByHsWW0ZbcrzWc8djSghu560h
         tncTJ7xquq+kVffEoJYczks4ocDUFHF+ZviydkEKNHf5ZiwE/dnWcGMOhtUcZo/vAJZ+
         Av6nfB0qZ5nmr//icI2o1QyNR3V1tAo18WZbcx/ktfO56MGS/DCSa9IXvGl8nYP3iBLL
         ON7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837381; x=1731442181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJNm+lF6eBf1vgeU1AdcREy3sBnKdk+Cxs9wszJkkPI=;
        b=sxxsEKq/GY1hjnRKP1+pSW2HS3ggVH1u0+/bOcEUF+FxeiHHuGrKSvTa9WCSRaHYgS
         /NwEFZf/JxE2BfH0Hu7BgrBsIBJMm/1FkPJWB4GJwNwJQhHz+RUrmVIrAMcxqw/Jpynh
         Scj/q91/IQtUipIpYYzleXFOnm6Ne4w53ITVTdL5syLfhaSnilVn/9OXVgeeqDejBwek
         5jqIhZB0v1iS2x9KG/79yqobVrSINJFSXrivRqt8JS5b+Rr40dZq4JP01HclF8qrmO/X
         oZuQoXi5XjSN6nymvDfCQzUh45xydb1jb3s0CUsBx1t0OYFdJddsR1AAbkVG+FFXec3M
         urYQ==
X-Gm-Message-State: AOJu0Yx0LwwEWJHP5fdntpYSNPX1e3aH90inQr+HXKxgt+dr1xE+18+8
	AxtfSeVzPOLEAB3j9TND1Ni6F6umCMrLdbZxR55TTPOJinqYvWJnjp5KsudY
X-Google-Smtp-Source: AGHT+IFAhfayGIVFQuFOFPR/OWpVvdVZaLuhBG3c99AqzrUhN/V6S4Zp1f3VsxcnhwbySWua1r81RA==
X-Received: by 2002:a05:690c:4883:b0:6ea:8c14:7bfc with SMTP id 00721157ae682-6ea8c147d28mr99752677b3.34.1730837380821;
        Tue, 05 Nov 2024 12:09:40 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9788sm24384527b3.9.2024.11.05.12.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:09:40 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 105/161] libid3tag: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:05:55 -0500
Message-ID: <20241105200651.39395-105-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105200651.39395-100-schonm@gmail.com>
References: <20241105200651.39395-100-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113623

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 850918d31..82db2f159 100644
--- a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -19,7 +19,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
 
-SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
 SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
 
 S = "${WORKDIR}/libid3tag-${PV}"
-- 
2.43.0


