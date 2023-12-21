Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5981CC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:27:00 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.1442.1703183218757973063
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35fd9e40039so1394655ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183217; x=1703788017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH1eeYPEFLCsgK47R1uxEuiizKGSJTgn9DVpHmXvI38=;
        b=PgUyBMCzzvoeo/Cm50taIBE/eoBEzxUSvf3Itp9k3KQ+Z/dDPD5g36SQdd4cDhbORq
         WsH3RuALJ8rsSSno+d+w9Z3STrcqbVD4UAkthAvS6Tr9GpITh0jAGxfOracne/oUxFYn
         PHgCHH6OhbqCjBWiTWY5Oh3TEWiYspk++t7AXF59jR1B+b4Y5F2h29zvLzdob2VGChqI
         idd+timxCPcD8EK6y8wlHHUYj1g8ZGJRUHCD2hNO7U7ZJ7UaXZ0X18nQlioTFyrx+zOF
         kve8yVOqyDyU+8U5KmWPjLKbk6vu/K52Q0T8ReByZJy3IQPt2T3O/sRAZt+6btkgz64o
         ZzBg==
X-Gm-Message-State: AOJu0YzgYb/+1CJX6QQs1gOEqiYgGbvQ1imQe4ZaQZEzyJzkqfTK2Dck
	S9TO3aBVtre/n/m39EvI73uMUZ2lXDF+ZA==
X-Google-Smtp-Source: AGHT+IHvrW9Qshr6XuFK2D8LdV79B0IN7DXcCYp87sSMNTSSpJ1172S/4zAiHCxyTXGJkAjCUaT6DA==
X-Received: by 2002:a05:6e02:19c5:b0:35f:b06b:2f7b with SMTP id r5-20020a056e0219c500b0035fb06b2f7bmr80934ill.34.1703183217123;
        Thu, 21 Dec 2023 10:26:57 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cv4-20020a056638498400b0046ce4d93d49sm618277jab.107.2023.12.21.10.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:26:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-flask-wtf: fix upstream uri and version check
Date: Thu, 21 Dec 2023 18:26:48 +0000
Message-Id: <20231221182648.3921326-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107732

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
index 54d7bd637..973bb570b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 SRC_URI[sha256sum] = "8bb269eb9bb46b87e7c8233d7e7debdf1f8b74bf90cc1789988c29b37a97b695"
 
 PYPI_PACKAGE = "flask_wtf"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask-WTF"
+UPSTREAM_CHECK_REGEX = "/Flask-WTF/(?P<pver>(\d+[\.\-_]*)+)"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


