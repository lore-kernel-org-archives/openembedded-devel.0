Return-Path: <grembeter@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE689C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 18:17:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1942.1717438659610497591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 11:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EeFnVqOn;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: grembeter@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421124a0b37so31296105e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717438657; x=1718043457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WXDQl1Mo4gm7QdHREj0CJVu2U8EfCLhjz9L35jecWuI=;
        b=EeFnVqOnViF8gvsEioVSaFodx6IDGMuiax2/tfVGIY6ezfTqpx1fJRC2gQRX54j6xF
         ZedueSIyWh1Q1bdkWXQTt9CDapLsBmhPMW/Bm94hxnvzkRlcAxc87G2m9mwV2h7jV5c2
         trP5afGCZ7G0Lt5q9riuAsr5uxZViNj/X9COv4NSmbxnkRmFUyQmHkoubzoFw+wk45X/
         LnnodI+WoNwAcYEi7VDGuHmtz8rY8lgkUBMQRLuKAKu0/S9nmAVvZfxFpUNrA0cxFY3p
         0ayaSPXvauAyQyWpvHtzKwspMI/TxJBmNNDz8oTm5YCZb7PDEYnKwKkSVdHqF4gJfxBp
         Hsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717438657; x=1718043457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXDQl1Mo4gm7QdHREj0CJVu2U8EfCLhjz9L35jecWuI=;
        b=Vo5ajH1JS+9fcT/caZjoP59UYtU51I63yWAufY66EI7iULsF/p839kAGYiCwSKDvvk
         RWLKF83sIZhquyPqMXfTaRbuj6kWcrunCIy+PzkWslElp+77Wc/QJttJCF+POvGYIAo1
         Wx8FsIc9ol/ejmY5B4FbEsIe7UtNE6KEKU9I1mUoBtuyayjfJEXUZh6b+pQY4KV/uH0Q
         KshB0xI3ascKN9dQLGBTORvs8lm8XgJpKnuN2pfyHeQ2lUVDNmPCTvv+aC9/8N57lCE4
         giGFZQFZcDetGNpATeBCcBt554NEyqM/0Q1IfeEMMWSytFs2ya7qluMIJZQbHnFw4/OR
         UgBQ==
X-Gm-Message-State: AOJu0YxFZ7wK9MGwDNXH6tcB1w5C20puvRqBfgt5KzQN81QSNXDe7gnV
	MT6qDEBo2nc16BWELpoqA6prWt534rJQJQipl903WSiqZaPcPHPpI2BphQ==
X-Google-Smtp-Source: AGHT+IFYecGly9WeU9EBzNi9PoK+HFbLkoBxsUza8YPDYQO+sxghQRl3e4vfjDoOw1PVOM0Yk4TLfw==
X-Received: by 2002:a05:600c:3ca1:b0:421:29d4:304a with SMTP id 5b1f17b1804b1-4212e049f62mr84599545e9.12.1717438657204;
        Mon, 03 Jun 2024 11:17:37 -0700 (PDT)
Received: from think.fritz.box (62.54.143.157.bbcs.as8758.net. [157.143.54.62])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42128edaaf0sm147964805e9.15.2024.06.03.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 11:17:36 -0700 (PDT)
From: Grygorii Tertychnyi <grembeter@gmail.com>
X-Google-Original-From: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Subject: [meta-python][PATCH] python3-pytest-html: add missing runtime dependencies
Date: Mon,  3 Jun 2024 20:17:30 +0200
Message-Id: <20240603181730.4880-1-grygorii.tertychnyi@leica-geosystems.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 18:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110675

Upstream toml file mentions Jinja2 and pytest-metadata as runtime
dependencies.

Link: https://github.com/pytest-dev/pytest-html/blob/cfd32d08488e2c6fb72f0617db94ab41d3fca8d0/pyproject.toml#L42
Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
---
 .../recipes-devtools/python/python3-pytest-html_4.1.1.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
index 37478ee0ae35..154ec255cb5d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
@@ -15,7 +15,9 @@ DEPENDS += "\
 "
 
 RDEPENDS:${PN} += " \
+    python3-jinja2 \
     python3-pytest \
+    python3-pytest-metadata \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


