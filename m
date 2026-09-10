Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0775AC88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:09:47 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27823.1789081784514093267
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OXf0Xpuc;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39682983a0fso329506a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081784; x=1789686584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUHEhkGWcUieOKQ9U3LGTnPgeil3Rq+GOFgBFI6zTyA=;
        b=OXf0XpucahIKUWuNqO/JnQRlvSX5VB46bOY1Hz+27JTmo21Qt3kkTh+/lmLda2MkzT
         h2ryncPPhpSpXHbH0lfaAns5WGSTtWShsdtRWGSVQgo56H3Mq8/eq4l93dqlsJI3iz2c
         k8GCH111RB4Y6Gtk1yWAlm1Hty5CbuocvrqO0XgMrOYSk+cwNDpfRwzDOKB4e1R15+bE
         CW5zVkyjVHSecFCdSXX03v4zakfpKX2pj4Wa72u+lrIFg5HYC2UqNJmKlb7tUQKlGyWx
         eJIfQXua6Hj2iLL3gMKfqwhBEl0rRVgNJson7+Sn0SqgdUuJAa+CwlhMyMlfM5rkd6L6
         N4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081784; x=1789686584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUHEhkGWcUieOKQ9U3LGTnPgeil3Rq+GOFgBFI6zTyA=;
        b=lTdUTJ7erCtGyiEGoID8C6sTkM6VO15PMgIZWRl4e2KAe8/fxrTiV93nAPsgabOe4H
         wSazyiFOgUkjdNOdJauT6vHRpwgem3pBA5B2p5IQOr7tZHOECx8s2cj3y7xvL8M13Lpi
         dOq26aU9T3KEARqU2wBEdQPUo7oQE+6j+usDWZfO0KNOIbS7ZsP7tccA6khZ6Gh06Wmi
         BETW6PYuE6q9+FD49o+bo9jSzqoPLrLu2y3OY2kAHDlHhq0F2x1hycDBAJqgdcIhqX2f
         UaSWRDnmwAMxvuqwtwxS0SX5orRkYCjQpfPLvgjkdtT/KOfd26fwXMuZMtLzj0+aGQt9
         dhcg==
X-Gm-Message-State: AFuF++lpufS3Zyp5P9Fk9LM9qASvr019hQIMxljZnXtbvIZjx2YmL/Ts
	zN2jN8P9dhjHLjPPYdLVITe3u4U2cgMnTynDXGFdVI2qSadwM+Q8BM3yPL8bDw==
X-Gm-Gg: AYBFou0fH/ug2wbT66If//cRnk8MOiznJddQgyk3+jnCjwTM7ic1iUbdeGHU8xlQnDy
	00TBwWALYmOMKIjtNl7xA5Q0dk/tDUgWJNlqt2y2CFGSeNYpPOlRU3MyY1Plrncfq8xK/q5K+aR
	FxFFbgVX160nXKA3I6m98exMG6CRl8cyrjBvsOH11rUjKHq0EvG59z2hKuh8ykVWU9l5FyliTmo
	TjrAl1PMCvy8LSrsh6opDxVlsBOfoybTnZy55rQzGYfuR6VOtwE9GlLGmdqdHi8jiEAaxmsHIhn
	EMu3P865JRqa2NC2oG1Xo9x3fDd+AQnJ0ll2rrhbQFqdIhFBVBct2qFRYCMOhlq21ieKA6G+Y65
	ZW3LRe6FQ0h6bfgsG4DolEBKakcGhKHJPosn/NDI79Wz3IB2iYYJO2b365/zIt+FU2aacYd0b9E
	cFnozX6gS00c9wdvlNSPUHXKd4a1uYQeL1wQCehuCG2pQhKK9ZwHU73BXMKcVVxK9+RLq7BIrNf
	5wJlsEOgDB6HULvqjO55zo+XB6XbBNNag==
X-Received: by 2002:a17:90b:1b05:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39d9bd9515amr1679208a91.9.1789081783841;
        Thu, 10 Sep 2026 16:09:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:09:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/32] zabbix: ignore multiple CVEs
Date: Fri, 11 Sep 2026 11:09:00 +1200
Message-ID: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129919

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2026-23922
https://support.zabbix.com/browse/ZBX-28067
https://nvd.nist.gov/vuln/detail/cve-2026-23922

CVE-2026-23924
https://support.zabbix.com/browse/ZBX-27642
https://nvd.nist.gov/vuln/detail/cve-2026-23924
https://github.com/zabbix/zabbix/blob/7.4.14/ChangeLog#L1856

CVE-2026-23926
https://support.zabbix.com/browse/ZBX-27758
https://nvd.nist.gov/vuln/detail/cve-2026-23926
https://github.com/zabbix/zabbix/blob/7.4.14/ChangeLog#L1787

CVE-2026-23927
https://support.zabbix.com/browse/ZBX-27759
https://nvd.nist.gov/vuln/detail/cve-2026-23927
https://github.com/zabbix/zabbix/blob/7.4.14/ChangeLog#L1785

CVE-2026-23928
https://support.zabbix.com/browse/ZBX-27760
https://nvd.nist.gov/vuln/detail/cve-2026-23928
https://github.com/zabbix/zabbix/blob/7.4.14/ChangeLog#L1786

CVE-2026-23931
https://support.zabbix.com/browse/ZBX-28070
https://nvd.nist.gov/vuln/detail/cve-2026-23931

CVE-2026-23933
https://support.zabbix.com/browse/ZBX-28071
https://nvd.nist.gov/vuln/detail/cve-2026-23933

CVE-2026-23934
https://support.zabbix.com/browse/ZBX-28072
https://nvd.nist.gov/vuln/detail/cve-2026-23934

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
index 1ec159cdee..7dcb69b070 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
@@ -82,3 +82,11 @@ CVE_STATUS[CVE-2026-23919] = "fixed-version: fixed since 7.0.19"
 CVE_STATUS[CVE-2026-23920] = "fixed-version: fixed since 7.0.22"
 CVE_STATUS[CVE-2026-23921] = "fixed-version: fixed since 7.0.22"
 CVE_STATUS[CVE-2026-23923] = "cpe-incorrect: 7.0 versions don't have the vulnerable code"
+CVE_STATUS[CVE-2026-23922] = "cpe-incorrect: Only affects 7.4.x"
+CVE_STATUS[CVE-2026-23924] = "fixed-version: fixed since 7.0.23"
+CVE_STATUS[CVE-2026-23926] = "fixed-version: fixed in 7.0.24"
+CVE_STATUS[CVE-2026-23927] = "fixed-version: fixed in 7.0.24"
+CVE_STATUS[CVE-2026-23928] = "fixed-version: fixed in 7.0.24"
+CVE_STATUS[CVE-2026-23931] = "cpe-incorrect: Only affects 7.4.x"
+CVE_STATUS[CVE-2026-23933] = "cpe-incorrect: Only affects 7.4.x"
+CVE_STATUS[CVE-2026-23934] = "cpe-incorrect: Only affects 7.4.x"

