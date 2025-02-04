Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37307C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 17:32:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.122604.1738690347647585914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUQnzTKQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38daa53a296so465061f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 09:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690346; x=1739295146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUBShB82z73Oid3bD+uGhRMTgqv7LwLnjeMc4626LyQ=;
        b=GUQnzTKQkAiu8eFU2iIGP/r/OTNtC3gtJEuHdVaSKe/9sp7m7pUeEZQ3fIB5uVRBCg
         /Uasemm/Ft6BdOc+RJpdimzoievkvU296aIFa7Wwq8abZ2f+GsEnDuK/6drOsz3gqFN8
         XkzuDhzn4ye2Pp/iU5BUDe6/LKGgL//C96b0fhQr8OTRhVVMPmAbAbmnTw1R/gcpiU8F
         zyTNzQDjNmJYUkyGpcOaoLE7oKTxi+9ovRgx27X9zIJUU4PnE3+84Tm+/qfuXRkFT8Lq
         BctwfkW1KE4Agfpc5xu6WEqUN8HNL2m4df5YAoHlLA7tOs0qBwv+txiIYk5dxGAQUEYM
         wjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690346; x=1739295146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUBShB82z73Oid3bD+uGhRMTgqv7LwLnjeMc4626LyQ=;
        b=j1tyr1VhJLFw1ffBypRd9vaQA18oXa/PCht5vZmtmUvhRqu+TUSAA834zCiIwyuZTR
         j8j4mSK7fdTX6qGr/oHYjSbMzeeXOpsZIq7wgU8xn8bX/qEED7e8oWxQ945KMJepp/Ii
         k6tI+TB1siobVJLjfaqwfB07VDX/dGb8yLeAqx9ErnQvhSrkfEOh7iloGpnZOyEesG5w
         v/iRtOerwS1QvnUjNF0VkmCjcOISQPkWobTZCFpUz2PQ+cwCHqs2uWWg6+w9qYmpAxD8
         sMDwxZSwA89LiYWBIcU0hbYYINgcGW0VkFpuWv0qw4hrMWaB98yBK8X/cvvYBk0cQ+Wh
         nEIQ==
X-Gm-Message-State: AOJu0YzzmsVAJKp9I9BMj/kcY0znbRlB74kqSWtNZYdBO+rSZb+Yy2l7
	vURTVfUGdED2t1H+dd/agzsC7+o9msE8Gcx7awG4MmvcFngKVT0bTjM9Kg==
X-Gm-Gg: ASbGncvPnUz7mG+Ln4atbL0mauz+1FTGi7I2Emv6OfAuKpcK8L9WRXJcug5XNHEX+QD
	Tqxi6LXDM1asIllkG+DCYMoHLX5j+6V7oY+tdfB0qK3U0HV6ztmAm17i0YX07mKpwmL4tcsKb8p
	eLRBPLg+PM9u9vRpXAKKKa+3ca+GUT2Jmo4pHTDRlgy1loTOhi3sc4TJlGxy/OIBMGrOA/6Bb4g
	hVGKbfOlOM1yD+3wvZinW3bomy0+P4BpEv2I+K3biRoPqaf6vQsJ53XCZQUaAv5epSIVOdDtwa6
	N9hSJ5ZfAk/7FBks2QPwpXhOfn48+3wPfX5Aw1WkHgJOXFF4
X-Google-Smtp-Source: AGHT+IELInfxtpuo22/miOd5Rn3DWmzqzZgrJ3IN+4emG2rQ+xD4cVFBkx6Ysd0PD4Uo6C/8Kf/1lA==
X-Received: by 2002:a5d:6d0c:0:b0:38a:6929:ff9e with SMTP id ffacd0b85a97d-38c51946af3mr18585400f8f.7.1738690345734;
        Tue, 04 Feb 2025 09:32:25 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1b51e1sm16394534f8f.77.2025.02.04.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:32:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] hdf5: add -Wno-error to allow building native with gcc-14 on host
Date: Tue,  4 Feb 2025 18:32:21 +0100
Message-ID: <20250204173222.304849-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 17:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115275

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
index 4110e9cea4..669fa1c03f 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
@@ -58,3 +58,9 @@ do_install:append() {
 BBCLASSEXTEND = "native"
 
 SRC_DISTRIBUTE_LICENSES += "HDF5"
+
+# work/x86_64-linux/hdf5-native/1.8.21-r0/hdf5-1.8.21/src/H5Eprivate.h:76:40: error: assignment to ?H5A_t *? from ?int? makes pointer from integer without a cast [-Wint-conversion]
+# work/x86_64-linux/hdf5-native/1.8.21-r0/hdf5-1.8.21/src/H5Dio.c:475:5: error: implicit declaration of function ?H5T_patch_vlen_file?; did you mean ?H5T_patch_file?? [-Wimplicit-function-declaration]
+# work/x86_64-linux/hdf5-native/1.8.21-r0/hdf5-1.8.21/test/dsets.c:9151:8: error: implicit declaration of function ?H5D__layout_compact_dirty_test? [-Wimplicit-function-declaration]
+# work/x86_64-linux/hdf5-native/1.8.21-r0/hdf5-1.8.21/test/testframe.c:616:31: error: passing argument 2 of ?H5Eset_auto2? from incompatible pointer type [-Wincompatible-pointer-types]
+BUILD_CFLAGS += "-Wno-error=int-conversion -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
-- 
2.48.1


