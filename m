Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E07CAC5BF
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:46 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.6899.1758954763254932818
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PfXQxD8x;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-42791510fe3so7068155ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954762; x=1759559562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LHhl4nrhy6D8UaYASTWd4BG2r+IgR1MxwICLq2DuE8=;
        b=PfXQxD8x6LrwxY1BuEOhwLdc/j5wWFDzpK4U4SNfRqWRX4XbgLozxR5GJj8QZtkjep
         2MZqLiPI6LOj8V3PdqUUbW1PSiv2ayAEHqz03cVZFM+fFd2VVBW8FefQnlbR20VO4CvG
         RLK6Cstjp8EDtfJ/pxPzaAWn+5p3oYelZ3fBwzA1Xc5kF+0GQc9MqEdv6TbbID2glJwh
         lNEJOuq0QL4pNPAcMQgCzX1Sn4ktCVgM22amjdGXskwoKxaO8geCrrru/GZoAS/zHy1Y
         oXQOXLWKq1eSOrrPEq2eTgFrjR9mGy9vuQCE6KBYDOzEqJweCoqjoPEcbKhGrDtRSyq+
         bNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954762; x=1759559562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LHhl4nrhy6D8UaYASTWd4BG2r+IgR1MxwICLq2DuE8=;
        b=r3hJttj3f2UiXXnLCMSazbc2KUpJBcsqNNCzlUhv35arsToR0Nm+YyHGKBLQpTGqKC
         Xnc5DcwyEtdYE8JUDM5DPnO1S7R9HUJPvLGfhpRJmxzAO9m/++3BQPLesxra1ZacUb/B
         G8U815bGGrLjjPC7S2/55ayaS0o/ocVR/ZcSUlA5clo4cdfqlD8r+IS7RUCiUcYaF5gB
         ayEZnUMl+7tJHpJu6iakQ4ymCvTyklYG2/Vmt63GUUYkcPpmZYQf/lvnS16kOtDZUjUr
         eN24mocjshidCHbIpPSXbw8FuBZ+bM4PgVBntc4UgwlCOtkiF6dN7zgkDcDWO8IUbDDm
         3JCg==
X-Gm-Message-State: AOJu0Yz4176dAhL73ADOczYEhPVC8tetFZcoBzfnzm/OHPbwdW5QUKfm
	ySE0pTgfEh0gA80iZhOTPtA1BHK5ZcLzbvEf9dHfXX72CDf8mvQFlRHahWL+Xw==
X-Gm-Gg: ASbGncsSe1bF5alGRct7uD29mkFvXEFaOXCcfZPpRVAifH+sWm6OhA5BzZrybUdazOv
	0Ge7Ek8Sy/fTK9lqn8p/stJlWVGKjFWcEVjDyruAFho+GMUgdoTWskCwIs5F7dCoHM4QDACqwW3
	P25tM+IiAnEDAY1DP12MwKKETjfK1kuQFQ5yepIlEqLV6N5pYC7i/LdT+Rz1j2SvIKD1lGFXFLU
	gmwQe2M5IsKxb+sECDgtMGhq5lPK9WrXm7pwg4b4d3HAlCrc6I/aC18tQ8CF+EnWvDo+/cI+TPw
	EUqL9vLgok36wRg7VACuU9xW3idSGek9sXsTdAzvsfzAegC8dL6CCqOniHE3pgsKXmndOb8Mgm8
	KUrioMUpadxaVue8tzYKpYUhHBtksxYO3ePl9shBxJ736qqaVcPM=
X-Google-Smtp-Source: AGHT+IFC55qo8pvmiQWlcsz16DA/MunKL41gR5n1yFUx/tIBfKyMJtLEi0RyZSsl+Q2vMMcYBAUChw==
X-Received: by 2002:a05:6e02:1445:b0:424:817a:5b84 with SMTP id e9e14a558f8ab-42873799680mr32710415ab.5.1758954762270;
        Fri, 26 Sep 2025 23:32:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:41 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 07/21] mm-common: upgrade 1.0.6 -> 1.0.7
Date: Sat, 27 Sep 2025 18:32:02 +1200
Message-ID: <20250927063216.1865627-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119961

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 - signature "Ty Coon" changed to "Moe Ghoul"
 - modify the whitespace

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fbf96a5bddeb2cd152d0a6e2c957ca72489fc645)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb} (78%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
similarity index 78%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
index a252a6b48e..cb1b710954 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Common GNOME build files for C++ bindings"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
 
 inherit gnomebase
@@ -8,7 +8,7 @@ inherit gnomebase
 # All the recipe does is stage python and shell script, some autotools files; nothing is compiled.
 inherit allarch
 
-SRC_URI[archive.sha256sum] = "b55c46037dbcdabc5cee3b389ea11cc3910adb68ebe883e9477847aa660862e7"
+SRC_URI[archive.sha256sum] = "494abfce781418259b1e9d8888c73af4de4b6f3be36cc75d9baa8baa0f2a7a39"
 
 BBCLASSEXTEND = "native nativesdk"
 

