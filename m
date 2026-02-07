Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B60AEE0ACD
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2675.1770460445682592197
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTeQbh/8;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483337aa225so392935e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460444; x=1771065244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6HjRJ8CM1uL/KeUGC0wD1I7TB1B6bYYi/enQbhxXoo=;
        b=mTeQbh/8CJ+VaHQV0sOlcdQWuYRPQ3dAWm7rH2ooHhEXbuSs03iAR1bd78uAWtZ4jl
         6DSieCsjpoXPFtLxfgOaTAB7rKtGh/9Pi1GLb+R3wUbWwZai4Sa9cfb2bOkHohKBzv0Z
         QOyEXL2ZnTkkgnhfm7rmGdlm7eLdoWXv8tCZk+Ee3eL5sprnF7vtw/cZPqMX3NigV5tF
         Ck34kBONCjJfsjGKNQiytajOFZr71FtPXt8m715+eHOBVR0MZIo/9lDCm6T0Z/Idqj97
         1UE3A3Rhn9oUP0Yh+exXFiqWf/5qc1q8pwEZVGReEi13PiEju2J3oWoGeo9wLnBtN2Dz
         h+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460444; x=1771065244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r6HjRJ8CM1uL/KeUGC0wD1I7TB1B6bYYi/enQbhxXoo=;
        b=WGAqwIa9PXzTx1w0rIjhb7yKujuWZUeZT9p1miIdbJVoAH1bi4UxDjv/RZoOvWtEQ6
         bYYuu7btkQ5wVM+4TW7EnhLTB2y6x+JMliYPYH/8OZwmEnyljHZpqpNW1Vwb2YhlJl/t
         mSyZMt7rsp/bQTjOW/rnvbwdMQOzmHjwTEOp3AbENZbB+4eWeHaZzgNsL3yzSuWRk4vz
         iHWaa89R6fLql+MwA3Nz+24CDN3zcl2lMWjAuPZHsREA0s8rEeIQrcOCCKfnP8mUXtXE
         ZH1/Y3nKecDGxYlDyhbNRadgkWDakZ9ISDQMSymGwbCmfCKytI4YN0fkto9QDvWs1RF3
         PLXQ==
X-Gm-Message-State: AOJu0Yz3W2QJZ3f3DniuScUbCL1KTYDnTm0gW3BJQZ0KOFDRd5b9ZIFE
	7QkkAW9SQfSoMEhdjk50EmbUWUZHtkjYCu4YGh0uTkp7wsTh7YzEXe2bh1iZeQ==
X-Gm-Gg: AZuq6aI4t9L6RHxdtI8RYD9Am7GtMoE0BN/xR51gQMbHChTWvGB742MTgf9uJrzMj9C
	GVyep/jxviW5fr+rCfesB0ILC6LSGEU4X3nmkQQuC3CRSQPzdO05qeZTVjNSkt4jcNv/hE94kez
	43GX3TFHDoAQXXRh4V7jNAqyCC8pjmZRl3UW50M4Kpv2raplISL1DykOUUmWRRmcYQHYGXLBjHc
	uG67UX/utGdZ8vSYTqz81YAz3F1qo3f26S8tFjLCZr+yEGxutB2hwuHJOSFV+L9Y3IaE4AQqJMP
	Z+jqodJqeSYhpjf9m1FlVT8Owh8Wt7D71YI6K6mu0T0htVdp1bDAs0igC+vwUabcMoAAEI+curu
	/cU4HqRI4HcexZwoQuYyqWYzUBX/A/FA85dNUoPCigNlvlUXii2waFFa0bCsKz5motWrGEAsf6I
	vqo/R7tWdU
X-Received: by 2002:a05:600c:818f:b0:47e:e20e:bbb7 with SMTP id 5b1f17b1804b1-4832021c808mr73831025e9.25.1770460443917;
        Sat, 07 Feb 2026 02:34:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][scarthgap][PATCH 05/15] netdata: ignore CVE-2024-32019
Date: Sat,  7 Feb 2026 11:33:47 +0100
Message-ID: <20260207103359.4177243-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124246

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32019

The vulnerability affects the ndsudo binary, part of netdata.
This binary was introduced in version 1.45.0[1], and the recipe
contains v1.34.1 - which is not vulnerable yet.

Ignore the CVE due to this.

[1]: https://github.com/netdata/netdata/commit/0c8b46cbfd05109a45ee4de27f034567569fa3fa

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
index 700c6b2346..123da8bcf3 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
@@ -15,6 +15,8 @@ SRC_URI = "\
 
 SRC_URI[sha256sum] = "50df30a9aaf60d550eb8e607230d982827e04194f7df3eba0e83ff7919270ad2"
 
+CVE_STATUS[CVE-2024-32019] = "cpe-incorrect: versions <1.45.0 are not vulnerable yet"
+
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
 

