Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B846FD3E1B3
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.29952.1729278799629366192
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i4zQ78SW;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e396a69062so23916937b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278798; x=1729883598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DYIivaJYMpGveOR0xEYHITU5ZTS+fQd82197BhwmVM=;
        b=i4zQ78SWm2v3rg0ldWV5v33zXI+Ohxokyw7jz7ACt/4H7VJlQefkwobRd4fROytHrv
         7GFJrlpz6cPsZrj9DGTmj3dWdilH3yPQFaMDJ0zWcFdvRR4laZO9Pmm8/5RLlIgMuYak
         BufWl7X9wes8sL6rJieB3QopQwthwi19IBK7qx/ib7rcN/luga5SC5xogubVg23jA6D0
         n/33BFWMZqXUXHT1X//rVMfK6jIqF0PwTMfPEN4r506WpGRykB/UdMeUKG0d/uhw/6xg
         BvyzmhxuYCDkSx3xZw54jDYZOOZlMQ6NiPPk59+twWdZe00daofUzGpolkIbT9kzLZ+R
         0tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278798; x=1729883598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DYIivaJYMpGveOR0xEYHITU5ZTS+fQd82197BhwmVM=;
        b=HGxmN3bR7jFizZqqyY70sQanH97+Bbo/4REzlf7Cv5sp13xapnB53LWjHVewFERt7g
         3H3zup5l5hnrTI9NzokmKbusOWuacaRPG/Cen8bzUMOB7KId+t5dy3IOFBiD2rEv6iJQ
         wNEVBosL5cAw7cWbsayJg5yP9YTBm4fdERe2C07Q0uIOK9zI6YPl5X2BqHaTHvHXivEz
         q8D2RkuwScIz8CH1YNLgv9km8UCM162V8dz/fN3xv5OhGvRv2mu/dP/bPGjVhmjKPuxR
         l06c3MjIjMFEmKynklmgR87S+oosdkEfBlEDv/u/T7o6NKgikDcsbru/COzaW+i7+/6W
         NoYg==
X-Gm-Message-State: AOJu0Yw4A+xx0vKF07Zbsj3BhTbfOpN4qzW4PsbnMLz1Nq9UCRdTHL6P
	eDP4uWHwUCc0hpGUGVUcsFpC0iQ2vPUmVQSVJroMXfLhggbcm1SRPvMD+g==
X-Google-Smtp-Source: AGHT+IE46IQI008nKI7+Qe5uSsIJzxVoFQH9fKImffVeHsiKWO+J9Sf9zuw8uMcu9j/xpkyoqlLCog==
X-Received: by 2002:a05:690c:2b0b:b0:6e3:8ecc:bb0e with SMTP id 00721157ae682-6e5bfc2c3c6mr31119827b3.11.1729278797900;
        Fri, 18 Oct 2024 12:13:17 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 11/68] python3-argexec: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:58 -0400
Message-ID: <20241018191101.25184-12-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112998

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
index 017a7e954..64ed8ad8d 100644
--- a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "448635948823309312ea9f70b30b6c2d"
 SRC_URI[sha256sum] = "61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c98c3bf"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.43.0


