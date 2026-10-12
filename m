Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F6BCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:23 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5084.1791839422582132017
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R5vJkUFo;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso669569a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839422; x=1792444222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3d43JjfWEUFleFcwwuibvfJUhSWCwglxb4hHqHvJmc=;
        b=R5vJkUFoKUw85zVyJlbofmPYDO0L+ZOsoF57JDhctoUCoP6PkdpSju5iELB4w/wvkf
         xaiyJoJ+dvkbiTcCkp6HphgBARFbpbDc0/0nmUEr169V0B2WYDWgXT1rl5bKyK7XGZV6
         YefjVDdzleM49u7pDsaXekpKHjRPWXPuj9zMbBkeRaQIFV3yoFXTWk4UHVXMJ1ivJEsO
         D7AHVH+yjaC8o62OzVC9dIKPBUb16naMwTF/dhcDzsWE8P31BJL2Pleg04sLuaH3tjB9
         uqCmHn+qdUK/T7VhjwMbz58SCXRv0Z8xWQfyPEGwnejare2exDIvw/V6LS6xq7Nmsfvb
         IurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839422; x=1792444222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3d43JjfWEUFleFcwwuibvfJUhSWCwglxb4hHqHvJmc=;
        b=kvgxAlMXe25XOIAYwDai+9zCQqYbx8d5VClxTDMrge+QSO2HBrR/LYtYx9d6yeorD0
         Ozoc6TWgHoWcRWvzbD2NmE2bPcPM8GBBI8L+A4snJyWRyX7IMJow3Uiv7rQ7FlSw0qLj
         Wav1Uya4PiPjm7uL49URfzjjNyuojbtq1yOZYYn56D1NBX8tIG2dKtYjc5iOm36ohi/0
         JBSzyYOeVv+UVjMBb0HUrCaBb+6NLWHbpxPfImjYIawqxp603bOuD9jtpRqyR6s8hCB8
         mlPTsM//3ZWSqppRLNRRSybfZ7j8LyK4FvLCtvn1ObD3YcJffUa5XBhoRvEIWy3FrBjH
         lRRA==
X-Gm-Message-State: AFq9FYKEeDTrkezbKejqEJdzlW00gXlLvDOTjWXNwkTp7hUEzyE0pze/
	NpuSQvLLaqcOMY8omHe+Ai59mJPHRGRiGlCtQk8NV2AJPpbI31mIQTnLruj7lQ==
X-Gm-Gg: AYBFou3/UMzVkJm24FPTs7hJhIAMzF2FKXVJOjOYOkMsygCGoGDrHy+6a1C9Mz2QxvS
	dx/KiryMPGAJS6MMe4oWvHYDiaJhqqJGkBDKeb8ZpIlYeNJiXs1zndVMhqOuj13hdbit3yh5J8J
	o86WtJ/RuoUHvI5XZWhkB6u5QiOHQWYkgJaS90296LZ4oW6h+5nZkI3Kw+W5DqV+BPfV6BP5UKf
	hfODvJxiXNihiD6dkpcv90xDDYLGcQcEeZkU8bPE9mwJfq1tYiZzS5tWto9ZGtv2UW0yXmXl5gf
	ac4cohK299OugRCFVNi/lcZMNGEZz6Jdc8SXYfQRKJfboHeQ1MVHVHKzcwjN1FBNCyVGepYuC5u
	oDKjQSbX1cAGZDhRiQI0/2VH2ufcRpa+nFEcVHWFLhZZlivnjIOLQlq5YFrKX1q5Tb50nqLvnp8
	BeUX5Il6hUD0NPgEIvBlFd9m/m6KiJ5qsIh4TpAN6pR3TrX2Ro1QFbkWVQwnIazcsp3vgj6moG0
	o2VBzG23KGgJPT/mXo/66txZrIM9ddnAtzUQp2QdQdpLwJ+bQ==
X-Received: by 2002:a17:90b:258f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3ab3a8d974emr8604029a91.58.1791839421859;
        Mon, 12 Oct 2026 14:10:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 2/43] civetweb: ignore CVE-2026-5789
Date: Tue, 13 Oct 2026 10:09:26 +1300
Message-ID: <20261012211009.3352822-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130772

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-5789

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit db080436aa68c50b0500aadd33a366916b12c782)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index d9ca7ccd53b..df64d4cd355 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
 
 CVE_STATUS[CVE-2025-55763] = "fixed-version: The vulnerability is fixed in the used revision"
 CVE_STATUS[CVE-2025-9648] = "fixed-version: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2026-5789] = "not-applicable-platform: Issue only applies on Windows"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake

