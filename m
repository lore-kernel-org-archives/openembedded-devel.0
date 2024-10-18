Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E418FD3F283
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.29965.1729278809400840872
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJ9URecX;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e396a69062so23918087b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278808; x=1729883608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5zG9rPGqnVmELr0PNfSUt+Izra60CYQzz1X5nM2Yy0=;
        b=OJ9URecXwfbuSKCZkAnahzqQwaWsJWcRwCy+1cj8rGsh2RT0Shk/tTyfdfHxBVx5hi
         pwZDXiaKxNUFDwjueP0QW3i58EzzCTOGisAmHwvO/qt42hpdYQ2ld45Y2Viha+1LUhR+
         BlBJ9w0x57VfvfqTdiZFneaMBF49Mt9/v5s1klp9mp/v4fzTn65OyEA27Hgw5Y0Xmgk2
         E0jdxumIDnPW4ai6GIq9BrKNnTON1Rxmf9Pm9K4uEOW7xr1cS++ysHfNKjB9TvPt9B6r
         uFzSMR9YfsBayNFvOmnN9hNlC+DuAcicmgF5Ys3Rv/vmfS55ufQ+LWlsB7mZCA7ZnmET
         InLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278808; x=1729883608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5zG9rPGqnVmELr0PNfSUt+Izra60CYQzz1X5nM2Yy0=;
        b=AAoTyp4hrB7t9OUPPyxey+mMB3bofxB3XM9lJIAvSEvXQ0QrZ+cqYRZPqURbU3pvj1
         0cV+g1i/I2b2MjXO62yfJAU2ADDrXCftG5GuEiJCB/iGY+sNOw0nyFw488UzbFn2KAlx
         n+nYWdFn6pvPTuOmbOflwkoEnCgkMNcVBgjMp8twsWK4AZrjhgiSZ6rvzBY9L6ZQ3Qw9
         pR1oBfX0RIQEv17l6MiGlwdQ7vBi/gp1bAp9KtbTqKnAhXHCZpwtZVsyG/nqS+jwE7mM
         qlrI7lsvXO/8A/hdf3rKqdbwQtbwt/JOc9EQBA8z8iLAc3SSTjBd63mjVKjJwmrvzD8Q
         foqQ==
X-Gm-Message-State: AOJu0YzuU1wnA5fkVGA7Mp0JjdZyvikvXvZYD0dPwFLp3w6zL/savr5n
	FF4HHWqna2ROrKdZGzNJxiauCSzZW5xZdUvexShJmQ7VKitqNYX0kGaA+Q==
X-Google-Smtp-Source: AGHT+IFnGozwjcPXq+bW/GFc4R+sjWySRQSDyg1LPMi9ItGRN/uW8PuTEahOq6iJZq/9Sn0HvGkwmw==
X-Received: by 2002:a05:690c:48c1:b0:6e5:af24:92fa with SMTP id 00721157ae682-6e5bfc7a906mr45578127b3.21.1729278808098;
        Fri, 18 Oct 2024 12:13:28 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:27 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 27/68] python3-html5lib: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:14 -0400
Message-ID: <20241018191101.25184-28-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113014

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-html5lib_1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index d6272a07c..94fbe0455 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
 
-SRC_URI[md5sum] = "6748742e2ec4cb99287a6bc82bcfe2b0"
 SRC_URI[sha256sum] = "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f"
 
 inherit pypi setuptools3
-- 
2.43.0


