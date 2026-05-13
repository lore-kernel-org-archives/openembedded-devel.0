Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB88ACD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:05:08 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.730.1778648700591675525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o0fWqh/Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-365cae89bf5so2764409a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648700; x=1779253500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqI9LZ00tC3+zj2ZRVhCo3fn8gFbuzAcPV7/r8TKxmU=;
        b=o0fWqh/Ya3KpyPZQFVhS3kCIhBLDFa5fWqgHUrQQDKqK8PM9B0BQCFxFJAuxMGtUmB
         yLfiV8FArbtCdHcstxBGRAuMvU5MGs/8dmGc3834P4LVi8qjwA5SVO7nzaaZ5d+EIHn6
         G3Ib+FENuY7OqMk+pxnDVUSDHJHoxJYNGPSl55h7w6kwyf6BWlfEBbYyR2z0lxDF+eL+
         WQ3JhQHWsjz1Rn0NrrI4pcIXRzKkfG7/sVndheB2itC9EnoJh7JQgJVle+g70L6+Qh8s
         Yl7AQAp6b6gihcyaiKZhf1f1NjJSWOaeWrQ7ScewURneUsYRWnAJVD/LTLD+h6v/QGEd
         6dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648700; x=1779253500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqI9LZ00tC3+zj2ZRVhCo3fn8gFbuzAcPV7/r8TKxmU=;
        b=d7TPdrJ7ToD80exvNe/oGb6zWbxdKRBjh3bjQFbFJWR6dAP3XKwEbA/T1mpBfYF/oN
         szlwB2T+w50cFIFHTWGkm48TPrBgh0BLHuEgcm9+D9ncp9yycoxBuJq6z6PIo245FT9W
         GrRmJbVQCxr/oWn903qoBfYkuvRzzGqTQQBbtD4sYpGSaMMi6mCzRf2pUl0ygp282cJP
         ycAfetU9JoRzjvzojcD4cEuzYboQ8M16WRjn/UISV6e6DcUe8Znq7QwGgGdZ0CALZmxH
         BEj4cr621EYNMHtIwRHIYsNbrx4k99bEeSl/m96jDeNPn48LLeFT99gJ1wzWS5Rx2ONz
         6WfQ==
X-Gm-Message-State: AOJu0YyRNjuO0q0hk3CWlGMMDR4Q1BHoZFyNSi5uux2L1/Q/Py5/lFzP
	swc4y5ZhYW3Z4tfE9/4mZaz/TwDeb0p7qrSOYlL9dHbMzhD58eydbTOO7HHNXWIw
X-Gm-Gg: Acq92OHarYOkadLAJvxuCM2ENcIZMsuFLO00g7ts9k6MT0t+uyphXzd4W5+CbNrAvDR
	qzPFOGlLyAb5PQPRIRb67IrsZaON+QgHHJ4Wr8T/Q3RQn1HLIrnT03cAJhvrPaBEx0KxYDIMQ/m
	/nCfNc1QPu/2pW8c40FuXYy+hItI8s405KBUsdWrumyofn0Wp78ZYHFUdm1nG/vvbVjJZSfIf70
	fZYUWKjTFI97xrZ1LVqr8nqUwF/NJcUwLQ0NSUMcqd/tBNJIJD0eRS78ajJcxy33OuajrVQ6YVC
	+IOjmWI5nFX//qjMKKpFM5gQwuedeUjQNfuTtgbR6acZi2zXPK0VItg+rMplPi4WRQqPoJxjpTA
	DKN3keK+r36gZa24dpBHzmsmlie4U9rrDXRQs79bjCMfUyIZ0gmulrRozrNUnOdRFGpLgivdyNW
	9bitwZQc9lEUpyRH4r+QULIq1G3s9e4y4rxabD
X-Received: by 2002:a17:90b:574e:b0:365:3154:7b1 with SMTP id 98e67ed59e1d1-368f3e5d0a0mr2038967a91.26.1778648699720;
        Tue, 12 May 2026 22:04:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:04:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liyin Zhang <liyin.zhang.cn@windriver.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 2/8] apache2: upgrade 2.4.66 -> 2.4.67
Date: Wed, 13 May 2026 17:04:43 +1200
Message-ID: <20260513050450.3515182-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
References: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126945

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Security fixes:
- CVE-2026-34059
- CVE-2026-34032
- CVE-2026-33857
- CVE-2026-33523
- CVE-2026-33007
- CVE-2026-33006
- CVE-2026-29169
- CVE-2026-29168
- CVE-2026-28780
- CVE-2026-24072
- CVE-2026-23918

See: https://archive.apache.org/dist/httpd/CHANGES_2.4.67

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
index 0e96643fc3..1a091d7eff 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
+SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
 
 S = "${WORKDIR}/httpd-${PV}"
 

