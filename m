Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7153D2A01E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9435.1768395685180954730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a2IIbotl;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f4a1a3181so1642694b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395684; x=1769000484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1VYO7akak8KjYTxCSvWHshUw4cj2PYUkaRYxD1QlL4=;
        b=a2IIbotlv0wm3T/uKMUC7lPXm34ypHyjuUtd3ahNyECqEJ4zAU86JxCexl7sPTjpw5
         ojLi7M1kcQppa01niaSnJBWx/Yz7YzsZv0rVFBiDccSfhN+AHFShLpd8p6wR72hcrglX
         NGA2FTvAWQhewnUcyyixAip66lMMbAcE1SS7SzSO1oE1WrySAwtV0JPNyYBsvgVwctgE
         /5TpH2gyf/EdKCSTnNpXuThV8bgcZm+HCT+ZTFwGK7VE09SjL7/oXQZrggF+L3JIo3Vw
         fQzTL01ZaHQMsLCpVBIPnu75zL2BxkWiftIuyIszfaC5P66w70znhMG2g0oWgRidR8AO
         OXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395684; x=1769000484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M1VYO7akak8KjYTxCSvWHshUw4cj2PYUkaRYxD1QlL4=;
        b=YinVSnv4NOydZa7MnbWjAadQLLfrYG0o6x1Lc9Y3HT62B0Wz+52m2GL5CdLUOvcRj+
         DRgLzFmMXmO7vZ+IaBIYInfAD7e3yjGN9PRNzV3L92FIYq/y+3qW/a0BltuafaXKF9OS
         I8ZDRbbA05uagTfLES5YWtUIPD/kbiuWGIae1bUHDk3H8xUHdQfgC6FtCWEDNYkWBrDv
         cDcsrMJIggE7bNsYhBZVUQBuIFc/x93uXWL6Hy+e42M6VrKwiaugr/zwF3DFnP1Cq+S4
         4bUgJSyULFm62XCxBKWNaG7H6v+zzTjFeGSO4iJyXU2DdDdhUq/YZvFH08IIS7RIIssM
         VOQQ==
X-Gm-Message-State: AOJu0YwPEsUZ42IP7B+Lqy3T4cx4ZifB3qXHXsfd/Iy9gQhY5r3DRKK2
	XP5SkTDIlq/HEV+PirfuRHFwS9WZnZWlyucTpnUA/uk3yoKleViQg+/WZcxJPg==
X-Gm-Gg: AY/fxX5cp99cHc2u4l6fAXNt1Zbiny9SRmeE4tWbJSU1rnP8MiZmOj5+fw7jigVOiir
	Kfq6aqY9zt2BxKv7ygr/U0pcMZNvOIwfG6fVQEPKugPuuiZ4v4kQmYrALbc/uNMKY1fMx9RiR1U
	fK1h72ci87PVfDh8HqBgaadJpLjFR35nCnqzYj3nmCCayRI97bMfZJ31+9L7MKoXAeb4fYDCHYA
	MdREJjMD8VMbvTtTeHMWYJn+WIOHGjzXuhhQlKxCWzMGVqRyT8pDSWZKxAEJRC9N3T910/K/buv
	R//FLpgN/8OrFIocg1Pe3YGycANf5HWPBly+qbV26D7WERap173BBPPUu50GZ46HHcmP/opQpO6
	f/dXpFLpkU8yUNOSL3ZJLDN6GO2EJvCVWzPHkwFTub0PvUO/KySrM68eUegH1zagi7JjQMmp/sG
	/bwUCJBQ3pt/8LGiGSJu4IPKk=
X-Received: by 2002:a05:6a00:410f:b0:81f:3bfa:f0da with SMTP id d2e1a72fcca58-81f81cde3camr2369731b3a.29.1768395684121;
        Wed, 14 Jan 2026 05:01:24 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 08/20] python3-ldap: set CVE_PRODUCT
Date: Thu, 15 Jan 2026 02:00:45 +1300
Message-ID: <20260114130100.1016416-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123461

From: Gyorgy Sarvari <skandigraun@gmail.com>

The relevant CVEs are tracked with python-ldap:python-ldap CPE, not
python:python-ldap.

See CVE db query:
sqlite> select * from products where PRODUCT like '%python-ldap%';
CVE-2021-46823|python-ldap|python-ldap|||3.4.0|<
CVE-2025-61911|python-ldap|python-ldap|||3.4.5|<
CVE-2025-61912|python-ldap|python-ldap|||3.4.5|<

Set the CVE_PRODUCT accordingly

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bd77eb699214a27130712c78bd2a0961aa5fc26b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-networking/python/python3-ldap_3.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
index 6caf5f37ce..57a5b8dbe1 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
@@ -28,3 +28,5 @@ RDEPENDS:${PN} = " \
     python3-threading \
     python3-unittest \
 "
+
+CVE_PRODUCT = "python-ldap"

