Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF32C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 12:33:30 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.5847.1698842007673288392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 05:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=WB6DApBA;
 spf=pass (domain: ossystems.com.br, ip: 209.85.167.174, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b2f507c03cso3588520b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698842006; x=1699446806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z625Rh6v0Z1hCTe7v0G2rueBJ60MUjuVszitCEu7Og8=;
        b=WB6DApBASO0dOPreJatIc6GIajkzThszCqpbkc2CEuezrXMBLk2FMXNwNEfCQRiLhN
         M3EJv9wt9gQ7myPCRFTQMPAGZN4dAGFQWIC/c5s5Z9NZJ8DBJAx9lXOU24rpyFbEGt7C
         Zzo1pU+m2/0z0N0WYfycfCikRn5IURTEV3cMRx6EdkuSJPbccT/EnfojEwhadHx1xM5B
         7S6X3Sjmj7zQWv1NUxKVxqaTxGFLeLkLxK5+DnlZcKlCUWV0IeQ6k1JbsczfiucIBTh4
         Lo1Z2xkQ5qrFFmL7iorqiSohpKd6I2E0GtSDM2ysQhgmGanE6gQ3cjSII4U+7nxmBxp5
         5vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842006; x=1699446806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z625Rh6v0Z1hCTe7v0G2rueBJ60MUjuVszitCEu7Og8=;
        b=UdfF2BJt4UNs37GpbuKCiVAbIp6KY4w5qlHgiXNlsXEDd3dkj8dticJ8vXbe9UeXlG
         lOSooM/uiP242eAOX4MWH9EEY8ao1TnGF7kFnXhzOBz5G84xnrhcivttglJmuzzudXA+
         ISaIQe1JccLZEXVNX1nzXXMSqCVk7TPKkuW+SN7fWOrIOqW/dVchl+uOOqTP0IzgdL+u
         +e63sFT52sSYGmOdXLE5mbiL0E3vfMEnirVHrmkvI5p2/WmDli75al/ceeqUJhGa1Tmq
         NGGDIrt/hps2Yv4A0qllWOcrKoDq7M6ZYj/+whsg3wzNnH8jPFtdxixY8OgWOLR1P3/1
         BFyg==
X-Gm-Message-State: AOJu0Yx3olU6pCl1Gu1ogn/F7eA6CaZa6o1002+wfVKFZUhIQLxlo560
	pnb3VLkRfTD9IU3bp772ZSjFIweqARgKJP5pCrb1/Q==
X-Google-Smtp-Source: AGHT+IGHfsFMfI6r7QxyOCX5KDM0xBQZ+L58liAxb4kbCCn0algqWE9YsMOTkzOL1s80BCXLTTDP/Q==
X-Received: by 2002:aca:1115:0:b0:3b5:6599:ce4c with SMTP id 21-20020aca1115000000b003b56599ce4cmr4186872oir.57.1698842006452;
        Wed, 01 Nov 2023 05:33:26 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id i5-20020ad44ba5000000b0065b22afe53csm1422601qvw.94.2023.11.01.05.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 05:33:26 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 3/3] python3-zopeevent: Add Zope.Event Python Recipe
Date: Wed,  1 Nov 2023 09:33:17 -0300
Message-Id: <20231101123317.1806460-4-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br>
References: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 12:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105818

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit adds the python3-zopeevent recipe, which provides a simple event
system. It is licensed under ZPL-2.1.
---
 .../recipes-devtools/python/python3-zopeevent_5.0.bb      | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
new file mode 100644
index 000000000..1955ef4bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "The zope.event package provides a simple event system"
+
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=72092419572155ddc2d4fb7631c63dd3"
+
+SRC_URI[sha256sum] = "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda6955f96bb9b91e67cd"
+
+inherit pypi setuptools3
-- 
2.39.2


