Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5B2C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.34506.1675055361614223021
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jN8Igayi;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id m2so5395998plg.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMDj+p1CQH0mlBP7dyitdJ/LOYAiaVVAKjav9TaOZ+g=;
        b=jN8IgayiFcFPEL1J8MU57UWMzyqXPSMq9FF0sNdXNZyhIEYt9ow8fZCVQUaaiLuD5d
         NEhVDOMXTgaoa+H3Sh3oOsvDSapu7xaNKCpkQKpn9tblaLn4x+vLL/LL8EG5ZTeOB1KN
         +qmhcOquDCvxlm4eC4UGt7rGhhmjdWRUf2+DxEjg/oPirQSkCOFnks306zdANJAYG/PE
         /AHrv913WlM0Rq/+Sf/qmnK44ZopSYdUwT8DZawUNcOrds6H6uvgKEKBVwt88HA+ByI4
         X9tGlYgcE6sg4GSDeiPNTwN15EXWi8iI/LZxgqhXn397a4hfldoTzkcY4wrrqgHU8UhY
         QCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMDj+p1CQH0mlBP7dyitdJ/LOYAiaVVAKjav9TaOZ+g=;
        b=5UZpZY8hGUdwMvyaa9Fpzc/7aSM4gUkY3n4Rm3WeyQKUon5Jy0K+07VyO/vZy3ghgR
         i17VpnNgFGQbEMeJz3vKnWb20GKOI/NLOpc1th0q+uU0xnrLWBCPosOGUp76PsWGQihC
         V0RJDJgDQbJ/0oOQNZ6O5couCVS7aelFt+Sg05c4aX/zWlYNNkxc6sddFMaEzMLr+TV1
         d9/t6nJUFI+by1HuWcHz9gfdatk7xAkzevkCY97B9IFr5c4RljoAsv+Pg7h17Z39GhAC
         QwAy8cGXmai2iffcgtlWbOAAWyhAicCzYH7JkuO7681ZRXpHXoYM7VND8Q2ZpaEQ58O6
         6uZg==
X-Gm-Message-State: AFqh2kraYiLEnnmbII63RiT0MyqP8MEFNxandyP6OmNc0MvbEfhT8bTT
	vTZNvyA2tU7noqkw0Matb3tgNKo2LhiMFg==
X-Google-Smtp-Source: AMrXdXsQAaxDYpuScl6ZHWm1YLyfjgHEr42F7F52ItmxpGMI5bQoeW4dstnAoz0KriX5c0DHZImcRg==
X-Received: by 2002:a17:903:1c6:b0:195:e590:c7c6 with SMTP id e6-20020a17090301c600b00195e590c7c6mr46580591plh.22.1675055360776;
        Sun, 29 Jan 2023 21:09:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/12] perfetto: Disable ccache
Date: Sun, 29 Jan 2023 21:09:08 -0800
Message-Id: <20230130050909.133727-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100855

It does not build with ccache for some reason, loses the compiler name

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index d1980a0097..1605de489f 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -32,6 +32,8 @@ DEPENDS += " ninja-native"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm).*-linux*"
 
+CCACHE_DISABLE = "1"
+
 FILES:${PN}:append = " \
   ${bindir}/tracebox \
   "
-- 
2.39.1


