Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56B5D33A5F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.27731.1730831896879580757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6rj8IVo;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e38ebcc0abso65942077b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831896; x=1731436696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paNT1GP1k6lV65ZVEdIcKP5tQKsrHGD/J4HYtVv455U=;
        b=e6rj8IVo1F6JBTk1GhXg+IZ8kC1L2FldIlQ7Y4Q3fisImPNnBdQdzhR4OblwJ/x6Ug
         ai3LOvIcA39ofAkT0rKmkhLqYCahznzGyzxkGbyKfyCqRSiffwrDyHE4kHWGAOvaiz/g
         1uBi/tU91ETAPhinJQxGbaOtulZHb61e4WTh+3CKcajgglQ1BtrCr4c2z246Am+1XFPN
         twp99wV9zjZ/DQTPblmf9ny7tFx0gS3tMBbVVDY6uJ5nV1C2mjyjPntCRfDOrVmB01rv
         bJ/RiQVYbc4zXopXaF9CDBEjAWWG9OBts/ZuvnDmLVbMM0sJ0CHG+YH6E9wqIzEz/Fty
         AlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831896; x=1731436696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paNT1GP1k6lV65ZVEdIcKP5tQKsrHGD/J4HYtVv455U=;
        b=TR5iMSpkVfa00c+WvI5g6g7CnGHEhIx2aErQGUwEpIipuWDV9RkFlNDp0gnbLIPew5
         Hfewq5D19s/6oxpdc2A9TrbAOmTM6DzFGPWK0+xxsCGBm+dgIWIy9lFqIbhE6DkMZ95s
         GoCbmd7rwUGw6l1kVf/JLqard8O4Vt5BxBEdhbZdrvM/MxIKKOBJ+KdLa0rcQrAdPWCd
         NWpF7EppVWZz4xZamapWxF9Ni2DpfuG10IuRd051rElIk4pMvxKN9TykrBzrXUJL8/eT
         6xPaZIVHdNcu3fhhJWUfWHEfIh0nhcXI7YRzWlEg1JQLRaomo6s/6PPtGXBjCzHDHk2m
         DG7w==
X-Gm-Message-State: AOJu0Yzfu/wZnhg6K1eTohzz77FUNz2WnMvz5ZanbCE0KIe2k0fxhddD
	zWO4d3Z6xYq4HWeeaDv+tpYEQRY4vKuXOJAX0N9KVSszCNB/BZsz53gRaWJz
X-Google-Smtp-Source: AGHT+IFPtSXZAnmFyTA2VUpuMZNNiB1bbazMu4hCpjKNi18JGwsd4Z4MhnwEh/MHDkX6UuoNenvd7Q==
X-Received: by 2002:a05:690c:6c08:b0:6e3:fd6:6ccb with SMTP id 00721157ae682-6e9d8932b09mr390908667b3.13.1730831895539;
        Tue, 05 Nov 2024 10:38:15 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:15 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 024/161] proxy-libintl: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:00 -0500
Message-ID: <20241105183658.34982-26-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113539

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 28213f387..58aa3216e 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -9,7 +9,6 @@ PROVIDES = "virtual/libintl"
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${BPN}-dev_${PV}_win32.zip \
 "
-SRC_URI[md5sum] = "aef407c2b97ee829383aadd867c61d1e"
 SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
 
 UPSTREAM_CHECK_REGEX = "${BPN}-dev_(?P<pver>\d+)_win32\.zip"
-- 
2.43.0


