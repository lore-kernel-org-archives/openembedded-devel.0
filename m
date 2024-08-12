Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467EDC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 03:29:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.38307.1723433330102859950
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 20:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Vmk3c701;
 spf=pass (domain: konsulko.com, ip: 209.85.210.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso3540838b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 20:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723433329; x=1724038129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPFCSPo78Rjws6fmVrGttJ7BvBZCu44J23web9BOPss=;
        b=Vmk3c701cIgBMmRIIDcEhvt/1V3QrYXE0UQagBFeKc26hW17hQqfMGiJEq7RoGmtHD
         dsT6swXIjLBGbxLFuOy7dFgG4D/CwYc2X2OZQrdiOL5MPdfr55XEVgh/pDjacw6kmyB7
         3WFHtcuGxCilOPYjEE9ji+7Zib5W1+Az29iEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723433329; x=1724038129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPFCSPo78Rjws6fmVrGttJ7BvBZCu44J23web9BOPss=;
        b=mCPyGstAIVttLyNqhZTCTb3UrkrBAB8CWTA0FboDkw9Y8BY9qpAvkA0V+oL24OIEd9
         I9TlMFKXbTBQWm3hST8bIJjgQd0adn4DNCT3aBl3di+/8lxL4UtPhXxkKwIrf8PUIo7P
         MheAhRfK2HgFbejMg2muw2MsuaJEAgzIjUXMV//Hwy24/lvidi251aDaZXWyHKNJlh/E
         eQPZdoGqmE8icj0q9RsOnrAx1pF7/696qQYHJvO/IhiFogBIgmdBIbbS6Eq0w9DPOXwI
         qPDLsnwjr/vo423D32csTZk9u91nGiGFj+KBwT8nWQJO2SOYim6JM98+mNAClbfnOLu0
         hv4g==
X-Gm-Message-State: AOJu0YxaV7LH4MDPU22k2T06xL+M0kiyuw2n4C3g6pM0ruxBvN7f+q6j
	pRAop3A44/Sg/cFscDeJgKY7hL9VMcFwT/ELk8XrX/+05H/CCWvJe/IqB96uqtfpJImDTwn0oQ2
	Lsis=
X-Google-Smtp-Source: AGHT+IGjX2yM4BS1D9byxjy9hDT9TGc1ERVZB5KL5mI8b/4Y+UKEKFWYEcJ8+HAwhO9khhcVblrHvQ==
X-Received: by 2002:a05:6a20:9f8d:b0:1c3:b47d:d53f with SMTP id adf61e73a8af0-1c89fee77a0mr11679914637.25.1723433329116;
        Sun, 11 Aug 2024 20:28:49 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9fa774sm28197115ad.191.2024.08.11.20.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:28:48 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [scarthgap][meta-python][PATCH 6/6] python3-pydantic-core: add missing RDEPENDS for ptest
Date: Sun, 11 Aug 2024 20:28:14 -0700
Message-ID: <176f2966ba38eb74132ff083503288e7d6588599.1723432397.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723432397.git.tim.orling@konsulko.com>
References: <cover.1723432397.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 03:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111764

From: Frank de Brabander <debrabander@gmail.com>

Signed-off-by: Frank de Brabander <debrabander@gmail.com>

Add missing RDEPENDS for ptest:
- python3-zoneinfo
- tzdata

Similar to fixes in Styhead 110b636836348530ec4965ebd3ee753928f21b44 but for 2.18.4
and without needing to add the python3-tzdata recipe.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.18.4.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
index 58afc6cd1c..adaf4a62cb 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
@@ -37,6 +37,8 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytest-timeout \
     python3-pytest-benchmark \
     python3-unittest-automake-output \
+	python3-zoneinfo \
+	tzdata \
 "
 
 do_install:append() {
-- 
2.46.0


