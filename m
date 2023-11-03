Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16F6C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:10:45 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.51458.1699017042513684168
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=hKowApVV;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.177, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5b499b18b28so24795067b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1699017041; x=1699621841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kivqb7UJ8ZRxY1jwjILp+s35lrGIWTXmpgqPqfzKCVc=;
        b=hKowApVVi373M76CwwUhN8DrePrzBzw09p1S/lReL2bAGeHGGc89jgjbXIqYz9nc54
         vurWXi4feH+77L31cPDHDY776db3V3+yhURaNuXPqZzzsXy0yTNSrRjsT6iKxl00Rlni
         O6O0ICtl8wR9qW96ZgPmAfxFiaPL0VOI26qNLPZ1109v7GMbjqTxDOhuGlp9C5/tsWkP
         94TH/pcIz26kaUyAhNSgEkGI/Ih/kNeC/fMXCfwT+nN1iCMZ64m5p7Lh7z/0S9y+xHsg
         2u931lbg2kYpPFeV+waGrbCPIOGaoA4dboSepwfvsK1jbfeXp0++zyY/VNra7WV5c0Jj
         uozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699017041; x=1699621841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kivqb7UJ8ZRxY1jwjILp+s35lrGIWTXmpgqPqfzKCVc=;
        b=Z46qmuAL3w5hbk2hUq20APy5adJxOpGjcnyHbKDdNN5hb98Pwj8e8FrJDrdnZBrGOx
         MF4iJuhaptx6Jf1z32VPXlS8xKMFo9Kzy79Klc0Hhr6seHPcwFo2GvxpljRGB+UNl4ZQ
         LDInp4mPZwz8XpZloPwHWGl33TxWpoyK1VLJh4WxRqOdZBHOfPX8A71SBPNFc3BC5W+0
         eQqZgPzr/51gEM8MYs7HlY7XXn/bLeBiASOUVRerHo4crKCjr1QCgt85ciQgekmdJo0+
         c9Zxwr+TU8QMQDoBUhUaLAdGLNabZJ39+Lx6Pf2tcI8kW4SN56ywXeopBTl3z/MpE3lv
         z8GA==
X-Gm-Message-State: AOJu0YxhU8xGuCygk+tBm/WKHyJP/T5jXcj5A+YKO8UvhyHKgtSHgjvY
	S2jZemjCSUJp0qV7rhnlbg2VchGshJCL+UFuD/t1fA==
X-Google-Smtp-Source: AGHT+IF+piqpFfFV2t1TFOSp96xsGz33v3ZHR4yWGcycssfdBBzuCfrNlmyMjr6ZEgHq9uivMwexPQ==
X-Received: by 2002:a81:830a:0:b0:59f:519e:3e9a with SMTP id t10-20020a81830a000000b0059f519e3e9amr2663989ywf.20.1699017041006;
        Fri, 03 Nov 2023 06:10:41 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id z145-20020a0dd797000000b005a0f9718a5fsm894927ywd.78.2023.11.03.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:10:40 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 0/3] Branch Name: topic-add-python-recipes
Date: Fri,  3 Nov 2023 10:10:34 -0300
Message-Id: <20231103131037.2997335-1-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105857

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

Description: This branch introduces three new Python recipes for the
meta-openembedded layer. The recipes include python3-flask-restx,
python3-objectpath, and python3-zope.event. These recipes are aimed at
extending the capabilities of Yocto by adding support for various Python
packages. Each recipe is accompanied by a commit log that follows the
established standards for commit messages. This branch enhances the
meta-openembedded layer with valuable Python packages, expanding its utility
for embedded system development.

Commit Logs:

1. "python3-zopeevent: Add Zope.Event Python Recipe"
   - This commit adds the Python recipe for Zope.Event, which provides a simple
   event system.
   - It is licensed under ZPL-2.1.

2. "python3-objectpath: Add ObjectPath Python Recipe"
   - This commit adds the Python recipe for ObjectPath, an agile NoSQL query
   language for semi-structured data.
   - It is licensed under MIT.

3. "python3-flask-restx: Add Flask-RestX Python Recipe"
   - This commit adds the Python recipe for Flask-RestX, a fully featured
   framework for fast, easy, and documented API development with Flask.
   - It is licensed under BSD-3.

Each recipe contributes to the richness of Python libraries available for
Yocto, enhancing its capabilities for embedded development.

Arthur Oliveira (3):
  python3-flask-restx: Add Flask-RestX Python Recipe
  python3-objectpath: Add ObjectPath Python Recipe
  python3-zopeevent: Add Zope.Event Python Recipe

 .../python/python3-flask-restx_1.2.0.bb             | 13 +++++++++++++
 .../python/python3-objectpath_0.6.1.bb              |  9 +++++++++
 .../python/python3-zopeevent_5.0.bb                 | 10 ++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb

-- 
2.39.2


