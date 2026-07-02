Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316F6C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:38:49 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72649.1783006722213805367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso3241113a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 08:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783006720; x=1783611520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2dsujFdmNTsMeUEGzS4j6hBEG3Q3juyplzgFq1UeCM=;
        b=B3vyXjIDnqiRsrhrFM5OqugwccwDtqjrLxZMZ0bm4uZU87aMsLguAVhvWYXFmFJNXk
         AjrtXu31Jkknh1jxBvi7qIAxoeNWsbI6vtrVwoqxvyvkc/4f+T9ePoiy8sJ0KIs6gkZO
         Ye9X21yG7pJdEj/2ke0tbz7NpSGYyubNFBob008YQrv7Wc7pW7dyehECKNFn2PxB/2m3
         TTLUAlCBedyd9+X4vob1zE/KDox4c66HCD//m1Vfel4ol3tV/PNQuDoECbYt70yxuo7Y
         Pscd1Ls1N34BYyHNSx0GQgo5wen+RRLGg24B5spM8b/W31giWO7bY2yO7/A1w/wC6Vex
         iZww==
X-Gm-Message-State: AOJu0YzSvKZEDkjRY8bLzNOSMHMmKql85ypR1a3TrtxOwYWKEU/YcSWi
	LGieglsb9UA714YFZG7FDlc/luM12uizVuRoIVYheYmyykyjlRwnrare454IbE+m
X-Gm-Gg: AfdE7cmCr5dPT+SpgXB+A39L7gVf3Txf3hEO8AhH3DXKj3+miewL52qxNsiKhZ/vOyl
	l/pqCNVzE7HvkXRB5stsDlV6avC5SWvvjgU1jqVYL4pYznGdZVnrSG1WZboo2kOGOogy06LDKjW
	o4Mht4n151kv5gYqe7pou0Y+Nf5Z/IgPd+Y3rdyPgNi2k0IayA2BWs3JIolK13LNzuqB3QKcqZc
	CGTfGqA4RP6dC0p95u5XuCrmo+ABjlYZAuXI5XRd9MxmlQPDfp/a2TotturVBMx371MVu8RU6/z
	fjNJDkplJjF6U7eNM3EWs0xJXggbIPXOYclleDOAz9gaM1P0ubs/QQqgZEsgOycHZVpNnqpAutW
	9p5nPrxkG+KMls+jT7BpOY08a/hJgkzGS45uEdrv9uRzSKJsPGfkJiEWX7qpzqf3g+E5neyE004
	DxVpUFEDxBXUetNyHFTue1nkG/O96ZTRUXfsyGwryS00/GjIEb6KRmsOgHHOWULqP2
X-Received: by 2002:a05:6402:a6d3:20b0:697:de64:ae9a with SMTP id 4fb4d7f45d1cf-698a2c5fe74mr1897599a12.6.1783006720170;
        Thu, 02 Jul 2026 08:38:40 -0700 (PDT)
Received: from clast-p14s.int.sky-watch.com ([178.72.20.98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad1000d8sm1181842a12.16.2026.07.02.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:38:39 -0700 (PDT)
From: Claus Stovgaard <claus@stovgaard.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <claus@stovgaard.com>
Subject: [PATCH] android-tools: fix native build
Date: Thu,  2 Jul 2026 17:38:34 +0200
Message-ID: <20260702153834.3520999-1-claus@stovgaard.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 15:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128001

The native tools include compilation of zip_writter, where it include
gtest/gtest_prod.h. So native build need to depend on gtest-native.

Signed-off-by: Claus Stovgaard <claus@stovgaard.com>
---
 meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 5a3ff3a6dd..31cc12ad78 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -19,6 +19,7 @@ DEPENDS = " \
     squashfs-tools \
     zlib \
 "
+DEPENDS:append:class-native = " gtest-native"
 
 # The debian/ patches are copied from android-platform-tools/debian/patches and
 # applied in the order defined by debian/patches/series. Listing them as
-- 
2.54.0


