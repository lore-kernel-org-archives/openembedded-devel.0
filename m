Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396DCC5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:29 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2344.1787029343461194174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AwSdRmba;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cace91f112so49222935ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029343; x=1787634143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/scoZuGwmQtRy99OUy6dcSlPM1z+67MMt9PrZt021o=;
        b=AwSdRmbaxe3E+ev+fhLqJ1kHbU6kxTJGzcERV4D2K0xVLXyyq+qRoNBXjdLJY2MIt8
         /svxq8XS/HznpLP5LFjG53Bnqs0uw4qWsx/P108eGFFI+bCf1ZWLb2YLtS/pMkbX/p6I
         gw7QerZqqrs0klx6ee43CflCZe+09j14rQLjszN/c4EIlxXsQUEcj4aRiX8L/J4LhLgq
         8lR2N0glTUG8JHNYHdsEXuauKTgAI/DjR6h0xOqYCOWZTGntqAf8dhAC51ai7r95N52h
         3qYfB2e0SqUbwyunabACb8qQXJ07/wQzkDhsrq1VD6/0E5V3HfKbVGH/ABQw1dH/dGbU
         cHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029343; x=1787634143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/scoZuGwmQtRy99OUy6dcSlPM1z+67MMt9PrZt021o=;
        b=MDyU+9bQelhJGo9cjkgPiCpiQtla2M/SVSSFfLqlySxrnVcTPXjL5w3GI5ObTSVHQP
         Pc3vDP3zjgWFSazV5dmDK4MiD3U8qwuoxpxnGWaZOHdJuH83t9BZlb0WM0X+vNnu3iXi
         14V6Jb0p50/RJ0H8d8udsI8WFWsDiZAhHLTy+BaNSIy5BLrdrY+HrJ73pYN1v/ZjPjzq
         +HLqEEWSywgpjPGLpq1WavYuHK2VooA0lkpu3gv3zD89pTWf8l4NDoZLBfBNKeb5YE9O
         ychcG8XAIbaQyx2R5Ow/V3OenNvBDZSsb0z8cqTwSGBLX8SMggGyaIGr7K/RUy2rZ73Q
         zJoA==
X-Gm-Message-State: AOJu0YwA84gpPd98W2i4C9hD3a+3XtO4dAfsAQv2em5klfdjYZFQ21cX
	AxKbK2rfWYbOixhWWOvj6RCG5JVS/3jFrK8Ww1adrOgqEhjHFXbpSUJSGVx59I9a
X-Gm-Gg: AR+sD10tjTCRmCx0JIEdCVsLNgaagBHmSm5XMY9cs3ViD9VCnl8arFgxNcQZ6zLTLkx
	13vJfbiCVpFpU1GsR0Bz2uWQ3oac+vMry28r6rnvpl1yW3YkOvish+uMsTSbe8+FrwHKpn/rDBc
	ciRbTSRsW8iZJ3DgUtoA2fJ3CRrGaTLGvv2Q2syqmtuBGAn4hKbRbTXanf6YOOajwGx5F2A7xvI
	1Dk4bIiBTtKFWZFWckiv+AquRhrN4BOKYA3mytemoIsQu0DrkUNpxD57/MADC341KMyNSMZNVo6
	fjZoAZyrdsopT6baCT9RwehMrFf8xtP6pMmMBNYfiYJOzEpD5jMfU8x9OkE1RhNJuBKF0eoNXMF
	NO9oVIOrdahQ+kk3s+0S5uslHgGThrsKtKl4DJFiXZaUBLK/RK15nmpcUUGJNDVtFrQPcWbVIvp
	ryozfL6Y6tIoAB993bfupRk3MV7frgXgRE1+cTQVM5fA45NhM5ZycNnji684Ap+ks9AH3fS68VZ
	6BP1GZWciVl
X-Received: by 2002:a17:90b:2541:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3933e5d2332mr32839036a91.11.1787029342816;
        Mon, 17 Aug 2026 22:02:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 17/27] conntrack-tools: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:12 +1200
Message-ID: <20260818050123.2901739-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129216

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version conntrack-tools
...
INFO: Current version: 1.4.9
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb
index 798939863d..0c8e2bb69a 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb
@@ -15,6 +15,9 @@ SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-too
 "
 SRC_URI[sha256sum] = "c15afe488a8d408c9d6d61e97dbd19f3c591942f62c13df6453a961ca4231cae"
 
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/conntrack-tools/"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.xz"
+
 inherit autotools update-rc.d pkgconfig systemd
 
 PACKAGECONFIG ?= "cthelper cttimeout \

