Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF73C5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:39 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2350.1787029355974365201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=enAlYWqN;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so3500360a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029355; x=1787634155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7gUHLmCcjANZcNHdq0F8+pg9wah8i7j0zSS2vG6b7c=;
        b=enAlYWqNGyDjUHl1ToDW2HL17bT4cZGVRDfKOCrTDbit+YwN/5riQa+Y9jHo+J91Ky
         9XZQWtyQ+fLaGIdMzWXGw+Yu2VF9aOiZKFfnpS6d9M0Y4tQZh17AzNG7qipqd/DtpFp1
         EAZd0LGp39ejaHVE1MLb1/Au0uUr2Wp+Ui+xPBjgbqSSVMXClp02sBzZZoXtJN9GYugr
         AspfusrNHbXYxnwThqq7edqrvxYWAqLOtXm4PxsYlxsBvsltRTZSBsGkj4uxBf9znYtw
         3z3Kk8qoaEyC2eW9eEYPql4HUEJ+TvHR46SdTsruQ1t9BhRh4zWeUnPaUwWkZb1NJfiG
         3B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029355; x=1787634155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7gUHLmCcjANZcNHdq0F8+pg9wah8i7j0zSS2vG6b7c=;
        b=pHOoxy9ousd+HbYios1uFMBwdl/ogWF9fQkXzuMgfVoDTps1E7ympiqp7z0hs6B/Nb
         TVp/ZPhOtOKaqjrJGHeyDGrtcLPT27vi8+NjKZyJJMfQia0MR3ys0r2G8z05VuWIA2YO
         rHU6PS5Y/jHy6WaiUz4cwGLBcuRxH/hNO/UxrRcjFmqqP6gpAvHFaz8Dira8AuqXzoJ/
         /H8DbIKn2bpAt0BiKsym+87y7rRntxYz4hNoIlaHUQvznDzGoGcytIGeg0SYzBQ9HKM0
         XN8BK9Bs1t6eyr6dqzqkHenN/fFgA72Mr4VXLD1zTKanHhdY49g8tllOp3wRAZv+Q8V4
         IOhQ==
X-Gm-Message-State: AOJu0YyYdr6h87EWbg133Q8LQ9iQE+WRldp0N6kLoRM4dXXUdDCJJXYb
	ZQ3sJXql6tGF+OHtNWf0vt8DeD0UHGcjlPafE89QnMdxm9l/f/nKr3Crb1W/4Pkm
X-Gm-Gg: AR+sD11jerRxHgim0kFvIJBtemSJw89eUYFzYThYSXdetYC0s25W2dnsd1gDHBaZwXF
	YbrTzp/hfwZwCwR8+S7vGwncn1/dHvirESDakNaC3X/yDpeLYF8UzrQklSd0Dg5fELvEaCLyB+2
	dTAvRlxp64Bx3yQlEaARSlTw5Fl621DOvjWQZbQ+mN5MkFOv5yna2sL8N6tTWvGae28h2MJwB6k
	o9Z+rPCjwMJmsdPalLR+H/OfNeTtndnKM9lropwxzQQCce2x2nVpT8IluQy07Q7pSktO9fOt63F
	pfUBuSZEoBMrV3OaeXvtUMa4zC5W65rPDs4I9yt6qQyMGJNZRgwQiZpO42q4nWWGcHkF6Pa8c/V
	AmSwUWrJ2P7AX05a6yTSNG21szrvxzK5O8H9y0FMVJzUSl97asmz2TYtnC0tIgYi/hHkEORHxro
	8lpqVn9QlS91+RsoOOvn9Ye0llxNkc2z/arJk4m/zif8Q3f1pZ74Xdpd2iQ2P+1wdbvLMHJZid3
	g==
X-Received: by 2002:a17:90b:5884:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3933b7c3b7cmr33634004a91.4.1787029355223;
        Mon, 17 Aug 2026 22:02:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 21/27] libnfnetlink: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:16 +1200
Message-ID: <20260818050123.2901739-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129220

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libnfnetlink
...
INFO: Current version: 1.0.2
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
index 2778185618..42cb7630d7 100644
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
@@ -20,3 +20,6 @@ SRC_URI[sha256sum] = "b064c7c3d426efb4786e60a8e6859b82ee2f2c5e49ffeea640cfe4fe33
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
+
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/libnfnetlink/"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.bz2"

