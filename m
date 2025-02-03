Return-Path: <bage@debian.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3EBC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 22:55:03 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web10.102616.1738623301571447520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 14:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=RosAzWat;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=hUoTFDe3s4BkXflBAa1Am5ZjJz6P1pw/E2aF8GApEEA=; b=RosAzWatsp3xYHw99G7t8msUlM
	aGnuqifkNSSZ9MuIGDetfZuX+IdO2Y5sjSUowpICgnaAGn6oBtyIKGGzJRT80ugu++VIb/4AbA291
	1f92M6B/LFdm0+BMxcErwBEn3Gl8GISKc1EfvLNsV/U5seMvFzBUNxTrIMbEiJ9LfOUfXRYH63Opg
	umnb9/MDaixPR6mgrnPvdk6etdJj5yP49ne02PGVU4NO9NMl+q5ZisHgAH8N2C8FSPWEy7CjzVlrB
	5OaKCw5CuMjcFPpyoqIoKT0myS3D4Lz2uRzUebOu8VWEo6zwGyOXZDYN0TVB/8NJlQrP/2t4vaTX5
	YJUZH+EA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tf5LG-000ZxU-1u; Mon, 03 Feb 2025 22:54:58 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [meta-python][PATCH] python3-crc32c: Declare Zlib license
Date: Mon,  3 Feb 2025 23:54:51 +0100
Message-ID: <20250203225452.3177-1-bage@debian.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 22:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115261

The CRC32C-ADLER license is the same as the SPDX-standardized Zlib.
Use Zlib over CRC32C-ADLER and as it is the last reference, remove the
CRC32C-ADLER license.

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta-python/licenses/CRC32C-ADLER                 | 15 ---------------
 .../recipes-devtools/python/python3-crc32c_2.3.bb |  2 +-
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-python/licenses/CRC32C-ADLER

diff --git a/meta-python/licenses/CRC32C-ADLER b/meta-python/licenses/CRC32C-ADLER
deleted file mode 100644
index f1f0e94ee0..0000000000
--- a/meta-python/licenses/CRC32C-ADLER
+++ /dev/null
@@ -1,15 +0,0 @@
-This software is provided 'as-is', without any express or implied
-warranty.  In no event will the author be held liable for any damages
-arising from the use of this software.
-
-Permission is granted to anyone to use this software for any purpose,
-including commercial applications, and to alter it and redistribute it
-freely, subject to the following restrictions:
-
-1. The origin of this software must not be misrepresented; you must not
-   claim that you wrote the original software. If you use this software
-   in a product, an acknowledgment in the product documentation would be
-   appreciated but is not required.
-2. Altered source versions must be plainly marked as such, and must not be
-   misrepresented as being the original software.
-3. This notice may not be removed or altered from any source distribution.
diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
index 125a7ad877..0e0569ba5b 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
 HOMEPAGE = "https://github.com/ICRAR/crc32c"
 
-LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.1-or-later"
+LICENSE = "BSD-2-Clause & BSD-3-Clause & Zlib & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
-- 
2.47.2


