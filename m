Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F74C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:29:05 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.7550.1664864941592353209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=C37ojyzZ;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.53,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f53.google.com with SMTP id w18so11004012wro.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=oFeA4GvaRAY6FfQb4IzLhX+5IOlPY8Tg/JpRaG0g/3s=;
        b=C37ojyzZb0JgAVgzJQR0gwrD/8BbzQR8+eP4ciHb7lhf1NGuQbMaD/nU4S4hev9zji
         6jl2UnggFu0soJ0xczlKua+fjAFbanCzQeMksNoXSSSCkAAz0UjZ8R7OPQiHJCt/+1y7
         q58FhmGrQ9/EMczTJLdr2gpiRzjune+ftA1HsSaExsKaebWAeQIkhrwCk21NeaSssISv
         UQkuXwwJyguGH3xGI6IilmZ/AuYRj+kH00drQcFMTReHGdUJX4ofmW6h1cmoubCbRU6W
         jAJRhSawUbkjdhsecfFgVGA/6FpDF6XyAaCsA/EwMM+57dKy5SuHTaaorG0rpIWq29c2
         Qg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oFeA4GvaRAY6FfQb4IzLhX+5IOlPY8Tg/JpRaG0g/3s=;
        b=hFdHLgIZHrowDzG6N7SYMcnIo0tMmDjWlGWBLmqUGIHOy40wCYcol8TNXiPbp7ejN7
         276mnxfjypqndJtm508oBFiwsv4do63vi0udthVjbVmwByKhjA62Gtmc3qhNTXzAZL4Q
         7LcMULmGoJ5rBjO0OPIJvli7PN91LCGkK1dcxc7YjiE6KP9XbMN5M69Klu5ogi+ZvKF2
         gGWLI2v+XiwHVD+xUon4J1lhOqmmE6fCZsnn45p4qnAdkT0eQmJTrw9uGShH3WR03StV
         x6qIAJISJFUR7uAUO01AMWs3T3luaSFPyNz/erinPfmXX0u7KZlJYWOvma1hBD6n5NGl
         K/Sg==
X-Gm-Message-State: ACrzQf0SdV91N8mi5+5avlW7D9/tEdkd5lHNxY2opQOFtgadYiQJho8Z
	Q90/vsOgOs7I+UDyfJNJuxSCyWTftgdPXleqkEQ=
X-Google-Smtp-Source: 
 AMsMyM7QjNSk71A5bTmtYfpnJcbfZLA1GXOmP0M9+F2l59oKjC0zxjXxWzIzClWMJkedIFbFf7BwjA==
X-Received: by 2002:a5d:5221:0:b0:22e:3004:bb17 with SMTP id
 i1-20020a5d5221000000b0022e3004bb17mr8011235wra.352.1664864939767;
        Mon, 03 Oct 2022 23:28:59 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 l22-20020a056000023600b00225239d9265sm11993296wrz.74.2022.10.03.23.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:28:58 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][dunfell][PATCH 4/4] mbedtls: Whitelist
 CVE-2021-43666
Date: Tue,  4 Oct 2022 08:28:43 +0200
Message-Id: <20221004062843.2541778-4-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004062843.2541778-1-mbriand@witekio.com>
References: <20221004062843.2541778-1-mbriand@witekio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 06:29:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99053

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../recipes-connectivity/mbedtls/mbedtls_2.16.12.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
index 264e8abc15fc..7c61b1bfa7cf 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
@@ -49,3 +49,6 @@ FILES_${PN}-programs = "${bindir}/"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "mbed_tls"
+
+# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5311
+CVE_CHECK_WHITELIST += "CVE-2021-43666"
-- 
2.34.1


