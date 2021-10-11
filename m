Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE2AC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:01 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2739.1633977720516755271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CD0zrsAX;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m22so59254126wrb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E4PCV3ftZWrq3pxCmPCbztrOONSHQpojLPgHLRKVT78=;
        b=CD0zrsAXP2lURgu9Mqebg/ScV6KrLC+yhYVf6oqxWQIlHG5c62/5QgBm60equLcVGB
         0Mnb+8itEXvY8jNrOcPZgk1cKvodK9dL9kfWuUsnwq19nZEoUxstNm555DEuakYwWCs7
         PI3e9z/Gu1aoMzX8u4sImD7Eq7Klfn2J5MYs83XOQyMvIcNLmqBZy9idG8w5fg/XcjcX
         ookSxtMJZHsuQ5LwU75HFZUP9ItF0fsA0h7f/pH5r/3KUfEc/wUzFfXzmZB4mwzlbOHV
         eyyHaWPJ2kMAPFot5Wfsu9YdGIGpU9rTSjaFEZKZQAoHgnFuzv/AdZfejUrRCLaQOGox
         xWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E4PCV3ftZWrq3pxCmPCbztrOONSHQpojLPgHLRKVT78=;
        b=zsVBKR3NJduwCObmDwY2VrjUK9Tzqexl8d5VgJm3ojRRV+n/mBFEjE4ki0UqTDJMAL
         ETv4m7xr7yYxKArBcgOYl6naGUVqZBnIY7IP86G6ImuE0b3Ogol8vDFFQIVJjzhz3nJT
         XDtY/pJOh3lwuZV2Ob8lVoHVoFxYG9F0uC6M1ICWESZVs+ql76TTFvdGiMhi+Ab6/v2J
         smpi35hArP2zH7c5saqW4Nhm1fxpMtbQeQxEV8VbHTsuOSF7GJAquDPM/tqucVN/OuVn
         n8qeTtzvXUe7gV/HMJtj1wnaWat2fDokiS1pmjt4CNFUOg7LXs7sqFGGaMFP/6nBwqSX
         D0mw==
X-Gm-Message-State: AOAM532qcr4rxmmXbBdKj3Y3q7+vGOdEgAxzE+bxZ6I/0KPIhDuqKVyA
	HSigHmgMdqkcyrzVI8/uL2Mdt/3Mj2tlIg==
X-Google-Smtp-Source: 
 ABdhPJxjo+HODd1ao1PTrcCLm0P2B856eudqriK67yVV55hjF+SXZk8FGq5JL/VlJo+iomP0Zjh1qg==
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr4943337wry.422.1633977719130;
        Mon, 11 Oct 2021 11:41:59 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/24] boinc-client: blacklist due to openssl 3.x
 incompatibility
Date: Mon, 11 Oct 2021 20:41:33 +0200
Message-Id: <20211011184140.653609-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93231

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
index 0acd09995..79aaad9d8 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
@@ -16,6 +16,7 @@ global warming, discover sources of gravitational waves, and many other types \
 of scientific and mathematical research."
 
 HOMEPAGE = "http://boinc.berkeley.edu/"
+PNBLACKLIST[boinc-client] ?= "Needs porting to openssl 3.x"
 LICENSE = "LGPLv2+ & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
-- 
2.20.1


