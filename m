Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEF9CA0EF6
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 16:50:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.31051.1694537435664404435
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 09:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mrEIegkg;
 spf=pass (domain: baylibre.com, ip: 209.85.221.47, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31f8a05aa24so3683610f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694537434; x=1695142234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUAas+AHAVjNvpQQempZ3c5nRU83ugN362bbeK+PGO4=;
        b=mrEIegkg8drkWvHoFjpMV5HNvmHwPB2TV+wgeX1c1VpAbso8+ObWRerFeG/xVXsQvo
         wAuknlL+gyhbXNi15C9hkV/YbwcMm26dsX3qDe3ZQRJDnB3srvONeLWqGvxvqNMWc9QS
         LOEnUTDbve/vefLpSJPXfslBrys7gsdWzkvYGaLjErhIVpo+0ge8QkSmWDZXlSgQKX6y
         Omcl5rlRnKrrBdWD50Et7M16O/JCzCOx4MHkffooEqbYIcJB1V/zoYGGwy+w2M5ISflS
         fH0UCcyPa1JxzKIPrXzKpm8F76d801yAgDICOZiprfcxUEjSV3pSWM15/Hg8MlIEOYOe
         wYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694537434; x=1695142234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUAas+AHAVjNvpQQempZ3c5nRU83ugN362bbeK+PGO4=;
        b=WkM+IWCBUcDMntH4BOvJ30BDONoW/HMUO3nLBJSo5idP0wGaZ+okJeOVYVuQKIy+gd
         FR4ORE+h6VfBTdTLQBoLNhYLqzumPG4kHYSge+lM6NBN2WV+VJGSMdah3Lnr5P1ZxW0e
         pN1Mw2fO6wwYfoiPgHr8+F5dFOyo9jvehtv3m5ASftR4gW6OeWYSObvw4OJa6brzwZKt
         c7W3kw2oZFg63bmtqcwHss98tZEZ/Em7CaEXnKB+QGJcInEUE0N8OL0+yDdRthg4dX0V
         GaAPAaNHAWXUaq4ogr1N6Do2WDG7hMSBZEOD1haTvrJJz5bIHT/ElLjOAA92UBpOMHLY
         cL+A==
X-Gm-Message-State: AOJu0YyeD4JeXq0Srpr2fOLQ9KKWyBuuzdFB8uFmHP+XSG0eFb9t0VVe
	pFjAYKM/NjwpmjtV5YvGYwwUms62mUHoytFO8ehQYQ==
X-Google-Smtp-Source: AGHT+IFr/VHi0kVfPgsyJ02dXSS8dpxofgDV5U+DyGqsQm+iBJzQVeLr9AL5fRL1X6Gr4AyrX1UJhg==
X-Received: by 2002:adf:f9c1:0:b0:31d:db92:31ae with SMTP id w1-20020adff9c1000000b0031ddb9231aemr18215wrr.44.1694537433980;
        Tue, 12 Sep 2023 09:50:33 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7c6c7000000b0052328d4268asm6157436eds.81.2023.09.12.09.50.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 09:50:33 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core 2/2] update_mandb: deb fails due to missing man cache
Date: Tue, 12 Sep 2023 16:50:24 +0000
Message-Id: <6b988a04fc35feeb21699174374a145b9cb7c07f.1694535904.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694535904.git.pidge@baylibre.com>
References: <cover.1694535904.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 16:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104850

This only occurs in debian package builds when populating the sdk
and is a work around that seems to work. Eventually we should look
at why this is failing (I have ideas, it's somewhere in
lib/oe/package_management/deb/sdk.py), but for now, do this so we can
fix the core issue with nativesdk-intercepts.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 scripts/postinst-intercepts/update_mandb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-intercepts/update_mandb
index a061bb426a6..f91bafdb117 100644
--- a/scripts/postinst-intercepts/update_mandb
+++ b/scripts/postinst-intercepts/update_mandb
@@ -9,6 +9,8 @@ set -eu
 CONFIG=$(mktemp --tmpdir update-mandb.XXXXX)
 sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf > $CONFIG
 
+mkdir -p $D${localstatedir}/cache/man/
+
 PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --config-file $CONFIG --create
 
 rm -f $CONFIG
-- 
2.34.1


