Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92864FA3744
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 01:44:47 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.4828.1667180686334052515
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 18:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yb4BQgF5;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id g62so9437224pfb.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 18:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0zEAa6uRpbyo2YN27fLFFhJxeypSjwY1bpiaMgk71U=;
        b=Yb4BQgF5a5N0lhkzEX1h7luD5/0XU/IsOzUs8oC5D15+3gzpSzGZ+gswSRHPcALtyO
         rAqqJfbAa/z2u4M5GSPD/hPZpJpjLq3Z26Ags9bXXkxZEcPF0XL7KeL9ONCBfFZjRSC5
         Lec8V9rBNEzpKsO7nAMA7sclrr43CbT3WrOoNsye2WR+Kd+EwmGm5lcZfoaN/wuZDh9N
         88Q1kgbXmpZiSvvl/ciqeZGxzvHeJIv69HBc6PXIvHImv6WejwLPwmgilN4F8i9re3On
         7CnH+prWIyJNplcSe1Jub1mXWltXXL/oASg6t2/h+haWewVhfRuE+Jj00a0PZ1XomX7m
         RRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0zEAa6uRpbyo2YN27fLFFhJxeypSjwY1bpiaMgk71U=;
        b=WLybqB274YXezkYpgYD/fYdh1gTNrfIYgPHH6O5fB5Oph6HXSA4OnYijmunzqVWzJb
         S+SQo4kkTRBqiuqj8ltWFjceSzo/Gtuhatxw6rUNge23iVuCBC1uHapEGT3Rbbru56hg
         v231LCnkvoNKWs16+6BalIdqYdZ7COZclEQK8l2LnNcskDpA+JHLt/+Q8RH9MQgLI9Kh
         UGgEPM8nCkd88UjqwXWRQHsU1zDV+mW1cy6QHGhSjorghFNxA7vWXLknQfDuBT0U4uRl
         cXApkS8iGkWhQeXLpM50GhNkkr1q5tqXWaUL1OR67wv4cBcoZo673VtKgo0Et5PLj7HK
         o6PA==
X-Gm-Message-State: ACrzQf2pXc7OfSL8+MZ3Zcfr++Z8SIeLt7MmiDHZBghS8UGWwT/KTTOK
	julDXhkFgERbX9QBdxRul+WIwcz6ufAZWg==
X-Google-Smtp-Source: AMsMyM6tNpnTQBNyJAFrRf0stCpZxrIUpBVGgqgA4v/5DQm4fQl31slVWWBmFS8qaUMW6ye/67ijYw==
X-Received: by 2002:a63:5a50:0:b0:429:8580:fc61 with SMTP id k16-20020a635a50000000b004298580fc61mr10911069pgm.215.1667180685348;
        Sun, 30 Oct 2022 18:44:45 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f504:8040:1a2:6bab])
        by smtp.gmail.com with ESMTPSA id a19-20020aa79713000000b0056b3c863950sm3267428pfg.8.2022.10.30.18.44.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 18:44:44 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 1/3] libcompress-raw*-perl: move from libio/compress-*
Date: Sun, 30 Oct 2022 18:44:32 -0700
Message-Id: <ddae5ba523f9fd7df9d0af168d335d1551a5bf72.1667179899.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667179899.git.tim.orling@konsulko.com>
References: <cover.1667179899.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 01:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99357

These modules do not follow our Debian naming and should never have been
allowed to be added as libio/compress-raw*.bb.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../libcompress-raw-bzip2-perl_2.096.bb}                          | 0
 .../libcompress-raw-lzma-perl_2.096.bb}                           | 0
 .../libcompress-raw-zlib-perl_2.096.bb}                           | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-perl/recipes-perl/{libio/compress-raw-bzip2-perl_2.096.bb => libcompress/libcompress-raw-bzip2-perl_2.096.bb} (100%)
 rename meta-perl/recipes-perl/{libio/compress-raw-lzma-perl_2.096.bb => libcompress/libcompress-raw-lzma-perl_2.096.bb} (100%)
 rename meta-perl/recipes-perl/{libio/compress-raw-zlib-perl_2.096.bb => libcompress/libcompress-raw-zlib-perl_2.096.bb} (100%)

diff --git a/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb
similarity index 100%
rename from meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb
diff --git a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb
similarity index 100%
rename from meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.096.bb
diff --git a/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
similarity index 100%
rename from meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.096.bb
-- 
2.34.1


