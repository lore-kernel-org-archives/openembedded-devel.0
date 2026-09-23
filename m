Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2B2C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:17 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4181.1790160129164454377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DGLI19t5;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc75e33cc69so358498a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160128; x=1790764928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EYv4sClpI5QZTfkw0/7ygjTYKBjL8hp557KICEI1TQ=;
        b=DGLI19t5NHml55dA1yMaNRbZBbX4BjV3JwpKi81nk479+F5gfxwy3SIXYdA5F4tkju
         FiwXNHechRmuD2vO2v+Nn1fbaFt8lbNbbK9XTPXYONdcyrUpRIuetR+MEBKTMMS7ClEJ
         3A03sW+0I14jsf3E8XXpFo2VltFs84gK9DoqjJInqRsG0gzZi7FHUkdtrb+omLMMJRKp
         H5C7iMx/oJBoVaQMKy9lWLpFRxQjVEwWsXweb/C19dLuxJVeL4tSLyip4qGoqT6MVWOX
         KBiBe2C+lGviNz6Z4VGwPOMvmBdv5AKbi/Qf5gTkOsFgaLq2RQ09GMgS/TF4+VPK5KIX
         z9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160128; x=1790764928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8EYv4sClpI5QZTfkw0/7ygjTYKBjL8hp557KICEI1TQ=;
        b=PAaeCOU1H3aJYJmT6P48PG8mgtIpj3HSYL0xpvlEs9XVdPu3A92Zl5uv78VOvdg5Gs
         jnvPFpDUPLc3Z9d/WnkX55hAfJC0aCH3vyTs2EqEpJkT2uOj24O+sLMaisLw/0OBCwre
         wHf/hamuExW0uS9d9vW+cPVz4OvcaudR+1EJrzsO/ZtWGMsCAC+sB1pwOOsEfM93qIx/
         wnnzTlz2RE9/NQeMrO6v7Pbhf40K7DIjzQKTxenxtPTbO47F/2zOKqN+MZCOO7dSGqi3
         u2p81DJZuf4cs4yZKZkzp51TacXhdMEwYQBwncnBpPDzGCV2sVBv3Eyf+tTI5pLHPD1c
         XA3A==
X-Gm-Message-State: AFuF++luqAoIuVJzng+5R3ovqDMIMM4l6Nvrvt6zboWqM5oQBzWEz7fx
	XDJC7HNBL0APa2p+14uWiH6HgBIegMrdfmUJb2hgs6vPcPyuER68GhEqdLGSHA==
X-Gm-Gg: AYBFou2D6VGOPmyOc/SYCC6DTBbThU5hlPc1fenu6639VZqQcFx45ksI18A5zmd7mn5
	RmMAf2Z0RqBZo9ZbPwe9d82zTQUoamlz9oV9/PCaY7GGqXX2lWcaBOtWd9IY7iUpwaRJBVlAmer
	ErWi5twshBpkJUCjCbxLOxn9Pqv+lM+dVYT+UX8p0vi4RBfUHwVye5qMsQ341sUrys6GXpBui/A
	CKhkdwAoYVA4/SSPRVbzEIlSgn1DiFugCO1nPItV9j9NylwGuqmtA3NCbB0KTKJQU6va+Fs7A/l
	8Js9GqmhJqM81tXUp7/XHdmE8DFCwhu8e8/12BiCBcXH/jrgs04vfWwxISgjvIyiOU00jwCw4Cb
	wTjJydeLlNCMwpMuRaUXlA3JTgkHbZMlinb+vDkiHCyC2EUQg6dNgGYSujqYZaq8gbPmxgf+rtI
	jWbNqPwuVbye8e0cIoA+K24vx7WgDLYB5hofMJYuo4rfEj4TthCtjXPuourzogweqzrfKlgtjy6
	ghVjN9lVtwwAZS14x4T+PtUvnA6ng7uFA==
X-Received: by 2002:a05:6a21:e089:b0:3dd:a195:dd50 with SMTP id adf61e73a8af0-3ddf827f04cmr2357096637.50.1790160128575;
        Wed, 23 Sep 2026 03:42:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 32/42] php: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:46 +1200
Message-ID: <20260923104056.457360-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130219

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE. php:php
is the active NVD dictionary CPE and configuration identity. php_group:php
preserves historical NVD configurations and current authoritative PHP
Security CNA affected data for the same php-src source; it is not an NVD
dictionary CPE.

This changes the generated identities to two exact CPEs, but the frozen
sbom-cve-check database leaves the 731-entry CVE report unchanged, with no
current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4b8eedb7d26387005924e6035f178b1d56dd33e9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.5.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.10.bb b/meta-oe/recipes-devtools/php/php_8.5.10.bb
index aab18777c7..130a98f634 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.10.bb
@@ -34,6 +34,8 @@ S = "${UNPACKDIR}/php-${PV}"
 
 SRC_URI[sha256sum] = "d79bd4f3a9248e5cb5833766ba0d51cd35dd01b8727f23f30bcdba6fabc51d3e"
 
+CVE_PRODUCT = "php:php php_group:php"
+
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
 CVE_STATUS_PHP = " \

