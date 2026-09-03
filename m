Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0A9C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:55 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4203.1788429049566614891
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pGfg6in+;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e27035206so1965891b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429049; x=1789033849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEI6p+CRA9EMBL6/HGN7/awslcYQEBdet1Ze67a8jUA=;
        b=pGfg6in+TYORfEno3tsM+iZ+Vwlh3zJW8gBVNoRySYP8wHtYklE64zGHzKm8a+aKDn
         7S7Otq3nJCYdCGXrpgNSLCw1gsO4WLbO+Iel2RW/Lz9ARDvZySShxIcbyPnfxY8U9n3o
         QiklwfsXqIQelhJwwvPEuezgWaZT50/0Lec1DxZlloj7CO/JxqADTAyH0LJGggQlXZwz
         V7qPVJp74cPOGOvrniuk8VqlVVaHZVo4peWakmkfhzApq63sVHytVu2Vwt9wqQM5R8xK
         wHpdhaVVSoD4a8U0UWTSeVJlIPlstHbz/8grGo5C8AjgeSSCzHX9GdH/+ovN2mU0MRFd
         fEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429049; x=1789033849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kEI6p+CRA9EMBL6/HGN7/awslcYQEBdet1Ze67a8jUA=;
        b=iDXOv46dyN7YvxGnvTSw0rFvBudJzDkmh/IQFirIZ9+y30g+DdY/voilUgiJ3gvJvB
         30vWH9/ywMZLima2sK9v+Q+2rd77vkyza7gObvIVdXKy05gHxB2fSbY5SUaxw7WoNfAZ
         qgwGe/1+c59gBCzHXCEIXolh9zm3+agTadWRgzq7ws7FeFETkBTG7AnNPMkK4dYbRnAY
         rgIs9FKY5xzqhumpTPDm0F7K3O/WGstH+1bVT1F5w2CVkdFFogoSjmEOQlZ7jFupbykN
         7DljY2eCXnH9h4h+JQhrKDqfupJ8iqa8Ss5XJl8LfXfY1fvy//9i7ZEf+XjET7RB9HrA
         i3sg==
X-Gm-Message-State: AFuF++kg5+VDTgJ0s1YCVDcqyuBGGUsdyIFkLgvHcclQWGVUp0w+fi3K
	a8tOEi8K4A9wMKXTd+y2ty9RxFDF+gnpgraySanjnn1GkTC3CI8WZmCx6/UUqcFE
X-Gm-Gg: AYBFou0XRMTCyUTsLp6CoS8tFOjdx6DVNOwMh6Y88kp7soNXZrDE3KNnU/GS3TghHpM
	ujrP/exq7r5xC7IuuEs+NFi8HMWSNgTqkJx25bdeYVMgtMwD0pj08QRhWeDa97TphFO3FuBhq9Q
	eo0O8miaqTzxZWNWYztWgn0jqt7XunP6nTG5hcA6l9OXoY02+xDzYBoL216aQBiKjozvf2lLO5H
	Kvd+jESy9eEtt9JfJIQH5FgpyCpYpvejbsdYY6u58/PIT7fHJQBFf1yza7JwDzHHdqHbid79x/2
	6jFDjiYwC8ywq9S2Yr11uHrxq4vo/QqXKWJLKsHJKzH3aeDQIWg46YuTLtiJ8pKhq7OvXs5ff7c
	hJuIiI5g3PhGiisKhK+a4iZ85jpiM3VOiPXsKBQrlapciQN8UE4JWYasJJNfTcl6EaI/v6QxoD7
	O2UuMvJsHmKtAC2nnf9Uj4Ry9a7DIDVFoRdFb2VtRMGxQlcJ8vA0EQ++oQ+z4T0JJuqCuBxc1Po
	nAj1hMZXvzhYg==
X-Received: by 2002:a05:6a00:230a:b0:857:726d:2e97 with SMTP id d2e1a72fcca58-85ed3f6e665mr14853712b3a.20.1788429048791;
        Thu, 03 Sep 2026 02:50:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 22/22] libkcapi: patch CVE-2026-71225
Date: Thu,  3 Sep 2026 21:49:53 +1200
Message-ID: <20260903094954.3240723-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129738

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit fixing the CVE as per the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-71225

[1]https://github.com/smuellerDD/libkcapi/releases/tag/v1.5.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libkcapi/libkcapi/CVE-2026-71225.patch    | 38 +++++++++++++++++++
 .../recipes-crypto/libkcapi/libkcapi_1.5.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71225.patch

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71225.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71225.patch
new file mode 100644
index 0000000000..8a2e4220e7
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71225.patch
@@ -0,0 +1,38 @@
+From ca418d6cc684057bcead18b3dd68d64cb3e156af Mon Sep 17 00:00:00 2001
+From: Stephan Mueller <smueller@chronox.de>
+Date: Thu, 30 Jul 2026 08:39:37 +0200
+Subject: [PATCH] Add safety measure to prevent IV reuse
+
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+
+CVE: CVE-2026-71225
+Upstream-Status: Backport [https://github.com/smuellerDD/libkcapi/commit/017adba8f54f36f92e1919687fb67a89c4d299c6]
+
+Dropped changes to the CHANGES.md file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/kcapi-kernel-if.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index a54cdaa..859ecdf 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -1387,6 +1387,15 @@ ssize_t _kcapi_cipher_crypt_chunk(struct kcapi_handle *handle,
+ 		inlen -= inprocess;
+ 		out += ret;
+ 		outlen -= (size_t)ret;
++
++		/*
++		 * Clear the IV so subsequent chunks do not override the
++		 * kernel's chained IV via ALG_SET_IV.  The kernel updates
++		 * its internal IV after each operation; by not sending
++		 * ALG_SET_IV for later chunks, the next chunk continues
++		 * where the previous one left off.
++		 */
++		handle->cipher.iv = NULL;
+ 	}
+ 
+ 	return totallen;
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
index f1fe6a0940..edc8c0e47a 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https
            file://CVE-2026-71226-2.patch \
            file://CVE-2026-71226-3.patch \
            file://CVE-2026-71227.patch \
+           file://CVE-2026-71225.patch \
           "
 
 inherit autotools

