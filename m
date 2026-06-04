Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315E9CD6E55
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 03:40:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3761.1780544415117728800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 20:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UrANOX6H;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so1722215ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 20:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544414; x=1781149214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQXMPMgJ+ZBDasIRaT5CFAjyMhtdtLc9W8bGdkMiDOI=;
        b=UrANOX6Hf7BF2jPIwDcObFVtVdAnIi8G+q9bgV7REg5n+Mhw86kfGNK5udaoTNXKXv
         IHzHVN5zhTlSjoE0hwSFujv3kWgfMQ9ovBE5lSyaHpdFuue+mJSmRdgOAYl70HLnJ4TK
         gW+TFjBJ1B5CGrJdAq7UD5rAmbBblqDi6G+hERhIXpyuZH6LiQVi6GR7cClAY8JvyxVf
         k3m6wvf+EqSgHgBGlSn1nDHTGrlhSwrvkJVfqXi+q5rdfW4uaOUTyG6zYgafViPVJjT5
         R2pT4WgtEXROEdz61mPFMVtWUB8L3l4oPwIoUkjQ3WvHIvxmD9KtxHSlI/ZtXUOGJc7H
         8IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544414; x=1781149214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQXMPMgJ+ZBDasIRaT5CFAjyMhtdtLc9W8bGdkMiDOI=;
        b=QAtvlIYrIPtxJrXmhiHUFbBjtopi5gNFHEp6EJfmrd35kzdA7PWQwaQg+4PRZMsyAI
         QmdeP2bu5bAouJeqJe0tlBo/5j50jzJKkhnIZNTIo7f6cqeDXgwRDtgNEsw+IWxAF1nG
         LchhAakrrTPHKgZKmTqDw3F6wQNNqQzN3V4Q7InMJwn8WNjAWZ6zbemo4y9G5EcdDNzi
         ZuL3jplUVccTz0SAxlP/h/WDcGD7HEO0hCSXreNhkUIUXOKJnb2VoKECaxLWmK2lsGG9
         nqLpBcNaNB5Yz46XBR6p77x+xcE14nhJAoeXIMek4KIjpMiCXBJlPvDNMJe896g+XbMr
         JOkQ==
X-Gm-Message-State: AOJu0YwWxhhXFgsSRpvJ4TTkXbKRW8zV6rEiIFGJxSKvSrBmH2IHOj1l
	mwUdvDZ5ATbCdBWqp7lRTBC9rvisVkqaKmMpjVvJ2GrN5wVAxX1zBUWlPaO2RA==
X-Gm-Gg: Acq92OFA7IH5cC8ae/fxGgZgAV1mDRKZdyAOwmDbdEc6KCZkcXgyFmyp5CN8Pg4I73s
	qkiCCHr+UDpXclh4a9iRLFI8duvBxg9vql2h7PqcYRrzMFeaIPkR9jhL4LNO1TELtt2sQKBCitX
	zVJNqM1/wdI1e1805YGExDxajToj9axWWw7XpW70CHel/jfZ33UufFNI7ufKL6Ldu9jqV+uFRPF
	WtlRRyxyMe+6HgwC9v7i22+5C5qD7F7gBdaNheZmuL9VB92cH1QCBTVpgje6d4b4L6zgJvAYtor
	bV4FreqLAfYZNPcOhOB874huA+opLgwEp/isFeFY4od6IveNrhpMPeIq7aTQi08jmv7aO7aQyUn
	cJVtTok6r6OuxG4YrrI3BJdp0VDx5AsjGYJqIKlkDHhAsi3VIqf3muiHQ9WO0+DF0AXxdzOfKw7
	xRGUmsnTx0jJFt+H6jgBeqM/kc/MCPnsyI49P38ZNrBAKltGo=
X-Received: by 2002:a17:903:b8d:b0:2bf:172d:ef7e with SMTP id d9443c01a7336-2c1644b3047mr63969535ad.34.1780544414394;
        Wed, 03 Jun 2026 20:40:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm55632295ad.17.2026.06.03.20.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:40:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 1/2] python3-django: upgrade 6.0.5 -> 6.0.6
Date: Thu,  4 Jun 2026 15:40:04 +1200
Message-ID: <20260604034005.2879319-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 03:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127392

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/6.0.6/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.5.bb => python3-django_6.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.5.bb => python3-django_6.0.6.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.5.bb b/meta-python/recipes-devtools/python/python3-django_6.0.6.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.5.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.6.bb
index 93bcc7b2e9..a96a6dbf53 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.6.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "bc6d6872e98a2864c836e42edd644b362db311147dd5aa8d5b82ba7a032f5269"
+SRC_URI[sha256sum] = "ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

