Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC50C4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 17:36:03 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.1994.1698773759902491064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 10:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=aS2i62jK;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.171, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-41b7fd8f458so36962811cf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698773758; x=1699378558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENBDQntfQju3raStsgwUcUeEtFo25DoeyxgbpaH1PPo=;
        b=aS2i62jKM/1Vlzhijs01xFQP0MYY3KIOx08hZPOcPi2Y7obGeG6PFWSmmlGGNHynfF
         /QgAX8JpWvtihqrlHx05DZxnQyIhWI3y88zoxFqvHVEBn2pPbTRA7vS17CxNjjEf9mFD
         7KRT+JWIPfvaz/u5BXbaA2EteydcdYmrAltL7Qprm0Ph81muMYYtpHgHLxoRiMpjwXD5
         1LMMarRYWuQNgWM60KPT7kHSzldf1V/fG49AIlbPPQH+9jwYqzFcArkTehfqK4348rxG
         YzUwY+eB0R+6b/O8kS4ygBt0cKRyXPpnOz9Jf4dY0huuuC50DukTLPJhDTicfimwJ7eA
         viuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698773758; x=1699378558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENBDQntfQju3raStsgwUcUeEtFo25DoeyxgbpaH1PPo=;
        b=aisPg8vzCHLEDachh+EJyOxvaIpn5Zmnhc50pvplRa44Vuj2zr4H7fCeTnSg2qcBKU
         jDLbDEHQveNke2USGFn2KuPANgYUEXfZrBKaQM3ErGWWp/4Bmbx/VSKIf7KW1xIusuI5
         ncKp9EU2L1eXpxlduQQf8ZP6fm33lNjLByOxcOaQXGnx5QPo270Nqa//9Dhfv4Nc7qRc
         eJ4Nq/gSg99H/ibQ8zC6ue9MrhaWaKCa9/PIZi37OjficQI8NYebFYdjaNB16NdhKODa
         wmTulbq6oifOFX1S4Mh62n3vLh3Oxvcjt707Y1C1bsS/Pu2fdhHKBwHZxD0PAtgWq6IC
         MEEw==
X-Gm-Message-State: AOJu0YwOlXnsVL8uEXZaaNonfdegC0l9U8K5/T0tO28mxAfVWEqG/Hq0
	UbSjtyNFyXNu77l76v6OMoRpmfhBFjX9Gz/9E2LE3A==
X-Google-Smtp-Source: AGHT+IEtRsOEJcM9FykPVPyz0zraDxKULWm0BjWJuFb/T2cOUxtmps/u6zKfb9JW9pbUlCCSs83mOg==
X-Received: by 2002:ac8:5e4c:0:b0:405:5679:463a with SMTP id i12-20020ac85e4c000000b004055679463amr15644732qtx.0.1698773758326;
        Tue, 31 Oct 2023 10:35:58 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id e26-20020ac8671a000000b00417f330026bsm679984qtp.49.2023.10.31.10.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:35:57 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 0/3] Branch Name: topic-add-python-recipes
Date: Tue, 31 Oct 2023 14:35:51 -0300
Message-Id: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 17:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105803

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
  python3-zope.event: Add Zope.Event Python Recipe

 .../python/python3-flask-restx_1.2.0.bb             | 13 +++++++++++++
 .../python/python3-objectpath_0.6.1.bb              |  9 +++++++++
 .../python/python3-zope.event_5.0.bb                |  8 ++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-zope.event_5.0.bb

-- 
2.39.2


