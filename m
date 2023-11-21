Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72EBC61D96
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:02:49 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.39298.1700571766797200144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hw6aUiDy;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso7775069e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 05:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700571765; x=1701176565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nJDOJaAYQ71gJUCr9XF5jUzmMHtGX79lVp4tlaY4i4=;
        b=hw6aUiDy67bi0qLKZyvOEMJMDHPH59Pk6wGpZXmBf9eoakwEu05uOdr+FsGD+6/8Pd
         OYzb2CPv8rkak8umM4eFEi8QCb+F2cy8ixzw9uqacTXiPsfkhL7RXU4K2ZpMX+TZaZx7
         98S2SeAbnLN38JMFcnXdCYpBR3D6VD8nFFqQxJ70lG7lyeVJn/cxP6X36avMEGI8VdJO
         fWBx68eNZGLhWGdHicJm1Mnr7JCkx1fT2cTdaVW9XGjsODvK7n6GOrYHdlB41wOwq6k5
         o3/zPHxNqFKQkMxqF96lbHU80lQzByINRidAjNSqR3wsIpU+B2hNRRXkCOPKE7SktICU
         q+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700571765; x=1701176565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nJDOJaAYQ71gJUCr9XF5jUzmMHtGX79lVp4tlaY4i4=;
        b=re9jHBhs1jTsAEaJr5gHiUVy86QUgxjdqIQymtLo8dSfns5C4qFkj1ywDmOwejurNK
         ITMy3G2WHae0688LYBiXv3wRZVK5e5V54HC9oabyRz6xhzB/e6fQi439bT/407OGSnSz
         Mwbcodv+hibylJldSv7F8QN3aAgvgf/q3MBG/unpUGfbkHQWl0w/un9cYVQNasBWCU8Y
         mji5cl9NAaGZiP++Sxs9hwThr8Mo7MH/fhilNsbrJaO1gsq5mM3NMPnYYq0Fio2bdUpI
         83xvtXIp906XXXghQgWQuv77ZbjDnFO+6k7xCYPxRlGzt9YmkJnhHjz5SWTtWsL4T7st
         UD7w==
X-Gm-Message-State: AOJu0YwLTgSyOYJvB73ruJrxzDc44qOHovIddtyX188rewlsd6Am+E6N
	OhlCCTNrYwzR00K8yrvvMgmRcEMyDQM=
X-Google-Smtp-Source: AGHT+IHSw0rZVLda3g2jdjSP7PC39F6PvUzTQx00s6awyhqnX+S8Nph5KTDMbYGGOv+DSVkbJVusuQ==
X-Received: by 2002:ac2:549c:0:b0:509:43c8:f5d9 with SMTP id t28-20020ac2549c000000b0050943c8f5d9mr7124409lfk.49.1700571764578;
        Tue, 21 Nov 2023 05:02:44 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id me23-20020a170906aed700b009e5c644e34dsm5139044ejb.82.2023.11.21.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:02:44 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 2/2] webkitgtk4: Add recipe
Date: Tue, 21 Nov 2023 14:02:33 +0100
Message-ID: <20231121130233.1381225-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121130233.1381225-1-zboszor@gmail.com>
References: <20231121130233.1381225-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 13:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106977

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-support/webkitgtk/webkitgtk4_2.42.2.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb
new file mode 100644
index 000000000..6efe8577e
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb
@@ -0,0 +1,11 @@
+require webkitgtk.inc
+
+DEPENDS += "gtk4"
+
+EXTRA_OECMAKE += "-DUSE_GTK4=ON"
+
+do_install:append() {
+	if [ -f ${D}${bindir}/WebKitWebDriver ]; then
+		mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver4
+	fi
+}
-- 
2.42.0


