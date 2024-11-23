Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90594E6ADCF
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 00:03:39 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.38779.1732320217044707964
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 16:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDO135Pp;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e387ad7abdaso2931247276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732320216; x=1732925016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCH/D1ocU/oxBO7RHk12+9JfQGV7OhBEOSJbj4Wrhz0=;
        b=jDO135PpMuhFyfOe8MMRep+URuvpHh+hdva5n1p1RVAbJ9NzI0HW9x4jdUb71sdqi9
         9w4UyJVkZi90oUIJvx+lY8nfkc9FxvqlrolW96i9jABXKdzL/8VS/uEcmqNoYctDuN0j
         6JZuNartReYw8x5X0AN0CX7cjGxSTR8yItYkAC5hQlOz22PUAzFu4LxUkdNitf2Rs3es
         uU+DC3IF15Gw0E/Q1hsaUfwr3PL0gQ1Z3kmR2hqfezIe6Vjr0rj3T24G2QDDh6qGSyXM
         VUgnZiS93uozeTVGbvkPqbuXN0L4YHPPGfhhJ2z+Zo3pr7nI/ZbMWhD20cJO7S/8Gpsw
         nSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320216; x=1732925016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCH/D1ocU/oxBO7RHk12+9JfQGV7OhBEOSJbj4Wrhz0=;
        b=DzPzprJKWtM7FAC+CnPAUdeCJSyXrmsOiQz4rrhgdk7p94FrON9eMyPTJkWKJ9NvLw
         N+KxjByt9ti3vBV/Yl8jZJxH2nrxhjS1pFNx29d2sDrz1R2R7hRc2cV0BW3THwuzSLw1
         kXf34UFyzz9or3o0/MP1Bt5JIGVEYi+Xq09y+L1tO41tx9ouExSTBUfpY9szkKzbSV5z
         RiptdwwJmft7xJH+c/mbHmsf1S3IWD12gLVYY59idfoPDqSUpNl1rEiNgf7HmPSdNs05
         erd5C+kdVddpOHBrpTk4yQfssLEhwA52Ye38U+zOM+vFWXlPSrFrP9U9i2yemF93QoL3
         msFA==
X-Gm-Message-State: AOJu0Yyo4SewE5k940tPxYNrgQaCrQoeu1sxq/KKh3rO977YotziZQ8V
	BeEpWtJz9w2lQT/ouVErxgR7M2EyQ7P4NUBLXsH9iIBJd6yJoW03mFwxovzT
X-Gm-Gg: ASbGnctruCynSaWwgICsWCvKPPVmMGIQ7DBQVmw8VYI7ulrEgGwZfMUM37+OBPlNXHK
	N+2FfmGyPNpyAL6JxnQM3bOraa9KjkGmCd+T0Nr18ajM66UaKyjNToB591uQZASgFRW/cKxC7Ao
	sDa+r3D3UHwTY8ijjEZgmdXSHTORZIEPThvVmudnR9bMwJxDDUmtpwjUcRvHZ+ERwKqCbLPwMFD
	h6NOxHhGmAApmEWeq1u1zHP0QHEKKrNs9GMVhu6V5C+I2x5BocvJl4A
X-Google-Smtp-Source: AGHT+IF3qoY7gSceN/fbhxKkdnD6zQJOTjPDN8S8P9DFkKUNwrgCKIqVTZjMIb29WZ/70B+IzLTHyA==
X-Received: by 2002:a05:6902:e08:b0:e38:b889:7efb with SMTP id 3f1490d57ef6-e38f8b2d998mr4833160276.21.1732320215587;
        Fri, 22 Nov 2024 16:03:35 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6319e12sm888256276.38.2024.11.22.16.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:03:35 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/6] xfce4-dev-tools: Upgrade 4.18.0 -> 4.18.1
Date: Fri, 22 Nov 2024 19:02:26 -0500
Message-ID: <20241123000230.1479075-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123000230.1479075-1-schonm@gmail.com>
References: <20241123000230.1479075-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 00:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114011

Changelog: https://gitlab.xfce.org/xfce/xfce4-dev-tools/-/tags/xfce4-dev-tools-4.18.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-dev-tools_4.18.0.bb => xfce4-dev-tools_4.18.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.18.0.bb => xfce4-dev-tools_4.18.1.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.1.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.1.bb
index 6ca18b8b3..576fa3262 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.1.bb
@@ -4,14 +4,14 @@ SECTION = "x11/libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 libxslt-native"
 DEPENDS:append:class-target = " ${BPN}-native"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2 \
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-SRC_URI[sha256sum] = "eedb4fc955f0e3459c46864ff98579295db2b900743e0ff69cad5970ba76be37"
+SRC_URI[sha256sum] = "812cabe7048922ebc176564b73c3e427e467c9566365ee3e54c0487d305a7681"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


