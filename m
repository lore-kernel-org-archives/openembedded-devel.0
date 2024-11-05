Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD00D2C102
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.19617.1730817419349439870
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoE8AFVP;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e35bf59cf6so60229957b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817418; x=1731422218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72tTYyl7aga0gA3coHgyjfY/kZhalfMyb2C6XD1blKI=;
        b=FoE8AFVPLv3wNoYKWQ64vT0Ss+D0wEvq/+JykEeubU8kFRRU7jty7ybgGcp3T97CJ8
         cYZDZMjSM3syQl0pKRbIfST6ljKHPPAYXJ/Ik0FnEXtZRCQvVt3KsB7PJbf4X5MRcugD
         aen+wmTZBfxTpni+YcCmGjxXuthhPpC75AUn5nyhtBTSK2deTIO6+xZaaVtks3zXqw7H
         27oBN2IO1te6Tj29U/h9bwnZRHe8ERVtsBfozHNf3ZRPbjy3HBAhok+CiE3oXMDt1e1D
         rn3aoJcXfT1FjBdhfM3hyH7yK7M3cy/zfuPENXipl8WKWxmLYZonxbZf7HMB6duiQ5TN
         JRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817418; x=1731422218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72tTYyl7aga0gA3coHgyjfY/kZhalfMyb2C6XD1blKI=;
        b=K41U9G/8f9wlXjkjqFHJdFLBUr2iLsvmbDNwSxF74Gh0QOHGQV1HfDNFRvxTIpGImV
         TyZmK1aff0hnZp+s6sE3L32LQ482/SRprLKTaC8G7edmULEArD4gEllrghybuisOhNlF
         AzbRVHT0AyYJZiD4WakRC2wPXZ4fBLukTzX3CAlF54yikRlizZsBBCOgZm3Ad/+SJb6t
         GPZ0+yi9bygiKEkeeuN/4DJ0zbjOk1zHYjHpYXpETJgtsN7aErv+kh63Yn7hEpv9UH8x
         XlH3v2Gvq7ac96afCLybrKOhRw+9xPBAJNkoQrhFd/AM7fjR349XYD0gX/W71979QuZZ
         J2TA==
X-Gm-Message-State: AOJu0Yw0M5DsIeW0h6Y10FRezd7aa01tnIemViSxWVdbZK6F0aVTivC3
	/sTv1Os4MVcimG6PoUxHAH16CSbfcCzhTKVg9rAQe8XOcQyYSmwK++Aj7w==
X-Google-Smtp-Source: AGHT+IFWOxKJ44maHh8wFYaXlhjP3DhKMMR/5TGZoW7LxeX2cyCex4Is4r6Jaitzxz62zPd7WtnzXQ==
X-Received: by 2002:a05:690c:6481:b0:6e5:2adf:d584 with SMTP id 00721157ae682-6ea55896dc1mr146924467b3.14.1730817418487;
        Tue, 05 Nov 2024 06:36:58 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 42/90] python3-pydbus: Add missing rdep on xml module for ptests
Date: Tue,  5 Nov 2024 09:35:07 -0500
Message-ID: <20241105143638.2301245-43-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113460

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 5754fd2adf..cfdacf53bb 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} = "python3-pygobject \
                   python3-io \
                   python3-logging"
 
-RDEPENDS:${PN}-ptest += "bash"
+RDEPENDS:${PN}-ptest += "bash python3-xml"
 
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
-- 
2.43.0


