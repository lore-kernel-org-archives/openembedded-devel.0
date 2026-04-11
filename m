Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E88F3ED4B
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 11:15:23 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.190720.1775906111798103437
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 04:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eB0Emc7L;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c76e702e01aso1007406a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775906111; x=1776510911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVS+bVyTk8V9zVfOeEi30KPcev2I1Ssasc49ExeQsEg=;
        b=eB0Emc7LYIFiHAe2tM0s+g8B+qvSexp06DMu6l9DTEZMIxlDIqgEFyhgYCgq8FiHqd
         GTj2QhY35n8Hz9Ac8bche4m9Luj6VhzJFofR+8XhOthv71ITqY2tB28tSChIF20L8Wj3
         MolaW8jnY1s1zq6LkfHBSGFjjk7O/LV4omgwQ6Cs7rotDjGnrH7g/nE7YR/A98Qs3i3r
         429gsAGhdb40tLqyQ7EqP1NBG8BjRqrFBt2Y9pftDePdOPkSGA11bfJ+zh4JbBxnsxUe
         cVPXSjt9t0qvoycqW4R9lozu8B8CVEGfaKI6DZA4SAG4TXfqtTbchbU39cYgmSuLhAxv
         lzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775906111; x=1776510911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVS+bVyTk8V9zVfOeEi30KPcev2I1Ssasc49ExeQsEg=;
        b=gZj5p7Oz95WRFKVifzJM635Jrjddr4ReksMg5b+FEcK0PMH2Kg9GlRjFkLUpQ75hlB
         TFKGurKm84+X6qZfn3Ab1hNEFVidiuAg5Fp79AkCMZG1ZSGrBNah6ybsixSi8Vpd9fR+
         RbQu054D3XfYHt7tOt6hM5/WnQq9ix9omQHR2vfMYxHncBwbzBt5evOtLQHnTdps1N+m
         Ltnw3Qqf7q3rPcaaKIgshSJs+dbbYGLbFFUhnKIOrNY69Z5jQszQ4QCY+otdjAXSEwK2
         ppHm0Q4IB8m7hnK34/Y0A1BlmMganNGBzqnUwc+lVsxC7wwB8nJbWPMqSza+UOWEs26L
         0Crw==
X-Gm-Message-State: AOJu0YwzsxpISlYsor312NHcslWIt7Yba4ePTpMgJkheEbzCMHJG42W6
	j3GA57Rl/nBY/ijHcPT+DKQk2YMuz0p4nyB61WxG0V3tIw7ES+VdgO9QWCPSiw==
X-Gm-Gg: AeBDieuVxZkkCOvVp3/gHcYY21tzSDyMz9CVmuPqenr6GWImlhacPFymGqK2+ecuA53
	mjbc5Ok500RWOr13X0cgMRm+tSnAagLIV5S8jk9BK3Xi7XOmTrItKgy0wMGEWB5uTPwNXyw6WW0
	lEwwVSppueXW9QIltXLiN6KTn5RGyTRshPBW980jjj0msO+kc+NOJOWoU/1gnLMC5yQ3OMBDpvG
	JJAlUNL+/3nhD7GfynvV4wLEmSL8Jo+L6+S9fUtbEy6rkmvz71Hd8IY9wsep7lIohZejP9rNp/N
	cOnvZHuS6qwZi3kUTZ8C2+zBcZAXQCLx5FPNth4oimu7Aumdyh89trZpnww+rRgHzvDVIUw6zOq
	V09qUHtJ2wdN53ActiepDxjJm1OWCD0UvTlgKkICNfaQo8cHJRMfdm3iUNzsPJ6wAyLflVFczUX
	PsscBapS53mvkE3jFaoFRgv3YG0Z65ZlwTXK0l
X-Received: by 2002:a05:6a21:6d9b:b0:39c:cdb:5d7c with SMTP id adf61e73a8af0-39fe40e056cmr7240449637.58.1775906110961;
        Sat, 11 Apr 2026 04:15:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c793488d824sm130447a12.16.2026.04.11.04.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:15:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 5/5] python3-werkzeug: ignore CVE-2026-27199
Date: Sat, 11 Apr 2026 23:14:49 +1200
Message-ID: <20260411111451.2739610-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
References: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 11:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126257

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Vvulnerability affects Windows application and can be ignored.

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27199

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
index 5f88a9577a..e7b00d37ce 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
@@ -25,3 +25,4 @@ RDEPENDS:${PN} += " \
 
 CVE_STATUS[CVE-2025-66221] = "not-applicable-platform: The vulnerability is Windows specific"
 CVE_STATUS[CVE-2026-21860] = "not-applicable-platform: The vulnerability is Windows specific"
+CVE_STATUS[CVE-2026-27199] = "not-applicable-platform: The vulnerability is Windows specific"

