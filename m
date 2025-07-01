Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E119C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:44:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.5566.1751359444290198181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 01:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZgXX/hvu;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: yishai1999@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a53359dea5so1675566f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751359442; x=1751964242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7NMnWZP67Ekt+EjNoonVOuTjumdd1uP3RB/32/lBJ0=;
        b=ZgXX/hvuXo1lDru93KH42fX10RR7slcQlRlAKL60Se1JITPHGHq8Z6PyXX05sh6rwV
         Ii6MMBkIotSgJlyIhxxkIIpdHMD/2/H9MDsxDTlyLuBmuhBNmDbKJR2m1cvNqUW5F5zn
         vrOvwnRcvAV333c/Z0rsT0N68y9583mbe+3IhOUqDTIuNPkQqziugO//HwWB4oVWdvyG
         3Fmns1ci28z8Cfzd67qn4u/EAWkeARLq6C5tBYYQatRURJX1P8kN6KP8S28azuPSDmvZ
         k/F0X6Ba4neTLsR+19F8fVJH2+bB/pkRUfT24P9OCufT73l2mTb48LkHq4KkRN8qFh9Q
         Bh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359442; x=1751964242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7NMnWZP67Ekt+EjNoonVOuTjumdd1uP3RB/32/lBJ0=;
        b=lrLG4ZKgovKLrzGra7f4vyDOKmN8Q5M3cime+3Oesrl+/03SQFBibwpt6q4PlegYQO
         WZht656NBcw4ur4OrbV6qwRsbcE/l8Zezinrc7Ok0kAIJXrvZvG5w2H0F7GWFKNwAdyh
         2VVt264J5Ud+3J+mIo44P8mQcMiNbS7kTHwZkFha/QZS/pDLhqVuxm92/wGxTkgK+MqN
         Vhj7j4KmpmcRi8CoRUq1I3SgQO5pQt2dwiaLs2ZUp13FCI9qCxon7wTvUl8bcpkW2Xhu
         0gh4apRPCL3oGSIfRt1jpru7wMcdbdyqsKF9RtSIVTtSiXi9ixpyvXf0fWt+Ju3bjDh4
         iDJw==
X-Gm-Message-State: AOJu0Yy3QG4couo+itFvQfyT5bTLaWBhArtSkGy3N/7tvyF7l1wT96nS
	8weJX+jwL7UkTw9+NXwk08SrfLe0M38ViLn0kdc2Q6OjDYqkqiAgPhqtO0kxrg==
X-Gm-Gg: ASbGncvM/Hdqk36V/WDK2CGWXahwNLd0hnCjDpkahB8m/Y95xsFonJ2An4Y67eGiLOb
	XNBZHt73bptTNppBXKRuBCOVxjaRiqTEQk39TCByoejZ61HtBS+OvPMH+s1TW9GIXGUIdIH0b+F
	n47/CnRL+/A/l4UqaW1YYFGSh1ZWgmLzodmPgQV4GF/eKukl9xNksHcZwxNGPx+q2QEa2gIiD3R
	1RTP/4jKez73g9gGudp7gDKTjAiUerEjzU3GQVz7ovloNfVGkzHnqO0+b+fIgRWmdU7bPltfkAm
	XinZOYiux7AtdcDsifjkFmQk6G6ZPKpL8ZtaRBkCoZnskk1J6Rj3kotMia6lPiNQKwMNeLYZH+X
	J06wK
X-Google-Smtp-Source: AGHT+IFq4DXBn4WhAZLtwvJsK3qvfU73cWZms6y2gnZEq1ditfrQnyBVdk501XxjzFw4NzwRPn5SpQ==
X-Received: by 2002:a05:6000:2892:b0:3a5:1c70:5677 with SMTP id ffacd0b85a97d-3a8f577fd2amr14869186f8f.7.1751359442026;
        Tue, 01 Jul 2025 01:44:02 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm12597880f8f.77.2025.07.01.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:44:01 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 1/3] zeromq: support native build
Date: Tue,  1 Jul 2025 11:43:50 +0300
Message-Id: <20250701084352.4165484-2-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701084352.4165484-1-yishai1999@gmail.com>
References: <20250701084352.4165484-1-yishai1999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 08:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118189

Add support for native build of zeromq

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
index 7569d3200..eb4ee2f4f 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
@@ -27,3 +27,5 @@ do_install_ptest () {
 }
 
 FILES:${PN}-doc += "${datadir}/zmq/*.txt"
+
+BBCLASSEXTEND = "native nativesdk"

