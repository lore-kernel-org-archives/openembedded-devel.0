Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBDEFB3D0E
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47978.1774867159819330218
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ljfi5Abz;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so559728a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867159; x=1775471959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdYReprkgEyf1AVzoaI7iTorTLtwp6txQQfiBvWkD24=;
        b=ljfi5AbzpwtDNcBw43ChZolj6+vPfWpv4BpSkuXyhQRW7f5Z0mI/MI5vS/CTsAblKZ
         A7SsdjKQklAIbSvgnqggFOPxeY1KJk+dr8g0MM1Mz3neSyjbo/MjQKw0921ePIOuakY+
         E9mgMr93nTQvAPpv2M6ieyvN/0Tt9hOQRwJ6B6MmfjeR7ongnFa+Z80IFaGvZaXxn49w
         zVYFthBptuGM4H8Yc4rMtAa4iS6sncyXE64NG+2Qd+cwXo9fFxSv69rXeYxSHfXIKdCs
         LKC5Ez56eW0A6AaNEXp4ByxwU5M9qb5/e9khbLnoxqivhiQu1JBBET030D4JKvaDxMJR
         Rp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867159; x=1775471959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdYReprkgEyf1AVzoaI7iTorTLtwp6txQQfiBvWkD24=;
        b=C561CBqGp3UVH5T6AWq7RJyQyNymCRCPhLg6DVC6rmZn/wVDIphgCRmLN9krWQF+Mw
         j4JS1lGlGg2mRDKQ379u88h9EfXcAG9rZBfoZffswyBogeESW2UQJgBQ9k//A7n9+rbu
         p9F+VxKNsfMdUsuEuatTCRGtBu8W59VFCPyTSFmLICGwLXhW+VOLEJd93ZWsx20jY/NQ
         6xPvcrOtntNzyE81dgbfkQX3ZiVeqTu9pP7RDNxpY9W4NgwzhARVJwoH2e5W1UqOdTIe
         eeE3dfKkBgTpb/tio8SddKefiLuaxKDpKRHUZmo7cQszzb7RPI3+IMIT51ERgPY4KQCO
         47Qw==
X-Gm-Message-State: AOJu0YxBe/+J7S9TDUJJ/2n8ydILAbna8P78UIvIoLIfgbqE/fgtDOEO
	hOgcH1GeI0SCMKrcTnksQA30Nm9mYQSsEsdv1wdnwcGVTafoc4bHhpxs/2JnDg==
X-Gm-Gg: ATEYQzzOo7mQ34ihDmgtt4j736y/kQLqhCqtATE0g2lO2cIjZo5fuO7MmHS/an0IVi9
	YbFJHMX/EoR9l1fJZb4hBpTIq99npDs8s/WjQW+UO+yZu6E9+23xEhXkaFQrSayS9oUmQBAEQyj
	N/wrEhwHLT871wF7/YPIEuNzD5LU5PViMhPYfqyEw/YF88tVk1eR1XFuC0Tv6eOGk6gFRQSX9U9
	8tCkN0+AjNZ5UQxiKzI25q+WGAatTzNtEBj2Sn4wnQ7clhibkkL2NEllLjyEIxlQBP445cthPzw
	XwEkGvtFqfZukWpEXy5SZKFhUbmkhD4cmluf25EuCAKw6xvEDgdjv5cOz+CmP/o0XFYWzuN8ZEi
	+KQ2UHOSKfhSwadjVYFIKOQhLo7RVhg+Zi1MiZjxCJ+HpjUGXe/8V6pGA9jYZ3USXtH5SgOXQQT
	UviG/4n/3J04aHne+2s9zI8A/GLcV6ewMNL0Y=
X-Received: by 2002:a17:90b:1a8c:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35c3005be93mr10503447a91.22.1774867158973;
        Mon, 30 Mar 2026 03:39:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 6/19] hiawatha: fix SRC_URI
Date: Mon, 30 Mar 2026 23:38:33 +1300
Message-ID: <20260330103846.3381644-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125849

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The tarball was moved to a new folder on the source server

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
index 720c292026..2362c4480e 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-11/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service \
           "

