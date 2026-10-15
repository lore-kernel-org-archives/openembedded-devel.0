Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF731CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32817.1792043045293638316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oQu8XUqP;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5d0ee1951so30925185ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043045; x=1792647845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qVITSVbl7xeJXRH7g7Re5urKiKlSHDaSKBKFmBAleaM=;
        b=oQu8XUqPjKHS1CS4fS3I3fu0Zf6uJN0QrHaABpslpxIXdG2exJoLDX4IrTPMnbzGiM
         XRyYUYTR0SAGSDnUGCRxJYTI9D5X3mtI9Tet7s1veSIzutblWxN1Nqfj8WkWxADvMYf1
         0V1/jD7fr3IHMK2JJ+GEukKPJFTNTHS3NzakXh3Rld+Y39AJnzbeWXLVcEHhRqdKQqKR
         2IHcZa6pmTkNU5ZlTEhwvt+i65aF77h8RmY8PFADl/RrEia+wzwqz2yA9SQfri/vhk3V
         zAKima7MxO+HgRsaU1NxNiyoLjEgt1oK48VTbEZZ+Y9Q1tEc++it2CvY35u11mHzSkPl
         pwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043045; x=1792647845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qVITSVbl7xeJXRH7g7Re5urKiKlSHDaSKBKFmBAleaM=;
        b=0vP18UmXVBZiagriIrvaJaajP+lywGrou7kKX0qLn2fIuo/OZmvsPAmuowPwaRqDWj
         bN5l5c16QudCqL3pkdDBSVjKUw7wq3Qya4woHWLjkNY7mEkocN+zOAwjxzYzyzF96kSI
         lf2N6uWV7uRuCaBcdYL0gHks33+5XNQ//QgtK9+AdG+Falgi/EWi3fRIl9HwUP+soLgL
         uafRER49sQETbjc3FPUtv60CTHSVHNTEz0q0kPuGZNGI9g82pyGED3LUxxngefQEJeK3
         haiyGyN44SUULfmOE2a4H8pdtpyoObpCNHDUMSlCk096qRnMr5NcNjZdDDKaEuxFB/Tt
         J4gw==
X-Gm-Message-State: AFq9FYKkYheKCChGlEsGLRi/CrE6ao7T6cp1NWYHabUKjPHP+nGM/x4Y
	O8RAYzpsoXXjh8fBvR4igNpR+eZM2y+ZqGVOtqdPijcPymUX3l8qQXDoSgfxNA==
X-Gm-Gg: AYBFou1C9eDwAstfiy5T3RiheEx7Yc1XlD6ftsu8X3Sx4b8xhymCs8fM6npUHv8z/CZ
	AkL1RqVv8S3M5DaTSic529wYeq4ImYL6nw8He+WiAl9p56y2NCmDDv7yp80GDhILpaJ+XR+NcnT
	WcfKztDOVucSdKsNsKg/fE1KAxOjqRzW/8jht0Opvc56MrvyIzYWgKxSGBGIvOx/SIBWhhEH5MH
	yDwmZZ5tz1SmqCpKw0C6Bvh/lXpZek5CbyYuuDQ4RhzMxaQPa8PSHH37BSdGLlFwKUptK64PNh3
	/jF34QkxVH96DmU4HcchXSQH+q9UCyyZ+EoQ0OQrN5blNkJz5xVXdMqNou7jBdWDDJMgnnIEb+t
	qFDRGEApNvlHPK/HEfqUqlCM0Ame/ySmqNWjIaMCoJYocYhfzlO8aI+JZHtact3EyLZwmy/KeGI
	Eg0lIkhUPpxyGDnjaprEb6suBvkV6a50HIpTYoR3wZrOdBf3jWvOGloOHFqHphyTUiYSlgsGFHD
	6d23Oh2L8v13+YP3YbpvOM=
X-Received: by 2002:a17:902:e74f:b0:2e5:d2b1:c70b with SMTP id d9443c01a7336-2e842e07b59mr156249255ad.60.1792043044615;
        Wed, 14 Oct 2026 22:44:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 35/82] libssh: mark CVEs patched
Date: Thu, 15 Oct 2026 18:41:23 +1300
Message-ID: <26f04746444b29ae4678709df67ec7a71bdfc51b.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130955

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog[1] also confirms the fix.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59843
https://nvd.nist.gov/vuln/detail/cve-2026-59844
https://nvd.nist.gov/vuln/detail/cve-2026-59845
https://nvd.nist.gov/vuln/detail/cve-2026-59846
https://nvd.nist.gov/vuln/detail/cve-2026-59848
https://nvd.nist.gov/vuln/detail/cve-2026-59850

[1]https://gitlab.com/libssh/libssh-mirror/-/blob/libssh-0.11.5/CHANGELOG?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index 738f8b1731..a99c4ee788 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -50,3 +50,9 @@ do_install_ptest () {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: issue only applies on Windows"
+CVE_STATUS[CVE-2026-59843] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59844] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59845] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59846] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59848] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59850] = "fixed-version: fixed in v0.11.5"

