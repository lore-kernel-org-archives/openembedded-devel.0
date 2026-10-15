Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFAACC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:16 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33233.1792042993608444934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iHzNOFdc;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25865485ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042993; x=1792647793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=taTZGrFwvq5HJphryyhNZeQXRyrBC3nrK3AzNOp8ZFk=;
        b=iHzNOFdcE+vyNmTukCm1nLFdTNgsHvpJl7rgYHHrB7f1ZSiHl19komAU/mDz3ZLOTU
         QluzOCUlEfdo2k7Cet/TN9ucxUUwNqSJb8yVesyIqIrxJraDw0+SElPnOanhcW/RlIBH
         1jLkJJNtD8azv6CZhIAyhqhn8L68iw5QAwp77YbkZKcxDobUUe9QgmuRd1hFBdHvGQyU
         oDApu14J25w5hjI5iXV0eGButk7PXaXbO+1O0PAYwYktSRcrY9VFKQ57hIwfQUgRKuM5
         9Swq06xF3JlW1QXpfrzoXdXoxfDoFJ6rqoFDu89lFi1PkoiGMU9ltM7pDy3y2sEXv66h
         tNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042993; x=1792647793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=taTZGrFwvq5HJphryyhNZeQXRyrBC3nrK3AzNOp8ZFk=;
        b=Aq8cLYnqmQpHoMMyHfh93B7VdN18/hIjaLzk1FQLMye7OdoORtISlKMPeHNN/hWTZ8
         0piu5qeoos5lMr96ILv4vv5aDP8j7t9BBvjJMMERXUxGVMtghgpO8cDRBsBzYrJyWQIQ
         Gd+/zyefVQLzm0wPWRdUFq80VeBs37kAI01ryZpIQrjQULfQuEfkpjWKZ2hYhiVOQ5Zh
         p0/reAcWVHBcthP9WFmWQiRPazHnTRQQ3oeXxVamPCoZ9ZcGhFOr/53F4LPyurqRCFjk
         pdp1GKSLSNF3TqsxwwSv7ST4cUswnXQlxqnK8Ca7voyKYwx6WE1gkGv2AoTdxlVUtIAQ
         SaHw==
X-Gm-Message-State: AFq9FYLHnhzQciVs+8Z7byKOt/3QbYHOCZuM4z8bCQCn/ospm5r7SsTI
	am2jd8RTEc2Q6iLXylaZM4rodmgvMN1wwWX7lV7OJI4lcdLkSBMMtFJzMEgNrw==
X-Gm-Gg: AYBFou2SbJElSRnzhQ9bBUPhFgn6GaDgkupuKX0cap0NlgapiIbQjENrmPTpYXCQRna
	Fv1YRClIDujx+pce9HbovReLpQSakADstTcMaZbzkRRz1/RPPiPuJmTrglXLaULM0wyJEgGI70T
	B4/nTj00D9cDDCs8XerfpzXVgMas16Z7I00YwiuWpHzDitDicuZxvUOgubgqT4smjwyoPsIZhet
	f0cwxuQCV5PRL5SJtuNXbABG83gGfohlirc8tAdxv7ofv4lxKmn0T3fjqDb4IjqmywhzcMCNtT0
	qoR1GZFKbGc0id8TNM9W90j8iArb4pDUiyPiUAvvCAflmEoqmgBFDXvClGLcECOBa4qZ9NNjMcM
	N0fRE9Vbv8RQ15sVAjemAeUWILUdZ2qv9NGUsQJvJ1K8Pzn1DGa8YaMCFtNqXZdVpqncvhhRSr/
	gXSesDLGXBIFQwWeNkO3E0DhNma9xc9kqMDMFxYjMSch6KEpJbuaby7cJVH9QjbBZYzqDT/8kGp
	j+074w5nntsLQ4Dc/KWDo4=
X-Received: by 2002:a17:902:f60b:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2e953139665mr15933655ad.6.1792042992896;
        Wed, 14 Oct 2026 22:43:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/82] dovecot: ignore already fixed CVEs
Date: Thu, 15 Oct 2026 18:41:00 +1300
Message-ID: <f4785e05f877f9bdf636cab62af112ccd25b85c6.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130932

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream has confirmed that these vulnerabilities are fixed,
and Debian has also identified the relevant commits:

CVE-2025-59028: https://security-tracker.debian.org/tracker/CVE-2025-59028
CVE-2025-59032: https://security-tracker.debian.org/tracker/CVE-2025-59032
CVE-2026-27859: https://security-tracker.debian.org/tracker/CVE-2026-27859
CVE-2026-27851: https://security-tracker.debian.org/tracker/CVE-2026-27851
CVE-2026-33603: https://security-tracker.debian.org/tracker/CVE-2026-33603
CVE-2026-40016: https://security-tracker.debian.org/tracker/CVE-2026-40016
CVE-2026-40020: https://security-tracker.debian.org/tracker/CVE-2026-40020
CVE-2026-42006: https://security-tracker.debian.org/tracker/CVE-2026-42006

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 86a9ad852a7180edf8b03fca7d0a69e9f1d9e550)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
index 993453eaa3..06e6ee39fa 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
@@ -89,3 +89,11 @@ CVE_STATUS[CVE-2026-0394] = "fixed-version: fixed since v2.4.1"
 CVE_STATUS[CVE-2026-24031] = "fixed-version: fixed since v2.4.3"
 CVE_STATUS[CVE-2026-27855] = "fixed-version: fixed since v2.4.3"
 CVE_STATUS[CVE-2026-27860] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2025-59028] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2025-59032] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27859] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27851] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-33603] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-40016] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-40020] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-42006] = "fixed-version: fixed in v2.4.4"

