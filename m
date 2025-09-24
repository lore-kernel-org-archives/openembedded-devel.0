Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EBACAC5B6
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.11211.1758716946636675299
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lga6PSb/;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2e0513433bso455762266b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716945; x=1759321745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX3MO+ydUOgMivwnt01nysVpe0kLPPwrMCJevvYm3yA=;
        b=lga6PSb/yqtAdmy2dEJClZGSf06ddL0EYw8pIm4mjj0dL6pHzkkP93TjigdNsw0Dmz
         y2MwMMpGNXEqNqikoutrVt3tHoXdyPEDESsFoB29h6aSrNdkyO/ysIHUTV+i/loU5al+
         dbHrPf/49T+HBxlBtD0tDA/3uNFUxxH9DpQXGNBukft/thTmhRO+ArRAkkp+OWrP2U0v
         qH+y47dDvYOZuVrLdai8LoHenlQtFNAd1d6K3MfkIfFNa1mDVzJdPO9qeuqcRh1NKJ6z
         GH4tTZMcqdH1+GPhiW2bKsmcz7hXBV7pJUtEmQJDyEkKjuM86yewoN4vSpNPcJOW06gM
         WeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716945; x=1759321745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vX3MO+ydUOgMivwnt01nysVpe0kLPPwrMCJevvYm3yA=;
        b=maT9yG5SXAKyHF+g0i5BEvImbVjRzFh2BBwgexSIqQf3OpIq57E36ZkPfpv/BTFVAs
         eNGTAi/rp6KjIQhQBl2CHq/PaDqw0rHnKP3PgoFtQj3/bsQBhVr+Fu+bRB7RPxRGoME/
         TTO0ZBr0NxaH8tZZTzWGvAzmq4qbj6Z0G840I34z7YB9rqDnZFlwu7drAm/Zo+QoYNek
         hM0WOyIXG+j2W8ho+qXZvN/0E4l3uwgaqFZ2ZphlENAl5e/RgIZPeu1Xz3SFoj2UXJhf
         CAy/0W+vk4jLlUFS8mSJy1JBU41cgr43uA1nEp8a5ej4D37fKfLlsgIIbNZLcLB422e/
         vuHg==
X-Gm-Message-State: AOJu0YxR7222+puizp9aM5gmuPR5xpQQ8nSQN9k8UFfhmw3pPfpBh7ym
	GmtdjH8QmjLYW4zKFkgEG9vDygehr6XdGdal3cNMKXimYDtk7PeIQoIOwP3f3g==
X-Gm-Gg: ASbGncsIgBLSlnNFq1iiPIAyBeRGWOi7t5G9qjFdem7RwXsE+tIf+HlbiRexMoxW/P3
	yJUxwn29OpcZDLymCLMGAi+zGNEm3rBmtKbDn5z5jnj1erCoIXewvEKgYr0q46E/d8kKmmm+Ysb
	nrQvC/T8gunkB3bP1A0cFa4rqIoLoDnUY7Gyyu8uNXLl/Zd5D8ha6WeG5YLaGXHqFGTTwCasiHm
	7o5uGUp1V0ciAlG0ASoFicr5UJr5p/J7LgDwIQGvQp868GLwSngKVCg07zDc1bpv/gfpmwgrEQQ
	p3utaO3Hw5LjFH41IfJ2746q1KmDrdd/q6XlQfwlpbTjeLNM3rinrJlth7XHt/pJlMCRhFtBJpC
	zyLkaHFRzuUrBScwrwPNL
X-Google-Smtp-Source: AGHT+IGgxeR2HK351ZU9X04h2fptDgizLc/awJAakf2pAKepFJFW/H8QjhKliuTjXmyXGKnqqvdD8g==
X-Received: by 2002:a17:906:8f03:b0:b33:a2ef:c7 with SMTP id a640c23a62f3a-b33a2fe4809mr152904266b.55.1758716944961;
        Wed, 24 Sep 2025 05:29:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.29.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 19/20] yelp: upgrade 42.1 -> 42.2
Date: Wed, 24 Sep 2025 14:28:37 +0200
Message-ID: <20250924122839.4184719-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119822

From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bfa889276382370324532438dfc9962c0fb2bf05)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/{yelp_42.1.bb => yelp_42.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp_42.1.bb => yelp_42.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.1.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/yelp/yelp_42.1.bb
rename to meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index ab8b9c37ba..fe3b1105c4 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -9,7 +9,7 @@ inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "25b1146ab8549888a5a8da067f63b470b0f0f800b6ae889cacd114d01d713b41"
+SRC_URI[archive.sha256sum] = "a2c5fd0787a9089c722cc66bd0f85cdf7088d870e7b6cc85799f8e5bff9eac4b"
 
 DEPENDS += " \
     libxml2-native \

