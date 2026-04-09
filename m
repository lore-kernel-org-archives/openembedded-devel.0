Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B7CE9DE50
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:02 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127038.1775718592672236515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kHd6OsPX;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82c68339cf0so338047b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718592; x=1776323392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVOxetOIVpVKXhx+74PAdSSA304fkCb8oN8bT/Em9HY=;
        b=kHd6OsPX0Q9OJxcmXjkacpDM9giIGItvFzPzBCS4yv81ZGJLFI3h2XXKdopDdLWPG+
         dtz6jVZ7L7EnfhY9/ux6GdBLayGl3GRSn6so8QkiBBu1/5E6e1wC0HTR90uClhPgQGNX
         bfqNxGpvA6W4rgu5ltVJrGULvp4ATusSI6IGENrC8eKTu8XFn5ph23+WgspHq8Wv5l8+
         e6QC0Us0f0V12chPhIqXXXtr34WV9T/GfX97VnPvkKLcGjHrervOrymjc5sqKED4+4VI
         e0Qhd/qulzgdN64VsLvPFXFDzOvdHMSWVAfnLHfHeLry5OD/siqeX9bXeQv9/vyRF1Of
         vVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718592; x=1776323392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVOxetOIVpVKXhx+74PAdSSA304fkCb8oN8bT/Em9HY=;
        b=WMNjaEQL6UnjIkh4MGzVbCtBalSLnmOfxQZST4PVzGY/cmDxnwJmATcTfeSA7UHvUd
         KctAB59OXBSqmpOzk4DzBqFY7BXnl97TRlzBviWhBSICVzmvum0CS9WekTfTjxjdVn4f
         ujAkCx6FmEr6V2fl/i8MGYIa4FJeFFwIkDG+M53ra958HYi28rBTMzFpiXTGwThxx31z
         tUNyzo60xiF965OTNgW0omgh4i09xFHLtTmUXIWthmdR+o6ssK3tPI/Bp+fmyA4zslMo
         UoYq7ZDgDaMyFgfelOeX5/nl84O+uHoxiyQ8wi2Qr1kuFJOuICg13ZqmpgiKgUsnrv3w
         OI3g==
X-Gm-Message-State: AOJu0Yxr4rVxbLNH6Q8QdblR5Wfa0Y1yi5PHuEk2N8oFh2TiPFf5B1Xp
	b3q+ymKh70MaJJd8tLTI1MCNA0mDjCr8bxtf0HDVefrUKLFNh1UAQxweE4J6tA==
X-Gm-Gg: AeBDiesR3VnUUs8ALnKUhsZ1bjmwWEz4BwVUurXWP+P1NU5x5dufglkqAP5T4M4jnAR
	VD0hUYaWdIvHXpjFgez1AHoBkec3Dl2fL12yEA0pdJUHPJQ7mV08Bcqv0GIWkh3DkFnjlsa5iSV
	DqlR7FU5Cl39Jwo5lm2gA2eJI0vRz+MJl7wUVlvNCaSS6VnWl3MAADDmpuBTAHfXvGvQ/M3Xyn8
	H2B3aUeYuqMNkw5NVbzNVOkaNNIKxWdA97qqalOE2EQyXGYW+r1CU27ArHBeZofkEhzJcMtAUpa
	vvYgAnvLID+KmoTySwUE03UyQZ84/ZwkP0AfQ+zSorSQLqAWmlGTnZ7RG529ykpWPalzWAYIQuz
	asMOlF2i1UrcJXHYBdPulIkLeWWF67J3ALwaGt+abrd+X60gTDB3FaZleTQAoCKtrfkXSvcK2DB
	VEulZ9Y+8LabcLh78BjexycmnGudIal0fvc9w=
X-Received: by 2002:a05:6a00:4194:b0:829:8083:472b with SMTP id d2e1a72fcca58-82dd8a5b935mr2134083b3a.4.1775718591839;
        Thu, 09 Apr 2026 00:09:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 10/22] freerdp3: fix CVE-2026-24680 and CVE-2026-27950
Date: Thu,  9 Apr 2026 19:09:07 +1200
Message-ID: <20260409070919.3968586-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126132

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

There was only SDL2 client until commit[1] created SDL2 and SDL3 clients
from version 3.6.0 onwards.
[1] https://github.com/FreeRDP/FreeRDP/commit/8281186a6d9dad20e8345d85a1732e2974636555

Details:
https://nvd.nist.gov/vuln/detail/CVE-2026-24680
https://nvd.nist.gov/vuln/detail/CVE-2026-27950

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2026-24680_CVE-2026-27950.patch       | 24 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24680_CVE-2026-27950.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24680_CVE-2026-27950.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24680_CVE-2026-27950.patch
new file mode 100644
index 0000000000..85179f74d9
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24680_CVE-2026-27950.patch
@@ -0,0 +1,24 @@
+From a2e077bc8dea8a7d1b16b98f31b6f6fbc00c0c24 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 11:01:17 +0100
+Subject: [PATCH] [client,sdl] reset pointer after memory release
+
+CVE: CVE-2026-24680 CVE-2026-27950
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/c42ecbd183b001e76bfc3614cddfad0034acc758]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ client/SDL/sdl_pointer.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/client/SDL/sdl_pointer.cpp b/client/SDL/sdl_pointer.cpp
+index ad8a4f316..a9203a20b 100644
+--- a/client/SDL/sdl_pointer.cpp
++++ b/client/SDL/sdl_pointer.cpp
+@@ -63,6 +63,7 @@ static BOOL sdl_Pointer_New(rdpContext* context, rdpPointer* pointer)
+ 	        &context->gdi->palette))
+ 	{
+ 		winpr_aligned_free(ptr->data);
++		ptr->data = nullptr;
+ 		return FALSE;
+ 	}
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 031cb4a665..08b1fb25e4 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24675.patch \
            file://CVE-2026-24676.patch \
            file://CVE-2026-24679.patch \
+           file://CVE-2026-24680_CVE-2026-27950.patch \
            "
 
 S = "${WORKDIR}/git"

