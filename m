Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9CDCAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:07:01 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.14112.1758625613041624181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iKKoAUBb;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2b4096539fso341230766b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625611; x=1759230411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZKClGMa2dO/QM/Id63K3U9O0qndxrnMiq0C04KlDOE=;
        b=iKKoAUBbuIWMQynEsS2gsIO3cotbVAtEkLzTfXTjZ9hU9ka1VqdHX3GUrAP27w1/UO
         wNHqLOTGH08bEIPsg67Ub97NcC7ZCuF8rcUnCoO4f4MAxlVMIKK2b6glw53phbHDWaQd
         LvQ1mn0sBpjXoxBr9PK4ZUPpBjBxqHiQqvbe3TDGM1t+RaDX1DsS8MoL/nC7CZaltRvN
         xM3rak667942pnQXyAeR5n4hq69QkBan8xqrKN94xI5c6g2t43OLMlpkZo6mR+0Okdeh
         Km7wpV079TUIjvrO0WEC6RuPSNPHcoRJideqe8oEBy+lS1KOhYfo/oafx+O0K6tSrp+n
         a25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625611; x=1759230411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZKClGMa2dO/QM/Id63K3U9O0qndxrnMiq0C04KlDOE=;
        b=O+Xo/oIXQgKi+1jl5xtk9SSCTBZjgp6/qbPquJHrQUQ/elU9RKjakfUfx1S27/8aV4
         PWrmtpFLmhsCrOSLcDwfnFM9JsiaG0r7I2r6r5J865U1zUSddSooXXHABcBTRuIN9nS5
         S3tEwNSNU3FmxCaZAAawoiXyisKN3Y0w6Eakt4CcOGUlssI7P2qDuynxQCGcLbY8AsFY
         wWpGaAJKPYywEehBmjpJTfpqPTzjR0LodeP/mGJjSLsRBesJ9WKhCYWK1SEu6tlIoo8H
         85D9zThLG+7Qlso6U2jpsfteWNlVQTHK5IcuTuhGRtfJ7sRHtwg5LFY3Q4hB+20CA8ce
         quuA==
X-Gm-Message-State: AOJu0Yx6qX3+kiNRuGZnXj+tyIMu6UPnKdS52P+uQ7fdgwK0UroSrtJh
	ZieD3NZfjXKm43Un59dNakSF4NBvOsmE+qpxSfyMVDBbIElRDxf8tUR7ZxpAtQ==
X-Gm-Gg: ASbGncsAXO2MX371dTBgNAGsbX1d8RjSJij/MbjZJsUyqBuITcNRthggexB0+9xXH7n
	oAovuKDxYOBjjIcWEEyfBv9vFWeAopyQoFxfA6H1/eghYp8VOuwTE0nrCHAbYUyRvKGpTdp0+UU
	GABI+jBK6hpiKfRrRkuCVqn7o02ud1ZCxZbYhAvYBIbLD5K632xycDW1q5kASeyKoEDmtN6x+QX
	Hqet3krKglLNzGLn6pLaFZouypRkjP8aiefNvrEvijs9qtnKj44eK3FdkfS4+afqoqkweWzAhOS
	QMb2m+pLz1t27OEsrf9LZRDi4RRlFtTk6Kh/DZEp6CBWPMCs4+XgI2EQ97ZpUE4sM5Gk4qqcRKl
	cSFljEBsXCVSU8Xy/5oY9
X-Google-Smtp-Source: AGHT+IGB9spouQ2Jknx7jXOVlqNQi24J5CH/1JAZGYAv2qtit/liDvHk2VO5F9cIyAVv7AoYqhN6Jg==
X-Received: by 2002:a17:907:3e1c:b0:b2e:f8df:f5c9 with SMTP id a640c23a62f3a-b3018a6ce5dmr211803266b.6.1758625611281;
        Tue, 23 Sep 2025 04:06:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 21/22] evince: upgrade 42.2 -> 42.3
Date: Tue, 23 Sep 2025 13:06:35 +0200
Message-ID: <20250923110636.3413021-22-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119685

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
shell:
  * Disconnect signal handler to prevent invalid read

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1b59a88df5ac37a286e3bc7b0c2ed8fd7868e06e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/evince/{evince_42.2.bb => evince_42.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.2.bb => evince_42.3.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.2.bb b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/evince/evince_42.2.bb
rename to meta-gnome/recipes-gnome/evince/evince_42.3.bb
index b84674fa98..0c97f75e90 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
@@ -24,7 +24,7 @@ inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection g
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "ff7f81f308cf8d4956ed97fb724a7e49448c214beeab998812ef9efbb38df8ae"
+SRC_URI[archive.sha256sum] = "49aecf845c946c96db17ba89d75c8002c5ae8963f504a9b0626d12675914645e"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 

