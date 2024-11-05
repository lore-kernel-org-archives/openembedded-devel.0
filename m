Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D058D40CF8
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.31029.1730840568985139705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dwUaklVe;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so6047971276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840568; x=1731445368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPv5vxUp5HyuhMOn1MBNcWU83DO7L1SDsjnSjbpApXU=;
        b=dwUaklVeGFQqS9eqaPNAAygrxmFGccIDecs7jZng0de22cFb6A8/epo49mxurT3t8u
         KZw1Ltg3FgiNwSmMySBGyUP4Jk7Xr75wQAGY16x8jvMwGo8xONWb9RRu9fQ/d7Cu71ne
         3R5vQsJ7V0G+A3zhAZ3DyQMAbhsJIcoZiWIL8q+Za1/hllfkPZxBXwjzoFcEh27v+91l
         ecGQeQpq9ubxQLzWHKLlRNcFs/n0dpFYQEfn+S8e2li2djc4gFyAYuIQQE2dQwYC6J4Q
         ZWwUuyivCRlSCu4tigfNPQeKNtRstEpJzz2XS4T8GAiqB5o79CIEqZiBvVKhIM71ZfIY
         WroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840568; x=1731445368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPv5vxUp5HyuhMOn1MBNcWU83DO7L1SDsjnSjbpApXU=;
        b=OJC/8qiMqSTzjls0Wr8g0kWGxrPdcuAytPisPCH094urT6J9tCw0euOQYK+M9ZMMJq
         SMiIOaV06OM9kjUGcrnz/GW3DvVLxvBZeuHtRUlg0NSdoaV2kMZkjJRpbhCde5U2cANn
         +x3VzJsMDJqAXm8Ncn43RqXZu8vt0lRYMrBZgGdXe6zXL50YGh50y5CEEAPUxCuQszC9
         UvyK97nXxDO2og9Uc/D+BHU7TnGcrvh3PnsYDAGrndwrb1RhMRf6MkIbXELBCjs4uI+f
         fhi2AFE4m1XR9nFrjAQeX+6E6sVwTUXAk5GMICTPF3AyklhEQYX4Dzrz3ySsXLHBsqyj
         10eA==
X-Gm-Message-State: AOJu0YwxOBf28Qb3lvilx2lOo01kB9Iu35mMgHrezGr7wVypS/6aNWyX
	5PoVe4t4BsZYOJG4Z/QOa3U3Z7wYvUuDVRqFo5k54NMoZ9fZJxbf0iVFbGI4
X-Google-Smtp-Source: AGHT+IG5oEcKJXkyibnSid+JJTTiYqwA1a6ujaQ+BzLU6NM4E2CwEEBdd6OFmXeMZtuDI+A4V5T7qQ==
X-Received: by 2002:a05:690c:f89:b0:6ea:8b94:6c15 with SMTP id 00721157ae682-6ea8b947204mr95139517b3.24.1730840567687;
        Tue, 05 Nov 2024 13:02:47 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:02:47 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 158/161] zile: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:04 -0500
Message-ID: <20241105204707.4155-158-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113674

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/zile/zile_2.4.15.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.15.bb b/meta-oe/recipes-support/zile/zile_2.4.15.bb
index e86b3f82d..d7973ab86 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.15.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.15.bb
@@ -9,7 +9,6 @@ SRC_URI = "${GNU_MIRROR}/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-SRC_URI[md5sum] = "05efa90dfee1821ca018b0b2ef8f50a8"
 SRC_URI[sha256sum] = "39c300a34f78c37ba67793cf74685935a15568e14237a3a66fda8fcf40e3035e"
 
 inherit autotools pkgconfig
-- 
2.43.0


