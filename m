Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C54AC4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 12:33:30 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.5844.1698842003497270562
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 05:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=b2KASnXY;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.54, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-66d0169cf43so43633986d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698842002; x=1699446802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+lb3J1tmLFZDcqPrP74kc53BGC2BBskiKcRLj+pPSw=;
        b=b2KASnXYTzRqPWDM1anuOswhKL1XmAvLpygAPf74I7Bx94beOC018v3IhasbcJvqDm
         y7kvFV2hJqZWSo6sI0ydkq4SzsHeKcctVzrvBsNqw2Lekn1+ar5sR6jRkswBmGIzzoqY
         EEUpLTzMoUKhWEvULQ+lsIvqbdFOkVOuFZaJD51cpB23KBUMvrtZV/gQLvgTN85KMHhV
         H4N1y0vQo+/o6ca4jaFUeO4xil6pdckRpMa6zXG3HyroMT3IrxCgpNjxj9QxZOcSwaVc
         tkOuXlJJBs2uGJCd81TC30ytK67j91iiFXMOnkO5yLcrE8aJ+kZ0oegudzCM+PtVGkFL
         rNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842002; x=1699446802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+lb3J1tmLFZDcqPrP74kc53BGC2BBskiKcRLj+pPSw=;
        b=pTi+f4RItkRqeoePNlBBjEibF7at8YF6ZbYRMBSbFUa3PFeLTSs8pFK+yz+cQ9PC4e
         ZH6PfUv/pRzc3OrA81CRseQnrjoUX+G6NE35iRQjnZ0X7fsrqrzA/5INMK7JIvP80A3W
         9ynyixaOH8E4Z3mlfP0E7vfLbx3CoXvaFA/ErMDeQrZ1GdcE9GfVgLrCoytuSic6fzbs
         ITSbF95en2H+EgN38vSIBuDfjIoiTgT8u42j+djzcPff/1NvmWN9MSv1n/4QQZ49Mw0a
         jnqFaQ2GGF2YsBCR3NYzUmSHUESOHFCW+rJHmTjDFx3ZT4cMe3R4M4bjDbhSOvU/UgCm
         OPMA==
X-Gm-Message-State: AOJu0YykmuWUkGCJEMgxKxY8AKmFVJc8fFqm54wDlNM5mJEteRgVVXmt
	as87wAcC9OdU5BWWsJSibh5P3tkyRM231Dbwfo0DZA==
X-Google-Smtp-Source: AGHT+IGjECX4mm/sBgr5UvFA2V1iylAuRnvmN2EHghRNW/zsEd2m3pZxvmUMKSwDfYKPia4LC9CtNA==
X-Received: by 2002:a05:6214:1313:b0:656:4712:af9f with SMTP id pn19-20020a056214131300b006564712af9fmr22368159qvb.13.1698842001735;
        Wed, 01 Nov 2023 05:33:21 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id i5-20020ad44ba5000000b0065b22afe53csm1422601qvw.94.2023.11.01.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 05:33:21 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 0/3] Branch Name: topic-add-python-recipes
Date: Wed,  1 Nov 2023 09:33:14 -0300
Message-Id: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 12:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105815

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
 .../python/python3-zopeevent_5.0.bb                 |  8 ++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb

-- 
2.39.2


