Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB508D1119F
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3849.1764190161866478012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QSVb7y9j;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-298456bb53aso2542865ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190161; x=1764794961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kq2fcNVYJdalbrToEU5LR0/4GlwbFBUWh1TAol/s+m0=;
        b=QSVb7y9jqlaxHufmCX9hxwBjgv7hLYWN3WgJEQPxiNwSydAAawjjMG1NwfOGKpEBpT
         IuaAlYFRajVgP2NSZ8/1PnZJi7PvEuygB6Cn+VuAiE6EO5jBQtYNkgaVdhB9Xkv14j6L
         yfrJvZy+UYHPx7MbtYw0ND4yoCtsCgOdhUgBCBvtwT7RFTLV848J6NvywzpqshoyeRY8
         Wb08/SmYw5h+BAFTHQ1kob35EJRTZRaafnb+Nd4n0Qajc0WjWTSlnWhrRQXR0X1gJYvq
         L72EHEETbBBy15xtZWQlIB7WpL0BtSeXWCuezBhSaq8eGzGzwz00zTwHNqjntVYUJ8wD
         +jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190161; x=1764794961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kq2fcNVYJdalbrToEU5LR0/4GlwbFBUWh1TAol/s+m0=;
        b=KLJVNUnumTs8ELam/mFfsahXbUlcXenVVPS5tIaH5/eBQNetNdMX4KnaChNybKzCA3
         9+V0FequY/kmDCvW36yboTd4S24cXBgAvkum9FMY1pcpSVQVWqQ1KrqbBvJ1eybs8okT
         S/x8XQWiK4S/hgg3YanfkMObn8JW1sQBebczu0M8xNIpgj1d5Lk/ANt6M7vRk+GXFbg1
         TNNiq9ZiWDzIRAizIzREqQFwM2Q0kA2WLw7F6HfUHC3B54tjwwY3TdZ/dOytBn53vuqm
         nF3P9BhFc27Vza4uAJg3umikPBBqK38u+uMIvphdMV/9HxdQKqEqb3Tjt3/ZXa838jqB
         ijtQ==
X-Gm-Message-State: AOJu0YyIyZs9FtH/+UYUdjAHV1AmyKHIV+Qjqfs7xa64gX2DlYqQHu0f
	kMYBCgGmvEa2YeSRXt8FB+4CNWE4s/uEedLxBq1yKz5gQawDP7Ji/TpanuG5YA==
X-Gm-Gg: ASbGnctR0mm6GGEgmOJeubS5GukcCZKfcoJa6cgEY0rLn+P29QMgUlCIOQz3ydYkvPr
	JNRLOLUxZu/RERKfBlTzTfDhWFt/UrNaT6qos4+8NhcPWYWQ8Ds6VP4gqsI0p4wXnGsvXFvNsFa
	xf8OSLFjf1j516iQeSBD3b4XFBjvBhflF4x+TCJD6uHDWwt6iKCrdSpcIjzRiU9LJ1VtJ4PdF2X
	u6zdqJwr3Q2xR/1O23yUoNZT41jlZbS8JfZdS+jwx7ZSirItwa+53N/FvSCs1xKsmvc8MlDODPJ
	gHz9lSLVSAjDv0yX8SORNgTSvfxxVKTui3QfdYLGlCpBsuXYuJZY+X9wYRu4Cdox1kId4aKVuhd
	TzHmmZtTRTbunoL63ppPvtrBkiU8JBfsTvjWLD7fj5vUjHPOWkiUbiQjH2hvihpX2Jq3/lUtMDT
	FZ2yL7B3q0iwaQb5nWQH+mjkI=
X-Google-Smtp-Source: AGHT+IHHWZIYKerNtDdcfvtzUaHpDbK3ABi5J+WXoM4ykQzQgdZ/nfb3DIPYsKrgYP3HODrdJH1mDQ==
X-Received: by 2002:a17:903:458d:b0:298:616a:ba93 with SMTP id d9443c01a7336-29b6c3db802mr177102685ad.9.1764190161162;
        Wed, 26 Nov 2025 12:49:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 3/9] php: upgrade 8.4.14 -> 8.4.15
Date: Thu, 27 Nov 2025 09:48:40 +1300
Message-ID: <20251126204847.1969339-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122085

From: Jason Schonberg <schonm@gmail.com>

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.15

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 53db086b3504fe9e92b39e5a74fe0ec760f28ed2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.14.bb => php_8.4.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.14.bb => php_8.4.15.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.14.bb b/meta-oe/recipes-devtools/php/php_8.4.15.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.14.bb
rename to meta-oe/recipes-devtools/php/php_8.4.15.bb
index 086e7114fb..629eef0519 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.15.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "f2139ce4cb7a6c5643ee98caa34e5c32ba841c2ba293e34a3d0357faa84bb3e7"
+SRC_URI[sha256sum] = "b7155bdd498d60d63e4bc320dc224863976d31b5bd9339699726c961255a3197"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

