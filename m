Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60DDF4BB80
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28139.1771959898494550980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWtzGJeF;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4837907f535so52790205e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959897; x=1772564697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcpNwamY0aYUD774U7ILtCJap41jYlb9ONMHQrpFu8w=;
        b=DWtzGJeFMsJMXj4OIp0E49TSl8xhHRqmb/Ff3F0AXUKNYTBuh8C8t+NPVo/WdyHeCV
         fSz+/Rgn+9Bafhc9VA8nSJdQJJHYc6MRvU6gnM2xavgYE1YsrI8yuVT8cL9ov+bkWJcf
         PoIg9vjKt5sBlnsEJPFQ0My0k1mgh9RfQN9MyASZXLNEMr0Flr2CIMfHHKw1a9cB5NTE
         4O8ArUKCzN+a5z2k3cG7bV7qrS6dbNANU2xz22y5p91jF8VTvag5oeYZS7PhxXO+2cEZ
         RlIkg+j07iCg0S9Df6h5v/DA3fLCJE0h1bjOk8U4polMUqMRGwCXdEqkXcTdR+CqluzN
         zGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959897; x=1772564697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BcpNwamY0aYUD774U7ILtCJap41jYlb9ONMHQrpFu8w=;
        b=rciUE1TWNb0HTw+gZx9lBCz6mT0oCBEP+WznHwOMvoowbpbFIgaFWVyQSIu4cV2Y17
         4rSyXjT1ieR7v36ysr79F9lAYH/9hG8pfafkrkVIcdiL7W4wwxcKP9FcQZqPSmlJnoEe
         R8H9qBv8Jin6bKv9lBc2Q2ADiaME0QuaaSTd9QTyHmPRixWNpnXFBCcBKgBj2C4D/BLS
         AHEzqEkcK3obSaTa/AGwlYRhodi6EvCBeRghLZho2RJyZbQBoOT4SkFp427XvXQhlQMv
         Maw+doBaNhWo8AbzZq+Miy8ZPr1IC9Th7LDyG1YjFhm0j6u+uNOVmIM79MmABz0poAaZ
         N0cw==
X-Gm-Message-State: AOJu0Yw7WJrS/vISSHrMuHrBYVg0QQCrbbHddf3J8jjY9CoC7h2Re9io
	8F4B3XUA1ZjEk0cSIxVPNk6KHHdH7k+aqZFfjk/roPJJWQQNsT+0/gfEwqi1pw==
X-Gm-Gg: AZuq6aLXwp0uJhA/hXl5DL1Co8rW0dD8Tc3dia2W1UP2XInWJ5BORE4gBDQ6c8oYIEE
	+fCGQeqNEAdL85TNNBua8SerXFWD+9mC+F7jdLJJJFIvXd6imp5wDo7iAh+deE0X//DMWnNJ1Lr
	W0/bCYuG8YO6PBHV3oXU9T65bvEa5DE8GYU70OhbuW3L8svDJiPyasLDe1Lz/q1zJDelYkZYFGs
	Rlpbhsw0US49BWSI4nZjs0zwyqwFRF1oA/EE6hkGuEMikU5McMKgLqO57vgT4DpW09BCFLKRPNC
	7mpIkEfWFWIce1/LH7wfSJewJNXPjYW0rk3pmYnfAX7yXRjGK+xKLzlFbWPYYkcV61Jwr54f0Io
	79sEH+YDmc9RL12wttpf7yVlb0sKMSGLB1NU6J64MpWuufnXm4tIJ63uKxGK5eo75GTraTMkWFk
	R2iMhCG6O9Ms+rshgNuxlJ
X-Received: by 2002:a05:600c:3b27:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-483a95bd842mr209610635e9.3.1771959896711;
        Tue, 24 Feb 2026 11:04:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm29394920f8f.17.2026.02.24.11.04.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 7/8] gimp: ignore already fixed CVEs
Date: Tue, 24 Feb 2026 20:04:50 +0100
Message-ID: <20260224190451.1596179-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224190451.1596179-1-skandigraun@gmail.com>
References: <20260224190451.1596179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124595

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0797
https://nvd.nist.gov/vuln/detail/CVE-2026-2044
https://nvd.nist.gov/vuln/detail/CVE-2026-2045
https://nvd.nist.gov/vuln/detail/CVE-2026-2047
https://nvd.nist.gov/vuln/detail/CVE-2026-2048

All these CVEs are already fixed in the recipe version, however
NVD tracks them currently without CPE info. Ignore them.

Relevant upstream commits:
CVE-2026-0797: https://gitlab.gnome.org/GNOME/gimp/-/commit/ca449c745d58daa3f4b1ed4c2030d35d401a009d
Note that the commit referenced by NVD is incorrect. This commit
was identified from the relevant upstream Gitlab issue:
https://gitlab.gnome.org/GNOME/gimp/-/issues/15555

CVE-2026-2044: https://gitlab.gnome.org/GNOME/gimp/-/commit/3b5f9ec2b4c03cf4a51a5414f2793844c26747e5
CVE-2026-2045: https://gitlab.gnome.org/GNOME/gimp/-/commit/bb896f67942557658b3fbfc67a1c073775c002c7
CVE-2026-2047: https://gitlab.gnome.org/GNOME/gimp/-/commit/5873e16f80cf4152d25a4c86b08553008a331e90
CVE-2026-2048: https://gitlab.gnome.org/GNOME/gimp/-/commit/fa69ac5ec5692f675de5c50a6df758f7d3e45117
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index 860fb5d26b..5cbb94055a 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -135,4 +135,7 @@ RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"
-CVE_STATUS[CVE-2025-15059] = "fixed-version: The issue is fixed since v3.0.8"
+
+CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_ALREADY"
+CVE_STATUS_FIXED_ALREADY[status] = "fixed-version: The issue is fixed since v3.0.8"
+CVE_STATUS_FIXED_ALREADY = "CVE-2025-15059 CVE-2026-0797 CVE-2026-2044 CVE-2026-2045 CVE-2026-2047 CVE-2026-2048"

