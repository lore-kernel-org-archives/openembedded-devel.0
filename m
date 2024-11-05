Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE17D3612B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.27768.1730831939198487143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHsn+FHk;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea07d119b7so47381907b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831938; x=1731436738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL0WxlrFudKAMNkcYq5WpymVmT441iVqWl/sjTHKDVY=;
        b=DHsn+FHkhv7QHQP+UKb9u14pIoT1SL/WnRp0V1b2780/Tn+WpfMlEsHqr/nvEzLGgc
         bUAwOQiagoEf/Skie9+IR9TqhmgeoaJ7Ce2AQzVCGC99qxoRrnIcu1l/imHk1JZ/uV47
         OP+kPlHPgDFDG5/2yQZJxBpaY1Qysdtv8Rs7dAfk7r7hBGqKaYf+YgtovMwJgrQ6yN/F
         rtc3cBGfP9UbO9uq1NW/unP2LR5KfkQdiddjT5yv/UjvLpuq/2u2ZivIHH/MSvNdlCO+
         WAE/I3uBBOPfiG8mTvDuOIi/7Fr8N4pIlmawJ5LgCknGVLH3cyzqfMNM17PQAhkoB31F
         qwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831938; x=1731436738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL0WxlrFudKAMNkcYq5WpymVmT441iVqWl/sjTHKDVY=;
        b=jEVGzbhhbS8XZC5BRCIuyUOV5qmC7Iv78kIYj8cli2Jq8Au5aYj1tlqOyIHXziytbS
         eoKNhukef67NlUkLsy7hpXJZtg1b2uPFd2MqrWqTiz4qxsAP8/vFAKBPiXPShEhH719M
         X0IwcBS161vCEWHThLVODOnjFpcWBlMWbIbdU/WoMkDypoPrADhc8ysVQT5rq549LuXp
         Y4vRSXGKDhrpdTdNPGUhUGQxKnJzDPT7r2Dd+6ckrL7pM7KyhT9GAf0aoCHHqtCzdx9Q
         3YtwxcWzV6whjzGvfFsZ8Xu09GA1X5uIPCuHV08gKieyzrETfoF2iIz7whwT22dymrw0
         2jNg==
X-Gm-Message-State: AOJu0Yx22JaUN+vrh1SWeP4bvRLDA8DqgiszLAWMx2asd7wv9sUhCA44
	dxA0YWJtwJ2vJ4eizd/6T+bR0AdAlnfkfB9eRdiLsWur0Lk7yPe3f7ZHzwZc
X-Google-Smtp-Source: AGHT+IFLrnylvS90TbUaEhSVfcOwM+YCh/uWPa14CM2VJJO3VTpVDIMStmNjPZYf01DjyWuRvyuduw==
X-Received: by 2002:a05:690c:4801:b0:6ea:4f61:30ee with SMTP id 00721157ae682-6ea4f613773mr232096777b3.37.1730831937978;
        Tue, 05 Nov 2024 10:38:57 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:57 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 073/161] libsdl2-net: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:49 -0500
Message-ID: <20241105183658.34982-75-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113588

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
index 35369e873..d1f890576 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
@@ -12,7 +12,6 @@ inherit autotools pkgconfig
 
 DEPENDS = "libsdl2"
 
-SRC_URI[md5sum] = "5c1d9d1cfa63301b141cb5c0de2ea7c4"
 SRC_URI[sha256sum] = "15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21"
 
 do_configure:prepend() {
-- 
2.43.0


