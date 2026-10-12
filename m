Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF8FCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:33 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5086.1791839425131495876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dpvVDShA;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1332573a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839424; x=1792444224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4h5NSqmncAof+0pUgPXZEK5PPc25rRE+KsDPDf+OJ4=;
        b=dpvVDShAaUKS3G/OOoREDqWeVr1neLuUz2SNGGegkXASQupj1R3xFNwhjmiMksuyAQ
         2IyOEaSIq+V7RjPpU12pnr4QJqOeLVDBeS2anlKh+PmKz4jt1Ke2xBH6lEOnB0kxWK0P
         lDnfhe92omKY1v10HCg/ZlLdau6rSkOVllNIiPb59V40wrqFiyEarURLRNh9r1rICLOM
         ZrFmJDpB6Hd0KETEmXT0jSzlSDCtaIrfSlxJn0Pw39Tldt65iOf6iqYLb9/liaKVFXlf
         FyiqKtbP4CWAfHaSzZhYfn2XHNtvpMrm/2iFKEmIXdnk0zQWXd65TuQpZ0z8+hJDpIog
         9rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839424; x=1792444224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g4h5NSqmncAof+0pUgPXZEK5PPc25rRE+KsDPDf+OJ4=;
        b=E28JtBtM0tW2vLpgc59be+hKdzczWg5hPiBErC7SB0f496738MiwzFp8r6nOLNR+Hm
         nkog73/JlXZtOQT+JurfLqgO94aucy++KjGfNotu2xLiZyoa+Bq5L+2i5Jf12GtoD8Q2
         R3THJXqWwtD7YDkBkm6nSeUAgbm04AVIXB8OuTYD1/3CwK4GL/2Z4BxmEy3O6LPJbxu9
         zjKPNLVAmWyjRjCwdWtQUlePCeEOo8IcnTEaAJI/YIRlt6Bq0iY+5oO7dLD1AvRWTLmU
         INPHIXO7Te2HccmF65Zon0x918amrF3ky2q0i+5Qch1NaqXj2EtVXYZ1jSw2Gciy2JhK
         3p4g==
X-Gm-Message-State: AFq9FYK06IQzBpCuDWgNsYqSES/N+IpSutjoO1f9O3zBxpsXfZRhuofx
	0rycttPPsySXwhukMSiQ/hlnCiLFQV8mVggqkmdG+xhWMHy2wvQeVX16JZp8eyx8
X-Gm-Gg: AYBFou3UlzeCQWgNaalyowth1r+pkCHuH2yOFKN0WmI0slDcAg3aUnBV7HBA3IM04mT
	XHtjrutIz8ahiUT+mEwFzgsl2JkLHADWqNYkp77+4gv9yMObZGv1nXCuatOHBQ1bWuaAWK8NRSR
	eAqjsqj87c5mhi2HNiRHqanOvFVPzZumb4F9aodUXIWa8ypFHRQ81gtCudhd8EiZ+CP7/Md3y6t
	SOJi28yDdGO/8G9e2mzAYwYfWfJ4WD//1jYppt+igGBY6yRQm+pIh/lmvaeKAQoE8tE/DCpCpMU
	sbU5JMQdj7wFfJMErs1jO0R6VsGII40Svgl9Rcqglp32zHHMoHp6puK+rb5zOxsypEhpEemMrc2
	7TO5z7hu9trLliGBO4qp7PQW2dmw47uPyQnxBpcX3Hy2Jr74nWUSSr/+P+vofZRZ1cBu2r0Kq+Y
	ngjzVRZfv+xFUS8rA214sydnT3ktTVE49iYMp0t6qnz5jWxg8SjC+MvI+QCkUZI/E3krveyvTG4
	dQNHYL0jepkn7DTREt8zUnhVzncFk+7RhmMrzQ=
X-Received: by 2002:a17:90b:4e8b:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3abbe66dfa9mr3302641a91.32.1791839424476;
        Mon, 12 Oct 2026 14:10:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 3/43] dovecot: ignore already fixed CVEs
Date: Tue, 13 Oct 2026 10:09:27 +1300
Message-ID: <20261012211009.3352822-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130773

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
index 993453eaa30..06e6ee39fa3 100644
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

