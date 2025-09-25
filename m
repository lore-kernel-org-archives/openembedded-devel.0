Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D041CCA468
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.9709.1758801835311825974
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyKpgQNr;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b04ba58a84fso151213166b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801834; x=1759406634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Oi49/qV3Xy/T+E1jXOJu0xhyI5YmWM7322DbP1qTOM=;
        b=TyKpgQNr/mKWc88Xz8TwGh4RcdQFsd73hYoaRBV4pQisVcZypyXele1zWk8D88YkSR
         g+eZ0yOnbiA5MHdAUmHBOJJR2z4f/JEGz5g0IZQmv9h7VeNU0+941byeghmOsMhMMG0K
         kYg/VZeLzBca7D8WtbU/a6Bj/tdRwyk3yfVe45HF6TDy2OsTUjV7pRWQW0lNGZ6RxyRQ
         vsmy6hgw8mxcpsDXJTGJVkNl9wZRJcTl5/4CK/h/RiIuCE55/mj6D8xON709BjhWwWrb
         dxsltPZfBkNgFgJLvi++RpGf0jJdnS1CT1RrKuk+h7UU+tFbdlEYB2MVRHqHmnXPAVAg
         iilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801834; x=1759406634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Oi49/qV3Xy/T+E1jXOJu0xhyI5YmWM7322DbP1qTOM=;
        b=ir6DgpnGchcjdJ0Pev1LYiCTewAsJLJperVIJIhac+gjwh3sJ1kLKuOKpjaTj60V4H
         jdY/bXE4XM0bgz4fE/3UjBMdvFdY3FtDaabpeT4DAeFA5N+5KWX3/dEQiRVDbBDmkPAj
         mw74gSIL9uLpkRB4Hx2YbbwxfFb/aKg09HwTnKIyciVJYsV4QSJbs2VhZkY4/sVcP9lH
         MzzETFAM1kzOhyMeR35xQgI2tGBx283kXPoaO6N9Hqm9U1ZScUPEyspfQpDd6BOlTXF5
         6NszpKK2rSkvS9zC1Nwq4BKN7QQ43wJyVIMEvEFpQADhRdOeE1MTid/HTi7w5Np4w+r6
         yR+Q==
X-Gm-Message-State: AOJu0YwdKXgkzYObkMP1mZz4huhcbXSl3WLZqCksFxtoG/KmoL85qU/S
	Bp5u47u6JHo9/x8WXVGZrjSM1h2M79TCFeWLFcD0ROpUNljLUP1BO8NEYnGlk2yd
X-Gm-Gg: ASbGncuKNHu7voiWoHnw+84j9TUxKI9FQjbqa612DbdO8cM7BR+3ex37N28KkfXpw/V
	5J3FPuKRd42067iNB3RF7E4FVO9IRgx3r5fF9O4Sz30tN6qXQVG/1uimJyZI6dBWKIEICqmn3c1
	WEft+lp7nMSj3Nj8nzwrLUhZ6hacPVU+9PnMRFfHngtu0fxCCgtJ5hZ4EhZvAJAGrvKeJ833vLJ
	9WxTZserdbPgaPCZPu6d516UVA1AXRxKpnJd7NRxhKgabnrD5IKo/20SDWw/7+s9p8rJhNuCH4r
	rWDl/8zII66AtfwXzfb5Qq4dPmyzW+W+UY1Gd/3pfMKLAKXi29yer9VkBe9F9qDTCsqloZy1sft
	pU1T5AAXofW+OyQ3zx74N
X-Google-Smtp-Source: AGHT+IFZfbAwZpomyGkLAhyBn++JT6Hh5+xKjogaDw4vv/pJvfn5yzfV/1N6d+enThpuh2DlL3zolQ==
X-Received: by 2002:a17:907:7e88:b0:b07:87f5:73a2 with SMTP id a640c23a62f3a-b34bef98e8dmr302721466b.44.1758801833452;
        Thu, 25 Sep 2025 05:03:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 12/21] libdvbcsa: set correct LICENSE
Date: Thu, 25 Sep 2025 14:03:24 +0200
Message-ID: <20250925120334.1670367-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119872

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a66ce642673dfccc38449d362de4b07b06bc6451)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
index 5de717c281..bdff6025e9 100644
--- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Open implementation of the DVB Common Scrambling Algorithm, encrypt and decrypt "
 SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRCREV = "bc6c0b164a87ce05e9925785cc6fb3f54c02b026"

