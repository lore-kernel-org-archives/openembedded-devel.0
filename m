Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580C9CDE004
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:50:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10455.1763092239326511219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MF2dPO29;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b0246b27b2so1936215b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763092238; x=1763697038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyR4vw5RBJ/s+moS7YB/AOT5GlD6/azk1CD4VuI4abk=;
        b=MF2dPO29bvfcM4wrOHHBfO+rWyam20axplIT13NKiBXrtpviUhuddWH8wjt4Jv/x37
         ktoBNuqFimkyKg0ZlRkI/A/yBUh4YIlIgIxAjxVwmcxNkLluykCx3bqGCTs9PBygRD2d
         6yE1f2a9r7Hzk6wBceqxHFJoUPxsy4XsBVFkwpvtT1Gky1ElBNpZ2PMmECJkTcFOQWp4
         akZSCEYR4vGbAGJ2TXoMJsq4s062194GXc0ZPxzs61OfLDE+f/kmn+KsgmPyDekplh5P
         v7CAj6WVpqqXx/ebK8gMSrXN8dFbRGugYxT4Ig59WBvz7Q2hnnsDMVOuu/TDNFn1+IKG
         uJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092238; x=1763697038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eyR4vw5RBJ/s+moS7YB/AOT5GlD6/azk1CD4VuI4abk=;
        b=JMVGUSJuOduvkISv1UYl8pzS2PNH5oDIhCHP9sxkwKyhSSwjoYvJFQPA6eZ3mjEYSs
         MuKBhQGgk5jEt/qjjJBYVFZUX/n8VkYa3yzJMvdQZQjtvyego8a9XcJLfK7oJ0y/CN2E
         YGpVWsOKe1ysKRbkH44eDJOr3eEWPnXoTleaihWt4SohUdRkEaz0HDby2uKDYBQ2nrlu
         4dnzlhklYhlJkZCZceqqdrhkG71n6R/2C9yBXvb0eLodwzzIi9chkkxJalYoJu+M4dVa
         hGO3rkuD5qFydQRorIZl2tm35j2TRfeffRibeI4EfmaNqURZaj1JvHJOfosGoX9bbJwt
         B0Qg==
X-Gm-Message-State: AOJu0YxbI1AQNYpPP5Fm+qSMPI6yRkUApDHzbDrq5jTbtGgE1DZqYSkM
	D4czLUj7IlmJdXG77H2WQW9bf7chgSZGJ7tH0IyxFvNXVQIVjF11xx6sK6Roeg==
X-Gm-Gg: ASbGncvw8Q15oXwyd7xSrJ5hp4JwHdjFE38B/Q+G0Ab7BN/AhQM64xvMovJOAwJ+ken
	wnyNEuALfMzo/7xDXqUEr1ZUic+fMp/z1/yGAcok6J9xavS4vKHzJmjagA9yTbCC1eXe5OP2f8v
	TAtuX8Rv42rcvaEGxRPoLaFZhG8skZr3AmCcmnrEh6S19ysQ42wlDDj8QsGN3Q/oZQB3lqoEPmX
	klGy/KawzaKeGUNmIgsH7W84aLL6LQdEbhzf+Se03QS0ujG9+Xinq0vC3MgOwfiS4oVlEMomX9f
	pJ8JNlZ3zWbqVtHiJ+2H8D0Obu6wueOQD5+Etk6oG3O+vcL4Jt7OpNgbIS3JQGHnT6W1lqkyQ20
	VaK7uDOzokhlLfZwPx5XUmSp/OKlJMC1N386UY6rd6TUUs3byBz9T9UB6XdcbwQY31LUj1myhnp
	WRU4Q4S38U664ZIA==
X-Google-Smtp-Source: AGHT+IHJD/CAFAhzFQMhDDuYrDFboGC0MaNc0xf7y1MuUIifbu2JXMn541wDDHgNyIz8QjL6O4wIgQ==
X-Received: by 2002:a05:6a21:6da8:b0:2b7:e136:1f30 with SMTP id adf61e73a8af0-35ba22a4fc2mr2466530637.55.1763092238522;
        Thu, 13 Nov 2025 19:50:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm3478092a12.23.2025.11.13.19.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:50:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/5] libtracefs: upgrade 1.8.1 -> 1.8.2
Date: Fri, 14 Nov 2025 16:50:27 +1300
Message-ID: <20251114035030.4042745-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
References: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121678

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

New version added trace_sql.bash for tracefs_sql() bash completions.

Changelog:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libtracefs/{libtracefs_1.8.1.bb => libtracefs_1.8.2.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.1.bb => libtracefs_1.8.2.bb} (89%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
similarity index 89%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
index 6b9e8b9b38..bc7311a634 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "417c2e3aa21af670cc5c13db633dd35292f2d0fa"
+SRCREV = "03790961bf2e83b7b61fb6d326fb1076a4293adb"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            "
@@ -19,3 +19,5 @@ inherit pkgconfig
 do_install() {
     oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
 }
+
+FILES:${PN} += "${datadir}/bash-completion"

