Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B427DD10374
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.6206.1729801159290204214
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2XvUuPW;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38fc62b9fso13131867b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801158; x=1730405958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9lCigUgfeDhBdQLghHW+NG8LsaQAKoimOzdOplAMQI=;
        b=F2XvUuPWfiuYI4PizZRzx6/WlfrqXouahvS7eWKZ8HO3PmfdYyCjrdRE0aoJwioRKR
         Y6KWylrcVkZ9yF4cf5mRYvoIksZCdoqbfl675Yf8synrZ4tx2ov7afps+ghXZZNRckMl
         5Desovb5N1dsiovBYy+GEio4ArgjhQtnBUVvZIgLzIKCqhaepieHaZjFPA9Cm15oT4Xs
         y+JKzeeZgvcdVYz3+DI3qXQmXOQgXPbhNigQJcsscDgvqXghrkIj0BqXSu6F3Pz7excf
         WtQLkM+fqtyLI1yPAj6m3iOsww/biNU+Peku7gZ9PsxpG7pEbyX1UxwkQAcG5FhXlI1H
         b2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801158; x=1730405958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9lCigUgfeDhBdQLghHW+NG8LsaQAKoimOzdOplAMQI=;
        b=nArf38nlb3tAJbqmsiVN4lB66SzhoqGTy9e3nFH/qBQSDMsLGOH59lMCfkbhgTAExm
         GCsTZqTu4KwwvNJzcM2IATG6hxj6cswg4zLCMw9p6pc2j4wOdrEFlOnmWFrLy0/4exNi
         9AcMPC92b/vC+XhFmrGMEWYAhyyb7Tl9OjMGhKDcUoa9drK2lyi8JzWWlvo940lE5ygV
         EUqroHyWIhljNiLKsVCOp0dNFGLZkBQq0HNtuZ2npN6XaHJIPE9X8TRLankc98gpupHY
         MQ60qZb8lTRhqGDoEY2QJujLq4Z0YfYfMWwBDei7hpt9/+vQhQZPfbe9f8J7opEuHv3W
         GCQg==
X-Gm-Message-State: AOJu0YyzYdtKPcxDfXG15pJz7IJ/RDAeLP4VepeD2GG8g6YtTVX8RleQ
	NAGmTvgz3BshzD/50ewhLMrdYyJC7ldpjl6xS08DWhdAnzRrFvhn7IcMDA==
X-Google-Smtp-Source: AGHT+IEb7xJTNVkdl57jEUh+BskwHye6OcahWEcx2AOqoz1WPtuuN1rEgCWjZj2yj0Bfyfz/QNFd1A==
X-Received: by 2002:a05:690c:3411:b0:6e3:39b6:5370 with SMTP id 00721157ae682-6e7f0e47ed9mr69746437b3.24.1729801158031;
        Thu, 24 Oct 2024 13:19:18 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 37/42] libtext-diff-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:56 -0400
Message-ID: <20241024201806.440273-38-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113215

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
index 2e89b759b..9c473d15a 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
@@ -6,7 +6,7 @@ faster than shelling out to a system's diff executable for small files, \
 and generally slower on larger files."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~ovid/Text-Diff/"
+HOMEPAGE = "https://metacpan.org/release/OVID/Text-Diff-1.41"
 
 LICENSE = "Artistic-1.0 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
-- 
2.43.0


