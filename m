Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1650FC6177
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21713.1767430120001089156
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 00:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RL7v6ik3;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso79927345e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430118; x=1768034918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRs83gwsmxyzRTSD/PtTiZOkNl4uAL/lhZeb6y7dI3k=;
        b=RL7v6ik3rrYP24UPNl2uBj6d3reeQcckZNNT6EI9C9inx8sY18Xlt/hKIHZQAr+lGl
         Sngh06ltRau5OcZWo64LlCdYxmsatTnhlPqw0Rp8lXe8xXlPGvSuMndtlNW5jWX4Esyw
         Yfne6wcrG4NLLT7TbnQbAWlkXVynl3SzpW8fTx62JAMMKIjjQTPa7IJnpTX67CLGQdDR
         l8SoNeECGOImqkQcxCWBFDaxvWgqeou3AX1r54WmiUzi9clXmUy0IDFJrf4jiOqeVpyC
         oTFJBKIyMvfuwDiJ5zsIKUISG90608xf7/snEq4pKcLwI4I+c4tP8TfyMGmSGGEq9oTM
         5GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430118; x=1768034918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uRs83gwsmxyzRTSD/PtTiZOkNl4uAL/lhZeb6y7dI3k=;
        b=vwq3P7OpPcFG8vp/YFrSYwUYCGhXF1F0KX0Nu1vSaOdIxunOrEfJdKS2RhZCTkdBVi
         SwQFQcuPrR3bWP5n2fqU5MDJhPRURwQXpxqtH5oDGWzRocUCdhxm+6MXeahdZg42wxrX
         rjUInAeI1WhH2ASfj5DqG9Nsm3w5ZlB66/1HrUiqDKyoFomYaKIWGrdnZOjfC2TYyg1S
         1wdOch30xvFMutVdYAdzZuDEb7w+k9jVuXdbEJ7ymQwbpTJBI/6YA1DRWrDzK0k5BB+x
         8YgOncuIQMTu6sAouosV4vaAMMajgzZoYvg3h9bwh6a5Ub1/yzOk75E9AzJUuYKRjr+u
         DNEA==
X-Gm-Message-State: AOJu0Yw4VHoYO83PFCZbh93zbDBVkFyFkl2Ndo8gX+yC8aH/pD4Y6lAc
	AeIGDsBPs8RnrK9DK2zzyVe0o10ZAoD/RjD1eQLabLx+JNgNpERjgoz/HPgxsQ==
X-Gm-Gg: AY/fxX6HCpU6wufMN0eK8vIZL7mXPqDJFr/OBg8iUEOZaQF0W+qELzD6yTuR91qU5S4
	mH+hyxZBJVA6cR+c/owv8+OOhXqLZS/smTE/NJJmc4OAefB8YiL7Oo/cDLWqzm/H/9ruBD2u6Bl
	BUcR6uMzDRu7erCM9fvu1P1W7En+jukWBin0Et5a/CfYLaBNAPVt6l4C042Ev0lmQJWM79cu6bb
	BoH0uT7+r8e+M+2XIeey1Nr74i9bM+e/5hA0M4S933ZO8cDt44QdIacM3QxDKaquxptLZjuyrk4
	IrHdB0/zW1VbIuQkpibOdvLcTx0wVerbdFoRgJhxD8UiOndynh53zsxLJ8tHkycc16uH+UZkUJ6
	x2diifJR90/u7C8xrZuXizRBPMT57UH/useqzRyzAAStsU0PuMpwrHBxBQsTCdUOCVWHiLG70qP
	RWgHeTVkN1LMjMgZneonM=
X-Google-Smtp-Source: AGHT+IGmhesPC0S46fMev31pVwfxeD+d683YMjyKVJlxKG4wVi3P0Eesj/T3IqrZd1WS7+SdxGGzYg==
X-Received: by 2002:a05:600c:3ba7:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-47d1953d798mr542300955e9.11.1767430118314;
        Sat, 03 Jan 2026 00:48:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13ed34sm26491645e9.2.2026.01.03.00.48.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] nodejs: ignore CVE-2024-3566 and CVE-2024-36138
Date: Sat,  3 Jan 2026 09:48:33 +0100
Message-ID: <20260103084835.2022951-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103084835.2022951-1-skandigraun@gmail.com>
References: <20260103084835.2022951-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 08:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123101

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-3566
https://nvd.nist.gov/vuln/detail/CVE-2024-36138

This vulnerabilities affect Windows only.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 9326b26421..11e9717c6a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -54,6 +54,9 @@ CVE_CHECK_IGNORE = "CVE-2023-30583 CVE-2023-30584 CVE-2023-30587"
 # the vulnerability was introduced later (with libuv 1.45)
 CVE_CHECK_IGNORE += "CVE-2024-22017"
 
+# this vulnerabilities affect only Windows
+CVE_CHECK_IGNORE += "CVE-2024-3566 CVE-2024-36138"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 

