Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614C4E7DF04
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57422.1770050240074494710
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCdPw7es;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so37051775e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050238; x=1770655038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGQTci1xhp2DZJBm01lcqe7Y+Kwqa/QPdgypCTPEuBk=;
        b=mCdPw7esVBmbwfVx1CW6v63SE5g3BTFwmoHQ01N8zjjRfKr4ydKPfz9frZcb6fnShQ
         fHx9Dmn1b+tn0GhE96I2KJQTT75pFyyt7Tt1x5fM/tW53ukaiqUEJ51DALrQna25n2A5
         kNYV81mru0IPOAqytwjkoNoT7vvBXHa2Rr8NhOXvRr0O0Mf4mmjbEktRlhr5Q9SPcI3J
         HyoKBTaUQB3PwaCk0KeCy/ym3ZE9eDicsKV9d8oCCKEdPulWOdTk9STuGUjqa4zNalp/
         qQPs1ZNVmcH19rx0B+fXxa3DiS5pD3WHhujphvoWN9UY7iZd5HBCSHTD005BQ5x4UcSY
         Rvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050238; x=1770655038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iGQTci1xhp2DZJBm01lcqe7Y+Kwqa/QPdgypCTPEuBk=;
        b=S5Un6dVki1SzxJ/wEpshKsxLoUs/HRf5/VKSYywIDxWsyCQCL0loWJOBd2CHghnkv3
         j+ie98vO0zewrfSDjnqnvFKVAUxBXKy205QQ0RepD+OEkCZRip3cv7noSPPPM4LCwRtk
         EQ1HqJtt2/EoLFpkby12GbpENnmDoC5NVrW8lCk5H25sfryCIAN+xVf7nWMSoEjMvS7m
         +hTgKIH9WEdG/7j9oJyM7V1fiek5xeBZHnqHUFRyv8nPMcZheA+H6M3J/11JVQxVUQhT
         sBaIy2gEP/TVQxpWq/tHi4usnUWmn1PJ+Sanzg20c/BEGoltvEjzh6fFd5yagIVFjPYB
         uRzg==
X-Gm-Message-State: AOJu0YzNmkHl+N5lyTR/vnTyc5X/PrtAND2paE3V0h88Xb+3ma/DrbqJ
	4Me/DpoTd+vE1TjydYxmWW3cXaOl1RUiPmlnuNRjeSuSkje1+tiv4Ifomksi1A==
X-Gm-Gg: AZuq6aJe0LrusO1WsLZLxkVPNxU3aswnkPOO0mRejZ+yGJ+pGiGS4WKywu8C9BKTcqs
	Ydt9PGWhznFYNNR8SadLDsEG1Odkw0oQR7Me15SJzkc6JqfwzizuSi2tI7QSv9hh6Gft0RrS91I
	gw3yJOz+YAU40f0IPcnRdwbWAc9dFyV6ZVx9gF72nBTHUMtwmehoctdLjWZUlaz/71m9X8ggwRK
	PkItVdAptYjfbnyiL0+dAqDZQvumNym6JzqCmqqk3kK1LKpz8FgyluxFy4vUBgCrP90RbzjNbh/
	qzS6armdWiUC0XvxXEahkT4MjGUFfsE3XqDvUvBUCC8vtpLVVfXN14TbCnB7vyqEQ+Tq/34+s2H
	wMVmXORxD9hwy4QP2rAjpEta/JQvJlV1w2hmoy+l0ybG2osxxkTNCJq/iMgtQ+DVP/Y2Vh/MyDa
	syo2RG74GbksYaY8+LiiE=
X-Received: by 2002:a05:600c:46c8:b0:47e:e949:37e8 with SMTP id 5b1f17b1804b1-482db4ed389mr176255725e9.30.1770050238370;
        Mon, 02 Feb 2026 08:37:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/9] ndpi: ignore CVE-2025-25066
Date: Mon,  2 Feb 2026 17:37:10 +0100
Message-ID: <20260202163714.2359370-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124066

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-25066

The vulnerable code was introduced in version 4.12[1], and
the recipe version is not vulnerable yet. Due to this,
ignore this CVE for now, until the recipe is upgraded.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index f0175167a4..077b270ecc 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -25,3 +25,6 @@ do_configure:prepend() {
 EXTRA_OEMAKE = " \
     libdir=${libdir} \
 "
+
+# remove this CVE_STATUS, when the recipe is updated to 4.12 or newer
+CVE_STATUS[CVE-2025-25066] = "cpe-incorrect: Version 4.2 is not vulnerable yet"

