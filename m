Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06875CD13D9
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27293.1762704033202165227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eKDkM9Cu;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3108f41fso479058f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704032; x=1763308832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldqcSJ/sDQ+QSHOts6+MFqIF/N3NEypW2z7m0XLB3NE=;
        b=eKDkM9CubdKjq3rhh+Urh6+f0bn7bpDnrzbrKVRFgr7Pz/5iY6GHd9WEkCZOejEDnu
         0KdqqFC9V0NmB3PKvsLQgJfeIeVR45T9R5zw5LbotCQK9v3VTCHgRFaikNWJcfjMSGyJ
         Ha9/+/99AznawI6QTAA090fgMhCGZl+yX0C2DLeAjt+fiJGvusaK9xPRW4Ts4HnaefaG
         DalOmMyIgTuCcdpgj9lMdfB+f2hTD0OOSU+vkjw7OyisYtqg4+XLaeNmnDQBUL/TZccN
         13MyaICo+3mVQZLM9MzKxjNnmjuKkzbRfit8UGSkA3LXbgPmcTK+vT19yv5qLL62p93O
         +PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704032; x=1763308832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ldqcSJ/sDQ+QSHOts6+MFqIF/N3NEypW2z7m0XLB3NE=;
        b=S1i1haNpgw8qM+iOf7vWpV9OQWbJEfS2t5eAIFyF6rJr6XKiaWBycBQA42X35NA7id
         2TN+Cuy5uaM2LQymByf8QvMcKo4DUIeuU0U1XxdBi0A0GArh38QSDw0vjG+uI8nlrX4o
         PlX2rqfbb2AloIFoI8qxaZBKFXY15zhqmvktfgNYsKyGfUVk1tyFQXdARIclPan4j42/
         Qid1MUxKKsRWrnSPos5D1PQCbBpfiBU2KWFt1myqq1P7xj4+U5SXIOyNaxWEl57hkWvY
         PU/MVpoZVU/DsUVwYwKTH5Sk9K3KJMlEb5bq/U3mieJEY6WOIRxkdCZMCJwlpb+4J5PR
         2HMg==
X-Gm-Message-State: AOJu0YzYzeVcM11bygsZ1IldxD5nFEKvZOr8viqRuCmN/GkRMeli9f7b
	ppwuL4zOKW68rFPnzO8/KNXXgZo/qtEFS0+NieLSFk7zdO/SPE7VWHTIbEmARba6
X-Gm-Gg: ASbGncu/YB/AmuwefczxjYoAhhrGTDoPyzO4Ha+Kthe0M/GGEwcGcPt78jeEpCRt0u7
	RnY3xidSmv87sm4YHGXToZUEnFFWDKYKU4zuTg5IezeXJNsBCIIVw1mIjhtKA4Q0vBFY9I4tstI
	/zvcU2maAcogiSE4TDEBPOR7Il/5utl+s+gxSsoaioq+bbek33uObvvgu3q7jJjVDQy1g2XVlB7
	W+1y9g8pTvwmQAT3Tpi4nQ7lgpInny2U9M56VBDwkxGJNUILdoWY5YAJ4hdoGynk7/p6Lal63Ra
	xmjy9+gWpPLTOmgaJPlUgGBP/Sd3lFNbBzwNaX2i9klHXF47W6o61qWag35gBm2l2BQT5FY/H9n
	SXQl5kAUPAT6SNu93lSZ0DJiKG/EienukgSFz4V+ql17EaMZbYR4MkBC5nmBE2YWxUpmp538crg
	==
X-Google-Smtp-Source: AGHT+IGSfy6TTKN4ljMJ5ROoBuNd+dMQ4Wlzg6eNOy1iP74FA4YzHdSoWdE09H9p1Hgmggoa71pDFA==
X-Received: by 2002:a05:6000:2dc9:b0:429:d391:642e with SMTP id ffacd0b85a97d-42b2dc33f44mr4107830f8f.30.1762704031532;
        Sun, 09 Nov 2025 08:00:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 10/27] xmlsec1: fix SRC_URI
Date: Sun,  9 Nov 2025 17:00:02 +0100
Message-ID: <20251109160020.2522353-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121426

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
index 64912c3b03..c65350672c 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 
 SECTION = "libs"
 
-SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PR}/${BP}.tar.gz \
+SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz \
            file://fix-ltmain.sh.patch \
            file://change-finding-path-of-nss.patch \
            file://makefile-ptest.patch \

