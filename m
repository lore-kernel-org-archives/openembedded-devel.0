Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87D7C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41009.1785756066040529493
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DwCwaywF;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so34734235ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 04:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756065; x=1786360865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHHAyIPyRyxZ8em0qKscMbwxMZeuOjRHkviu8V/t7KU=;
        b=DwCwaywFKlZrgL7QWO+/6qkQXndbp7RyWtswxDUM4YEHSIdOX55mOPBV+2wX/LUpTd
         qApXxNsWWI7dJUeKIAOX8D5EHG3lflwSh/FDLSzEZBvt/puLl61vq/v/fI1F90slTUiv
         nCJdY284kB51CkUmIocYNDKy4ytAoTZnSUG++3ZagKp6YUN8nkM6bvvr7eyqXpLl2+D3
         Qdu7NNcqb99KTDCQ7Jf/3XArMgy74WPJhS7rObLTS8S5vwiKWKlGb9xPBwrzbwteqbP9
         wMpiFwKUu/aTbCCfUwbxETMdDxBlsP4PtzhOIpts1H4FOmXc6hXp0eOZjdlMa7XRi5j7
         a41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756065; x=1786360865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHHAyIPyRyxZ8em0qKscMbwxMZeuOjRHkviu8V/t7KU=;
        b=Jn1q07E9ja9tApp3i0HfxPCokOgt48P3ZGkTJQvMt7vuc6cVfShpBwOI51l/vMuYfe
         w6Q5tiDQDntlyslUU2HOZ1w/BSeyvVT0FpeoPoOMY19RhqEyjx89EqEiRCsCZakt1RWO
         cplzFW0IbSFlOo5ZAsDrI3f9uy/tCQy1yAt2km2MYsHrEhucGNltEECGRUmFjCR6MrJi
         EZrjilbbYr04HYFMJlWcCKrB6ysyb2EOcC/LWxW39PY352MYruYnYi7vruZ+SPjsvJ0a
         WwvHuEkHvsdP87CFvl3V045iz2xtFbHdBxvI9hxAROM9DSUTzqKhCpsVavjZkxlIMxwL
         IATg==
X-Gm-Message-State: AOJu0YybGerkXzxP4a6RfjNsTGrs06TpooZuJ1dVC0BXcwWJAWY2x+6I
	kv3lf/8HN9576yo7bcxaGMjiXu1RTJ2dGE7ZGLQl9UdXv5Mci8zM4GsGf4VVwCgD
X-Gm-Gg: AR+sD13EB4+kjmbD1j2noErF/zX5UFvlGuP5w/KFwV1aRs6nosG/3Iu4TQ21RT9GMV/
	Oy5wd6GfPkypKZkyg0+p5Uxh+kbWAVJGlpdcIhgF9O8sXMsaF1kBJDTjy9BAKjy+qEDewcaihNE
	2/KNFQNI4Jf5FoRocLtHF6vvMwZGfMehjEOqqgnv6IvqrLHPnN8LkUO6UF4UOhZ8D4JYkqHKt4Q
	sbfRpouNX0IQbNFQHbsxAzYBLQ3/GrOmbuX0Jw6zVIpakUPH0zupjYbDgwTfnjkG3XQqDZ7VeE1
	gF9VMWgU8YDcPtqfcn1Wm9yOgTB2unr5xR4wnqXgRN3JZvt5U+iMkkH2e7DJkm5+NkTi58nyWAK
	mTxiVTFJRoR/+T9Go5WdLoNWq7AXKv8LLiFwXT5FwGjjQh1vJKqGcACidGlNxKZUvifRUXF2buI
	NbdYS9yfVTgWFELQ1zrdV1Pbo0ngx9Uw2qbTj/OiJ4dqwKHflD1bWwbrBz+td3yf6Gak8HQAcsI
	YZitRNxcB0G
X-Received: by 2002:a17:903:184d:b0:2cc:a853:1311 with SMTP id d9443c01a7336-2d05247edd2mr97321885ad.47.1785756065427;
        Mon, 03 Aug 2026 04:21:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddcba2bsm42463843eec.11.2026.08.03.04.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/6] gtkwave: upgrade 3.3.127 -> 3.3.128
Date: Mon,  3 Aug 2026 23:20:51 +1200
Message-ID: <20260803112055.3926085-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
References: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 11:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128677

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: update md5sum

Changelog:
- Hurd compile fix.
- Update lz4 to 1.10.0.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gtkwave/{gtkwave_3.3.127.bb => gtkwave_3.3.128.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.127.bb => gtkwave_3.3.128.bb} (89%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
similarity index 89%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
index 774a30e1a4..62ffafe08d 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "gtkwave is a viewer for VCD (Value Change Dump) files which are u
 HOMEPAGE = "http://gtkwave.sourceforge.net/"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5b1819073ecce49dec65a690b638c48"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f19da2db43b27bbcc669725843451945a68c3a4ce232562e341d6f63b80b55e4"
+SRC_URI[sha256sum] = "817e197fc1808f8aac3543c2c2f9683cb01368c91192b8eae5af58070ef1d1f8"
 S = "${UNPACKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \

