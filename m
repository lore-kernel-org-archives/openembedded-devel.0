Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11810.1795762981837275631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rktKq+WS;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f045b921caso44598015ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762981; x=1796367781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD7bvrgimEA5mHN7kA4bD/kzEh7GXE83w5DHdxI2hHg=;
        b=rktKq+WS/wLB/WRv2BQPfOJj2nSMeVija3PX0OZoDv/6zgBQXHPbSuOn2fNxjmRTmQ
         j2rjNERrMYWyB3rd8C/TddmejcBTdOFt9t6neqHotpjSWi/Y+m4AgfwGJlVQqw9YXKB0
         YE7ghFyM/gq5+cO02FT1/K5VvdUAr4QnXXXgBymrUSx2v8Y2ZKzU6goJlgGTdYMxmHzU
         C4kj2a/oXrR7j3VBSMv04GyxNSdO9A0vE/uAohn0Fg3JuwTQXgdqTbUL8EyOm7nr766a
         NEArLJF59J2Jz7ek+aqv00UAMVkz0uNZZpxHLVQrk2TdyYMb21Od3KB8P3p1KZubCBWI
         qeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762981; x=1796367781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wD7bvrgimEA5mHN7kA4bD/kzEh7GXE83w5DHdxI2hHg=;
        b=l3U6LIzJ1G2ejX/upAZYESMN/jpUvwWrlYUri7pxx+bdWBCPABpEtL9aus1MipLgKT
         rW7MUkKXbYroPcj/ktam4hrFGMqQOMkye8G/rE/hsgLexr8YlBy4PQ1lBSzSVColR2Dn
         FeSkMxs39+sIW25YL5J0SEgssIZ8UewkkJ7sXAT3gXTR4/eWOwo4JpEr6jKuHDF2LSd4
         O0BX/vAk7E9q7gwfJao4oHaKRTccMHWMOMYSgPpTGlgYBThsBwnHiw4wj6Mc6DuGhBrq
         w6M0pfmPzbChfe7EHKlJuP8rIXdiJ06suX1VQX2cBWhRsjtPCVyLUvAzyDvk4w6Bn2fk
         0S8A==
X-Gm-Message-State: APuU4Z9fTUH5YeGJbSUq4pjEMfqrCu+1eFRc8p7TEpMIG0geh/BpgdTm
	sLUaiybOtSPsHchcYwz37af5Wdh+6vtysUHEyRky4qKZctWQDwI64XuYlTSK0iO2
X-Gm-Gg: AZFdTZc6uCAE9HEoCNV+qBBHZPRHDovP26IY/FPfE906uyP+1Z1m6WWESZ7uu5G2i6O
	KM3GM8c6P8lchSOXT4QTP2cXPvl3xTinH2R0uoYZSbWi+//x3vFfREEW7wzFDnG4XmVwXlJ8X27
	qj/kVANOoU/z9344p8BzScEZQHACbwXrXPPomlnS4E9mW+Yqbg81EimZ/xwwl2xt0E/K1p6acIA
	Z5qXjdr3vUz3Hp7jH9eWqkwI/f98h3W6xk8OUKqJHqUPrRRd7zYrl0ZKDT99iNypIiyIqQP1XjB
	be63iaL6/wOFkmX8Oies9ei1rSIDZva6RNXca3cmYA/a/qqtU6+mShlcX7tju4xDDxacK0R9JHh
	ZmfIoOpYPCY247tyKVQ57lOsoRanq6pdoJhXTtIn9BIVGJjojJthN4dAZpEFg4T8Ug6QwlCt3m5
	RibZTJD9G3USUJLHmhUfIzAhqFURAQowbIADVgOuqHFmu4bMbfdPcQEH86kZIHcakJeHdTS11QH
	bxkVhY/0ADiSRA8ppEr67CYEeWiNabgFIX7hSm8LrdCE0FjsSMc144Wax9DLpcCjZH0785Vygph
	uHhRr9DRCPG60cZbqneN/8okjSRO4yGwlcwjaogYZML9wcujSW1/dLMihUH0oydjtSP/7z+sS5N
	W7gmme+pKULH/IHFOYRNUteROzsldZcY2+eAHju4SQg0nOo2kDRgX9n6yHR3LWz9BeODEd5RZ3L
	zabTpNAJQJ0WAT1t/OpHvexxOLtUh9erkkxoFuv0OHigu/ZSEjf5eyUMDi3wlO5UnAHO7aJ4cEg
	n71AoUcStKFIGXguhQ//IeROav0hJJSu8EfoxPIoHUcYLMabYJee32x6sI3hhXspT7C58rWU41f
	0JFi
X-Received: by 2002:a17:90b:390c:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b41c9beafamr21337560a91.66.1795762980902;
        Thu, 26 Nov 2026 23:03:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36464914a91.15.2026.11.26.23.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 5/5] fuse: Fix upstream version check
Date: Thu, 26 Nov 2026 23:02:52 -0800
Message-ID: <20261127070252.2364951-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
References: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133354
Content-Type: text/plain; charset="utf-8"

The releases page no longer lists tarball names and the 2.x releases are
paginated away behind the 3.x ones, so the check found nothing. Search
the releases page for fuse-2 and match the 2.x release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index f127514f68..49e5023b00 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -19,8 +19,9 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
 SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
 SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
 
-UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
-UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
+# 3.x is packaged as fuse3
+UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases?q=fuse-2&expanded=true"
+UPSTREAM_CHECK_REGEX = "releases/tag/fuse-(?P<pver>2(\.\d+)+)$"
 
 CVE_PRODUCT = "fuse_project:fuse fuse:fuse"
 
