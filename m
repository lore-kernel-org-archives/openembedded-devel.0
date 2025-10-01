Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E33CCD182
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:36:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.12481.1759309379385021797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lw8OHhrG;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so23899775e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309378; x=1759914178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=lw8OHhrGGgvd4fEtn1QYwWBUn8IaGXKGWEXlk5lgWkWWh/WLuNhK6+4VdjI2IpTiQZ
         1APu2IZPhz6n8w7Nq+6lPtcRngX63Hou9y58vNS9udsS09DhuMwRp+zwHHlAbQ8Vt3O/
         cOOhMJUGBQT4vlBwHJIIJ8x5Bm88NWFJ+guTYamEg1VJ0Np4XM8Z5DABAj8AaqTYqJKD
         JVATBjTbXXsSzet0fICiDtt2xiMD+/jruHo4DGOrf1DzvBpXTSON8qzPksvuVKMuEiYq
         EnvceSs4eEIXV5Hgbr5rEJxWxjigy777stXD8rhTPqeEt/wLkc4/1pt5LhnMH6knHmR1
         VkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309378; x=1759914178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=WJSbshSJw+fOEJ2lU4c+Zz/up5+bHqIpxcD8K8cqIOHrHrL19uRff7YWEv4ogG1NNo
         gwzJh7Feh/38HUnndKSLeaKG/XvLdLDMyiY6bAFZVQy2MmyH0ssfwZ4M3GdP1OooowtT
         PNMLTp4weqmVVpdG8XtjGRz4BgZdcG6cG41OLCUbcNLwrBA40fFIWZ41JiAJVNuXkOQZ
         jMPWFr3xoZbYKkxJksE3b1MEUwJeAsGPW9eGkz+kbWOe8vRYOGFQohyBYIjtg4+apxph
         +3yzUFwHxTRx5wWkDbgBRHuZOIDDjcNd2WyMmPcLECtXLENONDy5QFTvGycD3M+SKQkS
         2UQg==
X-Forwarded-Encrypted: i=1; AJvYcCXu6RIKM9fnmhKd0m25sUZ3GV5kqSyYu4fhxGH2vup6V2hl0tmn8hs6fLzbJSNxWkLHXHROMg7AH6I2eHdMHpyBkII=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPaFN+sVRN5UKTsY8ZDI9J8vQ+AQ90RdqW8qeAy17l+tlk+GqO
	YX8hTPlCSak+vN+E8xH/RJ3ZpVpmgSAxlna+3FYQKKjkSi/ebAPOCtzS6oLYDMdq
X-Gm-Gg: ASbGncsTA4pUwJuGsXe1cJiiiH6QhYbBn8zI0MuLprgdSntUGlbJNA23T1xXVHQBMW3
	gex4bU3ZGsBz5gcJQ6CtuO9AhCJHHe0po5nPD48TON/ynEhRjD3TG7zDmYbuSZogwXHOO9Xnb4+
	OQDgdCBcif1LYX+JG/XkX8lE/8ck3tu0NhnaO5DlfBli/JnkH1X9F1v8fALdHcaDMBpkxr6XkN2
	pKvtAP/5QVYcaxMJYWYtCRKcQK4cfndZEyAH9vHjUEngeXHYIfM0gyrN1+mAvg4ywp5ra22MS7o
	eUUqObEyX++hoe0G9XqlPlt9atxaGt+h5cBNYY4vN3SV6sp2l+dIdsMAAQqo7JDzKE1gt/3ESR+
	j6mz8XbcUNUVjiS6D4R6snAwCwHKCHz2AxU2k8toQhtQRBO5GiXLB8sBYv6uFiYzTxb4xaCMYJc
	nMxL+ofmKApR8W02WhG4dIBoEMhvAMulqax/4qFKj+0bF0HQ==
X-Google-Smtp-Source: AGHT+IHjBl06cNIxznJAqkgZtHxKpBdTpC/mSYcTYUwqI9K9C9W3EHZbMOvJRJkDIMCp0fs92omNlg==
X-Received: by 2002:a05:600c:8b02:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-46e612dafafmr23189455e9.31.1759308927570;
        Wed, 01 Oct 2025 01:55:27 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199f17asm29487275e9.6.2025.10.01.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:55:27 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: randy.macleod@windriver.com,
	tgamblin@baylibre.com,
	joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 3/3] openocd: enable dmem and jimtcl
Date: Wed,  1 Oct 2025 09:55:21 +0100
Message-ID: <20251001085523.1563-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120101

From: Joao Lima <joao.lima@hbkworld.com>

Build configuration:
   - Enable dmem adapter driver (--enable-dmem)
   - Enable internal jimtcl (--enable-internal-jimtcl)
   - Add both features to default PACKAGECONFIG

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 846d2f62c5..b39ca5c244 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -55,7 +55,10 @@ FILES:${PN} = " \
 
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
-PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
+PACKAGECONFIG[dmem] = "--enable-dmem"
+PACKAGECONFIG[jimtcl] = "--enable-internal-jimtcl"
+
+PACKAGECONFIG ??= "sysfsgpio remote-bitbang dmem jimtcl"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"

