Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D5BFC6177
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21542.1767430121457139552
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 00:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYM7SxWR;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso113497645e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 00:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430120; x=1768034920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YP7TaSwPbfWbjBIYENl/PHmWuJ42b969Ap2VGXi7NzI=;
        b=YYM7SxWRKmUa421a/Yj3bYEw6bEeqk9jCQyJt9s2OgtHu5NQ7cYJXDzRD9tGO8Ta0P
         IfR80sHaLhBHWzGkb8BoJkD9Yyg2Ua9YCDJ7mNjfCrt4ZQhWsda8br4qYb5VmhVnaDIx
         2qcaQw75uXQogz07+2GXcapr04CCmE4A79UoprkXx6dHB+kp1BHWoV51Fr2Q+cBgB+Jl
         dNJ1yHZNpOumY7NDy0XGks9jUeb//BmwTeGWLQUGCxSunfhniJgaoeTX3zMJCnK6hdTp
         yJbV3+xRKiVNMsi/EiMaLitn/iDLGsoiJP9OcEFdQvOrXpOc/Mya/CYxdSAYxeCz+K6Y
         LakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430120; x=1768034920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YP7TaSwPbfWbjBIYENl/PHmWuJ42b969Ap2VGXi7NzI=;
        b=PAeHCOO7b4xiOFfKqmUjFMvfPuvanToNd4skG2YTVzVEzWW5zpjxmn9FqmIoeLbN0I
         5J/jD31CfvaB//bQRNvezRYvaDCOsbAFlpkVMeq0kBUSnrId/huj4lse8084MF/fPv9u
         AMxPnk+A75UmT81GrWysukBvaMe8Kxe9mqrwo/akkIie44BHN5LFU5qfmb3bybjjx4Fb
         y6OEPNGZwVnOHDw3Kdp//BMlICc8Qk16veuoFMxH+gqlJOyY0MpwfSZVJKCLYubrVvyY
         rFYySpXF6sUtPT8ujTeXUctZfKBVVak0jUkFNI0uLGrg2qAPuvVgG60LlaWnbNEx7957
         cgpw==
X-Gm-Message-State: AOJu0Yz0PTf8Fo2NnJBniSdLDqOUM1D+h6drSUHXHshSsY8ViZa6tgaj
	o+HmSsCFEO/jsfk8uNPxe/IJq6nj2GLrQb3nBiSidHApRCsmw+PaUS2j0/Pv0A==
X-Gm-Gg: AY/fxX63IZoDi9TzGVLHUrK0yklI4jySjIuapnIHOc0g94Tgw1EM26CU/ZSI8fnWMcP
	SPlHR8CMAaZy9oQ72FpxSTeDVLPTgPV8KMHxS3lHbsgLtDmdhO7FpN/TdQr140wsKa41oAFRh6b
	1b2DGkZWlFsZpH1QLtn57zz8P3QlWDNIJMwLRdfMKNXWXiLD0I6nj9g2ym/6VspT0j0nilQgQQu
	E4A2Hd1NrG8MCGE/mbuktibtadmbN/DJGwoxkUKFSNzv3inCXZrV+8BJ8pIh/O6W6uBSur0WlrD
	yVAJtR16jacrWxmn5wWH2hczX6Y4jXf5Tts1L+F25wOJePvwMpUz1hgEuH1dv8+PbNIjVFv72N5
	5DnZjmQGXI4EVBGj8Mh5QlWnM5no2NwYAVJX926IDqYsOudtvHtyuIY2fykV7eFXK6uiuISmzse
	e1Ar3WDp16
X-Google-Smtp-Source: AGHT+IFdiAWLZupcVYh11CK/pWxC8ZxI/OdeO0GSE0zj4/4OPJk+2mTCJEs7UfmUJ7PtJMoPZvCxZw==
X-Received: by 2002:a05:600c:858e:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47d1c629902mr423842135e9.4.1767430119751;
        Sat, 03 Jan 2026 00:48:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13ed34sm26491645e9.2.2026.01.03.00.48.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] netdata: ignore CVE-2024-32019
Date: Sat,  3 Jan 2026 09:48:35 +0100
Message-ID: <20260103084835.2022951-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103084835.2022951-1-skandigraun@gmail.com>
References: <20260103084835.2022951-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 08:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123103

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32019

The vulnerability affects the ndsudo binary, part of netdata.
This binary was introduced in version 1.45.0[1], and the recipe
contains v1.34.1 - which is not vulnerable yet.

Ignore the CVE due to this.

[1]: https://github.com/netdata/netdata/commit/0c8b46cbfd05109a45ee4de27f034567569fa3fa
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
index 71fb0783b6..516fde6281 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
@@ -79,3 +79,6 @@ do_install:append() {
 FILES:${PN} += "${localstatedir}/cache/netdata/ ${localstatedir}/lib/netdata/"
 
 RDEPENDS:${PN} = "bash zlib"
+
+# versions <1.45.0 are not vulnerable yet
+CVE_CHECK_IGNORE = "CVE-2024-32019"

