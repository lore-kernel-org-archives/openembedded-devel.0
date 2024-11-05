Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A251D2C122
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.19546.1730817422841109349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e9qoNj26;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so5594443276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817422; x=1731422222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woHFkTg6zLo4m2PzpfvA8bk9tqjEZOh9wdevQkeJQ+I=;
        b=e9qoNj26MFx0g1RBpDnotORV+8XmV8xW//sD9qOOF9+CKCQiGAY2U4bqLJKP0znceR
         nU/Qb/2F2448MihMAa7+ULmpSnNWYjJnpW1qyM4nZA+Cifv2CQrspqby2lrlTJEE7v5E
         ETGgBkN57WzTbmaSjE3Q/YCKLDPtUUVg3oY05IYw5gGo0l9/U/XCrQ4U2WUgPbyak1NE
         ElrGURdGzH0rcvw9+TJMpSPhrTJIJQEapuiBXuA68uU9qQerbtlanREuS3E3G/U6KREn
         e8eUZD+tMTs33tKEbsjw7ifTm7j/V/MDcMOI8eV7Yf8pWFunEtl1Svf0c8nYuTsfNa0I
         +A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817422; x=1731422222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woHFkTg6zLo4m2PzpfvA8bk9tqjEZOh9wdevQkeJQ+I=;
        b=aX7+sIb5KkDE+VjVrK/xzeUaRTgfEn+sYiZJEujK0sQoT818FoVALUFJF5uWd7Hd0w
         j7FAGwpiWYP3O7sh9IAipdSyi5zeMqT6pN8W8YsHEWaZC2jZihjgr5PL8M9yI2Y3X1cw
         q4x3NH08kPYejMWYaAPuGQUl4zZZMBIecHcLxa+JKLMQ5FZFD+MEF/sU6km7r/XCHHnT
         DWI7DQ3nswbg8O0b4eTOyKn4UJpjtX6mfvjwNVvOnLK46JbWMArp1iQQyf8J2ECa77hc
         MALxCauF45opbvB98h6cpbNP/nvR1QKhMoq2a/TjfDoGgr3zBqdfx4J9x/XuGGhoEA+s
         Gt6Q==
X-Gm-Message-State: AOJu0YyJdPNjzy6zT7f6vv5FppCmZFl6ssUkz5gxgSxga9cZafKCJpe3
	N3gKzYIBFWoYCXT93faHIsfW+pZ1eVA381vUDVsFBY8cJxg0lvv7uPcXxA==
X-Google-Smtp-Source: AGHT+IH2+ta51DpcKYRp6WDZlVxPsVidPqhK7JD9Z4ZvBVcVwZIlibxvjpH12I6+hYZ35L47RhHBFQ==
X-Received: by 2002:a05:690c:9c0e:b0:6e3:2ec1:457a with SMTP id 00721157ae682-6ea64bb23e7mr164197287b3.29.1730817421896;
        Tue, 05 Nov 2024 06:37:01 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: s-tokumoto <s-tokumoto@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 50/90] fuse: Add "fuse:fuse" to CVE_PRODUCT
Date: Tue,  5 Nov 2024 09:35:15 -0500
Message-ID: <20241105143638.2301245-51-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113468

From: s-tokumoto <s-tokumoto@fujitsu.com>

Since there are vulnerabilities that cannot be detected by the existing
CVE_PRODUCT, add "fuse:fuse" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2010-0789
https://nvd.nist.gov/vuln/detail/CVE-2005-1858

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 6f613e9cd1..fca7d42b39 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
 
-CVE_PRODUCT = "fuse_project:fuse"
+CVE_PRODUCT = "fuse_project:fuse fuse:fuse"
 
 inherit autotools pkgconfig update-rc.d systemd
 
-- 
2.43.0


