Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EDAD40D08
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:10 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.30652.1730838996042526994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RsuGOaST;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e8063533b5so49329947b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838995; x=1731443795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ0Wanv36mkx9EmPHVMssVaFrkC75zdmRy0qZH5pYSA=;
        b=RsuGOaST120Jwgg6jXfLDREFcqUskD1iiXFexEW/iKfUwczO63VdJmfehh7Oq3BqN6
         K5ONyca6Pj+PHIjqvNF48O3XKrcTD9ux2giQ1+GGcUgDau2TNkUlPlsqdhKvk8xZILgk
         YMxXdcrCu410CKiYZe3T0aiZXBMhFdfQEnqA5ezW6nUyTznAtb6WmGblbgXvo1w4Ascv
         OvSG1RenVWaPJgjmaqSF7Ki60f+pSdr3DXqK514fCTqvNGgjYIjInC6EbBkOxGNjwuSs
         25m6e4urugtdQ5L/dm3h9P+k7rINPQkGUFuJSRnR8yTpHVuRz60TKZh3Pn0RK2d7lh6Y
         Xwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838995; x=1731443795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQ0Wanv36mkx9EmPHVMssVaFrkC75zdmRy0qZH5pYSA=;
        b=t4UEjYEZH1B3CXXlXfSWOhLPihaHLx7djQFnbsHWW+9uh6JlDClvJ8s8tjVRmgPzoF
         Jvt4yiulJ0GGQODBIFF5xMVe+9jduzEMo/9aYRH73Q/tamqtydNZm8nUt8/N3gSEhXD0
         MX6xHEgv/d4gJLLClZPp4FOWNiOTtKcx7vUi3cB8NItbOIRwr8VbdEbQGXxXgaW3/BAF
         PkP2XIO5L0mfwS4+iTK9chCAXy4rRWZZrBz24STIM98Sfo46cAXvzdNHyxGO6Jj56dPR
         FS4z0pM6wANtQOqzYHEOajqaxk/jeLphw/xJ8NEUjCkKSBzh6iqzqQut5tM4rnkFLWfq
         qB9Q==
X-Gm-Message-State: AOJu0YyPOf9GFulk/pUDq/nLgZ7M8xmIUOANeOrg/3Gej5KVaX7eAWzK
	Nfme0CJXYCpTOyNRKbd73bThZlRiVet5+a6b31N3FDXJh8xzARSl4a4XDELy
X-Google-Smtp-Source: AGHT+IGEiDOvQdz4yvqlaDCIf0E/rY2jTRo/ThrukFrYJCcLFdI91iim295EvqVkz/NxMtNQ6+hLsg==
X-Received: by 2002:a05:690c:d1c:b0:6dd:c474:9cd8 with SMTP id 00721157ae682-6ea64af0eecmr171258507b3.18.1730838994741;
        Tue, 05 Nov 2024 12:36:34 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:36:34 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 135/161] libsmi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:28:00 -0500
Message-ID: <20241105202827.3104-135-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113652

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 0dda756dd..4c397bdf9 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
            file://0001-parser-yang-Define-_DEFAULT_SOURCE.patch \
           "
 
-SRC_URI[md5sum] = "4bf47483c06c9f07d1b10fbc74eddf11"
 SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
 
 UPSTREAM_CHECK_URI = "https://repology.org/project/libsmi/information"
-- 
2.43.0


