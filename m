Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFD2CCD187
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:37 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.7959.1759409971198350787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wv84wDi/;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so1499458a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409969; x=1760014769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IB4MeeoATHlVCCJy+7ZglNEhMndET6cv+H3CmNMcaE=;
        b=Wv84wDi/M8qSqhwbfA+oT8F4A2eS+fw/uu3WmlyYsk4l90G9tEORjDsLJQ/+RRyYAo
         yg1V6itJKMTJ3WM7ghFICFSqvE4reP2ixTai05Q6tO8FIsakqcveuFvnWKCu1noXhrpx
         bp7BzoFAs+bUnUyRY1B4CcIR6pnDJjjVvGVCh6KMsn8LIn0H1Mjj0jSFQV5FrEkw4zOD
         Vmf+y4Z/14yv5yemgo7MgpbgvfZ+svz4YcWBrKd/BAh5OOH4n0khpNUsrCKyCg3pCxYB
         Eu/TLa71d6NhoKn/B+tB8dGzVGj7av6Mdn1EZvQHh0Mh2FRYdNs9bcycGyRPkBhpell9
         kcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409969; x=1760014769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IB4MeeoATHlVCCJy+7ZglNEhMndET6cv+H3CmNMcaE=;
        b=TUDiwZsgLP1Ki85IqwPpHOfEfAH0veNffiBZD5ePJKFHy+DvhKG515w8jhw8cJbKJm
         lvqLtP6+9iaaovvjB/wwIno6AifrknJkHuNVupP4HbMPByGNN5Ygu3OE1y3ugg8ChNDc
         tdlCuoXyzO+uiPXMvXEhGzwnl+HKoKn76LiUuT5ZvoO6ZiK23hGV9iMIAFrXoZfuzeeo
         yCH33BXjjYAlRhul2P80kcdp0eXedOGMcxdjAwQdNWqJvrNXq21PG62IGHZ1lZlG8GFT
         me7Q7pG8wDXAtsgQ13gePE0TaIvojgf+FUzSed15y4qEG6gmRpds6spuU/HhsWMrDAGS
         xcZw==
X-Gm-Message-State: AOJu0YwEt9lbaZOrU7J0ZuR97YMkP5gNi8gHkGbGnM/nAX5m3O23E0cU
	dmGQ/jT7sQP2mfEAgteBPk1Snww8NrZonlv6LeYkYLqiSZhM53WN9rm+oS6Oxw==
X-Gm-Gg: ASbGncvWa63KJlNmz3KcdqV82uFN15OjS7zS/zSlwfSlp2EEAbAlQXa9t0AwaxdrY+Z
	qYmf6yXOOBQzTFV3sknFxdQQnTAdcWDcRgEADERNVOvmdyaleawhaKRKT8ZaGBZPr/KIJARrBJP
	yvMfetJUGyvpfuQqu4IDF696xrxPYoik9pFzyOj1A7zOsnFz4T85h3biQpae8uklrfkf3jZlMsO
	pLwO/gl8TsrNYfUfyR6tYPvXVFc7hcRfjDpYBQgklkP+xxKF5geVd/D0l7pPVG6f0S97sGmbUG9
	qRgAiJ4zEZBCJek2mpls7HnEAbG6akOiZDjbx2l46hJg7Uf9ZslhEnS50sDOhCDg1DtW6XI9/vv
	nbypIjoRZSI27FtTyEo7JH1Gg//w3SBBDmOBKofdml5/I9Bo6cTVbnSk=
X-Google-Smtp-Source: AGHT+IFWC3qI4SnnQ+DCdykyeNJjtb81BoIdScS+z3EOui3EH+ITTTOZEkw+FxdD6tNexvP+4DwzLw==
X-Received: by 2002:a17:906:b2d0:b0:b41:a571:21b0 with SMTP id a640c23a62f3a-b46e889561fmr666072266b.39.1759409969434;
        Thu, 02 Oct 2025 05:59:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 02/26] libjs-jquery-icheck: Correct LIC_FILES_CHKSUM
Date: Thu,  2 Oct 2025 14:59:02 +0200
Message-ID: <20251002125926.2624522-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120171

From: Peter Kjellerstedt <pkj@axis.com>

Only include the lines from icheck.js that cover the copyright and the
license text.

License-Update: Only include the relevant parts of icheck.js
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1bced739968a68ed2743d011cd82791d380678b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
index 31c3534b88..63dfc6fa78 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
@@ -3,7 +3,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://fronteed.com/iCheck"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://icheck.js;start_line=1;end_line=8;md5=404078d7de9f05ed64d364274f790055"
+LIC_FILES_CHKSUM = "file://icheck.js;beginline=6;endline=7;md5=ea25eee37fc3b14403e215bfe13564bc"
 
 SRC_URI = "git://github.com/fronteed/icheck.git;protocol=https;branch=${PV}"
 

