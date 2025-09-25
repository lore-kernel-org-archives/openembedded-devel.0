Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F45CAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:04:09 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.9715.1758801842498488126
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A2nE8f2m;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62fbfeb097eso1599768a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801841; x=1759406641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRPUWNqZ84aVcwObVY8gFNN714mfdpGQwTkNueAXueU=;
        b=A2nE8f2mF5UPoydo1XDiiZ9Hz1/OTNQIqkU0l+l2Qrn066wd2eZlpi57y0VeMTnicD
         d8VObEJLCe0K1LxOMPjK6uStIKktaukxwcvjyoITsh5XddI2pWF0vZQ5ZiTr8IIk/Ms8
         9I9PWRvn+RDrZo4ErlmOeOavVDFcBHeGayQCudGNReWrnO12a818HG14zAznJeRXp9rL
         KPk2MBqKHgdrxdYeE1bfeq4q6JdwjjsWMvcz+X+MPRr7NLnp0lUJAzbuQ4MfzmkQfGey
         PLJNC5Yi8ugYK3ZkyxZzIDQ3eGEUa2mqoBmLsKYk4XWzcmlyMsoJoQWH6z/MH3ikmSmw
         ScbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801841; x=1759406641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRPUWNqZ84aVcwObVY8gFNN714mfdpGQwTkNueAXueU=;
        b=tWuudVAfgdx66jijM0CdVYNVKkicF+BZr4+rGgQfN1CeoAtwtiR/XBR5yJpqz0qvkB
         8cjVGnvwMQp34kOPVKpxLU+hzpwqDdtRBxPBfKB8YsRu8JZ+C+70LShRRY8PGJW6BC/o
         uyPPyRnSnoqyoHYuSSAnTx5EaZC53Cj2b94gcD4nicEaJKRZpmoHsSvxZQsLoYdLn58Y
         Fzxj+3xi/YPCaFjQV3efCCKntIZ7+iHiFwRqYDJIf9xYAn0pqBwOmqUFnk7mJfOeu6YQ
         q4TSNoMlijjf6HnZE7CVKr9rlK3FZP3LeZOV7UsXhGe8R1E7jnOSqvc220LLVIrHWS8p
         Lo2g==
X-Gm-Message-State: AOJu0YzIOjq4a4fDns+V1vM5B870h/jAu7P4cZqmE7MFEfHD86HTqW/R
	7BBpqf1RsD76Nphryl7xAYyTQB5GBw/E8CPiLJClbkHiVzb3RGH/vYWSz6PR7sHg
X-Gm-Gg: ASbGncsFE8TYhwy9EH89DMZLCpTbmpdJrI3ahizzmVDQtzPnTC+SJzZyZJE6R8gdu57
	TAG5zhkbloJwD6bRImpkgaR+h77PFDUtmDF1khaUVJ02tYyGtDei0W46V//DFCs52x/DqI83vvi
	xL9abBVxb3b5GaUbPsFT4OVQB2UXL57dBSGB2lJkPU2hu43YXHcAMcvpvCFk3r2uuzcqFJ0nSCo
	Y0XBcnBxs7b7dGvmuMcHUGRhiiHz/I4GY8A+5HWRjic+ik07xVQKh72nNQiYsNAfBJfekahKNml
	wLkbFHw2Pp7OL988nO/RfYVOf4kWS/GUyLCZm9NsiE7KAGDS3y41sJHB1rgmZMRgSn934zabT62
	P/QjubEeTvffziGvnzEnPgQLkLsoSOJDC1GMxDWjRAMG+6S7ynA==
X-Google-Smtp-Source: AGHT+IFD2OHyofKM7ds/mWxDG8qRNQjkZNB08J6hCNUphPthIS9TdRiN//ADrIzpupIHrRUdvhblpQ==
X-Received: by 2002:a17:906:7954:b0:b07:e212:4bf0 with SMTP id a640c23a62f3a-b34b73f3982mr381930666b.20.1758801840343;
        Thu, 25 Sep 2025 05:04:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 21/21] dhcp-relay: Pass cross configure flags to bind build
Date: Thu, 25 Sep 2025 14:03:33 +0200
Message-ID: <20250925120334.1670367-22-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119881

From: Khem Raj <raj.khem@gmail.com>

This ensures that host tools like 'gen' are built for build host and not
target. internal bind build supplies its own options to configuring it,
where it does not pass --host option and as a result it does not deduce
it to be a cross compile and hence these variables are not set property
inside bind build

Fixes
| ./gen: /usr/lib/libc.so.6: version `GLIBC_2.38' not found (required by ./gen)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d57c4655623a7271dc93cfb741ffdbf1b511a5c2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index d36646c0d7..e5f7e0334f 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -34,7 +34,14 @@ SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 CFLAGS += "-D_GNU_SOURCE -fcommon"
 LDFLAGS:append = " -pthread"
 
-EXTRA_OECONF = "--enable-paranoia \
+BIND_EXTRA_CONFIG = "\
+        --build=${BUILD_SYS} \
+        --host=${HOST_SYS} \
+        --target=${TARGET_SYS} \
+"
+
+EXTRA_OECONF = "--with-bind-extra-config="${BIND_EXTRA_CONFIG}" \
+                --enable-paranoia \
                 --disable-static \
                 --enable-libtool \
                 --with-randomdev=/dev/random \

