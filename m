Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2107ECAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:36 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.6884.1758954755256636659
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IC11mwjN;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-42861442ec5so5729385ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954754; x=1759559554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AypUGIipC1yuGpZOuaIRbgK+upIeRDEmjrsJgNyU8YU=;
        b=IC11mwjNYmMpkvosfC3JfsXmsYKpTv85/uOkpDqqQgKpr9Zpa2SeV6neJNqEy924Ld
         UAh/abiVYn0VqsgEexl+Oz/yumuXh1aeuopFDRJcZedthLfqmySIdp6G6H/H5lxMNMgl
         /dUxKaQh+YA2dQQcp0+mwdlIkapMx/dD8q25M+UpskBN8kASat76GE6yylieMGdvhChJ
         eWEX4D84bn7u5ZW50kThD/bVAFGaq6QuSamq4nics3lC2yHbJNWZMq1H6g9yzfeEkTL4
         4Kg2bZVaCOOEWCb61W4eD78EXLLNQJXWyfqSsJmOf9BdiFCPSpXx2iEqjLzpWUGVygQI
         DJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954754; x=1759559554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AypUGIipC1yuGpZOuaIRbgK+upIeRDEmjrsJgNyU8YU=;
        b=KRI3gq99X5w9O6GtJW/WWU0UxH1LjEC9M7+Q2f1HLycyqi415lpZo1Pd6DSAxpdmjO
         jHOXzqrKflyE+Lx/gzxjTARSi2PeqcrHXeJs+FeDOXOE9sgN3E3elHgTrlSlpd+JGZbW
         b6yVfEfU7zqqOm5lYbyFqIR3L2DLIIVZWdleshCuJ9dtoE+duJEFF1DXeZwOVm9Q3eQh
         owsKVubcafNyq0V3saERl35kmgWutITlBSHh+zCakgB5CUEoDGiG7EL67XXOrnuOrNNw
         ZSYEBN4mleMPsW8Z5fFgElzrOypVu8PAUt1ZkD1YimuZCQnrtSjAYSNt50I8lTlRgL0D
         Db7Q==
X-Gm-Message-State: AOJu0YwhwS8RQBOoriBy6LUfaszwj4wlATbZ0XDYSrxegev2E4u9Fpsj
	h6NHVUAVYLc7hhhGXWSC4vChxbVVo9XTV+6S3GNVCmnBFqmkWcsL8jWQU4DR9Q==
X-Gm-Gg: ASbGnctY2YjlU21QBnnP60lNCKbY7TBuqpNTxWoqdsQt8ML/7d8/G3DNdOFEFpM2SNJ
	9diKcCY18FGAX56/M8COAhcfp98r6WNfusRSUT6UhZXF1muMZn297q0o01lJiYQyaSEubDewYJu
	qrPLtj+3YBMOwjFAjTWXzItXjpzgBp6QdgGgD1v7xaA7eeUqbCeFAWUIqw3X33m1KaaqRz6DBWN
	Tp+4HpeE0oeF980kW5jVrjRmjWlsbXVqtjxmCaq3zD9SosbrrlewI7nDcLudZyZ+maJTxxnIxhC
	fqVr2nUxHOg2FQ6TtfoOYjAG1YZYrkbwhzlnOGBZE2S8uPjg3CtgFPpn7u3PwTVsE5lgZKikYs1
	PWg72GXWc2uJZnsjSnssPnz2lQp+LPDAevn0eJrbcCMBtIPcwxzQOmqX2YIqslg==
X-Google-Smtp-Source: AGHT+IF5xRykuUtmByNkrtrb1N2WrMsPxRfemfbkQggJRLRKEbMpreqbodPa7VFKqCUPPE+SpksV9w==
X-Received: by 2002:a05:6e02:4c0a:b0:425:8c47:13fb with SMTP id e9e14a558f8ab-4259563c2femr140362835ab.17.1758954754296;
        Fri, 26 Sep 2025 23:32:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:34 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 04/21] libimobiledevice-glue: upgrade 1.3.1 -> 1.3.2
Date: Sat, 27 Sep 2025 18:31:59 +1200
Message-ID: <20250927063216.1865627-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119958

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- socket: [macOS] Fix build on older macOS
- socket: [Windows] Prevent crash by properly initializing memory buffers
- Switch to better initializer strategy
- Fix compilation on MSVC
- Add extern "C" guards to public headers
- socket: Improve error message output/verbose logging
- socket: [Windows] Make sure errno is set in error conditions
- socket: Allow setting debug level via environment variable
- socket: [Windows] Use WSAAddressToStringA (ANSI version)
- socket: [Windows] Use inet_ntop instead of WSAAddressToStringA for >= Vista

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0be8ef7617e7cd14b9530c42907fee62218928a5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...obiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.1.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.1.bb
rename to meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
index 2f58738c30..977f34b574 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.1.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist"
 
-SRCREV = "a4ec1cf9cc7084cbe5571e31640ef773701e5f51"
+SRCREV = "aef2bf0f5bfe961ad83d224166462d87b1df2b00"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"

