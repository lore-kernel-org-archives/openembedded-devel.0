Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD540CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 05:02:36 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.35439.1760331746592988386
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 22:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZM+LxEu2;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-77fac63ba26so34291847b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 22:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760331745; x=1760936545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2U98e5rPhlcDdrylKdFPSIDAQm8sOObD4nSug1CEPA=;
        b=ZM+LxEu2/ZBFfyztv6Opw2NN4h5RBtpxthcycV9TUTXUktZJxggZBr2b2JFLtS5GUo
         3BUjSmWjGNG7lroU+52JngBigBwb9cCQOPF20zwLhcbi/DUnrfH+/uLYXY5sRCfliyHW
         aHykKC+VeDJfWdhF+iht39s/YN1an85pv8D53xGgHxG1OrF3Cn1K9UnQV5t3SDDHt/tJ
         lukc5dJLrgtjjt2kuYZfTi8/ru5A1tBRdCSThrsu3PiZJZbs+mkj7jlqyVvf38E/oG0P
         Mzg8oxxa+wg1Db5iQvBj/pEUcHMP20iHGl7rUAUBgVyeGn3mA8hQDduOpnMOYB+acFwK
         U51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760331745; x=1760936545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2U98e5rPhlcDdrylKdFPSIDAQm8sOObD4nSug1CEPA=;
        b=tQlRDkU/WKJcqGLQhN166AwuZIFLb4WEi/8f9j09CfGX5u9HKR3U33A+1A0vwP9/Eu
         jHdO9JEG4ZGI14aRy4u7NhlZd5yNRmYwbiw3/ha1LnSZz2x7hdOsNqM5S1MN7UnMiLkv
         WuS41K5tvT3UUkOxyEWrQd6DlYGVJN9KsCPiO6idZuhIpiiDj2r3jGpPplCwKTlakukH
         XdIY8rrltDAqpJuV1+oqQu2HMVdS/TKCFrsZSztsuyvvwYizFucUYRSHaSqvsm0y1jpG
         fsfg0D4s3tz+PDIP9n827gpKx4S8HB8NeewXAVl+H/WWo1A8/f+I8zdpOko+DuaOcGen
         X28w==
X-Gm-Message-State: AOJu0YznKvBlqWNDuQIiRrI15pLDWgbPLz+SyytkjV6Iyt7ZIjkdLtfF
	t0dHVrSfE0GkikVMXaf1HQhOsxPYzbUqpvxr+qBBh6geDGJkr59QmqVYZZNUcZAx
X-Gm-Gg: ASbGnctDU7ByUvVOd5Lg9IgNQnRcoZ3a0Z3f24lxjWKf08T3HGUP9wGYMbzPnbeaIyK
	8IivKFvp32FjxyZLfbXwl1UDQ7FlK8OACENUuSGCqXzvyqB6cXGam1qUeEwYXUFSK0m7zLIsFMS
	IHvLgaidKbWoHCqAsigTWMU1i08wcHH4EWcUwUOls93okvLAB3uBC0MNo+TxvJ2kaczN+nrarzb
	5mTcVzhPJPHb/1gd3Z0i99tKvVEnIcLjNZUJibitBAJS1nu7v/XDe8YblyZ3tzHwNR2ZYYwcO18
	bxPCw0QyVdIgQW5DYhPk7tZYZdn7OGlYyDKOlIATNXczzb47jsrmlCfpUwjsdHMKwJYQbDrMW/8
	/pkvHiXMPfrNb9UrFOnK7ALrEcl7DLpe97zeJkxUg7ZekLlv1pmGYUMYwHzPmOCqq6JF6/YAH50
	NnYvX7k1AUKQ==
X-Google-Smtp-Source: AGHT+IGcZvLEWbfoqAqBFPwe5VliPVbIzoJugJIiIOmRbVb2hwbZTkcMbwV7jb2LMtsK/38SbP4thQ==
X-Received: by 2002:a05:690e:1587:10b0:63c:e90c:a6dc with SMTP id 956f58d0204a3-63ce90caca1mr9476389d50.8.1760331745302;
        Sun, 12 Oct 2025 22:02:25 -0700 (PDT)
Received: from localhost.localdomain (71-208-12-94.ftmy.qwest.net. [71.208.12.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-781071f68dfsm24394817b3.42.2025.10.12.22.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:02:24 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] cups-filters: upgrade 2.0.0 -> 2.0.1
Date: Mon, 13 Oct 2025 01:02:18 -0400
Message-ID: <20251013050218.613776-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 05:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120525

This version drops support for Avahi.

Changelog: https://github.com/OpenPrinting/cups-filters/releases/tag/2.0.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../cups/{cups-filters_2.0.0.bb => cups-filters_2.0.1.bb}    | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-oe/recipes-printing/cups/{cups-filters_2.0.0.bb => cups-filters_2.0.1.bb} (79%)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
similarity index 79%
rename from meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
rename to meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
index 2f1a772dde..e488bd3039 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     file://fix-make-race.patch \
     file://0001-Fix-build-failure-with-GCC-15-and-std-c23.patch \
 "
-SRC_URI[sha256sum] = "b5152e3dd148ed73835827ac2f219df7cf5808dbf9dbaec2aa0127b44de800d8"
+SRC_URI[sha256sum] = "39e71de3ce06762b342749f1dc7cba6817738f7bf4d322c1bb9ab10b8569ab80"
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups-filters/releases"
 
@@ -23,9 +23,6 @@ EXTRA_OECONF += " \
     --localstatedir=${localstatedir} \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
-PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
-
 FILES:${PN} += "${datadir}"
 FILES:${PN}-dev += "${datadir}/ppdc"
 
-- 
2.43.0


