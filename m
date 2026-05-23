Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDDDCD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:22 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3084.1779512478386716274
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qf4Yr9zt;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-835399c11e0so3691182b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512478; x=1780117278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXdsOPARFWageMbcoLVgnluK4SPfbZw4kGmQi5yaM1I=;
        b=qf4Yr9ztlSyAk4l3MUvUud0CUTL/BLQbSEeb0Xevqob8/guBZHbIr8ujACTFlzBcWK
         DYH6FccXOhmx5EmQgQVQtA6KfsgzFQIY1zulgmyYMWJH8Dr3QTQpRiqAi+9Ok3QeuQqL
         bXAwLjFj/QBQd30IroPB18tC3noZnVvJCTZZGf3w9d50lspS2tIaV7NVIGKIWUXstYgz
         8iDwe9vOPrLhbNNZ+KEuFEL14JZkqBskDJbL1CL3sL1d0nB80bzgXUsWXCs9HxStSlaw
         TJbT72tCMwrcjLrkcstZ4e7PuC4oeqfmKSHCQ31gCg8jP0QfaTfwWxfCHnNM1JOOqgG/
         OFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512478; x=1780117278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXdsOPARFWageMbcoLVgnluK4SPfbZw4kGmQi5yaM1I=;
        b=X/1zG8Wt3tULmuz0FW5gTmh4Gdn66W/Pv3wWuJKBT/KUgj4r+pWpwLuus+O/ikL/HT
         InA4/nkSYpOdGCY7HIdGs12zAkg1szGMJSl+ci6B8QvhBapgwRuWRGcdByq/1arU5KtY
         Inz79++LW9iLmSnIbwEGai7u/ipsCCMBXeioE9bFNIZJa26c17IvE381qUkzj4A8rkK5
         574kcvDWKRuDKPdlfEipHiq+WiPDe5MVIXWmopL7d7Cassdo4P5uurAoeFcxGxmwu3u5
         CAqLj4TZtfnZyaUs6QakYR4ukBtKUV6G+c9T5hBmUc1LwqzM1LJSnlT3vhz0KMeduTC8
         8Z2A==
X-Gm-Message-State: AOJu0YxxzSJtHmeZhwmXFi7wElkEjxkzDA6/tYMrOhbQ42KMbdPt9Dyo
	j35iSfOiFwcsdd/GjdGK77wFBfZ2Lm4FM0PbJM8tJIDohgxNJT+8FoAquovdZljN
X-Gm-Gg: Acq92OFyjVaycx8HkPYf2b+18/8orOzGhYOTwrJVbJcfjvnGh/6rIGgOzfoMrl2E4+S
	hSXlIimJuRZRvhUJ+UfKoIVCAfm41twOUowRZHMudMecpF9aq/TEKejZ0Oj2lAC7IDMJ9MWQNkj
	z4TLXSwxoEu1YMmaj01X0xdiDq3ovUOYPfsdJfDGy+QcGha1zlbW+Yuc9XpzKwGsuGKbxIhbmIW
	5xw5bT+g+xiHWAPv0HQSMgYdbp6FDKdh0w6Dz3ur25aiqpO78+G6fC8J7lu+U6Vh89JO4K2s+UE
	YkwCI0jeaMdsdmK+iLs4i6WC9SLAGRpcYxrIQJbA5KbNd/Fp3fEjj7KE6FKmPL0EUbHlKopA1E1
	95U7r+kpHsTdtVidq0E7jjkVVwwGst0SLGfIkcVKXh/SUsqL0eVgWJjcElyB/IQe+1tgWDe4212
	P0TByV9ZGKwgpK7D9ZriC5/SGVTOmPRWyMgYReulj6vY7Bp70=
X-Received: by 2002:a05:6a00:a8c:b0:82a:190b:2225 with SMTP id d2e1a72fcca58-8415f66dfabmr6489442b3a.31.1779512477695;
        Fri, 22 May 2026 22:01:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 14/25] uriparser: upgrade 1.0.1 -> 1.0.2
Date: Sat, 23 May 2026 17:00:16 +1200
Message-ID: <20260523050028.848327-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127164

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
* Fixed: [CVE-2026-44927]
    Stop truncating 'ptrdiff_t' to 'int'
* Fixed: [CVE-2026-44928]
    Fix 'EqualsUri' with regard to '.absolutePath'
* Fixed: Fix OOM related memory leak in 'CopyUriMm'
* Improved: Simplify internal function 'CompareRange' into 'RangeEquals'
* Improved: Make function 'RangeEquals' use size_t' internally
* Soname: 3:2:2 - see https://verbump.de/ for what these numbers do

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a0589ae5a4442d574aace469fc54265154741f8f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../uriparser/{uriparser_1.0.1.bb => uriparser_1.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.1.bb => uriparser_1.0.2.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
index 987c28744b..d4be4b14c8 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "5a3b7c491a1e9033d86b9c00a947bafc46407187938578daf799a4155cb7c88a"
+SRC_URI[sha256sum] = "963554c32d40fb6cba5644f1ba63e6dd7a182b2948bd71ee448c532f53b07f1e"
 
 inherit cmake github-releases ptest
 

