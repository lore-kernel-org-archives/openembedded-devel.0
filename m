Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B02CCCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 15:55:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9144.1761753329698727652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 08:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IUzDNL/e;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4771b03267bso49725e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753328; x=1762358128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M2tFFVHiNiYARRWgQ9sPXb4DeDt6BJW9Ni/8PgawkU=;
        b=IUzDNL/epdsfxC5qlA4/6uRD6IsOBxQA41X2pU3KZHwxRoqqQW2gu35TdvZ0DbUBwT
         q2m2DnKcNIcwwU1c6Z+XDgecz/QBlQmz3/RfTv3LLoWsAyGr3LoPmN8oBW9gGoYxrljZ
         RtjAwfrODtvlt3xWM41clDXARN35I3QJZk7lALFGq29U83XH06dTLND1ZT3/QhAdhnAP
         n4gOWjqBJdEy9dkycuaEPZ3unn9pkWIZ3Ptus/QxKMCxn44rYx2gXgOjI4WM7D4amvoK
         vcGec5ctUrDE6xFKe8N+Z6KmtimbqzzCwqAjZXA1ihdxzaWEszlA2Id06ngri7+wnL9L
         Zanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753328; x=1762358128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M2tFFVHiNiYARRWgQ9sPXb4DeDt6BJW9Ni/8PgawkU=;
        b=gZKwvKZ3ZvoQfxxI7yI5HRZODuf0gyZJ2AKBKvMEDZeiDLdApwlPA6Lvi689uKgCJ5
         gkiNHi3fVcs0MFv9MQlC0qraMhU5BES56CXXtt+RmsYJJ31nyikx0CbRR6JQzNjeZspi
         8OWOV3zFAsrJOeCS5qssWAuWueEIfdM9downmcGFz+ScegXd3R73ILTM4eq2XzLC+lrp
         t6VTdO5hlXwQUwE4h83FecyNbWu81WMHcAEySanEf77QT9o03LCyc1BX5d5H3Qkicu7q
         eeMB6Io2jmJmY1HM3ShlcKNWn/XK4GThsij9UjA8zDFcTDlivFTHmhDH6+EK/ZsDxTea
         vysw==
X-Gm-Message-State: AOJu0YzLmNYYMv6QY7pmDJIbXlrCsiCZn04gksT7IMxpYWv8Ouc5WmFu
	vy5KYrIMU4wp8+tpw04NYhW3B7s0lptUTtxP4x5ROcbQgpsZix8VDJvWrbqPbv7H
X-Gm-Gg: ASbGncv1ZSiiWJUrUPh6xW2wRJ0fmWGUMjnH02UPgtY6lpRrXYRPr1o/Bv2nRHmSlq7
	NsrFGlqD4srsPuA9SnEiuNgVQb1jDsN7WktMKUrvVwFHSS2yxWFl8soSs3U13GR5S939GZ87WiJ
	tWvPOSN8Cn34Vbri3UPz1WOGOi2Be9gFA+WE/PR8B3JA+KaAerEqvEuaD1/6LX/pTvhhYp0+2QD
	ATVnMvXlESIxsmPkisYaK/9dH49hjYtGOC8VF5CByE+Pio+Yr9yKQOWh4/BwUwYR4Qcvo34kWOd
	AxzDY80giDbJAy5J+3hFvvbUIjN/9v1W/VLi3alDPwkxh4FawAKG1TPHD5bO1mkjMtxUVvQaeqC
	WnkDgsh8J3G65WZfu9NCut2170oAR4rxCDt8wmcwnJ68BDmRcl9yXl66Nw08d7OH5V9/bRGUTYl
	lcb2CaaAMI
X-Google-Smtp-Source: AGHT+IH/BMZgBhKy0ECAyk7NLHvbphdwIq2Wmfhsj93hKQlEh+mFgDC/dICxgRnROxiSvpcO5eU94A==
X-Received: by 2002:a5d:64c6:0:b0:425:8462:b72e with SMTP id ffacd0b85a97d-429b4c7f8a3mr69939f8f.3.1761753327989;
        Wed, 29 Oct 2025 08:55:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d3532sm27723334f8f.20.2025.10.29.08.55.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:55:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 4/4] libencode-perl: fix ptests
Date: Wed, 29 Oct 2025 16:55:24 +0100
Message-ID: <20251029155524.3550326-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029155524.3550326-1-skandigraun@gmail.com>
References: <20251029155524.3550326-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121162

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
index 8b4f292a35..9264821917 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
@@ -85,10 +85,12 @@ RPROVIDES:${PN} += " \
 RDEPENDS:${PN}-ptest += " \
     perl-module-blib \
     perl-module-charnames \
+    perl-module-devel-peek \
     perl-module-file-compare \
     perl-module-file-copy \
     perl-module-filehandle \
     perl-module-findbin \
+    perl-module-getopt-long \
     perl-module-integer \
     perl-module-io-select \
     perl-module-ipc-open3 \

