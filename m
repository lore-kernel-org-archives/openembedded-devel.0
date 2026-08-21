Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6BDC5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:49 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.659.1787286939651726558
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iN9OllWo;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso471067a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286939; x=1787891739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Kmoj3N5EBlJr0DOINDctDnv4R6ObbifaYwgXNxeAo=;
        b=iN9OllWoxt0gE6d3+oqbeL3s9KkCcVBeyE+Mt5uBbuHkYeM7LEvipuOHcS11Jeb+E3
         0RG4ade2b7S7QKs8QUDJhyqsbfdiCr/NavXOUJs2JMJ45xOsWqlnvNwC7RIq+r88l48X
         p1s0OuqORo0AeSCPE4bK5DdaEXtaK79wrfc2m5YZj/w+eom3ULB5124hhFzUd3FiI/no
         oSYT65QU+7Gmi79wL5XN3wd5uvOc2Zk0MiAbzW9ok4Qdo+W7F0AlajJPySUQ/uQVKBMJ
         8L/5aOJZK+428Pmk7pTWzjuRf4R0WdCTobUM00xzkbDUxIvXMhZwhFSNYtZ9pJEKXnX1
         mrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286939; x=1787891739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2Kmoj3N5EBlJr0DOINDctDnv4R6ObbifaYwgXNxeAo=;
        b=FRIgRucIM8f74o/zkhIwUDE6G3AdNrQ9uh+8Rr7nXnCKUmx+Viaxuv3R1cSed83NeA
         QwiykoWFCcABSlyH04GFuMFe+ftVSIlXXJDMubz+G1j/SrLeD0ZF1I5S2FSdut8Demng
         XUJlQOyE7KyOhWgUiRfMTfANe+GXGFYJ8SyNvHfho/JNqee2bliDsEIOYf9ZpSEBK5lT
         j4tJ38OyFnipgj6R6e5a6N0jAQ3aXB2NjVOirbqnqvtMvu4W5N1lWjSqryKNjkpf445y
         ph/BrA69fR/QVp4inUCgvb2G/3N8EoKRvrNWAkBn9UBfdnVjgX1RTaKCQwLApmrZUVif
         7VxA==
X-Gm-Message-State: AFuF++ncyPz4xpaSrK6hdRf6z1h0ssdQ0YtMfzZ7oGCpro9UvuVIoEFa
	PZQDOdvRe/mYSmsvvWUe45GVqIf7T0qES6BrAlcVx20xFRPhokodFsVBFzhiPg==
X-Gm-Gg: AR+sD10svwUMdIBZjBBwNk2Op15dgUHryYvrliv88/2vH9+j+30XHXTTkYuhwLnYD2q
	Oed+cUFQ4KBNEFboBHzWgXe7q4e35ocATJ2xxmsN3cddErQd8PFqfCDjPN2UJvLJYRLwcHU6INw
	81t29w+HTCEeDA9u4LEoouK9LP/xovU4uda0FUjFJ6KCAwrCZQosqu4wBk7v2GbH7zCZKPSzFJf
	xFWxRe1XcadZD7ShxzqLVgicnbczU63Pa9L304JtV37bhJrQGjNDn2FnjNYbSopQPX+8lOLZQPj
	Frv519JIW+j02V0IZUOQ3uwPs3V3/p5SK5VtMLRlT8TRfAHeo7Rrt5nqYdQmSB+bk1f0T24+Ldg
	ztnBiOT5mtCOQdBRJ2Dyhi3oG52Qi2yMv6R8B0D5Hs43csJzX+QsvDyKjMG3EFvYysNGJ1bPRFM
	y075KQb6eeBTjRI7myw7xqdNX40CX5NMCEh94+O/fj4TDjEaDXBLhzW9n83JFtRNiWjEiryq2K4
	s/lC45ijYl2slQM85g=
X-Received: by 2002:a17:90a:da8c:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-395c371c8aamr6938895a91.14.1787286938897;
        Thu, 20 Aug 2026 21:35:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/15] exempi: add UPSTREAM_CHECK variables
Date: Fri, 21 Aug 2026 16:35:12 +1200
Message-ID: <20260821043525.448011-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129398

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version exempi
...
INFO: Current version: 2.6.6
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/exempi/exempi_2.6.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/exempi/exempi_2.6.6.bb b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
index 887863dea0..818c459d4f 100644
--- a/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
+++ b/meta-oe/recipes-support/exempi/exempi_2.6.6.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f816aac8b22d16134477b8e156f0a0f4"
 SRC_URI = "https://libopenraw.freedesktop.org/download/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "900fb9957be2095c78e5111b99c49378adac58161a358f52f93c55126f34eb8f"
 
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/libopenraw/exempi/-/tags"
+UPSTREAM_CHECK_REGEX = "tags/(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools pkgconfig
 
 DEPENDS = "expat zlib"

