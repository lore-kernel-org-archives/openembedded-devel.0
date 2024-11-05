Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32641D31775
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:01:24 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.26855.1730829680826677399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nVGii2+s;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9eaaab29bcso320889166b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730829679; x=1731434479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aRWlNgyk2y2gpPvairNBcdfoLh39/7wQ7cAs4SEgics=;
        b=nVGii2+scN9oe6rM8U4+x1BZt4r4JJy8wk7HDX5AwrmQabIiLC/CaHbk7pruot13KR
         zshAZTWdgoG8sGS7JLaFYq+m9gJDgVB6YSmWILfc8xREGsRwFRzqkrnUCPOyFgVeuKPU
         8mmoMnRnZXSbGVE6Yo6GN7SOmAE3mBEPsv0ozSZg2zL/jcuhtglT5nxaX+Jn37C1nP5L
         2oIoIB5RDmfkxBRGDqFUwgE58mrs/wzkK7WvIvcmFhruzhFCA8v/KFZE9dVSbEmnHWYo
         TzyrZslsZrDPKKF4KWGg8gM53WMu5F2J19WCBgdwLlCGELZZmRqF0H8Iu1p3Sk5udZEz
         XiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829679; x=1731434479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRWlNgyk2y2gpPvairNBcdfoLh39/7wQ7cAs4SEgics=;
        b=LVHmsHBPWVVmt3Zhc5YqaytIeQLBzN6RZfhpxI/VtHeLb1z/rLXAmcsQormp6GDhsb
         unqS3/NBu0dQSwxIG4PRz4hQbpoG5pMmVqTPiqYD+HuWAI1PDKtvI7kivQ8cWndLq87r
         zQGkif5htheFMc3bwrSLN1mWFNDtJ6zdYmdY4rO4tEQ75xUrODU7o7Nrxf0IHz/p0l8Q
         jPewJU0W7744DB8oWDsW8ZlDONRdaSFkdq3VPw+yYjmKUQxpGUuqhkpEe9CaCfZL9J5k
         NRcNBy/IwEV9cwAuASZU3IqjOszKV5us+YI0oBPewoOzo0S+GUQ1BUmp1LkRjTrc5LbD
         cQeA==
X-Gm-Message-State: AOJu0YwF0CAQc5k86Hf7B11d6UL5wTOWaELw4KJEx1eqjIPywAK3QCLg
	kKLcEnL7VPMW8rBf0EWil4tBFLF3qwQcexZfDv82NGLjG/y3N1lfnxoK6H/2HTXJMw==
X-Google-Smtp-Source: AGHT+IH0PyZHoRH/5sSZ2SBQxN3Bq5vP8p3kkF2npMxscDVU+SHjGXUBmBI0yy+8m85vMWLKcpljOg==
X-Received: by 2002:a17:907:2d12:b0:a99:cedd:4612 with SMTP id a640c23a62f3a-a9e508e703fmr2050764566b.22.1730829678465;
        Tue, 05 Nov 2024 10:01:18 -0800 (PST)
Received: from localhost.localdomain ([146.52.197.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f6087sm166980366b.142.2024.11.05.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:01:18 -0800 (PST)
From: flowergom@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Minjae Kim <flowergom@gmail.com>
Subject: [meta-java][PATCH 0/3] Update SRC_URI
Date: Tue,  5 Nov 2024 18:01:02 +0000
Message-Id: <20241105180105.4721-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113510

From: Minjae Kim <flowergom@gmail.com>

The archive URL has changed slightly. add missing locations

Minjae Kim (3):
  xml-commons-resolver: fix SRC_URI
  xalan-j: update SRC_URI
  avalon-framework-api: update SRC_URI

 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb   | 2 +-
 recipes-core/xalan-j/xalan-j_2.7.1.bb                   | 2 +-
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1


