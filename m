Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F09C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 13:57:47 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13378.1786715809687693998
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 06:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=cJ/KpoUC;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92f03daaa97so62432785a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786715808; x=1787320608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpG4Y9JMd93bG3kBqfbVlf17t+Ghnvqx7GvKWiX4JaE=;
        b=cJ/KpoUCmRDo5mIjTOlf72pzsoPx/RHCX6KPw1vGijDKrT1yrvUUpUL4jNvEmtzuhg
         RcWbvNCRQgr+a0RjuX3LlIMFE4iEPaZ9d0hYMPjZF4jCLLTCj0BLncs5jyhM7GYCnKTr
         qvNRnepsd+sNNyuq9qOR7VYvg4JAE4KFqWjEM02c7/H34ygemla7Qh16GYfeJ0jcfdQv
         EpDdvuoTUjwB14r/sl1uqU8w+vEMpaddTFvEZZxElVihO4t+3ftw4fb2X0Dx4uv10+88
         pyNuXchsTr8b2Jxu9wltwRWCyQ8gkSW3eUON+M+jb9qDjeTe1pzhwTflf1XwiH/kCJ+N
         jiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786715808; x=1787320608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpG4Y9JMd93bG3kBqfbVlf17t+Ghnvqx7GvKWiX4JaE=;
        b=r6yB/QOTZ8gswEkoH5o3arez5JKOJOui9a4p6kAjZcjJS5GofTbjIScHIcHxI3j0JC
         4jW000MDsyuPXhVMHf5YeiMKYNtGBvOZ08tN9JsbapSVw5b5eS/v18bgqK47zTUsmu5u
         wyoyJXjj6CK8+FDQGq586nte9U5wR7jyruaCEXxkNFeXwdCxlvJvBgI20dVbu9Ur0VLx
         9+vfQ9Nn+bSKnSzvD5uSByBtBPgCbnJPKEhrfGTYkpbYfDxtV5J1nMBGhCkNxxjpDjiR
         6OTMTrJwMD3r2cCbBJrNSZdRvJOvxeImM+mWXd8f/aSRlPXR2+Ld8i4gPYPXB15jVowd
         Mzvg==
X-Gm-Message-State: AOJu0Yw/L5Bf+fl3P9rV+4kU/Fk2rb7+Jz2S2b1S/7TJZAKYSSbzBSdw
	8BVxiBr7GF1LZ/wM8DiIb3CxcloLDw58XftG0B//IfBXb2/+LuxUGCT55/UNmaEwOghvSMH4E3h
	LO1Ex3lY=
X-Gm-Gg: AR+sD11gZx+CJQ5+yE+o8CvtUP+jEIeJ4myMWnFauIogQ+9VB09ndoYndXfcjWq2MRZ
	b/5mlqhiZS/ymFSNSoDWthh7rv8akrAFTmDCMl8qWtxj5gpmyY71jFin/BRLn+E8ePH3IOYGj8L
	PeUGCwbZdBlYNYlZ8Fwv03IgCNi6+Z2aoXqOQejN8GNu2AXm8GiBx9OYvXqQhUlSMiERkQ7sYjW
	X81TUB4x9mRlqY9QhEOCDB7Lp3VDZwmh+l3agiRg7tdUjqVOiZxWUZovVREa6GQyXbb8kWVVGsl
	ru4irPEW81OH6NA+XCCI1mwvOHWgqB0h6nzuCYWT7PohFkQyHA87P2qLImX6y4yi0owZTX+Mt9A
	1a+vy6Ha/Z9TSDeEeyllEEnGCEnMxmzHsKFpIFLGSodA3O6Gf+cKwEtq2FGVk34QIloIs5/4gbZ
	umYyzpBJ7uqhWxvyt8dculNN3ZtZv8z+8G0hUiw3odeatKFV1lL4snxN/b3pT5fQq6
X-Received: by 2002:a05:620a:211a:b0:936:af32:aea8 with SMTP id af79cd13be357-936d22cf7d2mr499077185a.31.1786715808449;
        Fri, 14 Aug 2026 06:56:48 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936cdf54ce8sm276311885a.4.2026.08.14.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:56:46 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: pidge@baylibre.com
Subject: [meta-python][PATCH 4/4] ptest-packagelists-meta-python: add python3-glances to FAST list
Date: Fri, 14 Aug 2026 09:56:37 -0400
Message-ID: <20260814135637.537350-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814135637.537350-1-tgamblin@baylibre.com>
References: <20260814135637.537350-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 13:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129048

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 6dd53e8a8a..6904b5b3d9 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -35,6 +35,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-freezegun \
     python3-fsspec \
     python3-geojson \
+    python3-glances \
     python3-google-auth-oauthlib \
     python3-gpiod \
     python3-gpt-image \
-- 
2.55.0


